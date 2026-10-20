#!/bin/bash
set -euo pipefail
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

SRC_CT=105
DST_CT=129
DOMAIN=headscale.example.com
SRC_DIR=/root/.acme.sh/${DOMAIN}_ecc
DST_DIR=/etc/caddy/certs
TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT

pct pull $SRC_CT $SRC_DIR/fullchain.cer $TMP/fullchain.pem
pct pull $SRC_CT $SRC_DIR/$DOMAIN.key $TMP/key.pem

# the key must match the certificate
CERT_PUB=$(openssl x509 -in $TMP/fullchain.pem -noout -pubkey | sha256sum)
KEY_PUB=$(openssl pkey -in $TMP/key.pem -pubout | sha256sum)
[ "$CERT_PUB" = "$KEY_PUB" ] || { echo "key does not match certificate"; exit 1; }

# do nothing if Caddy already has this certificate
CURRENT=$(pct exec $DST_CT -- sha256sum $DST_DIR/fullchain.pem | cut -d' ' -f1)
NEW=$(sha256sum $TMP/fullchain.pem | cut -d' ' -f1)
[ "$CURRENT" = "$NEW" ] && exit 0

pct push $DST_CT $TMP/fullchain.pem $DST_DIR/fullchain.pem --user caddy --group caddy --perms 0644
pct push $DST_CT $TMP/key.pem $DST_DIR/key.pem --user caddy --group caddy --perms 0600
pct exec $DST_CT -- systemctl reload caddy
logger -t sync-headscale-cert "certificate updated on CT $DST_CT"
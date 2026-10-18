## Roadmap

### Security
- [ ] Review the unexpected open port found in the external scan and fix it
- [ ] Enable a default-deny firewall on the Caddy CT and re-scan from outside
- [ ] Re-scan exposed ports (8443, 9443, 25565, 25566) from an external
      network and compare with the Caddyfile and `ss -tlnp`
- [ ] Install CrowdSec on the Caddy CT
- [ ] Run Lynis on each host and fix the findings
- [ ] Deploy Greenbone (OpenVAS) on a VM and scan internal services
- [ ] Scheduled external port scan (nmap from a remote host), compare
      results with `ndiff` and send an alert through a self-hosted ntfy
      instance when something changes
- [x] Run a first external port scan with nmap

### Network
- [ ] Segment the network with VLANs (needs a VLAN-capable router/firewall
      and a managed switch)
- [ ] Second Pi-hole + Unbound on another node for DNS redundancy
- [ ] Document the subnet mask and DHCP settings
- [x] Switch Pi-hole to an Unbound-only upstream
- [x] Document the exposed ports in the network summary

### Services
- [ ] Fix SearXNG (CT 100 on Keiko)
- [ ] Define a role for the Nautilus node (currently no guests)
- [ ] Define and document a backup strategy for every guest
- [x] Remove the duplicate Prometheus/Grafana stack from Keiko
- [ ] Analyze if the Jellyfin service should be transfered to the NAS (because of the GPU)

### Storage
- [ ] Fix the NAS HDD pool not coming back after a NAS reboot
  - [ ] Find out whether the pool is not assembled/mounted on the NAS,
        or Proxmox just fails to reconnect to it
  - [ ] Write a runbook with the symptoms, the cause and the manual fix
  - [ ] Make the recovery automatic (or at least add an alert)
- [ ] Replace the failing disk (bad sectors on /dev/sda) in vg_media
  - [ ] Back up the data that cannot be recovered
  - [ ] Replace the disk
  - [ ] Replace the linear LVM layout with a redundant one (mirror/RAID/ZFS)
  - [ ] Use powered enclosures or a powered USB hub for the external HDDs
  - [ ] Add SMART monitoring with alerts

### Hardware
- [ ] Fill in the hardware details for each node
- [ ] Automate maintenance logging with NFC tags (timestamp + which
      equipment was serviced)
  - [ ] Choose where the records are stored (self-hosted)
  - [ ] Assign one tag per piece of equipment
  - [ ] Link the log to the inventory

### Documentation
- [ ] Draw the architecture diagram
- [ ] Write service pages (Caddy, Headscale, Pi-hole + Unbound)
- [ ] Add a "Security checks" section with dates and results
- [x] Create the documentation repository and the initial inventory
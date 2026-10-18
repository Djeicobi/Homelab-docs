# Homelab Inventory
 
Last updated: 2026-10-18
 
## Proxmox nodes
 
| Node | Hardware (CPU / RAM / disks) | Guests | Notes |
|------|------------------------------|--------|-------|
| Keiko | i3-8100T, 12gb ddr4, 128gb NVME | 1 | |
| Migaloo | i5-12500T, 32gb ddr5, 240gb SSD | 6 | Network |
| Mobydick | i5-12500T, 32gb ddr5, 512gb NVME | 14 | Media stack |
| Nautilus | i7-4510U, 16gb ddr3, 480gb SSD | 0 | No guests yet |
 
## Guests (VMs and containers)
 
| Name | Type | ID | Node | IP | Role | Backup | Docs |
|------|------|----|------|----|------|--------|------|
| searxng | CT | 100 | Keiko | 192.168.2.164 | Private metasearch engine | | |
| headscale | CT | 105 | Migaloo | 192.168.2.197 | Self-hosted VPN control server | | |
| pihole | CT | 119 | Migaloo | 192.168.2.244 | DNS and ad blocking | | |
| trilium | CT | 126 | Migaloo | 192.168.2.104 | Note-taking | | |
| caddy | CT | 129 | Migaloo | 192.168.2.176 | Reverse proxy (DMZ) | | |
| excalidash | CT | 139 | Migaloo | 192.168.2.132 | Excalidraw dashboard (diagrams) | | |
| SysAdminVM | VM | 106 | Migaloo | 192.168.2.158 | Sysadmin practice / lab VM | | |
| jellyfin | CT | 101 | Mobydick | 192.168.2.186 | Media server | | |
| prometheus | CT | 102 | Mobydick | 192.168.2.142 | Metrics collection | | |
| grafana | CT | 103 | Mobydick | 192.168.2.147 | Dashboards | | |
| prometheus-pve-exporter | CT | 104 | Mobydick | 192.168.2.156 | Exports Proxmox metrics to Prometheus | | |
| radarr | CT | 108 | Mobydick | 192.168.2.187 | Movie management | | |
| sonarr | CT | 109 | Mobydick | 192.168.2.188 | TV series management | | |
| lidarr | CT | 110 | Mobydick | 192.168.2.189 | Music management | | |
| prowlarr | CT | 111 | Mobydick |192.168.2.190 | Indexer manager | | |
| transmission | CT | 112 | Mobydick | 192.168.2.191 | Torrent client | | |
| seerr | CT | 113 | Mobydick | 192.168.2.192 | Media request portal | | |
| bazarr | CT | 114 | Mobydick | 192.168.2.193 | Subtitle management | | |
| byparr | CT | 116 | Mobydick | 192.168.2.198| Captcha/Cloudflare solver for indexers | | |
| wizarr | CT | 120 | Mobydick | 192.168.2.157 | Invitation manager for Jellyfin | | |
| Pelican | VM | 107 | Mobydick | 192.168.2.194 | Game server panel (Minecraft) | | |
 
## Storage (same on every node)
 
| Storage | Description |
|---------|-------------|
| local | Default Proxmox directory storage (ISOs, templates, backups) |
| local-lvm | Default LVM-thin storage for VM/CT disks |
| NVME | NVMe storage |
| SeaNAS | Shared storage from the NAS (ZimaOS, 192.168.2.250) |
 
## Other devices
 
| Name | Role | IP | Notes |
|------|------|----|-------|
| ZimaOS NAS | NFS storage, local AI (Ollama + OpenWebUI) | 192.168.2.250 | GTX 1060 6GB |
 
## Network summary

- **Router:** ISP-provided Huawei HG8145V5 (192.168.2.1)
- **Switch:** Horaco 2.5GbE Managed Switch (192.168.2.2)
- **Subnet:** 192.168.2.0/24, single flat network, no VLANs yet
- **DNS:** clients → Pi-hole (192.168.2.244) → Unbound (recursive, DNSSEC, 127.0.0.1#5335) *Chose Unbound-only upstream for privacy and DNSSEC validation, accepting the single point of failure.*
- **Remote access (VPN):** Headscale
- **Exposed ports:** 8443, 9443 (headscale); 25565, 25566 (games);

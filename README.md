# Homelab-docs
My own homelab documentation used to train my skills and start a career on SysAdmin, while fulfilling real needs for me, my family and friends
 
## Quick links
 
| Section | What you will find |
|---------|--------------------|
| [Inventory](inventory.md) | Every node, VM, container and storage, with roles and IDs |
| [Roadmap](roadmap.md) | What is done and what is planned, by category |
| [Network](network/) | DNS, reverse proxy, VPN, exposed ports |
| [Hosts](hosts/) | Physical machines: Proxmox nodes and the NAS |
| [Services](services/) | One page per self-hosted service |
| [Runbooks](runbooks/) | Incident reports and "if X breaks, do Y" guides |
| [Diagrams](diagrams/) | Architecture and network diagrams |
 
## At a glance
 
- **Virtualization:** 4-node Proxmox cluster (Keiko, Migaloo, Mobydick, Nautilus)
- **Storage:** ZimaOS NAS shared with the cluster
- **DNS:** Pi-hole with Unbound as the only upstream (recursive resolver with DNSSEC)
- **Remote access:** self-hosted Headscale VPN
- **Reverse proxy:** Caddy
- **Media stack:** Jellyfin and the *arr suite
- **Local AI:** Ollama, llama.cpp  OpenWebUI
- **Monitoring:** Prometheus and Grafana
- **Game servers:** Pelican (Minecraft, CS2, Project Zomboid)
## Documentation status
 
| Area | Status |
|------|--------|
| Inventory | Available |
| Roadmap | Available |
| Network | In progress |
| Hosts | In progress |
| Services | In progress |
| Runbooks | In progress |
| Diagrams | Planned |

## About
 
I am studying for the LPIC-1 certification and building this homelab as hands-on practice. The goal is to document what I build, the problems I run into and how I solve them.

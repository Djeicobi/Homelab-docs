# Incident: bad sectors on the Jellyfin storage (vg_media)

**Status:** open | resolved
**Date detected:** YYYY-MM-DD
**Affected:** Jellyfin (CT 101 on Mobydick)

## Summary
(2-3 sentences: what failed and what the impact was.)

## Setup
- Volume group `vg_media`: linear LVM (no redundancy) across two
  USB-connected HDDs
- Disk power: bus-powered (no external power supply)

## Symptoms
(What you saw: I/O errors, slow playback, missing media...)

## Diagnosis
- `smartctl -a /dev/sda`  → result:
- `dmesg | grep -i sda`   → result:
- `pvs`, `vgs`, `lvs`     → result:

## Root cause
(Confirmed or suspected, and why.)

## Fix / mitigation
(What you did, or what is planned.)

## Prevention
- Redundancy (mirror/RAID/ZFS)
- Powered enclosures
- SMART monitoring and alerts

## Lessons learned
(What you would do differently from the start.)
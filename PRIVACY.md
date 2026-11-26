# Privacy

NEXUS Monitor is built so that **nothing leaves your PC**. There are no accounts, ads, telemetry, usage statistics or NEXUS servers.

## What stays on the PC

Everything NEXUS saves is in `Documents\NEXUS Monitor` (settings, 24 h history, game sessions, profiles, optimisation backups, inventory). You can delete that folder at any time.

The dashboard runs on a small local server (`localhost:8765`). It is only visible on your home network if you turn on **Phone access**. In that case:
- a code is required, stored in a cookie after you scan the QR code;
- actions that change the PC only work on the PC itself;
- phone control must be accepted on the PC, once per phone;
- the read-only link can't change anything.

## Internet connections

| When | Where | Why |
|---|---|---|
| During install | GitHub (LibreHardwareMonitor, PawnIO, PresentMon, gdu) | Download the components that read sensors and FPS. PresentMon and gdu are optional. |
| On start and every hour (can be turned off) | `raw.githubusercontent.com` (this repository) | Check for a new version. Only `versao.json` is read; nothing about you or your PC is sent. |
| Only when you press INSTALL | GitHub (this repository) | Download the update. Its SHA-256 is checked before installing. |
| Only when you press TEST | Cloudflare (`speed.cloudflare.com`) | Speed test and lag-under-load test. |
| Only if you turn on continuous ping | Your router (or the address you choose) | Measure ping. |
| Only when you press TEST DNS | Cloudflare, Google, Quad9 and other public DNS servers | Find out which answers fastest. |
| Only if you turn on notifications | `ntfy.sh` (or the server you choose) | Send alerts to your phone. The topic is random. |
| Only if you turn on Discord | The Discord app on your PC (local connection) | Show your game and FPS on your Discord profile. |
| **Only if you turn on the game route** (2.4) | Cloudflare (`downloads.cloudflareclient.com` to install WARP, then Cloudflare's WARP network) | Your **game's traffic** to its server goes through Cloudflare when that is faster. Only that server; the rest of your internet does not. Off by default, asks for consent first and shows **"🌐 CLOUDFLARE ROUTE ACTIVE"** in the dashboard and overlay while it's on. |

The 2.3 tools that show which programs use the internet, Wi-Fi, security, inventory and others only read what Windows already knows. **None of it is sent anywhere.** The "My PC" image is made on the PC and includes no serial numbers.

## The optional game route (Cloudflare)

This is the only NEXUS feature that sends your traffic through someone else. It is off by default and you must accept a window that explains it before anything happens. NEXUS then installs Cloudflare WARP (free, from Cloudflare's official site, checking that the file is signed by Cloudflare) and accepts its [terms](https://www.cloudflare.com/application/terms/) on your behalf. In each game it measures both routes and only uses Cloudflare's when it wins, for that game's server only. It turns off when the game closes or NEXUS closes. Cloudflare's privacy policy: [cloudflare.com/privacypolicy](https://www.cloudflare.com/privacypolicy/). You can turn it off and uninstall WARP from the same card at any time.

## Safe updates

`versao.json` holds the SHA-256 of each zip. NEXUS only installs when the downloaded file has exactly that SHA-256. The update is done by the `ATUALIZAR NEXUS.bat` inside the zip, which you can read before running it.

# Version history

Every version is in [`versoes/`](versoes). NEXUS shows these notes in the WHAT'S NEW window.

## v2.3
[⬇ full zip](versoes/v2.3/NEXUS-Monitor-v2.3.zip?raw=1) · [update](versoes/v2.3/NEXUS-Monitor-v2.3-update.zip?raw=1)

- DEEP SCAN organised in tabs: 🔍 Analyse (the map and folders), 🧹 Clean, ❤ Health and 📦 Programs. Everything about drives is there: SSD life (TB written and daily rate), optimise drives (TRIM/defrag), hidden space, save the SSD, Steam space and forgotten programs.
- PERFORMANCE reorganised: Hardware only has the parts, System has Windows and drivers, and a new 🩺 PROBLEMS tab gathers everything for when something goes wrong (first aid, crashes, tests, repair, slow boot, PC that won't sleep, support zip).
- NVIDIA App: one button turns off the app, overlay, startup, service and its tasks (driver and Control Panel stay). "Keep it off" turns it off again every time NEXUS opens.
- Games: stutters counted per session with the worst minutes, loading time per drive, close programs while gaming and reopen them after, active overlays and launch games from your phone.
- Hardware: power supply (enough or not, with peak alert), what limits boost, upgrade simulator, inventory with serial numbers and warranties, peripheral batteries and old graphics drivers.
- Optimise: right-click menu (hide entries and Windows 11 classic menu), hidden scheduled tasks and more unneeded services.
- Network: network priority for the game, lag test with a full network (bufferbloat), who is using the internet, Wi-Fi (signal and channel) and sharing: read-only link and copy settings from another PC at home.
- System: Windows security, Windows version and how long it's supported, latest updates (uninstall one), default apps (alert if they change) and new alerts.
- Home: my PC (shareable image) and before/after changing parts.
- New alerts: fan stopped, hot PC while idle, PSU at its limit, low battery and default apps changed.
- Stream Deck: music keys (with the cover of what's playing), next, previous and volume.
- Dashboard in a window: full screen on the 2nd monitor or small on top of the game (Alt+Shift+N). Colours from your wallpaper.
- More tools: screen time, click latency, GPU thermal paste (core vs hotspot), RAM test, Steam space, what keeps the PC awake, first aid and an anonymous support zip.
- A graph of each game session, FPS per euro in the upgrade simulator, old graphics driver warning, uninstall old drivers (System) and forgotten programs (Deep Scan → Programs).
- Processes: click the name to see what it is and whether it is safe to close. At the top of the dashboard, the PC status in one sentence.
- Deep Scan: drive warnings now say why and what to do. Optimise: each category shows the estimated gain. Dashboard in a window with Edge, Chrome, Brave or Vivaldi.
- 🧒 SIMPLE button in Performance: very simple explanations on every card.
- Fixed: the Stream Deck plugin no longer closes because of a duplicated translation, and the installer deletes the old plugin before compiling.
- Fixed in the installer: the folder picker no longer opens hidden behind the console (and if it does not open, it asks for a typed path); the chosen folder is no longer lost when the administrator is another Windows account.

## v2.2.2
[⬇ full zip](versoes/v2.2.2/NEXUS-Monitor-v2.2.2.zip?raw=1) · [update](versoes/v2.2.2/NEXUS-Monitor-v2.2.2-update.zip?raw=1)

- Fixed: the Stream Deck plugin closed right after starting since 2.1 (Stream Deck then disabled it).
- Checks for updates every time NEXUS opens and every hour (if the GitHub connection is on).

## v2.2.1
[⬇ full zip](versoes/v2.2.1/NEXUS-Monitor-v2.2.1.zip?raw=1) · [update](versoes/v2.2.1/NEXUS-Monitor-v2.2.1-update.zip?raw=1)

- Fans: curves by CPU or GPU temperature, or a fixed speed (Full mode).
- FPS thieves: when FPS drops, NEXUS sees which programs were using the processor.
- In-game ping (latency, jitter and loss) and the fastest DNS in one click.
- Weekly or daily automatic cleanup, never during a game.
- BIOS and old drivers, with the official pages.
- Streaming mode (Alt+Shift+P): hides IPs, PC name and folders.
- Your PC compared with others and expected FPS.
- Phone notifications (ntfy app), even away from home.
- Overlay with font, colors, border, ping and frametime graph.
- Setup assistant and Wake-on-LAN to turn the PC on remotely.
- Performance organized in tabs (Home, Games, Optimize, Hardware, Network, System) with explanations behind the ⓘ.
- One-click scenarios (Quiet, Normal, Maximum and your own), do not disturb in games and automatic FPS limit.
- Graphics card stability test, checks (monitor Hz, XMP, PCIe), battery and monitor test.
- Crashes explained, repair Windows (SFC/DISM), startup time and programs as administrator.
- Disk speed and duplicate files in Deep Scan; SSD wear from SMART.
- Notify, sleep or shut down when a download finishes, other PCs at home and share results as an image.

## v2.1
[⬇ full zip](versoes/v2.1/NEXUS-Monitor-v2.1.zip?raw=1) · [update](versoes/v2.1/NEXUS-Monitor-v2.1-update.zip?raw=1)

- Updates from GitHub: NEXUS tells you when there's a new version and installs it with one button, with no Windows prompt. You can turn it off in Options.
- Temperature and usage history: last hours or 7 days, on the main page.
- Summary of every game session: time, average FPS, worst 1% and peak temperatures.
- Disk health (SMART) in Deep Scan and graphics driver version in Performance.
- Power saving when idle, settings backup, search in options and PC report.
- CPU or GPU bottleneck and overlay warnings (temperature, full RAM, FPS drops).
- Per-game FPS limit (with RivaTuner) and NVIDIA card power limit.
- Windows startup: turn programs that open with the PC on and off.
- Processor and RAM stability test, with max temperature and errors.
- Phone: home screen icon and PC control (music, volume, overlay, sleep, shut down).
- Stream Deck: new keys (overlay, measure FPS, clean RAM, boost, bottleneck, play time).
- Discord status with the game and FPS (optional).

## v2.0
[⬇ full zip](versoes/v2.0/NEXUS-Monitor-v2.0.zip?raw=1) · [update](versoes/v2.0/NEXUS-Monitor-v2.0-update.zip?raw=1)

- Per-game profiles: choose overlay, boost and optimizations for each game; they turn on by themselves when the game opens and go back when it closes.
- Measure FPS for real: records every frame and compares before and after optimizations (Alt+Shift+M in game).
- Smaller updates: the update zip only contains the files that changed.
- Updates for users up to 2 versions behind (the update zip works for 1.8 and 1.9).

## v1.9
- Performance page: more than 50 Windows gaming optimizations (power, games, system, network), adapted to your PC (laptop or desktop, Intel or AMD, NVIDIA, AMD or Intel), with the estimated gain and a choice of what to apply. Everything can be restored.
- Windows debloat: privacy, ads, Copilot, Recall and the apps that come with Windows.
- In-game overlay with FPS, CPU, GPU, temperatures and RAM: choose what shows and drag it anywhere. Shortcut Alt+Shift+O.
- Game boost: high priority, maximum performance and clean RAM only while you play.
- Simple mode: just the essentials, no IPs or technical details.
- The controller tester moved into the Performance page.
- Options organized in tabs, with theme and language inside.

## v1.8
- Speed test in the NETWORK card: download, upload and latency (idle and under load), with the nearest Cloudflare server. Only runs when you press it.
- srgb
- SignalRGB colours: the theme follows the effect in real time on the pages, the tray menu and the Stream Deck, with adjustable delay. The plugin stays on this PC only.
- SignalRGB colours: the theme follows the effect in real time on the pages and the tray menu, with adjustable delay. The plugin stays on this PC only.
- Program uninstaller in Deep Scan: several at once, silent mode, forced removal and leftover cleanup (folders, shortcuts, registry, services, tasks and firewall), with a registry backup.
- What's new button and guided tutorial (you can watch it again in Options).
- Cleaner main page: disks now live only in Deep Scan and all sensors are visible, in two columns.

## v1.7.1
- Installer: choosing another folder works again and you can type the path by hand.
- The updater finds the NEXUS install folder by itself again.
- Options > Folders: buttons to open the settings folder and the NEXUS folder.

## v1.7
- Proper installation: you choose the folder and shortcuts, and NEXUS shows up in Settings > Apps.
- Controller test page, with vibration on Xbox, DualShock 4 and DualSense controllers.
- Deep Scan: the Recycle Bin and old Windows logs are now part of the cleanup.
- Smoother graphs and NEXUS's own alerts on top of games.

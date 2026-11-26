# Version history

Every version is in [`versoes/`](versoes). NEXUS shows these notes in the WHAT'S NEW window.

## v2.5
[⬇ full zip](versoes/v2.5/NEXUS-Monitor-v2.5.zip?raw=1) · [update](versoes/v2.5/NEXUS-Monitor-v2.5-update.zip?raw=1)

- NEW CONTROLS TAB (Performance): Razer and Logitech mice, keyboards and headsets without Synapse or G HUB. DPI, DPI stages, polling rate (up to 8000 Hz), battery, sleep time, MX wheel, F keys and "hear my voice". Only what your device has is shown, with a drawing that looks like it.
- DPI and polling rate per game: they change by themselves when the game opens and go back when it closes.
- Macros: record keys and clicks and replay them once, several times, while held or on/off.
- Your own shortcuts, also with mouse side buttons and only in one game or only on one keyboard/mouse: macro, rapid click (turbo), next/previous DPI, precision DPI, microphone, music, small panel, measure FPS, open a program, type a text.
- In anti-cheat games, macros and turbo stay off (they could get you banned) unless you allow them.
- Headset and microphone of any brand: choose the device, volume and mute.
- Equalizer for all PC sound, set up by NEXUS in one click (no windows, extra programs or restart): simple 10-band or advanced mode with filters, drawn curve, presets and, for over 60 known headsets, a sound correction made for them (AutoEq).
- Tests: real mouse rate, double click (failing buttons) and keys (on-screen keyboard).
- Low battery warning for mouse, keyboard and headset.
- HyperX Cloud III Wireless headset battery (found by NEXUS, no NGENUITY needed).
- Game mode and Snap Tap: hides the Windows key, Alt+Tab and Alt+F4 while you play (and turns on Razer keyboards' game mode); Snap Tap on any keyboard (turns itself off in CS2).
- Razer Viper Ultimate battery (the receiver only answered the long request).
- Battery of SteelSeries (Arctis and Nova), Corsair (Void, HS) and HyperX (Cloud Alpha, Cloud II, Cloud Flight) headsets. Discover mode: teach NEXUS a device it does not know.
- Wallpaper colours fixed: uses the image's real colours and no longer reverts to the previous theme on reload.
- Sleeping wireless mouse: NEXUS shows "asleep" and keeps the last values instead of an error.
- Stream Deck: new Battery key; PC stat shows every sensor again.
- Stream Deck: device battery, DPI (press to change stage), microphone and one key per macro.
- PC status warnings (e.g. a disk that may fail) can be ignored: disk ones until they change, others for 1 hour.
- Keys and buttons: click a key on the drawn keyboard (or a mouse button) to swap it, turn it off, add turbo, a macro, DPI, music…
- History: the chart shows the whole chosen period and the scale adapts to the values (lines are no longer flattened).
- Fixed: Alt+Shift+N and Alt+Shift+M also toggled the overlay.

## v2.4.3
[⬇ full zip](versoes/v2.4.3/NEXUS-Monitor-v2.4.3.zip?raw=1) · [update](versoes/v2.4.3/NEXUS-Monitor-v2.4.3-update.zip?raw=1)

- The game route is safer: if you close the game while it is still turning on, it still turns off, and a test never turns off a route a game is using.
- Performance and Deep Scan: cards that could stay blank when Windows returned no data (screen time, click delay, RAM test, what keeps the PC awake, cleanup, disk speed).
- 2nd monitor and small panels no longer show the new-version notice.
- Classic and Blocks styles: core temperatures no longer spill out of the card on phones.
- Missing translations.

## v2.4.2
[⬇ full zip](versoes/v2.4.2/NEXUS-Monitor-v2.4.2.zip?raw=1) · [update](versoes/v2.4.2/NEXUS-Monitor-v2.4.2-update.zip?raw=1)

- Fixed: the small panel looked squashed (narrow cards with no values).
- The 2nd monitor panel and the small panel close with Esc or the ✕ in the corner.

## v2.4.1
[⬇ full zip](versoes/v2.4.1/NEXUS-Monitor-v2.4.1.zip?raw=1) · [update](versoes/v2.4.1/NEXUS-Monitor-v2.4.1-update.zip?raw=1)

- Fixed: the 2nd MONITOR button (and SMALL PANEL) opened a page showing "404" instead of the panel.

## v2.4
[⬇ full zip](versoes/v2.4/NEXUS-Monitor-v2.4.zip?raw=1) · [update](versoes/v2.4/NEXUS-Monitor-v2.4-update.zip?raw=1)

- NEW THEMES: 17 colour schemes (Vampire, Nordic, Ocean, Sakura, Old paper, Classic 98, High contrast...) and 7 styles that change the look of every page: Neon, Simple, Old terminal, Classic, Glass, Blocks and Elegant. One-click ready-made looks and font, corner, background, size and animation tweaks (Options → Appearance).
- MY THEMES: save your look with a name and share it as a file. Whoever imports it gets the same look. Nothing goes to the internet.
- The game route never changes mid-match (that would disconnect you from the server): it turns on as soon as you open the game, for the servers it has used before.
- GAME ROUTE (optional, like ExitLag): in Performance → Network, one button sets it all up. NEXUS installs Cloudflare WARP, finds each game's server, measures both routes and only uses Cloudflare's when it's faster, for that game only. It asks for permission first and shows "CLOUDFLARE ROUTE" at the top and in the overlay while active.
- WHERE IS THE LAG?: traces the path to the game server and tells you whether the delay is at home, at your ISP or due to distance.
- Stream Deck with separate actions: PC stat, Music, NEXUS buttons and Open game (opens a game with one key). New buttons: Deep Scan and Cloudflare route.
- PC startup: each program that slowed startup shows once (with its worst delay) and has buttons to remove it from startup or uninstall it. Windows parts are marked.
- Cards that don't apply to your PC no longer show: thermal paste without a hotspot sensor, Wi-Fi when you're on cable, NVIDIA App when it isn't installed, GPU control on non-NVIDIA cards, Steam space without Steam.

## v2.3.1
[⬇ full zip](versoes/v2.3.1/NEXUS-Monitor-v2.3.1.zip?raw=1) · [update](versoes/v2.3.1/NEXUS-Monitor-v2.3.1-update.zip?raw=1)

- Uninstall from inside NEXUS: in OPTIONS → GENERAL → UNINSTALL and in the menu of the icon next to the clock. It opens the uninstaller, which shows what will be removed and asks before deleting.
- NEXUS files now have English names: INSTALL NEXUS.bat, UPDATE NEXUS.bat, UNINSTALL NEXUS.bat and INSTALL STREAM DECK ADDON.bat. The Portuguese text is in README.pt.txt and CHANGELOG.pt.txt.
- The installer, updater and uninstaller speak your Windows language (Portuguese, English, Spanish, French or German), including the answer keys.
- Fixed: updating didn't rebuild the Stream Deck plugin when it couldn't find the app (the new music keys didn't show up). It now rebuilds whenever the plugin is installed.

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

# NEXUS Monitor — Questions and answers

[Português](FAQ.pt.md) · [Back to README](README.md)

**Contents:** [General](#general) · [Install, update and uninstall](#install-update-and-uninstall) · [Privacy and security](#privacy-and-security) · [Sensors and monitoring](#sensors-and-monitoring) · [Games and FPS](#games-and-fps) · [Optimisations](#optimisations) · [Drives (Deep Scan)](#drives-deep-scan) · [Phone and network](#phone-and-network) · [Stream Deck](#stream-deck) · [When something goes wrong](#when-something-goes-wrong) · [Contributing](#contributing)

---

## General

**What is NEXUS Monitor?**
A Windows app that shows everything happening on your PC in real time (processor, RAM, graphics card, temperatures, fans, power, drives, network, processes and game FPS) on a page in your browser. It also optimises Windows for gaming, analyses your drives, has an in-game overlay, a Stream Deck plugin and phone access on your home network.

**Is it free?**
Yes. It's open source under the [MIT license](LICENSE): you can use, copy, change and share it.

**Which Windows versions does it support?**
Windows 10 and 11, 64-bit.

**Which languages?**
Portuguese, English, Spanish, French and German. The app follows the language you pick in Options, and the installer, updater and uninstaller follow your Windows language.

**Does it work with AMD and Intel, not just NVIDIA?**
Monitoring works with AMD, Intel and NVIDIA processors and graphics cards. A few controls are NVIDIA-only (for example the graphics card power limit and the NVIDIA App switch) and say so on their card.

**Does it slow my PC or games down?**
It's built to be light. The **NEXUS RESOURCES** card on the dashboard shows exactly how much CPU, RAM and disk it uses at any moment. Heavier tools (Deep Scan, speed test, stability test) only run when you press their button.

**Why a browser page instead of a normal window?**
A page looks the same on the PC and on your phone, can be opened on a second monitor, and doesn't need extra runtimes. You can also open it in its own window (Options → General → Dashboard in a window) with Edge, Chrome, Brave or Vivaldi.

**Can I change the look?**
Yes, in Options → Appearance: 25 colour schemes, 7 styles (Neon, Simple, Old terminal, Classic, Glass, Blocks, Elegant), ready-made looks and font, corner, background and size tweaks. You can save your own themes and share them as a file.

## Install, update and uninstall

**How do I install it?**
Download the zip, right-click → **Extract All…**, open the folder and run **`INSTALL NEXUS.bat`**. Pick the folder, the optional extras and accept the administrator prompt. Full steps in the [README](README.md#install).

**Why does it need administrator rights?**
In **Complete** mode NEXUS reads temperatures, fans and power (this needs a hardware driver) and applies Windows optimisations, which need administrator. It starts with Windows already elevated, so you accept the prompt once. **Normal** mode doesn't need administrator, but shows fewer sensors.

**Why is it a .bat and not a normal installer?**
So nothing is hidden: the zip carries the source code (`codigo` folder) and the installer compiles it on your PC with the C# compiler that ships with Windows. You can read every line of what runs.

**What does the installer download?**
LibreHardwareMonitor (sensors) and, if you choose them, PresentMon (game FPS), gdu (Deep Scan engine) and the PawnIO driver (hardware access). All open source, downloaded from their official sources.

**How do I update?**
NEXUS checks for new versions when it opens and every hour, shows what changes and installs it with one button (it checks the download's SHA-256 first). By hand: run `UPDATE NEXUS.bat` from the small update zip (works if you're up to 2 versions behind) or use the full zip.

**Can I turn off the update check?**
Yes: Options → General. NEXUS then never contacts GitHub on its own.

**Are my settings kept when I update or reinstall?**
Yes. Settings live in `Documents\NEXUS Monitor`, separate from the program folder.

**How do I uninstall?**
In NEXUS: **Options → General → Uninstall**, or right-click the icon next to the clock → **Uninstall NEXUS…**. Also in Windows Settings → Apps, or `UNINSTALL NEXUS.bat` in the NEXUS folder. It shows what will be removed and asks before deleting; you can keep your settings for a future reinstall. If you want Windows exactly as before, press **RESTORE** on the Performance page first.

**Can I move it to another drive?**
Yes: run the installer again and choose the new folder. The old copy is deleted and your settings stay.

## Privacy and security

**Does NEXUS send my data anywhere?**
No. There are no accounts, ads, telemetry or NEXUS servers. Everything stays on your PC. The only connections are the ones you ask for (speed test, phone notifications through ntfy, game launch) and the update check against this repository, which you can turn off. Details in [PRIVACY.md](PRIVACY.md).

**My antivirus flags it. Is it safe?**
New programs without a paid signature are sometimes flagged by automatic analysis. NEXUS is compiled on your PC from the source in the zip, so you can check it. If it happens, report it to your antivirus as a false positive and tell us in an [issue](../../issues).

**Can I get banned in online games?**
NEXUS doesn't touch games: it doesn't read or change game memory or files and doesn't inject anything. FPS come from Windows' own event tracing (PresentMon), the same system Microsoft and Intel tools use. The overlay is a separate window on top. Some kernel anti-cheats can be strict with hardware-monitoring drivers; if a game ever complains, switch NEXUS to **Normal** mode (Options → General), which doesn't load the driver.

**Who can open the dashboard from another device?**
Only devices you accept on the PC. Phone access is off until you turn it on, uses a secret key (QR code) and works on your home network. You can create a new key at any time, which disconnects every phone. There is also a read-only link for showing your PC to someone.

## Sensors and monitoring

**No temperatures or fans show up.**
Check that NEXUS is in **Complete** mode and running as administrator (Options → General). Some motherboards don't expose certain fans, and some laptops hide them completely.

**A fan shows 0 RPM.**
Fans that stop at low temperature (0 RPM mode) are hidden when they're at 0. If a fan that was spinning stops, NEXUS warns you (Alerts).

**Can NEXUS control my fans?**
On motherboards that allow it, yes (Complete mode): Performance → Hardware → Fans, with curves and protection for water-cooling pumps.

**Where is the history stored and for how long?**
On your PC, in `Documents\NEXUS Monitor`. The dashboard keeps recent history and game sessions; screen time keeps 30 days.

## Games and FPS

**FPS don't show up.**
FPS need PresentMon (optional in the installer; you can add it later by running the installer again). Some games with very strict anti-cheats block event tracing; then FPS aren't available for that game.

**What is 1% low?**
The FPS of the slowest 1% of frames. It shows stutters better than the average.

**What's the difference between a stutter and low FPS?**
Low FPS is the whole game being slow. A stutter is a single frame that takes much longer than the others; you feel it as a hitch even with high FPS. Games → Stutters counts them per session and shows the worst minutes.

**How do I compare before and after a change?**
Games → Measure FPS: take a measurement named "before", change something, then one named "after". Home → Before and after changing parts does the same for hardware upgrades.

**Can I launch games from my phone?**
Yes, with PC control turned on: Games → Launch games from the phone (Steam games and games you've already played).

**What is the game route? It sounds like ExitLag.**
It's similar and free: in Performance → Network, NEXUS can send a game's traffic through Cloudflare's network (Cloudflare WARP) when that lowers your ping. It's off until you turn it on, asks for permission first, and only the game's traffic goes through it.

**Can the route disconnect me from the server?**
No. The route never changes mid-match. When Cloudflare is faster, it turns on as soon as you open the game next time, before you join a server, and turns off when you close it. Tests during a game don't touch the game's connection.

**Does the route break the "nothing leaves the PC" rule?**
It's the only exception and it's optional: it only works after you allow it, and that game's traffic goes through Cloudflare. The privacy policy explains everything. You can revoke permission and uninstall WARP from the same card.

## Optimisations

**Can the optimisations break Windows?**
Each one shows its risk and estimated gain. NEXUS saves the original value before changing anything and **RESTORE** puts it back exactly. A Windows restore point is created before applying (at most one per day).

**Which ones should I apply?**
The ones marked **RECOMMENDED** come pre-selected and are safe for your PC. Each category shows how much estimated gain is already active and how much is left.

**What does the NVIDIA App switch do?**
It turns off the NVIDIA App, its overlay, startup entries, background service and tasks. The driver and the NVIDIA Control Panel stay. "Keep it off" turns it off again whenever NEXUS starts. Everything is reversible.

**Does NEXUS overclock?**
No. It can lower or raise the graphics card power limit within NVIDIA's allowed range, set FPS limits and switch power plans, but it doesn't change clocks or voltages.

## Drives (Deep Scan)

**What's in Deep Scan?**
Four tabs: **Analyse** (map of a drive or folder, file types, folder contents and biggest files), **Clean** (quick cleanup, duplicates, Steam space, hidden space), **Health** (SMART health with the reason for warnings, SSD life, optimise, speed, save the SSD) and **Programs** (uninstall programs with their leftovers, forgotten programs).

**A drive shows a warning. What do I do?**
Back up what matters first. Deep Scan → Health explains the reason (predicted failure, remapped or pending sectors, cable errors…) and what to do. "Predicted failure" or pending sectors mean the drive should be replaced.

**Is the cleanup safe?**
It only deletes things Windows and programs recreate (caches, temporary files, old logs). Duplicates and uninstall leftovers go to the Recycle Bin, and registry entries are backed up before being deleted.

## Phone and network

**How do I open NEXUS on my phone?**
Options → Phone: turn on access and scan the QR code with a phone on the same network. Then accept the phone on the PC. You can add it to your home screen like an app.

**Does it work outside my home?**
The dashboard only works on your home network. Notifications (temperature alerts, end of a download or game session…) can reach your phone anywhere through the free ntfy app.

**What can the phone do?**
See the dashboard, use the phone as a gamepad for the PC, launch games, control media and shut down the PC when a download finishes. Changing settings and deleting files only works on the PC.

## Stream Deck

**How do I add the keys?**
The installer offers the plugin when it finds Stream Deck. Later: run `INSTALL STREAM DECK ADDON.bat` in the NEXUS folder. In the Stream Deck app, look for the **NEXUS Monitor** category.

**New keys don't show up after updating.**
Updates rebuild the plugin when it changes. If the keys still look old, run `INSTALL STREAM DECK ADDON.bat` in the NEXUS folder and restart the Stream Deck app.

## When something goes wrong

**Where do I start?**
Performance → **🩺 Problems** → **First aid**: step-by-step guides for crashes, shutdowns during games, high temperatures, low FPS, lag, blue screens, drive warnings, a slow PC and stopped fans.

**How do I ask for help without sharing personal data?**
Problems → **Support zip** creates a file with parts, drives, drivers, crashes and settings, with names, IPs, MAC addresses and codes replaced by `<...>`. It's saved to your Downloads; nothing is sent automatically.

**NEXUS doesn't open or the page doesn't load.**
Check the icon next to the clock (hidden icons ^). Open `http://localhost:8765` in your browser. If it still doesn't work, run the installer again: settings are kept.

## Contributing

**I found a bug / have an idea.**
Open an [issue](../../issues/new/choose) using the template. For bugs, include the version (bottom of the dashboard), your Windows version and what happened; the support zip helps a lot.

**Can I change the code?**
Yes. The source is in the zip and in each version in [`versoes/`](versoes). It's MIT-licensed, so you can fork it and share your changes.

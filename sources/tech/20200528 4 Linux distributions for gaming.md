[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 Linux distributions for gaming)
[#]: via: (https://opensource.com/article/20/5/linux-gaming)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

4 Linux distributions for gaming
======
Linux offers plenty of great options for a work/play combo or a full
gaming console setup. Take our poll to tell us your favorite.
![Gaming with penguin pawns][1]

Gaming on Linux got a thorough kickstart in 2013 when Valve announced that their own SteamOS would be written on top of Linux. Since then, Linux users could realistically expect to play high-grade games that, in the past, required the purchase of a Windows computer or gaming console. The experience got off to a modest start, with just a few brave companies like CD Projekt Red, Deep Silver, Valve itself, and others putting the Linux penguin icon in their compatibility list, but eventually, even Gearbox and Square Enix were releasing their biggest titles on Linux. Today, [Valve's Proton project][2] helps ensure that even titles with no formal Linux release still work on SteamOS and other Linux distributions.

Valve didn't singlehandedly drag gaming into Linux, though. Well before Valve's initiative, there have been excellent independent games, blockbusters from id Software, and open source [gaming emulators][3] for Linux. Whether you want to play the latest releases or you want to relive classics from gaming history, Linux provides the only open source platform for your game rig. Here's an overview of what you might consider running on it.

### SteamOS

![Steam OS][4]

If you're looking for the full gaming PC experience—in which there's no difference between your desktop computer and a game console—then SteamOS is the obvious choice. On the one hand, there's nothing particularly special about SteamOS; it's essentially just [Debian Linux][5] with Steam set as the default startup application. When you boot your computer, Steam starts automatically, and you can interact with it using only your [Steam controller][6] or any [Xbox-style gamepad][7]. You can create the same configuration by installing Steam on any distribution and setting its "Big Picture mode" as a startup item.

However, SteamOS is ultimately specific to its purpose as a game console. While you can treat SteamOS as a normal desktop, the design choices of the distribution make it clear that it's intended as the frontend to a dedicated gaming machine. This isn't the distribution you're likely to use for your daily office or schoolwork. It's the "firmware" (except it's actually software) of a gaming console, first and foremost. When you're looking for a seamless, reliable, self-maintaining game console, build the machine of your dreams and install SteamOS.

### Lakka

![Lakka OS][8]

Similar in spirit to SteamOS, Lakka recreates the Playstation 3 interface, but for retro gaming. I installed Lakka on a Raspberry Pi Rev 1 using [Etcher][9] and was pleasantly surprised to find it ready for gaming upon bootup. Lakka loads to an interface that's eerily familiar to PS3 gamers, and, like a Playstation, you can control everything using just a [game controller][10].

Lakka focuses on retro gaming, meaning that, instead of Steam, it provides game emulators for old systems and engines. Provided you have ROM images, you can use the emulators to play games from Nintendo, Sega Genesis, Dreamcast, N64, or homebrew titles like [POWDER][11], [Warcraft Tower Defense][12], and others.

Lakka doesn't ship with any games, but it makes it easy for you to add games over SSH or Samba shares. Even if you've never used SSH or set up Samba (you've probably used it without knowing it), Lakka makes it easy to find your retro gaming system over your own network, so you can add games to it using whatever OS you have handy.

### Pop_OS!

![PopOS][13]

Not everyone is trying to build a game console—modern, retro, or otherwise. Sometimes, all you really want is a good computer with the ability to run games at top performance. [System76][14] maintains a desktop they call Pop_OS!, designed around the standard GNOME desktop with some custom additions. Pop_OS! doesn't do much by way of innovation, but it makes an impact in the way its designers maintain convenient defaults. For gamers, this includes easy access to Steam, Proton, WINE, game emulators, PlayOnLinux, automatic game controller recognition and configuration, and more. It's not far from its Ubuntu roots, but it has been refined just enough to make a noticeable difference.

When you're not playing games, Pop_OS! is also a wonderful productivity-focused desktop. It uses all of GNOME's built-in conveniences (such as the quick Activities menu overlay) to maximize efficiency, and adds useful modifications to bring the desktop closer to the universal expectation that's grown from decades of traditions founded in KDE Plasma, Finder, and Explorer. Pop_OS! is an intuitive and understated environment that helps you focus on whatever you're working on, until you break out the gaming gear, and then it makes sure you spend your time on entertainment instead of configuration.

### Drauger OS

![Drauger OS][15]

Situated somewhere between a dedicated gaming console and a plain old desktop is Drauger OS, with a simple interface designed to stay out of your way while also making it quick and easy to access the game applications you need. Drauger is still a young project, but it represents an interesting philosophy of computing and gaming—conserve every last resource for the task at hand. To that end, Drauger OS does away with the concept of a traditional desktop and instead provides a simplified control panel that lets you launch your game client (such as Steam, PlayOnLinux, Lutris, and so on), and configure services (such as your network) or launch an application. It's a little disorienting at first, especially because the control panel is designed to more or less disappear when in the background, but after an afternoon of interaction, you realize that the complexity of a full desktop is mostly unnecessary. The point of any computer is rarely its desktop. What you really care about is getting into an application as quickly and easily as possible, and then for that application to perform well.

The other side of this equation is performance. While having a drastically simplified desktop helps, Drauger OS attempts to maximize game performance by using a low-latency kernel. A kernel is the part of your operating system that communicates with external devices, such as game controllers and mice and keyboards, and even hard drives, memory, and video cards. An all-purpose kernel, such as the one that ships with most Linux distributions, gives more or less equal attention to all processes. A low-latency kernel can favor specific processes, including video and graphics, to ensure that calculations performed for important tasks are returned promptly, while mundane system tasks are assigned less importance. Drauger's Linux kernel is tuned for performance, so your games get top priority over all other processes.

### The Linux of your choice

![Pantheon OS][16]

Looking past the self-declared focal points of individual "gaming distributions," one Linux is ultimately essentially the same as the next Linux. Amazingly, I play games even on my RHEL laptop, a distribution famous for its enterprise IT support, thanks to the [Flatpak Steam installer][17]. If you want to game on Linux in this decade, your question isn't how to do it but which system to use.

The easiest answer to which Linux to use is, ultimately, to choose whatever Linux works best on your hardware. When you find a Linux distribution that boots and recognizes your computer hardware, your game controllers, and lets you play your games. Once you find that, install the games of your choice and get busy playing.

There are more great Linux distributions for gaming out there, including the [Fedora Games Spin][18], [RetroPie][19], [Clear Linux][20], [Manjaro][21], and so many more. What's your favorite? Tell us in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/linux-gaming

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/gaming_grid_penguin.png?itok=7Fv83mHR (Gaming with penguin pawns)
[2]: https://github.com/ValveSoftware/Proton
[3]: https://opensource.com/article/18/10/lutris-open-gaming-platform
[4]: https://opensource.com/sites/default/files/uploads/screenshot_from_2020-05-15_15-53-15_0.png (Steam OS)
[5]: http://debian.org
[6]: https://store.steampowered.com/app/353370/Steam_Controller/
[7]: https://www.logitechg.com/en-nz/products/gamepads/f710-wireless-gamepad.940-000119.html
[8]: https://opensource.com/sites/default/files/uploads/os-lakka_0.png (Lakka OS)
[9]: https://www.balena.io/etcher/
[10]: https://www.logitechg.com/en-nz/products/gamepads/f310-gamepad.940-000112.html
[11]: http://www.zincland.com/powder/index.php?pagename=about
[12]: https://ndswtd.wordpress.com/
[13]: https://opensource.com/sites/default/files/uploads/os-pop_os_0.jpg (PopOS)
[14]: https://system76.com/
[15]: https://opensource.com/sites/default/files/uploads/os-drauger_0.jpg (Drauger OS)
[16]: https://opensource.com/sites/default/files/uploads/os-pantheon_0.jpg (Pantheon OS)
[17]: https://flathub.org/apps/details/com.valvesoftware.Steam
[18]: https://labs.fedoraproject.org/en/games/
[19]: https://retropie.org.uk/
[20]: https://clearlinux.org/software/bundle/games
[21]: http://manjaro.org

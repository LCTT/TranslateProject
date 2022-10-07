[#]: subject: "What's your favorite screenshot tool on Linux?"
[#]: via: "https://opensource.com/article/22/8/favorite-screenshot-tool-linux"
[#]: author: "AmyJune Hineline https://opensource.com/users/amyjune"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

What's your favorite screenshot tool on Linux?
======
There are many open source screenshot tools to choose from, but which one works for you?

![Browser of things][1]

> What's your favorite screenshot tool?
>
>* Spectacle
>* GNOME screenshot
>* Simple Screen Recorder
>* Flameshot
>* ImageMagick
>* Scrot
>* Grim
>* I'll tell you in the comments!

（to wxy：我们在公众号里也搞个这个投票吧！）

As the saying goes, a picture is worth a thousand words, and while that's not always the case with terminal commands and code, it still holds true for the graphical desktop. Screenshots capture precisely what's on your screen. I love taking them to have a record of who attends meetings, so I don't have to write it down at the moment. Or to capture a bug when doing UI testing. We all take them for different reasons, though, and there are more ways to take a screenshot than you might at first think.

I started thinking about screenshots after Jim Hall wrote an  as the ways he often takes screenshots. And yet that's just the beginning, as I quickly found out when I asked Opensource.com authors how they each take screenshots.

### Making a spectacle

![Spectacle][2]

I use Spectacle. It works perfectly for my simple needs.

**[—David Both][3]**

I use KDE. It ships with Spectacle, which seems to be responsible for taking a screenshot when I push the **PrtScr** (Print Screen) key.

A nice feature is that the default action is to take a screenshot immediately when you press **PrtScr**, but then it brings up the Spectacle interface, so you can take more sophisticated screenshots (a rectangular area, the window under your cursor, and so on.)

**[—Greg Pittman][4]**

### Framing the shot

For a long time I had wanted to capture only a small amount of the screen in a screenshot, not the whole thing, but struggled to know how.

Since then I've installed KolourPaint. I open the full screenshot inside the program, and cut out the part I want to keep. Hope this could help others suffering the same screenshot dilemma!

**[—Laurence Urhegyi][5]**

I use **Shift**+**PrtSc** to capture a small amount of the screen in a screenshot.

**[—Agil Antony][6]**

### Emacs

A while back I created an [Elisp function][7] to take a screenshot from Emacs.

**[—Sachin Patil][8]**

### Flameshot

![Flameshot][9]

[Flameshot][10], the one and only! Nothing is missing in this wonderful tool: doodling, arrows, adding text, a pixelate tool for blurring out sensitive information, an autoincrementing counter bubble, save, copy, the ability to open the screenshot in a selected application, and the list goes on and on. Once I installed it, I've never looked for anything else!

A friendly hint: when installing from Flatpak, you might want to use [Flatseal][11] to grant access to your home folder, otherwise the Save dialog will feel somewhat empty.

**[—Tomasz Waraksa][12]**

### ImageMagick

```
#!/bin/bash
current=$(date +%H-%M-%S-%d-%m-%Y).png
if [[ -z "${1}" ]]; then
   import -window root "${HOME}/${current}" # All screen
else
   import "${HOME}/${current}" # Custom screenshot
fi

notify-send "Screenshot ${current} taken successfully!"
```

**—Suporte Terminal Root**

### GNOME

![GNOME Screenshot][13]

As a mostly GNOME Desktop user, I was happy taking screenshots with the regular **PrtSc**, **Ctrl**+**PrtSc**, or **Shift**+**PrtSc** keys. My favorite is **Shift** because it allows me to select an area of the screen.

Recently, GNOME recently introduced an improved screenshot tool when you simply hit **PrtSc**. I haven't even used it that much yet, so I'm looking forward to trying it out thoroughly on some future articles.

**[—Alan Formy-Duval][14]**

As a satisfied GNOME user, I've been using the built-in screenshot tool. With the older version, I would screenshot a window with **Shift**+**PrtSc**. Now I just use **PrtSc** and select the region with the tool. I like the new one better, but if I had to go back to the old, that'd be OK too.

**[—Chris Hermansen][15]**

### XFCE Screenshooter

![XFCE Screenshooter][16]

I've been using XFCE lately, and **xfce4-screenshooter** has been doing an excellent job. Like the rest of XFCE, it's minimal but highly functional, with options to capture the entire screen, the active window, or just a region. You can even activate or deactivate whether the mouse cursor is included in the shot.

**[—Klaatu][17]**

### Grim and Slurp

I have a fun little alias that I use for screenshots:

```
alias sshot='; grim -g "$(slurp)" screenshot-$(date +%s).png 2> /dev/null'
```

It lets me draw a rectangle on my screen, and it captures just that area. The command uses **grim** and **slurp**, both available in the Fedora repos.

But this only works on Wayland. On X11, you can replace them with **maim** and **scrot**.

**[—Mohammed Saud][18]**

### Your screenshot tool

What's your screenshot tool of choice? Tell us in the comments!

Image by: (Seth Kenlon, CC BY-SA 4.0)

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/8/favorite-screenshot-tool-linux

作者：[AmyJune Hineline][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/amyjune
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/browser_desktop_website_checklist_metrics.png
[2]: https://opensource.com/sites/default/files/2022-08/screenshot-spectacle.webp
[3]: https://opensource.com/users/dboth
[4]: https://opensource.com/users/greg-p
[5]: https://opensource.com/users/laurence-urhegyi
[6]: https://opensource.com/users/agantony
[7]: https://gitlab.com/psachin/emacs.d/-/blob/dev/custom_functions.org
[8]: https://opensource.com/users/psachin
[9]: https://opensource.com/sites/default/files/2022-08/screenshot-flameshot.webp
[10]: https://github.com/flameshot-org/flameshot
[11]: https://flathub.org/apps/details/com.github.tchx84.Flatseal
[12]: https://opensource.com/users/tomasz
[13]: https://opensource.com/sites/default/files/2022-08/screenshot-gnome_0.webp
[14]: https://opensource.com/users/alanfdoss
[15]: https://opensource.com/users/clhermansen
[16]: https://opensource.com/sites/default/files/2022-08/screenshot-screenshooter.webp
[17]: https://opensource.com/users/klaatu
[18]: https://opensource.com/users/saud

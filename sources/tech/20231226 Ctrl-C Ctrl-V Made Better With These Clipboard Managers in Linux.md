[#]: subject: "Ctrl+C Ctrl+V Made Better With These Clipboard Managers in Linux"
[#]: via: "https://itsfoss.com/linux-clipboard-managers/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Ctrl+C Ctrl+V Made Better With These Clipboard Managers in Linux
======

Whenever you copy something, it gets stored in the system clipboard, a special short-term memory where your system stores the copied text.

I mean we all used those magical Ctrl+C and Ctrl+V shortcuts for copy pasting, right?

But imagine, that you copied something and when you were about to paste, you used Ctrl+C again instead of Ctrl+V. What a bummer! Now you have to copy the intended text again.

**This is why you need a clipboard manager**. It keeps a history of the text you copied. This way, you can access the text that you copied hours ago and everything else copied in between.

There are several such clipboard tools available. I will share share 7 clipboard managers for Linux users.

This list contains some advanced clipboard managers as well as some super simple ones so you can choose what fits the best for your use.

### 1\. CopyQ

![][1]

The [CopyQ][2] is one of the most feature-rich clipboard managers available on Linux.

But that does not compromise the usability. The user interface is simple and you can use tags for copied text or you can pin them.

Here are some more interesting features of CopyQ:

  * Ability to search and modify the copied items
  * Preserves copied items on reboot
  * You can specify actions based on copied items
  * Pin important items for ease of reachability
  * Use different tags for better identification



If you are interested, we have covered CopyQ in a separate article exploring all the features and installation:

![][3]

To install CopyQ on Ubuntu, use the given command:

```

    sudo apt install copyq

```

For Fedora Linux:

```

    sudo dnf install copyq

```

Get CopyQ as a flatpak using the following:

```

    flatpak install --user --from https://flathub.org/repo/appstream/com.github.hluk.copyq.flatpakref

```

### 2\. GPaste

![][4]

The [GPaste][5] is considered one of the best clipboard managers for the GNOME desktop manager as it blends well with the GNOME shell styling.

But that's not it! You get tonnes of features that you expect from any modern and advanced clipboard manager:

  * Support for images
  * Customizable shortcuts for better productivity
  * Support for GNOME extension for better reach
  * Ability to customize the history and size



To install GPaste on Ubuntu, use the following command:

```

    sudo apt install gpaste-2

```

For Fedora Linux:

```

    sudo dnf install gpaste

```

For Arch Linux:

```

    sudo pacman -S gpaste

```

The GNOME extension is no longer maintained so you can not install it from the official site but if you want to have it, here's how you do it on Ubuntu:

```

    sudo apt install gnome-shell-extension-gpaste

```

### 3\. Diodon

![][6]

The [Diodon][7] aims to be the best clipboard manager for Unity desktop manager but when I tested it on GNOME and KDE, it worked just fine.

Diodon is simple and only gets you the basic feature that most users would want from a clipboard manager.

Here are some interesting features of Diodon:

  * Support for tray icon support by default
  * Ability to sync clipboards
  * Pastes selected items automatically
  * Image support



To install Diodon in Ubuntu, use the following:

```

    sudo apt install diodon

```

For Fedora Linux:

```

    sudo dnf install diodon

```

For Arch Linux:

```

    sudo pacman -S diodon

```

### 4\. Parcellite

![][8]

[Parcellite][9] is one of those utilities that look super simple from the front and when you dig in, you get a taste of advancement.

From typing to searching in the clipboard to creating actions for better control, it offers almost everything you can expect from the clipboard.

Here are some interesting features you get with Paecellite:

  * Persistent history
  * Synchronize with other clipboards
  * Type to search
  * Trim whitespace and newlines



To install Parcellite on Ubuntu, use the given command:

```

    sudo apt install parcellite

```

For Fedora Linux:

```

    sudo dnf install parcellite

```

For Arch Linux:

```

    sudo pacman -S parcellite

```

### 5\. Keepboard

![][10]

The most prominent feature of the [Keepboard][11] is how it groups the copied items. Apart from that, you can also save your favorites for future use as well.

But here are some other features of Keepboard:

  * Auto-paste when you double-click or enter the copied item from Keepboard.
  * Give custom names for your favorite items and groups.
  * Ability to search items.
  * Customizable shortcuts.



The UI looks dated to me. It could surely benefit with a more modern interface. If you don't have any issues with that, you can surely give it a try.

The sad part is the only way to install Kepboard is to install it as a snap package:

```

    sudo snap install keepboard

```

### 6\. Qclipper

![][12]

If you are looking for a lightweight option that does only one thing: saves your copied text then [Qlipper][13] is the perfect option for you.

Apart from being one of the most lightweight keyboard managers, it has some other features too:

  * Ability to change the system icon
  * Extension support
  * Specify the number of items to store
  * Trim whitespace from the copied line



Looks interesting? Here's how you install Qclipper on Ubuntu:

```

    sudo apt install qlipper

```

For Fedora Linux:

```

    sudo dnf install qlipper

```

For Arch Linux:

```

    sudo pacman -S qlipper

```

### 7\. Clipboard (for terminal use only)

![][14]

Ever thought you'd ever need a clipboard in Linux? Well, I used to use the cp command to copy files in Linux but [the Clipboard utility][15] has made things pretty easy for me.

Don't confuse it with the cp command as it is a full-fledged clipboard crafted for the terminal users and here are some great features you get:

  * Integration with the existing GUI clipboard on Linux
  * Eye candy design
  * Blazing fast
  * No configuration is required and easy to use



The easiest way to get this utility is to use the Flatpak or snap package as it is not available in the default repository of most Linux distributions.

For Flatpak:

```

    flatpak install app.getclipboard.Clipboard
    alias cb='flatpak run app.getclipboard.Clipboard'

```

For Snap package:

```

    sudo snap install clipboard
    alias cb='snap run clipboard'

```

Each of these methods requires you to set up an alias to make it work and the command which I mentioned will only add alias temporarily.

To [create an alias permanently][16], you can refer to this detailed guide:

![][17]

### My take on clipboard managers

If you ask me, I love using tools that are not super fancy and get the job done and if your ideology aligns with mine, you should use CopyQ which has amazing features but is minimal enough that does not crips me out.

Sure, you may not agree with me and this is why I wrote this article with other such options.

_💬 Now, it's your turn. Which of the above mentioned clipboard managers you use or willing to use? Do you know any other such tool that should be added to the list here? Share it in the comments please._

--------------------------------------------------------------------------------

via: https://itsfoss.com/linux-clipboard-managers/

作者：[Sagar Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/content/images/2023/12/CopyQ-clipboard-manager-in-Linux.png
[2]: https://github.com/hluk/CopyQ
[3]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[4]: https://itsfoss.com/content/images/2023/12/GPaste-clipboard-manager-in-Linux.png
[5]: https://github.com/Keruspe/GPaste
[6]: https://itsfoss.com/content/images/2023/12/diodon-clipboard-manager-in-Linux.png
[7]: https://github.com/diodon-dev/diodon
[8]: https://itsfoss.com/content/images/2023/12/Parcellite-clipboard-manager-in-Linux.png
[9]: https://github.com/rickyrockrat/parcellite
[10]: https://itsfoss.com/content/images/2023/12/clipboard-manager-in-Linux.png
[11]: https://draganbozanovic.blogspot.com/2020/05/keepboard-clipboard-manager.html
[12]: https://itsfoss.com/content/images/2023/12/Qlipper-clipboard-manager-in-Linux.png
[13]: https://github.com/pvanek/qlipper
[14]: https://itsfoss.com/content/images/2023/12/copy-and-paste-using-clipboard.gif
[15]: https://github.com/Slackadays/Clipboard
[16]: https://linuxhandbook.com/linux-alias-command/
[17]: https://linuxhandbook.com/content/images/size/w256h256/2021/08/Linux-Handbook-New-Logo.png

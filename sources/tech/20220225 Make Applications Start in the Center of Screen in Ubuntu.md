[#]: subject: "Make Applications Start in the Center of Screen in Ubuntu"
[#]: via: "https://itsfoss.com/make-applications-start-at-center-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Make Applications Start in the Center of Screen in Ubuntu
======

You might have experienced it but never paid enough attention to it.

If you open an application in Ubuntu, the application window usually starts in the top left, not at the center.

Is it a big deal? No, probably not.

However, it is a minor annoyance if you prefer to keep the applications in the center (when not in full-screen mode).

For me, this is particularly painful while using the terminal. I don’t use the terminal in full screen. The small terminal window in the center is more comfortable for me.

![][1]

If you share the same feeling, let me share a quick little tip that will open new application windows in the center of the screen.

You can use both command line and GUI methods for this purpose.

### Method 1: Use GNOME Tweaks to center new application windows

If you don’t have it already, [install GNOME Tweaks tool][2]. You can get it from the software center or simply use the command:

```

    sudo apt install gnome-tweaks

```

Once installed, open the Tweaks tool, go to Windows option in the sidebar and enable the ‘**Center New Windows’ feature.**

![Make new apps open in the center of screen][3]

If you want to get the default behavior back, disable it in the same way.

### Method 2: Use commands to center new applications

If you prefer the terminal, you can do the same using this command:

```

    gsettings set org.gnome.mutter center-new-windows true

```

To get the default behavior of opening the applications in the top left, you can set it back like this:

```

    gsettings set org.gnome.mutter center-new-windows false

```

As I said earlier, it’s not a major issue. Such a minor annoyance that you might not even have thought of changing this behavior. But now you know that there is a way to control it.

GNOME may not seem too customizable but it does provide granular control on the various aspects of the desktop experience.

Another small but useful tweak I like is to [enable the click to minimize feature][4]. You should explore that as well.

_Tip shared by It’s FOSS reader Malcolm Dean._

--------------------------------------------------------------------------------

via: https://itsfoss.com/make-applications-start-at-center-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/apps-open-left-of-screen.jpg?resize=1920%2C1080&ssl=1
[2]: https://itsfoss.com/gnome-tweak-tool/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/open-new-apps-in-the-center-of-screen.png?resize=800%2C475&ssl=1
[4]: https://itsfoss.com/click-to-minimize-ubuntu/

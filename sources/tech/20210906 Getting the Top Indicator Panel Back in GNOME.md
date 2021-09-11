[#]: subject: "Getting the Top Indicator Panel Back in GNOME"
[#]: via: "https://itsfoss.com/enable-applet-indicator-gnome/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "imgradeone"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Getting the Top Indicator Panel Back in GNOME
======

GNOME is the popular desktop environment that thrives to give Linux a modern desktop experience.

While it works for the most part, some of their decisions has left the user fuming and questioning.

You cannot have icons and files on the desktop, [new document option has been removed][1] from the right click context menu. In addition to that, GNOME has also removed the applet indicator functionality.

You know what indicator applets are, don’t you? Those little icons that let you access additional features of the given application. I have plenty of them in my Ubuntu system.

![Indicator applets][2]

And this creates a problem, specially for applications that rely completely on these applet indicators to function. Take [Dropbox][3] for example. The only way to access Dropbox settings is through the app-indicator and you won’t find it in GNOME.

That’s a problem, but thankfully, there is a workaround for that.

### Enabling applet indicator in GNOME via extension

If you are using GNOME, you probably already know what GNOME Extension is. These are basically small add-ons developed by enthusiastic, independent developers.

If not done already, [enable GNOME extensions][4]. It’s actually quite simple. Go to any GNOME extension’s page using Firefox or Chrome and it will suggest downloading a browser extension. Install it and you are good to go.

![Enabling GNOME Extension browser add-on][5]

Now, there are several GNOME extensions available that allow adding applet indicators in the top panel. At the time of writing this tutorial, [AppIndicator and KStatusNotifierItem Support][6] extension is well developed and supported for the recent GNOME versions.

Go to its webpage:

[AppIndicator Extension][6]

On the page, you should see a toggle button. Click it to install it.

![][7]

There will be a pop-up. Hit install when you see it.

![Install the extension][8]

The results won’t be seen immediately. You’ll have to restart GNOME. On Xorg, you could just use Alt+F2 and enter r but that does not work in Wayland.

Log out of the system and log back in. Applet indicator should be activated now. If you have any applications installed that provides an indicator applet, you should see it on the top panel.

In my case, I had Dropbox already installed and hence it started showing the icon in the top panel.

![Dropbox indicator working in GNOME][9]

I hope this little tip help you gain access to the app indicators in the top panel of GNOME again.

I do not know why the GNOME developers though that dropping this essential feature was a good idea. Anyway, if one door closes, another opens (usually). Enjoy GNOME to your liking.

--------------------------------------------------------------------------------

via: https://itsfoss.com/enable-applet-indicator-gnome/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/add-new-document-option/
[2]: https://itsfoss.com/wp-content/uploads/2021/09/indicator-applet-linux.webp
[3]: https://www.dropbox.com
[4]: https://itsfoss.com/gnome-shell-extensions/
[5]: https://itsfoss.com/wp-content/uploads/2021/09/installing-gnome-extension-add-on-800x355.webp
[6]: https://extensions.gnome.org/extension/615/appindicator-support/
[7]: https://itsfoss.com/wp-content/uploads/2021/09/appindicator-extension-800x329.webp
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/installing-appindicator-extension.png?resize=800%2C269&ssl=1
[9]: https://itsfoss.com/wp-content/uploads/2021/09/gnome-dropbox-indicator-800x561.webp

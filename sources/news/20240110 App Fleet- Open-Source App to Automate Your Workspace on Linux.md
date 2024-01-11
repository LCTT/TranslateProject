[#]: subject: "App Fleet: Open-Source App to Automate Your Workspace on Linux"
[#]: via: "https://news.itsfoss.com/app-fleet/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

App Fleet: Open-Source App to Automate Your Workspace on Linux
======
An open-source workspace automation tool. Sounds interesting!
The year 2024 just started, and maybe you are getting overwhelmed with the amount of work you have to get done across different apps? Why not make that simpler, with, say, a workspace management tool?

App Fleet is **a new open-source workspace manager and launch automation tool** primarily developed for Linux; I must say, the last bit is something you don't hear often! 😃

Here, I try App Fleet and share my experience with you.

🚧

The app is fairly new and under active development. It may or may not work the way you expect it to.

### App Fleet: Key Features ⭐

![][1]

Written using the **Flutter framework** , App Fleet has been **tailored for the GNOME desktop environment** , and being a fairly new app, the development of it has been progressing rather well, with regular releases from time to time.

Some **key features** include:

  * **Support for Most Apps.**
  * **Intuitive User Interface.**
  * **Set Apps to Specific Workspaces.**



#### ⚙️How to Install App Fleet?

![][2]

Unfortunately, App Fleet is **not available as a Flatpak, Snap, AppImage or any other popular packaging format**.

According to the developer, App Fleet requires system-wide read access and packaging it with these formats is not viable for such an app.

The **most straightforward way to install App Fleet** is by running the following command (a network installer script):

```

    curl https://raw.githubusercontent.com/omegaui/app_fleet/main/network-install.sh | bash

```

For most, the above command is the recommended solution.

If you wish, you can install it from the precompiled bundle or the source. For more info, you can head over to its [GitHub repo][3].

[App Fleet (GitHub)][3]

#### Initial Impressions 👨‍💻

After installing it on my PC, I launched App Fleet and was greeted with a poker-faced ghost saying there were no workspace configurations on this system.

![][4]

So, I clicked on “ _Create Now_ ” to get started, and I gave the workspace config a fitting name.

![][5]

I then picked the icon for it; there were many options with the freedom to upload a custom one too.

![][6]

The app selection screen listed all my apps, so I selected the ones I usually use while working.

![][7]

I could also **give those apps specific workspaces** so that they would launch directly in the ones specified, doing away with the need to manually place them. ( _That didn't work out so well for me, more on that later._ )

![][8]

There was also the **ability to manually add an app** from the system, or external storage, where I could give it a name, the wait time, and so on.

![][9]

I could also tweak the same for the apps added. The “ _Wait Time_ ” settings can be useful if you would rather not be overwhelmed by the number of apps launching in quick succession.

![][10]

After all things were set, I clicked on the “ _Save_ ” icon on the top-right to save my workspace config.

![][11]

The main screen of App Fleet then showed me the workspace config created.

![][12]

It also launched the **App Fleet launcher** , which was a small widget looking thing that let me launch the saved workspace config.

![][13]

So, to test out how it worked, I did a quick restart of the system, and the launcher automatically popped up when I logged into my system. As you can see below, **the launcher is a neat little thing** that doesn't really get in the way.

![][14]

However, as you may have noticed, **the apps did not launch on the workspaces I set them to launch in**. Though the launching of apps, and the customized wait times do kick in.

The [official website][15] mentions that this was “ _finely tested_ ” for Ubuntu 22.10, so that would be a thing to keep in mind.

Sure, the app is brand new. So, we cannot expect everything to work perfectly.

But, if you ask me, **App Fleet has a lot of potential** , if you were someone who uses the [Auto Move Windows][16] GNOME extension, this can be a very handy alternative to it.

And did I say that **App Fleet is not just limited to GNOME?**

You can also use it on other [desktop environments][17] such as KDE Plasma, Budgie, and Cinnamon.

**Suggested Read** 📖

![][18]

_💬 Well, what are your thoughts on App Fleet? Any similar tool in mind? How did it work for you? Let me know in the comments below!_

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/app-fleet/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/content/images/2024/01/App_Fleet_a.png
[2]: https://news.itsfoss.com/content/images/2024/01/App_Fleet_b.png
[3]: https://github.com/omegaui/app_fleet
[4]: https://news.itsfoss.com/content/images/2024/01/App_Fleet_c.png
[5]: https://news.itsfoss.com/content/images/2024/01/App_Fleet_d.png
[6]: https://news.itsfoss.com/content/images/2024/01/App_Fleet_e.png
[7]: https://news.itsfoss.com/content/images/2024/01/App_Fleet_f.png
[8]: https://news.itsfoss.com/content/images/2024/01/App_Fleet_g.png
[9]: https://news.itsfoss.com/content/images/2024/01/App_Fleet_i.png
[10]: https://news.itsfoss.com/content/images/2024/01/App_Fleet_j.png
[11]: https://news.itsfoss.com/content/images/2024/01/App_Fleet_h.png
[12]: https://news.itsfoss.com/content/images/2024/01/App_Fleet_k.png
[13]: https://news.itsfoss.com/content/images/2024/01/App_Fleet_l.png
[14]: https://news.itsfoss.com/content/images/2024/01/App_Fleet_m.gif
[15]: https://omegaui.github.io/app_fleet_webpage/
[16]: https://extensions.gnome.org/extension/16/auto-move-windows/
[17]: https://itsfoss.com/what-is-desktop-environment/
[18]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png

[#]: subject: (OBS Studio 27 Adds Wayland Support, Undo/Redo, and Browser Docks)
[#]: via: (https://news.itsfoss.com/obs-studio-27-release/)
[#]: author: (Ankush Das https://news.itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

OBS Studio 27 Adds Wayland Support, Undo/Redo, and Browser Docks
======

Open Broadcaster Software is a free and open-source streaming/recording solution available for multiple platforms.

Not long ago, we [spotted native Wayland support coming to OBS Studio][1].

Now, with the release of OBS Studio 27, it is finally a reality. Not just limited to wayland support, but there are some significant feature additions.

Here, I shall highlight the key changes introduced with OBS Studio 27.

### OBS Studio 27: What’s New?

![][2]

The key new feature addition with this release is **Undo/Redo**.

While it sounds like a basic feature that should have existed from the start — but they needed to have a proper implementation, for which they waited.

The [release announcement][3] mentions a note about it back in 2018:

> _This is on the agenda. Fortunately, it’s not a “difficult” feature to write, it’s actually pretty simple, but the implementation is what’s delicate, and requires a fair amount of experience to get right._

Now that it is here, you can work stress-free without needing to constantly tweak when you accidentally modify something.

Of course, there’s a limit to what the Undo function can do, and it looks like it should be able to revert **5000 actions** in a particular session. It is worth noting that if you restart the app, you can no longer undo the last actions.

![][4]

More about it in the announcement post:

> Undo is built to track actions that affect the preview. This means every potential modification to scenes, sources, groups, filters, stingers, and scripts. These have the potential to affect the feed in real-time, without a chance to “Apply” changes, and can sometimes result in complex changes that are harder to quickly revert or recreate. The Undo stack is capable of tracking the last 5,000 actions of the session, and is cleared when switching scene collections or restarting the app.

The next important addition is the **browser dock**, which was already present for Windows users but introduced for macOS and Linux with this release.

The dock will let you quickly access other sites or services while using the OBS app such as chats, Twitch account linking, and more.

### Other Improvements

The release also addresses the display capture support on Laptops with different GPUs, which should provide a good experience for Laptop users.

There’s also a new missing files dialogue which will clearly list what’s missing to spot the sources that you need to add.

For more information on the changes, you may refer to the [official announcement post][3].

### Download OBS Studio 27

You can directly install OBS Studio using the Ubuntu PPA but the Wayland support is available only for Ubuntu 21.04 and above through this method.

In case you want to do that, here’s what you need to type in the terminal (ensure you have [ffmpeg][5] installed):

```
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt install obs-studio
```

So, it is best to use the [Flatpak package][6] to get started. You can also take the help of our [Flatpak guide][7] if you’re using it for the first time.

You can find other download options in the official download page or its [GitHub page][8].

[Download OBS Studio 27][9]

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/obs-studio-27-release/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/obs-studio-wayland/
[2]: https://i0.wp.com/i.ytimg.com/vi/LUkMxYNIyj0/hqdefault.jpg?w=780&ssl=1
[3]: https://obsproject.com/blog/obs-studio-27-released
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQyMyIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[5]: https://itsfoss.com/ffmpeg/
[6]: https://flathub.org/apps/details/com.obsproject.Studio
[7]: https://itsfoss.com/flatpak-guide/
[8]: https://github.com/obsproject/obs-studio
[9]: https://obsproject.com/download

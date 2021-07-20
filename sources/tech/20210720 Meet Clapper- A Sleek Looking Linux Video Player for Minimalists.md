[#]: subject: (Meet Clapper: A Sleek Looking Linux Video Player for Minimalists)
[#]: via: (https://itsfoss.com/clapper-video-player/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Meet Clapper: A Sleek Looking Linux Video Player for Minimalists
======

Love minimalism? You’ll love Clapper.

Clapper is a new [video player for Linux][1]. Actually, it’s more for GNOME than Linux.

Built on top of GNOME’s JavaScript library and GTK4 toolkit, it blends naturally in the GNOME desktop environment. It uses [GStreamer][2] for media backend and [OpenGL][3] for rendering.

I like application with minimalist approach. While VLC is the Swiss Knife of media players, I prefer [MPV player][4] for the sleek, minimal interface. And now I think I am going to stick with Clapper for sometime.

### Clapper video player

![A screenshot of Clapper video player][5]

[Clapper uses hardware acceleration][6] by default. It supports Intel and AMD GPUs and works on both Xorg and Wayland.

[Clapper][7] doesn’t use the traditional upper window bar. There are auto-hiding preference menu, mode changer and window control buttons for you to access a few features. This gives it a sleek, minimalist look.

It has three modes:

  * Windowed mode: the default mode shows the progress bar and window control
  * Floating mode: the progress bar is hidden and the player is floating on top of other applications like the ‘[always on top][8]‘ feature or ‘picture in picture’ mode
  * Fullscreen mode: Player goes full screen, progress bar is bigger but they all auto-hide



![Interface of Clapper video player with preference control and window modes][9]

Clapper also has an adaptive UI which can also be used on Linux-based smartphones and tablets. So if you have got yourself a Pine Phone or Librem5, you can use Clapper on it.

There is support for subtitles with option to change the font. However, the subtitles didn’t work in my testing. There is also no option to explicitly add subtitles to a playing video. This is something that must be improved.

Like VLC, Clapper also gives you the option to resume playback from the last point if you open the same video file again. One of the [handy features I love in VLC][10].

Clapper supports playing videos from the internet as well if you provide the URL.

Here, in the screenshot, I am playing a YouTube video in Clapper. It is a beautiful song sung by a beautiful singer and actress. Can you guess which song or movie it is?

![Clapper playing a video from YouTube][11]

### Install Clapper on Linux

Clapper is available in AUR for Arch and Manjaro users. That should not be a surprise for anyone. AUR has everything under the sun.

For other distributions, Clapper officially provides [Flatpak package][12]. So, please [enable Flatpak support for your distribution][13] and then use the following command to install it:

```
flatpak install flathub com.github.rafostar.Clapper
```

Once installed, simply search for it in the application menu or right click on a video file and choose to open it with Clapper.

Clapper is far from being the perfect video player. However, it has potential to become a popular Linux application.

If you use it, please do share your experience. If you find bugs, please [notify the developer][14].

--------------------------------------------------------------------------------

via: https://itsfoss.com/clapper-video-player/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/video-players-linux/
[2]: https://gstreamer.freedesktop.org/
[3]: https://www.opengl.org/
[4]: https://itsfoss.com/mpv-video-player/
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/clapper-screenshot.png?resize=800%2C498&ssl=1
[6]: https://github.com/Rafostar/clapper/wiki/Hardware-acceleration
[7]: https://github.com/Rafostar/clapper
[8]: https://itsfoss.com/always-on-top/
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/07/clapper-video-player-interface.jpg?resize=800%2C480&ssl=1
[10]: https://itsfoss.com/simple-vlc-tips/
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/07/clapper-youtube-video.jpg?resize=800%2C501&ssl=1
[12]: https://flathub.org/apps/details/com.github.rafostar.Clapper
[13]: https://itsfoss.com/flatpak-guide/
[14]: https://github.com/Rafostar/clapper/issues

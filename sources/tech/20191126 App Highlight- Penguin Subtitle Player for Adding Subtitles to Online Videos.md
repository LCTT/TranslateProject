[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (App Highlight: Penguin Subtitle Player for Adding Subtitles to Online Videos)
[#]: via: (https://itsfoss.com/penguin-subtitle-player/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

App Highlight: Penguin Subtitle Player for Adding Subtitles to Online Videos
======

I must confess. I am addicted to subtitles. It helps me understand the dialogues completely, specially if some dialogues are in a different accent or in a different language.

This has led to a habit of watching online videos with subtitles.

While streaming services like Netflix and Amazon Prime provide subtitles for their content, the same is not true for all the websites.

I often discover interesting content that are on YouTube, Dailymotion or other websites. And that becomes a problem because most of the time, these videos don’t have subtitles.

The good news is that you have the possibility to watch any online video content with subtitles and I’ll share that neat little trick with you in this article.

### Watch any online video with subtitles using Penguin subtitle player

![][1]

What the heck is a Subtitle player?

The [open source video players][2] you use allow you to add subtitles. Players like [VLC allow you to download subtitles automatically][3].

But they are video player and their main task is to play video.

A subtitle player on the other hand has only one task and that is to play subtitles. Confused? Let me explain.

A subtitle player basically provides an interface where you can add subtitle file and play the subtitles with a semi transparent background. The trick here is that this player will be visible all the time on top of any other application.

So if you are running the subtitle player even while using a website, it will still be visible. That actually is the trick to watch any online video with subtitles.

![An external subtitle playing on top of YouTube video][4]

All you have to do is to find appropriate subtitles from an online website like OpenSubtitles and add it to the subtitle player. Now open the website where you want to watch the video. Play it full screen (if that option is available) and it will feel like that the subtitles are part of the video itself.

![][5]

#### Install Penguin subtitle player

[Penguin][6] is a free and open source subtitle player. It is available for Linux, macOS and Windows.

If you are using Ubuntu-based distribution, you can [use this PPA][7] to easily install Penguin subtitle player.

```
sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt update
sudo apt install penguin-subtitle-player
```

For other Linux distributions, Windows and macOS, you can download the installer files from SourceForge:

[Download Penguin Subtitle Player][8]

#### Using Penguin subtitle player

Once you have installed the application, look for it in the menu and start it. You’ll see an interface like this:

![Penguin Subtitle Player Interface][9]

If you have already downloaded the .srt subtitle file, you can add it to the player by clicking the folder icon.

![Add Subtitle In Penguin Subtitle Player][10]

You can play/pause the subtitles, skip it to a new time. This helps in adjusting the subtitles with the video.

![Adjust Subtitle In Penguin Subtitle Player][11]

You can also tweak the appearance of the subtitles and subtitle player.

![Configure Penguin Subtitle Player][12]

You also have the option to change the fonts, font size and color of the subtitle text. You may also increase or decrease the transparency and color of the background.

![Config Options In Penguin Subtitle Player][13]

You can also resize the subtitle player interface and move it around anywhere on the screen.

#### Keep in mind

There are a few things to keep in mind while using Penguin subtitle player.

Not all video files and subtitle files are made for each other. Subtitle synchronization is a common problem so you’ll have to make sure that the subtitle you downloaded is best suited for the video you want to play.

Most video players, even the one embedded on the websites, allow to pause and play the video with the space key. Unfortunately, there is no keyboard shortcut to pause the Penguin subtitle player. In other words, you cannot pause the video and the subtitle player in one keystroke.

With this much configuration, you should be set for watching online videos with subtitles.

I hope you enjoy this nifty little open source application. Do let me know whether you find it useful or not.

--------------------------------------------------------------------------------

via: https://itsfoss.com/penguin-subtitle-player/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/11/Add_subtitle_online_videos.png?ssl=1
[2]: https://itsfoss.com/video-players-linux/
[3]: https://itsfoss.com/download-subtitles-automatically-vlc-media-player-ubuntu/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/11/penguin_subtitle_player.jpg?ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2015/05/Penguin_Subtitle_Player.jpg?ssl=1
[6]: https://github.com/carsonip/Penguin-Subtitle-Player
[7]: https://itsfoss.com/ppa-guide/
[8]: https://sourceforge.net/projects/penguinsubtitleplayer/
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/11/penguin-subtitle-player-interface.jpg?ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/11/add_subtitle_in_penguin_subtitle_player.jpg?ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/11/adjust_subtitle_in_penguin_subtitle_player.jpg?ssl=1
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/11/configure_penguin_subtitle_player.jpg?ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/11/config_options_in_penguin_subtitle_player.jpg?ssl=1

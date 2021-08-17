[#]: subject: "Automatically Synchronize Subtitle With Video Using SubSync"
[#]: via: "https://itsfoss.com/subsync/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Automatically Synchronize Subtitle With Video Using SubSync
======

Let me share a scenario. You are trying to watch a movie or video and you need subtitles. You download the subtitle only to find that the subtitle is not properly synchronized. There are no other good subtitles available. What to do now?

You can [synchronize subtitles in VLC by pressing G or H keys][1]. It adds a delay to the subtitles. This could work if the subtitle is out of synch by the same time interval throughout the video. But if that’s not the case, SubSync could be of great help here.

### SubSync: Subtitle Speech Synchronizer

[SubSync][2] is a nifty open source utility available for Linux, macOS and Windows.

It synchronizes the subtitle by listening to the audio track and that’s how it works the magic. It will work even if the audio track and the subtitle are in different languages. If necessary, it could also be translated but I did not test this feature.

I made a simple test by using a subtitle which was not in synch with the video I was playing. To my surprise, it worked pretty smooth and I got perfectly synched subtitles.

Using SubSync is simple. You start the application and it asks to add the subtitle file and the video file.

![User interface for SubSync][3]

You’ll have to specif the language of the subtitle and the video on the interface. It may download additional assets based on the language in use.

![SubSync may download additional packages for language support][4]

Please keep in mind that it takes some time to synchronize the subtitles, depending on the length of the video and subtitle. You may grab your cup of tea/coffee or beer while you wait for the process to complete.

You can see the synchronization status in progress and even save it before it gets completed.

![SubSync synchronization in progress][5]

Once the synchronization completes, you hit the save button and either save the changes to the original file or save it as a new subtitle file.

![Synchronization completed][6]

I cannot say that it will work in all the cases but it worked for the sample test I ran.

### Installing SubSync

SubSync is a cross-platform application and you can get the installer files for Windows and macOS from its [download page][7].

For Linux users, SubSync is available as a Snap package. If your distribution has Snap support enabled, use the following command to install SubSync:

```
sudo snap install subsync
```

Please keep in mind that it will take some time to download SubSync snap package. So have a good internet connection or plenty of patience.

### In the end

Personally, I am addicted to subtitles. Even if I am watching movies in English on Netflix, I keep the subtitles on. It helps understand each dialogue clearly, specially if there is a strong accent. Without subtitles I could never understand a [word from Mickey O’Neil (played by Brad Pitt) in the movie Snatch][8]. Dags!!

Using SubSync is a lot easier than [using Subtitle Editor][9] for synchronizing subtitles. After [Penguin Subtitle Player][10], this is another great tool for someone like me who searches the entire internet for rare or recommended (mystery) movies from different countries.

If you are a ‘subtitle user’, I have a feeling you would like this tool. If you do use it, please share your experience with it in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/subsync/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/how-to-synchronize-subtitles-with-movie-quick-tip/
[2]: https://subsync.online/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/subsync-interface.png?resize=593%2C280&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/subsync-subtitle-synchronize.png?resize=522%2C189&ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/subsync-subtitle-synchronize-1.png?resize=424%2C278&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/subsync-subtitle-synchronize-2.png?resize=424%2C207&ssl=1
[7]: https://subsync.online/en/download.html
[8]: https://www.youtube.com/watch?v=tGDO-9hfaiI
[9]: https://itsfoss.com/subtitld/
[10]: https://itsfoss.com/penguin-subtitle-player/

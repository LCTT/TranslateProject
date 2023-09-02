[#]: subject: "How to Check VLC Log Files"
[#]: via: "https://itsfoss.com/vlc-check-log/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Check VLC Log Files
======

While watching your favorite videos on VLC, you might encounter issues related to codecs, timestamps, video playback, and a lot more.

But the good news is like you [check the logs of your firewall][1], you can do the same with VLC to trace the root cause of the error.

📋

Unlike Linux, VLC does not save logs automatically, and once closed, all the logs are removed automatically, so you have to save them manually.

So make sure you save or read the log file before closing the VLC player.

### Check and save VLC log files

While it sounds complex, this is the easiest method that not only allows you to save logs but also lets you read them without saving them to a file.

First, go to the `Tools` menu from the top menubar and select choose `Messages`, alternatively, you can also press `Ctrl + M` to save the same effect:

![][2]

And it will show logs related to the currently playing video file.

Here, you have two choices: You can either read logs only or you can save them as well.

Once you click on the `Messages`, you will notice a tab for the **Verbosity** so let's take a look at the effect of multiple verbosity options you have.

  * `Errors`: This will only record the error messages only
  * `Warnings`: It will conclude error and warning messages
  * `Debug`: This level will include errors, warnings, and debug messages



After choosing the appropriate verbosity option, soon you will see logs related to the chosen option.

![][3]

As you can see when I choose the `debug` option, it also included the warning logs.

To save logs, hit the `Save as...` button and it will open the file manager, from there, choose where you can to save the file and give it the appropriate name:

![][4]

And now, you can open the log file using any text editor:

![][5]

From here, you can identify the culprit causing errors.

### More on VLC

Did you know that you can download YouTube videos using VLC or use YouTube links to stream videos without ads?

Well, VLC can do a lot more than that. And if you're interested, check out our detailed [guide on tips to make VLC awesome][6]:

![][7]

Want to [download VLC subtitles automatically][8]? Here's how you do it:

![][7]

I hope you will find this guide helpful.

--------------------------------------------------------------------------------

via: https://itsfoss.com/vlc-check-log/

作者：[Sagar Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lujun9972
[1]: https://learnubuntu.com/check-firewall-logs/
[2]: https://itsfoss.com/content/images/2023/08/Go-to-messages-to-read-logs-in-VLC.png
[3]: https://itsfoss.com/content/images/2023/08/Choose-verbosity-to-capture-different-types-of-logs-1.png
[4]: https://itsfoss.com/content/images/2023/08/Save-VLC-logs-1.png
[5]: https://itsfoss.com/content/images/2023/08/Open-VLC-log-file.png
[6]: https://itsfoss.com/simple-vlc-tips/
[7]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[8]: https://itsfoss.com/download-subtitles-automatically-vlc-media-player-ubuntu/

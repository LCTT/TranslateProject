[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Fixing “VLC is Unable to Open the MRL” Error [Quick Tip])
[#]: via: (https://itsfoss.com/vlc-is-unable-to-open-the-mrl/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Fixing “VLC is Unable to Open the MRL” Error [Quick Tip]
======

One of the [VLC tips][1] is to play YouTube and other online videos with [VLC][2]. This could help you [watch online videos with subtitles][3].

But things may not always be simple because at times you’ll encounter this error when trying to open YouTube video with VLC:

**Your input can’t be opened:
VLC is unable to open the MRL ‘<https://youtubeurl.com’>. Check the log for details.**

![VLC error while playing YouTube videos][4]

The thing here is that Google doesn’t want you to use any third party application for watching YouTube because then they cannot collect data properly.

So, they keep changing stuff from their side to make it harder for third party devs to work with YouTube.

Take [youtube-dl][5] for example. You’ll notice that you cannot [download YouTube videos][6] with it all of a sudden and the simplest solution is to have the latest version of youtube-dl installed.

Same goes for VLC. If you [install the latest VLC in Ubuntu][7] or whichever operating system you are using, you probably won’t see this error.

### Fixing “VLC is unable to open the MRL” error

Let me show you the steps to fix this problem for YouTube at least.

Go to this page and use Ctrl+S to save the file from the official GitHub repository of VLC media player:

[Download youtube.lua file][8]

Now, what you need to do is to replace the youtube.luac (mind the ‘c’ in luac) in lib/vlc/lua/playlist directory with this downloaded file.

#### Steps for Linux

If you are using Linux, open the terminal and use the [locate command][9] to find the exact location of youtube.luac file:

```
locate youtube.luac
```

When you get the path of the file, you just replace that file with your downloaded file. I trust you to handle this simple task.

For me, it showed the path of the file here:

```
[email protected]:~$ locate youtube.lua
/usr/lib/x86_64-linux-gnu/vlc/lua/playlist/youtube.luac
```

So all I did was to move the downloaded file to this location and replace the content of the file:

```
sudo cp ~/Downloads/youtube.lua /usr/lib/x86_64-linux-gnu/vlc/lua/playlist/youtube.luac
```

You should be able to play the YouTube videos in VLC now.

#### Steps for Windows

If you are using Windows, you should follow these steps:

  * Rename the downloaded youtube.lua file to youtube.luac
  * Now copy this file and paste it to C:\Program Files (x86)\VideoLAN\VLC\lua\playlist\



That’s it.

If you have trouble with Dailymotion or other video streaming websites, you can download their respective lua files from the VLC repository [here][10] and replace the existing one in your VLC install.

I hope this quick tip fixed the problem with VLC unable to play YouTube videos for you.

--------------------------------------------------------------------------------

via: https://itsfoss.com/vlc-is-unable-to-open-the-mrl/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/simple-vlc-tips/
[2]: https://www.videolan.org/index.html
[3]: https://itsfoss.com/penguin-subtitle-player/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/vlc_error_input_cant_be_played.png?ssl=1
[5]: https://itsfoss.com/download-youtube-linux/
[6]: https://itsfoss.com/download-youtube-videos-ubuntu/
[7]: https://itsfoss.com/install-latest-vlc/
[8]: https://raw.githubusercontent.com/videolan/vlc/master/share/lua/playlist/youtube.lua
[9]: https://linuxhandbook.com/locate-command/
[10]: https://github.com/videolan/vlc/tree/master/share/lua/playlist

Convert video using Handbrake
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OpenVideo.png?itok=jec9ibU5)

Recently, when my son asked me to digitally convert some old DVDs of his high school basketball games, I immediately knew I would use [Handbrake][1]. It is an open source package that has all the tools necessary to easily convert video into formats that can be played on MacOS, Windows, Linux, iOS, Android, and other platforms.

Handbrake is open source and distributable under the [GPLv2 license][2]. It's easy to install on MacOS, Windows, and Linux, including both [Fedora][3] and [Ubuntu][4]. In Linux, once it's installed, it can be launched from the command line with `$ handbrake` or selected from the graphical user interface. (In my case, that is GNOME 3.)

![](https://opensource.com/sites/default/files/uploads/handbrake_1.png)

Handbrake's menu system is easy to use. Click on **Open Source** to select the video source you want to convert. For my son's basketball videos, that is the DVD drive in my Linux laptop. After inserting the DVD into the drive, the software identifies the contents of the disk.
![](https://opensource.com/sites/default/files/uploads/handbrake_2.png)

As you can see next to Source in the screenshot above, Handbrake recognizes it as a DVD with a 720x480 video in 4:3 aspect ratio, recorded at 29.97 frames per second, with one audio track. The software also previews the video.

If the default conversion settings are acceptable, just press the **Start Encoding** button and (after a period of time, depending on the speed of your processor) the DVD's contents will be converted and saved in the default format, [M4V][5] (which can be changed).

If you don't like the filename, it's easy to change it.

![](https://opensource.com/sites/default/files/uploads/handbrake_3.png)

Handbrake has a variety of output options for format, size, and disposition. For example, it can produce video optimized for YouTube, Vimeo, and other websites, as well as for devices including iPod, iPad, Apple TV, Amazon Fire TV, Roku, PlayStation, and more.

![](https://opensource.com/sites/default/files/uploads/handbrake_4.png)

You can change the video output size in the Dimensions menu tab. Other tabs allow you to apply filters, change video quality and encoding, add or modify an audio track, include subtitles, and modify chapters. The Tags menu tab lets you identify the author, actors, director, release date, and more on the output video file.

![](https://opensource.com/sites/default/files/uploads/handbrake_5.png)

If you want to set Handbrake to produce output for a specific platform, you can use the included presets.

![](https://opensource.com/sites/default/files/uploads/handbrake_6.png)

You can also use the menu options to create your own format, depending on the functionality you want.

Handbrake is an incredibly powerful piece of software, but it's not the only open source video conversion tool out there. Do you have another favorite? If so, please share in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/handbrake

作者：[Don Watkins][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/don-watkins
[1]:https://handbrake.fr/
[2]:https://github.com/HandBrake/HandBrake/blob/master/LICENSE
[3]:https://fedora.pkgs.org/28/rpmfusion-free-x86_64/HandBrake-1.1.0-1.fc28.x86_64.rpm.html
[4]:https://launchpad.net/~stebbins/+archive/ubuntu/handbrake-releases
[5]:https://en.wikipedia.org/wiki/M4V

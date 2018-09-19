translating---geekpi

ScreenCloud: The Screenshot++ App
======
[ScreenCloud][1] is an amazing little app, that you don’t even know you need. The default screenshot procedure on desktop Linux is great (Prt Scr Button) and we even have some[powerful screenshot utilities][2]like [Shutter][3]. But ScreenCloud brings one more really simple yet really convenient feature that I just fell in love with. But before we get into it, let’s catch a little backstory.

I take a lot of screenshots. A lot more than average. Receipts, registration details, development work, screenshots of applications for articles, and lot more. The next thing I do is open a browser, browse to my favorite cloud storage and dump the important ones there so that I can access them on my phone and also across multiple operating systems on my PC. This also allows me to easily share screenshots of the apps that I’m working on with my team.

I had no complaints with this standard procedure of taking screenshots, opening a browser and logging into my cloud and then uploading the screenshots manually, until I came across ScreenCloud.

### ScreenCloud

ScreenCloud is cross-platform utility that provides easy screenshot capture and management along with flexible [cloud backup options][4]. including your own [FTP server][5].

![][6]

ScreenCloud is really streamlined with a lot of attention given to the smaller things. It provides you very easy to remember hotkeys to capture the full screen, the active window or capture an area selected with the mouse.

![][7]Default keyboard shortcuts for ScreenCloud

Once a screenshot is taken, you can either set ScreenCloud to ask what to do with the image or to directly upload it the cloud service of your choice. Even SFTP is supported. Once the screenshot it uploaded, generally within a couple of seconds, the link to the image is automatically copied to the clipboard, which you can easily share.

![][8]

You can also do some basic editing with ScreenCloud. For this, you should have “Save to” set to “Ask me”. This setting is available from the application indicator and is usually set by default. With this, when you take a screenshot, you’ll see the option for editing the file. Here, you can add arrows, text and numbers to the screenshot.

![Editing screenshots with ScreenCloud][9]Editing screenshots with ScreenCloud

### Installing ScreenCloud on Linux

ScreenCloud is available in the [Snap store][10]. So you can easily install it on Ubuntu and other [Snap enabled][11] distros by visiting the [Snap store][12] or by running the following command.

```
sudo snap install screencloud

```

And for Linux distros which can’t install apps through Snap, You can download the AppImage [here][1]. The browse to the download location, right click and open a terminal there. Then run the command below.

```
sudo chmod +x ScreenCloud-v1.4.0-x86_64.AppImage

```

You can then launch the app by double clicking on the downloaded file.

![][13]

### Wrapping up

Is ScreenCloud for everybody? Probably not. Is it better than the default screenshot? Probably yes. See if you’re taking a screenshot of something, then chances are, that it’s probably important or you intend to share it. ScreenCloud makes backing up or sharing that screenshot easier and considerably faster. So yeah, you should give ScreenCloud a try if you want these features.

Your thoughts and comments are always welcome, use the comments section below. And don’t forget to share this article with your friends. Cheers.

--------------------------------------------------------------------------------

via: https://itsfoss.com/screencloud-app/

作者：[Aquil Roshan][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/aquil/
[1]: https://screencloud.net
[2]: https://itsfoss.com/take-screenshot-linux/
[3]: http://shutter-project.org
[4]: https://itsfoss.com/cloud-services-linux/
[5]: https://itsfoss.com/set-ftp-server-linux/
[6]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/screencloud3.jpg
[7]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/screencloud2.jpg
[8]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/ScrenCloud6.jpg
[9]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/editing-with-screencloud.png
[10]: https://snapcraft.io/
[11]: https://itsfoss.com/install-snap-linux/
[12]: https://snapcraft.io/screencloud
[13]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/ScrenCloud4.jpg

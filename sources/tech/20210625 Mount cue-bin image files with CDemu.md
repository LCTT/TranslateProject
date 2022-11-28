[#]: subject: (Mount cue/bin image files with CDemu)
[#]: via: (https://fedoramagazine.org/mount-cue-bin-image-files-with-cdemu/)
[#]: author: (Luca Rastelli https://fedoramagazine.org/author/luca247/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Mount cue/bin image files with CDemu
======

![][1]

Photo by [Cameron Bunney][2] on [Unsplash][3]

The other day I needed to burn a disc. Yeah, I know, some of you might be wondering, “A disc? What’s that?” Others might ask, “Are you really using that archaic media?”

Well, yes I am. I feel there is still something charming about physical things that digital media cannot replace.

I needed to burn a very old game that was comprised of a [cue file][4], some audio tracks in [cda format][5], and a [bin file][6] which stored all the binary content that was indexed by the cue file.

First I tried to use [Brasero][7]. Yeah I know, it’s old but it does the job generally and it fits with the rest of the system, so it’s my choice generally. Unfortunately, this time it was not up to the task. It stated that it had some problems reading the cue file. Then I tried [Xfburn][8] and [K3b][9]. But neither of those worked either. They both detected the bin file but not the cda files.

Next, I searched on the web and I found lots of posts explaining how to burn image files using command line applications. Or how to create [iso images][10] and then write those out to discs. These methods seemed excessively complex for what I wanted to do. Why all that difficulty for a task that should be easy as clicking on a button? Fedora Linux should be about freedom, not about difficulties! Although it can be used by experts, an easy way of doing things is always appreciated.

I had almost surrendered. Then, in a forum post buried under all the suggestions mentioned previously, I found the answer I was looking for – [CDemu][11].

Those familiar with [Daemon Tools][12] may find CDemu to be similar. I find CDemu to be even easier and far less bloated. With CDemu, you can mount cue images with the classic double-click. Sounds easy? Well that’s because it actually is.

CDemu is not present in Fedora Linux’s default repositories. So if you want to try it out, you will have to use the [rok/cdemu][13] Copr repository that is compatible with your version of Fedora Linux.

**Note**: _Copr is not officially supported by Fedora infrastructure. Use packages at your own risk._

Open a terminal and enable the Copr repo by entering the following command.

```
$ sudo dnf copr enable rok/cdemu
```

Then install the daemon and the clients by entering the following commands.

```
$ sudo dnf install cdemu-daemon
$ sudo dnf install cdemu-client
$ sudo dnf install gcdemu
```

Next, enter the following commands to ensure the right kernel module is available and loaded.

```
$ sudo akmods
$ sudo systemctl restart systemd-modules-load.service
```

Now CDemu is installed. To associate it with your CD images, you just need to right-click on a file type that you want to mount with CDemu, select _properties_, and the select _Open with CDemu_. Now, double-clicking on those image types should mount them in Nautilus like a physical drive.

If you need to burn the image (like I did), open Brasero and select _copy disc_.

CDemu can also be run from the command line. But this guide was all about getting easy, right?

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/mount-cue-bin-image-files-with-cdemu/

作者：[Luca Rastelli][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/luca247/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/06/cdemu-816x345.jpg
[2]: https://unsplash.com/@bdbillustrations?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/dvd?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://en.wikipedia.org/wiki/Cue_sheet_(computing)
[5]: https://en.wikipedia.org/wiki/.cda_file
[6]: https://en.wikipedia.org/wiki/Binary_file
[7]: https://en.wikipedia.org/wiki/Brasero_(software)
[8]: https://en.wikipedia.org/wiki/Xfce#Xfburn
[9]: https://en.wikipedia.org/wiki/K3b
[10]: https://en.wikipedia.org/wiki/Optical_disc_image
[11]: https://en.wikipedia.org/wiki/CDemu
[12]: https://en.wikipedia.org/wiki/Daemon_Tools
[13]: https://copr.fedorainfracloud.org/coprs/rok/cdemu/

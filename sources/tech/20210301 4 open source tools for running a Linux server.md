[#]: subject: (4 open source tools for running a Linux server)
[#]: via: (https://opensource.com/article/21/3/linux-server)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

4 open source tools for running a Linux server
======
With Linux, you can turn any device into a server to share data, media
files, and other resources.
![A rack of servers, blue background][1]

In 2021, there are more reasons why people love Linux than ever before. In this series, I'll share 21 different reasons to use Linux. Here are four open source tools for turning any device into a Linux server. 

Sometimes I detect a certain mystique around the idea of a server. Many people, should they have an image in their mind at all, think servers must be big, heavy, rack-mounted machines, carefully maintained by an overly deliberate sysadmin and a group of magical tinker gnomes. Other people envision servers as vaporous clouds that somehow power the internet.

While this reverence is good for IT job security, the reality is that nobody in open source computing believes that servers are or should be the exclusive domain of specialists. File and resource sharing are integral to open source, and open source makes it easier than ever, as these four open source server projects show.

### Samba

The [Samba project][2] is a Windows interoperability suite of programs for Linux and Unix. Although it's mostly low-level code that many users never knowingly interact with, its importance can't be understated. Historically, it was the biggest and most important target back when Microsoft was fighting to eliminate Linux and open source. Times have changed, and Microsoft has met with the Samba team to offer support (for now, at least), and through it all, the project has continued to ensure that Linux and Windows computers can easily co-exist on the same network. In other words, Samba makes it easy to share files over your local network, regardless of what platforms are used.

In the [KDE Plasma][3] desktop, you can right-click on any directory you own and select **Properties**. In the **Properties** dialogue box, click the **Share** tab, and enable **Share with Samba (Microsoft Windows)**.

![Samba][4]

(Seth Kenlon, [CC BY-SA 4.0][5])

Just like that, you've opened a directory for read-only access for users on your local network. That means that when you're home, anyone in your house on the same WiFi network can access that folder, or if you're at work, anyone on your workplace network can access that folder. Of course, to access it, other users need to know where to find it. The path to a computer can be expressed as either an [IP address][6] or, depending on your network configuration, a hostname.

### Snapdrop

If navigating a network through IP addresses and hostnames is confusing, or if you don't like the idea of opening a folder for sharing and forgetting that it's open for perusal, then you might prefer [Snapdrop][7]. This is an open source project that you can run yourself or use the demonstration instance on the internet to connect computers through WebRTC. WebRTC enables peer-to-peer connections through a web browser, meaning that two users on the same network can find each other by navigating to Snapdrop and then communicate with each other directly, without going through an external server.

![Snapdrop][8]

(Seth Kenlon, [CC BY-SA 4.0][5])

Once two or more clients have contacted a Snapdrop service, users can trade files and chat messages back and forth, right over the local network. The transfer is fast, and your data stays local.

### VLC

Streaming services are more common than ever, but I have unconventional tastes in music and movies, so the typical services rarely seem to have what I'm looking for. Fortunately, it's easy to beam my own content around my house from my computer with my big media drive connected to it. For instance, when I want to watch a movie on a screen other than my computer monitor, I can stream the movie file on my network and play it through any app that can receive HTTP, whether that app is on my TV, game console, or mobile.

[VLC][9] makes it easy to set up a stream. In fact, it's an option in the **Media** menu, or you can press **Ctrl**+**S** on your keyboard. Add a file or group of files to your streaming queue, and then click the **Stream** button.

![VLC][10]

(Seth Kenlon, [CC BY-SA 4.0][5])

VLC steps you through a configuration wizard to help you decide what protocol to use when streaming your data. I tend to use HTTP because it's generally available on any device. Once VLC starts playing the file, navigate to the IP address or hostname of the computer playing the file at the port you assigned to the stream (it's 8080 by default when using HTTP), then sit back and enjoy.

### PulseAudio

One of my favorite modern Linux features is [PulseAudio][11]. Pulse has enabled staggering flexibility for audio on Linux, including auto-discoverable local network streaming. The advantage of this feature for me is that I can play podcasts and tech conference videos on my workstation in my office and take that audio with me by streaming it over my mobile. I have perfect audio whether I wander into the kitchen, the lounge, or to the farthest border of my backyard. This ability existed long before PulseAudio, but Pulse makes it as easy as a button click.

Some setup is required. First, you must ensure that the PulseAudio preferences (**paprefs**) package is installed so that you can enable network audio in your PulseAudio configuration.

![PulseAudio][12]

(Seth Kenlon, [CC BY-SA 4.0][5])

In **paprefs**, enable network access to your local sound device, probably without authentication (assuming you trust the other people on your local network), and enable your computer as a **Multicast/RTP sender**. I usually just choose to stream any audio playing through my speakers, but you can create a separate audio device in your Pulse output tab so that you can choose exactly what gets streamed. You have three options here:

  * Stream whatever is playing on your speakers
  * Stream all sound on all outputs
  * Stream only audio you direct to the multicast device (on demand)



Once enabled, your sound streams on your network and can be received by other local Linux devices. It's easy and dynamic audio sharing.

### Sharing more than just code

Linux is about sharing. It's famous on servers because it's great at _serving_. Whether it's serving audio streams, video streams, files, or a great user experience, every Linux computer is a great Linux server.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/linux-server

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rack_server_sysadmin_cloud_520.png?itok=fGmwhf8I (A rack of servers, blue background)
[2]: http://samba.org
[3]: https://opensource.com/article/19/12/linux-kde-plasma
[4]: https://opensource.com/sites/default/files/uploads/samba_0.jpg (Samba)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/article/18/5/how-find-ip-address-linux
[7]: https://github.com/RobinLinus/snapdrop
[8]: https://opensource.com/sites/default/files/uploads/snapdrop.jpg (Snapdrop)
[9]: https://www.videolan.org/index.html
[10]: https://opensource.com/sites/default/files/uploads/vlc-stream.jpg (VLC)
[11]: https://www.freedesktop.org/wiki/Software/PulseAudio/
[12]: https://opensource.com/sites/default/files/uploads/pulse.jpg (PulseAudio)

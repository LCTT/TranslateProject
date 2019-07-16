The First Beta of Haiku is Released After 16 Years of Development
======
There are a number of small operating systems out there that are designed to replicate the past. Haiku is one of those. We will look to see where Haiku came from and what the new release has to offer.

![Haiku OS desktop screenshot][1]Haiku desktop

### What is Haiku?

Haiku’s history begins with the now defunct [Be Inc][2]. Be Inc was founded by former Apple executive [Jean-Louis Gassée][3] after he was ousted by CEO [John Sculley][4]. Gassée wanted to create a new operating system from the ground up. BeOS was created with digital media work in mind and was designed to take advantage of the most modern hardware of the time. Originally, Be Inc attempted to create their own platform encompassing both hardware and software. The result was called the [BeBox][5]. After BeBox failed to sell well, Be turned their attention to BeOS.

In the 1990s, Apple was looking for a new operating system to replace the aging Classic Mac OS. The two contenders were Gassée’s BeOS and Steve Jobs’ NeXTSTEP. In the end, Apple went with NeXTSTEP. Be tried to license BeOS to hardware makers, but [in at least one case][6] Microsoft threatened to revoke a manufacturer’s Windows license if they sold BeOS machines. Eventually, Be Inc was sold to Palm in 2001 for $11 million. BeOS was subsequently discontinued.

Following the news of Palm’s purchase, a number of loyal fans decided they wanted to keep the operating system alive. The original name of the project was OpenBeOS, but was changed to Haiku to avoid infringing on Palm’s trademarks. The name is a reference to reference to the [haikus][7] used as error messages by many of the applications. Haiku is completely written from scratch and is compatible with BeOS.

### Why Haiku?

According to the project’s website, [Haiku][8] “is a fast, efficient, simple to use, easy to learn, and yet very powerful system for computer users of all levels”. Haiku comes with a kernel that have been customized for performance. Like FreeBSD, there is a “single team writing everything from the kernel, drivers, userland services, toolkit, and graphics stack to the included desktop applications and preflets”.

### New Features in Haiku Beta Release

A number of new features have been introduced since the release of Alpha 4.1. (Please note that Haiku is a passion project and all the devs are part-time, so some they can’t spend as much time working on Haiku as they would like.)

![Haiku OS software][9]
HaikuDepot, Haiku’s package manager

One of the biggest features is the inclusion of a complete package management system. HaikuDepot allows you to sort through many applications. Many are built specifically for Haiku, but a number have been ported to the platform, such as [LibreOffice][10], [Otter Browser][11], and [Calligra][12]. Interestingly, each Haiku package is [“a special type of compressed filesystem image, which is ‘mounted’ upon installation”][13]. There is also a command line interface for package management named `pkgman`.

Another big feature is an upgraded browser. Haiku was able to hire a developer to work full-time for a year to improve the performance of WebPositive, the built-in browser. This included an update to a newer version of WebKit. WebPositive will now play Youtube videos properly.

![Haiku OS WebPositive browser][14]
WebPositive, Haiku’s built-in browser

Other features include:

  * A completely rewritten network preflet
  * User interface cleanup
  * Media subsystem improvements, including better streaming support, HDA driver improvements, and FFmpeg decoder plugin improvements
  * Native RemoteDesktop improved
  * Add EFI bootloader and GPT support
  * Updated Ethernet & WiFi drivers
  * Updated filesystem drivers
  * General system stabilization
  * Experimental Bluetooth stack



### Thoughts on Haiku OS

I have been following Haiku for many years. I’ve installed and played with the nightly builds a dozen times over the last couple of years. I even took some time to start learning one of its programming languages, so that I could write apps. But I got busy with other things.

I’m very conflicted about it. I like Haiku because it is a neat non-Linux project, but it is only just getting features that everyone else takes for granted, like a package manager.

If you’ve got a couple of minutes, download the [ISO][15] and install it on the virtual machine of your choice. You just might like it.

Have you ever used Haiku or BeOS? If so, what are your favorite features? Let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][16].

--------------------------------------------------------------------------------

via: https://itsfoss.com/haiku-os-release/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/10/haiku.jpg
[2]: https://en.wikipedia.org/wiki/Be_Inc.
[3]: https://en.wikipedia.org/wiki/Jean-Louis_Gass%C3%A9e
[4]: https://en.wikipedia.org/wiki/John_Sculley
[5]: https://en.wikipedia.org/wiki/BeBox
[6]: https://birdhouse.org/beos/byte/30-bootloader/
[7]: https://en.wikipedia.org/wiki/Haiku
[8]: https://www.haiku-os.org/about/
[9]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/10/haiku-depot.png
[10]: https://www.libreoffice.org/
[11]: https://itsfoss.com/otter-browser-review/
[12]: https://www.calligra.org/
[13]: https://www.haiku-os.org/get-haiku/release-notes/
[14]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/10/webpositive.jpg
[15]: https://www.haiku-os.org/get-haiku
[16]: http://reddit.com/r/linuxusersgroup

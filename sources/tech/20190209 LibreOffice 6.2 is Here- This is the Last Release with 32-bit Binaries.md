[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (LibreOffice 6.2 is Here: This is the Last Release with 32-bit Binaries)
[#]: via: (https://itsfoss.com/libreoffice-drops-32-bit-support/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

LibreOffice 6.2 is Here: This is the Last Release with 32-bit Binaries
======

LibreOffice is my favorite office suite as a free and powerful [alternative to Microsoft Office tools on Linux][1]. Even when I use my Windows machine – I prefer to have LibreOffice installed instead of Microsoft Office tools any day.

Now, with the recent [LibreOffice][2] 6.2 update, there’s a lot of good stuff to talk about along with a bad news.

### What’s New in LibreOffice 6.2?

Let’s have a quick look at the major new features in the [latest release of LibreOffice][3].

If you like Linux videos, don’t forget to [subscribe to our YouTube channel][4] as well.

#### The new NotebookBar

![][5]

A new addition to the interface that is optional and not enabled by default. In order to enable it, go to **View - > User Interface -> Tabbed**.

You can either set it as a tabbed layout or a grouped compact layout.

While it is not something that is mind blowing – but it still counts as a significant user interface update considering a variety of user preferences.

#### Icon Theme

![][6]

A new set of icons is now available to choose from. I will definitely utilize the new set of icons – they look good!

#### Platform Compatibility

With the new update, the compatibility has been improved across all the platforms (Mac, Windows, and Linux).

#### Performance Improvements

This shouldn’t concern you if you didn’t have any issues. But, still, the better they work on this – it is a win-win for all.

They have removed unnecessary animations, worked on latency reduction, avoided repeated re-layout, and more such things to improve the performance.

#### More fixes and improvements

A lot of bugs have been fixed in this new update along with little tweaks here and there for all the tools (Writer, Calc, Draw, Impress).

To get to know all the technical details, you should check out their [release notes.
][7]

### The Sad News: Dropping the support for 32-bit binaries

Of course, this is not a feature. But, this was bound to happen – because it was anticipated a few months ago. LibreOffice will no more provide 32-bit binary releases.

This is inevitable. [Ubuntu has dropped 32-bit support][8]. Many other Linux distributions have also stopped supporting 32-bit processors. The number of [Linux distributions still supporting a 32-bit architecture][9] is fast dwindling.

For the future versions of LibreOffice on 32-bit systems, you’ll have to rely on your distribution to provide it to you. You cannot download the binaries anymore.

### Installing LibreOffice 6.2

![][10]

Your Linux distribution should be providing this update sooner or later.

Arch-based Linux users should be getting it already while Ubuntu and Debian users would have to wait a bit longer.

If you cannot wait, you should download it and [install it from the deb file][11]. Do remove the existing LibreOffice install before using the DEB file.

[Download LibreOffice 6.2][12]

If you don’t want to use the deb file, you may use the official PPA should provide you LibreOffice 6.2 before Ubuntu (it doesn’t have 6.2 release at the moment). It will update your existing LibreOffice install.

```
sudo add-apt-repository ppa:libreoffice/ppa
sudo apt update
sudo apt install libreoffice
```

### Wrapping Up

LibreOffice 6.2 is definitely a major step up to keep it as a better alternative to Microsoft Office for Linux users.

Do you happen to use LibreOffice? Do these updates matter to you? Let us know in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/libreoffice-drops-32-bit-support/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-free-open-source-alternatives-microsoft-office/
[2]: https://www.libreoffice.org/
[3]: https://itsfoss.com/libreoffice-6-0-released/
[4]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/libreoffice-tabbed.png?resize=800%2C434&ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/Libreoffice-style-elementary.png?ssl=1
[7]: https://wiki.documentfoundation.org/ReleaseNotes/6.2
[8]: https://itsfoss.com/ubuntu-drops-32-bit-desktop/
[9]: https://itsfoss.com/32-bit-os-list/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/libre-office-6-2-release.png?resize=800%2C450&ssl=1
[11]: https://itsfoss.com/install-deb-files-ubuntu/
[12]: https://www.libreoffice.org/download/download/

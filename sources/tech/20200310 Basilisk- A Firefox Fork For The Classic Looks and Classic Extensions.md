[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Basilisk: A Firefox Fork For The Classic Looks and Classic Extensions)
[#]: via: (https://itsfoss.com/basilisk-browser/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Basilisk: A Firefox Fork For The Classic Looks and Classic Extensions
======

_**Brief: Basilisk is a Firefox fork that supports legacy extensions and much more. Here, we take a look at its features and try it out.**_

### Basilisk: Open Source XUL-Based Web Browser

Even though it is better to stick with the regular web browsers like Firefox or Chromium available for Linux – it doesn’t hurt to know about other browsers. Recently, I stumbled upon a Firefox fork, [Basilisk][1] web browser that features the classic Firefox user interface along with legacy add-ons support (just like [Waterfox][2]).

![itsfoss.com homepage on Basilisk][3]

If you are in the dire need of using a legacy extensions or miss the classic look and feel of Firefox, the Basilisk web browser can save your day. The web browser is being maintained by the team behind [Pale Moon][4] browser (which is another Firefox fork I will be looking at next).

If you’re looking for open-source [Chrome alternatives][5], you may have a quick look at what Basilisk offers.

**Note:** _Basilisk is a development software. Even though I didn’t have any major usability issues for the time I used, you should not rely on it as the only browser to use._

### Features of Basilisk web browser

![][6]

Basilisk works out of the box. However, here are some features you might want to take a look before considering to use it:

  * [XUL][7]-based web browser
  * It features the ‘Australis’ Firefox interface, which was quite popular back in the time of v29 – v56 Firefox version.
  * [NPAPI][8] plugins supported (Flash, Unity, Java, etc.)
  * Support for XUL/Overlay Mozilla-style extensions.
  * Uses [Goanna][9] open-source browser engine which is a fork of Mozilla’s [Gecko][10]
  * Does not use Rust or the Photon user interface
  * Supports 64-bit systems only



### Installing Basilisk on Linux

You may not find it listed in your Software Center. So, you will have to head to its official [download page][11] to get the tarball (tar.xz) file.

Once you download it, simply extract it and head inside the folders. Next, you will find a “**Basilisk**” executable file in it. You need to simply run it by double-clicking on it or performing a right-click and selecting “**Run**“.

You may check out its [GitHub page][12] for more information.

![][13]

You can also use the terminal and run the file by following the steps below while navigating to the directory you downloaded it to:

```
cd basilisk-latest.linux64
cd basilisk
./basilisk
```

[Download Basilisk][1]

### Using Basilisk browser

![][14]

Basilisk is a decent Firefox fork if you want the legacy extensions support. It is being actively developed by the team behind Pale Moon and is potentially a great option for users who want the classic look and feel of Mozilla’s Firefox (before the Quantum update) without comprising on the modern web support.

I didn’t have any issues with browsing webpages. However, I did notice that “**YouTube**” detects this as an obsolete browser and warns that it will stop supporting it soon enough.

_**So, I’m not sure if Basilisk will be a fit for every web service out there – but if you really need the archived legacy extensions that you used on Firefox’s older releases, this could be a solution for your problem.**_

**Wrapping Up**

Do you think a Firefox fork is worth trying out? What do you prefer? Share your thoughts in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/basilisk-browser/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://www.basilisk-browser.org/
[2]: https://itsfoss.com/waterfox-browser/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/basilisk-itsfoss.jpg?ssl=1
[4]: https://www.palemoon.org
[5]: https://itsfoss.com/open-source-browsers-linux/
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/basilisk-options-1.jpg?ssl=1
[7]: https://developer.mozilla.org/en-US/docs/Archive/Mozilla/XUL
[8]: https://wiki.mozilla.org/NPAPI
[9]: https://en.wikipedia.org/wiki/Goanna_(software)
[10]: https://developer.mozilla.org/en-US/docs/Mozilla/Gecko
[11]: https://www.basilisk-browser.org/download.shtml
[12]: https://github.com/MoonchildProductions/Basilisk
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/basilisk-folder-1.jpg?ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/basilisk-browser-1.jpg?ssl=1

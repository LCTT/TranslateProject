[#]: subject: "qBittorrent 4.6.0 Release Adds Experimental I2P Support for a More Private Experience"
[#]: via: "https://news.itsfoss.com/qbittorrent-4-6-0/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

qBittorrent 4.6.0 Release Adds Experimental I2P Support for a More Private Experience
======
qBittorrent 4.6.0 makes it a privacy-focused upgrade with its initial
I2P support and other useful improvements.
qBittorrent is **a popular cross-platform, open-source BitTorrent client** written in native C++ that also leverages the Qt 6 toolkit for providing a **no-nonsense torrenting experience**.

qBittorrent is also one of the [best torrent clients for Ubuntu][1]. I have personally used it for quite a few years to source things such as distro ISOs and other official software torrents.

Now, a new release has arrived in the form of **qBittorrent 4.6.0** , I am excited to see what this release has to offer.

Join me as I take you through this expansive release.

**Suggested Read** 📖

![][2]

## 🆕 qBittorrent 4.6.0: What's New?

![][3]

This release of qBittorrent seems to focus on the security and visual side of things, even though there were plenty of other changes with this release, we are focusing on the highlights.

Some key ones include:

  * **Experimental I2P Support**
  * **Visual Improvements**
  * **Better RSS Support**
  * **A Security Notice**



### Experimental I2P Support

Finally, qBittorrent has support for I2P. This was **a long-awaited feature** that many had requested. Even though it has been implemented in an experimental fashion, future releases should be better.

For those who are not familiar, [**I2P**][4] is short for the “ **Invisible Internet Project** ”. It is a fully encrypted private network layer that enhances the privacy of a user by using **encrypted unidirectional tunnels** between the user and their peers to transfer data.

In doing so, it **also hides the activity** and **location of the user** , in turn preventing third parties from snooping in or even blocking access.

If all the above tech jargon is too much, then take I2P as **a feature that hides your internet traffic on peer-to-peer networks** , preventing anyone from tracking or blocking you.

### Visual Improvements

![][5]

qBittorrent now features **UI editor support for the default theme** , with various UI theming improvements across the board.

They also allowed the **use of other icons in dark mode** , with **a new tag editing dialog for torrents**.

Furthermore, **a new torrent list filter** was added to sort torrents by 'save path', and an option to **add new torrents to the top of the queue**.

### Better RSS Support

![][6]

Many improvements for RSS feed has also arrived with qBittorrent 4.6.0. So, things such as **allowing the editing of an RSS feed URL** , **a new “Add Tags” field for RSS rules** under Web UI, and **a “Rename rule” button for RSS Downloader** were added.

### A Security Notice

![][7]

The developers of qBittorrent have also issued an important security notice for users of Web UI. They mention the following:

> WebUI users YOU MUST change the default Webui credentials (aka "adminadmin") when exposing the WebUI to the Internet.

> There are reports([1][8], [2][9], [3][10], [4][11]) that this is possibly exploited in the wild. This will be remedied in a followup release where the default credentials will be disabled and a credentials change will be forced.

I highly suggest you heed their warning, as this could result in some pretty gnarly security breaches.

### 🛠️ Other Changes

The above-mentioned just about sums up the highlights of this release. As for the rest, here are some notable ones:

  * A new shortcut was added for the “Ban peer permanently” function.
  * Revamped “Watched folder options” and “Automated RSS downloader” dialogs.
  * New options were added for configuring the behavior of merging trackers into an existing torrent.
  * On the Windows side, only Windows 10 and later will be supported from this release onwards.
  * macOS builds are now self-signed in a bid to help with the permissions dialogs.



You can go through the [official release notes][12] to dive deeper.

## 📥 Download qBittorrent 4.6.0

You can grab the package of your choice from the [official website][13], it is being offered for **Linux** , **Windows** , and **macOS**.

[qBittorent 4.6.0][13]

_💬 What do you think about the latest release? Share your thoughts in the comments below._

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/qbittorrent-4-6-0/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-torrent-ubuntu/
[2]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[3]: https://news.itsfoss.com/content/images/2023/10/qBittorrent_4.6.0_1.png
[4]: https://geti2p.net/en/
[5]: https://news.itsfoss.com/content/images/2023/10/qBittorrent_4.6.0_2.png
[6]: https://news.itsfoss.com/content/images/2023/10/qBittorrent_4.6.0_3.png
[7]: https://news.itsfoss.com/content/images/2023/10/qBittorrent_4.6.0_4.png
[8]: https://github.com/qbittorrent/qBittorrent/issues/13833
[9]: https://github.com/qbittorrent/qBittorrent/issues/18731
[10]: https://github.com/qbittorrent/qBittorrent/issues/16529
[11]: https://github.com/qbittorrent/qBittorrent/issues/19738
[12]: https://www.qbittorrent.org/news
[13]: https://www.qbittorrent.org/download

[#]: subject: "Warp: An Open-Source Secure File Sharing App That Works Cross-Platform"
[#]: via: "https://news.itsfoss.com/warp-file-sharing/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Warp: An Open-Source Secure File Sharing App That Works Cross-Platform
======
A seamless way to securely share files between Linux and Windows? Try
this out!
In our adventure with [First Look][1] series of articles, we found a secure and efficient method of transferring files between Linux and Windows systems.

A tool called ' **Warp** ', a part of [**GNOME Circle**][2] featuring apps that extend the GNOME ecosystem. Warp facilitates the seamless transfer of files via the Internet or across a local network.

Let's take a look at it.

### Warp: Overview ⭐

![][3]

Written primarily in the **Rust programming language** , Warp is a **GTK-based** file transfer app that uses the '[Magic Wormhole][4]' protocol to make file transfers over the internet/local networks possible.

All file transfers are encrypted, and the receiver must **use a word-based code to access the files** , preventing any misuse.

**Allow me to show you how it works.**

When you launch the app for the first time, you are greeted with a welcome screen and a short intro to Warp.

![][5]

After proceeding, you are taken to the 'Send' menu, where you can select a file or folder to be sent.

📋

You can also drag/drop files and folders into the app.

![][6]

After processing, a screen will show up with the transfer code in text and QR code form. You have to send it securely to the receiver, and they can start downloading the files.

📋

As Warp is a **cross-platform app** , you can send files to and from Linux and Windows systems.

**Suggested Read** 📖

![][7]

![][8]

**So, how does it look on the receiver's side?**

Well, they must go into the ' **Receive** ' menu and paste the transmit code into the text box. They can also scan the QR code to copy the exact text onto their device.

![][9]

After they paste the code and click on ' **Receive File** ,' Warp will start connecting to the sender's device.

![][10]

If it is successful, you will be shown a ' **Connected to Peer** ' status. If not, something is wrong with the sender's or receiver's system/network.

![][11]

After a successful connection, the receiver can either choose ' **Accept** ' to save it to the ' **Downloads** ' folder of the system, or they can select ' **Save as** ' to save it in a location of their choice.

**Suggested Read** 📖

![][7]

![][12]

And that's it. The receiver will be shown the following screen when a file transfer is complete:

![][13]

Users can also go into the ' **Preferences** ' menu under the three-ribbon icon to access advanced settings such as **setting the Rendezvous/Transit Server URL** or **setting the Code Words to a longer word count** for enhanced security.

![][14]

That's about it for Warp; it is **effortless and does the job well**.

**Learn Rust Programming** 📖

![][15]

### 📥 Get Warp

Warp is available both for **Linux** and **Windows;** You can get the package of your choice or look at the source code on its [GitLab page][16].

**For Linux users,** you can get it from [Flathub][17].

[Warp (Flathub)][17]

* * *

### More from It's FOSS...

  * Learn Bash scripting for FREE with this [Bash Tutorial series][18].
  * Join our [community forum][19].
  * 📩 Stay updated with the latest on Linux and Open Source. Get our [weekly Newsletter][20].



--------------------------------------------------------------------------------

via: https://news.itsfoss.com/warp-file-sharing/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/tag/first-look/
[2]: https://circle.gnome.org/?ref=news.itsfoss.com
[3]: https://news.itsfoss.com/content/images/2023/06/Warp_X.jpg
[4]: https://github.com/magic-wormhole/magic-wormhole?ref=news.itsfoss.com#magic-wormhole
[5]: https://news.itsfoss.com/content/images/2023/06/Warp_1.jpg
[6]: https://news.itsfoss.com/content/images/2023/06/Warp_2.jpg
[7]: https://news.itsfoss.com/content/images/size/w256h256/2022/08/android-chrome-192x192.png
[8]: https://news.itsfoss.com/content/images/2023/06/Warp_3.jpg
[9]: https://news.itsfoss.com/content/images/2023/06/Warp_4-1.jpg
[10]: https://news.itsfoss.com/content/images/2023/06/Warp_5.jpg
[11]: https://news.itsfoss.com/content/images/2023/06/Warp_6.jpg
[12]: https://news.itsfoss.com/content/images/2023/06/Warp_7.jpg
[13]: https://news.itsfoss.com/content/images/2023/06/Warp_8.jpg
[14]: https://news.itsfoss.com/content/images/2023/06/Warp_9.jpg
[15]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[16]: https://gitlab.gnome.org/World/warp?ref=news.itsfoss.com
[17]: https://flathub.org/apps/app.drey.Warp?ref=news.itsfoss.com
[18]: https://linuxhandbook.com/tag/bash-beginner/
[19]: https://itsfoss.community/
[20]: https://itsfoss.com/newsletter/

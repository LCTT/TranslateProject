[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (CopyQ Clipboard Manager for Keeping a Track of Clipboard History)
[#]: via: (https://itsfoss.com/copyq-clipboard-manager/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

CopyQ Clipboard Manager for Keeping a Track of Clipboard History
======

How do you copy-paste text? Let me guess. You either use the right click menu to copy-paste or use Ctrl+C to copy a text and Ctrl+V to paste the text. The text copied this way is saved to ‘clipboard’. The [clipboard][1] is a special location in the memory of your system that stores cut or copied text (and in some cases images).

But have you ever been in a situation where you had a text copied and then you copy another text and then realize you needed the text you copied earlier? Trust me, it happens a lot.

Instead of wondering about finding the previous text to copy again, you can use a clipboard manager.

A clipboard manager is a handy little tool that keeps a history of the text you had copied. If you need to use the earlier copied text, you can use the clipboard manager to copy it again.

![Clipboard][2]

There are several clipboard managers available for Linux. In this article, I’ll cover one such tool that goes by the name CopyQ.

### CopyQ Clipboard Manager

[CopyQ][3] is nifty clipboard manager that has plenty of features to manage your system’s clipboard. It is an open source software available for free for major Linux distributions.

Like any other clipboard manager, CopyQ monitors the system clipboard and saves its content. It can save both text and images from the clipboard.

CopyQ sits in the system tray and you can easily access it from there. From the system tray, just click on the text that you want. It will automatically copy this text and you would notice that the copied text moves on to the top of the saved clipboards.

![][4]

In the system tray, it shows only the five recent clips. You can open the main window using the “Show/hide main window” option in the system tray. CopyQ saves up to 200 clips. You may edit the clipboard items here.

![][5]

You may also set a keyboard shortcut to bring the clipboard with a few key combination. This option is available in Preferences-&gt;Shortcuts.

![][6]

If you decide to use it, I advise enabling the autostart so that CopyQ runs automatically when you start your system. By default, it saves 200 items in the history and that’s a lot in my opinion. You may want to change that as well.

![][7]

CopyQ is an advanced clipboard manager with plenty of additional features. You can search for text in the saved clipboard items. You can sort, create, edit or change the order of the clipboard items.

You can ignore clipboard copied from some windows or containing some text. You can also temporarily disable clipboard saving. CopyQ also supports [Vim][8]-like editor and shortcut for Vim fans.

There are many more features that you may explore on your own. For me, the most notable feature is that it gives me easy access to older copied text, and I am happy with that.

### Installing CopyQ on Linux

CopyQ is available for Linux, Windows and macOS. You can get the executable file for Windows and macOS [from its website][3].

For Linux, CopyQ is available in the repositories of all major Linux distributions. Which means that you can find it in your software center or install it using your distribution’s package manager.

Ubuntu users may find it in the software center if [universe repository is enabled][9].

![CopyQ in Ubuntu Software Center][10]

Alternatively, you can use the apt command to install it:

```
sudo apt install copyq
```

Ubuntu users also have the option to [use the official PPA][11] and always get the latest stable CopyQ version. For example, at the time of writing this article, CopyQ version in Ubuntu 20.04 is 3.10 while [PPA has newer version][12] 3.11. It’s your choice really.

```
sudo add-apt-repository ppa:hluk/copyq
sudo apt update
sudo apt install copyq
```

You may also want to know [how to remove PPA][13] later.

### Do you use a clipboard manager?

I find it surprising that many people are not even aware of an essential utility like clipboard manager. For me, it’s one of the [essential productivity tools on Linux][14].

As I mentioned at the beginning of the article, there are several clipboard managers available for Linux. CopyQ is one of such tools. Do you use or know of some other similar clipboard tool? Why not let us know in the comments?

If you started using CopyQ after reading this article, do share your experience with it. What you liked and what you didn’t like? The comment section is all yours.

--------------------------------------------------------------------------------

via: https://itsfoss.com/copyq-clipboard-manager/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.computerhope.com/jargon/c/clipboar.htm
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/clipboard.png?ssl=1
[3]: https://hluk.github.io/CopyQ/
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/copyq-system-tray.png?ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/copyq-main-window.png?ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/copyq-shortcuts.png?ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/copyq-auto-start.png?ssl=1
[8]: https://itsfoss.com/vim-8-release-install/
[9]: https://itsfoss.com/ubuntu-repositories/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/copyq-software-center.png?resize=800%2C474&ssl=1
[11]: https://itsfoss.com/ppa-guide/
[12]: https://launchpad.net/~hluk/+archive/ubuntu/copyq
[13]: https://itsfoss.com/how-to-remove-or-delete-ppas-quick-tip/
[14]: https://itsfoss.com/productivity-tips-ubuntu/

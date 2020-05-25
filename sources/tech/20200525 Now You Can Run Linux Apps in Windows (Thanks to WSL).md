[#]: collector: (lujun9972)
[#]: translator: (lnrCoder)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Now You Can Run Linux Apps in Windows (Thanks to WSL))
[#]: via: (https://itsfoss.com/run-linux-apps-windows-wsl/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Now You Can Run Linux Apps in Windows (Thanks to WSL)
======

Microsoft’s recent “[Build 2020][1]” developer conference involved some interesting announcements. I’m not sure if it’s something to be excited about or skeptical about — but Microsoft you have our attention now more than ever.

And, among all the announcements, the ability to run GUI apps on WSL (Windows Subsystem for Linux) gained the spotlight.

Not to forget the [fiasco with Xamrin.Forms rebranding as MAUI][2] which conflicts with an existing open-source project ([Maui Project][3]) by Uri Herrera of [Nitrux Linux.][4]

In case you didn’t know, WSL is an environment that lets you have a console-only Linux experience from within Windows 10. It is also one of the [best ways to run Linux commands in Windows.][5]

While the announcement through a blog post ([DirectX ❤ Linux][6]) may have been a PR bait as [Liam Dawe thinks][7]. But, it’s still something worth talking about.

### Support for Linux GUI Apps On WSL

![][8]

Recently, Microsoft announced a bunch of new features coming to WSL (a.k.a. WSL 2) during the online developer conference.

The introduction of [Windows Package Manager][9], [Windows Terminal 1.0][10], and a couple others were some its highlights.

But, the support for GPU hardware acceleration to **Windows Subsystem for Linux 2** was something significant.

So, does this mean that you can run Linux apps on Windows using WSL? Looks like it…

Microsoft plans to make it happen using a brand-new Linux kernel driver **dxgkrnl**. To give you a technical brief, I’d quote the description from their announcement here:

![Linux Kernel Driver Wsl][11]

> Dxgkrnl is a brand-new kernel driver for Linux that exposes the **/dev/dxg** device to user mode Linux. **/dev/dxg** exposes a set of IOCTL that closely mimic the native WDDM D3DKMT kernel service layer on Windows. Dxgkrnl inside the Linux kernel connects over the VM Bus to its big brother on the Windows host and uses this VM bus connection to communicate with the physical GPU.

I’m no expert here but it means that the **Linux applications on WSL will have the same access to the GPU as native Windows applications do**.

The support for GUI apps will be coming later this fall (not with May 2020 update) — so we’ll have to see when that happens.

Microsoft is specifically targeting the developers who want the comfort of using their Linux IDE on Windows. Google is also targeting the same user base by [bringing GUI Linux apps to Chromebook][12].

Well, that’s good news for users who want to stick with Windows. But, is it really?

### Microsoft Loves Linux — Do They Really?

![Microsoft Loves Linux][13]

It is definitely a good thing that they are embracing Linux and its benefits through their efforts of incorporating a Linux environment on Windows.

But, how is it really going to help the **desktop Linux users**? I don’t see any real-word benefits from it as of now.

You’re free to have a different opinion here. But, I think there’s no real value to the desktop users of Linux through the development of WSL. At least, none so far.

It was interesting to notice that someone on [Linux Unplugged podcast][14] highlighted Microsoft’s move as something in the line of EEE (Embrace, extend, and extinguish) for which they’re known for.

Maybe, who knows? Of course, the effort they’ve put to pull this off is worth appreciating — but it’s exciting and mystifying at the same time.

### Does this mean Windows users will no longer switch to Linux?

The reason why Microsoft is embracing Linux on its platform is that they know what it’s capable of and why developers (or users) prefer using.

But, with the updates to WSL 2, I tend to agree to what Abhishek thinks if this continues:

> Eventually, desktop Linux will be confined to become a desktop application under Windows…

Well, of course, the native experience is still superior for the time being. And, it’ll be rare to see that the existing Linux desktop users will use Windows over it. But, that’s still something to worry about.

What do you think about all this? I’m not ruling the advantages of WSL for users forced to use Windows — but do you think Microsoft’s progress with WSL is going to be something hostile in nature or something that will help Linux in the long run?

Let me know your thoughts in the comments!

--------------------------------------------------------------------------------

via: https://itsfoss.com/run-linux-apps-windows-wsl/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[lnrCoder](https://github.com/lnrCoder)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.microsoft.com/build2020/
[2]: https://itsfoss.com/microsoft-maui-kde-row/
[3]: https://mauikit.org/
[4]: https://itsfoss.com/nitrux-linux/
[5]: https://itsfoss.com/run-linux-commands-in-windows/
[6]: https://devblogs.microsoft.com/directx/directx-heart-linux/
[7]: https://www.gamingonlinux.com/2020/05/microsoft-build-directx-and-linux-plus-more
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/Linux-GUI-app-Windows-WSL.png?ssl=1
[9]: https://devblogs.microsoft.com/commandline/windows-package-manager-preview/
[10]: https://devblogs.microsoft.com/commandline/windows-terminal-1-0/
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/linux-kernel-driver-wsl.png?ssl=1
[12]: https://itsfoss.com/linux-apps-chromebook/
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/microsoft-loves-linux.jpg?ssl=1
[14]: https://linuxunplugged.com/354

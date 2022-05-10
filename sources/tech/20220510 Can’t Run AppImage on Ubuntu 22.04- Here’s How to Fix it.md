[#]: subject: "Can’t Run AppImage on Ubuntu 22.04? Here’s How to Fix it"
[#]: via: "https://itsfoss.com/cant-run-appimage-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Can’t Run AppImage on Ubuntu 22.04? Here’s How to Fix it
======

The recently released [Ubuntu 22.04 LTS is full of new visual changes and features][1].

But like any other release, it has its share of bugs and issues.

One of the unpleasant surprises I got in Ubuntu 22.04 was with the AppImage applications.

Even with all the right permissions, AppImage applications just refused to launch in my newly installed Ubuntu 22.04 system.

If you face a similar situation, I have good news for you. The fix is quite simple.

### Running AppImage applications in Ubuntu 22.04 LTS

The problem here is that Ubuntu 22.04 is missing the [FUSE (Filesystem in Userspace) library][2]. This FUSE library provides an interface for userspace programs to export a virtual filesystem to the Linux kernel.

That’s [how the AppImage works][3]; on virtual filesystems. Since this crucial library is missing, AppImage doesn’t work as expected.

Now that you understand the root cause of the issue let’s see how to make it work.

#### Step 1: Install libfuse

Open the terminal in Ubuntu and use the following command to install the FUSE library support:

```
sudo apt install libfuse2
```

If you are new to the terminal stuff, here’s what you need to know. It will ask you to enter the sudo password. That’s your account password, actually. And **when you type the password, nothing is displayed on the screen**. That’s by design. Just keep on typing the password and enter.

![Install libfuse2 in Ubuntu][4]

#### Step 2: Make sure AppImage files have correct file permissions

This one goes without saying. You need to have ‘execute’ permission on the downloaded AppImage file of an application.

Go to the folder where you have downloaded the desired application’s AppImage file. **Right-click** on it and **select Properties**.

Now go to the **Permissions tab** and check the “**Allow executing file as program**” option.

![give execute permission to AppImage file][5]

With that set, you are good to go. Just double-click the file now, and it should run the application as intended.

This little step of getting libfuse is on my [list of recommended things to do after installing Ubuntu 22.04][6].

#### Further troubleshooting tips

Your AppImage file is still not running? It may happen that the AppImage you have downloaded has some other issues that stop it from running.

One way to check it would be to download a known application like [Balena Etcher][7] and see if its AppImage file works or not. If this one works, then the AppImage file you downloaded for the other application is not good. You can dig deeper by running the AppImage file from the terminal and analyzing the error it shows.

#### Does it work for you?

Go ahead and try it. If it works, drop me a thank you note. If it still doesn’t, mention the details in the comment sections and I’ll try to help you out.

--------------------------------------------------------------------------------

via: https://itsfoss.com/cant-run-appimage-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/ubuntu-22-04-release-features/
[2]: https://packages.debian.org/sid/libfuse2
[3]: https://itsfoss.com/use-appimage-linux/
[4]: https://itsfoss.com/wp-content/uploads/2022/05/install-libfuse2-ubuntu.png
[5]: https://itsfoss.com/wp-content/uploads/2022/05/give-execute-permission-to-appimage-file-800x415.png
[6]: https://itsfoss.com/things-to-do-after-installing-ubuntu-22-04/
[7]: https://www.balena.io/etcher/

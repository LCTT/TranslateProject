[#]: subject: (How to Install VLC on Fedora Linux)
[#]: via: (https://itsfoss.com/install-vlc-fedora/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to Install VLC on Fedora Linux
======

If you have just installed Fedora and now wants to install your favorite video player VLC on it, you probably won’t find it in the software center. Not immediately, at least.

For reasons best known to their developers, Fedora neither ship with [VLC][1] nor does it include in the official Fedora repository.

So, how do you install VLC on Fedora then? Simple. RPM Fusion is your friend here. Let me show you the steps in detail.

### Installing VLC on Fedora Linux

Using the command line will be easier here. You may use the graphical method as well. I’ll discuss it later.

Open a terminal and use the following command to add and enable RPM Fusion repository that contains the VLC package:

```
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
```

Press Y when asked to confirm adding the new repo. Next, install VLC using DNF command:

```
sudo dnf install vlc
```

It will install VLC in Fedora from the RPM Fusion repository and a few additional dependencies from various repositories.

![Installing VLC in Fedora with DNF command][2]

Once installed, you can search for VLC in the application menu or search for it in the “activities area”.

![Search for VLC][3]

Click on it, start it and enjoy it.

#### Alternate method: Installing VLC from software center

When you have enabled RPM Fusion repository, you can display the applications from this repo in the software center. To do that, use the following command in the terminal:

```
sudo dnf groupupdate core
```

After that, open software center and search for VLC and install from there.

![VLC in Fedora software center][4]

If you have added FlatHub repository, please avoid installing the Flatpak version of VLC because it is around 1 GB in size. The RPM version is a lot smaller in size.

I hope you find this quick tutorial helpful in installing VLC on Fedora. Enjoy.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-vlc-fedora/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.videolan.org/
[2]: https://itsfoss.com/wp-content/uploads/2021/07/installing-vlc-fedora-800x422.webp
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/07/vlc-fedora.png?resize=799%2C223&ssl=1
[4]: https://itsfoss.com/wp-content/uploads/2021/07/vlc-in-fedora-software-center-800x486.webp

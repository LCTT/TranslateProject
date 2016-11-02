How to Use Old Xorg Apps in Unity 8 on Ubuntu 16.10
====

![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/unity8-feature-image.jpg "How to Use Old Xorg Apps in Unity 8 on Ubuntu 16.10s")

With the release of Ubuntu 16.10, Unity 8 has been getting more attention than usual. This is because the latest release of everyone’s favorite Linux distribution comes with an experimental desktop to play with. This desktop is the Unity environment most are used to, with a twist. It no longer is making use of X11 graphics technology and instead the makers of Ubuntu have gone a different way.

In its place, Unity 8 is using Mir, Ubuntu’s answer to calls for a better-performing display server on Linux. This technology has been in heavy use already on the Ubuntu phone and tablet, but this new release is the first time we’ve seen it on the desktop.

This technology is new and shiny. As a result, not a lot of established Linux programs can work on it, as most, if not all, of these tools are built to work with Xorg and X11\. However, if you’ve been wanting to try out Unity 8, you’ll be happy to know that it is indeed possible to get these old Xorg apps working in Unity 8\. Here’s how!

### Logging Into Unity 8

![unity8-select-unity-8-login](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/unity8-select-unity-8-login.jpg "unity8-select-unity-8-login")

Unity 8 comes as an optional session in Ubuntu 16.10\. There’s one key thing to keep in mind before using it: it will not load with AMD graphics drivers, or Intel for that matter. The only supported graphics drivers as of now are the open source Nvidia drivers. To use the Unity 8 session, start up Ubuntu like normal. Then, before logging in, click the Ubuntu icon above your username and select “Unity8.” If all goes well, the new, experimental desktop will load.

**Note**: Unity 8 is very new and unstable. Use at your own risk.

### Installing Libertine

Xorg programs (like Firefox, etc.) do work in Unity 8; they just need a little tweak before anything will run. Start off by opening a terminal on the Mir desktop. This is done by clicking the terminal icon in the “scopes” window. Once open, enter your password. After that, enter the following commands:

![unity8-installing-libertine-in-terminal](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/unity8-installing-libertine-in-terminal.jpg "unity8-installing-libertine-in-terminal")

```
sudo apt install libertine-tools libertine-scope libertine
```

When these programs finish installing, click and drag the scope window to refresh it. Then, click on the top-hat to launch libertine.

### Creating Xorg Containers

With Libertine open, it’s time to create some containers. These containers are special, as they allow X11 based Linux programs to run inside of a container on the Mir/Unity 8 desktop. Additionally, check the “i386 multiarch support” box for 32bit support. Otherwise, leave everything as is (or give it a name and password), and click OK.

![unity8-libertine-create-new-container](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/unity8-libertine-create-new-container.jpg "unity8-libertine-create-new-container")

From this point on, the Xorg container is ready to use. Look for it in Libertine and launch the container. It also should be noted that containers can be erased by right-clicking on them, then selecting the “Delete” option.

**Note**: each Xorg container has a maximum memory limit of 500 megabytes, so multiple containers may be necessary.

### Installing Software

![unity8-libertine-install-software](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/unity8-libertine-install-software.jpg "unity8-libertine-install-software")

Software is installed in Libertine containers in two ways. The first way allows for users to launch the container and select “Enter package name or Debian file,” meaning it is possible to find the name of a program in the software center or terminal and enter it into Libertine to install it. It is also possible to specify a .DEB package file for installation. It is also possible to search for the package directly within the Libertine LXC container.

**Note**: Unity 8 is very new, and some programs may not load or fully install with Libertine.

### Conclusion

Unity 8 shows a lot of promise. It’s modern, sleek, and faster than any iteration of Unity that came before it. The only thing that is holding it back is adoption. The simple fact is that most users would rather have programs that work instead of a fancy, fresh desktop. To an extent, using Libertine solves this issue, but it won’t work forever. Sooner or later Canonical will need to start porting programs on their own or reach out to the community as as whole to make this happen.

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/use-old-xorg-apps-unity-8/

作者：[Derrik Diener][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/derrikdiener/
[1]:https://www.maketecheasier.com/use-old-xorg-apps-unity-8/#respond

[3]:https://www.maketecheasier.com/shimo-vpn-client-for-mac/
[4]:https://www.maketecheasier.com/schedule-windows-empty-recycle-bin/
[5]:mailto:?subject=How%20to%20Use%20Old%20Xorg%20Apps%20in%20Unity%208%20on%20Ubuntu%2016.10&body=https%3A%2F%2Fwww.maketecheasier.com%2Fuse-old-xorg-apps-unity-8%2F
[6]:http://twitter.com/share?url=https%3A%2F%2Fwww.maketecheasier.com%2Fuse-old-xorg-apps-unity-8%2F&text=How+to+Use+Old+Xorg+Apps+in+Unity+8+on+Ubuntu+16.10
[7]:http://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.maketecheasier.com%2Fuse-old-xorg-apps-unity-8%2F
[8]:https://www.maketecheasier.com/category/linux-tips/

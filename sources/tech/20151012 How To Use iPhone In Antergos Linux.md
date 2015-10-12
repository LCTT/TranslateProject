How To Use iPhone In Antergos Linux
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/iPhone-Antergos-Arch-Linux.jpg)

Troubles with iPhone and Arch Linux? iPhone and Linux never really go along very well. In this tutorial, I am going to show you how can you use iPhone in Antergos Linux. Since Antergos is based on Arch Linux, the same steps should be applicable to other Arch based Linux distros such as Manjaro Linux.

So, recently I bought me a brand new iPhone 6S and when I connected it to Antergos Linux to copy some pictures, it was not detected at all. I could see that iPhone was being charged and I had allowed iPhone to ‘trust the computer’ but there was nothing at all detected. I tried to run dmseg but there was no trace of iPhone or Apple there. What is funny that [libimobiledevice][1] was installed as well, which always fixes [iPhone mount issue in Ubuntu][2].

I am going to show you how I am using iPhone 6S, running on iOS 9 in Antergos. It goes more in command line way, but I presume since you are in Arch Linux zone, you are not scared of terminal (and you should not be as well).

### Mount iPhone in Arch Linux ###

**Step 1**: Unplug your iPhone, if it is already plugged in.

**Step 2**: Now, open a terminal and use the following command to install some necessary packages. Don’t worry if they are already installed.

    sudo pacman -Sy ifuse usbmuxd libplist libimobiledevice

**Step 3**: Once these programs and libraries are installed, reboot your system.

    sudo reboot

**Step 4**: Make a directory where you want the iPhone to be mounted. I would suggest making a directory named iPhone in your home directory.

    mkdir ~/iPhone

**Step 5**: Unlock your phone and plug it in. If asked to trust the computer, allow it.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/iPhone-mount-Antergos-Linux-2.jpeg)

**Step 6**: Verify that iPhone is recognized by the system this time.

    dmesg | grep -i iphone

This should show you some result with iPhone and Apple in it. Something like this:

    [ 31.003392] ipheth 2-1:4.2: Apple iPhone USB Ethernet device attached
    [ 40.950883] ipheth 2-1:4.2: Apple iPhone USB Ethernet now disconnected
    [ 47.471897] ipheth 2-1:4.2: Apple iPhone USB Ethernet device attached
    [ 82.967116] ipheth 2-1:4.2: Apple iPhone USB Ethernet now disconnected
    [ 106.735932] ipheth 2-1:4.2: Apple iPhone USB Ethernet device attached

This means that iPhone has been successfully recognized by Antergos/Arch Linux.

**Step 7**: When everything is set, it’s time to mount the iPhone. Use the command below:

    ifuse ~/iPhone

Since we created the mount directory in home, it won’t need root access and you should also be able to see it easily in your home directory. If the command is successful, you won’t see any output.

Go back to Files and see if the iPhone is recognized or not. For me, it looks like this in Antergos:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/iPhone-mount-Antergos-Linux.jpeg)

You can access the files in this directory. Copy files from it or to it.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/iPhone-mount-Antergos-Linux-1.jpeg)

**Step 8**: When you want to unmount it, you should use this command:

    sudo umount ~/iPhone

### Worked for you? ###

I know that it is not very convenient and ideally, iPhone should be recognized as any other USB storage device but things don’t always behave as they are expected to. Good thing is that a little DIY hack can always fix the issue and it gives a sense of achievement (at least to me). That being said, I must say Antergos should work to fix this issue so that iPhone can be mounted by default.

Did this trick work for you? If you have questions or suggestions, feel free to drop a comment.

--------------------------------------------------------------------------------

via: http://itsfoss.com/iphone-antergos-linux/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://www.libimobiledevice.org/
[2]:http://itsfoss.com/mount-iphone-ipad-ios-7-ubuntu-13-10/
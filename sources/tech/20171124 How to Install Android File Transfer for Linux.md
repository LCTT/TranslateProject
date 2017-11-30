Translating by wenwensnow
# How to Install Android File Transfer for Linux

If you’re struggling to mount your Android phone on Ubuntu you might want to give [Android File Transfer for Linux][4] a try.

Effectively it’s a clone of Google’s [Android File Transfer][6] app for macOS. It’s built with Qt, and has a super simple UI that makes it easy to transfer files and folders to and from your Android smartphone and your Ubuntu machine.

Now, chances are a few of you will be scratching your head wondering what this app does that Nautilus, the default file manager in Ubuntu, doesn’t — and the answer is nothing.

When I connect my Nexus 5X (and remember to select the [MTP][7] option) to my Ubuntu machine I can browse, open and manage it using Nautilus, just like my phone was a regular USB drive thanks to [GVfs][8]:

 [![Nautilus MTP integration with a Nexus 5X](http://www.omgubuntu.co.uk/wp-content/uploads/2017/11/browsing-android-mtp-nautilus.jpg)][9] 

But  _some_  people experience issues with this, and other MTP implementations, such as directories not loading, directory creation that doesn’t “stick”, and issues using their device inside a media player.

And it’s for those people whom Android File Transfer for Linux is designed. Consider it an alternative to other methods of mounting MTP devices on Linux. If what you use currently works a-ok, you probably don’t need to try this out (unless you really like trying things out).

![Android File Transfer Linux App](http://www.omgubuntu.co.uk/wp-content/uploads/2017/11/android-file-transfer-for-linux-750x662.jpg)

The app features:

*   A straightforward user interface

*   Drag and drop support (Linux to Phone)

*   Batch downloading (Phone to Linux)

*   Transfer progress dialogs

*   FUSE wrapper

*   No file size limits

*   Optional CLI tool

### Install Android File Transfer on Ubuntu

That’s enough waffle about this alternative way to mount your Android phone, on to the nitty gritty of installing it.

Helpfully there’s a [PPA available][10] which provides builds for Ubuntu 14.04 LTS, 16.04 LTS and Ubuntu 17.10.

To add the PPA to your list of software sources run this command:

```
sudo add-apt-repository ppa:samoilov-lex/aftl-stable
```

Then, to install Android File Transfer for Linux on Ubuntu, run:

```
sudo apt-get update && sudo apt install android-file-transfer
```

That’s pretty much it.

You’ll find a launcher for the app in your app menu.

Before launching it do make make sure that no other devices (such as Nautilus) mount your phone first. If anything is using it the app will report “no MTP device found”. To fix, unmount your device from Nautilus (or whichever app is using it) then relaunch Android File Transfer.

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2017/11/android-file-transfer-app-linux

作者：[ JOEY SNEDDON ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:https://plus.google.com/117485690627814051450/?rel=author
[2]:http://www.omgubuntu.co.uk/category/app
[3]:http://www.omgubuntu.co.uk/category/download
[4]:https://github.com/whoozle/android-file-transfer-linux
[5]:http://www.omgubuntu.co.uk/2017/11/android-file-transfer-app-linux
[6]:http://android.com/filetransfer?linkid=14270770
[7]:https://en.wikipedia.org/wiki/Media_Transfer_Protocol
[8]:https://en.wikipedia.org/wiki/GVfs
[9]:http://www.omgubuntu.co.uk/wp-content/uploads/2017/11/browsing-android-mtp-nautilus.jpg
[10]:https://launchpad.net/~samoilov-lex/+archive/ubuntu/aftl-stable

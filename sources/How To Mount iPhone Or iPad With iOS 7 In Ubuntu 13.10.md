zpl1025 translating
How To Mount iPhone Or iPad With iOS 7 In Ubuntu 13.10
================================================================================
I got an iPhone 5 with iOS 7 couple of months back. I tried to connect iPhone or iPad with Linux (Ubuntu and Linux Mint), it was recognized and it asked me whether I “trust this computer”?

![](http://itsfoss.com/wp-content/uploads/2014/01/ios7-trust_this_computer1.jpeg)

And I said “I do” and tapped on Trust. After a flash of seconds it asked me again if I “trust this computer”? And I tapped Trust again. And then it asked the same question, I felt like it got trapped in a while(true) loop. While at Ubuntu, it showed me that my iPhone was locked and I could not access any files on it:

![](http://itsfoss.com/wp-content/uploads/2014/02/iPhone_issue_with_Ubuntu.png)

After some searching I came to know that this **infinite loop of trust this computer with iOS 7 in Linux** is a known [bug][1].

This actually is a [new security feature in iOS 7][2] which aims to tackle the issue of fake iPhone chargers. So, what is the solution here? Is there a way to **fix “trust this computer” with iOS 7 in Linux**? [libimobiledevice][3] library is is expected to fix this issue in version 1.1.6 but there is no expected availability date for the stable version.

Don’t be disheartened, you can still use the unstable version of libimobiledevice and connect your iPhone to Ubuntu easily. Let me show you how can you mount iPhone in Ubuntu 13.10 or Linux Mint 16 without getting in the pitfall of “trust this computer”.

### Fix trust this computer issue with iOS 7 in Ubuntu 12.04: ###

If you are using Ubuntu 12.04 LTS be it 32 bit or 64 bit or Linux Mint 13 Maya, you can add the following PPA by [Ingo Haschler][4]:

    sudo apt-add-repository ppa:ingo/ios7support
    sudo apt-get update
    sudo apt-get upgrade

This will upgrade the libimobiledevice (already installed on the system) to unstable version 1.6. Reboot your computer and try to connect iPhone with Ubuntu again. It should work now.

#### Note: ####

If you get “lock down error”, try using the following commands:

    sudo mkdir /var/lib/lockdown
    sudo chmod 777 /va7Lib/lockdown

### Fix trust this computer issue with iOS 7 in Ubuntu 13.10: ###

For seasoned Linux users, you can get the source code from the [GitHub][5] and compile it. For **Ubuntu 13.10 64 bit** and **Linux Mint 16 64 bit** users, there is a Debian package compiled for you by [Iuri Diniz][6]. You can download and install this .deb package to easily mount iPhone on Ubuntu 13.10 64 bit.

- [libimobiledevice 1.6 for Ubuntu 13.10 & Linux Mint 16 64 bit][7]

Double click on the downloaded .deb file to install it. Note that Ubuntu and Linux Mint comes with libimobiledevice library pre-installed in it. This is why you would see an option of upgrading the libimobiledevice rather than installing it.

![](http://itsfoss.com/wp-content/uploads/2014/02/install_libimobiledevice_Ubuntu.jpeg)

Once installed, your iPhone or iPad should be mounted without any troubles. Here is a screenshot of my iPhone mounted in Ubuntu 13.10.

![](http://itsfoss.com/wp-content/uploads/2014/02/iPhone_Ubuntu_Linux.jpeg)

I could access the files, transfer the files from Ubuntu to iPhone. It was recognized by Rythembox for synchronizing also. It is not the first time I had issues with connecting my mobile device with Ubuntu. Last, I had written on [how to connect Kindle Fire HD with Ubuntu][8].

I hope this quick tutorial solves the infinite loop of ‘trust this computer’ problem with iPhone and Ubuntu for you as well. Let me know if it worked for you or if you are still facing issues to mount iPhone with Ubuntu Linux. Ciao ![](http://itsfoss.com/wp-includes/images/smilies/icon_smile.gif)

--------------------------------------------------------------------------------

via: 

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1207812
[2]:http://www.macobserver.com/tmo/article/apple-fixes-threat-from-fake-iphone-chargers-in-ios-7
[3]:http://www.libimobiledevice.org/
[4]:https://launchpad.net/~ingo
[5]:https://github.com/libimobiledevice/libimobiledevice
[6]:https://launchpad.net/~iuridiniz
[7]:https://bugs.launchpad.net/ubuntu/+source/libimobiledevice/+bug/1207812/+attachment/3941542/+files/libimobiledevice4_1.1.6-git20140105_amd64.deb
[8]:http://itsfoss.com/how-to-connect-kindle-fire-hd-with-ubuntu-12-10/

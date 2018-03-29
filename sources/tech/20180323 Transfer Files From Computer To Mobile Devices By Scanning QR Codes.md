Transfer Files From Computer To Mobile Devices By Scanning QR Codes
======

![](https://www.ostechnix.com/wp-content/uploads/2018/03/qr-filetransfer-720x340.png)
Transferring files from a Computer to a smartphone is not a big deal. You can do this by mounting the mobile phone on your system using an USB cable, then transfer files from the file manager. Also, some third party applications, such as [**KDE Connect**][1] and [**AirDroid**][2], can help you to easily manage and transfer files from your system to Android devices. Today, I stumbled upon a super cool utility named **“Qr-filetransfer”**. It allows you to transfer files over WiFi from computer to mobile devices by scanning QR codes without leaving your Terminal. Yes, you read that right! The qr-filetransfer is a free, open source command line utility written using Go programming language. In this brief tutorial, we are going to learn to transfer files from Linux to any mobile devices using qr-transfer.

### Installing Qr-filetransfer

First, install Go language on your system.

On Arch Linux and derivatives:
```
$ sudo pacman -S go

```

On RPM based systems like RHEL, CentOS, Fedora, run:
```
$ sudo yum install golang

```

Or,
```
$ sudo dnf install golang

```

On DEB based systems such as Debian, Ubuntu, Linux Mint, you can install it using command:
```
$ sudo apt-get install golang

```

On SUSE/openSUSE:
```
$ sudo zypper install golang

```

After installing Go language, run the following command to download qr-filetransfer application.
```
$ go get github.com/claudiodangelis/qr-filetransfer

```

The above command will download the contents of a qr-filetrnasfer GitHub repository in a directory named **“go”** in your current working directory.

Copy the qt-filetransfer binary file to your PATH, for example /usr/local/bin/.
```
$ sudo cp go/bin/qr-filetransfer /usr/local/bin/

```

Finally, make it executable as shown below.
```
$ sudo chmod +x /usr/local/bin/qr-filetransfer

```

### Transfer Files From Computer To Mobile Devices By Scanning QR Codes

Make sure that your smartphone is connected to the same WiFi network as your computer.

Then, launch qt-filetransfer tool along the with the file or folder path you want to transfer to your smartphone.

For example, I am going to transfer a mp3 file.
```
$ qr-filetransfer Chill\ Study\ Beats.mp3

```

At first launch, qr-filetransfer will ask you to choose the network interface to use like below.
```
Choose the network interface to use (type the number):
[0] enp5s0
[1] wlp9s0

```

I was going to transfer file using **wlp9s0** interface, so I typed “1”. Qr-filetransfer will remember this choice and you will never be prompted again, unless you pass the **-force** argument, or delete the **.qr-filetransfer.json** file that the program stores in the home directory of current user.

Then, you will see the QR code as shown in the below picture.

![][4]

Open the QR code app (if it is not installed already, install any QR code reader app from play store) and scan the QR code displayed in your terminal.

Once the QR code is read, you will be asked whether you want to copy the link or open the link. You can either copy the link and paste it manually on your mobile web browser or choose “Open link” to automatically open it in your mobile browser.

![][5]

Once the share link has been opened, the file will be downloaded in your smartphone.

![][6]

If the file is too big, zip the file, then transfer it
```
$ qr-filetransfer -zip /path/to/file.txt

```

To transfer a full directory, run:
```
$ qr-filetransfer /path/to/directory

```

Please note that the directory gets zipped before being transferred.

Qr-filetransfer utility will only transfer the stuffs from your system to mobile and not vice versa. This project is very new, so there will be bugs. If you encountered any bugs, report them in the GitHub page given at the end of this guide.

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/transfer-files-from-computer-to-mobile-devices-by-scanning-qr-codes/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/kde-connect-access-files-notifications-android-devices/
[2]:https://www.ostechnix.com/airdroid-share-files-and-folders-between-linux-and-android/
[4]:http://www.ostechnix.com/wp-content/uploads/2018/03/qr-filetransfer-5.png
[5]:http://www.ostechnix.com/wp-content/uploads/2018/03/qr-filetransfer-6-4.png
[6]:http://www.ostechnix.com/wp-content/uploads/2018/03/qr-filetransfer-4.png

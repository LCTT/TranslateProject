[#]: collector: (lujun9972)
[#]: translator: (warmfrog)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Use 7Zip in Ubuntu and Other Linux [Quick Tip])
[#]: via: (https://itsfoss.com/use-7zip-ubuntu-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Use 7Zip in Ubuntu and Other Linux [Quick Tip]
======

_**Brief: Cannot extract .7z file in Linux? Learn how to install and use 7zip in Ubuntu and other Linux distributions.**_

[7Zip][1] (properly written as 7-Zip) is an archive format hugely popular among Windows users. A 7Zip archive file usually ends in .7z extension. It’s mostly an open source software barring a few part of the code that deals with unRAR.

The 7Zip support is not enabled by default in most Linux distributions. If you try to extract it, you may see this error:

_**Could not open this file type
There is no command installed for 7-zip archive files. Do you want to search for a command to open this file?**_

![][2]

Don’t worry, you can easily install 7zip in Ubuntu or other Linux distributions.

The one problem you’ll notice if you try to use the [apt-get install command][3], you’ll see that there are no installation candidate that starts with 7zip. It’s because the 7Zip package in Linux is named [p7zip][4]., start with letter ‘p’ instead of the expected number ‘7’.

Let’s see how to install 7zip in Ubuntu and (possibly) other distributions.

### Install 7Zip in Ubuntu Linux

![][5]

First thing you need is to install the p7zip package. You’ll find three 7zip packages in Ubuntu: p7zip, p7zip-full and p7zip-rar.

The difference between p7zip and p7zip-full is that p7zip is a lighter version providing support only for .7z while the full version provides support for more 7z compression algorithms (for audio files etc).

The p7zip-rar package provides support for [RAR files][6] along with 7z.

Installing p7zip-full should be sufficient in most cases but you may also install p7zip-rar for additional support for the rar file.

p7zip packages are in the [universe repository in Ubuntu][7] so make sure that you have enabled it using this command:

```
sudo add-apt-repository universe
sudo apt update
```

Use the following command to install 7zip support in Ubuntu and Debian based distributions.

```
sudo apt install p7zip-full p7zip-rar
```

That’s good. Now you have 7zip archive support in your system.

[][8]

Suggested read Easily Share Files Between Linux, Windows And Mac Using NitroShare

### Extract 7Zip archive file in Linux

With 7Zip installed, you can either use the GUI or the command line to extract 7zip files in Linux.

In GUI, you can extract a .7z file as you extract any other compressed file. You right click on the file and proceed to extract it.

In terminal, you can extract a .7z archive file using this command:

```
7z e file.7z
```

### Compress a file in 7zip archive format in Linux

You can compress a file in 7zip archive format graphically. Simply right click on the file/directory, and select **Compress**. You should see several types of archive format options. Choose .7z for 7zip.

![7zip Archive Ubuntu][9]

Alternatively, you can also use the command line. Here’s the command that you can use for this purpose:

```
7z a OutputFile files_to_compress
```

By default, the archived file will have .7z extension. You can compress the file in zip format by specifying the extension (.zip) of the output file.

**Conclusion**

That’s it. See, how easy it is to use 7zip in Linux? I hope you liked this quick tip. If you have questions or suggestions, feel free to let me know the comment sections.

--------------------------------------------------------------------------------

via: https://itsfoss.com/use-7zip-ubuntu-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.7-zip.org/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2015/07/Install_7zip_ubuntu_1.png?ssl=1
[3]: https://itsfoss.com/apt-get-linux-guide/
[4]: https://sourceforge.net/projects/p7zip/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/05/7zip-linux.png?resize=800%2C450&ssl=1
[6]: https://itsfoss.com/use-rar-ubuntu-linux/
[7]: https://itsfoss.com/ubuntu-repositories/
[8]: https://itsfoss.com/easily-share-files-linux-windows-mac-nitroshare/
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/05/7zip-archive-ubuntu.png?resize=800%2C239&ssl=1

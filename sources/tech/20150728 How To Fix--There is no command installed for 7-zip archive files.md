How To Fix: There is no command installed for 7-zip archive files
================================================================================
### Problem ###

I was trying to install Emerald icon theme in Ubuntu and the theme came in .7z archive. As always, I tried to extract it, in GUI, using the right click and “extract here”. Instead of extracting the file, Ubuntu 15.04 threw an error which read:

> Could not open this file
> 
> There is no command installed for 7-zip archive files. Do you want to search for a command to open this file?

The error looked like this:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/Install_7zip_ubuntu_1.png)

### Reason ###

Reason is quite evident from the error message itself. The 7Z, better to call it [7-zip][1], program is not installed and hence 7Z compressed files are not being extracted. This also hints that Ubuntu doesn’t support 7-Zip files by default.

### Solution: Install 7zip in Ubuntu ###

Solution is quite simple as well. Install the 7-Zip package in Ubuntu. Now you might wonder how to install 7Zip in Ubuntu? Well, in the previous error dialogue box if you click on “Search Command”, it will look for available p7zip package. Just click on “Install” here:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/Install_7zip_ubuntu.png)

### Alternative: Install 7zip in terminal ###

If you prefer terminal, you can install 7zip in terminal using the following command:

    sudo apt-get install p7zip-full

Note: You’ll find three 7zip packages in Ubuntu: p7zip, p7zip-full and p7zip-rar. The difference between p7zip and p7zip-full is that p7zip is a lighter version providing support only for .7z and .7za files while the full version provides support for more 7z compression algorithms (for audio files etc). For p7zip-rar, it provides support for .rar files along with 7z.

In fact similar error can be encountered with [RAR files in Ubuntu][2]. Solution is the same, install the correct program.

I hope this quick post helped you to solve the mystery of **how to open 7zip in Ubuntu 14.04**. Any questions or suggestions are always welcomed.

--------------------------------------------------------------------------------

via: http://itsfoss.com/fix-there-is-no-command-installed-for-7-zip-archive-files/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://www.7-zip.org/
[2]:http://itsfoss.com/fix-there-is-no-command-installed-for-rar-archive-files/
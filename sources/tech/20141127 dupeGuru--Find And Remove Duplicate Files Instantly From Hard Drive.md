dupeGuru – Find And Remove Duplicate Files Instantly From Hard Drive
================================================================================
### Introduction ###

Disk full is one of the big trouble for us. No matter how we’re careful, sometimes we might copy the same file to multiple locations, or download the same file twice unknowingly. Therefore, sooner or later we will end up with disk full error message, which is worst when we really need some space to store important data. If you believe your system has multiple duplicate files, then **dupeGuru** might help you.

dupeGuru team have also developed applications called **dupeGuru Music Edition** to remove duplicate music files, and **dupeGuru Picture Edition** to remove duplicate pictures.

### 1. dupeGuru (Standard Edition) ###

For those who don’t know about [dupeGuru][1], It is a free, open source, cross-platform application that can used to find and remove the duplicate files in your system. It will run under Linux, Windows, and Mac OS X platforms. It uses a quick fuzzy matching algorithm to find the duplicate files in minutes. Also, you can tweak dupeGuru to find exactly what kind of duplicate files you want to, and eliminate what kind of files from deletion. It supports English, French, German, Chinese (Simplified), Czech, Italian, Armenian, Russian, Ukrainian, Brazilian, and Vietnamese.

#### Install dupeGuru On Ubuntu 14.10/14.04/13.10/13.04/12.04 ####

dupeGuru developers have created a Ubuntu PPA to ease the installation. To install dupeGuru, enter the following commands one by one in your Terminal.

    sudo apt-add-repository ppa:hsoft/ppa
    sudo apt-get update
    sudo apt-get install dupeguru-se

#### Usage ####

Usage is very simple. Launch dupeGuru either from Unity Dash or Menu.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/dupeGuru_007.png)

Click + button on the bottom, and add the folder you want to scan. Click Scan button to start finding the duplicate files.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/dupeGuru_008.png)

If the selected folder contains any duplicate files, it will display them. As you in the below screen shot, I have a duplicate file in the Downloads directory.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/dupeGuru-Results_009.png)

Now, you can decide what to do. You can either delete the duplicate file, or rename it, or copy/move it to another location. To do that select the duplicate files, or check the box that says “**Dupes only**” on the Menu bar. If you selected the Dupes only option, the duplicates files will only visible. So you can select and delete them easily. Click on the **Actions** drop-down box. Finally, select the action you want to perform. Here, I just want to delete the duplicate file, so I selected the option: **Send marked to Recycle bin**.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/Menu_010.png)

Then, click **Proceed** to delete the duplicate files.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/Deletion-Options_011.png)

### 2. dupeGuru Music Edition ###

[dupeGuru Music Edition][2] or dupeGuru ME in short, is just like dupeGuru. It does everything dupeGuru does, but it has more information columns (such as bitrate, duration, tags, etc..) and more scan types (filename with fields, tags and audio content). Like dupeGuru, dupeGuru ME also runs on Linux, Windows, and Mac OS X.

It supports variety of formats such as MP3, WMA, AAC (iTunes format), OGG, FLAC, loss-less AAC and loss-less WMA etc,

#### Install dupeGuru ME On Ubuntu 14.10/14.04/13.10/13.04/12.04 ####

Now, we don’t have to add any PPA, because already the added in the previous steps. So, enter the following command to install from your Terminal.

    sudo apt-get install dupeguru-me

#### Usage ####

Launch it either from Unity dash or Menu. The usage, interface, and look of dupeGuru ME is similar to normal dupeGuru. Add the folder you to scan and select the action you want to perform. The duplicate music files will be deleted.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/dupeGuru-Music-Edition-Results_012.png)

### 3. dupeGuru Picture Edition ###

[dupeGuru Picture Edition][3], or duepGuru PE in short, is a tool to find duplicate pictures on your computer. It is as like as dupeGuru, but is specialized for duplicate pictures matching. dupeGuru PE runs on Linux, Windows, and Mac OS X.

dupeGuru PE supports JPG, PNG, TIFF, GIF and BMP formats. All these formats can be compared together. The Mac OS X version of dupeGuru PE also supports PSD and RAW (CR2 and NEF) formats.

#### Install dupeGuru PE On Ubuntu 14.10/14.04/13.10/13.04/12.04 ####

As we have already added the PPA, We don’t need to add PPA for dupeGuru either. Just, run the following command to install it.

    sudo apt-get install dupeguru-pe

#### Usage ####

It’s also look like dupeGuru, and dupeGuru ME in terms of usage, interface, and look.I wonder why the developer have created there separate versions for each category. It would be better, a single application has all of the above three features combined.

Launch it, add the folder you want to scan, and select the action you want to perform. That’s it. you duplicated files will be gone.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/dupeGuru-Picture-Edition-Results_014.png)

If you can’t remove them in case of any security problems, note down the location of the files, and manually delete them either from Terminal or File manager.

Cheers!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/dupeguru-find-remove-duplicate-files-instantly-hard-drive/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/
[1]:http://www.hardcoded.net/dupeguru/
[2]:http://www.hardcoded.net/dupeguru_me/
[3]:http://www.hardcoded.net/dupeguru_pe/
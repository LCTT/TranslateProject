How To Install New Fonts In Ubuntu 14.04 and 14.10
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/fonts.jpg)

Ubuntu does come with a bunch of fonts installed by default in it. But at times you might not be satisfied with the available lots of fonts. So, what you can do is to **install additional fonts in Ubuntu 14.04**, 14.10 or any other Linux system such as Linux Mint.

### Step 1: Get fonts ###

First and foremost, download your choice of fonts. Now you might be thinking from where can you get new fonts. Don’t worry, a simple Google search will provide you with several websites that have new fonts available for free. You can start with [fonts at Lost Type][1]. [Fonts Squirrel][2] is also a good place to download fonts.

### Step 2: Install new fonts in Ubuntu ###

The downloaded fonts might be in a zipped file. Extract it. Most of the fonts are either in [TTF][3] (TrueType Fonts) or in [OTF][4] (OpenType Fonts) format. Whichever it may be, just double click on the font file. It will open it in Font Viewer. In here, you can see the option to install the font in top right corner:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/Install_New_Fonts_Ubuntu.png)

You won’t really see anything being installed as you see when installing a software. Couple of seconds later, you’ll see the status has been changed to Installed. No prizes for guessing that the font has been now installed.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/Install_New_Fonts_Ubuntu_1.png)

Once installed, you can see the newly installed fonts in any application that uses fonts such as GIMP, Pinta etc.

### Step 2: Install several fonts at once in Linux ###

No, it is not typo. This is still step 2 but just an alternative. The method we saw above to install fonts in Ubuntu is just fine. But there is a little issue with it. What happens when you have like 20 new fonts to install. Installing all these fonts, one by one, by double clicking on them is cumbersome and inconvenient. Don’t you think the same?

To install several fonts at once in Ubuntu, all you need to do is to create .fonts directory, if it doesn’t exist already, in your Home directory. And extract or copy paste all those TTF or OTF files in this directory.

Go to your Home directory in File manager. Press Ctrl+H to [show hidden files in Ubuntu][5]. Right click to make a new folder and name it .fonts. That dot at the beginning is important. In Linux, if you put dot ahead of the file name, it hides the file from normal view.

#### Alternative: ####

Alternatively, you can install Font Manager application and manage fonts in GUI. To install Font Manager in Ubuntu, open a terminal and use the command below:

    sudo apt-get install font-manager

Open the Font Manager from Unity Dash. You can see installed fonts and option to install new fonts, remove existing fonts etc here.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/Font_Manager_Ubuntu.jpeg)

To remove Font Manager, use the command below:

    sudo apt-get remove font-manager

I hope this quick helped you to install fonts in Ubuntu and other Linux systems. Do let me know if you have questions or suggestions.

--------------------------------------------------------------------------------

via: http://itsfoss.com/install-fonts-ubuntu-1404-1410/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:http://www.losttype.com/browse/
[2]:http://www.fontsquirrel.com/
[3]:http://en.wikipedia.org/wiki/TrueType
[4]:http://en.wikipedia.org/wiki/OpenType
[5]:http://itsfoss.com/hide-folders-and-show-hidden-files-in-ubuntu-beginner-trick/
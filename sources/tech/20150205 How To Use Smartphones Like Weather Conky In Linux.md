How To Use Smartphones Like Weather Conky In Linux
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Use_Weather_Conky_Linux.jpeg)

Smartphones have those sleek weather widgets that blend in to the display. Thanks to Flair Weather Conky, you can get **smartphone like weather display on your Linux desktop**. We will be using a GUI tool [Conky Manager to easily manage Conky in Linux][1]. Let’s first see how to install Conky Manager in Ubuntu 14.10, 14.04, Linux Mint 17 and other Linux distributions.

### Install Conky Manager ###

Open a terminal and use the following commands:

    sudo add-apt-repository ppa:teejee2008/ppa
    sudo apt-get update
    sudo apt-get install conky-manager

You can read this article on [how to use Conky Manager in Linux][1].

### Make sure curl is installed ###

Do make sure that [curl][2] is installed. Use the following command:

    sudo apt-get install curl

### Download Flair Weather Conky ###

Get the Flair Weather Conky script from the link below:

- [Download Flair Weather Conky Script][3]

### Using Flair Weather Conky script in Conky Manager ###

#### Step 1: ####

Same as you install themes in Ubuntu 14.04, you should have a .conky directory in your Home folder. If you use command line, I don’t need to tell you how to find that. For beginners, go to your Home directory from File manager and press Ctrl+H to [show hidden files in Ubuntu][4]. Look for .conky folder here. If there is no such folder, make one.

#### Step 2: ####

In the .conky directory, extract the downloaded Flair Weather file. Do note that by default it is extracted to .conky directory itself. So go in this directory and get the Flair Weather folder out of it and paste it to actual .conky directory.

#### Step 3: ####

Flair Weather uses Yahoo and it doesn’t recognize your location automatically. You’ll need to manually edit it. Go to [Yahoo Weather][5] and get the location of id of your city by typing your city/pin code. You can get the location id from the URL.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Yahoo_Weather_Location_Code.jpeg)

#### Step 4: ####

Open Conky Manager. It should be able to read the newly installed Conky script. There are two variants, dark and light, available. You can choose whichever you prefer. You can should see the conky displayed on the desktop as soon as you select it.

Default location in Flair Weather is set to Melbourne. You’ll have to manually edit the conky.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Using_Weather_Conky_Ubuntu.jpeg)

#### Step 5: ####

In the screenshot above, you can see the option to edit the selected conky. In the editor opened, look for location or WOEID. Change it with the location code you got in step 3. Now restart the Conky.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Edit_Conky.jpeg)

In the same place, if you replace C by F, the unit of temperature will be changed to Fahrenheit from Celsius. Don’t forget to restart the Conky to see the changes made.

#### Give it a try ####

In this article we actually learned quite few things. We saw how we can use any Conky script easily, how to edit the scripts and how to use Conky Manager for various purposes. I hope you find it useful.

A word of caution, Ubuntu 14.10 users might see overlapped time numerals. Please make the developer ware of any such issues.

I have already shown you the screenshot of how the Flair Weather conky looked in my system. Time for you to try this and flaunt your desktop.

--------------------------------------------------------------------------------

via: http://itsfoss.com/weather-conky-linux/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:http://itsfoss.com/conky-gui-ubuntu-1304/
[2]:http://www.computerhope.com/unix/curl.htm
[3]:http://speedracker.deviantart.com/art/Flair-Weather-Conky-Made-for-Conky-Manager-510130311
[4]:http://itsfoss.com/hide-folders-and-show-hidden-files-in-ubuntu-beginner-trick/
[5]:https://weather.yahoo.com/
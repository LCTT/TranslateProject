Translating---geekpi

Get Rid Of Two Google Chrome Icons From Dock In Elementary OS Freya [Quick Tip]
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Two_Google_Chrome_ElementaryOS_Freya.jpeg)

This quick tip shows you **how to get rid of two Google Chrome icons from the dock in Elementary OS Freya**.

I hardly use the default Midori browser in [Elementary OS][1] Freya as Google Chrome is my main browser across all OSes. While [Midori][2] is kept in the dock by default, you’ll have to search for Google Chrome in Slingshot (applications) every time you want to open Google Chrome. To save time, I presume you have selected the “keep in dock” option for a quick access to Chrome.

The problem here is that when you click on the Chrome icon in the dock, it creates another instance of Google Chrome. This leaves you with two Chrome icons in the docks and this is something that might be ignored by many but definitely an annoyance and against the design. If you share the same feeling, let’s see how can we remove the second Google Chrome icon.

### Remove two Google Chrome icons from dock in Elementary OS Freya ###

#### Step 1: ####

Remove Google Chrome from the dock.

#### Step 2: ####

Open the terminal and use the following command:

    cp /usr/share/applications/google-chrome.desktop ~/.local/share/applications

#### Step 3: ####

Next we need to edit the google-chrome.desktop file. Use the following commands:

    scratch-text-editor ~/.local/share/applications/google-chrome.desktop

It will open the google-chrome.desktop file in Scratch for editing. Under the [Desktop Entry] section, add the following line:

    StartupWMClass=Google-chrome-stable

It will look a bit like this:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/two_Google_Chrome_Elementary_Freya.png)

#### Step 4: ####

Go to Slingshot and open Google Chrome again. Do select “keep in dock” again. Close it and start it again to verify that it doesn’t open a new Chrome instance in the dock. No reboot of system is required here.

I hope this quick tip helped you to remove multiple Google Chrome icons from dock in Elementary OS Freya. Feel free to ask your questions and drop your suggestions in the comment below.

--------------------------------------------------------------------------------

via: http://itsfoss.com/rid-google-chrome-icons-dock-elementary-os-freya/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://elementary.io/
[2]:http://midori-browser.org/

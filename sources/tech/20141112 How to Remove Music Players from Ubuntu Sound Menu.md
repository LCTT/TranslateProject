disylee来翻译
How to Remove Music Players from Ubuntu Sound Menu
================================================================================
![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/11/music-players.jpg)

**Since its introduction back in 2010, the Ubuntu Sound Menu has proven to be one of the most popular and unique features of the Unity desktop.**

Allowing music players to integrate with the volume applet – i.e., where one would expect to find sound-related tomfoolery – through a standard interface is inspired. One wonders why other operating systems haven’t followed suit!

#### Overstuffed ####

Handy though it may be there is a “problem” with the applet as it currently exists: pretty much anything that so much as looks at an MP3 can, should it want, lodge itself inside. While useful, an omnipresent listing for apps you have installed but don’t use that often is annoying and unsightly.

I’m going to wager that the screenshot above looks familiar to a great many of you reading this! Never fear, **dconf-editor** is here.

### Remove Players from Ubuntu Sound Menu ###

#### Part One: Basics ####

The quickest and easiest way to remove entries from the Sound Menu is to uninstall the apps afflicting it. But that’s extreme; as I said, you may want the app, just not the integration.

To remove players without ditching the apps we need to use a scary looking tool called dconf-editor.

You may have it installed already, but if you don’t you’ll find it in the Ubuntu Software Center waiting.

- [Click to Install Dconf-Editor in Ubuntu][1]

Once installed, head to the Unity Dash to open it. Don’t panic when it opens; you’ve not been shunted back to the 2002, it’s supposed to look like that.

Using the left-hand sidebar you need to navigate to com > canonical > indicator > sound. The following pane will appear.

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/11/dconf-editor.jpg)

Double click on the closed brackets next to interested-media-players and delete the players you wish to remove from the Sound Menu, but leave in the square brackets and don’t delete any commas or apostrophes from items you wish to keep.

For example, I removed ‘**rhythmbox.desktop**’, ‘**pithos.desktop**’, ‘**clementine.desktop**’, to leave a line that reads:

    ['tomahawk.desktop']

Now, when I open the Sound menu I only see Tomahawk:

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/11/music-players-2.jpg)

#### Part Two: Blacklisting ####

Wait! Don’t close dconf-editor yet. While the steps above makes things look nice and tidy some players will instantly re-add themselves to the sound menu when opened. To avoid having to repeat the process add them to the **blacklisted-media-player** section.

Remember to enclose each player in apostrophes with a comma separating multiple entries. They must also be inside the square brackets — so double check before exiting.

The net result:

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/10/from-to-.jpg)

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/11/remove-players-ubuntu-sound-menu

作者：[Joey-Elijah Sneddon][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:apt://dconf-editor

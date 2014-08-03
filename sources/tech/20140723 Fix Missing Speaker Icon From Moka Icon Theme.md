Translating by GOLinux...
Fix Missing Speaker Icon From Moka Icon Theme [Quick Tip]
================================================================================
[Moka][1] is a beautiful icon theme. It has been constantly featured among the [best icon themes available for Ubuntu][2]. But there is little issue with Moka in Ubuntu 14.04. If you use Moka icons in Ubuntu 14.04 with Unity, you’ll find that speaker icon used for sound is missing:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/07/Moka_Missing_Sound_Icon.jpeg)

### Fix missing sound icon while using Moka icon theme ###

Though you might have already added official Moka PPA but for the sake of checking, add it again:

    sudo add-apt-repository ppa:moka/stable
    sudo apt-get update

Now, next step is to install monochrome panel icons. Use the following command to install it:

    sudo apt-get install faba-mono-icons

Once you have installed the Faba monochrome icons, change your icon theme from Moka to Faba. This will give you Moka icon theme along with beautiful monochrome icons in the top panel in Unity:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/07/Moka_With_Sound_Icons.jpeg)

I hope this helped you to fix the missing sound icon. Enjoy every bit and every sip of the Moka.

--------------------------------------------------------------------------------

via: http://itsfoss.com/fix-missing-speaker-icon-from-moka/

原文作者：[Abhishek][a]

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:http://mokaproject.com/
[2]:http://itsfoss.com/best-icon-themes-ubuntu-1404/

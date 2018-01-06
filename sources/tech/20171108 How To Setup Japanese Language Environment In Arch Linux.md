translating---geekpi

How To Setup Japanese Language Environment In Arch Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2017/11/Setup-Japanese-Language-Environment-In-Arch-Linux-720x340.jpg)

In this tutorial, we will be discussing how to setup Japanese language environment in Arch Linux. In other Unix-like operating systems, it is not a big deal to setup Japanese layout. You can easily choose the Japanese keyboard layout from Settings. However, it is bit difficult under Arch Linux and there is no proper documentation in ArchWiki. If you're using Arch Linux and/or its derivatives like Antergos, Manajaro Linux, follow this guide to use Japanese language in your Arch Linux and its derivatives systems.

### Setup Japanese Language Environment In Arch Linux

First, install the necessary Japanese fonts for viewing Japanese ascii arts properly:
```
sudo pacman -S adobe-source-han-sans-jp-fonts otf-ipafont
```
```
pacaur -S ttf-monapo
```

If you don't have Pacaur installed already, refer [**this link**][1].

Make sure you have commented out (add # to comment out) the following line in **/etc/locale.gen** file.
```
#ja_JP.UTF-8
```

Then, install **iBus** and **ibus-anthy**. For those wondering, iBus is Input method (IM) framework for Unix-like systems and ibus-anthy is the Japanese input method for iBus.
```
sudo pacman -S ibus ibus-anthy
```

Add the following lines in **~/.xprofile** (If it doesn 't exist, create one):
```
# Settings for Japanese input
export GTK_IM_MODULE='ibus'
export QT_IM_MODULE='ibus'
export XMODIFIERS=@im='ibus'

#Toolbar for anthy
ibus-daemon -drx
```

The ~/.xprofile file allows us to execute commands at the beginning of the X user session before the window manager is started.

Save and close the file. Restart your Arch Linux system to take effect the changes.

After logging in to your system, right click on the iBus icon in the task bar and choose **Preferences**. If it is not there, run the following command from Terminal to start IBus and open the preferences window.
```
ibus-setup
```

Choose Yes to start iBus. You will see a screen something like below. Click Ok to close it.

[![][2]][3]

Now, you will see the iBus preferences window. Go to **Input Method** tab and click  "Add" button.

[![][2]][4]

Choose "Japanese" from the list:

[![][2]][5]

And then, choose "Anthy" and click Add.

[![][2]][6]

That's it. You will now see "Japanese - Anthy" in your Input Method section.

[![][2]][7]

Then change the options for Japanese input as per your requirement in the Preferences section (Click Japanese - Anthy -> Preferences).

[![][2]][8]

You can also edit the default shortcuts in the key bindings section. Once you made all changes, click Apply and OK. That's it. Choose the Japanese language from iBus icon in the task bar or press **SUPER KEY+SPACE BAR** to switch between Japanese and English languages (or any other default language in your system). You can change the keyboard shortcuts from IBus Preferences window.

You know now how to use Japanese language in Arch Linux and derivatives. If you find our guides useful, please share them on your social, professional networks and support OSTechNix.



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/setup-japanese-language-environment-arch-linux/

作者：[][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com
[1]:https://www.ostechnix.com/install-pacaur-arch-linux/
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]:http://www.ostechnix.com/wp-content/uploads/2017/11/ibus.png ()
[4]:http://www.ostechnix.com/wp-content/uploads/2017/11/iBus-preferences.png ()
[5]:http://www.ostechnix.com/wp-content/uploads/2017/11/Choose-Japanese.png ()
[6]:http://www.ostechnix.com/wp-content/uploads/2017/11/Japanese-Anthy.png ()
[7]:http://www.ostechnix.com/wp-content/uploads/2017/11/iBus-preferences-1.png ()
[8]:http://www.ostechnix.com/wp-content/uploads/2017/11/ibus-anthy.png ()

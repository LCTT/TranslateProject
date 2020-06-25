[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Make Ubuntu Look Like macOS in 5 Easy Steps)
[#]: via: (https://itsfoss.com/make-ubuntu-look-like-macos/)
[#]: author: (Community https://itsfoss.com/author/itsfoss/)

How to Make Ubuntu Look Like macOS in 5 Easy Steps
======

Customization is one of the main reasons [why I use Linux][1]. There is no end to the kind of customization you can do to your desktop Linux. You can change icons, themes, change fonts, change terminals, add screenlets, [indicator applets][2], extensions and what not.

We have covered numerous desktop customization tips and tricks on It’s FOSS. In this one, I’ll show you how to make Ubuntu look like macOS.

Many people use macOS because of its simplistic and elegant look. You may disagree with it but it remains a popular opinion. Even there are Linux distributions that have macOS like look and feel.

**One of the readers requested us to show how to make Ubuntu look like macOS** and hence we’ve created this tutorial. In fact, this is a **good example to show the customization capability of desktop Linux**.

No, you don’t have to install a new distribution just for customizing the looks. You can do some tweaking on your own and give your system mac-like looks.

### How to give your Ubuntu Linux a macOS makeover

![][3]

Although this article suggests it’s for Ubuntu, you can follow it for **other distributions with GNOME desktop** with little or no changes. Please make sure to [check your desktop environment][4].

To be honest, even if you are using some other desktop environment, you can still take some hints about what changes to do. But you have to make sure to follow the steps using your DE’s tools.

#### Prerequisites: GNOME Tweaks and GNOME Extensions

Please make sure to [install GNOME Tweaks tool][5]. You’ll need it for changing the themes and icons.

You’ll also need to [enable GNOME Extensions][6] for changing GNOME Shell and adding planks.

After you enable GNOME Extension, you need to install “user themes” extension from [Gnome extensions][7] or just go to [this link][8] and click on the switch to turn it on.

I also expect you to have some knowledge [about installing themes in Ubuntu][9]. I’ll briefly touch on this subject, though.

Let’s see the steps one by one.

#### Step 1: Install a macOS inspired GTK theme

Since the focus is on making GNOME look like macOS, you should choose a macOS like theme. There are plenty of themes which are macOS like.

**Download a theme of your choice**

You can go to [Gnome-look][10] site, and look for themes for GTK3. Don’t worry if you see “Pling” written on the Gnome-look website, they both are from same providers.

You can choose any theme you want. Here are some macOS themes I think you should take a look at:

[**mcOS 11**][11]

[McHigh Sierra][12]

[Catalina][13]

[McMojave][14]

I shall be using “[McMojave][14]” in this article. You can choose any theme you want. You will find dropdown download button on the right side of website, click on it.

![McMojave Dark Theme][15]

Here you may find various “.tar.xz” files. These different files contain same theme with small differences. Like in “McMojave” we have variations like dark and light theme. You can try them all, or just pick anyone you like from the carousel given in middle.

**Set downloaded theme**

Extract the downloaded theme and copy this extracted theme folder to .local/share/themes folder.

Open GNOME Tweak tool and change the Application and Shell theme. As soon as you change the themes, you can see those three yellow, green and red buttons, and that Apple logo on upper left corner. You can also notice come changes on panel items.

![McMojave GTK and Shell theme][16]

#### Step 2: Install macOS like icons

The next step in this macOS makeover is to use macOS like icons.

**Download icon set**

Here are some icon sets I suggest that you can download from Gnome-look website:

[McMojave-circle][17]

[Mojave CT-icons][18]

[Cupertino icons][19]

I shall be using “[McMojave-circle][17]” in this article, feel free to use any icons you like.

Just like the theme, you can download it from “download” dropdown button from right side. Here you may also find various different versions of same icons.

![Mcmojave Circle][20]

**Set icon**

Now set the downloaded icon. For that extarct the download folder and copy it to .icons folder in your home directory. See this article on [installing icon][9] [][9][themes in Ubuntu][9].

This is what this icon looks like:

![McMojave Circle Icons Look][21]

#### Step 3: Add macOS like dock

Without macOS like dock, your Ubuntu will not look like macOS. There are various docks available for Linux. I like [Dash to Dock][22] and I am going to use it here.

Dash to Dock is a GNOME extension. By now you are familar with GNOME Extensions. Just go to [this link][23] and click on toggle button to install it. Your native dock will be automatically replaced with dash-to-dock.

You can change settings by right clicking on “show applications” button (rightmost menu button), and selecting “Dash to dock settings”.

![Dash To Dock][24]

#### Step 4: Use macOS wallpaper

Most of the complicated stuff are done. Now it’s time to set macOS wallpaper. You can download macOS default wallpapers from the link below:

[Download macOS wallpapers][25]

**Change the desktop background**

I shall be using “Mojave Day” wallpaper. Right click on the downloaded image and select ‘Set As Wallpaper’ option to change the wallpaper.

After setting this wallpaper, this is how my system looks like:

![][26]

**Change the lock screen Wallpaper**

The lock screen background option is removed from the settings of [Ubuntu 20.04][27]. Now it uses blurred desktop wallpaper as the background of lock screen.

To set a custom lock screen wallpaper, you can use “[Lock screen background][28]” extension.

Open “Lock screen background” extension setting, and set lock screen wallpaper.

![Lock Screen Background Setting][29]

This is how the lockscreen looks now. If you are wondering, here’s [how to take screenshot of lockscreen in Ubuntu][30].

![Lock Screen][31]

![Login Screen][32]

#### Step 5: Change system fonts

For several years, the primary system font in macOS is ‘San Francisco’. But this San Francisco font is not public domain but proprietary like so many other things in the Apple ecosystem. For this reason, you cannot use this font.

What you can do is to use an open source font that looks similar to the San Francisco fonts. I recommend using [Roboto][33] font by Google or [Source Sans Pro][34] by Adobe.

[Installing fonts is straightforward in Ubuntu][35]. Download the zip files of the fonts and just double-click on the ttf files in the extracted folder. It will give you the option to install the fonts one by one.

If you want to save time and install all the fonts at once, extract all fonts in it to the “.fonts” directory in your home folder (~/.fonts).

![Installing fonts][36]

Once you have installed the fonts, you can change the system wide font using GNOME Tweaks tool.

![Set Fonts][37]

#### Bonus Tip: Spotlight like app launcher (if you want to go the extra mile)

If you are a fan of macOS Spotlight launcher, you may have something similar on Linux also. My favorite package for getting this kind of launcher is “[Albert][38]“.

You can find the [installation instruction for Albert on its website][39].

After installing; open “Albert” and set hotkey (key combination you want for opening launcher) and you are good to go. I think in macOS, the Command+Space is to launch Spotlight. You may set Super+Space [keyboard shortcut in Ubuntu][40].

You will get many themes in built, in picture below I’ve used “Spotlight dark”.

Albert won’t be able to launch apps directly, you have to give it permissions for where it can look for search results.

![Albert Settings][41]

After setting up, this is how it looks:

![Albert dark theme][42]

This is how my Ubuntu 20.04 looks like after making all the customizations. Does it look like macOS? You be the judge.

![macOS Theme][43]

![Ubuntu with macOS makeover][44]

So, this is how you can make your GNOME desktop look like macOS. As I said in the beginning, this is a good example of Linux desktop’s customization capability.

If you have any new ideas or have any queries; the comment section is all yours.

_Written by Sumeet with additional inputs from Abhishek Prakash._

--------------------------------------------------------------------------------

via: https://itsfoss.com/make-ubuntu-look-like-macos/

作者：[Community][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/itsfoss/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/why-use-linux/
[2]: https://itsfoss.com/best-indicator-applets-ubuntu/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/Make-Ubuntu-Look-like-MacOS.png?ssl=1
[4]: https://itsfoss.com/find-desktop-environment/
[5]: https://itsfoss.com/gnome-tweak-tool/
[6]: https://itsfoss.com/gnome-shell-extensions/
[7]: https://extensions.gnome.org/
[8]: https://extensions.gnome.org/extension/19/user-themes/
[9]: https://itsfoss.com/install-themes-ubuntu/
[10]: https://www.gnome-look.org/
[11]: https://www.pling.com/p/1220826
[12]: https://www.pling.com/p/1013714
[13]: https://www.pling.com/p/1226871
[14]: https://www.pling.com/p/1275087
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/McMojave-dark-theme.png?ssl=1
[16]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/McMojave-Desktop.png?ssl=1
[17]: https://www.gnome-look.org/p/1305429/
[18]: https://www.gnome-look.org/p/1210856/
[19]: https://www.gnome-look.org/p/1102582/
[20]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/McMojave-circle-.png?ssl=1
[21]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/McMojave-circle-icons-look.png?fit=800%2C494&ssl=1
[22]: https://github.com/micheleg/dash-to-dock
[23]: https://extensions.gnome.org/extension/307/dash-to-dock/
[24]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/Dash-to-dock-1.png?ssl=1
[25]: https://oswallpapers.com/category/mac-os/
[26]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/Wallpaper.png?fit=800%2C450&ssl=1
[27]: https://itsfoss.com/ubuntu-20-04-release-features/
[28]: https://extensions.gnome.org/extension/1476/unlock-dialog-background/
[29]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/Lock-screen-background-setting.png?ssl=1
[30]: https://itsfoss.com/screenshot-login-screen-ubuntu-linux/
[31]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/Lock-screen-1.png?ssl=1
[32]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/Login-screen-1.png?ssl=1
[33]: https://fonts.google.com/specimen/Roboto?query=robot
[34]: https://adobe-fonts.github.io/source-sans-pro/
[35]: https://itsfoss.com/install-fonts-ubuntu/
[36]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/Fonts.png?ssl=1
[37]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/Set-fonts.png?ssl=1
[38]: https://albertlauncher.github.io/
[39]: https://albertlauncher.github.io/docs/installing/
[40]: https://itsfoss.com/ubuntu-shortcuts/
[41]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/Albert-settings.png?ssl=1
[42]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/Albert-look.png?ssl=1
[43]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/macOS-theme.png?fit=800%2C450&ssl=1
[44]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/macOS-theme-2.png?fit=800%2C450&ssl=1

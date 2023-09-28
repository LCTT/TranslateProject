[#]: subject: "4 Incredibly Simple Ways to Customize Budgie Desktop in Linux"
[#]: via: "https://itsfoss.com/budgie-customization/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

4 Incredibly Simple Ways to Customize Budgie Desktop in Linux
======

If you ask me to make the MATE desktop modernized with added features and GTK support, I may come up with something like Budgie!

Budgie is an impressive desktop environment (DE) that provides you with a familiar layout along with a unique user experience.

So, how can you customize the Budgie desktop to elevate your experience? Fret not; I got your back here with some essential tips to tweak your Budgie experience.

I will help you do the following:

  * **Change wallpaper**
  * **Change themes, icons, and cursor (the easy way)**
  * **Customize panel**
  * **Customize dock**



Let us get started! 🤩

### 1\. Change the wallpaper of Budgie DE

The Budgie desktop comes with some beautiful wallpapers pre-installed.

To change the wallpaper on Budgie's desktop, all you have to do is follow two simple steps:

  1. Right-click on the home screen and choose `Change Desktop Backgroun` option
  2. Select the image, and it will be applied to your home screen



![Click to enlarge the image][1]

But if you don't like the available options, you can always download wallpapers from the web.

Once done, open the file manager, navigate to where the image is located, right-click on the image, and choose the `Set as Wallpaper...` option.

![][2]

### 2\. Change the desktop theme, icons, and cursor theme

Traditionally, we download themes from the web, extract the downloaded file, and move files to the respective directory to [apply the theme on Linux][3].

![][4]

But that takes a while and may not be the quickest way to do it. You are free to explore it above if you are curious.

And that's where the **ocs-url** tool comes into play.

A tool that will install any theme (from portals like _gnome-look.org_ ) with a single click.

💡

Gnome-look.org and pling.com are a network of sites by [Opendesktop.org][5] to help you find themes, wallpapers, icons, and other goodies in a single place.

It is in no way officially affiliated with any desktop environment.

But the sad part is that it is not available in the package manager of any Linux distribution, which means you have to install it on your system manually.

So first, go to the [official download page of the ocs-url][6], go to the `Files` tab, and download packages for your system:

![][7]

Once done, open your terminal and change the directory where the file was downloaded. For the most users, it will be the `Downloads` directory:

```

    cd Downloads

```

Now, use the following command for your Linux distro:

**For Ubuntu:**

```

    sudo dpkg -i ocs-url*.deb

```

**For Fedora:**

```

    sudo dnf install qt5-qtbase qt5-qtbase-gui qt5-qtsvg qt5-qtdeclarative qt5-qtquickcontrols && sudo rpm -i ocs-url*.rpm

```

**For Arch:**

```

    sudo pacman -S qt5-base qt5-svg qt5-declarative qt5-quickcontrols && sudo pacman -U ocs-url*.pkg.tar.xz

```

**For openSUSE:**

```

    sudo zypper install libQt5Svg5 libqt5-qtquickcontrols && sudo rpm -i ocs-url*.rpm

```

Now, let's take a look at how you install system themes, icons, and cursor themes.

#### Change system theme

To change the system theme, first, visit the [Gnome Look][8] portal and select your preferred theme (you can choose between GTK 3 and 4 themes):

![][9]

Decide any of your favorite themes; here, I'm going with the `Kripton` theme. From there, you will see the option to `Install` themes.

From here, you will have to follow two simple steps:

  * After clicking on the `Install` button, it will show different variations of the theme. Choose one of them.
  * Next, it will open a prompt, there you have to hit the `Install` button:



![][10]

It will open ocs-url asking you whether you want to install the selected theme.

Simply press the `OK` button to install the theme:

![][11]

Now, access the **Budgie Desktop Settings** and pick the installed theme from the `Widget` option under **Style** section.

![][12]

#### Change icons

To change icons, [visit the Icon section of the Gnome-look][13] portal, and find/search for the icon that suits you the best:

![][14]

Once you find that perfect icon, you will find two options there: Download and Install. Click on the `Install` button.

You may find multiple icons, but in most cases there will only be one. Click on that option, it will open a prompt. Again, hit the `Install` button:

![][15]

Soon, you'll see a prompt from ocs-url asking whether you want to install the selected icon pack or not. Hit the `OK` button to install the icon pack:

![][16]

Next, open the **Budgie Desktop Settings** and from the icons, you can select the recently installed icons (I went with the elementary-kde option):

![][17]

#### Change cursor theme

Similar to the above, [visit the Gnome Look's cursor icon section][18] to find the most suitable cursor theme for you:

![][19]

Once you find the perfect cursor theme, click on the option, and you will see the option to install the selected cursor theme.

It will open a prompt and there, click again on the installation button:

![][20]

You will see a prompt from the ocs-url to install the cursor theme. All you have to do is press the `OK` button to start the installation:

![][21]

Once done, open the Budgie Desktop Settings and choose the cursor theme from the `Cursors`:

![][22]

### 3\. Customize the panel in Budgie Desktop

Depending on the Linux distro, the position for the panel may differ. For instance, you could be using Solus Budgie or Ubuntu Budgie.

To access the settings for the panel, open the Budgie Desktop Settings, and from there you will find the settings for the panel:

![][23]

As you can see, it shows the enabled applets on the panel in three sections:

**Start** (extreme left), **Center** , and **End** (extreme right).

📋

Remember, each applet has multiple options so you can also configure them individually.

You can adjust between them. For example, here, I moved the clock to the left side as it suits my workflow much better:

![][24]

To move applets, all you have to do is select the applet and use the up and down arrow buttons **located above the list of the applet.**

If you want to remove the applet, just select the applet and use the delete button:

![][25]

To add more applets, there is an option to add applet with the `+` icon. Simply press the button, and it will list all the available applets to you.

Once you find a useful applet, select the applet and click on the `Add` button:

![][26]

If you want to make the panel transparent, add shadows, increase/decrease space between applets, then go to the settings menu as shown below:

![][27]

For example, here, I made my panel transparent and added shadows to make it look pleasant:

![][28]

### 4\. Customize the dock in the Budgie Desktop

In this section, I will walk you through the following ways to make your dock look appealing and functional:

  * Changing the theme of the dock
  * Adding docklets to add more features to the dock



#### Change the theme of the dock

Sorry, but the ocs-url tool won't help you change the theme of the dock, so the only way you are left with it is the manual way!

First, [visit the Gnome Look's Plank theme][29] section and download any of your favorite plank dock themes.

Here, I went for the Monterey theme to mimic macOS (dark-inline version):

![][30]

Now, open the terminal and navigate to where the theme was downloaded.

For most users, it will be the `Downloads` directory:

```

    cd ~/Downloads

```

Now, [use the unzip command][31] to extract files to the `.local/share/plank/themes/`:

```

    unzip <theme_name.zip> -d .local/share/plank/themes/

```

In my case, it looked like this:

```

    unzip Monterey-Dark-inline.zip -d ~/.local/share/plank/themes/

```

![][32]

Next, open the `Plank preferences` and change to the recently installed theme.

I changed mine to `Monterey -Dark inline`:

![][33]

#### Add docklets to have more features

Think of docklets as applets but for the dock but unlike applets, you are not given many options.

To add/remove docklets, first, open the `Plank preferences` and go to the `Docklets` menu to list the available options:

![][34]

Now, if you want to add docklets, simply drag them to the dock:

![][35]

But what if you would like to remove the added docklets?

Well, that's pretty simple! Just drag them out of the dock and they will be removed:

![][36]

### Ready to Get Started With Budgie?

Sure, you can always install a Linux distribution with Budgie desktop environment baked in—for convenience.

However, you can also choose to [install Budgie][37] on your existing distro, such as Ubuntu:

![][4]

For this tutorial, I utilized Ubuntu Budgie. The steps work for Budgie desktop no matter the distribution you use.

_💬 How do you customize your Budgie desktop experience? Do you want to add any tips to this article? Share your experiences in the comments down below._

--------------------------------------------------------------------------------

via: https://itsfoss.com/budgie-customization/

作者：[Sagar Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/content/images/2023/08/Change-wallpaper.png
[2]: https://itsfoss.com/content/images/2023/08/Set-third-party-wallpaper-in-budgie-desktop.png
[3]: https://itsfoss.com/install-themes-ubuntu/
[4]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[5]: https://www.opendesktop.org/
[6]: https://www.opendesktop.org/p/1136805/
[7]: https://itsfoss.com/content/images/2023/08/Download-ocs-url-in-budgie.png
[8]: https://www.gnome-look.org/browse?cat=135&ord=latest
[9]: https://itsfoss.com/content/images/2023/09/Open-gnome-look-to-install-system-themes-in-budgie-desktop.png
[10]: https://itsfoss.com/content/images/2023/09/Install-theme-from-ocs-url-in-budgie-dekstop.png
[11]: https://itsfoss.com/content/images/2023/09/Install-theme-from-ocs-url.png
[12]: https://itsfoss.com/content/images/2023/09/Change-theme-in-Budgie-desktop-using-the-budgie-desktop-settings-1.png
[13]: https://www.gnome-look.org/browse?cat=132&ord=latest
[14]: https://itsfoss.com/content/images/2023/09/Download-icons-for-budgie-desktop.png
[15]: https://itsfoss.com/content/images/2023/09/Install-icons-for-budgie-desktop-environment.png
[16]: https://itsfoss.com/content/images/2023/09/Use-ocs-url-to-install-icons-in-budgie-desktop-environment.png
[17]: https://itsfoss.com/content/images/2023/09/Select-icon-to-customize-the-budgie-desktop-from-budgie-desktop-settings.png
[18]: https://www.gnome-look.org/browse?cat=107&ord=latest
[19]: https://itsfoss.com/content/images/2023/09/Download-cursor-icons-for-budgie-desktop.png
[20]: https://itsfoss.com/content/images/2023/09/Install-cursor-icons-for-the-budgie-desktop-environment.png
[21]: https://itsfoss.com/content/images/2023/09/Install-the-cursor-icon-theme-in-budgie-desktop-environment-using-the-ocs-url.png
[22]: https://itsfoss.com/content/images/2023/09/Select-the-cursor-icon-theme-from-the-budgie-desktop-settings-for-custoomizing-the-budgie-desktop-environment.png
[23]: https://itsfoss.com/content/images/2023/09/Access-budgie-desktop-panel-settings.png
[24]: https://itsfoss.com/content/images/2023/09/Move-applets-in-budgie-desktop.png
[25]: https://itsfoss.com/content/images/2023/09/Delete-applet-from-the-panel.png
[26]: https://itsfoss.com/content/images/2023/09/Add-applet-in-budgie-desktop-environment.png
[27]: https://itsfoss.com/content/images/2023/09/Tweak-panel-of-the-budgie-desktop.png
[28]: https://itsfoss.com/content/images/2023/09/Add-transparency-and-shadows-in-budgie-desktop-panel-1.png
[29]: https://www.gnome-look.org/browse?cat=273&ord=latest
[30]: https://itsfoss.com/content/images/2023/09/Download-theme-for-the-plank-dock-in-budgie-desktop-environment.png
[31]: https://itsfoss.com/unzip-linux/
[32]: https://itsfoss.com/content/images/2023/09/extract-plank-dock-themes-in-budgie-desktop.png
[33]: https://itsfoss.com/content/images/2023/09/Change-theme-in-plank-dock-1.png
[34]: https://itsfoss.com/content/images/2023/09/Docklets-in-Plank-dock.png
[35]: https://itsfoss.com/content/images/2023/09/Add-docklets-in-Plank-dock-budgie-desktop-configuration.gif
[36]: https://itsfoss.com/content/images/2023/09/Remove-docklets-from-the-plank-budgie-desktop.gif
[37]: https://itsfoss.com/install-budgie-ubuntu/

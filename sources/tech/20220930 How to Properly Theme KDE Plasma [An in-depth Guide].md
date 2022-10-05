[#]: subject: "How to Properly Theme KDE Plasma [An in-depth Guide]"
[#]: via: "https://itsfoss.com/properly-theme-kde-plasma/"
[#]: author: "sreenath https://itsfoss.com/author/sreenath/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Properly Theme KDE Plasma [An in-depth Guide]
======
If you have been using Linux for some time, you know about KDE Plasma, the desktop environment.

Many distributions ship KDE Plasma as the default (or flagship) desktop environment.

Hence, it is not surprising to find it among the [best desktop environments][1].

KDE Plasma desktop is famous for its endless possibilities of customizations. Not to forget, we have a [KDE customization guide][2] to help you in all the different ways.

**How do you approach tweaking KDE Plasma’s theme to suit your taste?**

Many users fail to understand how KDE themes work. It is not a straightforward process; there’s a Global theme, there’s a Plasma theme, there are color schemes, Window decorations, and so many other things!

![KDE Plasma Theme elements][3]

**So, what are the things you need to know to get a consistent experience with your choice of theme?**

In this article, I aim to address that and give you all the details you need to properly theme KDE Plasma and help you know the nuts and bolts of it.

Table of Contents

* What is the Purpose of Theming?
* 1. Selecting a Theme for Your KDE Plasma  * A. Does the theme has all the components needed?  * B. Does it have an associated Kvantum theme?  * C. Does the theme have a GTK version of the theme?  * D. A compatible Icon and Cursor Pack?
* 2. Exploring The Global Theme  * Apply Global Theme via System Settings  * Apply Theme Manually
* 3. Icon and Cursor Theme
* 4. Applying GTK Themes
* 5. Applying Desktop Effects and Scripts
* 6. Kvantum Themes
* 7. Installing Fonts
* 8. Tweaking the Panels
* 9. Adding Widgets
* Get Creative With KDE Plasma

### What is the Purpose of Theming?

Before we go to the theming, we should be clear about the purpose. There are many ways you can theme a desktop, for productivity, nerd theming (for fun), or overwhelming ricing, that may seriously impact the resource utilization of your system.

But, most of the above use-cases have several common aims:

* A different look and feel to all apps in the system.
* Easier to get the thing done, or in other words, a better workflow.
* Taking care of your eyes (sometimes it’s just aesthetic, and you know it!).

Everything depends on user preferences. But you need to have a uniform look and feel. To get that, you need to know a few things…

### 1. Selecting a Theme for Your KDE Plasma

Coming to KDE Plasma or GNOME, there is no limitation to the availability of themes. Several dedicated sites provide an endless stream of themes that can be downloaded free of cost.

We already have a [list of recommended KDE Plasma themes][4] if you want to explore them.

So, what should you focus on when theming your system? Well, there are a couple of things to note:

#### A. Does the theme has all the components needed?

This is not an issue if you install the themes via KDE System Settings. But in some cases, you may be in a situation where there is only a global theme that does not provide a uniform look for every element on your desktop. You need to keep an eye out for that.

#### B. Does it have an associated Kvantum theme?

Kvantum is an SVG-based theme engine for Qt5 that gives you great control to tweak a theme.

Suppose you want the ability to tweak things like Window transparency, blur, etc. You might want to select a theme that has a Kvantum theme.

You can find this detail in the theme description from the store you download it.

#### C. Does the theme have a GTK version of the theme?

It is best to have a theme with both Kvantum and GTK versions because not every app you use will be based on Qt.

**Related:** [Best Linux Distributions Based on KDE][5]

#### D. A compatible Icon and Cursor Pack?

This is not a concern by itself. Because icons and cursor, for the most part, do not affect the themes. But, it can affect the case of Dark/Light themes. A dark theme often requires a dark icon pack and vice versa for better visibility. The same visibility can be an issue with the cursor colors too. So keep this in mind if you encounter any such problems.

### 2. Exploring The Global Theme

The global theme can be applied to KDE Plasma in two ways. You can simply apply the global theme. Or, you can change individual Plasma Themes, colors, etc., depending on how you apply the global theme.

#### Apply Global Theme via System Settings

This is the most common and straightforward way of applying the theme. You need to go to the system settings and from there to appearance. Here, you can find the “**Global Theme**” Tab. Go to the “**Get New Global Theme**” button on the bottom right.

![Get new global themes option in KDE system settings][6]

This opens the themes dialog, where you can download the themes by pressing the install button associated with each entry. Here, there are options to sort the items according to several criteria like most downloaded, highest rated, etc.

![Themes available to download, listed in KDE Plasma system settings][7]

Most of the time, there will be a prompt to enter the password. This is for installing the corresponding SDDM (Simple Desktop Display Manager) theme that affects the login screen.

Please enter the password for installing it successfully. Once downloaded, close this window and change the theme from Settings > Appearance > Global Themes. This will apply the theme to windows and Plasma and will also add theme-specific window decorations.

#### Apply Theme Manually

Most of the time, themes will be available in the system settings. But in some cases, you may find them only on websites like [Pling][8], and [KDE Store][9].

**This is how the theme descriptions look in those stores. Download the theme you want:**

![themes kde][10]

In this case, download and extract the “Global Theme” and “Plasma Theme” files.

Now, copy the extracted “Global Theme” folder to **~/.local/share/plasma/look-and-feel**.If you don’t find this folder inside the directory, pleasd change the theme randomly once through global settings and the folders wilappeared after that.

Copy the extracted “Plasma Theme” folder to **~/.local/share/plasma/desktoptheme**.

![KDE Plasma themes folder in file manager][11]

After this step, you can go to **system settings -> appearance** and change to the new theme you installed. Most of the time, a particular theme like Plasma, colors, etc. installed by you remains unselected until you choose and apply them. You need to change all themes manually in his method.

### 3. Icon and Cursor Theme

A corresponding icon set and cursor will be installed for themes applied through the system settings. You don’t need to do anything. But, if you want a new icon set, go to **Settings > Appearance > Icons**. Here, click on the Get new Icons Set button and install the required icons from the window, as we did with the themes.

![Install icon theme from KDE system settings (click to expand image)][12]

Once done, choose the icon pack we installed and click apply at the bottom right to change to the new icons.

To install icon themes manually, download and extract the icon’s tar file. After that, copy the contents to **~/.local/share/icons**. This icon set will now be ready to get applied in Appearance > Icons.

Do remember that, for dark themes, dark variants of icons look better.

### 4. Applying GTK Themes

**What is the purpose of GTK Themes in KDE Plasma?**

As mentioned earlier, we use many GTK apps. But those apps just ignore the system themes that we apply across our desktops. So, we need to install a GTK theme to satisfy those. For a unified look, this should also need the same theme that you applied to other places.

You might want to explore some of the [best dark GTK themes][13].

To install GTK themes in KDE Plasma, you must first download them. You ca download the theme, you want. Now, just go to **Settings > Appearance > Application Style > Get New GNOME/GTK Application Styles**, as shown in the screenshot below:

![Set GTK Application style inside system settings (click to expand image)][14]

This will pop up a window, displaying the GTK Themes. Select the one that suits your need, and install it. This can then be selected from the drop-down menu, as shown in the above screenshot. Select it, and don’t forget to press the apply button.

If you have a theme file downloaded from the internet, click the “**install from file**” button. Now, just select the tar file of the theme (No need to extract). It will be applied ,and you will be able to select it from the same drop-down menu.

### 5. Applying Desktop Effects and Scripts

One of the main features of the KDE Plasma desktop is its offering of desktop effects within system settings. You can find it under **Settings > Workspace Behaviour > Desktop Effects**.

It is pretty much self-explanatory. But, you can find [documentation][15] for the same.

![KDE settings desktop effects page (click to expand image)][16]

You can experiment with various options here and test what features you need.

As a bare minimum, I suggest turning on **Blur** and **Overview** in these settings can make a good look overall. Here, the “overview” setting will allow you to set hot corner overview, just like the GNOME desktop.

When coming to scripts, you should know how to install and change kwin scripts. These are codes written by the community that can enhance the performance of your window manager. So, you should research more about what it does before jumping in.

To install scripts, you need to go to **Settings > Window Management > KWin Scripts**. There are some pre-installed KWin scripts. But you can download and install other KWin scripts as shown below:

![Install KWin scripts through KDE plasma system settings (click to expand image)][17]

One of the major scripts, that is popular is “Force Blur”, which blurs some user-specified windows. Other extensions, like tiling extensions, are available, which can make your KDE Plasma, a tiling Window Manager too, if not overstated.

### 6. Kvantum Themes

If your theme does not give you a unified look just yet, you need to install Kvantum version of your theme.

To install a Kvantum theme, you need the **[Kvantum manager][18]**.

By default, the Kvantum manager is not installed. You need to download and install it. In my case, I used Kubuntu for this article.

**To install Kvantum manager in Ubuntu or other Debian based distros, use the command below:**

```
sudo apt install qt5-style-kvantum
```

This will install the Kvantum manager. Once it’s done, open it and just peek around the app to explore. Download the Kvantum theme you need.

Once done, you can install it by selecting the extracted folder within the app, as shown in the screenshot below:

![Select and install Kvantum theme][19]

Once installed, you can set the newly installed kvantum theme, by going to the “**Change / Delete Theme**” tab through the drop-down menu.

![Apply newly installed kvantum theme (click to expand image)][20]

While it will apply the desired settings that the theme intends, you still have great control over what to change and what not to.

![Customising inside kvantum manager (click to expand image)][21]

To get a decent dolphin view (file manager look), you should ensure that the “**Transparent Dolphin View**” is enabled. All the other tweaks are self-explanatory, with popup explanations on hover. You can give all of the tweaks a try.

### 7. Installing Fonts

Fonts are an essential part of customization. For many, the default fonts are enough.

Also, there is a vast number of pre-installed variants. This can be changed through the system settings.

![Change or install font from system settings (click to expand image)][22]

You can change fonts by selecting a font and applying it. Or you can download and install fonts through the button provided for the same in the bottom right.

While installing fonts, you can either install them for the current user or as a system-wide font.

### 8. Tweaking the Panels

Panels play a significant role in KDE Plasma. The default panel does not offer a lot. But it will satisfy most of your needs.

The newer versions of KDE Plasma include a floating panel, which improves the look and feel great.

![KDE plasma panel in edit mode (click to expand image)][23]

Here, you can right-click on the panel and access edit mode. The default KDE Panel from KDE 5.25+ provides a floating mode, which makes it look pretty. You can add widgets to your panel and spacers to tweak them.

### 9. Adding Widgets

Widgets hold a very significant place in the KDE Plasma system. You can place widgets either directly on the desktop, or you can put them inside the panel. By default, Plasma offers a decent collection of widgets pre-installed. But there is a huge collection of custom widgets that can be downloaded and installed.

To get widgets, you can simply right-click on the desktop and select “**Add Widgets**“.

![Add widgets to desktop using the right-click menu][24]

Inside this, you can either click/drag the existing widgets to the desktop/panel or download new widgets online or from a downloaded file and add them later.

![Access widgets list in KDE plasma (click to expand image)][25]

There are several cool widgets out there that can aid you in customizing your desktop. More interestingly, most of the widgets are configurable to your taste. All you need is to right-click and configure the particular widgets.

### Get Creative With KDE Plasma

KDE Plasma is one of the most configurable desktops out there. Do you imagine a combination for your theme? You have infinite ways to apply that on KDE.

Hope this guide helps you learn the fundamentals of KDE themes and helps you in your adventure to get the best theme for your system!

--------------------------------------------------------------------------------

via: https://itsfoss.com/properly-theme-kde-plasma/

作者：[sreenath][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sreenath/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/best-linux-desktop-environments/
[2]: https://itsfoss.com/kde-customization/
[3]: https://itsfoss.com/wp-content/uploads/2022/09/kde-plasma-elements.png
[4]: https://itsfoss.com/best-kde-plasma-themes/
[5]: https://itsfoss.com/best-kde-distributions/
[6]: https://itsfoss.com/wp-content/uploads/2022/09/get-new-global-themes-option-in-kde-system-settings.webp
[7]: https://itsfoss.com/wp-content/uploads/2022/09/themes-available-to-download-listed-in-kde-plasma-system-settings.webp
[8]: https://www.pling.com/p/1293160/
[9]: https://store.kde.org/browse/
[10]: https://itsfoss.com/wp-content/uploads/2022/09/themes-kde.jpg
[11]: https://itsfoss.com/wp-content/uploads/2022/09/kde-plasma-themes-folder-in-file-manager-1.png
[12]: https://itsfoss.com/wp-content/uploads/2022/09/install-icon-theme-from-kde-system-settings.png
[13]: https://itsfoss.com/dark-gtk-themes/
[14]: https://itsfoss.com/wp-content/uploads/2022/09/set-gtk-application-style-inside-system-settings.png
[15]: https://docs.kde.org/trunk5/en/kwin/kcontrol/kwineffects/index.html
[16]: https://itsfoss.com/wp-content/uploads/2022/09/kde-settings-desktop-effects-page.png
[17]: https://itsfoss.com/wp-content/uploads/2022/09/install-kwin-scripts-through-kde-plasma-system-settings.png
[18]: https://store.kde.org/p/1005410
[19]: https://itsfoss.com/wp-content/uploads/2022/09/select-and-install-kvantum-theme.png
[20]: https://itsfoss.com/wp-content/uploads/2022/09/apply-newly-installed-kvantum-theme.png
[21]: https://itsfoss.com/wp-content/uploads/2022/09/customising-inside-kvantum-manager.png
[22]: https://itsfoss.com/wp-content/uploads/2022/09/change-or-install-font-from-system-settings.png
[23]: https://itsfoss.com/wp-content/uploads/2022/09/kde-plasma-panel-in-edit-mode.webp
[24]: https://itsfoss.com/wp-content/uploads/2022/09/add-widgets-in-desktop-right-click-menu.png
[25]: https://itsfoss.com/wp-content/uploads/2022/09/access-widgets-list-in-kde-plasma.webp

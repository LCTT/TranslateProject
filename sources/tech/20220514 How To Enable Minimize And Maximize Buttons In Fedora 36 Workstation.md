[#]: subject: "How To Enable Minimize And Maximize Buttons In Fedora 36 Workstation"
[#]: via: "https://ostechnix.com/how-to-enable-minimize-and-maximize-buttons-in-fedora/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How To Enable Minimize And Maximize Buttons In Fedora 36 Workstation
======
Today, we will see one of the post installation steps in Fedora desktop. This brief guide explains how to enable minimize and maximize buttons in application windows in Fedora GNOME Workstation and Silverblue editions.

### Introduction

As you may already know, there is no minimize and maximize buttons in Application windows in Fedora Silverblue as well as Fedora GNOME Workstation editions.

If you want to minimize an application window, you need to right click on its title bar and choose the minimize option from the context menu.

Unfortunately, you don't even get that option in Firefox with your mouse. To minimize Firefox window, you should hit the **Left ALT+SPACEBAR** keys and choose Minimize option.

I don't know what is the benefit of hiding most frequently used buttons. Ubuntu GNOME desktop has the min/max buttons, but Fedora hasn't.

If you want to bring back the minimize and maximize buttons in Fedora GNOME and Silverblue editions, you can enable them with the help of **Gnome Tweaks** utility and **Dash to Panel** extension in Fedora.

### Install Gnome Tweaks in Fedora

**Gnome Tweaks**, previously known as **Tweak Tool**, is a Graphical interface for advanced GNOME 3 settings. It is primarily designed for GNOME Shell, however it can be used in other desktops as well. You may not have all features if you use Tweaks on a different desktop. It is available in the default repositories of Fedora. So you can install Gnome Tweaks on Fedora using `dnf` package manager like below:

```
$ sudo dnf install gnome-tweaks
```

If you are on Fedora Silverblue, you need to enter into your toolbox container using command:

```
$ toolbox enter
```

And then install Tweaks as shown in the previous command.

### Add Gnome Shell Integration Add-on In Browser

Make sure you have added **"Gnome Shell Integration"** add-on in your browser. This extension provides integration with GNOME shell and the corresponding extensions repository.

If you haven't added it yet, go to Plugins sections and search for it and install it.

![Add Gnome Shell Integration Add-on In Firefox Browser][1]

A pop up window will appear. Click "Add" to enable the add-on. After adding this extension, you will see the GNOME logo on the browser's tool bar.

### Enable Dash to panel extension in Fedora

The **Dash to panel** extension is an icon taskbar for the Gnome Shell. This extension moves the dash into the gnome main panel so that the application launchers and system tray are combined into a single panel, similar to that found in KDE Plasma and Windows 7+ operating systems.

The Dash to panel extension gives you a permanently visible panel with favorite shortcuts. So a separate dock is no longer needed for easy access to running and favorited applications.

To enable Dash to panel extension, go to **GNOME extensions** site and search for **"Dash to panel"** extension.

![Search for Dash to panel extension in Gnome extensions site][2]

Click the Dash to panel link in the search results. You will be redirected to Dash to panel extension official page. Click on the **ON** button.

![Enable Dash to panel extension][3]

In the next window, click Install button to enable Dash to panel extension.

![Install Dash to panel extension][4]

One this extension is activated, you will see the Dash panel at the bottom along with your favorite shortcuts.

### Enable minimize and maximize buttons in Fedora

Open the **Gnome Tweaks** application. Go to **Windows Tittlebars** and toggle min/max buttons on.

![Enable minimize and maximize buttons in application windows in Fedora][5]

As soon as you toggled the min/max buttons on, the minimize and maximize buttons will appear in all applications windows.

![Minimize, maximize buttons appears in applications windows in Fedora][6]

By default, the min/max buttons are visible at the right side. You can change its position to left or right.

The Dash to panel extension has lots of fine tuning and customization options. Right click on the Dash panel and choose Settings option and start customizing it as per your liking.

**Resource:**

* [Dash to panel website][7]

--------------------------------------------------------------------------------

via: https://ostechnix.com/how-to-enable-minimize-and-maximize-buttons-in-fedora/

作者：[sk][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/wp-content/uploads/2022/05/Add-Gnome-Shell-Integration-Add-on-In-Firefox-Browser.png
[2]: https://ostechnix.com/wp-content/uploads/2021/01/Search-for-Dash-to-panel-extension-in-Gnome-extensions-site.png
[3]: https://ostechnix.com/wp-content/uploads/2021/01/Enable-Dash-to-panel-extension.png
[4]: https://ostechnix.com/wp-content/uploads/2021/01/Install-Dash-to-panel-extension.png
[5]: https://ostechnix.com/wp-content/uploads/2021/01/Enable-Minimize-And-Maximize-Buttons-In-Application-Windows-In-Fedora.png
[6]: https://ostechnix.com/wp-content/uploads/2021/01/Minimize-maximize-buttons-appears-in-applications-windows-in-Fedora.png
[7]: https://extensions.gnome.org/extension/1160/dash-to-panel/

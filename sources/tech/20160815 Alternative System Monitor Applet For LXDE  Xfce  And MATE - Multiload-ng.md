Alternative System Monitor Applet For LXDE, Xfce, And MATE: Multiload-ng
======

[Multiload-ng][1] is a GTK2 graphical system monitor for the Xfce, LXDE, and MATE panels, forked from the old GNOME Multiload applet. It can also run in a standalone window.

![](https://2.bp.blogspot.com/-U8CFzhSPJho/V7GigDbcLWI/AAAAAAAAYS0/pJMM6Rt5-HkbKljmxzP4-v0oGGxjvH8AgCLcB/s1600/multiload-ng-lxde.png)

Multiload-ng features:

- supported graphs: CPU, memory, network, swap, load average, disk, and temperature;
- highly customizable;
- color schemes support;
- automatically adapts to container changes (panel or wiondow);
- little CPU / memory footprint;
- basic or detailed tooltip information;
- custom actions on double click.

Compared to the old Multiload applet, Multiload-ng comes with an additional graph (temperature), more individual graphical customizations, like individual border color, color schemes support, it responds to mouse events with customizable actions, the orientation can be set regardless of panel orientation. 

It can also run in a standalone window, without a panel:

![](https://1.bp.blogspot.com/-hHoipwFlHrg/V7Gw2s107zI/AAAAAAAAYTQ/fS5OtiL7VvwDEzr6qO_gdEA_qB9YvJa5gCLcB/s400/multiload-ng-standalone.png)

Furthermore, its GitHub page says that more graphs are coming soon.

Here's Multiload-ng in Xubuntu 16.04, with a vertical panel, with horizontal and vertical applet orientation:

![](https://3.bp.blogspot.com/-xa0OML8T-lg/V7Gixksbt8I/AAAAAAAAYS4/Jxo-MukDh3sYlOOk9A1YGtARmte490g8ACLcB/s400/multiload-ng-xfce-horizontal.png)

![](https://1.bp.blogspot.com/-WAD5MdDObD8/V7GixgVU0DI/AAAAAAAAYS8/uMhHJri1GJccRWvmf_tZkYeenVdxiENQwCLcB/s400/multiload-ng-xfce-vertical.png)

The applet preferences window isn't exactly pretty, but there are plans to improve it:

![](https://2.bp.blogspot.com/-P-ophDpc-gI/V7Gi_54b7JI/AAAAAAAAYTA/AHQck_JF_RcwZ1KbgHbaO2JRt24ZZdO3gCLcB/s320/multiload-ng-preferences.png)

Multiload-ng currently uses GTK2, so it won't work with Xfce or MATE (panels) if they are built with GTK3. 

As far as Ubuntu is concerned, only Ubuntu MATE 16.10 uses GTK3. However, the MATE System Monitor applet is also a fork of Multiload GNOME applet, so they share most features (minus the extra customization provided by Multiload-ng, and the temperature graph).

The applet wishlist page mentions plans for a GTK3 port, and various other improvements, like more sources for the temperature graph, the ability to show both decimal and binary units, and more.

### Install Multiload-ng


Note that Multiload-ng can't be built on Lubuntu 14.04 due to its dependencies.

Multiload-ng is available in the main WebUpd8 PPA (for Ubuntu 14.04 - 16.04 / Linux Mint 17.x and 18). To add the PPA and update the software sources, use the following commands:

```
sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt update
```

Then, install the applet using the following command:

- for LXDE (Lubuntu):

```
sudo apt install lxpanel-multiload-ng-plugin
```

- for Xfce (Xubuntu, Linux Mint Xfce):

```
sudo apt install xfce4-multiload-ng-plugin
```

- for MATE (Ubuntu MATE, Linux Mint MATE):

```
sudo apt install mate-multiload-ng-applet
```

- standalone (doesn't require a panel):

```
sudo apt install multiload-ng-standalone
```

Once installed, add it to the panel like any other applet. Note that in LXDE, Multiload-ng won't show up in the applet list until the panel is restarted. You can do this by restarting the session (logout/login) or by restarting the panel using the following command:

```
lxpanelctl restart
```

Multiload-ng Standalone can be launched from the menu, like a regular application.

To download the source, report bugs, etc., see the Multiload-ng [GitHub page][2].

--------------------------------------------------------------------------------

via: http://www.webupd8.org/2016/08/alternative-system-monitor-applet-for.html

作者：[Andrew][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.webupd8.org/p/about.html
[1]: https://github.com/udda/multiload-ng
[2]: https://github.com/udda/multiload-ng

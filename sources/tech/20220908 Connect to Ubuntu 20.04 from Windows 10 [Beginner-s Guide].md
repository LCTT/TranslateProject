[#]: subject: "Connect to Ubuntu 20.04 from Windows 10 [Beginner’s Guide]"
[#]: via: "https://www.debugpoint.com/connect-ubuntu-20-04-windows-10/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Connect to Ubuntu 20.04 from Windows 10 [Beginner’s Guide]
======
This beginner’s guide helps you remotely connect to Ubuntu 20.04 from Windows 10. We show you the easy steps with an example.

If you work in a networked environment at your work or set up a small network at home (wired or wireless), you are often required to remote connect to your Ubuntu machine (or any Linux machine).

Although I have created this guide in Ubuntu 20.04 and Windows 10, the following steps ideally should work for any Linux distribution which supports Xrdp for remote connection.

Technically, there are many ways of connecting to any system over the network (internet or intranet). You can use a client such as Remmina (which is an excellent client) to connect via VNC, and RDP protocol. You can even connect via ssh with X forwarding as well.

In this basic guide, I have used the [Xrdp][1], a free and open-source utility server for Microsoft RDP protocol available in Windows.

### Connect to Ubuntu 20.04 from Windows 10 via remote desktop

#### Step 1: Install xrdp in Ubuntu

The following steps do not require any installation or configuration in Windows 10. Although, you must have enough privilege to run the Microsoft RDP client (mstsc).

In Ubuntu 20.04 (or any Ubuntu version or other similar distributions), install the Xrdp via terminal using the below commands.

```
sudo apt install xrdp
```

If you are using Fedora – use the command below.

```
sudo dnf install xrdp
```

And for Arch, use –

```
pacman -S xrdp
```

This should install the xrdp server in your Linux system.

#### Step 2: Enable xrdp service

The next step is to enable the `xrdp` service. The service needs to be always running to listen to incoming remote desktop requests. So to do that, run the below command in Ubuntu (and other systemd-based Linux distributions).

```
systemctl enable xrdp
```

This [systemctl][2] command enables your system to start the service immediately and ensure that it runs automatically the next time you boot.

![enable xrdp][3]

You might want to check whether the service is running via the below command:

```
systemctl status xrdp
```

Also, open the Ubuntu settings and`Enable Sharing` and `Enable Screen Sharing`. Follow the below screenshots.

![Enable sharing in settings][4]

![Enable sharing in settings][5]

#### Step 3: Connect to Ubuntu

Open the Windows 10 Start menu and type Remote to bring up the remote connection dialog. You can also press CTRL+R and run mstsc.

![Start Remote connection from Windows][6]

On the above window, **give the IP address of the target Ubuntu 20.04 system**. You can get the IP address from the `Settings -> Wifi or Network` Section. Alternatively, you can run `ifconfig` or `ip a` to get the IPV4 address of the system.

```
ifconfig
```

Or –

```
ip a
```

Finally, click connect. You should see the below Xrdp prompt.

![xrdp prompt][7]

Choose the session as xrdp or xvnc. Give the username and password of the Ubuntu 20.04 system and press OK.

You should be connected to the Ubuntu 20.04 system.

![Ubuntu 20.04 Connected from Windows 10][8]

### Usage notes and troubleshooting

* Slow rdp session

The response of the remote session is dependent on your network speed. So you might feel a little bit of slowness on actions (click, scroll, etc) on the desktop.

* Blank screen on rdp session

Ensure the user is logged off from the target Ubuntu 20.04 session – which you use for remote connect. If the user logged on and you are connecting – you might see a blank screen in Windows 10 rdp session. This has happened on my test, and I am yet to find out why.

* No customization in rdp session

Ideally, when you log on, a default Xorg profile will be created for the same user. That means you might not see any customizations done by the user. A basic GNOME Shell with all options will be available.

* Repeated Authentication Required popup

![Authentication Prompt][9]

There is a chance that you may see multiple popups (like above) asking for a username and password. The main reason is the implementation of Polkit (a component for controlling system-wide privileges) within Ubuntu. When you log in, Polkit rules check whether the user has certain privileges to perform actions (active or passive). The Polkit rules are more restrictive when connecting via RDP. Hence the popup for Authentication. Fixing this requires a complex Polkit rule setup for the remote RDP users. I am still testing this and am not quite able to fix it. The resolution to this problem will be in an upcoming article.

I hope this guide helps you to set up basic RDP from Windows 10 to Ubuntu 20.04. This guide does not require any additional software installation in Windows 10.

[Next: Connect to WiFi Using Terminal in Arch Linux and Other Distros][10]

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/connect-ubuntu-20-04-windows-10/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: http://xrdp.org/
[2]: https://www.debugpoint.com/2020/12/systemd-systemctl-service/
[3]: https://www.debugpoint.com/wp-content/uploads/2020/12/enable-xrdp.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2020/12/Enable-sharing-in-settings.png
[5]: https://www.debugpoint.com/wp-content/uploads/2020/12/enable-sharing-in-settings-2.png
[6]: https://www.debugpoint.com/wp-content/uploads/2020/12/Start-Remote-connection-from-Windows2.png
[7]: https://www.debugpoint.com/wp-content/uploads/2020/12/xrdp-prompt.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2020/12/Ubuntu-20.04-Connected-from-Windows-10-1.jpg
[9]: https://www.debugpoint.com/wp-content/uploads/2020/12/Authentication-Prompt.jpg
[10]: https://www.debugpoint.com/connect-wifi-terminal-linux/

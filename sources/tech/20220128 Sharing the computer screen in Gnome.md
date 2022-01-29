[#]: subject: "Sharing the computer screen in Gnome"
[#]: via: "https://fedoramagazine.org/sharing-the-computer-screen-in-gnome/"
[#]: author: "Lukáš Růžička https://fedoramagazine.org/author/lruzicka/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Sharing the computer screen in Gnome
======

![][1]

You do not want someone else to be able to monitor or even control your computer and you usually work hard to cut off any such attempts using various security mechanisms. However, sometimes a situation occurs when you desperately need a friend, or an expert, to help you with a computer problem, but they are not at the same location at the same time. How do you show them? Should you take your mobile phone, take pictures of your screen, and send it to them? Should you record a video? Certainly not. You can share your screen with them and possibly let them control your computer remotely for a while. In this article, I will describe how to allow sharing the computer screen in Gnome.

### Setting up the server to share its screen

A **server** is a computer that provides (serves) some content that other computers (clients) will consume. In this article the server runs **Fedora Workstation** with the standard **Gnome desktop**.

#### Switching on Gnome Screen Sharing

By default, the ability to share the computer screen in Gnome is **off**. In order to use it, you need to switch it on:

  1. Start **Gnome Control Center**.

  2. Click on the **Sharing** tab.

![Sharing switched off][2]

  3. Switch on sharing with the slider in the upper right corner.

  4. Click on **Screen sharing**.

![Sharing switched on][3]

  5. Switch on screen sharing using the slider in the upper left corner of the window.

  6. Check the _Allow connections to control the screen_ if you want to be able to control the screen from the client. Leaving this button unchecked will only allow _view-only_ access to the shared screen.

  7. If you want to manually confirm all incoming connections, select _New connections must ask for access._

  8. If you want to allow connections to people who know a password (you will not be notified), select _Require a password_ and fill in the password. The password can only be 8 characters long.

  9. Check _Show password_ to see what the current password is. For a little more protection, do not use your login password here, but choose a different one.

  10. If you have more networks available, you can choose on which one the screen will be accessible.




### Setting up the client to display a remote screen

A **client** is a computer that connects to a service (or content) provided by a server. This demo will also run **Fedora Workstation** on the client, but the operating system actually should not matter too much, if it runs a decent VNC client.

#### Check for visibility

Sharing the computer screen in Gnome between the server and the client requires a working network connection and a visible “route” between them. If you cannot make such a connection, you will not be able to view or control the shared screen of the server anyway and the whole process described here will not work.

To make sure a connection exists

Find out the IP address of the server.

Start **Gnome Control Center**, a.k.a **Settings**. Use the **Menu** in the upper right corner, or the **Activities** mode. When in **Activities**, type

settings

and click on the corresponding icon.

Select the **Network** tab.

Click on the **Settings button** (cogwheel) to display your network profile’s parameters.

Open the **Details** tab to see the IP address of your computer.

Go to **your client’s** terminal (the computer from which you want to connect) and find out if there is a connection between the client and the server using the **ping** command.

```

    $ ping -c 5 192.168.122.225

```

Examine the command’s output. If it is similar to the example below, the connection between the computers exists.

```

    PING 192.168.122.225 (192.168.122.225) 56(84) bytes of data.
    64 bytes from 192.168.122.225: icmp_seq=1 ttl=64 time=0.383 ms
    64 bytes from 192.168.122.225: icmp_seq=2 ttl=64 time=0.357 ms
    64 bytes from 192.168.122.225: icmp_seq=3 ttl=64 time=0.322 ms
    64 bytes from 192.168.122.225: icmp_seq=4 ttl=64 time=0.371 ms
    64 bytes from 192.168.122.225: icmp_seq=5 ttl=64 time=0.319 ms
    --- 192.168.122.225 ping statistics ---
    5 packets transmitted, 5 received, 0% packet loss, time 4083ms
    rtt min/avg/max/mdev = 0.319/0.350/0.383/0.025 ms

```

You will probably experience no problems if both computers live on the same subnet, such as in your home or at the office, but problems might occur, when your server does not have a **public IP address** and cannot be seen from the external Internet. Unless you are the only administrator of your Internet access point, you will probably need to consult about your situation with your administrator or with your ISP. Note, that exposing your computer to the external Internet is always a risky strategy and you **must pay enough attention** to protecting your computer from unwanted access.

#### Install the VNC client (Remmina)

**Remmina** is a graphical remote desktop client that can you can use to connect to a remote server using several protocols, such as VNC, Spice, or RDP. **Remmina** is available from the Fedora repositories, so you can installed it with both the **dnf** command or the **Software**, whichever you prefer. With dnf, the following command will install the package and several dependencies.

```

    $ sudo dnf install remmina

```

#### Connect to the server

If there is a connection between the server and the client, make sure the following is true:

  1. The computer is running.
  2. The Gnome session is running.
  3. The user with screen sharing enabled is logged in.
  4. The session is **not locked**, i.e. the user can work with the session.



Then you can attempt to connect to the session from the client:

  1. Start **Remmina**.

  2. Select the **VNC** protocol in the dropdown menu on the left side of the address bar.

  3. Type the IP address of the server into the address bar and hit **Enter**.

![Remmina Window][4]

  4. When the connection starts, another connection window opens. Depending on the server settings, you may need to wait until the server user allows the connection, or you may have to provide the password.

  5. Type in the password and press **OK**.

![Remmina Connected to Server][5]

  6. Press ![Align with resolution button][6] ![][7] to resize the connection window to match the server resolution, or press ![Full Screen Button][8] ![][7] to resize the connection window over your entire desktop. When in fullscreen mode, notice the narrow white bar at the upper edge of the screen. That is the Remmina menu and you can access it by moving the mouse to it when you need to leave the fullscreen mode or change some of the settings.




When you return back to the server, you will notice that there is now a yellow icon in the upper bar which indicates that you are sharing the computer screen in Gnome. If you no longer wish to share the screen, you can enter the menu and click on **Screen is being shared** and then on select **Turn off** to stop sharing the screen immediately.

![Turn off menu item][9]

#### Terminating the screen sharing when session locks.

By default, the connection **will always terminate** when the session locks. A new connection cannot be established until the session is unlocked.

On one hand, this sounds logical. If you want to share your screen with someone, you might not want them to use your computer when you are not around. On the other hand, the same approach is not very useful, if you want to control your own computer from a remote location, be it your bed in another room or your mother-in-law’s place. There are two options available to deal with this problem. You can either disable locking the screen entirely or you can use a Gnome extension that supports unlocking the session via the VNC connection.

##### Disable screen lock

In order to disable the screen lock:

  1. Open the **Gnome Control Center**.
  2. Click on the **Privacy** tab.
  3. Select the **Screen Lock** settings.
  4. Switch off **Automatic Screen Lock**.



Now, the session will never lock (unless you lock it manually), so it will be possible to start a VNC connection to it.

##### Use a Gnome extension to allow unlocking the session remotely.

If you do not want to switch off locking the screen or you want to have an option to unlock the session remotely even when it is locked, you will need to install an extension that provides this functionality as such behavior is not allowed by default.

To install the extension:

  1. Open the **Firefox** browser and point it to [the Gnome extension page][10].

![][7]![Gnome Extensions Page][11]

  2. In the upper part of the page, find an info block that tells you to install _GNOME Shell integration_ for Firefox.

  3. Install the Firefox extension by clicking on _Click here to install browser extension_.

  4. After the installation, notice the Gnome logo in the menu part of Firefox.

  5. Click on the Gnome logo to navigate back to the extension page.

  6. Search for _allow locked remote desktop_.

  7. Click on the displayed item to go to the extension’s page.

  8. Switch the extension **ON** by using the **on/off** button on the right.

![Extension selected][12]




Now, it will be possible to start a VNC connection any time. Note, that you will need to know the session password to unlock the session. If your VNC password differs from the session password, your session is still protected _a little_.

### Conclusion

This article, described the way to enable sharing the computer screen in Gnome. It mentioned the difference between the limited (_view-only)_ access or not limited (_full)_ access. This solution, however, should in no case be considered a _correct approach_ to enable a remote access for serious tasks, such as administering a production server. Why?

  1. The server will always keep its **control mode**. Anyone working with the server session will be able to control the mouse and keyboard.
  2. If the session is locked, unlocking it from the client will also unlock it on the server. It will also wake up the display from the stand-by mode. Anybody who can see your server screen will be able to watch what you are doing at the moment.
  3. The VNC protocol _per se_ is not encrypted or protected so anything you send over this can be compromised.



There are several ways, you can set up a protected VNC connection. You could tunnel it via the SSH protocol for better security, for example. However, these are beyond the scope of this article.

**Disclaimer**: The above workflow worked without problems on Fedora 35 using several virtual machines. If it does not work for you, then you might have hit a bug. Please, report it.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/sharing-the-computer-screen-in-gnome/

作者：[Lukáš Růžička][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/lruzicka/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/01/sharing_screen-816x345.jpg
[2]: https://fedoramagazine.org/wp-content/uploads/2022/01/settings_sharing_off.png
[3]: https://fedoramagazine.org/wp-content/uploads/2022/01/settings_sharing_on.png
[4]: https://fedoramagazine.org/wp-content/uploads/2022/01/remmina.png
[5]: https://fedoramagazine.org/wp-content/uploads/2022/01/remmina_connected_client.png
[6]: https://fedoramagazine.org/wp-content/uploads/2022/01/resolution.png
[7]: tmp.kscCxzbpG9
[8]: https://fedoramagazine.org/wp-content/uploads/2022/01/full_screen.png
[9]: https://fedoramagazine.org/wp-content/uploads/2022/01/turn_off_connection.png
[10]: https://extensions.gnome.org
[11]: https://fedoramagazine.org/wp-content/uploads/2022/01/extensions.png
[12]: https://fedoramagazine.org/wp-content/uploads/2022/01/switch_on_extension.png

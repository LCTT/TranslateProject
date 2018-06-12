How to Install and Use Flatpak on Linux
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/flatpak.jpg?itok=l3i0CHok)

The landscape of applications is quickly changing. Many platforms are migrating to containerized applications… and with good cause. An application wrapped in a bundled container is easier to install, includes all the necessary dependencies, doesn’t directly affect the hosting platform libraries, automatically updates (in some cases), and (in most cases) is more secure than a standard application. Another benefit of these containerized applications is that they are universal (i.e., such an application would install on Ubuntu Linux or Fedora Linux, without having to convert a .deb package to an .rpm).

As of now, there are two main universal package systems: [Snap][1] and Flatpak. Both function in similar fashion, but one is found by default on Ubuntu-based systems (Snap) and one on Fedora-based systems (Flatpak). It should come as no surprise that both can be installed on either type of system. So if you want to run Snaps on Fedora, you can. If you want to run Flatpak on Ubuntu, you can.

I will walk you through the process of installing and using Flatpak on [Ubuntu 18.04][2]. If your platform of choice is Fedora (or a Fedora derivative), you can skip the installation process.

### Installation

The first thing to do is install Flatpak. The process is simple. Open up a terminal window and follow these steps:

  1. Add the necessary repository with the command sudo add-apt-repository ppa:alexlarsson/flatpak.

  2. Update apt with the command sudo apt update.

  3. Install Flatpak with the command sudo apt install flatpak.

  4. Install Flatpak support for GNOME Software with the command sudo apt install gnome-software-plugin-flatpak.

  5. Reboot your system.




### Usage

I’ll first show you how to install a Flatpak package from the command line, and then via the GUI. Let’s say you want to install the Spotify desktop client via Flatpak. To do this, you must first instruct Flatpak to retrieve the necessary app. The Spotify Flatpak (along with others) is hosted on [Flathub][3]. The first thing we’re going to do is add the Flathub remote repository with the following command:
```
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

```

Now you can install any Flatpak app found on Flathub. For example, to install [Spotify][4], the command would be:
```
sudo flatpak install flathub com.spotify.Client

```

To find out the exact command for each install, you only have to visit the app’s page on Flathub and the installation command is listed beneath the description.

Running a Flatpak-installed app is a bit different than a standard app (at least from the command line). Head back to the terminal window and issue the command:
```
flatpak run com.spotify.Client

```

Of course, after you’ve re-started your machine (upon installing the GNOME Software Support), those apps should appear in your desktop menu, making it unnecessary to start them from the command line.

To uninstall a Flatpak from the command line, you would go back to the terminal and issue the command:
```
sudo flatpak uninstall NAME

```

where NAME is the name of the app to remove. In our Spotify case, that would be:
```
sudo flatpak uninstall com.spotify.Client

```

Now we want to update our Flatpak apps. To do this, first list all of your installed Flatpak apps by issuing the command:
```
flatpak list

```

Now that we have our list of apps (Figure 1), we can update with the command sudo flatpak update NAME (where NAME is the name of our app to update).


![Flatpak apps][6]

Figure 1: Our list of updated Flatpak apps.

[Used with permission][7]

So if we want to update GIMP, we’d issue the command:
```
sudo flatpak update org.gimp.GIMP

```

If there are any updates to be applied, they’’ll be taken care of. If there are no updates to be applied, nothing will be reported.

### Installing from GNOME Software

Let’s make this even easier. Since we installed GNOME Software support for flatpak, we don’t actually have to bother with the command line. Don’t be mistaken, unlike Snap support, you won’t actually find Flatpak apps listed within GNOME Software (even though we’ve installed Software support). Instead, you’ll find support through the web browser.

Let me show you. Point your browser to [Flathub][3].


![Installing a Flatpak app][9]

Figure 2: Installing a Flatpak app from the Firefox browser.

[Used with permission][7]

Let’s say you want to install Slack via Flatpak. Go to the [Slack Flathub][10] page and then click on the INSTALL button. Since we installed GNOME Software support, the standard browser dialog window will appear with an included option to open the file via Software Install (Figure 2).

This action will then open GNOME Software (or, in the case of Ubuntu, Ubuntu Software), where you can click the Install button (Figure 3) to complete the process.

![ready to go][12]

Figure 3: The installation process ready to go.

[Used with permission][7]

Once the installation completes, you can then either click the Launch button, or close GNOME Software and launch the application from the desktop menu (in the case of GNOME, the Dash).

After you’ve installed a Flatpak app via GNOME Software, it can also be removed from the same system (so there’s still not need to go through the command line).

### What about KDE?

If you prefer using the KDE desktop environment, you’re in luck. If you issue the command sudo apt install plasma-discover-flatpak-backend, it’ll install Flatpak support for the KDE app store, Discover. Once you’ve added Flatpak support, you then need to add a repository. Open Discover and then click on Settings. In the settings window, you’ll now see a Flatpak listing (Figure 4).

![Flatpak][14]

Figure 4: Flatpak is now available in Discover.

[Used with permission][7]

Click on the Flatpak drop-down and then click Add Flathub. Click on the Applications tab (in the left navigation) and you can then search for (and install) any applications found on Flathub (Figure 5).

![Slack ][16]

Figure 5: Slack can now be installed, from Flathub, via Discover.

[Used with permission][7]

### Easy Flatpak management

And that’s the gist of using Flatpak. These universal packages can be used on most Linux distributions and can even be managed via the GUI on some desktop environments. I highly recommend you give Flatpak a try. With the combination of standard installation, Flatpak, and Snaps, you’ll find software management on Linux has become incredibly easy.

Learn more about Linux through the free ["Introduction to Linux" ][17]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/6/how-install-and-use-flatpak-linux

作者：[Jack Wallen][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://www.linux.com/learn/intro-to-linux/2018/5/get-started-snap-packages-linux
[2]:http://releases.ubuntu.com/18.04/
[3]:https://flathub.org/
[4]:https://flathub.org/apps/details/com.spotify.Client
[5]:/files/images/flatpak1jpg
[6]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/flatpak_1.jpg?itok=DlJ8zFYg (Flatpak apps)
[7]:/licenses/category/used-permission
[8]:/files/images/flatpak2jpg
[9]:https://www.linux.com/sites/lcom/files/styles/floated_images/public/flatpak_2.jpg?itok=fz1fTAco (Installing a Flatpak app)
[10]:https://flathub.org/apps/details/com.slack.Slack
[11]:/files/images/flatpak3jpg
[12]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/flatpak_3.jpg?itok=wlV8FdgJ (ready to go)
[13]:/files/images/flatpak4jpg
[14]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/flatpak_4.jpg?itok=dBKbVV8Z (Flatpak)
[15]:/files/images/flatpak5jpg
[16]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/flatpak_5.jpg?itok=IKeEgkxD (Slack )
[17]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux

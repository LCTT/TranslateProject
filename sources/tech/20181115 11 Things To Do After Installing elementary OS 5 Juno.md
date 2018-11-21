11 Things To Do After Installing elementary OS 5 Juno
======
I’ve been using [elementary OS 5 Juno][1] for over a month and it has been an amazing experience. It is easily the [best Mac OS inspired Linux distribution][2] and one of the [best Linux distribution for beginners][3].

However, you will need to take care of a couple of things after installing it.
In this article, we will discuss the most important things that you need to do after installing [elementary OS][4] 5 Juno.

### Things to do after installing elementary OS 5 Juno

![Things to do after installing elementary OS Juno][5]

Things I mentioned in this list are from my personal experience and preference. Of course, you are not restricted to these few things. You can explore and tweak the system as much as you like. However, if you follow (some of) these recommendations, things might be smoother for you.

####  1.Run a System Update

![terminal showing system updates in elementary os 5 Juno][6]

Even when you download the latest version of a distribution – it is always recommended to check for the latest System updates. You might have a quick fix for an annoying bug, or, maybe there’s an important security patch that you shouldn’t ignore. So, no matter what – you should always ensure that you have everything up-to-date.

To do that, you need to type in the following command in the terminal:

```
sudo apt-get update
```

#### 2\. Set Window Hotcorner

![][7]

You wouldn’t notice the minimize button for a window. So, how do you do it?

Well, you can just bring up the dock and click the app icon again to minimize it or press **Windows key + H** as a shortcut to minimize the active window.

But, I’ll recommend something way more easy and intuitive. Maybe you already knew it, but for the users who were unaware of the “ **hotcorners** ” feature, here’s what it does:

Whenever you hover the cursor to any of the 4 corners of the window, you can set a preset action to happen when you do that. For example, when you move your cursor to the **left corner** of the screen you get the **multi-tasking view** to switch between apps – which acts like a “gesture“.

In order to utilize the functionality, you can follow the steps below:

  1. Head to the System Settings.
  2. Click on the “ **Desktop** ” option (as shown in the image above).
  3. Next, select the “ **Hot Corner** ” section (as shown in the image below).
  4. Depending on what corner you prefer, choose an appropriate action (refer to the image below – that’s what I personally prefer as my settings)



#### 3\. Install Multimedia codecs

I’ve tried playing MP3/MP4 files – it just works fine. However, there are a lot of file formats when it comes to multimedia.

So, just to be able to play almost every format of multimedia, you should install the codecs. Here’s what you need to enter in the terminal:

To get certain proprietary codecs:

```
sudo apt install ubuntu-restricted-extras
```

To specifically install [Libav][8]:

```
sudo apt install libavcodec-extra
```

To install a codec in order to facilitate playing video DVDs:

```
sudo apt install libdvd-pkg
```

#### 4\. Install GDebi

You don’t get to install .deb files by just double-clicking it on elementary OS 5 Juno. It just does not let you do that.

So, you need an additional tool to help you install .deb files.

We’ll recommend you to use **GDebi**. I prefer it because it lets you know about the dependencies even before trying to install it – that way – you can be sure about what you need in order to correctly install an application.

Simply install GDebi and open any .deb files by performing a right-click on them **open in GDebi Package Installer.**

To install it, type in the following command:

```
sudo apt install gdebi
```

#### 5\. Add a PPA for your Favorite App

Yes, elementary OS 5 Juno now supports PPA (unlike its previous version). So, you no longer need to enable the support for PPAs explicitly.

Just grab a PPA and add it via terminal to install something you like.

#### 6\. Install Essential Applications

If you’re a Linux power user, you already know what you want and where to get it, but if you’re new to this Linux distro and looking out for some applications to have installed, I have a few recommendations:

**Steam app** : If you’re a gamer, this is a must-have app. You just need to type in a single command to install it:

```
sudo apt install steam
```

**GIMP** : It is the best photoshop alternative across every platform. Get it installed for every type of image manipulation:

```
sudo apt install gimp
```

**Wine** : If you want to install an application that only runs on Windows, you can try using Wine to run such Windows apps here on Linux. To install, follow the command:

```
sudo apt install wine-stable
```

**qBittorrent** : If you prefer downloading Torrent files, you should have this installed as your Torrent client. To install it, enter the following command:

```
sudo apt install qbittorrent
```

**Flameshot** : You can obviously utilize the default screenshot tool to take screenshots. But, if you want to instantly share your screenshots and the ability to annotate – install flameshot. Here’s how you can do that:

```
sudo apt install flameshot
```

**Chrome/Firefox: **The default browser isn’t much useful. So, you should install Chrome/Firefox – as per your choice.

To install chrome, enter the command:

```
sudo apt install chromium-browser
```

To install Firefox, enter:

```
sudo apt install firefox
```

These are some of the most common applications you should definitely have installed. For the rest, you should browse through the App Center or the Flathub to install your favorite applications.

#### 7\. Install Flatpak (Optional)

It’s just my personal recommendation – I find flatpak to be the preferred way to install apps on any Linux distro I use.

You can try it and learn more about it at its [official website][9].

To install flatpak, type in:

```
sudo apt install flatpak
```

After you are done installing flatpak, you can directly head to [Flathub][10] to install some of your favorite apps and you will also find the command/instruction to install it via the terminal.

In case you do not want to launch the browser, you can search for your app by typing in (example – finding Discord and installing it):

```
flatpak search discord flathub
```

After gettting the application ID, you can proceed installing it by typing in:

```
flatpak install flathub com.discordapp.Discord
```

#### 8\. Enable the Night Light

![Night Light in elementary OS Juno][11]

You might have installed Redshift as per our recommendation for [elemantary OS 0.4 Loki][12] to filter the blue light to avoid straining our eyes- but you do not need any 3rd party tool anymore.

It comes baked in as the “ **Night Light** ” feature.

You just head to System Settings and click on “ **Displays** ” (as shown in the image above).

Select the **Night Light** section and activate it with your preferred settings.

#### 9\. Install NVIDIA driver metapackage (for NVIDIA GPUs)

![Nvidia drivers in elementary OS juno][13]

The NVIDIA driver metapackage should be listed right at the App Center – so you can easily the NVIDIA driver.

However, it’s not the latest driver version – I have version **390.77** installed and it’s performing just fine.

If you want the latest version for Linux, you should check out NVIDIA’s [official download page][14].

Also, if you’re curious about the version installed, just type in the following command:

```
nvidia-smi
```

#### 10\. Install TLP for Advanced Power Management

We’ve said it before. And, we’ll still recommend it.

If you want to manage your background tasks/activity and prevent overheating of your system – you should install TLP.

It does not offer a GUI, but you don’t have to bother. You just install it and let it manage whatever it takes to prevent overheating.

It’s very helpful for laptop users.

To install, type in:

```
supo apt install tlp tlp-rdw
```

#### 11\. Perform visual customizations

![][15]

If you need to change the look of your Linux distro, you can install GNOME tweaks tool to get the options. In order to install the tweak tool, type in:

```
sudo apt install gnome-tweaks
```

Once you install it, head to the application launcher and search for “Tweaks”, you’ll find something like this:

Here, you can select the icon, theme, wallpaper, and you’ll also be able to tweak a couple more options that’s not limited to the visual elements.

### Wrapping Up

It’s the least you should do after installing elementary OS 5 Juno. However, considering that elementary OS 5 Juno comes with numerous new features – you can explore a lot more new things as well.

Let us know what you did first after installing elementary OS 5 Juno and how’s your experience with it so far?

--------------------------------------------------------------------------------

via: https://itsfoss.com/things-to-do-after-installing-elementary-os-5-juno/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/elementary-os-juno-features/
[2]: https://itsfoss.com/macos-like-linux-distros/
[3]: https://itsfoss.com/best-linux-beginners/
[4]: https://elementary.io/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/11/things-to-do-after-installing-elementary-os-juno.jpeg?ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/11/elementary-os-system-update.jpg?ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/11/elementary-os-hotcorners.jpg?ssl=1
[8]: https://libav.org/
[9]: https://flatpak.org/
[10]: https://flathub.org/home
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/11/elementary-os-night-light.jpg?ssl=1
[12]: https://itsfoss.com/things-to-do-after-installing-elementary-os-loki/
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/11/elementary-os-nvidia-metapackage.jpg?ssl=1
[14]: https://www.nvidia.com/Download/index.aspx
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/11/elementary-os-gnome-tweaks.jpg?ssl=1

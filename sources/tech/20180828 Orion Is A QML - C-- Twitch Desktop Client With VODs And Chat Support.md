Orion Is A QML / C++ Twitch Desktop Client With VODs And Chat Support
======
**[Orion][1] is a free and open source QML / C++ client for [Twitch.tv][2] which can use multiple player backends (including [mpv][3]). The application runs on Linux, Windows, macOS and Android.**

Using Orion you can watch live Twitch streams and past broadcasts, and browse or search games and channels using a nice material user interface. What's more, Orion lets you login to Twitch, so you can chat and follow channels (and receive notifications when a channel you follow goes online).

The application allows customizing various aspects, like changing the stream quality, switching between light and dark user interface themes, and changing the chat position and font size.

![](https://3.bp.blogspot.com/-mRODHpN_DOs/W4VLENlBAEI/AAAAAAAABdI/eLrcj_93aEgvoH2urX6CzIeEW_44MoprwCLcBGAs/s640/orion-twitch-client.png)

**Main Orion Twitch client features:**

  * **Play live Twitch streams or past VODs using one of 3 backends: mpv, QtAV or Qt5 Multimedia (mpv is default)**
  * **Browse and search Twitch games and channels**
  * **Login using your Twitch credentials**
  * **Desktop notifications when a followed channel comes online (including an option to show offline notifications)**
  * **Chat support**
  * **Light and Dark themes with configurable font**
  * **Change chat position (right, left or bottom)**
  * **Options to start minimized, close to tray and keep on top**



Here's how Orion works. When you go to the channels list, you'll notice that each channel uses its icon as a thumbnail, with the channel name in an overlay on top of the icon:

![](https://2.bp.blogspot.com/-gMn58o2ICnU/W4VDod1B7HI/AAAAAAAABco/00PNn2dwq6oHwY9DS2lZdhOXlFMsS0umwCLcBGAs/s640/orion-channel-list_1.png)

I would have liked to see the stream title, number of current viewers, and a preview in the channel list, or have an option for this. These are available, but not directly in the channel list. You can see a channel preview on mouse over, while the stream title and viewer count are available after you click on a channel:

![](https://4.bp.blogspot.com/-Cpb8STUIeHc/W4VDtfPQS6I/AAAAAAAABcs/2j-dxwMgChUqzxi5PiZFqn1942SkdsHmQCLcBGAs/s640/orion-overlay-channel-info_2.png)

From this bottom overlay (which is displayed after you click on a channel) you can start playing the stream, follow or unfollow the channel, open the chat without watching the stream, or access past videos. You can also right click a channel to access these options.

In the player view you'll find the regular video player controls, along with the quality selector (with source as the default quality) at the bottom, while the top overlay lets you follow / unfollow a channel or toggle the chat, which is displayed on the right-hand side of the screen by default:

![](https://3.bp.blogspot.com/-2I3B8fT_BkA/W4VLfmzWiCI/AAAAAAAABdQ/xS8Vbs2XLiwizo7IrFeBqnW5bCmoJTKWACLcBGAs/s640/orion-twitch-player-overlays.png)

The chat panel uses autohide by default, but you can force it to always be displayed by clicking the lock icon its upper left corner. When the chat is locked (set to always visible), the video is shifted to the left so the chat isn't displayed on top of the video, and the chat width is resizable.

### Download Orion

[Download Orion(binaries for Windows or macOS)][13]

The Orion GitHub project page doesn't offer any Linux binaries for download, but there are packages out there for multiple Linux distributions:

  * **Arch Linux** AUR packages for the latest Orion [stable][4] or [Git][5].
  * **Ubuntu 18.04 / Linux Mint 19** : [here's][6] the latest Orion Twitch client as a DEB package (if you want to add the PPA you can find it [here][7]). There's [another][8] PPA which has the latest Orion for Ubuntu 18.04 and an older Orion version for Ubuntu 16.04 - I only tried the Ubuntu 18.04 package from this second PPA but the Orion window is very small upon launching the application, that's why I prefer the first package.
  * **Fedora 29, 28 and 27** have Orion in its [repositories][9].
  * **openSUSE Tumbleweed and Leap 15.0** have Orion in the official [repositories][10].



In case you're using a different Linux distribution, you'll need to search for Orion packages for yourself or build it from

**If you prefer to build Orion from source on Debian/Ubuntu-based Linux distributions** (with mpv as the backend), **here's how to compile it. Orion requires Qt 5.8 or newer!** That means you'll need Ubuntu 18.04 / Linux Mint 19 to build it, or if you want to compile it in an older Ubuntu version, you'll need to install a newer Qt version from a PPA, etc.

1\. Install the required dependencies on your Debian/Ubuntu-based Linux distribution:
```
sudo apt install qt5-default qtdeclarative5-dev qtquickcontrols2-5-dev libqt5svg5-dev libmpv-dev mesa-common-dev libgl1-mesa-dev libpulse-dev

```

2\. Download (using wget), build and install Orion:
```
cd && wget https://github.com/alamminsalo/orion/archive/1.6.5.tar.gz
tar -xvf 1.6.5.tar.gz
cd orion-1.6.5
mkdir build && cd build
qmake ../
make && sudo make install

```

If you want to build a different Orion version, make sure you adjust the first 3 commands with the exact file/version name.


### Fixing the default Orion theme when using QT_STYLE_OVERRIDE (not required in most cases)

I use `QT_STYLE_OVERRIDE` . Due to this, Orion does not use its default theme which causes some fonts to be invisible or hard to read.

This is how Orion looks when used with Kvantum set as the `QT_STYLE_OVERRIDE` :

![](https://4.bp.blogspot.com/-NbjalKcD4jw/W4VFngEYOtI/AAAAAAAABc8/4Q85I0mNamw2U7CL58dueFt7BS8oPZ4VwCLcBGAs/s640/orion-theme-issues.png)

If you're in the same situation, you can fix the Orion theme by launching the application like this:
```
QT_STYLE_OVERRIDE= orion

```

To change the Orion desktop file to include this so you can launch Orion from your menu and have it use the correct theme, copy the Orion desktop file from `/usr/share/applications/` to `~/.local/share/applications/` , edit it in this second location and change `Exec=orion` to `Exec=env QT_STYLE_OVERRIDE= orion` 

You can do all of this from a terminal using these commands:
```
cp /usr/share/applications/Orion.desktop ~/.local/share/applications/

sed -i 's/Exec=orion/Exec=env QT_STYLE_OVERRIDE= orion/' ~/.local/share/applications/Orion.desktop

```


--------------------------------------------------------------------------------

via: https://www.linuxuprising.com/2018/08/orion-is-qml-c-twitch-desktop-client.html

作者：[Logix][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://plus.google.com/118280394805678839070
[1]: https://alamminsalo.github.io/orion/
[2]: https://www.twitch.tv/
[3]: https://mpv.io/
[4]: https://aur.archlinux.org/packages/orion/
[5]: https://aur.archlinux.org/packages/orion-git/
[6]: http://ppa.launchpad.net/mortigar/orion/ubuntu/pool/main/o/orion/
[7]: https://launchpad.net/~mortigar/+archive/ubuntu/orion
[8]: https://launchpad.net/~rakslice/+archive/ubuntu/orion
[9]: https://apps.fedoraproject.org/packages/orion
[10]: https://software.opensuse.org/package/orion
[11]: https://github.com/alamminsalo/orion#building-on-linux
[12]: https://www.linuxuprising.com/2018/05/use-custom-themes-for-qt-applications.html
[13]: https://github.com/alamminsalo/orion/releases

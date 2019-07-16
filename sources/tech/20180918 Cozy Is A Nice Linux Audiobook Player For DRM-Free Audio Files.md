Cozy Is A Nice Linux Audiobook Player For DRM-Free Audio Files
======
[Cozy][1] **is a free and open source audiobook player for the Linux desktop. The application lets you listen to DRM-free audiobooks (mp3, m4a, flac, ogg and wav) using a modern Gtk3 interface.**

![](https://4.bp.blogspot.com/-A1TWkOasR7s/W6DevbmTH9I/AAAAAAAABho/VSjQkiDeWK49xzJ2MXvvwk0T_AhGWqQRgCLcBGAs/s1600/cozy-audiobook-player.png)

You could use any audio player to listen to audiobooks, but a specialized audiobook player like Cozy makes everything easier, by **remembering your playback position and continuing from where you left off for each audiobook** , or by letting you **set the playback speed of each book individually** , among others.

The Cozy interface lets you browse books by author, reader or recency, while also providing search functionality. **Books front covers are supported by Cozy** \- either by using embedded images, or by adding a cover.jpg or cover.png image in the book folder, which is automatically picked up and displayed by Cozy.

When you click on an audiobook, Cozy lists the book chapters on the right, while displaying the book cover (if available) on the left, along with the book name, author and the last played time, along with total and remaining time:

![](https://4.bp.blogspot.com/-hqBITKAiYaM/W6De4HzckRI/AAAAAAAABhs/GxSjfpND4hkk6ZM29TKfwB1zzXPxNa0_gCLcBGAs/s640/cozy-audiobook-player-playback-chapters.png)

From the application toolbar you can easily **go back 30 seconds** by clicking the rewind icon from its top left-hand side corner. Besides regular controls, cover and title, you'll also find a playback speed button on the toolbar, which lets you increase the playback speed up to 2X.

**A sleep timer is also available**. It can be set to stop after the current chapter or after a given number of minutes.

Other Cozy features worth mentioning:

  * **Mpris integration** (Media keys  & playback info)
  * **Supports multiple storage locations**
  * **Drag'n'drop support for importing new audiobooks**
  * **Offline Mode**. If your audiobooks are on an external or network drive, you can switch the download button to keep a local cached copy of the book to listen to on the go. To enable this feature you have to set your storage location to external in the settings
  * **Prevents your system from suspend during playback**
  * **Dark mode**



What I'd like to see in Cozy is a way to get audiobooks metadata, including the book cover, automatically. A feature to retrieve metadata from Audible.com was proposed on the Cozy GitHub project page and the developer seems interested in this, but it's not clear when or if this will be implemented.

Like I was mentioning in the beginning of the article, Cozy only supports DRM-free audio files. Currently it supports mp3, m4a, flac, ogg and wav. Support for more formats will probably come in the future, with m4b being listed on the Cozy 0.7.0 todo list.

Cozy cannot play Audible audiobooks due to DRM. But you'll find some solutions out there for converting Audible (.aa/.aax) audiobooks to mp3, like

### Install Cozy

**Any Linux distribution / Flatpak** : Cozy is available as a Flatpak on FlatHub. To install it, follow the quick Flatpak [setup][4], then go to the Cozy FlaHub [page][5] and click the install button, or use the install command at the bottom if its page.

**elementary OS** : Cozy is available in the  [AppCenter][6].

**Ubuntu 18.04 / Linux Mint 19** : you can install Cozy from its repository:

```
wget -nv https://download.opensuse.org/repositories/home:geigi/Ubuntu_18.04/Release.key -O Release.key
sudo apt-key add - < Release.key
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/geigi/Ubuntu_18.04/ /' > /etc/apt/sources.list.d/home:geigi.list"
sudo apt update
sudo apt install com.github.geigi.cozy
```

**For other ways of installing Cozy check out its[website][2].**


--------------------------------------------------------------------------------

via: https://www.linuxuprising.com/2018/09/cozy-is-nice-linux-audiobook-player-for.html

作者：[Logix][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://plus.google.com/118280394805678839070
[1]: https://cozy.geigi.de/
[2]: https://cozy.geigi.de/#how-can-i-get-it
[3]: https://gitlab.com/ReverendJ1/audiblefreedom/blob/master/audiblefreedom
[4]: https://flatpak.org/setup/
[5]: https://flathub.org/apps/details/com.github.geigi.cozy
[6]: https://appcenter.elementary.io/com.github.geigi.cozy/

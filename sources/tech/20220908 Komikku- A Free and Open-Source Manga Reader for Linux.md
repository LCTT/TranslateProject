[#]: subject: "Komikku: A Free and Open-Source Manga Reader for Linux"
[#]: via: "https://itsfoss.com/komikku-manga-reader/"
[#]: author: "Anuj Sharma https://itsfoss.com/author/anuj/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Komikku: A Free and Open-Source Manga Reader for Linux
======

Love reading comic books? There are [plenty of comic book readers available for Linux][1].

But what about something tailored for Japanese comic books (Manga)?

I think I came across the perfect app suitable for reading Manga, organizing them, and downloading them for offline use as well. The app I discovered recently is called **Kommiku**.

Let me mention the key highlights of this app and help you get started with it on Linux.

### Komikku: A Linux-only Manga Reader

![Komikku UI][2]

Komikku is an open-source manga reader available as a Linux-only application.

Primarily, it is tailored to go well with the GNOME desktop environment, but you can use it on Linux distributions running [other desktop environments][3].

Many PDF or [E-book readers][4] like Bookworm, Calibre, and Foliate support the Comic book format.

However, Komikku users get more features to have a good experience for reading manga.

![Komikku online servers list][5]

For instance, Komikku can be used to view Manga online and offline. Furthermore, you can download it from supported servers.

### Features of Komikku

![komikku reader][6]

Some of the best functionalities of Komikku include:

* Online reading from dozens of supported servers.
* Offline reading of downloaded comics.
* Categories to organize your library.
* RTL, LTR, Vertical and Webtoon reading modes.
* Several types of navigation (Keyboard arrow keys, right and left navigation layout via mouse click or tapping (touchpad/touch screen), scroll wheel, and swipe gestures (touchpad and touchscreen).
* Automatic update of comics.
* Automatic download of new chapters.
* Reading history.
* Light and dark themes.
* Adaptive design (able to scale from desktop workstations to mobile phones).
* Keyboard shortcuts.

![Komikku compact view][7]

### Installation

Komikku is available on [Flathub][8]. So, you can get it installed on any Linux distribution.

However, you need to [set up Flatpak and enable Flathub repo on your system][9].

Once you have Flatpak set up on your system, you can search for it through the software center or install it from your terminal.

![Installing Komikku from GNOME Software][10]

To install Komikku using the terminal, type the following command

```
flatpak install flathub info.febvre.Komikku
```

Native packages for Komikku are also available for distributions like Arch Linux and Fedora. Here are the commands to get them installed:

For Arch Linux (available in AUR):

```
yay -Syu komikku
```

For Fedora (available in official repos):

```
sudo dnf install komikku
```

Check out Komikku’s source code and the instructions to build it from the source on its [GitLab page][11]. Head to its official webpage to know more about it.

[Download Komikku][12]

### Conclusion

I found Komikku to be very intuitive and clean. Noted that the online servers do not always work, one can expect some hiccups, but managing offline comics and sorting your collection into categories is effortless.

All thanks to **Valéry Febvre**(developer of Komikku) we have another useful Linux app. You can consider donating to the project if you like the application.

*Which comic book reader do you use? Will you give Komikku a try? Kindly let me know your thoughts in the comments below.*

--------------------------------------------------------------------------------

via: https://itsfoss.com/komikku-manga-reader/

作者：[Anuj Sharma][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/anuj/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/best-comic-book-reader-linux/
[2]: https://itsfoss.com/wp-content/uploads/2022/09/komikku-library.png
[3]: https://itsfoss.com/best-linux-desktop-environments/
[4]: https://itsfoss.com/best-ebook-readers-linux/
[5]: https://itsfoss.com/wp-content/uploads/2022/09/komikku-online-servers.png
[6]: https://itsfoss.com/wp-content/uploads/2022/09/komikku-reader.png
[7]: https://itsfoss.com/wp-content/uploads/2022/09/komikku-mobile-view.png
[8]: https://flathub.org/apps/details/info.febvre.Komikku
[9]: https://itsfoss.com/flatpak-guide/
[10]: https://itsfoss.com/wp-content/uploads/2022/09/install-komikku-gnome-software.png
[11]: https://gitlab.com/valos/Komikku
[12]: https://valos.gitlab.io/Komikku/

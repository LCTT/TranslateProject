[#]: subject: "Linux eBook Reader Foliate 3.0 Upgrade: Improves UX With GTK 4 Port"
[#]: via: "https://news.itsfoss.com/foliate-3-0/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux eBook Reader Foliate 3.0 Upgrade: Improves UX With GTK 4 Port
======
A GTK 4 port with nice UI refinements.
Being one of the [best eBook readers for Linux][1], Foliate has been progressing rather nicely over the years, receiving timely updates and bug fixes.

However, it was looking a bit aged in recent times thanks to it featuring some old tech underneath. But, that has since changed with the release of **Foliate 3.0**.

Let's see what kind of improvements are on offer.

## 🆕 Foliate 3.0: What's New?

![][2]

With the 3.0 release, **Foliate has been completely rewritten** by using the modern platform libraries like [GTK 4][3] and [Adwaita][4]. The developers have mentioned to expect a refreshed interface and superior performance than before.

Foliate now **uses its own eBook parser/render** , doing away with [Epub.js][5] and [KindleUnpack][6]. Sadly, they were **unable to port a few features in time** for the 3.0 release, so this version **doesn't have support for[ **OPDS**][7] catalogs and offline dictionaries**.

As for the **key highlights** of this release:

  * **Revamped User Interface**
  * **Better Rendering**
  * **Improved User Experience**



### Revamped User Interface

![][8]

As you can see, the most significant change to Foliate has been its user interface. It now features **a new layout** where the Library and e-book viewer have been integrated into a single window.

You will also notice that there is **a new sidebar** that features some important options such as the table of contents, annotations, and bookmarks.

![][9]

There is also **a handy search bar** at the top that allows you to search for specific words or sentences in a book, and a “Library” button to take you back to your library of e-books.

📋

You can toggle the sidebar's visibility by accessing options in the header bar.

Furthermore, the **paginated mode also sees some major improvements**.

They have added **support for animation and 1:1 touchscreen/touchpad swipe gestures** , **support for more than two columns** , **better resizing behavior** , the **ability to configure the max width/height** and more.

### Better Rendering

There have been many improvements on the book rendering side of things too, some key ones include:

  * If a page is not a valid XHTML one, it will be treated as HTML.
  * Mobipocket files are now divided into sections to greatly improve performance.
  * When a file is reloaded, it is now properly reloaded, rather than just being re-rendered.
  * Startup time and memory usage has been optimized by not loading the entire file into memory.



### Improved User Experience

![][10]

Besides the user interface upgrades, there have been some **really cool user experience tweaks** with Foliate 3.0.

Take for instance the **bookmarking system** , the button for bookmarking pages has been moved to the header bar, and bookmarked pages now show a distinct ribbon at the top.

The **image viewer** has also seen some updates, now when images are copied, they are stored in their original file format. Moreover, to open images, you simply double-click on them, the other options have been removed.

The **progress slider has also been improved** , with it now supporting keyboards and mouse scrolls. You will also find the **updated narration functionality** there, which now uses [Speech Dispatcher][11] at its back end.

### 🛠️ Other Changes and Improvements

As for the rest of the refinements, here are some worth noting:

  * You can now print specific chapters and text selections.
  * An experimental traditional title bar option was removed.
  * Annotations are now saved with their respective timestamps.
  * A security fix that has removed the sandbox escape permission for Flatpak.



You may go through the [official release notes][12] to learn more.

## 📥 Get Foliate

This revamped version of Foliate is available via the [Flathub store][13] and the [Snap store][14] (edge channel only, for now).

[Foliate (Flathub)][13]

You can also visit the [official website][15] or the [GitHub repo][16] for the source code.

### Troubleshooting Tip

If **Foliate refuses to load EPUB files** properly, and you are **using an NVIDIA GPU** , then you can run the app using either of the following commands:

```

    WEBKIT_DISABLE_COMPOSITING_MODE=1

    WEBKIT_DISABLE_DMABUF_RENDERER=1

```

If you have the **Flatpak version of Foliate** installed, just add the same line to the environment variables by using [Flatseal][17]. For me, the second command did the job.

You can refer to the [GitHub issue][18] in question for further troubleshooting.

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/foliate-3-0/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-ebook-readers-linux/
[2]: https://news.itsfoss.com/content/images/2023/11/Foliate_3.0_1.png
[3]: https://blog.gtk.org/2020/12/16/gtk-4-0/
[4]: https://gnome.pages.gitlab.gnome.org/libadwaita/
[5]: https://github.com/futurepress/epub.js
[6]: https://github.com/kevinhendricks/KindleUnpack
[7]: https://en.wikipedia.org/wiki/Open_Publication_Distribution_System
[8]: https://news.itsfoss.com/content/images/2023/11/Foliate_3.0_2.png
[9]: https://news.itsfoss.com/content/images/2023/11/Foliate_3.0_3.png
[10]: https://news.itsfoss.com/content/images/2023/11/Foliate_3.0_4.png
[11]: https://wiki.archlinux.org/title/Speech_dispatcher
[12]: https://github.com/johnfactotum/foliate/releases/tag/3.0.0
[13]: https://flathub.org/apps/com.github.johnfactotum.Foliate
[14]: https://snapcraft.io/foliate
[15]: https://johnfactotum.github.io/foliate/
[16]: https://github.com/johnfactotum/foliate
[17]: https://itsfoss.com/flatseal/
[18]: https://github.com/johnfactotum/foliate/issues/1093

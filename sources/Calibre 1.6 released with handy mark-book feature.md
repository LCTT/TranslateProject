Calibre 1.6 released with handy mark-book feature
================================================================================
[Calibre][1] is a free open-source ebook library management tool, designed in mind with satisfying a diverse and complex range of ebook-related requirements and necessities, offering powerful conversion process, dedicated ebook reader, hassle-free library creation and management, online service integration, etc, basically, a modern ebook experience.

Calibre has been updated to version **1.6**, introducing an exciting **book-marking** feature, as well as numerous new fixes and enhancements.

The book-marking feature presents itself as a handy manner of **temporarily** (restarting Calibre, loses the marking) selecting books, functionality allowing the user to mark books and to act on the marked books 1-click away, feature proving itself handy in multiple situations.

The newly-implemented book-marking feature is disabled by default, yet, enabling it is as simple as navigating to `Preferences-->Toolbar-->The main toolbar-->`click on `Mark Books-->hit the left-pointed arrow-->Apply`, action that adds the `Mark Books` button on its toolbar.

**Marking**, for example, three books is to be achieved by manually selecting the books (holding the Ctrl key and clicking on the three preferred to-be-marked books) and directly clicking on the toolbar's Mark Books button, action that marks the books.

The **result**: the newly-marked three books gain a marking-specific icon, thus the user is able to clearly observe marked books.

![](http://iloveubuntu.net/pictures_me/calibre%2016%20marking%20books.png)

After the books have been marked, the user can act on the marked books by `right-clicking on the toolbar's Mark Books-->Show marked books`, action that displays on Calibre's main view only the marked books, while hiding the non-marked regular books.

The book-marking functionality allows users to hassle-free isolate preferred books in a matter of seconds by simply clicking on the mentioned button, isolation process fully exposing to the user only certain books, while clearing the view from at-the-moment unwanted books.

Reselecting the marked books and clicking again on the `Mark Books` button, unmarks the books, button acting as a mark/unmark toggle.

Calibre comes by default with a handy ebook viewer, ebook viewer enriched in the 1.6 release with extra configurable keyboard shortcuts, meaning, the user is now able to select a different **keyboard shortcut** (for example) for zoom in/out when reading ebooks.

Adjusting a keyboard shortcut is to be preformed by opening E-book Viewer, clicking on the sidebar's Preferences and navigating to `Keyboard shortcuts`, where double-clicking on an entry, makes the entry fully editable.

![](http://iloveubuntu.net/pictures_me/calibre%20font%20size%20shortcut.png)

The mentioned features, along with numerous bug fixes, new news sources (various Uruguyan news) and improved news sources (National Geographic Magazine, New York Review of Books, Focus, Carta Capital, Ming Pao, Neu Osnabrucker Zeitung), come to deliver a more strengthened solid Calibre.

How do we **install** Calibre 1.6?

Paste the following command into a terminal

    sudo python -c "import sys; py3 = sys.version_info[0] > 2; u = __import__('urllib.request' if py3 else 'urllib', fromlist=1); exec(u.urlopen('http://status.calibre-ebook.com/linux_installer').read()); main()"

and hit the `Enter` key on the `Enter the installation directory for calibre [/opt]` (command that will appear in the terminal after pasting the above-presented command)

**For users** having Calibre installed via PPA, type in a terminal (**before** pasting the above command)

    sudo apt-get remove calibre calibre-bin

--------------------------------------------------------------------------------

via: http://iloveubuntu.net/calibre-16-released-handy-mark-book-feature

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

[1]:http://calibre-ebook.com/
[2]:
[3]:
[4]:
[5]:
[6]:
[7]:
[8]:
[9]:
[10]:
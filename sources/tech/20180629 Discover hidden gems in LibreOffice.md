Discover hidden gems in LibreOffice
======

![](https://fedoramagazine.org/wp-content/uploads/2018/06/libreoffice6-gems-816x345.jpg)

LibreOffice is the most popular free and open source office suite. It’s included by default in many Linux distributions, such as [Fedora Workstation][1]. Chances are that you use it fairly often, but how many of its features have you really explored? What hidden gems are there in LibreOffice that not so many people know about?

This article explores some lesser-known features in the suite, and shows you how to make the most of them. Then it wraps up with a quick look at the LibreOffice community, and how you can help to make the software even better.

### Notebookbar

Recent versions of LibreOffice have seen gradual improvements to the user interface, such as reorganized menus and additional toolbar buttons. However, the general layout hasn’t changed drastically since the software was born back in 2010. But now, a completely new (and optional!) user interface called the [Notebookbar][2] is under development, and it looks like this:

![LibreOffice's \(experimental\) Notebookbar][3]

Yes, it’s substantially different to the current “traditional” design, and there are a few variants. Because LibreOffice’s design team is still working on the Notebookbar, it’s not available by default in current versions of the suite. Instead, it’s an experimental option.

To try it, make sure you’re running a recent release of LibreOffice, such as 5.4 or 6.0. (LibreOffice 6.x is already available in Fedora 28.) Then go to Tools > Options in the menu. In the dialog box that appears, go to Advanced on the left-hand side. Tick the Enable experimental features box, click OK, and then you’ll be prompted to restart LibreOffice. Go ahead and do that.

Now, in Writer, Calc and Impress, go to View > Toolbar Layout in the menu, and choose Notebookbar. You’ll see the new interface straight away. Remember that this is still experimental, though, and not ready for production use, so don’t be surprised if you see some bugs or glitches in places!

The default Notebookbar layout is called “tabbed”, and you can see tabs along the top of the window to display different sets of buttons. But if you go to View > Notebookbar in the menu, you’ll see other variants of the design as well. Try them out! If you need to access the familiar menu bar, you’ll find an icon for it in the top-right of the window. And to revert back to the regular interface, just go to View > Toolbar Layout > Default.

### Command line tips and tricks

Yes, you can even use LibreOffice from the Bash prompt. This is most useful if you want to perform batch operations on large numbers of files. For instance, let’s say you have 20 .odt (OpenDocument Text) files in a directory, and want to make PDFs of them. Via LibreOffice’s graphical user interface, you’d have to do a lot of clicking to achieve this. But at the command line, it’s simple:
```
libreoffice --convert-to pdf *.odt

```

Or take another example: you have a set of Microsoft Office documents, and you want to convert them all to ODT:
```
libreoffice --convert-to odt *.docx

```

Another useful batch operation is printing. If you have a bunch of documents and want to print them all in one fell swoop, without manually opening them and clicking on the printer icon, do this:
```
libreoffice -p *.odt

```

It’s also worth noting some of the other command line flags that LibreOffice uses. For instance, if you want to create a launcher in your program menu that starts Calc directly, instead of showing the opening screen, use:
```
libreoffice --calc

```

It’s also possible to launch Impress and jump straight into the first slide of a presentation, without showing the LibreOffice user interface:
```
libreoffice --show presentation.odp

```

### Extra goodies in Draw

Writer, Calc and Impress are the most popular components of LibreOffice. But Draw is a capable tool as well for creating diagrams, leaflets and other materials. When you’re working with multiple objects, there are various tricks you can do to speed up your work.

For example, you probably know you can select multiple objects by clicking and dragging a selection area around them. But you can also select and deselect objects in the group by holding down the Shift key while clicking.

When moving individual shapes or groups of shapes, you can use keyboard modifiers to change the movement speed. Try it out: select a bunch of objects, then use the cursor keys to move them around. Now try holding Shift to move them in greater increments, or Alt for fine-tuning. (The Ctrl key comes in useful here too, for panning around inside a document without moving the shapes.)

[LibreOffice 5.1][4] added a useful feature to equalize the widths and heights of multiple shapes. Select them with the mouse, right-click on the selection, and then go to the Shapes part of the context menu. There you’ll see the Equalize options. This is good for making objects more consistent, and it works in Impress too!

![Equalizing shape sizes in Draw][5]

Lastly, here’s a shortcut for duplicating objects: the Ctrl key. Try clicking and dragging on an object, with Ctrl held down, and you’ll see that a copy of the object is made immediately. This is quicker and more elegant than using the Duplicate dialog box.

### Over to you!

So those are some features and tricks in LibreOffice you can now use in your work. But there’s always room for improvement, and the LibreOffice community is working hard on the next release, [LibreOffice 6.1][6], which is due in early August. Give them a hand! You can help to test the beta releases, trying out new features and reporting bugs. Or [get involved in other areas][7] such as design, marketing, documentation, translations and more.

Photo by [William Iven][8] on [Unsplash][9].


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/discover-hidden-gems-libreoffice/

作者：[Mike Saunders][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/mikesaunders/
[1]:https://getfedora.org/workstation
[2]:https://wiki.documentfoundation.org/Development/NotebookBar
[3]:https://fedoramagazine.org/wp-content/uploads/2018/06/libreoffice_gems_notebookbar-300x109.png
[4]:https://wiki.documentfoundation.org/ReleaseNotes/5.1
[5]:https://fedoramagazine.org/wp-content/uploads/2018/06/libreoffice_gems_draw-300x178.png
[6]:https://wiki.documentfoundation.org/ReleaseNotes/6.1
[7]:https://www.libreoffice.org/community/get-involved/
[8]:https://unsplash.com/photos/jrh5lAq-mIs?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[9]:https://unsplash.com/search/photos/documents?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText

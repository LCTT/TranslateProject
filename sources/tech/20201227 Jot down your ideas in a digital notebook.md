[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Jot down your ideas in a digital notebook)
[#]: via: (https://opensource.com/article/20/12/kjots)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Jot down your ideas in a digital notebook
======
If you have an analog soul but need a convenient digital version of your
beloved paper notebooks, KJots is the editor for you.
![Writing in a notebook][1]

I love a good notebook. I usually get one or two blank notebooks from technical conferences each year, and I spend the journey home deciding what I’ll fill the empty pages with. Sometimes, it’s notes about some new open source technology; other times, it’s ideas for new games, or a collection of dungeons for my D&amp;D groups, or ideas for a fictional world or story. The ideas tend to flow freely when I have a blank notebook in front of me, because it’s _empty_, and nature abhors a vacuum.

A digital version of this is the KJots application, a sort of personal wiki distributed with the KDE Plasma desktop. KJots allows you to create text files to be kept in a database so that all of the "pages" of text you create form one or more "notebooks."

### Install

KJots is the default personal wiki of KDE’s Plasma desktop. If you’re running the Plasma desktop on Linux or BSD, you already have KJots, and you can launch it either as a self-standing application or from the Kontact Personal Information Manager (PIM) application.

### Using KJots

KJots behaves a lot like a text editor, except that your files are stored in a database, so you never have to manually save them out to a place on your hard drive. KJots is designed to encourage you to think of your notes like pages in a notebook. It has a side panel displaying each note in a book structure of your choosing. You can create a new book at any time, and of course, you can move notes in and out of books according to how you want to keep your data organized. The application is intuitive as a text editor; there’s a text editing field on the right and a tree view of your collection of notes on the left.

![black KJots terminal with white text and separate left-side tree menu][2]

#### Editing

Editing text in KJots is a lot like editing text in KWrite or [medit][3]. There’s a button or menu for whatever you need to do, including styling your text as bold or italics or color, changing the font, adding arbitrary bookmarks (in KJots), creating lists, and so on. It’s not as flexible as [Kate][4], but it’s got all the basics you need for general-purpose composition.

#### Linking

One thing that’s difficult to simulate in the digital world is the ease of flipping back and forth between pages in a physical book. I don’t know that anyone’s solved this problem yet, but as consolation, KJots allows you to link between notes. In a way, you’re anticipating your future desire to flip back to a previous note by including an easy-to-follow hyperlink straight to the page you want yourself to refer to later. Technically, it’s more efficient than the physical equivalent (although it does require you to think of it beforehand, or else you’re back to scrolling through notes or using **Ctrl+F** to find a keyword).

To link from one note to another, select the word or phrase you want to make a hyperlink. Click the **Format** menu, and select the **Link** option. You can choose to create an external link (to a website, for instance) or an internal link to another note, even if the note is filed in a separate book.

![Kjots terminal with pop-up box titled link management][5]

#### Exporting

KJots exports its files to plain text, HTML, or book files. A book file is useful to transfer notes between KJots instances and can be a good means of performing a manual backup. To export a note, select the note you want to save and choose **Export** from the **File** menu. Save the file somewhere on your hard drive.

I use this function to export notes that started as a small idea and then got developed to the point that I feel it deserves to be its own file. This is especially useful to me because I don’t use internal KJots styling options and instead write in Asciidoc or Markdown in KJots, and then export as plain text so I can process the markdown with [Pandoc][6] or similar.

### Try KJots

I’ve used Kjots off and on again since discovering it in the Kontact suite of applications on Plasma desktop 4. It’s one of my favorite digital notebooks because, of the ones I’ve used, it’s the one that "feels" the most like a notebook, and also because it’s the one that comes with my desktop. It may or may not be suitable as your primary editor, but it is a nice editor if you sometimes think in collections of ideas, and you want to keep related thoughts closely associated but not in the same document.

If you love a good notebook, try KJots!

KDE originally stood for Kool Desktop Environment, but is now known by many as the K Desktop...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/kjots

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/notebook-writing-pen.jpg?itok=uA3dCfu_ (Writing in a notebook)
[2]: https://opensource.com/sites/default/files/uploads/kjots-31_days-kjots-opensource.png (black KJots terminal with white text and separate left-side tree menu)
[3]: https://opensource.com/article/20/12/medit
[4]: https://opensource.com/article/20/12/kate-text-editor
[5]: https://opensource.com/sites/default/files/uploads/kjots-link-31_days-kjots-opensource.png (Kjots terminal with pop-up box titled link management)
[6]: https://opensource.com/article/20/5/pandoc-cheat-sheet

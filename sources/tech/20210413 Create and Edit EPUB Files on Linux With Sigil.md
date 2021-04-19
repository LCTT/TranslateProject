[#]: subject: (Create and Edit EPUB Files on Linux With Sigil)
[#]: via: (https://itsfoss.com/sigile-epub-editor/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Create and Edit EPUB Files on Linux With Sigil
======

Sigil is an open source EPUB editor available for Linux, Windows and macOS. With Sigil, you can create a new ebook in EPUB file format or edit an existing EPUB ebook (file ending in .epub extension).

In case you are wondering, EPUB is a standard ebook file format endorsed by several digital publishing groups. It is well-supported on a range of devices and ebook readers except Amazon Kindle.

### Sigil lets you create or edit EPUB files

[Sigil][1] is an open source software that allows you to edit EPUB files. You may, of course, create a new EPUB file from scratch.

![][2]

Many people swear by [Calibre for creating ebooks][3] or editing them. It is indeed a complete tool with lots of features and supports more than just EPUB file format. However, Calibre could be heavy on resources at times.

Sigil is focused on just the EPUB books with the following features:

  * Support for EPUB 2 and EPUB 3 (with some limitations)
  * Provides a preview along with the code view
  * Editing EPUB syntax
  * Table of content generator with mult-level heading
  * Edit metadat
  * Spell checking
  * REGEX support for find and replace feature
  * Supports import of EPUB and HTML files, images, and style sheets
  * Additional plugins
  * Multiple language support for the interface
  * Supports Linux, Windows and macOS



Sigil is not [WYSIWYG][4] type of editor where you can type the chapters of new book. It is focused on code as EPUB depends on XML. Consider it a [code editor like VS Code][5] for EPUB files. For this reason, you should use some other [open source tool for writing][6], export your files in .epub format (if possible) and then edit it in Sigil.

![][7]

Sigil does have a [Wiki][8] to provide you some documentation on installing and using Sigil.

### Installing Sigil on Linux

Sigil is a cross-platform application with support for Windows and macOS along with Linux. It is a popular software with more than a decade of existence. This is why you should find it in the repositories of your Linux distributions. Just look for it in the software center application of your distribution.

![Sigil in Ubuntu Software Center][9]

You may need to enable the universe repository beforehand. You may also use the apt command in Ubuntu-based distributions:

```
sudo apt install sigil
```

Sigil has a lot of dependencies on Python libraries and modules and hence it downloads and installs a good number of packages.

![][10]

I am not going to list commands for Fedora, SUSE, Arch and other distributions. You probably already know how to use your distribution’s package manager, right?

The version provided by your distribution may not always be the latest. If you want the latest version of Sigil, you can check out its GitHub repositories.

[Sigil on GitHub][11]

### Not for everyone, certianly not for reading ePUB books

I wouldn’t recommend using Sigil for reading ebooks. There are [other dedicated applications on Linux to read .epub files][12].

If you are a writer who has to deal with EPUB books or if you are digitizing old books and converting them in various formats, Sigil could be worth a try.

I haven’t used Sigil extensively so I cannot provide a review of it. I let it up to you to explore it and share your experienced with the rest of us here.

--------------------------------------------------------------------------------

via: https://itsfoss.com/sigile-epub-editor/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://sigil-ebook.com/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/open-epub-sigil.png?resize=800%2C621&ssl=1
[3]: https://itsfoss.com/create-ebook-calibre-linux/
[4]: https://www.computerhope.com/jargon/w/wysiwyg.htm
[5]: https://itsfoss.com/best-modern-open-source-code-editors-for-linux/
[6]: https://itsfoss.com/open-source-tools-writers/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/sigil-epub-editor-800x621.png?resize=800%2C621&ssl=1
[8]: https://github.com/Sigil-Ebook/Sigil/wiki
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/sigil-software-center-ubuntu.png?resize=800%2C424&ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/installing-sigil-ubuntu.png?resize=800%2C547&ssl=1
[11]: https://github.com/Sigil-Ebook/Sigil
[12]: https://itsfoss.com/open-epub-books-ubuntu-linux/

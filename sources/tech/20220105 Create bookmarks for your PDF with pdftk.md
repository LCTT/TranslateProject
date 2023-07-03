[#]: subject: "Create bookmarks for your PDF with pdftk"
[#]: via: "https://opensource.com/article/22/1/pdf-metadata-pdftk"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "toknow-gh"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Create bookmarks for your PDF with pdftk
======
Providing bookmarks to your users is helpful and takes advantage of the
technology available.
![Business woman on laptop sitting in front of window][1]

In [introducing pdftk-java][2], I explained how I use the `pdftk-java` command to make quick, often scripted, modifications to PDF files.

However, one of the things `pdftk-java` is most useful for is when I've downloaded a big PDF file, sometimes with hundreds of pages of reference text, and discovered that the PDF creator didn't include a table of contents. I don't mean a printed table of contents in the front matter of the book; I mean the table of contents you get down the side of your PDF reader, which the PDF format officially calls "bookmarks."

![Screenshot of a sidebar table of contents next to a PDF][3]

(Seth Kenlon, [CC BY-SA 4.0][4])

Without bookmarks, finding the chapter you need to reference is cumbersome and involves either lots of scrolling or frustrating searches for words you think you remember seeing in the general area.

Another minor annoyance of many PDF files is the lack of metadata, such as a proper title and author in the PDF properties. If you've ever opened up a PDF and seen something generic like "Microsoft Word - 04_Classics_Revisited.docx" in the window title bar, you know this issue.

I don't have to deal with this problem anymore because I have `pdftk-java`, which lets me create my own bookmarks.

### Install pdftk-java on Linux

As its name suggests, pdftk-java is written in Java, so it works on all major operating systems as long as you have Java installed.

Linux and macOS users can install Linux from [AdoptOpenJDK.net][5].

Windows users can install [Red Hat's Windows build of OpenJDK][6].

To install pdftk-java on Linux:

  1. Download the [pdftk-all.jar release][7] from its Gitlab repository and save it to `~/.local/bin/` or [some other location in your path][8].
  2. Open `~/.bashrc` in your favorite text editor and add this line to it: `alias pdftk='java -jar $HOME/.local/bin/pdftk-all.jar'`
  3. Load your new Bash settings: `source ~/.bashrc`



### Data dump

The first step in correcting the metadata of a PDF is to extract the data file that the PDF currently contains.

There's probably not much to the data file (that's the problem!), but it gives you a good starting place.


```


$ pdftk mybigfile.pdf \
data_dump \
output bookmarks.txt

```

This produces a file called `bookmarks.txt`, and it contains all the metadata assigned to the input file (in this example, `mybigfile.pdf`), plus a lot of bloat.

### Editing metadata

To edit the metadata of the PDF, open your `bookmarks.txt` file in your favorite text editor, such as [Atom][9] or [Gedit][10].

The format is mostly intuitive, and the data contained within it is predictably neglected:


```


InfoBegin
InfoKey: Creator
InfoValue: Word
InfoBegin
InfoKey: ModDate
InfoValue: D:20151221203353Z00&amp;apos;00&amp;apos;
InfoBegin
InfoKey: CreationDate
InfoValue: D:20151221203353Z00&amp;apos;00&amp;apos;
InfoBegin
InfoKey: Producer
InfoValue: Mac OS X 10.10.4 Quartz PDFContext
InfoBegin
InfoKey: Title
InfoValue: Microsoft Word - 04_UA_Classics_Revisited.docx
PdfID0: f049e63eaf3b4061ddad16b455ca780f
PdfID1: f049e63eaf3b4061ddad16b455ca780f
NumberOfPages: 42
PageMediaBegin
PageMediaNumber: 1
PageMediaRotation: 0
PageMediaRect: 0 0 612 792
PageMediaDimensions: 612 792
[...]

```

You can edit InfoValue fields to contain data that makes sense for the PDF you're repairing. For instance, instead of setting the Creator key to the value Word, you could set it to the actual author's name or the publishing house releasing the PDF file. Rather than giving the document the default export string of the application that produced it, give it the book's actual title.

There's also some cleanup work you can do. Everything below the `NumberOfPages` line is also unnecessary, so remove those lines.

### Adding bookmarks

PDF bookmarks follow this format:


```


BookmarkBegin
BookmarkTitle: My first bookmark
BookmarkLevel: 1
BookmarkPageNumber: 2

```

  * `BookmarkBegin` indicates that you're creating a new bookmark.
  * `BookmarkTitle` contains the text that's visible in the PDF viewer.
  * `BookmarkLevel` sets the inheritance level of this bookmark. If you set a BookmarkLevel to 2, it appears within a disclosure triangle of the previous bookmark. If you set a BookmarkLevel to 3, it appears within a disclosure triangle of the previous bookmark, as long as the previous bookmark is set to 2. This setting gives you the ability to bookmark, for example, a chapter title as well as section headings within that chapter.
  * `BookmarkPageNumber` determines what PDF page the user is taken to when they click the bookmark.



Create bookmarks for each section of the book that you think is important, then save the file.

### Updating bookmark info

Now that you have your metadata and bookmarks set, you can apply them to your PDF—actually, you’ll apply them to a new PDF that contains the same content as the old PDF:


```


$ pdftk mybigfile.pdf \
update_info bookmarks.txt \
output mynewfile.pdf

```

This produces a file called `mynewfile.pdf`, containing all of your metadata and bookmarks.

### Professional publishing

The difference between a PDF with generic metadata and no bookmarks and a PDF with personalized metadata values and useful bookmarks probably isn't going to make or break a sale.

However, paying attention to the small details like metadata shows that you value quality assurance, and providing bookmarks to your users is helpful and takes advantage of the technology available.

Use `pdftk-java` to make this process easy, and your users will thank you.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/pdf-metadata-pdftk

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF (Woman using laptop concentrating)
[2]: https://opensource.com/article/21/12/edit-pdf-linux-pdftk
[3]: https://opensource.com/sites/default/files/uploads/pdtfk_update.jpeg (table of contents)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://adoptopenjdk.net/releases.html
[6]: https://developers.redhat.com/products/openjdk/download
[7]: https://gitlab.com/pdftk-java/pdftk/-/jobs/1527259628/artifacts/raw/build/libs/pdftk-all.jar
[8]: https://opensource.com/article/17/6/set-path-linux
[9]: https://opensource.com/article/20/12/atom
[10]: https://opensource.com/article/20/12/gedit

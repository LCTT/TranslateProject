[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to generate an EPUB file on Fedora)
[#]: via: (https://fedoramagazine.org/how-to-generate-an-epub-file-on-fedora/)
[#]: author: (John Paul Wohlscheid https://fedoramagazine.org/author/johnblood/)

How to generate an EPUB file on Fedora
======

![][1]

It is becoming more popular to read content on smartphones. Every phone comes with its own ebook reader. Believe or not, it is very easy to create your own ebook files on Fedora.

This article shows two different methods to create an [EPUB][2]. The epub format is one of the most popular formats and is supported by many open-source applications.

Most people will ask “Why bother creating an EPUB file when PDFs are so easy to create?” The answer is: “Have you ever tried reading a sheet of paper when you can only see a small section at a time?” In order to read a PDF you have to keep zooming and moving around the document or scale it down to a small size to fit the screen. An EPUB file, on the other hand, is designed to fit many different screen types.

### Method 1: ghostwriter and pandoc

This first method creates a quick ebook file. It uses a Markdown editor named [ghostwriter][3] and a command-line document conversion tool named [pandoc][4].

You can either search for them and install them from the Software Center or you can install them from the terminal. If you are going to use the terminal to install them, run this command: _sudo dnf install pandoc ghostwriter_.

For those who are not aware of what [Markdown][5] is, here is a quick explanation. It is a simple markup language created a little over 15 years ago. It uses simple syntax to format plain text. Markdown files can then be converted to a whole slew of other document formats.

![ghostwriter][6]

Now for the tools. ghostwriter is a cross-platform Markdown editor that is easy to use and does not get in the way. pandoc is a very handy document converting tool that can handle hundreds of different formats.

To create your ebook, open ghostwriter, and start writing your document. If you have used Markdown before, you may be used to making the title of your document Heading 1 by putting a pound sign in front of it. Like this: _# My Man Jeeves_. However, pandoc will not recognize that as the title and put a big UNTITLED at the top of your ebook. Instead put a _%_ in front of your title. For example, _% My Man Jeeves_. Sections or chapters should be formatted as Heading 2, i.e. _## Leave It to Jeeves_. If you have subsections, use Heading 3 (_###_).

![][7]

Once your document is complete, click _File_ -&gt; _Export_ (or press _Ctrl_ \+ _E_). In the dialog box, select between several options for the Markdown converter. If this is the first time you have used ghostwriter, the Sundown converter will be picked by default. From the dialog box, select pandoc. Next click _Export_. Your EPUB file is now created.

![ghostwriter export dialog box][8]

Note: If you get an error saying that there was an issue with pandoc, turn off _Smart Typography_ and try again.

### Method 2: calibre

If you want a more polished ebook, this is the method that you are looking for. It takes a few more steps, but it’s worth it.

![][9]

First, install an application named [calibre][10]. calibre is not just an ebook reader, it is an ebook management system. You can either install it from the Software Center or from the terminal via _sudo dnf install calibre_.

In this method, you can either write your document in LibreOffice, ghostwriter, or another editor of your choice. Make sure that the title of the book is formatted as Heading 1, chapters as Heading 2, and sub-sections as Heading 3.

Next, export your document as an HTML file.

Now add the file to calibre. Open calibre and click “_Add books_“. It will take calibre a couple of seconds to add the file.

![][11]

Once the file is imported, edit the file’s metadata by clicking on the “_Edit metadata_” button. Here you can fill out the title of the book and the author’s name. You can also upload a cover image (if you have one) or calibre will generate one for you.

![][12]

Next, click the “_Convert books_” button. In the new dialog box, select the “_Look &amp; Feel_” section and the “_Layout_” tab. Check the “_Remove spacing between paragraphs_” option. This will tighten up the contents as indent each paragraph.

![][13]

Now, set up the table of contents. Select the “_Table of Contents_” section. There are three options to focus on: Level 1 TOC, Level 2 TOC, and Level 3 TOC. For each, click the wand at the end. In this new dialog box, select the HTML tag that applies to the table of contents entry. For example, select _h1_ for Level 1 TOC and so on.

![][14]

Next, tell calibre to include the table of contents. Select the “_EPUB output_” section and check the “_Insert Inline Table of Contents_“. To create the epub file, click “_OK_“.

![][15]

Now you have a professional-looking ebook file.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-generate-an-epub-file-on-fedora/

作者：[John Paul Wohlscheid][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/johnblood/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/05/epub-how_to-816x345.png
[2]: https://en.wikipedia.org/wiki/EPUB
[3]: https://github.com/wereturtle/ghostwriter
[4]: https://pandoc.org/
[5]: https://fedoramagazine.org/applications-for-writing-markdown/
[6]: https://fedoramagazine.org/wp-content/uploads/2020/05/ghostwriter-1024x640.jpg
[7]: https://fedoramagazine.org/wp-content/uploads/2020/05/ghostwriter-menu-1024x640.jpg
[8]: https://fedoramagazine.org/wp-content/uploads/2020/05/ghostwriter-export-1024x640.jpg
[9]: https://fedoramagazine.org/wp-content/uploads/2020/05/calibre-pre-1024x640.jpg
[10]: https://calibre-ebook.com/
[11]: https://fedoramagazine.org/wp-content/uploads/2020/05/calibre-metadata-1024x640.jpg
[12]: https://fedoramagazine.org/wp-content/uploads/2020/05/calibre-lookandfeel-1024x640.jpg
[13]: https://fedoramagazine.org/wp-content/uploads/2020/05/calibre-toc2-1024x640.jpg
[14]: https://fedoramagazine.org/wp-content/uploads/2020/05/calibre-epub-output-1024x640.jpg
[15]: https://fedoramagazine.org/wp-content/uploads/2020/05/calibre-post-1024x640.jpg

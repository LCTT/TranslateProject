translating---geekpi

6 open source tools for writing a book
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc-lead-austen-writing-code.png?itok=XPxRMtQ4)

I first used and contributed to free and open source software in 1993, and since then I've been an open source software developer and evangelist. I've written or contributed to dozens of open source software projects, although the one that I'll be remembered for is the [FreeDOS Project][1], an open source implementation of the DOS operating system.

I recently wrote a book about FreeDOS. [_Using FreeDOS_][2] is my celebration of the 24th anniversary of FreeDOS. It is a collection of how-to's about installing and using FreeDOS, essays about my favorite DOS applications, and quick-reference guides to the DOS command line and DOS batch programming. I've been working on this book for the last few months, with the help of a great professional editor.

_Using FreeDOS_ is available under the Creative Commons Attribution (cc-by) International Public License. You can download the EPUB and PDF versions at no charge from the [FreeDOS e-books][2] website. (I'm also planning a print version, for those who prefer a bound copy.)

The book was produced almost entirely with open source software. I'd like to share a brief insight into the tools I used to create, edit, and produce _Using FreeDOS_.

### Google Docs

[Google Docs][3] is the only tool I used that isn't open source software. I uploaded my first drafts to Google Docs so my editor and I could collaborate. I'm sure there are open source collaboration tools, but Google Doc's ability to let two people edit the same document at the same time, make comments, edit suggestions, and change tracking—not to mention its use of paragraph styles and the ability to download the finished document—made it a valuable part of the editing process.

### LibreOffice

I started on [LibreOffice][4] 6.0 but I finished the book using LibreOffice 6.1. I love LibreOffice's rich support of styles. Paragraph styles made it easy to apply a style for titles, headers, body text, sample code, and other text. Character styles let me modify the appearance of text within a paragraph, such as inline sample code or a different style to indicate a filename. Graphics styles let me apply certain styling to screenshots and other images. And page styles allowed me to easily modify the layout and appearance of the page.

### GIMP

My book includes a lot of DOS program screenshots, website screenshots, and FreeDOS logos. I used [GIMP][5] to modify these images for the book. Usually, this was simply cropping or resizing an image, but as I prepare the print edition of the book, I'm using GIMP to create a few images that will be simpler for print layout.

### Inkscape

Most of the FreeDOS logos and fish mascots are in SVG format, and I used [Inkscape][6] for any image tweaking here. And in preparing the PDF version of the ebook, I wanted a simple blue banner at top of the page, with the FreeDOS logo in the corner. After some experimenting, I found it easier to create an SVG image in Inkscape that looked like the banner I wanted, and I pasted that into the header.

### ImageMagick

While it's great to use GIMP to do the fine work, sometimes it's faster to run an [ImageMagick][7] command over a set of images, such as to convert into PNG format or to resize images.

### Sigil

LibreOffice can export directly to EPUB format, but it wasn't a great transfer. I haven't tried creating an EPUB with LibreOffice 6.1, but LibreOffice 6.0 didn't include my images. It also added styles in a weird way. I used [Sigil][8] to tweak the EPUB file and make everything look right. Sigil even has a preview function so you can see what the EPUB will look like.

### QEMU

Because this book is about installing and running FreeDOS, I needed to actually run FreeDOS. You can boot FreeDOS inside any PC emulator, including VirtualBox, QEMU, GNOME Boxes, PCem, and Bochs. But I like the simplicity of [QEMU][9]. And the QEMU console lets you issue a screen dump in PPM format, which is ideal for grabbing screenshots to include in the book.

Of course, I have to mention running [GNOME][10] on [Linux][11]. I use the [Fedora][12] distribution of Linux.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/writing-book-open-source-tools

作者：[Jim Hall][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[1]: http://www.freedos.org/
[2]: http://www.freedos.org/ebook/
[3]: https://www.google.com/docs/about/
[4]: https://www.libreoffice.org/
[5]: https://www.gimp.org/
[6]: https://inkscape.org/
[7]: https://www.imagemagick.org/
[8]: https://sigil-ebook.com/
[9]: https://www.qemu.org/
[10]: https://www.gnome.org/
[11]: https://www.kernel.org/
[12]: https://getfedora.org/

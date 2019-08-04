[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to create portable documents with CBZ and DjVu)
[#]: via: (https://opensource.com/article/19/3/comic-book-archive-djvu)
[#]: author: (Seth Kenlon  https://opensource.com/users/seth)

How to create portable documents with CBZ and DjVu
======

Stop using PDFs with these two smart digital archive formats.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/books_stack_library_reading.jpg?itok=uulcS8Sw)

Recently, I discovered that my great-great-grandfather wrote two books near the turn of the 20th century: one about sailing and the other about his career as [New York City's fire chief][1]. The books have a niche audience, but since they are part of my family history, I wanted to preserve a digital copy of each. But, I wondered, what portable document format is best suited for such an endeavor?

I decided early on that PDF was not an option. The format, while good for printing preflight, seems condemned to nonstop feature bloat, and it produces documents that are difficult to introspect and edit. I wanted a smarter format with similar features. Two came to mind: comic book archive and DjVu.

### Comic book archive

[Comic book archive][2] is a simple format most often used, as the name suggests, for comic books. You can see examples of comic book archives on sites like [Comic Book Plus][3] and [The Digital Comic Museum][4].

The greatest feature of a comic book archive is also its weakest: it's so simple, it's almost more of a convention than a format. In fact, a comic book archive is just a ZIP, TAR, 7Z, or RAR archive given the extension .cbz, .cbt, .cb7, or .cbr, respectively. It has no standard for storing metadata.

They are, however, very easy to create.

#### Creating comic book archives

  1. Create a directory full of image files, and rename the images so that they have an inherent order:

```
$ n=0 && for i in *.png ; do mv $i `printf %04d $n`.png ; done
```



  2. Archive the files using your favorite archive tool. In my experience, CBZ is best supported.

```
$ zip comicbook.zip -r *.png
```



  3. Finally, rename the file with the appropriate extension.

```
$ mv comicbook.zip comicbook.cbz
```




The resulting file should open on most of your devices. On Linux, both [Evince][5] and [Okular][6] can open CBZ files. On Android, [Document Viewer][7] and [Bubble][8] can open them.

#### Uncompressing comic book archives

Getting your data back out of a comic book archive is also easy: just unarchive the CBZ file.

Since your favorite archive tool may not recognize the .cbz extension as a valid archive, it's best to rename it back to its native extension:
```

```

$ mv comicbook.cbz comicbook.zip
$ unzip comicbook.zip

### DjVu

A more advanced format, developed more than 20 years ago by AT&T, is [DjVu][9] (pronounced "déjà vu"). It's a digital document format with advanced compression technology and is viewable in more applications than you probably realize, including [Evince][5], [Okular][6], [DjVu.js][10] online, the [DjVu.js viewer][11] Firefox extension, [GNU Emacs][12], [Document Viewer][7] on Android, and the open source, cross-platform [DjView][13] viewer on Sourceforge.

You can read more about DjVu and find sample .djvu files, at [djvu.org][14].

DjVu has several appealing features, including image compression, outline (bookmark) structure, and support for embedded text. It's easy to introspect and edit using free and open source tools.

#### Installing DjVu

The open source toolchain is [DjVuLibre][15], which you can find in your distribution's software repository. For example, on Fedora:

```
$ sudo dnf install dvjulibre
```

#### Creating a DjVu file

A .djvu is an image that has been encoded as a DjVu file. A .djvu can contain one or more images (stored as "pages").

To manually produce a DjVu, you can use one of two encoders: **c44** for high-quality images or **cjb2** for simple bi-tonal images. Each encoder accepts a different image format: c44 can process .pnm or .jpeg files, while cjb2 can process .pbm or .tiff images.

If you need to preprocess an image, you can do that in a terminal with [Image Magick][16], using the **-density** option to define your desired resolution:

```
$ convert -density 200 foo.png foo.pnm
```

Then you can convert it to DjVu:

```
$ c44 -dpi 200 foo.pnm foo.djvu
```

If your image is simple, like black text on a white page, you can try to convert it using the simpler encoder. If necessary, use Image Magick first to convert it to a compatible intermediate format:

```
$ convert -density 200 foo.png foo.pbm
```

And then convert it to DjVu:

```
$ cjb2 -dpi 200 foo.pbm foo.djvu
```

You now have a simple, single-page .djvu document.

#### Creating a multi-page DjVu file

While a single-page DjVu can be useful, given DjVu's sometimes excellent compression, it's most commonly used as a multi-page format.

Assuming you have a directory of many .djvu files, you can bundle them together with the **djvm** command:

```
$ djvm -c pg_1.djvu two.djvu 003.djvu mybook.djvu
```

Unlike a CBZ archive, the names of the bundled images have no effect on their order in the DjVu document, rather it preserves the order you provide in the command. If you had the foresight to name them in a natural sorting order (001.djvu, 002.djvu, 003.djvu, 004.djvu, and so on), you can use a wildcard:

```
$ djvm -c *.djvu mybook.djvu
```

#### Manipulating a DjVu document

It's easy to edit DjVu documents with **djvm**. For instance, you can insert a page into an existing DjVu document:

```
$ djvm -i mybook.djvu newpage.djvu 2
```

In this example, the page _newpage.djvu_ becomes the new page 2 in the file _mybook.djvu_.

You can also delete a page. For example, to delete page 4 from _mybook.djvu_ :

```
$ djvm -d mybook.djvu 4
```

#### Setting an outline

You can add metadata to a DjVu file, such as an outline (commonly called "bookmarks"). To do this manually, create a plaintext file with the document's outline. A DjVu outline is expressed in a [Lisp][17]-like structure, with an opening **bookmarks** element followed by bookmark names and page numbers:
```
(bookmarks
("Front cover" "#1")
("Chapter 1" "#3")
("Chapter 2" "#18")
("Chapter 3" "#26")
)
```

The parentheses define levels in the outline. The outline currently has only top-level bookmarks, but any section can have a subsection by delaying its closing parenthesis. For example, to add a subsection to Chapter 1:
```
(bookmarks
("Front cover" "#1")
("Chapter 1" "#3"
("Section 1" "#6"))
("Chapter 2" "#18")
("Chapter 3" "#26")
)
```

Once the outline is complete, save the file and apply it to your DjVu file using the **djvused** command:

```
$ djvused -e 'set-outline outline.txt' -s mybook.djvu
```

Open the DjVu file to see the outline.

![A DjVu with an outline as viewed in Okular][19]

#### Embedding text

If you want to store the text of a document you're creating, you can embed text elements ("hidden text" in **djvused** terminology) in your DjVu file so that applications like Okular or DjView can select and copy the text to a user's clipboard.

This is a complex operation because, in order to embed text, you must first have text. If you have access to a good OCR application (or the time and dedication to transcribe the printed page), you may have that data, but then you must map the text to the bitmap image.

Once you have the text and the coordinates for each line (or, if you prefer, for each word), you can write a **djvused** script with blocks for each page:
```
select; remove-ant; remove-txt
# -------------------------
select "p0004.djvu" # page 4
set-txt
(page 0 0 2550 3300
(line 1661 2337 2235 2369 "Fires and Fire-fighters")
(line 1761 2337 2235 2369 "by John Kenlon"))

.
# -------------------------
select "p0005.djvu" # page 5
set-txt
(page 0 0 2550 3300
(line 294 2602 1206 2642 "Some more text here, blah blah blah."))
```

The integers for each line represent the minimum and maximum locations for the X and Y coordinates of each line ( **xmin** , **ymin** , **xmax** , **ymax** ). Each line is a rectangle measured in pixels, with an origin at the _bottom-left_ corner of the page.

You can define embedded text elements as words, lines, and hyperlinks, and you can map complex regions with shapes other than just rectangles. You can also embed specially defined metadata, such as BibTex keys, which are expressed in lowercase (year, booktitle, editor, author, and so on), and DocInfo keys, borrowed from the PDF spec, always starting with an uppercase letter (Title, Author, Subject, Creator, Produced, CreationDate, ModDate, and so on).

#### Automating DjVu creation

While it's nice to be able to handcraft a finely detailed DjVu document, if you adopt DjVu as an everyday format, you'll notice that your applications lack some of the conveniences available in the more ubiquitous PDF. For instance, few (if any) applications offer a convenient _Print to DjVu_ or _Export to DjVu_ option, as they do for PDF.

However, you can still use DjVu by leveraging PDF as an intermediate format.

Unfortunately, the library required for easy, automated DjVu conversion is licensed under the CPL, which has requirements that cannot be satisfied by the GPL code in the toolchain. For this reason, it can't be distributed as a compiled library, but you're free to compile it yourself.

The process is relatively simple due to an excellent build script provided by the DjVuLibre team.

  1. First, prepare your system with software development tools. On Fedora, the quick-and-easy way is with a DNF group:

```
$ sudo dnf group install @c-development
```

On Ubuntu:

```
$ sudo apt-get install build-essential
```



  2. Next, download the [**GSDjVu** source code][20] from Sourceforge. Be sure to download **GSDjVu** , not **DjVuLibre** (in other words, don't click on the big green button at the top of the file listing, but on the latest file instead).


  3. Unarchive the file you just downloaded, and change directory into it:
```
$ cd ~/Downloads
$ tar xvf gsdjvu-X.YY.tar.gz
$ cd gsdjvu-X.YY
```



  4. Create a directory called **BUILD**. It must be called **BUILD** , so quell your creativity:
```
$ mkdir BUILD
$ cd BUILD
```



  5. Download the additional source packages required to build the **GSDjVu **application. Specifically, you must download the source for **Ghostscript** (you almost certainly already have this installed, but you need its source to build against). Additionally, your system must have source packages for **jpeg** , **libpng** , **openjpeg** , and **zlib**. If you think your system already has the source packages for these projects, you can run the build script; if the sources are not found, the script will fail and let you correct the error before trying again.


  6. Run the interactive **build-gsdjvu** build script included in the download. This script unpacks the source files, patches Ghostscript with the **gdevdjvu** driver, compiles Ghostscript, and prunes unnecessary files from the build results.


  7. You can install **GSDjVu **anywhere in your path. If you don't know what your **PATH** variable is, you can see it with **echo $PATH**. For example, to install it to the **/usr/local** prefix:
```
$ sudo cp -r BUILD/INST/gsdjvu /usr/local/lib64
$ cd /usr/local/bin
$ sudo ln -s ../lib64/gsdjvu/gsdjvu gsdjvu
```




#### Converting a PDF to DjVu

Now that you've built the Ghostscript driver, converting a PDF to DjVu requires just one command:

```
$ djvudigital --words mydocument.pdf mydocument.djvu
```

This transforms all pages, bookmarks, and embedded text in a PDF into a DjVu file. The `--words` option maps all mapped embedded PDF text to the corresponding points in the DjVu file. If there is no embedded PDF, then no embedded text is carried over. Using this tool, you can use convenient PDF functions from your applications and end up with DjVu files.

### Why DjVu and CBZ?

DjVu and comic book archive are great additional document formats for your archival arsenal. It seems silly to stuff a series of images into a PostScript format, like PDF, or a format clearly meant mostly for text, like EPUB, so it's nice to have CBZ and DjVu as additional options. They might not be right for all of your documents, but it's good to get comfortable with them so you can use one when it makes the most sense.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/comic-book-archive-djvu

作者：[Seth Kenlon (Red Hat, Community Moderator)][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://www.fireengineering.com/articles/print/volume-56/issue-27/features/chief-john-kenlon-of-new-york-city.html
[2]: https://en.wikipedia.org/wiki/Comic_book_archive
[3]: https://comicbookplus.com/
[4]: https://digitalcomicmuseum.com/
[5]: https://wiki.gnome.org/Apps/Evince
[6]: https://okular.kde.org
[7]: https://f-droid.org/en/packages/org.sufficientlysecure.viewer/
[8]: https://f-droid.org/en/packages/com.nkanaev.comics/
[9]: http://djvu.org/
[10]: http://djvu.js.org/
[11]: https://github.com/RussCoder/djvujs
[12]: https://elpa.gnu.org/packages/djvu.html
[13]: http://djvu.sourceforge.net/djview4.html
[14]: http://djvu.org
[15]: http://djvu.sourceforge.net
[16]: https://www.imagemagick.org/
[17]: https://en.wikipedia.org/wiki/Lisp_(programming_language)
[18]: /file/426061
[19]: https://opensource.com/sites/default/files/uploads/outline.png (A DjVu with an outline as viewed in Okular)
[20]: https://sourceforge.net/projects/djvu/files/GSDjVu/1.10/

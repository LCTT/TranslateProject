[#]: subject: (Edit PDFs on the Linux command line)
[#]: via: (https://opensource.com/article/21/7/qpdf-command-line)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Edit PDFs on the Linux command line
======
Use qpdf and poppler-utils to split, modify, and combine PDF files.
![Text editor on a browser, in blue][1]

Many of the documents you receive come in PDF format. Sometimes those PDFs need to be manipulated. For example, pages might need to be removed or added, or you might need to sign or change a specific page.

Whether good or bad, this is the reality we all live in.

There are some fancy graphical user interface tools that let you edit PDFs, but I have always been most comfortable with the command line. Of the many command-line tools for this task, the ones I use when I want to modify a PDF are `qpdf` and `poppler-utils`.

### Install

On Linux, you can install `qpdf` and `poppler-utils` using your package manager (such as `apt` or `dnf`.) For example, on Fedora:


```
`$ sudo dnf install qpdf poppler-utils`
```

On macOS, use [MacPorts][2] or [Homebrew][3]. On Windows, use [Chocolatey][4].

### qpdf

The `qpdf` command can do a lot, but I mostly use it for:

  1. Splitting a PDF into separate pages
  2. Concatenating, or combining, PDFs into one file



To split a PDF into separate pages:


```
`qpdf --split-pages original.pdf split.pdf`
```

This generates files like `split-01.pdf`, `split-02.pdf`, and so on. Each file is a single-page PDF file.

Concatenating files is a little subtler:


```
`qpdf --empty concatenated.pdf --pages split-*.pdf --`
```

This is what `qpdf` does by default. The `--empty` option tells qpdf to start with an empty file. The two dashes (`--`) at the end signals that there are no more files to process. This is a case where the parameters reflect an internal model, rather than what people use it for, but at least it runs and produces valid PDFs!

### poppler-utils

This package contains several utilities, but the one I use the most is [pdftoppm][5], which converts PDF files to portable pixmap (`ppm`) image files. I usually use it after I split pages with `qpdf` and need to convert a specific page to an image that I can modify. The `ppm` format is not well known, but the important thing about it is that most image manipulation methods, including [ImageMagick][6], [Pillow][7], and many other options, work with it. Most of these tools can save files back to PDF, too.

### Workflow

My usual workflow is:

  * Use `qpdf` to split the PDF into pages.
  * Use `poppler-utils` to convert the pages that need to be changed into images.
  * Modify the images as needed and save them to PDF.
  * Use `qpdf` to concatenate the pages back into one PDF.



### Other tools

There are many great open source commands to deal with PDFs, whether you're [shrinking them][8], [creating them from text files][9], [converting documents][10], or trying your best to [avoid them altogether][11]. What are your favorite open source PDF utilities? Please share them in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/qpdf-command-line

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_blue_text_editor_web.png?itok=lcf-m6N7 (Text editor on a browser, in blue)
[2]: https://opensource.com/article/20/11/macports
[3]: https://opensource.com/article/20/6/homebrew-mac
[4]: https://opensource.com/article/20/3/chocolatey
[5]: https://www.xpdfreader.com/pdftoppm-man.html
[6]: https://opensource.com/article/17/8/imagemagick
[7]: https://opensource.com/article/20/8/edit-images-python
[8]: https://opensource.com/article/20/8/reduce-pdf
[9]: https://opensource.com/article/20/5/pandoc-cheat-sheet
[10]: https://opensource.com/article/21/3/libreoffice-command-line
[11]: https://opensource.com/article/19/3/comic-book-archive-djvu

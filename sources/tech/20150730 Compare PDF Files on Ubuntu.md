Translating by GOLinux!
Compare PDF Files on Ubuntu
================================================================================
If you want to compare PDF files you can use one of the following utility

### Comparepdf ###

comparepdf is a command line application used to compare two PDF files.The default comparison mode is text mode where the text of each corresponding pair of pages is compared. As soon as a difference is detected the program terminates with a message (unless -v0 is set) and an indicative return code.

The OPTIONS are -ct or --compare=text (the default) for text mode comparisons or -ca or --compare=appearance for visual comparisons (useful if diagrams or other images have changed), and -v=1 or --verbose=1 for reporting differences (and saying nothing for matching files): use -v=0 for no reporting or -v=2 for reporting both different and matching files.

### Install Comparepdf on ubuntu ###

Open the terminal and run the following command

    sudo apt-get install comparepdf

**Comparepdf syntax**

    comparepdf [OPTIONS] file1.pdf file2.pdf

**Diffpdf**

DiffPDF is a GUI application used to compare two PDF files.By default the comparison is of the text on each pair of pages, but comparing the visual appearance of pages is also supported (for example, if a diagram is changed or if a paragraph is reformatted). It is also possible to compare pticular pages or page ranges. For example, if there are two versions of a PDF file, one with pages 1-12 and the other with pages 1-13 because of an extra page having been added as page 4, they can be compared by specifying two page ranges, 1-12 for the first and 1-3, 5-13 for the second. This will make DiffPDF compare pages in the pairs (1, 1), (2, 2), (3, 3), (4, 5), (5, 6), and so on, to (12, 13).

### Install diffpdf on ubuntu ###

Open the terminal and run the following command

    sudo apt-get install diffpdf

### Screenshots ###

![](http://www.ubuntugeek.com/wp-content/uploads/2015/07/14.png)

![](http://www.ubuntugeek.com/wp-content/uploads/2015/07/23.png)

--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/compare-pdf-files-on-ubuntu.html

作者：[ruchi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.ubuntugeek.com/author/ubuntufix

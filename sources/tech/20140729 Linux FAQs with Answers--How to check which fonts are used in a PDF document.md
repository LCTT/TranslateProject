Translating by GoLinux ...
Linux FAQs with Answers--How to check which fonts are used in a PDF document
================================================================================
> **Question**: I would like to know what fonts are used or embedded in a PDF file. Is there a Linux tool which can check which fonts are used in a PDF document? 

To check what fonts are included or used in a PDF file, you can use a command-line utility called pdffonts, which is a PDF font analyzer tool. pdffonts is a part of Poppler PDF utilities package.

### Install PDF Utilities on Linux ###

To install Poppler on Debian, Ubuntu or Linux Mint:

    $ sudo apt-get install poppler-utils

To install PDF Utilities on Fedora, CentOS or RHEL:

    $ sudo yum install poppler-utils

### Check PDF Fonts ###

**pdffonts** can list all the fonts used in a PDF document. The basic usage of pdffonts is as follows.

    $ pdffonts doc.pdf

![](https://farm6.staticflickr.com/5592/14527744387_f8bb671955_z.jpg)

The **pdffonts** tool shows various information about each font used, such as font name/type, or whether or not a font is embedded, etc.

In case of a multi-page PDF document, you can limit font scanning for a range of pages with "-f" (first page), and "-l" (last page) options. For example, if you want to find out which fonts are used in pages 5-10 of a document, run this:

    $ pdffonts -f 5 -l 10 doc.pdf 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/check-which-fonts-are-used-pdf-document.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

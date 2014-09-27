Tanslating------geekpi

Linux FAQs with Answers--How to embed all fonts in a PDF document generated with LaTex
================================================================================
> **Question**: I generated a PDF document by compiling LaTex source files. However, I noticed that not all fonts used are embedded in the PDF document. How can I make sure that all fonts are embedded in a PDF document generated from LaTex? 

When you create a PDF file, it is a good idea to embed fonts in the PDF file. If you don't embed fonts, a PDF viewer can replace a font with something else if the font is not available on the computer. This will cause the document to be rendered differently across different PDF viewers or OS platforms. Missing fonts can also be an issue when you print out the document.

When you generate a PDF document from LaTex (for example with pdflatex or dvipdfm), it's possible that not all fonts are embedded in the PDF document. For example, the following output of [pdffonts][1] says that there are missing fonts (e.g., Helvetica) in a PDF document.

![](https://farm3.staticflickr.com/2944/15344704481_d691f66e75_z.jpg)

To avoid this kind of problems, here is how to embed all fonts at LaTex compile time.

    $ latex document.tex
    $ dvips -Ppdf -G0 -t letter -o document.ps document.dvi
    $ ps2pdf -dPDFSETTINGS=/prepress \
    -dCompatibilityLevel=1.4 \
    -dAutoFilterColorImages=false \
    -dAutoFilterGrayImages=false \
    -dColorImageFilter=/FlateEncode \
    -dGrayImageFilter=/FlateEncode \
    -dMonoImageFilter=/FlateEncode \
    -dDownsampleColorImages=false \
    -dDownsampleGrayImages=false \
    document.ps document.pdf 

Now you will see that all fonts are properly embedded in the PDF file.

![](https://farm4.staticflickr.com/3890/15161184500_15ec673dca_z.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/embed-all-fonts-pdf-document-latex.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://ask.xmodulo.com/check-which-fonts-are-used-pdf-document.html
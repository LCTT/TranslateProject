Linux有问必答：如何在PDF中嵌入LaTex中的所有字体
================================================================================
> **提问**: 我通过编译LaTex源文件生成了一份PDF文档。然而，我注意到，并不是所有字体都嵌入到了PDF文档中。我怎样才能确保所有的字体嵌入在由LaTex生成的PDF文档中？

当你创建一个PDF文件时，在PDF文件中嵌入字体是一个好主意。如果你不嵌入字体，PDF浏览器可以在计算机上没有字体的情况下使用其他东西代替。这将导致文件被在不同的PDF浏览器或操作系统平台上呈现不同的样式。当你打印出来的文档时，缺少的字体是一个问题。

当你从LaTex中生成PDF文档时（例如用pdflatex或dvipdfm），可能并不是所有的字体都嵌入在PDF文档中。例如，[pdffonts][1]下面的输出中提示PDF文档中有缺少的字体（如Helvetica）。

![](https://farm3.staticflickr.com/2944/15344704481_d691f66e75_z.jpg)

为了避免这样的问题，下面是如何在LaTex编译时嵌入所有的字体。

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

现在你可以看到所有的字体都被嵌入到PDF中了。

![](https://farm4.staticflickr.com/3890/15161184500_15ec673dca_z.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/embed-all-fonts-pdf-document-latex.html

译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://ask.xmodulo.com/check-which-fonts-are-used-pdf-document.html
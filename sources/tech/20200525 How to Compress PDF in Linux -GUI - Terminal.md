[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Compress PDF in Linux [GUI & Terminal])
[#]: via: (https://itsfoss.com/compress-pdf-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Compress PDF in Linux [GUI & Terminal]
======

_**Brief: Learn how to reduce the size of a PDF file in Linux. Both command line and GUI methods have been discussed.**_

I was filling some application form and it asked to upload the necessary documents in PDF format. Not a big issue. I gathered all the [scanned images and combined them in one PDF using gscan2pdf tool][1].

The problem came when I tried to upload this PDF file. The upload failed because it exceeded the maximum file size limit. This only meant that I needed to somehow reduce the size of the PDF file.

Now, you may use an online PDF compressing website but I don’t trust them. A file with important documents uploading to an unknown server is not a good idea. You could never be sure that they don’t keep a copy your uploaded PDF document.

This is the reason why I prefer compressing PDF files on my system rather than uploading it to some random server.

In this quick tutorial, I’ll show you how to reduce the size of PDF files in Linux. I’ll show both command line and GUI methods.

### Method 1: Reduce PDF file size in Linux command line

![][2]

You can use [Ghostscript][3] command line tool for compressing a PDF file. Most Linux distributions include the open source version of Ghostscript already. However, you can still try to install it just to make sure.

On Debian/Ubuntu based distributions, use the following command to install Ghostscript:

```
sudo apt install ghostscript
```

Now that you have made sure that Ghostscript is installed, you can use the following command to reduce the size of your PDF file:

```
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress -dNOPAUSE -dQUIET -dBATCH -sOutputFile=compressed_PDF_file.pdf input_PDF_file.pdf
```

In the above command, you should add the correct path of the input and out PDF file.

The command looks scary and confusing. I advise copying and pasting most of it. What you need to know is the dPDFSETTINGS parameter. This is what determines the compression level and thus the quality of your compressed PDF file.

dPDFSETTINGS | Description
---|---
/prepress (default) | Higher quality output (300 dpi) but bigger size
/ebook | Medium quality output (150 dpi) with moderate output file size
/screen | Lower quality output (72 dpi) but smallest possible output file size

Do keep in mind that some PDF files may not be compressed a lot or at all. Applying compression on some PDF files may even produce a file bigger than the original. There is not much you can do in such cases.

### Method 2: Compress PDF files in Linux using GUI tool

I understand that not everyone is comfortable with command line tool. The [PDF editors in Linux][4] doesn’t help much with compression. This is why we at It’s FOSS worked on creating a GUI version of the Ghostscript command that you saw above.

[Panos][5] from It’s FOSS team [worked on creating a Python-Qt based GUI wrapper for the Ghostscript][6]. The tool gives you a simple UI where you can select your input file, select a compression level and click on the compress button to compress the PDF file.

![][7]

The compressed PDF file is saved in the same folder as the original PDF file. Your original PDF file remains untouched. The compressed file is renamed by appending -compressed to the original file name.

If you are not satisfied with the compression, you can choose another compression level and compress the file again.

You may find the source code of the PDF Compressor on our GitHub repository. To let you easily use the tool, we have packaged it in AppImage format. Please [refer to this guide to know how to use AppImage][8].

[Download PDF Compressor (AppImage)][9]

Please keep in mind that the tool is in early stages of developments. You may experience some issues. If you do, please let us know in the comments or even better, [file a bug here][10].

We’ll try to add more packages (Snap, Deb, PPAs etc) in the future releases. If you have experience with the development and packaging, please feel free to give us a hand.

Would you like It’s FOSS team to work on creating more such small desktop tools in future? Your feedback and suggestions are welcome.

--------------------------------------------------------------------------------

via: https://itsfoss.com/compress-pdf-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/convert-multiple-images-pdf-ubuntu-1304/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/compress-pdf-linux.jpg?ssl=1
[3]: https://www.ghostscript.com/
[4]: https://itsfoss.com/pdf-editors-linux/
[5]: https://github.com/libreazer
[6]: https://github.com/itsfoss/compress-pdf
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/compress-PDF.jpg?fit=800%2C448&ssl=1
[8]: https://itsfoss.com/use-appimage-linux/
[9]: https://github.com/itsfoss/compress-pdf/releases/download/0.1/compress-pdf-v0.1-x86_64.AppImage
[10]: https://github.com/itsfoss/compress-pdf/issues

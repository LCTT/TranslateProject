[#]: subject: (Use gImageReader to Extract Text From Images and PDFs on Linux)
[#]: via: (https://itsfoss.com/gimagereader-ocr/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Use gImageReader to Extract Text From Images and PDFs on Linux
======

_Brief: gImageReader is a GUI tool to utilize tesseract OCR engine for extracting texts from images and PDF files in Linux._

[gImageReader][1] is a front-end for [Tesseract Open Source OCR Engine][2]. _Tesseract_ was originally developed at HP and then was open-sourced in 2006.

Basically, the OCR (Optical Character Recognition) engine lets you scan texts from a picture or a file (PDF). It can detect several languages by default and also supports scanning through Unicode characters.

However, the Tesseract by itself is a command-line tool without any GUI. So, here, gImageReader comes to the rescue to let any user utilize it to extract text from images and files.

Let me highlight a few things about it while mentioning my experience with it for the time I tested it out.

### gImageReader: A Cross-Platform Front-End to Tesseract OCR

![][3]

To simplify things, gImageReader comes in handy to extract text from a PDF file or an image that contains any kind of text.

Whether you need it for spellcheck or translation, it should be useful for a specific group of users.

To sum up the features in a list, here’s what you can do with it:

  * Add PDF documents and images from disk, scanning devices, clipboard and screenshots
  * Ability to rotate images
  * Common image controls to adjust brightness, contrast, and resolution
  * Scan images directly through the app
  * Ability to process multiple images or files in one go
  * Manual or automatic recognition area definition
  * Recognize to plain text or to [hOCR][4] documents
  * Editor to display the recognized text
  * Can spellcheck the text extracted
  * Convert/Export to PDF documents from hOCR document
  * Export extracted text as a .txt file
  * Cross-platform (Windows)



### Installing gImageReader on Linux

**Note**: _You need to explicitly install Tesseract language packs to detect from images/files from your software manager._

![][5]

You can find gImageReader in the default repositories for some Linux distributions like Fedora and Debian.

For Ubuntu, you need to add a PPA and then install it. To do that, here’s what you need to type in the terminal:

```
sudo add-apt-repository ppa:sandromani/gimagereader
sudo apt update
sudo apt install gimagereader
```

You can also find it for openSUSE from its build service and [AUR][6] will be the place for Arch Linux users.

All the links to the repositories and the packages can be found in their [GitHub page][1].

[gImageReader][1]

### Experience with gImageReader

gImageReader is a quite useful tool for extracting texts from images when you need them. It works great when you try from a PDF file.

For extracting images from a picture shot on a smartphone, the detection was close but a bit inaccurate. Maybe when you scan something, recognition of characters from the file could be better.

So, you’ll have to try it for yourself to see how well it works for your use-case. I tried it on Linux Mint 20.1 (based on Ubuntu 20.04).

I just had an issue to manage languages from the settings and I didn’t get a quick solution for that. If you encounter the issue, you might want to troubleshoot it and explore more about it how to fix it.

![][7]

Other than that, it worked just fine.

Do give it a try and let me know how it worked for you! If you know of something similar (and better), do let me know about it in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/gimagereader-ocr/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://github.com/manisandro/gImageReader
[2]: https://tesseract-ocr.github.io/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/gImageReader.png?resize=800%2C456&ssl=1
[4]: https://en.wikipedia.org/wiki/HOCR
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/tesseract-language-pack.jpg?resize=800%2C620&ssl=1
[6]: https://itsfoss.com/aur-arch-linux/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/gImageReader-1.jpg?resize=800%2C460&ssl=1

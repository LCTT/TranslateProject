How To Remove Password From A PDF File in Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2018/04/Remove-Password-From-A-PDF-File-720x340.png)
Today I happen to share a password protected PDF file to one of my friend. I knew the password of that PDF file, but I didn’t want to disclose it. Instead, I just wanted to remove the password and send the file to him. I started to looking for some easy ways to remove the password protection from the pdf files on Internet. After a quick google search, I came up with four methods to remove password from a PDF file in Linux. The funny thing is I had already done it few years ago and I almost forgot it. If you’re wondering how to remove password from a PDF file in Linux, read on! It is not that difficult.

### Remove Password From A PDF File in Linux

**Method 1 – Using Qpdf**

The **Qpdf** is a PDF transformation software which is used to encrypt and decrypt PDF files, convert PDF files to another equivalent pdf files. Qpdf is available in the default repositories of most Linux distributions, so you can install it using the default package manager.

For example, Qpdf can be installed on Arch Linux and its variants using [**pacman**][1] as shown below.
```
$ sudo pacman -S qpdf

```

On Debian, Ubuntu, Linux Mint:
```
$ sudo apt-get install qpdf

```

Now let us remove the password from a pdf file using qpdf.

I have a password-protected PDF file named **“secure.pdf”**. Whenever I open this file, it prompts me to enter the password to display its contents.

![][3]

I know the password of the above pdf file. However, I don’t want to share the password with anyone. So what I am going to do is to simply remove the password of the PDF file using Qpdf utility with following command.
```
$ qpdf --password='123456' --decrypt secure.pdf output.pdf

```

Quite easy, isn’t it? Yes, it is! Here, **123456** is the password of the **secure.pdf** file. Replace the password with your own.

**Method 2 – Using Pdftk**

**Pdftk** is yet another great software for manipulating pdf documents. Pdftk can do almost all sort of pdf operations, such as;

  * Encrypt and decrypt pdf files.
  * Merge PDF documents.
  * Collate PDF page Scans.
  * Split PDF pages.
  * Rotate PDF files or pages.
  * Fill PDF forms with X/FDF data and/or flatten forms.
  * Generate FDF data stencils from PDF forms.
  * Apply a background watermark or a foreground stamp.
  * Report PDF metrics, bookmarks and metadata.
  * Add/update PDF bookmarks or metadata.
  * Attach files to PDF pages or the PDF document.
  * Unpack PDF attachments.
  * Burst a PDF file into single pages.
  * Compress and decompress page streams.
  * Repair corrupted PDF file.



Pddftk is available in AUR, so you can install it using any AUR helper programs on Arch Linux its derivatives.

Using [**Pacaur**][4]:
```
$ pacaur -S pdftk

```

Using [**Packer**][5]:
```
$ packer -S pdftk

```

Using [**Trizen**][6]:
```
$ trizen -S pdftk

```

Using [**Yay**][7]:
```
$ yay -S pdftk

```

Using [**Yaourt**][8]:
```
$ yaourt -S pdftk

```

On Debian, Ubuntu, Linux Mint, run:
```
$ sudo apt-get instal pdftk

```

On CentOS, Fedora, Red Hat:

First, Install EPEL repository:
```
$ sudo yum install epel-release

```

Or
```
$ sudo dnf install epel-release

```

Then install PDFtk application using command:
```
$ sudo yum install pdftk

```

Or
```
$ sudo dnf install pdftk

```

Once pdftk installed, you can remove the password from a pdf document using command:
```
$ pdftk secure.pdf input_pw 123456 output output.pdf

```

Replace ‘123456’ with your correct password. This command decrypts the “secure.pdf” file and create an equivalent non-password protected file named “output.pdf”.

**Also read:**

**Method 3 – Using Poppler**

**Poppler** is a PDF rendering library based on the xpdf-3.0 code base. It contains the following set of command line utilities for manipulating PDF documents.

  * **pdfdetach** – lists or extracts embedded files.
  * **pdffonts** – font analyzer.
  * **pdfimages** – image extractor.
  * **pdfinfo** – document information.
  * **pdfseparate** – page extraction tool.
  * **pdfsig** – verifies digital signatures.
  * **pdftocairo** – PDF to PNG/JPEG/PDF/PS/EPS/SVG converter using Cairo.
  * **pdftohtml** – PDF to HTML converter.
  * **pdftoppm** – PDF to PPM/PNG/JPEG image converter.
  * **pdftops** – PDF to PostScript (PS) converter.
  * **pdftotext** – text extraction.
  * **pdfunite** – document merging tool.



For the purpose of this guide, we only use the “pdftops” utility.

To install Poppler on Arch Linux based distributions, run:
```
$ sudo pacman -S poppler

```

On Debian, Ubuntu, Linux Mint:
```
$ sudo apt-get install poppler-utils

```

On RHEL, CentOS, Fedora:
```
$ sudo yum install poppler-utils

```

Once Poppler installed, run the following command to decrypt the password protected pdf file and create a new equivalent file named output.pdf.
```
$ pdftops -upw 123456 secure.pdf output.pdf

```

Again, replace ‘123456’ with your pdf password.

As you might noticed in all above methods, we just converted the password protected pdf file named “secure.pdf” to another equivalent pdf file named “output.pdf”. Technically speaking, we really didn’t remove the password from the source file, instead we decrypted it and saved it as another equivalent pdf file without password protection.

**Method 4 – Print to a file
**

This is the easiest method in all of the above methods. You can use your existing PDF viewer such as Atril document viewer, Evince etc., and print the password protected pdf file to another file.

Open the password protected file in your PDF viewer application. Go to **File - > Print**. And save the pdf file in any location of your choice.

![][9]

And, that’s all. Hope this was useful. Do you know/use any other methods to remove the password protection from PDF files? Let us know in the comment section below.

More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-remove-password-from-a-pdf-file-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/getting-started-pacman/
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]:http://www.ostechnix.com/wp-content/uploads/2018/04/Remove-Password-From-A-PDF-File-1.png
[4]:https://www.ostechnix.com/install-pacaur-arch-linux/
[5]:https://www.ostechnix.com/install-packer-arch-linux-2/
[6]:https://www.ostechnix.com/trizen-lightweight-aur-package-manager-arch-based-systems/
[7]:https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[8]:https://www.ostechnix.com/install-yaourt-arch-linux/

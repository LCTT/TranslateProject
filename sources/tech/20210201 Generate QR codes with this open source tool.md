[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Generate QR codes with this open source tool)
[#]: via: (https://opensource.com/article/21/2/zint-barcode-generator)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)

Generate QR codes with this open source tool
======
Zint makes it easy to generate more than 50 types of custom barcodes.
![Working from home at a laptop][1]

QR codes are an excellent way to provide information to people without the trouble and expense of printing it. Most people have smartphones that support QR code scanning, regardless of the operating system.

There are many reasons you might want to use QR codes. Maybe you're a teacher looking to challenge your students with supplemental material to enhance learning or a restaurant that needs to provide menus while complying with social-distancing guidelines. I often walk on nature trails where trees and other flora are labeled. Supplementing those small labels with QR codes is a great way to provide additional information about the park's exhibits without the expense and maintenance of signage. In these cases and others, QR codes are very useful.

In searching the internet for an easy, open source way to create QR codes, I discovered [Zint][2]. Zint is an excellent open source (GPLv3.0) solution for generating barcodes. According to the project's [GitHub repository][3], "Zint is a suite of programs to allow easy encoding of data in any of a wide range of public domain barcode standards and to allow integration of this capability into your own programs."

Zint supports more than 50 types of barcodes, including QR codes (ISO 18004), that you can easily create, then copy and paste into word processing documents, blogs, wikis, and other digital media. People can scan these QR codes with their smartphones to quickly link to information.

### Install Zint

Zint is available for Linux, macOS, and Windows.

You can install the Zint command with Apt on Ubuntu-based Linux distributions:


```
`$ sudo apt install zint`
```

I also wanted a graphical user interface (GUI), so I installed Zint-QT:


```
`$ sudo apt install zint-qt`
```

Consult the manual's [installation section][4] for macOS and Windows instructions.

### Generate QR codes with Zint

Once I installed the application, I launched it and created my first QR code, which is a link to Opensource.com.

![Generating QR code with Zint][5]

(Don Watkins, [CC BY-SA 4.0][6])

Zint's 50-plus other barcode options include postal codes for many countries, DotCode, EAN, EAN-14, and Universal Product Code (UPC). The [project documentation][2] contains a complete list of all the codes it can render.

You can copy any barcode as a BMP or SVG or save the output as an image file in any size you need for your application. This is my QR code at 77x77 pixels.

![QR code][7]

(Don Watkins, [CC BY-SA 4.0][6])

The project maintains an excellent user manual with instructions for using Zint on the [command line][8] and in the [GUI][9]. You can even try Zint [online][10]. For feature requests or bug reports, [visit the site][11] or [send an email][12].

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/zint-barcode-generator

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/wfh_work_home_laptop_work.png?itok=VFwToeMy (Working from home at a laptop)
[2]: http://www.zint.org.uk/
[3]: https://github.com/zint/zint
[4]: http://www.zint.org.uk/Manual.aspx?type=p&page=2
[5]: https://opensource.com/sites/default/files/uploads/zintqrcode_generation.png (Generating QR code with Zint)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://opensource.com/sites/default/files/uploads/zintqrcode_77px.png (QR code)
[8]: http://zint.org.uk/Manual.aspx?type=p&page=4
[9]: http://zint.org.uk/Manual.aspx?type=p&page=3
[10]: http://www.barcode-generator.org/
[11]: https://lists.sourceforge.net/lists/listinfo/zint-barcode
[12]: mailto:zint-barcode@lists.sourceforge.net

[#]: subject: "MAKE MORE with Inkscape – Ink/Stitch"
[#]: via: "https://fedoramagazine.org/make-more-with-inkscape-ink-stitch/"
[#]: author: "Sirko Kemter https://fedoramagazine.org/author/gnokii/"
[#]: collector: "lujun9972"
[#]: translator: "aREversez"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

MAKE MORE with Inkscape – Ink/Stitch
======

![MAKE more with Inkscape - Ink/Stitch][1]

Inkscape, the most used and loved tool of Fedora’s Design Team, is not just a program for doing nice vector graphics. With vector graphics (in our case SVG) a lot more can be done. Many programs can import this format. Also, Inkscape can do a lot more than just graphics. The first article of this [series][2] showed how to [produce GCode with Inkscape][3]. This article will examine another Inkscape extension – [Ink/Stitch][4]. Ink/Stitch is an extension for designing embroidery with Inkscape.

### DIY Embroidery

In the last few years the do-it-yourself or maker scene has experienced a boom. You could say it all began with the inexpensive option of [3D printing][5]; followed by also not expensive [CNC][6] machines and laser cutters/engravers. Also the prices for more _“_traditional_”_ machines such as embroidery machines have fallen during recent years. [Home embroidery machines are now available for 500 US dollars][7].

If you don’t want to or can’t buy one yourself, the nearest [MakerSpace][8] often has one. Even the prices for commercial single-head embroidery machines are down to 5,000 US dollars. They are an investment that can pay off quickly.

### Software for Embroidery Design

Some of the home machines include their own software for designing embroidery. But most, if not all, of these applications are Windows-only. Also, the most used manufacturer-independent software of this area – [Embird][9] – is only available for Windows. But you could run it in Wine.

Another solution for Linux – [Embroidermodde][10] – is not really developed anymore. And this is after having had a fundraising campaign.

Today, only one solution is left – [Ink/Stitch][4]

![The logo of the Ink/Stitch project][11]

### Open Source and Embroidery Design

Ink/Stitch started out using [libembroidery][12]. Today [pyembroidery][13] is used. The manufacturers can’t be blamed for the prices of these machines and the number of Linux users. It is hardly worthwhile to develop applications for Linux.

#### The Embroidery File Format Problem

There is a problem with the proliferation of file formats for embroidery machines; especially among manufacturers that cook their own file format for their machines. In some cases, even a single manufacturer may use several different file formats.

  * **.10o** – Toyota embroidery machines
  * **.100** – Toyota embroidery machines
  * **.CSD** – Poem, Huskygram, and Singer EU embroidery home sewing machines.
  * **.DSB** – Baruda embroidery machines
  * **.JEF** – MemoryCraft 10000 machines.
  * **.SEW** – MemoryCraft 5700, 8000, and 9000 machines.
  * **.PES** – Brother and Babylock embroidery home sewing machines.
  * **.PEC** – Brother and Babylock embroidery home sewing machines.
  * **.HUS** – Husqvarna/Viking embroidery home sewing machines.
  * **.PCS** – Pfaff embroidery home sewing machines.
  * **.VIP** – old Pfaff format also used by Husqvarna machines.
  * **.VP3** – newer Pfaff embroidery home sewing machines.
  * **.DST** – Tajima commercial embroidery sewing machines.
  * **.EXP** – Melco commercial embroidery sewing machines.
  * **.XXX** – Compucon, Singer embroidery home sewing machines.
  * **.ZSK** – ZSK machines on the american market



This is just a small selection of the file formats that are available for embroidery. You can find a more complete list [here][14]. If you are interested in [deeper knowledge about these file formats, see here for more information][15].

#### File Formats of Ink/Stitch

Ink/Stitch can currently read the following file formats: 100, 10o, BRO, DAT, DSB, DST, DSZ, EMD, EXP, EXY, FXY, GT, INB, JEF, JPX, KSM, MAX, MIT, NEW, PCD, PCM, PCQ, PCS, PEC, PES, PHB, PHC, SEW, SHV, STC, STX, TAP, TBF, U01, VP3, XXX, ZXY and also GCode as TXT file.

For the more important task of writing/saving your work, Ink/Stitch supports far fewer formats: DST, EXP, JEF, PEC, PES, U01, VP3 and of course SVG, CSV and GCode as TXT

Besides the problem of all these file formats, there are other problems that a potential stitch program has to overcome.

Working with the different kinds of stitches is one difficulty. The integration of tools for drawing and lettering is another. But why invent such a thing from scratch? Why not take an existing vector program and just add the functions for embroidery to it? That was the idea behind the [Ink/Stitch project][4] over three years ago.

### Install Ink/Stitch

Ink/Stitch is an [extension for Inkscape][16]. Inkscape’s new functionality for downloading and installing extensions is still experimental. And you will not find Ink/Stitch among the extensions that are offered there. You must [download][17] the extension manually. After it is downloaded, unzip the package into your directory for Inkscape extensions. The default location is _~/.config/Inkscape/extensions_ (or _/usr/share/inkscape/extensions_ for system-wide availability). If you have changed the defaults, you may need to check Inkscape’s settings to find the location of the extensions directory.

### Customization – Install Add-ons for Ink/Stitch

The Ink/Stitch extension provides a function called Install Add-Ons for Inkscape, which you should run first.

The execution of this function – _Extensions &gt; Ink/Stitch &gt; Thread Color Management &gt; Install thread color palettes for Inkscape_ – will take a while.

Do not become nervous as there is no progress bar or a similar thing to see.

This function will install 70 color palettes of various yarn manufacturers and a symbol library for Ink/Stitch.

![Inkscape with the swatches dialogue open, which shows the Madeira Rayon color palette][18]

If you use the download from Github version 2.0.0, the ZIP-file contains the color palette files. You only need to unpack them into the right directory (_~/.config/inkscape/palettes/_). If you need a [hoop template, you can download][19] one and save it to _~/.config/inkscape/templates_.

The next time you start Inkscape, you will find it under _File &gt; New From Template_.

### Lettering with Ink/Stitch

The way that is by far the easiest and most widely used, is to get a embroidery design using the _Lettering_ function of Ink/Stitch. It is located under _Extensions &gt; Ink/Stitch &gt; Lettering_. Lettering for embroidery is not simple. What you expect are so called satin stitched letters. For this, special font settings are needed.

![Inkscape with a “Chopin” glyph for satin stitching defined for the Lettering function][20]

You can convert paths to satin stitching. But this is more work intensive than using the Lettering function. Thanks to the work of an active community, the May 2021 release of Ink/Stitch 2.0 brought more predefined fonts for this. An English tutorial on how to create such fonts can be found [here][21].

Version 2.0 also brings functions (_Extensions &gt; Ink/Stitch &gt; Font Management_) to make managing these kinds of fonts easier. There are also functions for creating these kinds of fonts. But you will need knowledge about font design with Inkscape to do so. First, you create an an entire SVG font. It is then feed through a JSON script which converts the SVG font into the type of files that Ink/Stitch’s font management function works with.

![On the left side the Lettering dialogue and on the right the preview of this settings][22]

The function will open a dialogue window where you just have to put in your text, choose the size and font, and then it will render a preview.

### Embroider Areas/Path-Objects

The easiest thing with Ink/Stitch, is to embroider areas or paths. Just draw your path. When you use shapes then you have to convert them and then run _Extensions &gt; Ink/Stitch &gt; Fill Tools &gt; Break Apart Fill Objects…_

This breaks apart the path into its different parts. You have to use this function. The _Path &gt; Break apart_ function of Inkscape won’t work for this.

Next, you can run Ink/Stitch’s built-in simulator: _Extensions &gt; Ink/Stitch &gt; Visualise and Export &gt; Simulator/Realistic Preview_.

![The new Fedora logo as Stitch Plan Preview][23]

Be careful with the simulator. It takes a lot system resources and it will take a while to start. You may find it easier to use the function _Extensions &gt; Ink/Stitch &gt; Visualise and Export &gt; Stitch Plan Preview_. The latter renders the threading of the embroidery outside of the document.

![Nicubunu’s Fedora hat icon as embroidery. The angles for the stitches of the head part and the brim are different so that it looks more realistic. The outline is done in Satin stitching][24]

### Simple Satin and Satin Embroidery

Ink/Stitch will convert each stroke with a continuous line (no dashes) to what they call Zig-Zag or Simple Satin. Stitches are created along the path using the stroke width you have specified. This will work as long there aren’t too many curves on the path.

![Parameter setting dialogue and on the right the Fedora logo shape embroidered as Zig-Zag line][25]

This is simple. But it is by far not the best way. It is better to use the Satin Tools for this. The functions for the Satin embroidery can be found under _Extensions &gt; Satin Tools_. The most important is the conversion function which converts paths to satin strokes.

![Fedora logo shape as Satin Line embroidery][26]

You can also reverse the stitch direction using _Extensions &gt; Satin Tools &gt; Flip Satin Column Rails_. This underlines the 3D effect satin embroidery gets, especially when you make puff embroidery. For machines that have this capability, you can also set the markings for the trims of jump stitches. To visualize these trims, Ink/Stitch uses the symbols that where installed from its own symbol library.

### The Ink/Stitch Stitch Library

What is called the stitch library is simply the kind of stitches that Ink/Stitch can create. The Fill Stitch and Zig-Zag/Satin Stitch have already been introduced. But there are more.

  * **Running Stitches**: These are used for doing outline designs. The running stitch produces a series of small stitches following a line or curve. Each dashed line will be converted into a Running Stitch. The size of the dashes does not matter.



![A running stitch – each dashed line will be converted in such one][27]

  * **Bean Stitches**: These can also be used for outline designs or add details to a design. The bean stitch describes a repetition of running stitches back and forth. This results in thicker threading.



![Bean Stitches – creating a thicker line][28]

  * **Manual Stitch**: In this mode, Ink/Stitch will use each node of a path as a needle penetration point; exactly as they are placed.



![In manual mode – each node will be the needle penetration point][29]

  * **E-Stitch**: The main use for e-stitch is a simple but strong cover stitch for applique items. It is often used for baby cloths because their skin tends to be more sensitive.



![E-Stitch mostly used for applications on baby cloths, soft but strong connection][30]

### Embroidery Thread List

Some embroidery machines (especially those designed for commercial use) allow different threads to be fitted in advance according to what will be needed for the design. These machines will automatically switch to the right thread when needed. Some file formats for embroidery support this feature. But some do not. Ink/Stitch can apply custom thread lists to an embroidery design.

If you want to work on an existing design, you can import a thread list: _Extensions &gt; Ink/Stitch &gt; Import Threadlist_. Thread lists can also be exported: _Save As different file formats as *.zip_. You can also print them: _Extensions &gt; Ink/Stitch &gt; Visualise and Export &gt; Print PDF_.

### Conclusion

Writing software for embroidery design is not easy. Many functions are needed and diverse (sometimes closed-source) file formats make the task difficult. Ink/Stitch has managed to create a useful tool with many functions. It enables the user to get started with basic embroidery design. Some things could be done a little better. But it is definitely a good tool as-is and I expect that it will become better over time. Machine embroidery can be an interesting hobby and with Ink/Stitch the Fedora Linux user can begin designing breathtaking things.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/make-more-with-inkscape-ink-stitch/

作者：[Sirko Kemter][a]
选题：[lujun9972][b]
译者：[aREversez](https://github.com/aREversez)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/gnokii/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/08/drawing2-816x345.png
[2]: https://fedoramagazine.org/series/make-more/
[3]: https://fedoramagazine.org/make-more-with-inkscape-g-code-tools/
[4]: https://inkstitch.org/
[5]: https://fedoramagazine.org/3d-printing-in-fedora-from-an-idea-to-the-thing/
[6]: https://en.wikipedia.org/wiki/Numerical_control
[7]: https://www.amazon.com/-/de/dp/B07VZ2YBLL/ref=sr_1_11?__mk_de_DE=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=1MFJJWXMKQD6R&dchild=1&keywords=home+embroidery+machine&qid=1628388092&rnid=2941120011&s=arts-crafts&sprefix=home+embroider+%2Caps%2C-1&sr=1-11
[8]: https://www.fablabs.io/labs/map
[9]: https://www.embird.net/
[10]: https://embroidermodder.org/
[11]: https://fedoramagazine.org/wp-content/uploads/2021/08/inkstitch_logo.png
[12]: https://github.com/Embroidermodder/libembroidery
[13]: https://github.com/inkstitch/pyembroidery
[14]: http://www.needlework.ru/page/embroidery.htm
[15]: http://edutechwiki.unige.ch/en/Embroidery_format
[16]: https://inkscape.org/~wwderw/%E2%98%85inkstitch-embroidery-extension
[17]: https://github.com/inkstitch/inkstitch/releases/tag/v2.0.0
[18]: https://fedoramagazine.org/wp-content/uploads/2021/08/swatches-1024x556.png
[19]: https://inkstitch.org/assets/images/tutorials/templates/hoop-template.svg
[20]: https://fedoramagazine.org/wp-content/uploads/2021/08/satinfont-1024x556.png
[21]: https://inkstitch.org/tutorials/font-creation/
[22]: https://fedoramagazine.org/wp-content/uploads/2021/08/lettering-1024x523.png
[23]: https://fedoramagazine.org/wp-content/uploads/2021/08/stitch-preview-1024x556.png
[24]: https://fedoramagazine.org/wp-content/uploads/2021/08/nicu-stitch.gif
[25]: https://fedoramagazine.org/wp-content/uploads/2021/08/zigzag-1024x463.png
[26]: https://fedoramagazine.org/wp-content/uploads/2021/08/satin.png
[27]: https://fedoramagazine.org/wp-content/uploads/2021/08/running-stitch-detail.jpg
[28]: https://fedoramagazine.org/wp-content/uploads/2021/08/bean-stitch-detail.jpg
[29]: https://fedoramagazine.org/wp-content/uploads/2021/08/manual-stitch-detail.png
[30]: https://fedoramagazine.org/wp-content/uploads/2021/08/e-stitch-detail.jpg

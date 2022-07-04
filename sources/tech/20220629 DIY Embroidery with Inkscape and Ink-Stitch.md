[#]: subject: "DIY Embroidery with Inkscape and Ink/Stitch"
[#]: via: "https://fedoramagazine.org/diy-embroidery-with-inkscape-and-ink-stitch/"
[#]: author: "Benson Muite https://fedoramagazine.org/author/fed500/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

DIY Embroidery with Inkscape and Ink/Stitch
======
![][1]

Picture http://commons.wikimedia.org/wiki/User:Ryj, CC BY-SA 3.0 http://creativecommons.org/licenses/by-sa/3.0/, via Wikimedia Commons

### Introduction

Embroidered shirts are great custom gifts and can also be a great way to show your love for open source. This tutorial will demonstrate how to design your own custom embroidered polo shirt using [Inkscape][2] and [Ink/Stitch][3]. Polo shirts are often used for embroidery because they do not tear as easily as t-shirts when pierced by embroidery needles, though with care t-shirts can also be embroidered. This tutorial is a follow on article to [Make More with Inkscape and Ink/Stitch][4] and provides complete steps to create your design.

### Logo on Front of Shirt

Pictures with only a few colors work well for embroidery. Let us use a public domain black and white [SVG][5] image of [Tux][6] created by [Ryan Lerch][7] and [Garret LeSage][8].

![Black and white image of Tux][9]

Download this public domain image, [tux-bw.svg][10], to your computer, and import it into your document as an editable SVG image using File>Import...

![Image of Tux with text to be embroidered][11]

### Use a Transparent Background

It is helpful to have a checkerboard background to distinguish background and foreground colors. Click File>Document Properties… and then check the box to enable a checkerboard background.

![Dialog box to enable checkerboard document background][12]

Then close the document properties dialog box. You can now distinguish between colors used on Tux and the background color.

![Tux can be distinguished from the document background][13]

### Use a Single Color For Tux

Type s to use the Select and Transform objects tool, and click on the image of Tux to select it. Then click on Object>Fill and Stroke, in the menu. Type n to use the Edit paths by Nodes tool and click on a white portion of Tux. Within the Fill and Stroke pane change the fill to No paint to make this portion of Tux transparent.

![Tux in one color][14]

Thi leaves the black area to be embroidered.

### Enable Embroidering of Tux

Now convert the image for embroidery. Type s to use the Select and Transform objects tool and click on the image of Tux to select it again. Choose Extensions>Ink/Stitch>Fill Tools>Break Apart Fill Objects … In the resulting pop up, choose Complex, click Apply, and wait for the operation to complete.

![Dialog to Break Apart Fill Objects][15]

For further explanation of this operation, see the [Ink/Stitch documentation][16].

### Resize Document

Now resize the area to be embroidered. A good size is about 2.75 inches by 2.75 inches. Press s to use the Select and Transform objects tool, and select Tux, hold down the shift key, and also select any text area. Then choose Object>Transform …, click on Scale in the dialogue box, change the measurements to inches, check the Scale proportionally box and choose a width of 2.75 inches, and click Apply.

![Resized drawing][17]

Before saving the design, reduce the document area to just fit the image. Press s to use the Select and Transform objects tool, then select Tux.

![Objects selected to determine resize area][18]

Choose File>Document Properties… then choose Resize to content: or press Ctrl+Shift+R

![Dialog to resize page][19]

The document is resized.

![Resized document][20]

### Save Your Design

You now need to convert your file to an embroidery file. A very portable format is the [DST (Tajima Embroidery Format)][21] format, which unfortunately does not have color information, so you will need to indicate color information for the embroidery separately. First save your design as an Inkscape SVG file so that you retain a format that you can easily edit again. Choose File>Save As, then select the Inkscape SVG format and enter a name for your file, for example AnotherAwesomeFedoraLinuxUserFront.svg and save your design. Then choose File>Save As and select the DST file format and save your design. Generating this file requires calculation of stitch locations, this may take a few seconds. You can preview the DST file in Inkscape, but another very useful tool is [vpype-embroidery][22]

Install vpype-embroidery on the command line using a [Python virtual environment][23] via the following commands:

```
virtualenv test-vpype
source test-vpype/bin/activate
pip install matplotlib
pip install vpype-embroidery
pip install vpype[all]
```

Preview your DST file (in this case named AnotherAwesomeFedoraLinuxUserFront.dst which should be replaced by the filename you choose if it is different), using this command:

```
vpype eread AnotherAwesomeFedoraLinuxUserFront.dst show
```

![Image of Tux created from the DST file and shown using Vpype-embroider][24]

Check the dimensions of your design, if you need to resize it, you should resize the SVG design file before exporting it as a DST file. Resizing the DST file is not recommended since it contains stitch placement information, regenerate this placement information from the resized SVG file to obtain a high quality embroidered result.

### Text on the Back of the Shirt

Now create a message to put on the back of your polo shirt. Create a new Inkscape document using File>New. Then choose Extensions>Ink/Stitch>Lettering.Choose a font, for example Geneva Simple Sans created by [Daniel K. Schneider][25] in Geneva. If you want to resize your text, do so at this point using the scale section of the dialog box since resizing it once it is in Inkscape will distort the resulting embroidered pattern. Add your text,

```
Another Awesome 
Fedora Linux User
```

![Image showing the text, Another Awesome Fedora Linux User, in a dialog box along with the choosen embroidery font, Geneva Simple Sans][26]

A preview will appear, click on Quit

![Preview of stitches for the text, Another Awesome Fedora Linux User, created by Ink/Stitch][27]

Then click on Apply and Quit in the lettering creation dialog box. Your text should appear in your Inkscape document.

![Text to be embroidered in the top left corner of an otherwise empty Inkscape document][28]

Create a checkered background and resize the document to content by opening up the document properties dialog box File>Document Properties…

![Document properties dialog box to resize a document][29]

Your document should now be a little larger than your text.

![Document is a little larger than the text][30]

#### Clean Up Stitches

Many commercial embroidery machines support jump instructions which can save human time in finishing the embroidered garment. Examine the text preview image. A single continuous thread sews all the letters. Stitches joining the letters are typically removed. These stitches can either be cut by hand after the embroidery is done, or they can be cut by the embroidery machine if it supports jump instructions. Ink/Stitch can add these jump instructions.

Add jump instructions by selecting View>Zoom>Zoom Page to enlarge the view of the drawing. Press s to choose the Select and transform objects tool. Choose Extensions>Ink/Stitch>Commands>Attach Commands to Selected Objects. A dialog box should appear, check just the Trim thread after sewing this object option.

![Attach commands dialog][31]

Then click in the drawing area and select the first letter of the text

![Select first letter of the text][32]

Then click Apply, and some cut symbols should appear above the letter.

![Scissor symbols above first letter][33]

Repeat this process for all letters.

![Separately embroidered letters][34]

Now save your design, as before, in both SVG and DST formats. Check the likely quality of the embroidered text by previewing your DST file (in this case named AnotherAwesomeFedoraLinuxUserBack.dst – replaced this by the filename you chose), using

```
vpype eread AnotherAwesomeFedoraLinuxUserBack.dst show
```

![Illustration showing a green stitch pattern that forms the txt, Another Awesome Fedora Linux User][35]

Check the dimensions of your design, if you need to resize it, you should resize the SVG design file before exporting it as a DST file.

### Create a Mockup

To show the approximate placement of your design on the polo shirt create a mockup.  You can then send this to an embroidery company with your DST file. The Fedora Design Team has a wiki [page][36] with examples of mockups. An example mockup made using [Kolourpaint][37] is below.

![Mockup image of polo shirt with design][38]

You can also use an appropriately licensed drawing of a polo shirt, for example from [Wikimedia Commons][39].

### Example Shirt

Pictures of a finished embroidered polo shirt are below

![Embroidered black polo shirt front with white thread used to embroider Tux][40]

![Back of black polo shirt, with white embroidered text][41]

![Closeup of the front left of a person wearing a black polo shirt with Tux embroidered on it with white thread.][42]

![Back of person wearing a polo shirt with the text, Another Awesome Fedora Linux User, embroidered on the shirt][43]

### Further Information

A three color image of Tux is also [available][44], but single colors are easiest to achieve good embroidered results with. Adaptation of this shaded multiple color image is required to use it for embroidery. Additional tutorial information is available on the [Ink/Stitch website][45].

Some companies that can do embroidery given a DST file include:

* [Pappagallo Clothing Industry][46] based in Cyprus
* [Target Solutions][47] based in Ghana
* [Marvel Ark][48] based in Kenya
* [Core Digital][49] based in South Africa
* [Embroidery Your Way][50] based in the USA

Search the internet for machine embroidery services close to you or a hackerspace with an embroidery machine you can use.

This article has benefited from many helpful suggestions from Michael Njuguna of Marvel Ark and Brian Lee of Embroidery Your Way.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/diy-embroidery-with-inkscape-and-ink-stitch/

作者：[Benson Muite][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/fed500/
[b]: https://github.com/lkxed
[1]: https://fedoramagazine.org/wp-content/uploads/2022/06/DIY-Embroidery-with-Inkscape-and-InkStitch-816x345.jpg
[2]: https://inkscape.org
[3]: https://inkstitch.org/
[4]: https://fedoramagazine.org/make-more-with-inkscape-ink-stitch/
[5]: https://en.wikipedia.org/wiki/Scalable_Vector_Graphics
[6]: https://github.com/garrett/Tux/blob/main/tux-bw.svg
[7]: https://github.com/ryanlerch
[8]: https://github.com/garrett
[9]: https://fedoramagazine.org/wp-content/uploads/2022/06/tux-bw.svg
[10]: https://raw.githubusercontent.com/garrett/Tux/main/tux-bw.svg
[11]: https://fedoramagazine.org/wp-content/uploads/2022/06/TuxInDocument-1.png
[12]: https://fedoramagazine.org/wp-content/uploads/2022/06/ResizeDialog-2.png
[13]: https://fedoramagazine.org/wp-content/uploads/2022/06/TuxCheckeredBackground-1.png
[14]: https://fedoramagazine.org/wp-content/uploads/2022/06/TuxOneColor-1.png
[15]: https://fedoramagazine.org/wp-content/uploads/2022/06/BreakApartFill.png
[16]: https://inkstitch.org/docs/fill-tools/
[17]: https://fedoramagazine.org/wp-content/uploads/2022/06/ResizedDrawing-1.png
[18]: https://fedoramagazine.org/wp-content/uploads/2022/06/DetermineResizeArea-1.png
[19]: https://fedoramagazine.org/wp-content/uploads/2022/06/ResizeDialog-1.png
[20]: https://fedoramagazine.org/wp-content/uploads/2022/06/ResizedDocument-1.png
[21]: https://edutechwiki.unige.ch/en/Embroidery_format_DST
[22]: https://github.com/embroidepy/vpype-embroidery/
[23]: https://docs.python.org/3/library/venv.html
[24]: https://fedoramagazine.org/wp-content/uploads/2022/06/VpypePreviewFront.png
[25]: https://edutechwiki.unige.ch/en/InkStitch_-_Geneva-simple_typefaces
[26]: https://fedoramagazine.org/wp-content/uploads/2022/06/LetteringCreationDialog-1.png
[27]: https://fedoramagazine.org/wp-content/uploads/2022/06/LetteringPreview-1.png
[28]: https://fedoramagazine.org/wp-content/uploads/2022/06/LetteringInDocument-1.png
[29]: https://fedoramagazine.org/wp-content/uploads/2022/06/DocumentPropertiesAgain.png
[30]: https://fedoramagazine.org/wp-content/uploads/2022/06/ResizedDocumentWithText.png
[31]: https://fedoramagazine.org/wp-content/uploads/2022/06/AttachCommandsDialog.png
[32]: https://fedoramagazine.org/wp-content/uploads/2022/06/SelectFirstLetter-1.png
[33]: https://fedoramagazine.org/wp-content/uploads/2022/06/CutSymbols-1.png
[34]: https://fedoramagazine.org/wp-content/uploads/2022/06/SeparatelyEmbroideredLetters-1.png
[35]: https://fedoramagazine.org/wp-content/uploads/2022/06/VpypePreviewBack-1024x512.png
[36]: https://fedoraproject.org/wiki/Artwork/T-Shirt
[37]: http://www.kolourpaint.org/
[38]: https://fedoramagazine.org/wp-content/uploads/2022/06/ShirtMockup2.png
[39]: https://commons.wikimedia.org/wiki/File:Shirt-type_Polo.svg
[40]: https://fedoramagazine.org/wp-content/uploads/2022/06/Front-768x1024.jpg
[41]: https://fedoramagazine.org/wp-content/uploads/2022/06/Back-768x1024.jpg
[42]: https://fedoramagazine.org/wp-content/uploads/2022/06/FrontCloseupHDR-1024x859.jpg
[43]: https://fedoramagazine.org/wp-content/uploads/2022/06/BackCloseupHDR-1024x441.jpg
[44]: https://raw.githubusercontent.com/garrett/Tux/main/tux.svg
[45]: https://inkstitch.org/docs/basic-usage/
[46]: http://www.pappagallo.com.cy
[47]: https://targetsolutionsgh.business.site/
[48]: https://marvelark.co.ke/
[49]: https://coredigital.co.za/
[50]: https://embroideryyourway.com/

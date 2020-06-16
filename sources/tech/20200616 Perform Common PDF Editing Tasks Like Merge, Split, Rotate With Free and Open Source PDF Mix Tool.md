[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Perform Common PDF Editing Tasks Like Merge, Split, Rotate With Free and Open Source PDF Mix Tool)
[#]: via: (https://itsfoss.com/pdf-mix-tool/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Perform Common PDF Editing Tasks Like Merge, Split, Rotate With Free and Open Source PDF Mix Tool
======

_**Brief: PDF Mix Tool is a simple, lightweight open-source PDF editing application that lets you extract pages from PDF, merge two PDFs, delete pages from PDF files among a few other things.**_

### PDF Mix Tool: A Simple Open Source PDF Editing Tool

![][1]

There are [several PDF editors available for Linux][2]. I usually categorize them in two categories:

  * PDF editors that let you edit the content (annotate, highlight, change text, add/remove images etc)
  * PDF editors that let you modify the files by merging files, splitting files, extracting pages from files etc.



[PDF Mix Tool][3] falls in the second category. It is an open source software written in C++ and uses Qt5. It lets you merge two or more PDF files specifying a page set for each of them, rotate pages, add white pages, delete pages and extract pages from PDF files.

In this week’s open source software highlight, let’s take a look at using PDF Mix Tool.

### Using PDF Mix Tool for editing PDFs in Linux

![][4]

PDF Mix Tool does not boast a bunch of features but a handful of things that are incredibly important.

#### Merge PDF files

![][5]

You can easily merge multiple PDF files while specifying the exact pages as well. It gives you the ability to tweak the number of pages, rotation, and also the option to reverse the order of pages to merge with “**Alternate mix**“.

![][6]

You just need to click on “**Add PDF Fil**e” to add the files and then edit it with the options available (as shown in the image above) and finally generate the edited PDF.

#### Rotate pages

You can rotate pages of a PDF file while merging multiple files or when simply operating on a single PDF file.

For merging files, you can refer to the screenshots above — but when you select a single file, this is how it looks:

![][7]

You get a variety of options, but to rotate the pages, you need to select the “**Edit page layout**” option as shown in the screenshot above.

#### Add or delete pages

To add new pages from a different PDF file, it’s best to utilize the option.

But, if you want to add an empty page, you can do that when selecting a single file to process. Not just limited to the addition of empty pages — but you can delete specific pages as well. Here’s a screenshot that highlights the delete option:

![][8]

#### Extract pages from a PDF file

![][9]

In addition to all the other options, you can also extract a certain page (or all) from a given PDF file. You can then generate a new PDF file for all the extracted pages or make separate PDF files for every page you extract. It should come in handy in a lot of use-cases.

#### Other functionalities

With all the features mentioned above, you can generate an entirely new PDF of your choice, reverse the order, extract the pages, make separate PDF files, and so on.

It does not reduce size of the PDF file. You’ll have to use other tools for [compressing PDF files on Linux][10].

So, it’s a mixed bag of things when you combine and use the options available.

### Installing PDF Mix Tool on Linux

![PDF Mix Tool in Ubuntu Software Center][11]

PDF Mix Tool is available as Snap and [Flatpak packages][12]. This means _**you may find it in your distribution’s software manager**_ if it supports either of these packages.

Alternatively, if you have [Snap package support enabled][13], you can use the following command to install it:

```
sudo snap install pdfmixtool
```

If you want to [use Flatpak][14], you can use:

```
flatpak install flathub eu.scarpetta.PDFMixTool
```

In case you’re using Arch Linux, you can get it from the [community repository][15].

```
sudo pacman -S pdfmixtool
```

You can also choose to take a look at their [GitLab page][16] for its source code.

[Download Source Code for PDF Mix Tool][17]

**Wrapping Up**

It may not be the most feature-rich PDF editing tool — but considering it as a lightweight open-source tool, it is a very useful application to have installed. We have also covered a similar tool [PDF Arranger][18] in the past. You may want to take a look at that as well.

What do you think about it? Have you tried it yet? Let me know your thoughts in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/pdf-mix-tool/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/pdf-mix-tool.png?ssl=1
[2]: https://itsfoss.com/pdf-editors-linux/
[3]: https://scarpetta.eu/pdfmixtool/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/pdf-mix-tool-merge.png?ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/pdf-mix-tool-edit.png?ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/pdf-mix-tool-merge-edit.png?ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/pdf-mix-tool-layout.png?ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/pdf-mix-tool-add-delete.png?ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/pdf-mix-tool-extract.png?ssl=1
[10]: https://itsfoss.com/compress-pdf-linux/
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/pdf-mix-tool-ubuntu.png?ssl=1
[12]: https://flathub.org/apps/details/eu.scarpetta.PDFMixTool
[13]: https://itsfoss.com/install-snap-linux/
[14]: https://itsfoss.com/flatpak-guide/
[15]: https://www.archlinux.org/packages/community/x86_64/pdfmixtool/
[16]: https://gitlab.com/scarpetta/pdfmixtool
[17]: https://www.scarpetta.eu/pdfmixtool/
[18]: https://itsfoss.com/pdfarranger-app/

[#]: subject: "How ODT files are structured"
[#]: via: "https://opensource.com/article/22/8/odt-files"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How ODT files are structured
======
Because OpenDocument Format (ODF) are based on open standards, you can use other tools to examine them and even extract data from them. You just need to know where to start.

Word processing files used to be closed, proprietary formats. In some older word processors, the document file was essentially a memory dump from the word processor. While this made for faster loading of the document into the word processor, it also made the document file format an opaque mess.

Around 2005, the Organization for the Advancement of Structured Information Standards (OASIS) group defined an open format for office documents of all types, the Open Document Format for Office Applications (ODF). You may also see ODF referred to as simply "OpenDocument Format" because it is an open standard based on the [OpenOffice.org's][4] XML file specification. ODF includes several file types, including ODT for OpenDocument Text documents. There's a lot to explore in an ODT file, and it starts with a zip file.

### Zip structure

Like all ODF files, ODT is actually an XML document and other files wrapped in a zip file container. Using zip means files take less room on disk, but it also means you can use standard zip tools to examine an ODF file.

I have an article about IT leadership called "Nibbled to death by ducks" that I saved as an ODT file. Since this is an ODF file, which is a zip file container, you can use unzip from the command line to examine it:

```
$ unzip -l 'Nibbled to death by ducks.odt'
Archive: Nibbled to death by ducks.odt
Length Date Time Name
39 07-15-2022 22:18 mimetype
12713 07-15-2022 22:18 Thumbnails/thumbnail.png
915001 07-15-2022 22:18 Pictures/10000201000004500000026DBF6636B0B9352031.png
10879 07-15-2022 22:18 content.xml
20048 07-15-2022 22:18 styles.xml
9576 07-15-2022 22:18 settings.xml
757 07-15-2022 22:18 meta.xml
260 07-15-2022 22:18 manifest.rdf
0 07-15-2022 22:18 Configurations2/accelerator/
0 07-15-2022 22:18 Configurations2/toolpanel/
0 07-15-2022 22:18 Configurations2/statusbar/
0 07-15-2022 22:18 Configurations2/progressbar/
0 07-15-2022 22:18 Configurations2/toolbar/
0 07-15-2022 22:18 Configurations2/popupmenu/
0 07-15-2022 22:18 Configurations2/floater/
0 07-15-2022 22:18 Configurations2/menubar/
1192 07-15-2022 22:18 META-INF/manifest.xml
970465 17 files
```

I want to highlight a few elements of the zip file structure:

1. The `mimetype` file contains a single line that defines the ODF document. Programs that process ODT files, such as a word processor, can use this file to verify the `MIME` type of the document. For an ODT file, this should always be:

```
application/vnd.oasis.opendocument.text
```

1. The `META-INF` directory has a single `manifest.xml` file in it. This file contains all the information about where to find other components of the ODT file. Any program that reads ODT files starts with this file to locate everything else. For example, the `manifest.xml` file for my ODT document contains this line that defines where to find the main content:

```
<manifest:file-entry manifest:full-path="content.xml" manifest:media-type="text/xml"/>
```

1. The `content.xml` file contains the actual content of the document.
2. My document includes a single screenshot, which is contained in the `Pictures` directory.

### Extracting files from an ODT file

Because the ODT document is just a zip file with a specific structure to it, you can extract files from it. You can start by unzipping the entire ODT file, such as with this unzip command:

```
$ unzip -q 'Nibbled to death by ducks.odt' -d Nibbled
```

A colleague recently asked for a copy of the image that I included in my article. I was able to locate the exact location of any embedded image by looking in the `META-INF/manifest.xml` file. The `grep` command can display any lines that describe an image:

```
$ cd Nibbled
$ grep image META-INF/manifest.xml
<manifest:file-entry manifest:full-path="Thumbnails/thumbnail.png" manifest:media-type="image/png"/>
<manifest:file-entry manifest:full-path="Pictures/10000201000004500000026DBF6636B0B9352031.png" manifest:media-type=" image/png”/>
```

The image I'm looking for is saved in the `Pictures` folder. You can verify that by listing the contents of the directory:

```
$ ls -F
Configurations2/ manifest.rdf meta.xml Pictures/ styles.xml
content.xml META-INF/ mimetype settings.xml Thumbnails/
```

And here it is:

![Image of rubber ducks in two bowls][5]

Image by: (Jim Hall, CC BY-SA 40)

### OpenDocument Format

OpenDocument Format (ODF) files are an open file format that can describe word processing files (ODT), spreadsheet files (ODS), presentations (ODP), and other file types. Because ODF files are based on open standards, you can use other tools to examine them and even extract data from them. You just need to know where to start. All ODF files start with the `META-INF/manifest.xml` file, which is the "root" or "bootstrap" file for the rest of the ODF file format. Once you know where to look, you can find the rest of the content.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/8/odt-files

作者：[Jim Hall][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/coffee_tea_laptop_computer_work_desk.png
[2]: https://unsplash.com/@jonasleupe?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/tea-cup-computer?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: http://OpenOffice.org
[5]: https://opensource.com/sites/default/files/2022-07/ducks.png

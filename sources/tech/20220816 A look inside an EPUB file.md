[#]: subject: "A look inside an EPUB file"
[#]: via: "https://opensource.com/article/22/8/epub-file"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

A look inside an EPUB file
======
EPUB files are a great way to publish content using an open format.

![How to find files in Linux][1]

Image by: Lewis Cowles, CC BY-SA 4.0

eBooks provide a great way to read books, magazines, and other content on the go. Readers can enjoy eBooks to pass the time during long flights and train rides. The most popular eBook file format is the EPUB file, short for "electronic publication." EPUB files are supported across a variety of eReaders and are effectively the standard for eBook publication today.

The EPUB file format is an open standard based on XHTML for content and XML for metadata, contained in a zip file archive. And because everything is based on open standards, we can use common tools to create or examine EPUB files. Let's explore an EPUB file to learn more about it. [A guide to tips and tricks for C programming][2], published earlier this year on Opensource.com, is available in PDF or EPUB format.

Because EPUB files are XHTML content and XML metadata in a zip file, you can start with the `unzip` command to examine the EPUB from the command line:

```
$ unzip -l osdc_Jim-Hall_C-Programming-Tips.epub 
Archive: osdc_Jim-Hall_C-Programming-Tips.epub
Length Date Time Name
--------- ---------- ----- ----
20 06-23-2022 00:20 mimetype
8259 06-23-2022 00:20 OEBPS/styles/stylesheet.css
1659 06-23-2022 00:20 OEBPS/toc.xhtml
4460 06-23-2022 00:20 OEBPS/content.opf
44157 06-23-2022 00:20 OEBPS/sections/section0018.xhtml
1242 06-23-2022 00:20 OEBPS/sections/section0002.xhtml
22429 06-23-2022 00:20 OEBPS/sections/section0008.xhtml
[...]
9628 06-23-2022 00:20 OEBPS/sections/section0016.xhtml
748 06-23-2022 00:20 OEBPS/sections/section0001.xhtml
3370 06-23-2022 00:20 OEBPS/toc.ncx
8308 06-23-2022 00:21 OEBPS/images/image0011.png
6598 06-23-2022 00:21 OEBPS/images/image0009.png
[...]
14492 06-23-2022 00:21 OEBPS/images/image0005.png
239 06-23-2022 00:20 META-INF/container.xml
--------- -------
959201 41 files
```

This EPUB contains a lot of files, but much of this is content. To understand how an EPUB file is put together, follow the process flow of an eBook reader:

1. eBook readers need to verify that the EPUB file is really an EPUB file. They verify the file by examining the `mimetype` file at the root of the EPUB archive. This file contains just one line that describes the MIME type of the EPUB file:

```
application/epub+zip
```

2. To locate the content, eBook readers start with the `META-INF/container.xml` file. This is a brief XML document that indicates where to find the content. For this EPUB file, the `container.xml` file looks like this:

```
<?xml version="1.0" encoding="UTF-8"?>
  <container version="1.0" xmlns="urn:oasis:names:tc:opendocument:xmlns:container">
    <rootfiles>
      <rootfile full-path="OEBPS/content.opf" media-type="application/oebps-package+xml"/>
  </rootfiles>
</container>
```

To make the `container.xml` file easier to read, I split the single line into multiple lines and added some spacing to indent each line. XML files don't really care about extra white space like new lines and spaces, so this extra spacing doesn't affect the XML file.

3. The `container.xml` file says the root of the EPUB starts with the `content.opf` file in the OEBPS directory. The OPF extension is because EPUB is based on the Open Packaging Format, but the `content.opf` file is really just another XML file.

4. The `content.opf` file contains a complete manifest of the EPUB contents, plus an ordered table of contents, with references to find each chapter or section. The `content.opf` file for this EPUB is quite long, so I'll show just a bit of it here as an example.
The XML data is contained within a `<package>` block, which itself has a `<metadata>`block, the `<manifest>` data, and a `<spine>`block that contains the eBook's table of contents:

```
<?xml version="1.0" encoding="UTF-8"?>
<package unique-identifier="unique-identifier" version="3.0" xmlns="http://www.idpf.org/2007/opf" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:opf="http://www.idpf.org/2007/opf">
  <metadata>
    <dc:identifier id="unique-identifier">osdc002</dc:identifier>
    <dc:title>Tips and Tricks for C Programming</dc:title>
    <dc:creator>Jim Hall</dc:creator>
    <dc:language>English</dc:language>
    <meta property="dcterms:modified">2022-06-23T12:09:13Z</meta>
    <meta content="LibreOffice/7.3.0.3$Linux_X86_64 LibreOffice_project/0f246aa12d0eee4a0f7adcefbf7c878fc2238db3 (libepubgen/0.1.1)" name="generator"/>
  </metadata>
  <manifest>
    ...
    <item href="sections/section0001.xhtml" id="section0001" media-type="application/xhtml+xml"/>
    <item href="images/image0003.png" id="image0003" media-type="image/png"/>
    <item href="styles/stylesheet.css" id="stylesheet.css" media-type="text/css"/>
    <item href="toc.ncx" id="toc.ncx" media-type="application/x-dtbncx+xml"/>
    ...
  </manifest>
  <spine toc="toc.ncx">
    <itemref idref="section0001"/>
    <itemref idref="section0002"/>
    <itemref idref="section0003"/>
    ...
  </spine>
</package>
```

You can match up the data to see where to find each section. That’s how EPUB readers do it. For example, the first item in the table of contents references `section0001` which is defined in the manifest as located in the `sections/section0001.xhtml` file. The file doesn’t need to be named the same as the idref entry, but that’s how LibreOffice Writer’s automated process created the file. (You can see in the metadata that this EPUB was created with LibreOffice version 7.3.0.3 on Linux, which can export content as EPUB files.)

### The EPUB format

EPUB files are a great way to publish content using an open format. The EPUB file format is XML metadata with XHTML content, inside a zip container. While most technical writers use tools to create EPUB files, because EPUB is based on open standards means you can create your own EPUB files in some other way.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/8/epub-file

作者：[Jim Hall][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/find-file-linux-code_magnifying_glass_zero.png
[2]: https://opensource.com/downloads/guide-c-programming

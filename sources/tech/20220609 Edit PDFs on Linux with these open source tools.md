 [#]: subject: "Edit PDFs on Linux with these open source tools"
[#]: via: "https://opensource.com/article/22/6/open-source-pdf-editors-linux"
[#]: author: "Michael Korotaev https://opensource.com/users/michaelk"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Edit PDFs on Linux with these open source tools
======
Open source alternatives to Adobe Acrobat have all the necessary features for creating, editing, and annotating PDFs.

![a checklist for a team][1]

Image by: Opensource.com

Open source reading and editing tools for PDFs are often more secure and reliable alternatives to the applications residing in the first pages of "PDF editor" search results. There, you're likely to see proprietary applications with hidden limitations and tariffs, lacking sufficient information about data protection policies and hosting. You can have better.

Here are five applications that can be installed on your Linux system (and others) or hosted on a server. Each is free and open source, with all the necessary features for creating, editing, and annotating PDF files.

### LibreOffice

With the [LibreOffice][2] suite, your choice of application depends on the initial task. While LibreOffice Writer, a word processor, lets you create PDF files with export from text formats like ODF and others, Draw is better for working with existing PDF files.

Draw is meant for creating and editing graphic documents, such as brochures, magazines, and posters. The toolset is therefore mainly focused on visual objects and layouts. For PDF editing, however, LibreOffice Draw offers tools for modifying and adding content in PDFs when the file has editing attributes. You can still add new text fields on the existing content layers and annotate or finish the documents if it doesn't.

Draw and Writer are both bundled in a LibreOffice desktop suite available for installation on Linux systems, macOS, and Windows.

### ONLYOFFICE Docs

ONLYOFFICE has been improving work with PDFs for a while and introduced a brand new reader for PDFs and eBooks in version 7.1 of [ONLYOFFICE Docs][3].

The document editor allows creating PDF files from scratch using DOCX as a base for files that can then be converted to PDF or PDF/A. With built-in form-creation functionality, ONLYOFFICE Docs also makes it possible to build fillable document templates and export them as editable PDFs with fillable fields for different types of content: text, images, dates, and more.

In addition to recognizing text within PDFs to copy and extract it, ONLYOFFICE Docs can convert PDFs to DOCX, which allows you to continue using the documents in fully editable text formats. ONLYOFFICE also lets you secure the files with passwords, add watermarks, and use digital signatures available in the desktop version.

ONLYOFFICE Docs can be used as a web suite (on-premises or in the cloud) integrated into a document management system (DMS) or as a standalone desktop application. You can install the latter as a DEB or RPM file, AppImage, Flatpack, and several other formats for Linux.

### PDF Arranger

[PDF Arranger][4] is a front-end application for the PikePDF library. It doesn't edit the content of a PDF the way LibreOffice and ONLYOFFICE do, but it's great for re-ordering pages, splitting a PDF into smaller documents, merging several PDFs into one, rotating or cropping pages, and so on. Its interface is intuitive and easy to use.

PDF Arranger is available for Linux and Windows.

### Okular

[Okular][5] is a free open source viewer for documents developed by the KDE community. The app features very mature functionality and allows viewing PDFs, eBooks, images, and comics.

Okular has full or partial support for most popular PDF features and use cases, such as adding annotations and inline notes or inserting text boxes, shapes, and stamps. You can also add a digitally encrypted signature to your document so your readers can be sure of the document's source.

In addition to adding texts and images in PDFs, it's also possible to retrieve them from the document to copy and paste somewhere else. The Area Selection tool in Okular can identify the components within a selected area so you can extract them from the PDF independently of one another.

You can install Okular using your distribution's package manager or as a Flatpak.

### Xournal++

[Xournal++][6] is a handwriting journal software with annotation tools for PDF files.

Created to be notetaking software with enhanced handwriting features, it may not be the best option for working with text-based content and professional layouts. However, its ability to render graphics and support for stylus input in writing and drawing make it stand out as a niche productivity tool.

PDF annotation and sketching are made comfortable with layer management tools, customizable pen point settings, and support for stylus mappings. Xournal++ also has a text tool for adding text boxes and the ability to insert images.

Xournal++ has installation options for Linux systems (Ubuntu, Debian, Arch, SUSE), macOS, and Windows (10 and above).

### Summary

If you're looking for a free and safe alternative to proprietary PDF viewing and editing software, it is not hard to find an open source option, whether for desktop or online use. Just keep in mind that the currently available solutions have their own advantages for different use cases, and there's no single tool that is equally great at all possible tasks.

These five solutions stand out for their functionality or usefulness for niche PDF tasks. For enterprise use and collaboration, I suggest ONLYOFFICE or LibreOffice Draw. PDF Arranger is a simple, lightweight tool for working with pages when you don't need to alter text. Okular offers great viewer features for multiple file types, and Xournal++ is the best choice if you want to sketch and take notes in your PDFs.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/open-source-pdf-editors-linux

作者：[Michael Korotaev][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/michaelk
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/checklist_hands_team_collaboration.png
[2]: https://opensource.com/article/21/9/libreoffice-tips
[3]: https://opensource.com/article/20/12/onlyoffice-docs
[4]: https://flathub.org/apps/details/com.github.jeromerobert.pdfarranger
[5]: https://opensource.com/article/22/4/linux-kde-eco-certification-okular
[6]: http://xournal.sourceforge.net/

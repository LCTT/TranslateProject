[#]: subject: "LibreOffice 7.4: Top New Features and Release Details"
[#]: via: "https://www.debugpoint.com/libreoffice-7-4/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

LibreOffice 7.4: Top New Features and Release Details
======
This post contains the top new features of LibreOffice 7.4 across Writer, Calc, Impress and other core modules.

The LibreOffice team improves the famous free and open-source office product with each iteration. Perhaps the only stable and well-managed open-source project as a replacement to Microsoft Office.

The LibreOffice 7.4 version, bringing regular updates to core modules including Calc, Writer and Impress with features and enhancements. Furthermore, in this release, the compatibility with Microsoft Office improved with changes to the core filters and platform updates.

Before we round up the new features, here’s a tentative schedule for LibreOffice 7.4:

### Schedule

| Milestone | Release Date | 
| :- | :- |
| Alpha 1 | May 9, 2022 – May 15, 2022 | 
| Feature Freeze | Jun 6, 2022 – Jun 12, 2022 | 
| Beta 1 | Jun 6, 2022 – Jun 12, 2022 | 
| RC1 | Jul 4, 2022 – Jul 10, 2022 | 
| RC2 | Jul 25, 2022 – Jul 31, 2022 | 
| RC3 | Aug 8, 2022 – Aug 14, 2022 | 
| Release 7.4 | Aug 15, 2022 – Aug 21, 2022 |

### LibreOffice 7.4 Features

#### Calc

First and foremost, the most crucial change coming in 7.4 is the support of 16k columns in LibreOffice Calc. It was available in earlier LibreOffice 7.3 but hidden as an experimental option. Finally, it is open to support 16384 columns, i.e. up to XFD. Additional columns are going to help several high-volume data work.

![LibreOffice 7.4 Calc now supports 16k columns.][1]

Second, the Autosum button gets the following [additional functions][2] to improve productivity and save time.

* COUNTA
* PRODUCT
* STDEV
* STDEVP
* VAR
* VARP

![Additional options in Autosum button][3]

Moreover, the height of the formula bar is now part of the *.ods files. Hence, you can see the height retained after saving the file and opening it. Earlier, it was being reset to the default height. It is one of the small changes but has a more significant impact on heavy Calc users.

![Height of Calc Formula bar][4]

In addition, a new menu option `Sheet > Navigate > Go to Sheet` shows an entire new dialog which is similar to the Writer’s Go to Page.

#### Writer

Firstly, the hyphenation settings get three new options. You can now specify the size of the hyphenation zone, minimum word length and ability to stop hyphenating the last word.

![New Hyphenation settings][5]

*Image credit: LibreOffice Team*

Secondly, the menu item Tools > Update > Update now updates the preview of all OLE objects. Also, if you are importing a DOCX file in LibreOffice 7.4, the paragraph borders bring more clarity. In addition, the import also improves the Rich text and checkbox contents inside the text box for DOCX imports. Moreover, Write 7.4 now supports clearing breaks from Word files improving layout consistency.

Secondly, the menu item `Tools > Update > Update all` now updates the preview of all OLE objects.

Also, if you are importing a DOCX file in LibreOffice 7.4, the paragraph borders bring more clarity. In addition, the import also improves the Rich text and checkbox contents inside the text box for DOCX imports.

Moreover, Writer 7.4 now supports clearing breaks from Word files improving layout consistency.

#### Impress

The significant change in Impress is a new Theme tab in the Slide properties for the master slide. It contains several accent colour options which control all the sildes in your presentation. It will be a really neat feature in this version.

![New Theme option in Slide Master Properties][6]

### Common Updates (across all modules)

Firstly, the most important change as a standard feature is LibreOffice now supports WEBP images officially. You can directly export and import WebP images across Writer, Calc, Draw etc. Now you do not need additional software to convert WEBP images, especially in Linux systems.

Moreover, the support for Windows compressed enhanced meta file (EMZ/WMZ) also lands in this release.

![New WEBP Image Support][7]

Secondly, the Fille > Recent Documents can remember the state of the last opened document, whether it was read-only or editable.

The 3D shapes lighting gets some bug fixes and corrections corresponding to the ODF specifications.

### Performance Updates

A bunch of performance boosts also makes this an important release of LibreOffice. Here’s a quick recap of the performance boosts.

* [The Text Layout performance gets around a 60% boost][8]
* [Calc formula re-calculation][9]
* Improved performance of [VLOOKUP][10], COUNTIF and SUMIF
* [And CSV file import][11]

That’s not all. LibreOffice 7.4 also brings a huge set of filters (export and import) for Microsoft Office 365 file types, extended PDF export options (such as a sign) via command line, updated language support and API changes.

### Download LibreOffice 7.4

You can download the LibreOffice 7.4 installer using the respective links (language English) for a fresh installation.

* [RPM Package for Fedora and related distributions][12]
* [DEB packages for Ubuntu, Linux Mint and others][13]
* [Windows 10, 11 – 64-bit][14]
* [macOS 64 bit][15]
* [Mac OS X – ARM and Apple SIlicon, M1][16]

**Ugrade**

* Windows users can not upgrade, hence you need to uninstall first, and then reinstall.
* Linux users can find the [upgrade guide in this post][17].

If you need assistance, you can refer to our [guide here][18] to install latest version in Linux. Make sure to report any issues or bugs in the [official bug tracker.][19]

LibreOffice 7.4 is [officially released on Aug 18, 2022][20].

*[Via Release Notes][21]*

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/libreoffice-7-4/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2022/06/LibreOffice-7.4-Calc-now-supports-16k-columns.jpg
[2]: https://bugs.documentfoundation.org/show_bug.cgi?id=139602
[3]: https://www.debugpoint.com/wp-content/uploads/2022/06/Additional-formula-in-Autosum-tool.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2022/06/Height-of-Calc-Formula-bar.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2022/06/New-Hyphenation-settings.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2022/06/New-Theme-option-in-Slide-Master-Properties.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2022/06/New-WEBP-Image-Support.jpg
[8]: http://llunak.blogspot.com/2022/04/improving-text-layout-performance.html
[9]: https://bugs.documentfoundation.org/show_bug.cgi?id=119083
[10]: https://bugs.documentfoundation.org/show_bug.cgi?id=146546
[11]: https://bugs.documentfoundation.org/show_bug.cgi?id=94677
[12]: https://www.libreoffice.org/download/download/?type=rpm-x86_64&version=7.4.0&lang=en-US
[13]: https://www.libreoffice.org/download/download/?type=deb-x86_64&version=7.4.0&lang=en-US
[14]: https://www.libreoffice.org/download/download/?type=win-x86_64&version=7.4.0&lang=en-US
[15]: https://www.libreoffice.org/download/download/?type=mac-x86_64&version=7.4.0&lang=en-US
[16]: https://www.libreoffice.org/download/download/?type=mac-aarch64&version=7.4.0&lang=en-US
[17]: https://www.debugpoint.com/libreoffice-upgrade-update-latest/
[18]: https://www.debugpoint.com/2022/06/install-latest-libreoffice-ubuntu-linux/
[19]: https://bugs.documentfoundation.org/
[20]: https://debugpointnews.com/libreoffice-7-4-release/
[21]: https://wiki.documentfoundation.org/ReleaseNotes/7.4

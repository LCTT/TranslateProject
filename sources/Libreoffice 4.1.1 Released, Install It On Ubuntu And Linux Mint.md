Libreoffice 4.1.1 Released, Install It On Ubuntu And Linux Mint
===============================================================

Writer, Calc, Impress, Draw, Math and Base. These are six feature-rich applications that LibreOffice suit offers to you for your document and data processing needs. What is LibreOffice? I know this question is very easy to answer for most of the unixmen readers, but since our fans keep growing everyday I guess there are many people that have no idea about Linux and Open Source, so l feel I have to give some information about LibreOffice.

LibreOffice is an open-source, simple and powerful office suite for Linux, Windows OS and Mac OS users. There are many volunteers working and helping the LibreOffice project. These volunteers have different roles, from engineering tasks to community support and creative work. Now it is time for some news.

[LibreOffice 4.1.1][1] is released. This release of LibreOffice 4.1.1 comes with a large number of improved features and bug fixes. LibreOffice 4.1.1 supports legacy binary  StarOffice files and export to legacy Word and Excel. An interesting bug fixed is fdo#67388, in which files in .deb packages weren’t owned by root:root.

**New Features and Fixes**

- Turning off ‘Same content on first page’ does not reflect in UI
- Can’t select other fill than color in Writer –> Drawing functions
- REPORTBUILDER – The labels displayed in some options lists do not match the functionality
- 4.1 segfaults when checking for extension updates
- FILESAVE: Saving to XLS format omits to save formula expressions of cells where the formula result is an error
- Style font is not stored for ODG and ODP files: after editing a style, closing and reponening, it is changed
- can’t save new autocorrect entries
- MAILMERGE: Pre-Defined Labels Contain No Format Info in LO 4.1.0.4
- EDITING: BUG: calc crashes on spell check
- soffice.bin segfault in libvclplug_gtklo.so killed by signal 11 (SIGSEGV)
- the GCJ Java variant has known issues with LibreOffice, we advise to e.g. use OpenJDK instead.
- LibreOffice 4.x drops a few long-deprecated features, including support for legacy binary StarOffice files, export to legacy Word and Excel (version 6.0/95), and legacy ODMA document management.
- Some menu entries have changed or added. If you miss something, that may be due to the use of customised menu settings from your previous LibreOffice installation.

Now what about the installation of LibreOffice 4.1.1? Ok, To Install LibreOffice in Ubuntu/Linux Mint open Terminal and copy the following commands in the Terminal:

	$ sudo add-apt-repository ppa:libreoffice/libreoffice-4-1

	$ sudo apt-get update

	$ sudo apt-get install libreoffice

via: http://www.unixmen.com/libreoffice-4-1-1-released-install-ubuntu-linux-mint/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[译者ID][] 校对：[校对者ID][]


[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linu.xnc/space/校对者ID

[1]:http://www.libreoffice.org/download/release-notes/

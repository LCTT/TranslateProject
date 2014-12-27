(translating by runningwater)
Linux FAQs with Answers--How to install 7zip on Linux
================================================================================
> **Question**: I need to extract files from an ISO image, and for that I want to use 7zip program. How can I install 7zip on [insert your Linux distro]? 

7zip is an open-source archive program originally developed for Windows, which can pack or unpack a variety of archive formats including its native format 7z as well as XZ, GZIP, TAR, ZIP and BZIP2. 7zip is also popularly used to extract RAR, DEB, RPM and ISO files. Besides simple archiving, 7zip can support AES-256 encryption as well as self-extracting and multi-volume archiving. For POSIX systems (Linux, Unix, BSD), the original 7zip program has been ported as p7zip (short for "POSIX 7zip").

Here is how to install 7zip (or p7zip) on Linux.

### Install 7zip on Debian, Ubuntu or Linux Mint ###

Debian-based distributions come with three packages related to 7zip.

- **p7zip**: contains 7zr (a minimal 7zip archive tool) which can handle its native 7z format only.
- **p7zip-full**: contains 7z which can support 7z, LZMA2, XZ, ZIP, CAB, GZIP, BZIP2, ARJ, TAR, CPIO, RPM, ISO and DEB.
- **p7zip-rar**: contains a plugin for extracting RAR files. 

It is recommended to install p7zip-full package (not p7zip) since this is the most complete 7zip package which supports many archive formats. In addition, if you want to extract RAR files, you also need to install p7zip-rar package as well. The reason for having a separate plugin package is because RAR is a proprietary format.

    $ sudo apt-get install p7zip-full p7zip-rar 

### Install 7zip on Fedora or CentOS/RHEL ###

Red Hat-based distributions offer two packages related to 7zip.

- **p7zip**: contains 7za command which can support 7z, ZIP, GZIP, CAB, ARJ, BZIP2, TAR, CPIO, RPM and DEB.
- **p7zip-plugins**: contains 7z command and additional plugins to extend 7za command (e.g., ISO extraction). 

On CentOS/RHEL, you need to enable [EPEL repository][1] before running yum command below. On Fedora, there is not need to set up additional repository.

    $ sudo yum install p7zip p7zip-plugins 

Note that unlike Debian based distributions, Red Hat based distributions do not offer a RAR plugin. Therefore you will not be able to extract RAR files using 7z command.

### Create or Extract an Archive with 7z ###

Once you installed 7zip, you can use 7z command to pack or unpack various types of archives. The 7z command uses other plugins to handle the archives.

![](https://farm8.staticflickr.com/7583/15874000610_878a85b06a_b.jpg)

To create an archive, use "a" option. Supported archive types for creation are 7z, XZ, GZIP, TAR, ZIP and BZIP2. If the specified archive file already exists, it will "add" the files to the existing archive, instead of overwriting it.

    $ 7z a <archive-filename> <list-of-files> 

To extract an archive, use "e" option. It will extract the archive in the current directory. Supported archive types for extraction are a lot more than those for creation. The list includes 7z, XZ, GZIP, TAR, ZIP, BZIP2, LZMA2, CAB, ARJ, CPIO, RPM, ISO and DEB.

    $ 7z e <archive-filename>

Another way to unpack an archive is to use "x" option. Unlike "e" option, it will extract the content with full paths.

    $ 7z x <archive-filename>

To see a list of files in an archive, use "l" option.

    $ 7z l <archive-filename>

You can update or remove file(s) in an archive with "u" and "d" options, respectively.

    $ 7z u <archive-filename> <list-of-files-to-update>
    $ 7z d <archive-filename> <list-of-files-to-delete>

To test the integrity of an archive:

    $ 7z t <archive-filename> 

--------------------------------------------------------------------------------

via:http://ask.xmodulo.com/install-7zip-linux.html 

译者：[runningwater](https://github.com/runningwater)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/how-to-set-up-epel-repository-on-centos.html
[#]: subject: "The Final Version Of 7-Zip 22.00 Is Now Available"
[#]: via: "https://www.opensourceforu.com/2022/06/the-final-version-of-7-zip-22-00-is-now-available/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

The Final Version Of 7-Zip 22.00 Is Now Available
======
![7-zip-2200-500x312][1]

7-Zip is a well-known open source file archiver for Windows, Mac, and Linux. 7-Zip 22.00 is now available; it is the first stable release of 2022. The most recent release was 7-Zip 21.07, which was released in December 2021. Users of 7-Zip can obtain the most recent version of the application from the official website. Downloads are available for Windows 64-bit, 32-bit, and ARM versions. The programme is still compatible with out-of-date versions of Windows, such as XP and Vista. All officially supported Windows versions, including server versions, are also supported. 7-Zip 22.00 for Linux is already available for download, but the Mac OS version is not.

7-Zip 22.00 includes several new features that enhance the application’s functionality. The archiver now supports the extraction of Apple File System APFS images. Several years ago, Apple introduced the Apple File System in Mac OS 10.13 and iOS. The file system has been designed with flash and solid state drive storage in mind.

7-Zip 22.00 includes several enhancements to its TAR archive support. Using the switches -ttar -mm=pax or -ttar -mm=posix, 7-Zip can now create TAR archives in POSIX tar format. Additionally, using the switches ttar -mm=pax -mtp=3 -mtc -mta, 7-Zip can store file timestamps with high precision in tar/pax archives.

* snoi: save owner/group ids in the archive or copy owner/group ids from the archive to the extracted files.
* snon: keep owner/group names in the archive

7-Zip 22.00 for Windows adds support for the -snz switch, which propagates the Zone.

To extract files, use the identifier stream. Windows uses the stream for security purposes; it can be used to determine whether a file was created locally or downloaded from the Internet.

7-Zip 22.00 includes several new features that enhance the application’s functionality. The archiver now supports the extraction of Apple File System APFS images. Several years ago, Apple introduced the Apple File System in Mac OS 10.13 and iOS. The file system has been designed with flash and solid state drive storage in mind.

7-Zip 22.00 includes several enhancements to its TAR archive support. Using the switches -ttar -mm=pax or -ttar -mm=posix, 7-Zip can now create TAR archives in POSIX tar format. Additionally, using the switches ttar -mm=pax -mtp=3 -mtc -mta, 7-Zip can store file timestamps with high precision in tar/pax archives.

Finally, Linux users can use the following two new switches with TAR archives:

* snoi: save owner/group ids in the archive or copy owner/group ids from the archive to the extracted files.
* snon: keep owner/group names in the archive

7-Zip 22.00 for Windows adds support for the -snz switch, which propagates the Zone.

To extract files, use the identifier stream. Windows uses the stream for security purposes; it can be used to determine whether a file was created locally or downloaded from the Internet.

In the “add to archive” configuration dialogue, 7-Zip 22.00 includes a new options window. It includes options for changing the timestamp precision, changing other time-related configuration options, and preventing the source files’ last access time from changing.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/06/the-final-version-of-7-zip-22-00-is-now-available/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/06/7-zip-2200-500x312-1.jpg

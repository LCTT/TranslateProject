Handy Disk Image Tools
================================================================================
Disk images are computer files of a disk volume or an entire data storage device, such as a hard drive, optical disk (e.g. DVD, CD, Blu-ray), tape drive, USB flash drive, or floppy disk. A disk image represents the content exactly as it is on the original storage device, including both data and structure information.

Disk image file formats can be open standards, such as the ISO image format for optical disk images, or proprietary to particular software applications. The name "ISO" is taken from the ISO 9660 file system used with CD-ROM media. Converting from a proprietary image format to an open format often crops up as an issue when users migrate to Linux.

Disk images have many different uses such as burning optical media, system backup, data recovery, disk cloning, computer forensics, and operating systems (as Live CD/DVDs).

There are a number of different ways of mounting an ISO image under Linux. The venerable mount command offers an easy solution. But if you need tools that offer more functionality for working with disk images, try some of the following excellent open source tools.

Most of the tools have not seen a recent release, so if you are looking to get involved with a good open source tool, you could pitch in. 

----------

![](http://www.linuxlinks.com/portal/content2/png/FuriusISOMount.png)

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-FuriusISOMountTool.png)

Furius ISO Mount is a simple open source application for mounting .iso, .img, .bin, .mdf and .nrg image files without burning them to disk.

Features include:

- Automatically mounts ISO, IMG, BIN, MDF and NRG image files
- Supports mounting UDF images through loop
- Automatically creates a mount point in your home directory
- Automatically unmounts the Image files
- Automatically removes the mount directory to return your home directory to its previous state
- Automatically saves the history of the last 10 images mounted
- Mounts multiple images
- Burn ISO and IMG Files to optical disk
- Generate MD5 and SHA1 checksums
- Automatically retrieves any previously unmounted images
- Automatically generates a log file of all commands needed to mount and unmount images manually
- Language support (currently Bulgarian, Chinese (Simplified), Czech, Dutch, French, German, Hungarian, Italian, Greek, Italian, Japanese, Polish, Portuguese, Russian, Slovenian, Spanish, Swedish and Turkish)

- Website: [launchpad.net/furiusisomount/][1]
- Developer: Dean Harris (Marcus Furius)
- License: GNU GPL v3
- Version Number: 0.11.3.1


----------

![](http://www.linuxlinks.com/portal/content2/png/fuseiso.png)

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-fuseiso.png)

fuseiso is an open source FUSE module to mount ISO filesystem images.

With FUSE it is possible to implement a fully functional filesystem in a userspace program.

Features include:

- Read ISO, BIN and NRG images containing ISO9660 filesystems
- Supports plain ISO9660 Level 1 and 2
- Supports some common extensions, like Joliet, RockRidge and zisofs
- Supports non-standard images, like CloneCD's IMGs and Alcohol 120%'s MDFs, as their format looks exactly like BIN images

- Website: [sourceforge.net/projects/fuseiso][2]
- Developer: Dmitry Morozhnikov
- License: GNU GPL v2
- Version Number: 20070708

----------

![](http://www.linuxlinks.com/portal/content2/png/iat.png)

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-iat.png)

iat (Iso9660 Analyzer Tool) is a versatile, open source tool for detecting the structure of many types of image file formats, such as BIN, MDF, PDI, CDI, NRG, and B5I, and converting them into ISO-9660.

Features include:

- Supports reading (input) NRG, MDF, PDI, CDI, BIN, CUE and B5I images
- Burn disc images directly using cdrecord
- Outputs information including a progress-bar, Block size, ECC sector (size), header sector (size), image offset start and more

- Website: [sourceforge.net/projects/iat.berlios][3]
- Developer: Salvatore Santagati
- License: GNU GPL v2
- Version Number: 0.1.3

----------

![](http://www.linuxlinks.com/portal/content2/png/AcetoneISO.png)

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-AcetoneISO.png)

AcetoneISO is a feature-rich open source graphical application to mount and manage CD/DVD images.

The utility opens a graphical file manager to mount image formats, including proprietary image formats, including ISO, BIN, NRG, MDF, IMG etc, and lets you perform a number of actions.

AcetoneISO is written with Qt 4, which means that it integrates well in Qt-based desktop environments like KDE, LXQt or Razor-qt.

This software is meant for all those people looking for a "Daemon Tools for Linux".

Features include:

- Mount most common Windows images in a clean and easy GUI
- Convert all known images to ISO or extract the contents to a folder
- Encrypt, compress, split any type of image
- Convert DVD video to xvid avi and any generic video to xvid avi
- Extract audio from a video
- Extract images content to a folder: bin mdf nrg img daa dmg cdi b5i bwi pdi
- Play a DVD Movie Image with Kaffeine / VLC / SMplayer with auto-cover download from Amazon
- Generate an ISO from a Folder or CD/DVD
- Check MD5 file of an image and/or generate it to a text file
- Calculate ShaSums of images in 128, 256, and 384 bit
- Encrypt / Decrypt an image
- Split / Merge image in X megabyte
- Compress with high ratio an image in 7z format
- Rip a PSX CD to *.bin to make it work with ePSXe/pSX emulators
- Restore a lost CUE file of *.bin *.img
- Convert Mac OS *.dmg to a mountable image
- Mount an image in a specified folder from the user
- Create a database of images to manage big collections
- Extract the Boot Image file of a CD/DVD or ISO
- Backup a CD-Audio to a *.bin image
- Quick and simple utility to rip a DVD to Xvid AVI
- Quick and simple utility to convert a generic video (avi, mpeg, mov, wmv, asf) to Xvid AVI
- Quick and simple utility to convert a FLV video to AVI
- Utility to download videos from YouTube and Metacafe
- Extract audio from a video file
- Extract a *.rar archive that has a password
- Utility to convert any video for Sony PSP PlayStation Portable
- Internationalization support English, Italian, Polish, Spanish, Romanian, Hungarian, German, Czech, and Russian

- Website: [sourceforge.net/projects/acetoneiso][4]
- Developer: Marco Di Antonio
- License: GNU GPL v3
- Version Number: 2.3

----------

![](http://www.linuxlinks.com/portal/content2/png/ISOMaster.png)

![](http://www.linuxlinks.com/portal/content/reviews/Utilities/Screenshot-ISOMaster.png)

ISO Master is an open-source, easy to use, graphical CD image editor for Linux and BSD. This tool extracts files from an ISO, add files to an ISO, and create bootable ISOs - all in a graphical user interface. It can open ISO, NRG, and some MDF files but can only save as ISO.

ISO Master is based on bkisofs, a simple and stable library for reading, modifying and writing ISO images which supports the Joliet, RockRidge, and EL Torito extensions.

Features include:

- Reads .ISO files (ISO9660, Joliet, RockRidge, and El Torito), most .NRG files, and some single-track .MDF files; it can save only as .ISO
- Create or customise CD/DVD images
- Add or remove files and directories to/from a CD image
- Make bootable CDs/DVDs
- Internationalization support

- Website: [www.littlesvr.ca/isomaster/][5]
- Developer: Andrew Smith
- License: GNU GPL v2
- Version Number: 1.3.11

--------------------------------------------------------------------------------

via: http://www.linuxlinks.com/article/20141025082352476/DiskImageTools.html

作者：Frazer Kline
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://launchpad.net/furiusisomount/
[2]:http://sourceforge.net/projects/fuseiso/
[3]:http://sourceforge.net/projects/iat.berlios/
[4]:http://sourceforge.net/projects/acetoneiso/
[5]:http://www.littlesvr.ca/isomaster/
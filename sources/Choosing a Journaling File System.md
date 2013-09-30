Choosing a Journaling File System
================================================================================
In layman's terms, a computer file system is how a storage device such as a disk drive is able to store, retrieve, and manage files. File systems need to keep track of not only the bits that make up the file itself and where they are placed on the storage device, but also store information about the file. The file system also has to store the name of each file, how to organise files in a hierarchy, and keep metadata such as the file's modification date.

Even though there are many different file systems available for Linux, most users pay little attention to which file system to use. They are often a forgotten friend. The choice of what file system to use depends on the situation; relevant factors to consider include compatibility, performance, resilience, the media being used, the size and number of the storage medium, features, and security considerations.

A journaling file system is a special type of file system that maintains a tracking file, called a journal. The journal enables the system to repair any inconsistencies that may arise as a result of a system halted abnormally. It does this by keeping track of changes that are made before committing them to the main file system. In the event that the computer is not shut down properly, any data loss can be recreated. This type of file system is therefore less likely to suffer from corruption, and brings file systems back online quickly.

To provide an insight into the quality of journaling file systems that are available, we have compiled a list of our top picks.

Now, let's explore the journaling file systems at hand. For each title we have compiled its own portal page, providing a full description with an in-depth analysis of its features, together with links to relevant resources and reviews.

- [ext3][1] 	Default file system for many popular Linux distributions
- [XFS][2] 	Designed to maintain high performance with large files and file systems
- [Btrfs][3] 	Checksumming Copy on Write File system
- [ext4][4] 	Evolved from ext3 adding many notable features including extents

--------------------------------------------------------------------------------
via: http://www.linuxlinks.com/article/20130927180305497/JournalingFileSystems.html

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[译者ID][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID

[1]:ftp://ftp.kernel.org/pub/linux/kernel/people/sct/ext3/
[2]:http://oss.sgi.com/projects/xfs/
[3]:http://btrfs.wiki.kernel.org/
[4]:https://ext4.wiki.kernel.org/index.php/Main_Page
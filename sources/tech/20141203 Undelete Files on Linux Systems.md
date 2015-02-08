Translating by FSSlc

Undelete Files on Linux Systems
================================================================================
Often times, a computer user will delete a needed file accidentally and not have an easy way to regain or recreate the file. Thankfully, files can be undeleted. When a user deletes a file, it is not gone, only hidden for some time. Here is how it all works. On a filesystem, the system has what is called a file allocation list. This list keeps track of what files are where on the storage unit (hard-drive, MicroSD card, flash-drive, etc.). When a file is deleted, the filesystem will perform one of two tasks on the allocation table. The file's entry on the file allocation table marked as "free space" or the file's entry on the list is erased and then the space is marked as free. Now, if a file needs to be placed on the storage unit, the operating system will put the file in the space marked as empty. After the new file is written to the "empty space", the deleted file is now gone forever. When a deleted file is to be recovered, the user must not manipulate any files because if the "empty space" is used, then the file can never be retrieved.

### How do undelete programs work? ###

The majority of filesystems only mark the space as empty. With these filesystems, the undelete program looks at the file allocation list and copies the deleted file to another storage unit. If the files were copied to the same storage unit, then the user could lose other deleted files that are needed.

Rarely do filesystems erase the allocation table entry. If a filesystem does, this is how an undelete program undeletes the file. The program searches the storage unit for file headers. All files have a specific string of code that is at the very beginning of the file. This is called a magic number. For example, the magic number of a compiled JAVA class is the hex number "CAFEBABE". So, an undelete program would find "CAFEBABE" and copy that file to another storage unit. Some undelete programs can look for a specific file type. The user may want a PDF, so the program searches for the hex magic number "25504446" which is the ASCII code for "%PDF". Other undelete programs search for all magic numbers. Then, the user can select which deleted files to recover.

If a part of the file has been written over, then the whole file will be corrupted. The file can usually be recovered, but the contents will be useless. For instance, recovering a corrupted JPEG file will be pointless because the image viewer will not be able to generate an image from the file. So, the user has the file, but the file is useless.

### Device Locations: ###

Before we continue, here is some information that will aid in directing the undelete utilities to the correct storage unit. All devices are in the /dev/ folder. The name of each device (not the name that the admin gave each partition or device) that is given by the system follows a predictable scheme. The second partition on the first SATA hard-drive would be sda2. The first letter indicates the storage type, in this case SATA, but an "s" could also mean SCSI, FireWire, or USB. The second letter "d" means disk. The third letter indicates the device number, so an "a" would be the first SATA and a "b" would be the second. The number displays the partition. To name the whole device with all partitions type the letters without the number. For this example that would be sda. Other possible letters "h" as the first letter. This means PATA hard-drive (IDE). As some examples of this scheme, a user has a computer with one SATA hard-drive (sda). The drive has four partitions - sda1, sda2, sda3, and sda4. The user deletes the third one, but sda4 remains sda4 until sda4 is reformatted. The user then plugs in a usb memory card (sdb) with one partition - sdb1. The user then adds a IDE hard-drive with one partition - hda1. Next, the user adds a SCSI hard-drive - sdc1. Then, the user removes the USB memory card (sdb). Now, the SCSI remains sdc, but if the SCSI is removed and added back, it will be sdb. Even though other storage device existed, the IDE drive will have the "a" because it is the first IDE drive. IDE devices are numbered separately from SCSI, SATA, FireWire, and USB devices.

### Recovery: ###

Each undelete program has different abilities, features, and support for various filesystems. Below are some instructions for using TestDisk to recover files on a set of filesystems.

**FAT16, FAT32, exFAT (FAT64), NTFS, and ext2/3/4:**

TestDisk is an open-source, free program that works on Linux, *BSD, SunOS, Mac OS X, DOS, and Windows. TestDisk can be found here: [http://www.cgsecurity.org/wiki/TestDisk][1]. TestDisk can also be installed by typing "sudo apt-get install testdisk". TestDisk has many abilities, but this article is concerned with undeleting files.

Open TestDisk in a terminal using root privileges by typing “sudo testdisk”.

Now, the TestDisk command-line application will execute. The terminal appearance will change. TestDisk asks the user if it can keep logs. This is entirely up to the user. If the user is recovering files from the system storage, then do not keep a log. The choices are "Create", "Append", and "No Log". If the user wants a log, it is kept in that user's home folder.

![](http://www.linux.org/attachments/screen1-jpg.342/)

In the following screen, the storage devices are listed using the /dev/* method. For my system, the system's storage unit is /dev/sda. This means that my storage unit is a SATA hard-drive (sd) and it is the first hard-drive (a). The size of each storage unit is displayed in Gigabytes. Use the up and down arrows to select a storage device and hit enter.

![](http://www.linux.org/attachments/screen2-jpg.343/)

The next screen displays a list of partition table (also called partition map) types. Just as there is the file allocation table for files, there is a table for the partitions. Partitions are dividers on a storage device. For instance, on almost all Linux systems there is at least two partitions - EXT3/4 and Swap. Each partition table will be briefly described. TestDisk does not support all partition tables, so this is not a complete list.

![](http://www.linux.org/attachments/screen3-jpg.344/)

- **Intel** - This partition table is very common on Windows systems and many Linux systems. This table is also know as MBR.
- **EFI GPT** - This is usually used with Linux systems. This partition map is most recommended for Linux because the concept of logical/extended partitions does not apply to GPT (GUID Partition Table) tables. This means that a Linux user can multiboot many forms of Linux with one Linux OS on each partition. There are other advantages to using GPT, but that is beyond this article.
- **Humax** - Humax maps are used with device made by the South Korean company Humax.
- **Mac** - The Apple Partition Map (APM) is used by Apple devices.
- **None** - Some devices do not have a partition table. For instance, many Subor game consoles do not use a partition map. If a user tried to undelete a file on these devices thinking that the partition map was one of the other choices, the user will be confused by the fact that TestDisk does not find any filesystem or files.
- **Sun** - The Sun partition table is used by Sun systems.
- **Xbox** - The Xbox uses the Xbox partition map for its storage devices.

If a user selects "Xbox" even though their system uses GPT, TestDisk will not be able to find a partition or filesystem. If it does, then it will guess incorrectly. (The image below displays the output when the incorrect partition type)

![](http://www.linux.org/attachments/xbox-jpg.350/)

Once the user picks the correct choice for their device, on the next screen, select "Advanced".

![](http://www.linux.org/attachments/screen4-jpg.345/)

Now, the user should see a list of all of their filesystems/partitions on the storage unit. If the user had chosen the wrong partition map, then here is where they will know if they made the incorrect selection. If there are no errors, highlight the partition that contains the deleted file by placing the text-based cursor on it. Use the left and right arrows to highlight "List" on the bottom of the terminal. Now, hit enter.

![](http://www.linux.org/attachments/screen5-jpg.346/)

A new screen is displayed with a list of files and folders. The whitish files are current files that are not deleted. The red files have been deleted. On the far right column is the files' names. The next column over to the left is the creation date of the file. One column over to the left again is the files' sizes in bytes. To the far left is a column with dashes, "d"s, "r"s, "w"s, and "x"s. These are the file permissions. A "d" indicates that the item is a directory. The rest of the permission syntax is irrelevant to this article. The item on the top of the file list titled "." means the current directory. The second object titled ".." means go up one directory, so a user can move up a directory by selecting this line. For an example, I will go into the directory "Xaiml_Dataset". The folder is nearly full of deleted files. I will undelete "computers.xaiml" by pressing "c" on the keyboard. I am now asked to select a destination directory. Of course, I will put it on another partition. I am in my home folder, and I press "c". It does not matter what folder is highlighted. The current folder is the destination directory. Now, I am back to the list of files. At the top of the screen is a message that says "Copy Done!". In my home folder is a folder called "Xaiml_Dataset", and inside is the Xaiml file. If I press "c" on more deleted files, they will be placed in the new folder without a****g me for a destination.

![](http://www.linux.org/attachments/screen6-jpg.347/)

![](http://www.linux.org/attachments/screen7-jpg.348/)

![](http://www.linux.org/attachments/screen8-jpg.349/)

When finished press "q" repeatedly until the normal terminal is seen. The folder "Xaiml_Dataset" can only be accessed by the root. To fix this, use root privileges to change the folder permissions and the contained files. After that, the files have been recovered and accessible to the user.

### ReiserFS: ###

To undelete a file from a ReiserFS filesystem, make a backup of all of the files on the partition because this method can cause the file to be lost if something goes wrong. Next, execute the following command where DEVICE is the device in the form sda2. Some files will be put in the lost+found directory and other will remain where they were before deletion.

    reiserfsck --rebuild-tree --scan-whole-partition /dev/DEVICE

### Recover Deleted File that is Open in a Program: ###

Assume a user accidentally deletes a file that a program has open. The file of the hard-drive was deleted, but the program is using a copy of the file that is on the RAM. Thankfully, there are two easy solutions.

If the program has save capabilities like a text editor, the user can resave the file. Thus, the file editor will write the file to the hard-drive.

Assume that this is an MP3 file in a music player. The music player cannot save the MP3 file. This task requires a little more time than the previous situation. Unfortunately, this method does not work on all systems and applications. To begin, type the following command.

    lsof -c smplayer | grep mp3

This command LiSts all of the Open Files used by Smplayer. This list is piped (given) to grep which searches for mp3. The output looks like the following.

    smplayer  10037 collier  mp3    169r      8,1  676376  1704294 /usr/bin/smplayer

Now, type the following command to recover the file directly from the RAM (on Linux systems, /proc/ is the RAM) and copy it to a folder of choice. The "cp" is the copy command. The 10037 number comes from the process number given in the output. The 169 is the file descriptor shown in the output. The "~/Music/" is the destination directory. Lastly, "music.mp3" is the file name that the user wants for the file.

    cp /proc/10037/fd/169 ~/Music/music.mp3

### Real Deletion: ###

To make for sure that a file can never be recovered, use a command that "wipes" the hard-drive. Wiping the hard-drive means writing meaningless data to the disk. For example, many wiping programs write zeros, random letters, or random data to the hard-drive. No space is taken up or lost. The wiping program just overwrites the "empty space". If the storage unit is ever full of files with no free space remaining, then all of the previously deleted files will be gone.

The purpose of wiping hard-drives is to make sure that private data is never seen. For illustration, a company may order new computers. The manager decides to sell the old computers. However, there is concern that the new owners may view company secrets or customer information like credit card numbers and addresses. Thankfully, a computer technician in the company can wipe the hard-drives before selling the old computers.

To install secure-delete, a wiping program, type "sudo apt-get install secure-delete". This installs a set of four commands that make sure that deleted files are never recovered.

- srm - permanently delete a file. Usage: srm -f ./secret_file.txt
- sfill - wipe the free space. Usage: sfill -f /mount/point/of/partition
- sswap - wipe swap space. Usage: sswap -f /dev/SWAP_DEVICE

If computers were to truly delete a file selected for deletion, then more time would be required to perform the task. It is quick and easy to mark some space as free, but to make the file gone forever requires time. Wiping a storage unit, for instance, takes a few hours to complete (depending on storage size). Overall, the current system works well because even when a user empties the recycle bin, they still have another chance to change their mind. 

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/undelete-files-on-linux-systems.4316/

作者：[DevynCJohnson][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linux.org/members/devyncjohnson.4843/
[1]:http://www.cgsecurity.org/wiki/TestDisk

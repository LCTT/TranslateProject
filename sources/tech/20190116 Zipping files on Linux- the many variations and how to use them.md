[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Zipping files on Linux: the many variations and how to use them)
[#]: via: (https://www.networkworld.com/article/3333640/linux/zipping-files-on-linux-the-many-variations-and-how-to-use-them.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Zipping files on Linux: the many variations and how to use them
======
![](https://images.idgesg.net/images/article/2019/01/zipper-100785364-large.jpg)

Some of us have been zipping files on Unix and Linux systems for many decades — to save some disk space and package files together for archiving. Even so, there are some interesting variations on zipping that not all of us have tried. So, in this post, we’re going to look at standard zipping and unzipping as well as some other interesting zipping options.

### The basic zip command

First, let’s look at the basic **zip** command. It uses what is essentially the same compression algorithm as **gzip** , but there are a couple important differences. For one thing, the gzip command is used only for compressing a single file where zip can both compress files and join them together into an archive. For another, the gzip command zips “in place”. In other words, it leaves a compressed file — not the original file alongside the compressed copy. Here's an example of gzip at work:

```
$ gzip onefile
$ ls -l
-rw-rw-r-- 1 shs shs 10514 Jan 15 13:13 onefile.gz
```

And here's zip. Notice how this command requires that a name be provided for the zipped archive where gzip simply uses the original file name and adds the .gz extension.

```
$ zip twofiles.zip file*
 adding: file1 (deflated 82%)
 adding: file2 (deflated 82%)
$ ls -l
-rw-rw-r-- 1 shs shs 58021 Jan 15 13:25 file1
-rw-rw-r-- 1 shs shs 58933 Jan 15 13:34 file2
-rw-rw-r-- 1 shs shs 21289 Jan 15 13:35 twofiles.zip
```

Notice also that the original files are still sitting there.

The amount of disk space that is saved (i.e., the degree of compression obtained) will depend on the content of each file. The variation in the example below is considerable.

```
$ zip mybin.zip ~/bin/*
 adding: bin/1 (deflated 26%)
 adding: bin/append (deflated 64%)
 adding: bin/BoD_meeting (deflated 18%)
 adding: bin/cpuhog1 (deflated 14%)
 adding: bin/cpuhog2 (stored 0%)
 adding: bin/ff (deflated 32%)
 adding: bin/file.0 (deflated 1%)
 adding: bin/loop (deflated 14%)
 adding: bin/notes (deflated 23%)
 adding: bin/patterns (stored 0%)
 adding: bin/runme (stored 0%)
 adding: bin/tryme (deflated 13%)
 adding: bin/tt (deflated 6%)
```

### The unzip command

The **unzip** command will recover the contents from a zip file and, as you'd likely suspect, leave the zip file intact, whereas a similar gunzip command would leave only the uncompressed file.

```
$ unzip twofiles.zip
Archive: twofiles.zip
 inflating: file1
 inflating: file2
$ ls -l
-rw-rw-r-- 1 shs shs 58021 Jan 15 13:25 file1
-rw-rw-r-- 1 shs shs 58933 Jan 15 13:34 file2
-rw-rw-r-- 1 shs shs 21289 Jan 15 13:35 twofiles.zip
```

### The zipcloak command

The **zipcloak** command encrypts a zip file, prompting you to enter a password twice (to help ensure you don't "fat finger" it) and leaves the file in place. You can expect the file size to vary a little from the original.

```
$ zipcloak twofiles.zip
Enter password:
Verify password:
encrypting: file1
encrypting: file2
$ ls -l
total 204
-rw-rw-r-- 1 shs shs 58021 Jan 15 13:25 file1
-rw-rw-r-- 1 shs shs 58933 Jan 15 13:34 file2
-rw-rw-r-- 1 shs shs 21313 Jan 15 13:46 twofiles.zip <== slightly larger than
 unencrypted version
```

Keep in mind that the original files are still sitting there unencrypted.

### The zipdetails command

The **zipdetails** command is going to show you details — a _lot_ of details about a zipped file, likely a lot more than you care to absorb. Even though we're looking at an encrypted file, zipdetails does display the file names along with file modification dates, user and group information, file length data, etc. Keep in mind that this is all "metadata." We don't see the contents of the files.

```
$ zipdetails twofiles.zip

0000 LOCAL HEADER #1 04034B50
0004 Extract Zip Spec 14 '2.0'
0005 Extract OS 00 'MS-DOS'
0006 General Purpose Flag 0001
 [Bit 0] 1 'Encryption'
 [Bits 1-2] 1 'Maximum Compression'
0008 Compression Method 0008 'Deflated'
000A Last Mod Time 4E2F6B24 'Tue Jan 15 13:25:08 2019'
000E CRC F1B115BD
0012 Compressed Length 00002904
0016 Uncompressed Length 0000E2A5
001A Filename Length 0005
001C Extra Length 001C
001E Filename 'file1'
0023 Extra ID #0001 5455 'UT: Extended Timestamp'
0025 Length 0009
0027 Flags '03 mod access'
0028 Mod Time 5C3E2584 'Tue Jan 15 13:25:08 2019'
002C Access Time 5C3E27BB 'Tue Jan 15 13:34:35 2019'
0030 Extra ID #0002 7875 'ux: Unix Extra Type 3'
0032 Length 000B
0034 Version 01
0035 UID Size 04
0036 UID 000003E8
003A GID Size 04
003B GID 000003E8
003F PAYLOAD

2943 LOCAL HEADER #2 04034B50
2947 Extract Zip Spec 14 '2.0'
2948 Extract OS 00 'MS-DOS'
2949 General Purpose Flag 0001
 [Bit 0] 1 'Encryption'
 [Bits 1-2] 1 'Maximum Compression'
294B Compression Method 0008 'Deflated'
294D Last Mod Time 4E2F6C56 'Tue Jan 15 13:34:44 2019'
2951 CRC EC214569
2955 Compressed Length 00002913
2959 Uncompressed Length 0000E635
295D Filename Length 0005
295F Extra Length 001C
2961 Filename 'file2'
2966 Extra ID #0001 5455 'UT: Extended Timestamp'
2968 Length 0009
296A Flags '03 mod access'
296B Mod Time 5C3E27C4 'Tue Jan 15 13:34:44 2019'
296F Access Time 5C3E27BD 'Tue Jan 15 13:34:37 2019'
2973 Extra ID #0002 7875 'ux: Unix Extra Type 3'
2975 Length 000B
2977 Version 01
2978 UID Size 04
2979 UID 000003E8
297D GID Size 04
297E GID 000003E8
2982 PAYLOAD

5295 CENTRAL HEADER #1 02014B50
5299 Created Zip Spec 1E '3.0'
529A Created OS 03 'Unix'
529B Extract Zip Spec 14 '2.0'
529C Extract OS 00 'MS-DOS'
529D General Purpose Flag 0001
 [Bit 0] 1 'Encryption'
 [Bits 1-2] 1 'Maximum Compression'
529F Compression Method 0008 'Deflated'
52A1 Last Mod Time 4E2F6B24 'Tue Jan 15 13:25:08 2019'
52A5 CRC F1B115BD
52A9 Compressed Length 00002904
52AD Uncompressed Length 0000E2A5
52B1 Filename Length 0005
52B3 Extra Length 0018
52B5 Comment Length 0000
52B7 Disk Start 0000
52B9 Int File Attributes 0001
 [Bit 0] 1 Text Data
52BB Ext File Attributes 81B40000
52BF Local Header Offset 00000000
52C3 Filename 'file1'
52C8 Extra ID #0001 5455 'UT: Extended Timestamp'
52CA Length 0005
52CC Flags '03 mod access'
52CD Mod Time 5C3E2584 'Tue Jan 15 13:25:08 2019'
52D1 Extra ID #0002 7875 'ux: Unix Extra Type 3'
52D3 Length 000B
52D5 Version 01
52D6 UID Size 04
52D7 UID 000003E8
52DB GID Size 04
52DC GID 000003E8

52E0 CENTRAL HEADER #2 02014B50
52E4 Created Zip Spec 1E '3.0'
52E5 Created OS 03 'Unix'
52E6 Extract Zip Spec 14 '2.0'
52E7 Extract OS 00 'MS-DOS'
52E8 General Purpose Flag 0001
 [Bit 0] 1 'Encryption'
 [Bits 1-2] 1 'Maximum Compression'
52EA Compression Method 0008 'Deflated'
52EC Last Mod Time 4E2F6C56 'Tue Jan 15 13:34:44 2019'
52F0 CRC EC214569
52F4 Compressed Length 00002913
52F8 Uncompressed Length 0000E635
52FC Filename Length 0005
52FE Extra Length 0018
5300 Comment Length 0000
5302 Disk Start 0000
5304 Int File Attributes 0001
 [Bit 0] 1 Text Data
5306 Ext File Attributes 81B40000
530A Local Header Offset 00002943
530E Filename 'file2'
5313 Extra ID #0001 5455 'UT: Extended Timestamp'
5315 Length 0005
5317 Flags '03 mod access'
5318 Mod Time 5C3E27C4 'Tue Jan 15 13:34:44 2019'
531C Extra ID #0002 7875 'ux: Unix Extra Type 3'
531E Length 000B
5320 Version 01
5321 UID Size 04
5322 UID 000003E8
5326 GID Size 04
5327 GID 000003E8

532B END CENTRAL HEADER 06054B50
532F Number of this disk 0000
5331 Central Dir Disk no 0000
5333 Entries in this disk 0002
5335 Total Entries 0002
5337 Size of Central Dir 00000096
533B Offset to Central Dir 00005295
533F Comment Length 0000
Done
```

### The zipgrep command

The **zipgrep** command is going to use a grep-type feature to locate particular content in your zipped files. If the file is encrypted, you will need to enter the password provided for the encryption for each file you want to examine. If you only want to check the contents of a single file from the archive, add its name to the end of the zipgrep command as shown below.

```
$ zipgrep hazard twofiles.zip file1
[twofiles.zip] file1 password:
Certain pesticides should be banned since they are hazardous to the environment.
```

### The zipinfo command

The **zipinfo** command provides information on the contents of a zipped file whether encrypted or not. This includes the file names, sizes, dates and permissions.

```
$ zipinfo twofiles.zip
Archive: twofiles.zip
Zip file size: 21313 bytes, number of entries: 2
-rw-rw-r-- 3.0 unx 58021 Tx defN 19-Jan-15 13:25 file1
-rw-rw-r-- 3.0 unx 58933 Tx defN 19-Jan-15 13:34 file2
2 files, 116954 bytes uncompressed, 20991 bytes compressed: 82.1%
```

### The zipnote command

The **zipnote** command can be used to extract comments from zip archives or add them. To display comments, just preface the name of the archive with the command. If no comments have been added previously, you will see something like this:

```
$ zipnote twofiles.zip
@ file1
@ (comment above this line)
@ file2
@ (comment above this line)
@ (zip file comment below this line)
```

If you want to add comments, write the output from the zipnote command to a file:

```
$ zipnote twofiles.zip > comments
```

Next, edit the file you've just created, inserting your comments above the **(comment above this line)** lines. Then add the comments using a zipnote command like this one:

```
$ zipnote -w twofiles.zip < comments
```

### The zipsplit command

The **zipsplit** command can be used to break a zip archive into multiple zip archives when the original file is too large — maybe because you're trying to add one of the files to a small thumb drive. The easiest way to do this seems to be to specify the max size for each of the zipped file portions. This size must be large enough to accomodate the largest included file.

```
$ zipsplit -n 12000 twofiles.zip
2 zip files will be made (100% efficiency)
creating: twofile1.zip
creating: twofile2.zip
$ ls twofile*.zip
-rw-rw-r-- 1 shs shs 10697 Jan 15 14:52 twofile1.zip
-rw-rw-r-- 1 shs shs 10702 Jan 15 14:52 twofile2.zip
-rw-rw-r-- 1 shs shs 21377 Jan 15 14:27 twofiles.zip
```

Notice how the extracted files are sequentially named "twofile1" and "twofile2".

### Wrap-up

The **zip** command, along with some of its zipping compatriots, provide a lot of control over how you generate and work with compressed file archives.

**[ Also see:[Invaluable tips and tricks for troubleshooting Linux][1] ]**

Join the Network World communities on [Facebook][2] and [LinkedIn][3] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3333640/linux/zipping-files-on-linux-the-many-variations-and-how-to-use-them.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3242170/linux/invaluable-tips-and-tricks-for-troubleshooting-linux.html
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world

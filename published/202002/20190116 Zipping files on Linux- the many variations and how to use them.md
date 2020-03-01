[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11913-1.html)
[#]: subject: (Zipping files on Linux: the many variations and how to use them)
[#]: via: (https://www.networkworld.com/article/3333640/linux/zipping-files-on-linux-the-many-variations-and-how-to-use-them.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

在 Linux 上压缩文件：zip 命令的各种变体及用法
======

> 除了压缩和解压缩文件外，你还可以使用 zip 命令执行许多有趣的操作。这是一些其他的 zip 选项以及它们如何提供帮助。

![](https://img.linux.net.cn/data/attachment/album/202002/21/120507ox11ak23f9x2hxaq.jpg)

为了节省一些磁盘空间并将文件打包在一起进行归档，我们中的一些人已经在 Unix 和 Linux 系统上压缩文件数十年了。即使这样，并不是所有人都尝试过一些有趣的压缩工具的变体。因此，在本文中，我们将介绍标准的压缩和解压缩以及其他一些有趣的压缩选项。

### 基本的 zip 命令

首先，让我们看一下基本的 `zip` 命令。它使用了与 `gzip` 基本上相同的压缩算法，但是有一些重要的区别。一方面，`gzip` 命令仅用于压缩单个文件，而 `zip` 既可以压缩文件，也可以将多个文件结合在一起成为归档文件。另外，`gzip` 命令是“就地”压缩。换句话说，它会只留下一个压缩文件，而原始文件则没有了。 这是工作中的 `gzip` 示例：

```
$ gzip onefile
$ ls -l
-rw-rw-r-- 1 shs shs 10514 Jan 15 13:13 onefile.gz
```

而下面是 `zip`。请注意，此命令要求为压缩存档提供名称，其中 `gzip`（执行压缩操作后）仅使用原始文件名并添加 `.gz` 扩展名。

```
$ zip twofiles.zip file*
 adding: file1 (deflated 82%)
 adding: file2 (deflated 82%)
$ ls -l
-rw-rw-r-- 1 shs shs 58021 Jan 15 13:25 file1
-rw-rw-r-- 1 shs shs 58933 Jan 15 13:34 file2
-rw-rw-r-- 1 shs shs 21289 Jan 15 13:35 twofiles.zip
```

请注意，原始文件仍位于原处。

所节省的磁盘空间量（即获得的压缩程度）将取决于每个文件的内容。以下示例中的变化很大。

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

### unzip 命令

`unzip` 命令将从一个 zip 文件中恢复内容，并且，如你所料，原来的 zip 文件还保留在那里，而类似的 `gunzip` 命令将仅保留未压缩的文件。

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

### zipcloak 命令

`zipcloak` 命令对一个 zip 文件进行加密，提示你输入两次密码（以确保你不会“胖手指”），然后将该文件原位存储。你可以想到，文件大小与原始文件会有所不同。

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

请记住，压缩包之外的原始文件仍处于未加密状态。

### zipdetails 命令

`zipdetails` 命令将向你显示详细信息：有关压缩文件的详细信息，可能比你想象的要多得多。即使我们正在查看一个加密的文件，`zipdetails` 也会显示文件名以及文件修改日期、用户和组信息、文件长度数据等。请记住，这都是“元数据”。我们看不到文件的内容。

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

### zipgrep命令

`zipgrep` 命令将使用 `grep` 类的功能来找到压缩文件中的特定内容。如果文件已加密，则需要为要检查的每个文件输入为加密所提供的密码。如果只想检查归档文件中单个文件的内容，请将其名称添加到 `zipgrep` 命令的末尾，如下所示。

```
$ zipgrep hazard twofiles.zip file1
[twofiles.zip] file1 password:
Certain pesticides should be banned since they are hazardous to the environment.
```

### zipinfo 命令

`zipinfo` 命令提供有关压缩文件内容的信息，无论是否加密。这包括文件名、大小、日期和权限。

```
$ zipinfo twofiles.zip
Archive: twofiles.zip
Zip file size: 21313 bytes, number of entries: 2
-rw-rw-r-- 3.0 unx 58021 Tx defN 19-Jan-15 13:25 file1
-rw-rw-r-- 3.0 unx 58933 Tx defN 19-Jan-15 13:34 file2
2 files, 116954 bytes uncompressed, 20991 bytes compressed: 82.1%
```

### zipnote 命令

`zipnote` 命令可用于从 zip 归档中提取注释或添加注释。要显示注释，只需在命令前面加上归档名称即可。如果之前未添加任何注释，你将看到类似以下内容：

```
$ zipnote twofiles.zip
@ file1
@ (comment above this line)
@ file2
@ (comment above this line)
@ (zip file comment below this line)
```

如果要添加注释，请先将 `zipnote` 命令的输出写入到文件：

```
$ zipnote twofiles.zip > comments
```

接下来，编辑你刚刚创建的文件，将注释插入到 `(comment above this line)` 行上方。然后使用像这样的 `zipnote` 命令添加注释：

```
$ zipnote -w twofiles.zip < comments
```

### zipsplit 命令

当归档文件太大时，可以使用 `zipsplit` 命令将一个 zip 归档文件分解为多个 zip 归档文件，这样你就可以将其中某一个文件放到小型 U 盘中。最简单的方法似乎是为每个部分的压缩文件指定最大大小，此大小必须足够大以容纳最大的所包含的文件。

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

请注意，提取的文件是如何依次命名为 `twofile1` 和 `twofile2` 的。

### 总结

`zip` 命令及其一些压缩工具变体，对如何生成和使用压缩文件归档提供了很多控制。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3333640/linux/zipping-files-on-linux-the-many-variations-and-how-to-use-them.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3242170/linux/invaluable-tips-and-tricks-for-troubleshooting-linux.html
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world

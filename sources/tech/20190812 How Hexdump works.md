[#]: collector: (lujun9972)
[#]: translator: (0x996)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How Hexdump works)
[#]: via: (https://opensource.com/article/19/8/dig-binary-files-hexdump)
[#]: author: (Seth Kenlon https://opensource.com/users/sethhttps://opensource.com/users/shishz)

How Hexdump works
======
Hexdump helps you investigate the contents of binary files. Learn how
hexdump works.
![Magnifying glass on code][1]

Hexdump is a utility that displays the contents of binary files in hexadecimal, decimal, octal, or ASCII. It’s a utility for inspection and can be used for [data recovery][2], reverse engineering, and programming.

### Learning the basics

Hexdump provides output with very little effort on your part and depending on the size of the file you’re looking at, there can be a lot of output. For the purpose of this article, create a 1x1 PNG file. You can do this with a graphics application such as [GIMP][3] or [Mtpaint][4], or you can create it in a terminal with [ImageMagick][5].

Here’s a command to generate a 1x1 pixel PNG with ImageMagick:


```
$ convert -size 1x1 canvas:black pixel.png
```

You can confirm that this file is a PNG with the **file** command:


```
$ file pixel.png
pixel.png: PNG image data, 1 x 1, 1-bit grayscale, non-interlaced
```

You may wonder how the **file** command is able to determine what kind of file it is. Coincidentally, that’s what **hexdump** will reveal. For now, you can view your one-pixel graphic in the image viewer of your choice (it looks like this: **.** ), or you can view what’s inside the file with **hexdump**:


```
$ hexdump pixel.png
0000000 5089 474e 0a0d 0a1a 0000 0d00 4849 5244
0000010 0000 0100 0000 0100 0001 0000 3700 f96e
0000020 0024 0000 6704 4d41 0041 b100 0b8f 61fc
0000030 0005 0000 6320 5248 004d 7a00 0026 8000
0000040 0084 fa00 0000 8000 00e8 7500 0030 ea00
0000050 0060 3a00 0098 1700 9c70 51ba 003c 0000
0000060 6202 474b 0044 dd01 138a 00a4 0000 7407
0000070 4d49 0745 07e3 081a 3539 a487 46b0 0000
0000080 0a00 4449 5441 d708 6063 0000 0200 0100
0000090 21e2 33bc 0000 2500 4574 7458 6164 6574
00000a0 633a 6572 7461 0065 3032 3931 302d 2d37
00000b0 3532 3254 3a30 3735 353a 2b33 3231 303a
00000c0 ac30 5dcd 00c1 0000 7425 5845 6474 7461
00000d0 3a65 6f6d 6964 7966 3200 3130 2d39 3730
00000e0 322d 5435 3032 353a 3a37 3335 312b 3a32
00000f0 3030 90dd 7de5 0000 0000 4549 444e 42ae
0000100 8260
0000102
```

What you’re seeing is the contents of the sample PNG file through a lens you may have never used before. It’s the exact same data you see in an image viewer, encoded in a way that’s probably unfamiliar to you.

### Extracting familiar strings

Just because the default data dump seems meaningless, that doesn’t mean it’s devoid of valuable information. You can translate this output or at least the parts that actually translate, to a more familiar character set with the **\--canonical** option:


```
$ hexdump --canonical foo.png
00000000  89 50 4e 47 0d 0a 1a 0a  00 00 00 0d 49 48 44 52  |.PNG........IHDR|
00000010  00 00 00 01 00 00 00 01  01 00 00 00 00 37 6e f9  |.............7n.|
00000020  24 00 00 00 04 67 41 4d  41 00 00 b1 8f 0b fc 61  |$....gAMA......a|
00000030  05 00 00 00 20 63 48 52  4d 00 00 7a 26 00 00 80  |.... cHRM..z&amp;...|
00000040  84 00 00 fa 00 00 00 80  e8 00 00 75 30 00 00 ea  |...........u0...|
00000050  60 00 00 3a 98 00 00 17  70 9c ba 51 3c 00 00 00  |`..:....p..Q&lt;...|
00000060  02 62 4b 47 44 00 01 dd  8a 13 a4 00 00 00 07 74  |.bKGD..........t|
00000070  49 4d 45 07 e3 07 1a 08  39 35 87 a4 b0 46 00 00  |IME.....95...F..|
00000080  00 0a 49 44 41 54 08 d7  63 60 00 00 00 02 00 01  |..IDAT..c`......|
00000090  e2 21 bc 33 00 00 00 25  74 45 58 74 64 61 74 65  |.!.3...%tEXtdate|
000000a0  3a 63 72 65 61 74 65 00  32 30 31 39 2d 30 37 2d  |:create.2019-07-|
000000b0  32 35 54 32 30 3a 35 37  3a 35 33 2b 31 32 3a 30  |25T20:57:53+12:0|
000000c0  30 ac cd 5d c1 00 00 00  25 74 45 58 74 64 61 74  |0..]....%tEXtdat|
000000d0  65 3a 6d 6f 64 69 66 79  00 32 30 31 39 2d 30 37  |e:modify.2019-07|
000000e0  2d 32 35 54 32 30 3a 35  37 3a 35 33 2b 31 32 3a  |-25T20:57:53+12:|
000000f0  30 30 dd 90 e5 7d 00 00  00 00 49 45 4e 44 ae 42  |00...}....IEND.B|
00000100  60 82                                             |`.|
00000102
```

In the right column, you see the same data that’s on the left but presented as ASCII. If you look carefully, you can pick out some useful information, such as the file’s format (PNG) and—toward the bottom—the date and time the file was created and last modified. The dots represent symbols that aren’t present in the ASCII character set, which is to be expected because binary formats aren’t restricted to mundane letters and numbers.

The **file** command knows from the first 8 bytes what this file is. The [libpng specification][6] alerts programmers what to look for. You can see that within the first 8 bytes of this image file, specifically, is the string **PNG**. That fact is significant because it reveals how the **file** command knows what kind of file to report.

You can also control how many bytes **hexdump** displays, which is useful with files larger than one pixel:


```
$ hexdump --length 8 pixel.png
0000000 5089 474e 0a0d 0a1a
0000008
```

You don’t have to limit **hexdump** to PNG or graphic files. You can run **hexdump** against binaries you run on a daily basis as well, such as [ls][7], [rsync][8], or any binary format you want to inspect.

### Implementing cat with hexdump

If you read the PNG spec, you may notice that the data in the first 8 bytes looks different than what **hexdump** provides. Actually, it’s the same data, but it’s presented using a different conversion. So, the output of **hexdump** is true, but not always directly useful to you, depending on what you’re looking for. For that reason, **hexdump** has options to format and convert the raw data it dumps.

The conversion options can get complex, so it’s useful to practice with something trivial first. Here’s a gentle introduction to formatting **hexdump** output by reimplementing the [**cat**][9] command. First, run **hexdump** on a text file to see its raw data. You can usually find a copy of the [GNU General Public License (GPL)][10] license somewhere on your hard drive, or you can use any text file you have handy. Your output may differ, but here’s how to find a copy of the GPL on your system (or at least part of it):


```
$ find /usr/share/doc/ -type f -name "COPYING" | tail -1
/usr/share/doc/libblkid-devel/COPYING
```

Run **hexdump** against it:


```
$ hexdump /usr/share/doc/libblkid-devel/COPYING
0000000 6854 7369 6c20 6269 6172 7972 6920 2073
0000010 7266 6565 7320 666f 7774 7261 3b65 7920
0000020 756f 6320 6e61 7220 6465 7369 7274 6269
0000030 7475 2065 7469 6120 646e 6f2f 0a72 6f6d
0000040 6964 7966 6920 2074 6e75 6564 2072 6874
0000050 2065 6574 6d72 2073 666f 7420 6568 4720
0000060 554e 4c20 7365 6573 2072 6547 656e 6172
0000070 206c 7550 6c62 6369 4c0a 6369 6e65 6573
0000080 6120 2073 7570 6c62 7369 6568 2064 7962
[...]
```

If the file’s output is very long, use the **\--length** (or **-n** for short) to make it manageable for yourself.

The raw data probably means nothing to you, but you already know how to convert it to ASCII:


```
hexdump --canonical /usr/share/doc/libblkid-devel/COPYING
00000000  54 68 69 73 20 6c 69 62  72 61 72 79 20 69 73 20  |This library is |
00000010  66 72 65 65 20 73 6f 66  74 77 61 72 65 3b 20 79  |free software; y|
00000020  6f 75 20 63 61 6e 20 72  65 64 69 73 74 72 69 62  |ou can redistrib|
00000030  75 74 65 20 69 74 20 61  6e 64 2f 6f 72 0a 6d 6f  |ute it and/or.mo|
00000040  64 69 66 79 20 69 74 20  75 6e 64 65 72 20 74 68  |dify it under th|
00000050  65 20 74 65 72 6d 73 20  6f 66 20 74 68 65 20 47  |e terms of the G|
00000060  4e 55 20 4c 65 73 73 65  72 20 47 65 6e 65 72 61  |NU Lesser Genera|
00000070  6c 20 50 75 62 6c 69 63  0a 4c 69 63 65 6e 73 65  |l Public.License|
[...]
```

That output is helpful but unwieldy and difficult to read. To format **hexdump**’s output beyond what’s offered by its own options, use **\--format** (or **-e**) along with specialized formatting codes. The shorthand used for formatting is similar to what the **printf** command uses, so if you are familiar with **printf** statements, you may find **hexdump** formatting easier to learn.

In **hexdump**, the character sequence **%_p** tells **hexdump** to print a character in your system’s default character set. All formatting notation for the **\--format** option must be enclosed in _single quotes_:


```
$ hexdump -e'"%_p"' /usr/share/doc/libblkid-devel/COPYING
This library is fre*
 software; you can redistribute it and/or.modify it under the terms of the GNU Les*
er General Public.License as published by the Fre*
 Software Foundation; either.version 2.1 of the License, or (at your option) any later.version..*
The complete text of the license is available in the..*
/Documentation/licenses/COPYING.LGPL-2.1-or-later file..
```

This output is better, but still inconvenient to read. Traditionally, UNIX text files assume an 80-character output width (because long ago, monitors tended to fit only 80 characters across).

While this output isn’t bound by formatting, you can force **hexdump** to process 80 bytes at a time with additional options. Specifically, by dividing 80 by one, you can tell **hexdump** to treat 80 bytes as one unit:


```
$ hexdump -e'80/1 "%_p"' /usr/share/doc/libblkid-devel/COPYING
This library is free software; you can redistribute it and/or.modify it under the terms of the GNU Lesser General Public.License as published by the Free Software Foundation; either.version 2.1 of the License, or (at your option) any later.version...The complete text of the license is available in the.../Documentation/licenses/COPYING.LGPL-2.1-or-later file..
```

Now the file is processed in 80-byte chunks, but it’s lost any sense of new lines. You can add your own with the **\n** character, which in UNIX represents a new line:


```
$ hexdump -e'80/1 "%_p""\n"'
This library is free software; you can redistribute it and/or.modify it under th
e terms of the GNU Lesser General Public.License as published by the Free Softwa
re Foundation; either.version 2.1 of the License, or (at your option) any later.
version...The complete text of the license is available in the.../Documentation/
licenses/COPYING.LGPL-2.1-or-later file..
```

You have now (approximately) implemented the **cat** command with **hexdump** formatting.

### Controlling the output

Formatting is, realistically, how you make **hexdump** useful. Now that you’re familiar, in principle at least, with **hexdump** formatting, you can make the output of **hexdump -n 8** match the output of the PNG header as described by the official **libpng** spec.

First, you know that you want **hexdump** to process the PNG file in 8-byte chunks. Furthermore, you may know by integer recognition that the PNG spec is documented in decimal, which is represented by **%d** according to the **hexdump** documentation:


```
$ hexdump -n8 -e'8/1 "%d""\n"' pixel.png
13780787113102610
```

You can make the output perfect by adding a blank space after each integer:


```
$ hexdump -n8 -e'8/1 "%d ""\n"' pixel.png
137 80 78 71 13 10 26 10
```

The output is now a perfect match to the PNG specification.

### Hexdumping for fun and profit

Hexdump is a fascinating tool that not only teaches you more about how computers process and convert information, but also about how file formats and compiled binaries function. You should try running **hexdump** on files at random throughout the day as you work. You never know what kinds of information you may find, nor when having that insight may be useful.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/dig-binary-files-hexdump

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sethhttps://opensource.com/users/shishz
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/find-file-linux-code_magnifying_glass_zero.png?itok=E2HoPDg0 (Magnifying glass on code)
[2]: https://www.redhat.com/sysadmin/find-lost-files-scalpel
[3]: http://gimp.org
[4]: https://opensource.com/article/17/2/mtpaint-pixel-art-animated-gifs
[5]: https://opensource.com/article/17/8/imagemagick
[6]: http://www.libpng.org/pub/png/spec/1.2/PNG-Structure.html
[7]: https://opensource.com/article/19/7/master-ls-command
[8]: https://opensource.com/article/19/5/advanced-rsync
[9]: https://opensource.com/article/19/2/getting-started-cat-command
[10]: https://en.wikipedia.org/wiki/GNU_General_Public_License

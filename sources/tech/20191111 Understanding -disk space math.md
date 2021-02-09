[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Understanding “disk space math”)
[#]: via: (https://fedoramagazine.org/understanding-disk-space-math/)
[#]: author: (Pat Kelly https://fedoramagazine.org/author/tablepc/)

Understanding “disk space math”
======

![][1]

Everything in a PC, laptop, or server is represented as binary digits (a.k.a. _bits,_ where each bit can only be 1 or 0). There are no characters like we use for writing or numbers as we write them anywhere in a computer’s memory or secondary storage such as disk drives. For general purposes, the unit of measure for groups of binary bits is the byte — eight bits. Bytes are an agreed-upon measure that helped standardize computer memory, storage, and how computers handled data.

There are various terms in use to specify the capacity of a disk drive (either magnetic or electronic). The same measures are applied to a computers random access memory (RAM) and other memory devices that inhabit your computer. So now let’s see how the numbers are made up.

Suffixes are used with the number that specifies the capacity of the device. The suffixes designate a multiplier that is to be applied to the number that preceded the suffix. Commonly used suffixes are:

  * Kilo = 103 = 1,000 (one thousand)
  * Mega = 106 = 1,000,000 (one million)
  * Giga = 109 = 1000,000,000 (one billion)
  * Tera = 1012 = 1,000,000,000,000 (one trillion)



As an example 500 GB (gigabytes) is 500,000,000,000 bytes.

The units that memory and storage are specified in  advertisements, on boxes in the store, and so on are in the decimal system as shown above. However since computers only use binary bits, the actual capacity of these devices is different than the advertised capacity.

You saw that the decimal numbers above were shown with their equivalent powers of ten. In the binary system numbers can be represented as powers of two. The table below shows how bits are used to represent powers of two in an 8 bit Byte. At the bottom of the table there is an example of how the decimal number 109 can be represented as a binary number that can be held in a single byte of 8 bits (01101101).

Eight bit binary number |  |  |  |  |  |  |  |
---|---|---|---|---|---|---|---|---
| Bit 7 | Bit 6 | Bit 5 | Bit 4 | Bit 3 | Bit 2 | Bit 1 | Bit 0
Power of 2 | 27 | 26 | 25 | 24 | 23 | 22 | 21 | 20
Decimal Value | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1
Example Number | 0 | 1 | 1 | 0 | 1 | 1 | 0 | 1

The example bit values comprise the binary number 01101101. To get the equivalent decimal value just add the decimal values from the table where the bit is set to 1. That is 64 + 32 + 8 + 4 + 1 = 109.

By the time you get out to 230 you have decimal 1,073,741,824 with just 31 bits (don’t forget the 20) You’ve got a large enough number to start specifying memory and storage sizes.

Now comes what you have been waiting for. The table below lists common designations as they are used for labeling decimal and binary values.

Decimal

|

Binary

---|---

KB (Kilobyte)

1KB = 1,000 bytes

|

KiB (Kibibyte)

1KiB = 1,024 bytes

MB (Megabyte)

1MB = 1,000,000 bytes

|

MiB (Mebibyte)

1MiB = 1,048,576 bytes

GB (Gigabyte)

1GB = 1,000,000,000 bytes

|

GiB (Gibibyte)

1 GiB (Gibibyte) = 1,073,741,824 bytes

TB (Terabyte)

1TB = 1,000,000,000,000

|

TiB (Tebibyte)

1TiB = 1,099,511,627,776 bytes

Note that all of the quantities of bytes in the table above are expressed as decimal numbers. They are not shown as binary numbers because those numbers would be more than 30 characters long.

Most users and programmers need not be concerned with the small differences between the binary and decimal storage size numbers. If you’re developing software or hardware that deals with data at the binary level you may need the binary numbers.

As for what this means to your PC: Your PC will make use of the full capacity of your storage and memory devices. If you want to see the capacity of your disk drives, thumb drives, etc, the Disks utility in Fedora will show you the actual capacity of the storage device in number of bytes as a decimal number.

There are also command line tools that can provide you with more flexibility in seeing how your storage bytes are being used. Two such command line tools are [_du_][2] (for files and directories) and [_df_][3] (for file systems). You can read about these by typing _man du_ or _man df_ at the command line in a terminal window.

* * *

*Photo by _[_Franck V._][4]_ on *[_Unsplash_][5].

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/understanding-disk-space-math/

作者：[Pat Kelly][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/tablepc/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/11/disk-space-math-816x345.jpg
[2]: https://linux.die.net/man/1/du
[3]: https://linux.die.net/man/1/df
[4]: https://unsplash.com/@franckinjapan?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[5]: https://unsplash.com/s/photos/math?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText

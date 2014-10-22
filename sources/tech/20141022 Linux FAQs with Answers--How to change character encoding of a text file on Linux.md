Linux FAQs with Answers--How to change character encoding of a text file on Linux
================================================================================
> **Question**: I have an "iso-8859-1"-encoded subtitle file which shows broken characters on my Linux system, and I would like to change its text encoding to "utf-8" character set. In Linux, what is a good tool to convert character encoding in a text file? 

As you already know, computers can only handle binary numbers at the lowest level - not characters. When a text file is saved, each character in that file is mapped to bits, and it is those "bits" that are actually stored on disk. When an application later opens that text file, each of those binary numbers are read and mapped back to the original characters that are understood by us human. This "save and open" process is best performed when all applications that need access to a text file "understand" its encoding, meaning the way binary numbers are mapped to characters, and thus can ensure a "round trip" of understandable data.

If different applications do not use the same encoding while dealing with a text file, non-readable characters will be shown wherever special characters are found in the original file. By special characters we mean those that are not part of the English alphabet, such as accented characters (e.g., ñ, á, ü).

The questions then become: 1) how can I know which character encoding a certain text file is using?, and 2) how can I convert it to some other encoding of my choosing?

### Step One ###

In order to find out the character encoding of a file, we will use a commad-line tool called file. Since the file command is a standard UNIX program, we can expect to find it in all modern Linux distros.

Run the following command:

    $ file --mime-encoding filename 

![](https://farm6.staticflickr.com/5602/15595534261_1a7b4d16a2.jpg)

### Step Two ###

The next step is to check what kinds of text encodings are supported on your Linux system. For this, we will use a tool called iconv with the "-l" flag (lowercase L), which will list all the currently supported encodings.

    $ iconv -l 

The iconv utility is part of the the GNU libc libraries, so it is available in all Linux distributions out-of-the-box.

### Step Three ###

Once we have selected a target encoding among those supported on our Linux system, let's run the following command to perform the conversion:

    $ iconv -f old_encoding -t new_encoding filename

For example, to convert iso-8859-1 to utf-8:

    $ iconv -f iso-8859-1 -t utf-8 input.txt 

![](https://farm4.staticflickr.com/3943/14978042143_a516e0b10b_o.png)

Knowing how to use these tools together as we have demonstrated, you can for example fix a broken subtitle file:

![](https://farm6.staticflickr.com/5612/15412197967_0dfe5078f9_z.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/change-character-encoding-text-file-linux.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
[#]: subject: "Use this nifty Unix tool to process text on Linux"
[#]: via: "https://opensource.com/article/22/7/process-text-linux-pr"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Use this nifty Unix tool to process text on Linux
======
The pr tool prepares text documents for printing.

![5 trends in open source documentation][1]

Image by: Internet Archive Book Images. Modified by Opensource.com. CC BY-SA 4.0

Unix has always excelled at processing text, and Linux is no different. And the tools to work with and transform text files still exist on all Linux systems.

Like other computer systems, early Unix printed on paper, using a typewriter-style printing device. These printers provided limited formatting options, but with clever application of Unix tools, you could prepare professional-looking documents.

One such tool was the `pr` tool, to prepare text documents for printing. Let's explore how to use standard Unix tools, such as the `pr` processor and the `fmt` text formatter, to prepare text files for printing on a typewriter-style printer.

### Printing a plain text file

Let's say we wanted to print the MIT license, stored in a file called mit.txt. This file is already formatted for optimal screen display; lines are almost 80 columns wide, which fits well on a standard terminal.

```
$ cat mit.txt 
Copyright (c) <year> <copyright holders>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

![Image of standard 80 column terminal][3]

Image by: (Jim Hall, CC BY-SA 40)

Printer paper is also 80 columns wide, at least on the classic printers. So we can also print the file to our printer using a command like `lpr`. But that's not a very interesting way to print the file, and it won't be very nice to read. For example, the document will start on the first line of the printed page, and immediately on the left edge of the paper.

We can make the document easier to read by using the `pr` command to add a top margin. By default, `pr` includes the date and time, the name of the file, and the page number in the top header. For example, the top of our file might look like this:

```
$ pr mit.txt | head


2022-06-24 18:27                     mit.txt                      Page 1


Copyright (c) <year> <copyright holders>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
```

In this example, I've used the `head` command to look at just the first ten lines of the `pr` output. The `pr` command also adds extra blank lines at the bottom of the page, to provide a bottom margin. The old-style typewriter printers used 66 lines per page, so the `pr` output assumes that too. But this file prints on one page, so I don't need to show the bottom of the file; it's just some blank lines.

### Adding a left and right margin

Adding the top margin makes the document easier to read, but we can do better by adding space on the left and right of the printed page. This effectively adds a left and right margin to our document.

The first step is to use the `fmt` command to reformat the text file to a different width. Using `fmt -w 70` reformats the text file to use lines that are 70 columns wide. We can add some blank space on the left of the document to create a left margin. Using `pr -o 5` adds 5 spaces to the start of each line of the output. With the narrower text, we'll also have about 5 spaces in the right margin.

```
$ fmt -w 70 mit.txt | pr -o 5 | head
     

     2022-06-24 18:35                                                  Page 1


     Copyright (c) <year> <copyright holders>
     
     Permission is hereby granted, free of charge, to any person obtaining
     a copy of this software and associated documentation files (the
     "Software"), to deal in the Software without restriction, including
```

This is how Unix users printed plain text files. You can use the same set of commands to print text files on a modern laser printer, but your printer may *expect a page feed* command instead of using blank lines. To do that, add the `-f` option to the `pr` command, like this:

```
$ fmt -w 70 mit.txt | pr -f -o 5 | lpr
```

I'll omit the `-f` in the rest of this article, but remember to add `-f` to the `pr` command if you want to print documents to a modern laser printer.

### Changing the header

You may notice that when we redirect the output of `fmt` to the `pr` command, the `pr` output no longer shows the name of the file. That's because when we chain several commands together like this, the `pr` command doesn't know the filename, so it's left blank. We can add the filename to the header by using the `-h` option:

```
$ fmt -w 70 mit.txt | pr -h 'mit.txt' -o 5 | head
     

     2022-06-24 18:45                     mit.txt                      Page 1


     Copyright (c) <year> <copyright holders>
     
     Permission is hereby granted, free of charge, to any person obtaining
     a copy of this software and associated documentation files (the
     "Software"), to deal in the Software without restriction, including
```

You can make other changes to the header, such as the -D option to change the date and time format, or replace it with new text.

```
$ fmt -w 70 mit.txt | pr -D '6/24/2022' -h 'mit.txt' -o 5 | head -30
     

     6/24/2022                         mit.txt                         Page 1


     Copyright (c) <year> <copyright holders>
     
     Permission is hereby granted, free of charge, to any person obtaining
     a copy of this software and associated documentation files (the
     "Software"), to deal in the Software without restriction, including
     without limitation the rights to use, copy, modify, merge, publish,
     distribute, sublicense, and/or sell copies of the Software, and to
     permit persons to whom the Software is furnished to do so, subject
     to the following conditions:
     
     The above copyright notice and this permission notice shall be
     included in all copies or substantial portions of the Software.
     
     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
     KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
     WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
     BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
     AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
     IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
     THE SOFTWARE.
```

### Printing two columns

What if you wanted to make a text document look really fancy on the printed page? Certain documents such as technical articles might need to be printed in a two-column layout. The `pr` command can print text in multiple columns. For example, `-2` prints in two columns and -3 will print in three columns.

However, be careful when printing text in multiple columns. If the lines are too long, `pr` may simply overlap one column with another, effectively losing text in the output. But we can leverage the `fmt` command to reformat the text to a narrower width, suitable for printing in two column format.

Let's do the math: If the printed page is 80 columns wide, and we've left 5 spaces on the left and right as page margins, that leaves 70 columns for our text. Using `fmt -w 35` would cut the text neatly in half for two columns, but we may not leave much space between the columns. Instead, let's use `fmt -w 33` to reformat the text width to 33 before sending the output to the `pr` command:

```
$ fmt -w 33 mit.txt | pr -2 -D '6/24/2022' -h 'mit.txt' -o 5 | head -30
     

     6/24/2022                        mit.txt                         Page 1


     Copyright (c) <year> <copyright     be included in all copies or
     holders>                           substantial portions of the
                                         Software.
     Permission is hereby granted,       
     free of charge, to any person       THE SOFTWARE IS PROVIDED
     obtaining a copy of this            "AS IS", WITHOUT WARRANTY OF
     software and associated             ANY KIND, EXPRESS OR IMPLIED,
     documentation files (the            INCLUDING BUT NOT LIMITED TO THE
     "Software"), to deal in the         WARRANTIES OF MERCHANTABILITY,
     Software without restriction,       FITNESS FOR A PARTICULAR PURPOSE
     including without limitation the    AND NONINFRINGEMENT. IN NO
     rights to use, copy, modify,        EVENT SHALL THE AUTHORS OR
     merge, publish, distribute,         COPYRIGHT HOLDERS BE LIABLE
     sublicense, and/or sell copies      FOR ANY CLAIM, DAMAGES OR OTHER
     of the Software, and to permit      LIABILITY, WHETHER IN AN ACTION
     persons to whom the Software is     OF CONTRACT, TORT OR OTHERWISE,
     furnished to do so, subject to      ARISING FROM, OUT OF OR IN
     the following conditions:           CONNECTION WITH THE SOFTWARE
                                         OR THE USE OR OTHER DEALINGS IN
     The above copyright notice and      THE SOFTWARE.
     this permission notice shall




$
```

Unix is a great platform for processing text. While we use other tools today, including HTML in web browsers and PDF for printable content, it's nice to know how to use the existing Unix tools to create professional plain text documents.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/7/process-text-linux-pr

作者：[Jim Hall][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/documentation-type-keys-yearbook.png
[2]: https://opensource.com/article/22/7/fmt-trivial-text-formatter
[3]: https://opensource.com/sites/default/files/2022-07/Imageofstandardterminal.png

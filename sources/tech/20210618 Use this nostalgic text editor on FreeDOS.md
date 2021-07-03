[#]: subject: (Use this nostalgic text editor on FreeDOS)
[#]: via: (https://opensource.com/article/21/6/edlin-freedos)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Use this nostalgic text editor on FreeDOS
======
Edlin is a joy to use when I want to edit text the "old school" way.
![Old UNIX computer][1]

In the very early days of DOS, the standard editor was a no-frills _line editor_ called Edlin. Tim Paterson wrote the original Edlin for the first version of DOS, then called 86-DOS and later branded PC-DOS and MS-DOS. Paterson has commented that he meant to replace Edlin eventually, but it wasn't until ten years later that MS-DOS 5 (1991) replaced Edlin with Edit, a full-screen editor.

You may know that FreeDOS is an open source DOS-compatible operating system that you can use to play classic DOS games, run legacy business software, or develop embedded systems. FreeDOS has very good compatibility with MS-DOS, and the "Base" package group includes those utilities and programs that replicate the behavior of MS-DOS. One of those classic programs is an open source implementation of the venerable Edlin editor; Edlin is distributed under the GNU General Public License version 2.

Written by Gregory Pietsch, Edlin is a well-designed, portable editor. You can even compile Edlin on Linux. As Gregory described Edlin in the free ebook 23 Years of FreeDOS, “The top tier parses the input and calls the middle tier, a library called `edlib`, which calls the string and array-handling code to do the dirty work.” But aside from its technical merits, I find Edlin is a joy to use when I want to edit text the "old school" way.

FreeDOS 1.3 RC4 includes Edlin 2.18. That's actually one revision out of date, but you can download [Edlin 2.19][2] from the FreeDOS files archive on [Ibiblio][3]. You'll find two files there—_edlin-2.19.zip_ contains the source code, and _edlin-219exe.zip_ is just the DOS executable. Download the _edlin-219exe.zip_ file, and extract it to your FreeDOS system. I've unzipped my copy in `C:\EDLIN`.

Edlin takes a little practice to "get into" it, so let's edit a new file to show a few common actions in Edlin.

### A walkthrough

Start editing a file by typing `EDLIN` and then the name of the file to edit. For example, to edit a C programming source file called `HELLO.C`, you might type:


```
`C:\EDLIN> edlin hello.c`
```

I've typed the FreeDOS commands in all lowercase here. FreeDOS is actually _case insensitive_, so you can type commands and files in uppercase or lowercase. Typing `edlin` or `EDLIN` or `Edlin` would each run the Edlin editor. Similarly, you can identify the source file as `hello.c` or `HELLO.C` or `Hello.C`.


```
C:\EDLIN&gt; edlin hello.c
edlin 2.19, copyright (c) 2003 Gregory Pietsch
This program comes with ABSOLUTELY NO WARRANTY.
It is free software, and you are welcome to redistribute it
under the terms of the GNU General Public License -- either
version 2 of the license, or, at your option, any later
version.

hello.c: 0 lines read
*
```

Once inside Edlin, you'll be greeted by a friendly `*` prompt. The interface is pretty minimal; no shiny "menu" or mouse support here. Just type a command at the `*` prompt to start editing, revise lines, search and replace, save your work, or exit the editor.

Since this is a new file, we'll need to add new lines. We'll do this with the _insert_ command, by typing `i` at the `*` prompt. The Edlin prompt changes to `:` where you'll enter your new text. When you are done adding new text, type a period (`.`) on a line by itself.


```
*i
 : #include &lt;stdio.h&gt;
 :
 : int
 : main()
 : {
 :   puts("Hello world");
 : }
 : .
*
```

To view the text you've entered so far, use the _list_ command by entering `l` at the `*` prompt. Edlin will display lines one screenful at a time, assuming 25 rows on the display. But for this short "Hello world" program, the source code fits on one screen:


```
*l
1: #include &lt;stdio.h&gt;
2:
3: int
4: main()
5: {
6:   puts("Hello world");
7:*}
*
```

Did you notice the `*` on line 7, the last line in the file? That's a special mark indicating your place in the file. If you inserted new text in the file, Edlin would add it at this location.

Let's update the C source file to return a code to the operating system. To do that, we'll need to add a line _above_ line 7. Since that's where Edlin has the mark, we can use `i` to insert next text before this line. Don't forget to enter `.` on a line by itself to stop entering the new text.

By listing the file contents afterwards, you can see that we inserted the new text in the correct place, before the closing "curly brace" in the program.


```
*i
 :   return 0;
 : .
*l
1: #include &lt;stdio.h&gt;
2:
3: int
4: main()
5: {
6:   puts("Hello world");
7:   return 0;
8:*}
*
```

But what if you need to edit a single line in the file? At the `*` prompt,simply type the line number that you want to edit. Edlin works one line at a time, so you'll need to re-enter the full line. In this case, let's update the `main()` function definition to use a slightly different programming syntax. That's on line 4, so type `4` at the prompt, and re-type the line in full.

Listing the file contents afterwards shows the updated line 4.


```
*4
4:*main()
4: main(void)
*l
1: #include &lt;stdio.h&gt;
2:
3: int
4:*main(void)
5: {
6:   puts("Hello world");
7:   return 0;
8: }
*
```

When you've made all the changes you need to make, don't forget to save the updated file. Enter `w` at the prompt to _write_ the file back to disk, then use `q` to _quit_ Edlin and return to DOS.


```
*w
hello.c: 8 lines written
*q
C:\EDLIN&gt;
```

### Quick reference guide

That walkthrough shows the basics of using Edlin to edit files. But Edlin does more than just "insert, edit, and save." Here's a handy cheat sheet showing all the Edlin functions, where _text_ indicates a text string, _filename_ is the path and name of a file, and _num_ is a number (use `.` for the current line number, `$` for the last line number).

`?` | Show help
---|---
_num_ | Edit a single line
`a` | Append a line below the mark
[_num_]`i` | Insert new lines before the mark
[_num_][`,`_num_]`l` | List the file (starting 11 lines above the mark)
[_num_][`,`_num_]`p` | Page (same as List, but starting at the mark)
[_num_]`,`[_num_]`,`_num_`,`[_num_]`c` | Copy lines
[_num_]`,`[_num_]`,`_num_`m` | Move lines
[_num_][`,`_num_][`?`]`s`_text_ | Search for text
[_num_][`,`_num_][`?`]`r`_text_`,`_text_ | Replace text
[_num_][`,`_num_]`d` | Delete lines
[_num_]`t`_filename_ | Transfer (insert the contents of a new file at the mark)
[_num_]`w`[_filename_] | Write the file to disk
`q` | Quit Edlin
`e`[_filename_] | End (write and quit)

Programmers will be interested to know they can enter special characters in Edlin, using these special codes:

`\a` | alert
---|---
`\b` | backspace
`\e` | escape
`\f` | formfeed
`\t` | horizontal tab
`\v` | vertical tab
`\"` | double quote
`\'` | single quote
`\.` | period
`\\` | backslash
`\x`_XX_ | hexadecimal number
`\d`_NNN_ | decimal number
`\`_OOO_ | octal number
`\^`_C_ | control character

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/edlin-freedos

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/retro_old_unix_computer.png?itok=SYAb2xoW (Old UNIX computer)
[2]: https://www.ibiblio.org/pub/micro/pc-stuff/freedos/files/dos/edlin/2.19/
[3]: https://www.ibiblio.org/

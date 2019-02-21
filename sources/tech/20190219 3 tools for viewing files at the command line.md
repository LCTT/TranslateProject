[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (3 tools for viewing files at the command line)
[#]: via: (https://opensource.com/article/19/2/view-files-command-line)
[#]: author: (Scott Nesbitt https://opensource.com/users/scottnesbitt)

3 tools for viewing files at the command line
======
Take a look at less, Antiword, and odt2txt, three utilities for viewing files in the terminal.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/command_line_prompt.png?itok=wbGiJ_yg)

I always say you don't need to use the command line to use Linux effectively—I know many Linux users who never crack open a terminal window and are quite happy. However, even though I don't consider myself a techie, I spend about 20% of my computing time at the command line, manipulating files, processing text, and using utilities.

One thing I often do in a terminal window is viewing files, whether text or word processor files. Sometimes it's just easier to use a command line utility than to fire up a text editor or a word processor.

Here are three of the utilities I use to view files at the command line.

### less

The beauty of [less][1] is that it's easy to use and it breaks the files you're viewing down into discrete chunks (or pages), which makes them easier to read. You use it to view text files at the command line, such as a README, an HTML file, a LaTeX file, or anything else in plaintext. I took a look at less in a [previous article][2].

To use less, just type:

```
less file_name
```

![](https://opensource.com/sites/default/files/uploads/less.png)

Scroll down through the file by pressing the spacebar or PgDn key on your keyboard. You can move up through a file by pressing the PgUp key. To stop viewing the file, press the Q key on your keyboard.

### Antiword

[Antiword][3] is great little utility that you can use to that can convert Word documents to plaintext. If you want, you can also convert them to [PostScript][4] or [PDF][5]. For this article, let's just stick with the conversion to text.

Antiword can read and convert files created with versions of Word from 2.0 to 2003. It doesn't read DOCX files—if you try, Antiword displays an error message that what you're trying to read is a ZIP file. That's technically correct, but it's still frustrating.

To view a Word document using Antiword, type the following command:

```
antiword file_name.doc
```

Antiword converts the document to text and displays it in the terminal window. Unfortunately, it doesn't break the document into pages in the terminal. You can, though, redirect Antiword's output to a utility like less or [more][6] to paginate it. Do that by typing the following command:

```
antiword file_name.doc | less
```

If you're new to the command line, the | is called a pipe. That's what does the redirection.

![](https://opensource.com/sites/default/files/uploads/antiword.png)

### odt2txt

Being a good open source citizen, you'll want to use as many open formats as possible. For your word processing needs, you might deal with [ODT][7] files (used by such word processors as LibreOffice Writer and AbiWord) instead of Word files. Even if you don't, you might run into ODT files. And they're easy to view at the command line, even if you don't have Writer or AbiWord installed on your computer.

How? With a little utility called [odt2txt][8]. As you've probably guessed, odt2txt converts an ODT file to plaintext. To use it, run the command:

```
odt2txt file_name.odt
```

Like Antiword, odt2txt converts the document to text and displays it in the terminal window. And, like Antiword, it doesn't page the document. Once again, though, you can pipe the output from odt2txt to a utility like less or more using the following command:

```
odt2txt file_name.odt | more
```

![](https://opensource.com/sites/default/files/uploads/odt2txt.png)

Do you have a favorite utility for viewing files at the command line? Feel free to share it with the community by leaving a comment.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/view-files-command-line

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: https://www.gnu.org/software/less/
[2]: https://opensource.com/article/18/4/using-less-view-text-files-command-line
[3]: http://www.winfield.demon.nl/
[4]: http://en.wikipedia.org/wiki/PostScript
[5]: http://en.wikipedia.org/wiki/Portable_Document_Format
[6]: https://opensource.com/article/19/1/more-text-files-linux
[7]: http://en.wikipedia.org/wiki/OpenDocument
[8]: https://github.com/dstosberg/odt2txt

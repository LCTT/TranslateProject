How to Search PDF Files from the Terminal with pdfgrep
======
Command line utilities such as [grep][1] and [ack-grep][2] are great for searching plain-text files for patterns matching a specified [regular expression][3]. But have you ever tried using these utilities to search for patterns in a PDF file? Well, don't! You will not get any result as these tools cannot read PDF files; they only read plain-text files.

[pdfgrep][4], as the name suggests, is a small command line utility that makes it possible to search for text in a PDF file without opening the file. It is insanely fast - faster than the search provided by virtually all PDF document viewers. A great distinction between grep and pdfgrep is that pdfgrep operates on pages, whereas grep operates on lines. It also prints a single line multiple times if more than one match is found on that line. Let's look at how exactly to use the tool.

For Ubuntu and other Linux distros based on Ubuntu, it is pretty simple:
```
sudo apt install pdfgrep
```

For other distros, just provide `pdfgrep` as input for the [package manager][5], and that should get it installed. You can also check out the project's [GitLab page][6], in case you want to play around with the code.

Now that you have the tool installed, let's go for a test run. pdfgrep command takes this format:
```
pdfgrep [OPTION...] PATTERN [FILE...]
```

 **OPTION** is a list of extra attributes to give the command such as `-i` or `--ignore-case`, which both ignore the case distinction between the regular pattern specified and the once matching it from the file.

 **PATTERN** is just an extended regular expression.

 **FILE** is just the name of the file, if it is in the same working directory, or the path to the file.

I ran the command on Python 3.6 official documentation. The following image is the result.

![pdfgrep search][7]

![pdfgrep search][7]

The red highlights indicate all the places the word "queue" was encountered. Passing `-i` as option to the command included matches of the word "Queue." Remember, the case does not matter when `-i` is passed as an option.

pdfgrep has quite a number of interesting options to use. However, I'll cover only a few here.

  * `-c` or `--count`: this suppresses the normal output of matches. Instead of displaying the long output of the matches, it only displays a value representing the number of times the word was encountered in the file
  * `-p` or `--page-count`: this option prints out the page numbers of matches and the number of occurrences of the pattern on the page
  * `-m` or `--max-count` [number]: specifies the maximum number of matches. That means when the number of matches is reached, the command stops reading the file.



The full list of supported options can be found in the man pages or in the pdfgrep online [documenation][8]. Don't forget pdfgrep can search multiple files at the same time, in case you're working with some bulk files. The default match highlight color can be changed by altering the GREP_COLORS environment variable.

The next time you think of opening up a PDF file to search for anything. think of using pdfgrep. The tool comes in handy and will save you time.

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/search-pdf-files-pdfgrep/

作者：[Bruno Edoh][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com
[1] https://www.maketecheasier.com/what-is-grep-and-uses/
[2] https://www.maketecheasier.com/ack-a-better-grep/
[3] https://www.maketecheasier.com/the-beginner-guide-to-regular-expressions/
[4] https://pdfgrep.org/
[5] https://www.maketecheasier.com/install-software-in-various-linux-distros/
[6] https://gitlab.com/pdfgrep/pdfgrep
[7] https://www.maketecheasier.com/assets/uploads/2017/11/pdfgrep-screenshot.png (pdfgrep search)
[8] https://pdfgrep.org/doc.html

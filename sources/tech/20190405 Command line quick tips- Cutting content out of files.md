[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Command line quick tips: Cutting content out of files)
[#]: via: (https://fedoramagazine.org/command-line-quick-tips-cutting-content-out-of-files/)
[#]: author: (Stephen Snow https://fedoramagazine.org/author/jakfrost/)

Command line quick tips: Cutting content out of files
======

![][1]

The Fedora distribution is a full featured operating system with an excellent graphical desktop environment. A user can point and click their way through just about any typical task easily. All of this wonderful ease of use masks the details of a powerful command line under the hood. This article is part of a series that shows you some common command line utilities. So let’s drop into the shell, and have a look at **cut**.

Often when you work in the command line, you are working with text files. Sometimes these files may be quite long. Reading them in their entirety, while feasible, can be time consuming and prone to errors. In this installment you’ll learn how to extract content from text files, and get the information you want from them.

It’s important to recognize that there are many ways to accomplish similar command line tasks in Fedora. The Fedora repositories include entire language systems for parsing and working with text, as an example. Also, there are multiple command line utilities available for just about any purpose conceivable in the shell. This article will only focus on using a few of those utility choices, to extract some information from a file and present it in a readable format.

### Making the cut

To illustrate this example use a standard sizable file on the system like _/etc/passwd_. As seen in a prior article in this series, you can execute the _cat_ command to view an entire file:

```
$ cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
...
```

This file contains information on all accounts present on the system. It has a specific format:

```
name:password:user-id:group-id:comment:home-directory:shell
```

Imagine that you want to simply have a list of all the account names on the system. If you could only cut out the _name_ value from each line. This is where the _cut_ command comes in handy! This command treats any input one line at a time, and extracts a specific part of the line.

The _cut_ command provides options for selecting parts of a line differently, and in this example two of them are needed, _-d_ which is an option to specify a delimiter type to use, and _-f_ which is an option to specify which field of the line to cut. The _-d_ option lets you declare the _delimiter_ that separates values in a line. In this case a colon (:) is used to separate values. The _-f_ option lets you choose which field value or values to extract. So for this example the command entered would be:

```
$ cut -d: -f1 /etc/passwd
root
bin
daemon
adm
...
```

That’s great, it worked! But you get the printout to the standard output, which in a terminal session at least means the screen. What if you needed the information for another task to be done later? It would be really nice if there was a way to put the output of the _cut_ command into a text file to save it. There is an easy builtin shell function for such a task, the redirect function ( _>_ ).

```
$ cut -d: -f1 /etc/passwd > names.txt
```

This will place the output of cut into a file called _names.txt_ and you can check the contents with _cat:_

```
$ cat names.txt
root
bin
daemon
adm
...
```

With two commands and one shell function, it was easy to identify using _cat_ , extract using _cut_ , and redirect the extracted information from one file, saving it to another file for later use.

* * *

_Photo by _[ _Joel Mbugua_][2]_ on _[_Unsplash_][3]_._

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/command-line-quick-tips-cutting-content-out-of-files/

作者：[Stephen Snow][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/jakfrost/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/04/commandline-cutting-816x345.jpg
[2]: https://unsplash.com/photos/tA5eSY_hay8?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/search/photos/command-line?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText

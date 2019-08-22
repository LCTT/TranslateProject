[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Awk utility in Fedora)
[#]: via: (https://fedoramagazine.org/awk-utility-in-fedora/)
[#]: author: (Stephen Snow https://fedoramagazine.org/author/jakfrost/)

Awk utility in Fedora
======

![][1]

Fedora provides _awk_ as part of its default installation, including all its editions, including the immutable ones like Silverblue. But you may be asking, what is _awk_ and why would you need it?

_Awk_ is a data driven programming language that acts when it matches a pattern. On Fedora, and most other distributions, GNU _awk_ or _gawk_ is used. Read on for more about this language and how to use it.

### A brief history of awk

_Awk_ began at Bell Labs in 1977. Its name is an acronym from the initials of the designers: Alfred V. Aho, Peter J. Weinberger, and Brian W. Kernighan.

> The specification for _awk_ in the POSIX Command Language and Utilities standard further clarified the language. Both the _gawk_ designers and the original _awk_ designers at Bell Laboratories provided feedback for the POSIX specification.
>
> From [The GNU Awk User’s Guide][2]

For a more in-depth look at how _awk/gawk_ ended up being as powerful and useful as it is, follow the link above. Numerous individuals have contributed to the current state of _gawk_. Among those are:

  * Arnold Robbins and David Trueman, the creators of _gawk_
  * Michael Brennan, the creator of _mawk_ , which later was merged with _gawk_
  * Jurgen Kahrs, who added networking capabilities to _gawk_ in 1997
  * John Hague, who rewrote the _gawk_ internals and added an _awk_ -level debugger in 2011



### Using awk

The following sections show various ways of using _awk_ in Fedora.

#### At the command line

The simples way to invoke _awk_ is at the command line. You can search a text file for a particular pattern, and if found, print out the line(s) of the file that match the pattern anywhere. As an example, use _cat_ to take a look at the command history file in your home director:

```
$ cat ~/.bash_history
```

There are probably many lines scrolling by right now.

_Awk_ helps with this type of file quite easily. Instead of printing the entire file out to the terminal like _cat_ , you can use _awk_ to find something of specific interest. For this example, type the following at the command line if you’re running a standard Fedora edition:

```
$ awk '/dnf/' ~/.bash_history
```

If you’re running Silverblue, try this instead:

```
$ awk '/rpm-ostree/' ~/.bash_history
```

In both cases, more data likely appears than what you really want. That’s no problem for _awk_ since it can accept regular expressions. Using the previous example, you can change the pattern to more closely match search requirements of wanting to know about installs only. Try changing the search pattern to one of these:

```
$ awk '/rpm-ostree install/' ~/.bash_history
$ awk '/dnf install/' ~/.bash_history
```

All the entries of your bash command line history appear that have the pattern specified at any position along the line. Awk works on one line of a data file at a time. It matches pattern, then performs an action, then moves to next line until the end of file (EOF) is reached.

#### From an _awk_ program

Using awk at the command line as above is not much different than piping output to _grep_ , like this:

```
$ cat .bash_history | grep 'dnf install'
```

The end result of printing to standard output ( _stdout_ ) is the same with both methods.

Awk is a programming language, and the command _awk_ is an interpreter of that language. The real power and flexibility of _awk_ is you can make programs with it, and combine them with shell scripts to create even more powerful programs. For more feature rich development with _awk_ , you can also incorporate C or C++ code using [Dynamic-Extensions][3].

Next, to show the power of _awk_ , let’s make a couple of program files to print the header and draw five numbers for the first row of a bingo card. To do this we’ll create two awk program files.

The first file prints out the header of the bingo card. For this example it is called _bingo-title.awk_. Use your favorite editor to save this text as that file name:
```

```

BEGIN {
print "B\tI\tN\tG\tO"
}
```

```

Now the title program is ready. You could try it out with this command:

```
$ awk -f bingo-title.awk
```

The program prints the word BINGO, with a tab space ( _\t_ ) between the characters. For the number selection, let’s use one of awk’s builtin numeric functions called _rand()_ and use two of the control statements, _for_ and _switch._ (Except the editor changed my program, so no switch statement used this time).

The title of the second awk program is _bingo-num.awk_. Enter the following into your favorite editor and save with that file name:
```

```

@include "bingo-title.awk"
BEGIN {
for (i = 1; i < = 5; i++) {
b = int(rand() * 15) + (15*(i-1))
printf "%s\t", b
}
print
}
```

```

The _@include_ statement in the file tells the interpreter to process the included file first. In this case the interpreter processs the _bingo-title.awk_ file so the title prints out first.

#### Running the test program

Now enter the command to pick a row of bingo numbers:

```
$ awk -f bingo-num.awk
```

Output appears similar to the following. Note that the _rand()_ function in _awk_ is not ideal for truly random numbers. It’s used here only as for example purposes.
```

```

$ awk -f bingo-num.awk
B I N G O
13 23 34 53 71
```

```

In the example, we created two programs with only beginning sections that used actions to manipulate data generated from within the awk program. In order to satisfy the rules of Bingo, more work is needed to achieve the desirable results. The reader is encouraged to fix the programs so they can reliably pick bingo numbers, maybe look at the awk function _srand()_ for answers on how that could be done.

### Final examples

_Awk_ can be useful even for mundane daily search tasks that you encounter, like listing all _flatpak’s_ on the _Flathub_ repository from _org.gnome_ (providing you have the Flathub repository setup). The command to do that would be:

```
$ flatpak remote-ls flathub --system | awk /org.gnome/
```

A listing appears that shows all output from _remote-ls_ that matches the _org.gnome_ pattern. To see flatpaks already installed from org.gnome, enter this command:

```
$ ﻿flatpak list --system | awk /org.gnome/
```

Awk is a powerful and flexible programming language that fills a niche with text file manipulation exceedingly well.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/awk-utility-in-fedora/

作者：[Stephen Snow][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/jakfrost/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/04/awk-816x345.jpg
[2]: https://www.gnu.org/software/gawk/manual/gawk.html#Foreword3
[3]: https://www.gnu.org/software/gawk/manual/gawk.html#Dynamic-Extensions

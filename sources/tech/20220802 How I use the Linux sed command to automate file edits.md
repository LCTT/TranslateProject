[#]: subject: "How I use the Linux sed command to automate file edits"
[#]: via: "https://opensource.com/article/22/8/automate-file-edits-sed-linux"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lkxed"
[#]: translator: "perfiffer"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How I use the Linux sed command to automate file edits
======
Here are some tips and tricks to automating file edits from the Linux command line.

![computer screen][1]

Image by: Opensource.com

When I use the Linux command line, whether I'm writing a new program on my desktop computer or managing a website on my web server, I often need to process text files. Linux provides powerful tools that I leverage to get my work done. I frequently use `sed`, an editor that can modify text according to a pattern.

`sed` stands for *stream editor*, and it edits text in a file and prints the results. One way to use `sed` is to identify several occurrences of one string in a file and replace them with a different string. You can use `sed` to process text files to a seemingly endless degree, but I'd like to share a few ways I use `sed` to help me manage files.

### Search and replace text in a file on Linux

To use `sed`, you need to use a *regular expression*. A regular expression is a set of special characters that define a pattern. My most frequent example of using `sed` is replacing text in a file. The syntax for replacing text looks like this: `s/originaltext/newtext/`. The `s` tells sed to perform text replacement or swap occurrences of text. Provide the original text and new text between slashes.

This syntax will only replace the first occurrence of `originaltext` on each line. To replace every occurrence, even if the original text appears more than once on a line, append `g` to the end of the expression. Here is an example: `s/originaltext/newtext/g`.

To use this with `sed`, specify this regular expression with the `-e` option:

```
$ sed -e 's/originaltext/newtext/g'
```

For example, let's say I have a Makefile for a program called **game**, which simulates Conway's Game of Life:

```
.PHONY: all run clean

all: game

game: game.o
        $(CC) $(CFLAGS) -o game game.o $(LDFLAGS)

run: game
        ./game

clean:
        $(RM) *~
        $(RM) *.o
        $(RM) game
```

The name **game** isn't very descriptive, so I might choose to rename it **life**. Renaming the `game.c` source file to `life.c` is easy enough, but now I need to modify the Makefile to use the new name. I can use `sed` to change every occurrence of **game** to **life**:

```
$ sed -e 's/game/life/g' Makefile
.PHONY: all run clean

all: life

life: life.o
        $(CC) $(CFLAGS) -o life life.o $(LDFLAGS)

run: life
        ./life

clean:
        $(RM) *~
        $(RM) *.o
        $(RM) life
```

This prints the `sed` output to the screen, which is a good way to check if the text replacement will do what you want. To make these changes to the Makefile, first, make a backup of the file, then run `sed` and save the output to the original filename:

```
$ cp Makefile Makefile.old
$ sed -e 's/game/life/g' Makefile.old > Makefile
```

If you are confident that your changes are exactly what you want, use the `-i` or `--in-place` option to edit the file in place. However, I recommend adding a backup filename suffix like `--in-place=.old` to save a copy of the original file in case you need to restore it later. It looks like this:

```
$ sed --in-place=.old -e 's/game/life/g' Makefile
$ ls Makefile*
Makefile  Makefile.old
```

### Quoting files with sed on Linux

You can use other features of regular expressions to match specific instances of text. For example, you might need to replace text that occurs at the start of a line. With `sed`, you can match the beginning of a line with **^**, the caret character.

One way I use "start of line" in replacing text is when I need to quote a file in an email. Let's say I want to share my Makefile in an email, but I don't want to include it as a file attachment. Instead, I prefer to "quote" the file in the body of an email, using **>** before each line. I can use the following `sed` command to print out an edited version to my terminal, which I can copy and paste into a new email:

```
$ sed -e 's/^/>/' Makefile
>.PHONY: all run clean
>
>all: life
>
>life: life.o
>       $(CC) $(CFLAGS) -o life life.o $(LDFLAGS)
>
>run: life
>       ./life
>
>clean:
>       $(RM) *~
>       $(RM) *.o
>       $(RM) life
```

The `s/^/>/` regular expression matches the start of each line (**^**) and places a **>** there. Effectively, this starts each line with the **>** symbol.

The tabs might not show up correctly in an email, but I can replace all tabs in the Makefile with a few spaces by adding another regular expression:

```
$ sed -e 's/^/>/' -e 's/\t/  /g' Makefile
>.PHONY: all run clean
>
>all: life
>
>life: life.o
>  $(CC) $(CFLAGS) -o life life.o $(LDFLAGS)
>
>run: life
>  ./life
>
>clean:
>  $(RM) *~
>  $(RM) *.o
>  $(RM) life
```

The `\t` indicates a literal tab, so `s/\t/ /g` tells sed to replace all tabs in the input with two spaces in the output.

If you need to apply lots of edits to files, you can save your `-e` commands in a file and use `-f` to tell `sed` to use that file as a "script." This approach is especially useful if you need to make the same edits frequently. I might have prepared the Makefile for quoting in email using a script file called `quotemail.sed` :

```
$ cat quotemail.sed
s/^/>/
s/\t/  /g
$ sed -f quotemail.sed Makefile
>.PHONY: all run clean
>
>all: life
>
>life: life.o
>  $(CC) $(CFLAGS) -o life life.o $(LDFLAGS)
>
>run: life
>  ./life
>
>clean:
>  $(RM) *~
>  $(RM) *.o
>  $(RM) life
```

### Learn to work with sed on Linux

`sed` is a great tool to keep in your Linux command-line toolkit. Explore the `sed` manual page and learn more about how to use it. Type `man sed` at the command line to get complete documentation about the different command line options and how to use `sed` to process text files.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/8/automate-file-edits-sed-linux

作者：[Jim Hall][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/features_solutions_command_data.png

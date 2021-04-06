[#]: subject: (How to use the Linux sed command)
[#]: via: (https://opensource.com/article/21/3/sed-cheat-sheet)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to use the Linux sed command
======
Learn basic sed usage then download our cheat sheet for a quick
reference to the Linux stream editor.
![Penguin with green background][1]

Few Unix commands are as famous as sed, [grep][2], and [awk][3]. They get grouped together often, possibly because they have strange names and powerful tools for parsing text. They also share some syntactical and logical similarities. And while they're all useful for parsing text, each has its specialties. This article examines the `sed` command, which is a _stream editor_.

I've written before about [sed][4], as well as its distant relative [ed][5]. To get comfortable with sed, it helps to have some familiarity with ed because that helps you get used to the idea of buffers. This article assumes that you're familiar with the very basics of sed, meaning you've at least run the classic `s/foo/bar/` style find-and-replace command.

**[Download our free [sed cheat sheet][6]]**

### Installing sed

If you're using Linux, BSD, or macOS, you already have GNU or BSD sed installed. These are unique reimplementations of the original `sed` command, and while they're similar, there are minor differences. This article has been tested on the Linux and NetBSD versions, so you can use whatever sed you find on your computer in this case, although for BSD sed you must use short options (`-n` instead of `--quiet`, for instance) only.

GNU sed is generally regarded to be the most feature-rich sed available, so you might want to try it whether or not you're running Linux. If you can't find GNU sed (often called gsed on non-Linux systems) in your ports tree, then you can [download its source code][7] from the GNU website. The nice thing about installing GNU sed is that you can use its extra functions but also constrain it to conform to the [POSIX][8] specifications of sed, should you require portability.

MacOS users can find GNU sed on [MacPorts][9] or [Homebrew][10].

On Windows, you can [install GNU sed][11] with [Chocolatey][12].

### Understanding pattern space and hold space

Sed works on exactly one line at a time. Because it has no visual display, it creates a _pattern space_, a space in memory containing the current line from the input stream (with any trailing newline character removed). Once you populate the pattern space, sed executes your instructions. When it reaches the end of the commands, sed prints the pattern space's contents to the output stream. The default output stream is **stdout**, but the output can be redirected to a file or even back into the same file using the `--in-place=.bak` option.

Then the cycle begins again with the next input line.

To provide a little flexibility as you scrub through files with sed, sed also provides a _hold space_ (sometimes also called a _hold buffer_), a space in sed's memory reserved for temporary data storage. You can think of hold space as a clipboard, and in fact, that's exactly what this article demonstrates: how to copy/cut and paste with sed.

First, create a sample text file with this text as its contents:


```
Line one
Line three
Line two
```

### Copying data to hold space

To place something in sed's hold space, use the `h` or `H` command. A lower-case `h` tells sed to overwrite the current contents of hold space, while a capital `H` tells it to append data to whatever's already in hold space.

Used on its own, there's not much to see:


```
$ sed --quiet -e '/three/ h' example.txt
$
```

The `--quiet` (`-n` for short) option suppresses all output but what sed has performed for my search requirements. In this case, sed selects any line containing the string `three`, and copying it to hold space. I've not told sed to print anything, so no output is produced.

### Copying data from hold space

To get some insight into hold space, you can copy its contents from hold space and place it into pattern space with the `g` command. Watch what happens:


```
$ sed -n -e '/three/h' -e 'g;p' example.txt

Line three
Line three
```

The first blank line prints because the hold space is empty when it's first copied into pattern space.

The next two lines contain `Line three` because that's what's in hold space from line two onward.

This command uses two unique scripts (`-e`) purely to help with readability and organization. It can be useful to divide steps into individual scripts, but technically this command works just as well as one script statement:


```
$ sed -n -e '/three/h ; g ; p' example.txt

Line three
Line three
```

### Appending data to pattern space

The `G` command appends a newline character and the contents of the hold space to the pattern space.


```
$ sed -n -e '/three/h' -e 'G;p' example.txt
Line one

Line three
Line three
Line two
Line three
```

The first two lines of this output contain both the contents of the pattern space (`Line one`) and the empty hold space. The next two lines match the search text (`three`), so it contains both the pattern space and the hold space. The hold space doesn't change for the third pair of lines, so the pattern space (`Line two`) prints with the hold space (still `Line three`) trailing at the end.

### Doing cut and paste with sed

Now that you know how to juggle a string from pattern to hold space and back again, you can devise a sed script that copies, then deletes, and then pastes a line within a document. For example, the example file for this article has `Line three` out of order. Sed can fix that:


```
$ sed -n -e '/three/ h' -e '/three/ d' \
-e '/two/ G;p' example.txt
Line one
Line two
Line three
```

  * The first script finds a line containing the string `three` and copies it from pattern space to hold space, replacing anything currently in hold space.
  * The second script deletes any line containing the string `three`. This completes the equivalent of a _cut_ action in a word processor or text editor.
  * The final script finds a line containing `two` and _appends_ the contents of hold space to pattern space and then prints the pattern space.



Job done.

### Scripting with sed

Once again, the use of separate script statements is purely for visual and mental simplicity. The cut-and-paste command works as one script:


```
$ sed -n -e '/three/ h ; /three/ d ; /two/ G ; p' example.txt
Line one
Line two
Line three
```

It can even be written as a dedicated script file:


```
#!/usr/bin/sed -nf

/three/h
/three/d
/two/ G
p
```

To run the script, mark it executable and try it on your sample file:


```
$ chmod +x myscript.sed
$ ./myscript.sed example.txt
Line one
Line two
Line three
```

Of course, the more predictable the text you need to parse, the easier it is to solve your problem with sed. It's usually not practical to invent "recipes" for sed actions (such as a copy and paste) because the condition to trigger the action is probably different from file to file. However, the more fluent you become with sed's commands, the easier it is to devise complex actions based on the input you need to parse.

The important things are recognizing distinct actions, understanding when sed moves to the next line, and predicting what the pattern and hold space can be expected to contain.

### Download the cheat sheet

Sed is complex. It only has a dozen commands, yet its flexible syntax and raw power mean it's full of endless potential. I used to reference pages of clever one-liners in an attempt to get the most use out of sed, but it wasn't until I started inventing (and sometimes reinventing) my own solutions that I felt like I was starting to _actually_ learn sed. If you're looking for gentle reminders of commands and helpful tips on syntax, [download our sed cheat sheet][6], and start learning sed once and for all!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/sed-cheat-sheet

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_penguin_green.png?itok=ENdVzW22 (Penguin with green background)
[2]: https://opensource.com/article/21/3/grep-cheat-sheet
[3]: https://opensource.com/article/20/9/awk-ebook
[4]: https://opensource.com/article/20/12/sed
[5]: https://opensource.com/article/20/12/gnu-ed
[6]: https://opensource.com/downloads/sed-cheat-sheet
[7]: http://www.gnu.org/software/sed/
[8]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[9]: https://opensource.com/article/20/11/macports
[10]: https://opensource.com/article/20/6/homebrew-mac
[11]: https://chocolatey.org/packages/sed
[12]: https://opensource.com/article/20/3/chocolatey

[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Learn to use the Sed text editor)
[#]: via: (https://opensource.com/article/20/12/sed)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Learn to use the Sed text editor
======
Sed lacks the usual text boxes and instead writes directly on a file,
directed by user commands.
![Command line prompt][1]

Created for version 7 of AT&amp;T’s original Unix operating system, the `sed` command has been included with probably every Unix and Linux OS since. The `sed` application is a _stream editor_, and unlike a text editor it doesn’t open a visual buffer into which a file’s data is loaded for processing. Instead, it operates on a file, line by line, according to either a command typed into a terminal or a series of commands in a script.

### Installing

If you’re using Linux, BSD, or macOS, then you already have GNU or BSD `sed` installed. These are two unique reimplementations of the original `sed` command, and while they’re similar, there can be minor differences. GNU `sed` is generally regarded to be the most feature-rich `sed` out there, and it’s widely available on any of these platforms.

If you can’t find GNU `sed` (often called `gsed` on non-Linux systems), then you can [download its source code from the GNU website][2]. The nice thing about having GNU `sed` installed is that it can be used for its extra functions, but it can also be constrained to conform to just the [POSIX][3] specifications of `sed`, should you require portability.

On Windows, you can [install][4] GNU `sed` with [Chocolatey][5].

### How Sed works

The `sed` application works on one line at a time. Because it has no visual display, it creates a pattern space—a space in memory containing the current line from the input stream (with any trailing newline character removed). Once the pattern space is populated, your instructions to `sed` are executed. Sometimes your commands are conditional, and other times they are absolute, so the results of these commands depend on how you’re using `sed`.

When the end of commands is reached, `sed` prints the contents of the pattern space to the output stream. The default output stream is **stdout**, but it can be redirected to a file or even back into the same file using the `--in-place=.bak` option.

Then the cycle begins again with the next input line.

The syntax for the `sed` command is:


```
`$ sed --options [optional SCRIPT] [INPUT FILE or STREAM]`
```

#### Finding what you want to edit

In a visual editor, you usually locate what you want to change in a text file without thinking much about it. Your eye (or screen reader) scans the text, finds the word you want to change or the place you want to insert or remove text, and then you just start typing. There is no interactive mode for `sed`, though, so you must tell it what conditions must be met for it to run specific commands.

For these examples, assume that a file called `example.txt` contains this text:


```
hello
world
This is line three.
Here is the final line.
```

#### Line number

Specifying a line number tells `sed` to operate only on that specific line in the file.

For instance, this command selects line 1 of a file and prints it. Because `sed`’s default action after processing is also to print a line to **stdout**, this has the effect of duplicating the first line:


```
$ sed ‘1p’ example.txt
hello
hello
world
This is line three.
Here is the final line.
```

You can specify line numbers in steps, too. For instance, `1~2` indicates that every 2 lines are selected ("select every second line starting with the first"). The instruction `1~3` means to select every third line after the first:


```
$ sed ‘1p’ example.txt
hello
hello
world
This is line three.
Here is the final line.
Here is the final line.
```

#### Line position

You can operate only on the last line of a file by using `$` as a selector:


```
$ sed ‘$p’ example.txt
hello
world
This is line three.
Here is the final line.
Here is the final line.
```

In GNU `sed`, you can select more than one line (`sed '1,$p'` prints the first and final line, for example).

#### Negation

Any selection by number or position, you can invert with the exclamation mark (`!`) character. This selects all lines _except_ the first line:


```
$ sed ‘1!p’ example.txt
hello
world
world
This is line three.
This is line three.
Here is the final line.
Here is the final line.
```

#### Pattern matching

You can think of a pattern match as a **find** operation in a word processor or a browser. You provide a word (a _pattern_), and the results are selected. The syntax for a pattern match is `/pattern/`.


```
$ sed ‘/hello/p’ example.txt
hello
hello
world
This is line three.
Here is the final line.
$ sed ‘/line/p’ example.txt
hello
world
This is line three.
This is line three.
Here is the final line.
Here is the final line.
```

### Editing with Sed

Once you’ve found what you want to edit, you can perform whatever action you want. You perform edits with `sed` with commands. Commands in `sed` are different from the `sed` command itself. If it helps, think of them as "actions" or "verbs" or "instructions."

Commands in `sed` are single letters, such as the `p` for **print** command used in previous examples. They can be difficult to recall at first, but as with everything, you get to know them with practice.

#### p for print

The `p` instruction prints whatever is currently held in pattern space.

#### d for delete

The `d` instruction deletes the pattern space.


```
$ sed ‘$d’ example.txt
hello
world
This is line three.
$ sed ‘1d’ example.txt
world
This is line three.
Here is the final line.
```

#### s for search and replace

The `s` command searches for a pattern and replaces it with something else. This is probably the most popular and casual use for `sed`, and it’s often the first (and sometimes the only) `sed` command a user learns. It’s almost certainly the most useful command for text editing.


```
$ sed ‘s/world/opensource.com/’
hello
opensource.com
This is line three.
Here is the final line.
```

There are special functions you can use in your replacement text, too. For instance, `\L` transforms the replacement text to lowercase and `\l` does the same for just the next character. There are others, which are listed in the `sed` documentation (you can view that with the `info sed` command).

The special character `&` in the replacement clause refers to the matched pattern:


```
$ sed ‘s/is/\U&amp;/’ example.txt
hello
world
ThIS is line three.
Here IS the final line.
```

You can also pass special flags to affect how `s` processes what it finds. The `g` (for _global_, presumably) flag tells `s` to apply the replacement to all matches found on the line and not just the first match:


```
$ sed ‘s/is/\U&amp;/g’ example.txt
hello
world
ThIS IS line three.
Here IS the final line.
```

Other important flags include a number to indicate which occurrence of a matched pattern to affect:


```
$ sed ‘s/is/\U&amp;/2’ example.txt
hello
world
This IS line three.
Here is the final line.
```

The `w` flag, followed by a filename, writes a matched line to a file _only if_ a change is made:


```
$ sed ‘s/is/\U&amp;/w sed.log’ example.txt
hello
world
ThIS is line three.
Here IS the final line.
$ cat sed.log
ThIS is line three.
Here IS the final line.
```

Flags can be combined:


```
$ sed ‘s/is/\U&amp;/2w sed.log’ example.txt
hello
world
This IS line three.
Here is the final line.
$ cat sed.log
This IS line three.
```

### Scripts

There are lots of great sites out there with `sed` "one-liners." They give you task-oriented `sed` commands to solve common problems. However, learning `sed` for yourself enables you to write your own one-liners, and those can be tailored to your specific needs.

Scripts for `sed` can be written as lines in a terminal, or they can be saved to a file and executed with `sed` itself. I tend to write small scripts all as one command because I find myself rarely re-using `sed` commands in real life. When I write a `sed` script, it’s usually very specific to one file. For example, after writing the initial draft of this very article, I used `sed` to standardize the capitalization of "sed", and that’s a task I’ll probably never have to do again.

You can issue a series of distinct commands to `sed` separated by a semicolon (`;`).


```
$ sed ‘3t ; s/line/\U&amp;/’ example.txt
hello
world
This is LINE three.
This is the final line.
```

### Scope changes with braces

You can also limit which results are affected with braces (`{}`). When you enclose `sed` commands in braces, they apply only to a specific selection. For example, the word "line" appears in two lines of the sample text. You can force `sed` to affect only the final line by declaring the required match condition (`$` to indicate the final line) and placing the `s` command you want to be performed in braces immediately thereafter:


```
$ sed ‘$ {s/line/\U&amp;/}’ example.txt
hello
world
This is line three.
This is the final LINE.
```

### Learn Sed

You can do a lot more with `sed` than what’s explained in this article. I haven’t even gotten to branching (`b`), tests (`t`), the _hold_ space (`H`), and many other features. Like [`ed`][6], `sed` probably isn’t the text editor you’re going to use for document creation or even for every scripted task you need doing, but it is a powerful option you have as a POSIX user. Learning how `sed` commands are structured and how to write short scripts can make for quick changes to massive amounts of text. Read through the `info` pages of GNU `sed`, or the man pages of BSD `sed`, and find out what `sed` can do for you.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/sed

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/command_line_prompt.png?itok=wbGiJ_yg (Command line prompt)
[2]: http://www.gnu.org/software/sed/
[3]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[4]: https://chocolatey.org/packages/sed
[5]: https://opensource.com/article/20/3/chocolatey
[6]: https://opensource.com/article/20/12/gnu-ed

Manipulating Directories in Linux
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/branches-238379_1920_0.jpg?itok=2PlNpsVu)

If you are new to this series (and to Linux), [take a look at our first installment][1]. In that article, we worked our way through the tree-like structure of the Linux filesystem, or more precisely, the File Hierarchy Standard. I recommend reading through it to make sure you understand what you can and cannot safely touch. Because this time around, I’ll show how to get all touchy-feely with your directories.

### Making Directories

Let's get creative before getting destructive, though. To begin, open a terminal window and use `mkdir` to create a new directory like this:
```
mkdir <directoryname>

```

If you just put the directory name, the directory will appear hanging off the directory you are currently in. If you just opened a terminal, that will be your home directory. In a case like this, we say the directory will be created _relative_ to your current position:
```
$ pwd #This tells you where you are now -- see our first tutorial
/home/<username>
$ mkdir newdirectory #Creates /home/<username>/newdirectory

```

(Note that you do not have to type the text following the `#`. Text following the pound symbol `#` is considered a comment and is used to explain what is going on. It is ignored by the shell).

You can create a directory within an existing directory hanging off your current location by specifying it in the command line:
```
mkdir Documents/Letters

```

Will create the _Letters_ directory within the _Documents_ directory.

You can also create a directory above where you are by using `..` in the path. Say you move into the _Documents/Letters/_ directory you just created and you want to create a _Documents/Memos/_ directory. You can do:
```
cd Documents/Letters # Move into your recently created Letters/ directory
mkdir ../Memos

```

Again, all of the above is done relative to you current position. This is called using a _relative path_.

You can also use an _absolute path_ to directories: This means telling `mkdir` where to put your directory in relation to the root (`/`) directory:
```
mkdir /home/<username>/Documents/Letters

```

Change `<username>` to your user name in the command above and it will be equivalent to executing `mkdir Documents/Letters` from your home directory, except that it will work from wherever you are located in the directory tree.

As a side note, regardless of whether you use a relative or an absolute path, if the command is successful, `mkdir` will create the directory silently, without any apparent feedback whatsoever. Only if there is some sort of trouble will `mkdir` print some feedback after you hit _[Enter]_.

As with most other command-line tools, `mkdir` comes with several interesting options. The `-p` option is particularly useful, as it lets you create directories within directories within directories, even if none exist. To create, for example, a directory for letters to your Mom within _Documents/_ , you could do:
```
mkdir -p Documents/Letters/Family/Mom

```

And `mkdir` will create the whole branch of directories above _Mom/_ and also the directory _Mom/_ for you, regardless of whether any of the parent directories existed before you issued the command.

You can also create several folders all at once by putting them one after another, separated by spaces:
```
mkdir Letters Memos Reports

```

will create the directories _Letters/_ , _Memos/_ and _Reports_ under the current directory.

### In space nobody can hear you scream

... Which brings us to the tricky question of spaces in directory names. Can you use spaces in directory names? Yes, you can. Is it advised you use spaces? No, absolutely not. Spaces make everything more complicated and, potentially, dangerous.

Say you want to create a directory called _letters mom/_. If you didn't know any better, you could type:
```
mkdir letters mom

```

But this is WRONG! WRONG! WRONG! As we saw above, this will create two directories, _letters/_ and _mom/_ , but not _letters mom/_.

Agreed that this is a minor annoyance: all you have to do is delete the two directories and start over. No big deal.

But, wait! Deleting directories is where things get dangerous. Imagine you did create _letters mom/_ using a graphical tool, like, say [Dolphin][2] or [Nautilus][3]. If you suddenly decide to delete _letters mom/_ from a terminal, and you have another directory just called _letters/_ under the same directory, and said directory is full of important documents, and you tried this:
```
rmdir letters mom

```

You would risk removing _letters/_. I say  "risk" because fortunately `rmdir`, the instruction used to remove directories, has a built in safeguard and will warn you if you try to delete a non-empty directory.

However, this:
```
rm -Rf letters mom

```

(and this is a pretty standard way of getting rid of directories and their contents) will completely obliterate _letters/_ and will never even tell you what just happened.

The `rm` command is used to delete files and directories. When you use it with the options `-R` (delete _recursively_ ) and `-f` ( _force_ deletion), it will burrow down into a directory and its subdirectories, deleting all the files they contain, then deleting the subdirectories themselves, then it will delete all the files in the top directory and then the directory itself.

`rm -Rf` is an instruction you must handle with extreme care.

My advice is, instead of spaces, use underscores (`_`), but if you still insist on spaces, there are two ways of getting them to work. You can use single or double quotes (`'` or `"`) like so:
```
mkdir 'letters mom'
mkdir "letters dad"

```

Or, you can _escape_ the spaces. Some characters have a special meaning for the shell. Spaces, as you have seen, are used to separate options and arguments on the command line.  "Separating options and arguments" falls under the category of "special meaning". When you want the shell to ignore the special meaning of a character, you need to _escape_ it and to escape a character, you put a backslash (`\`) in front of it:
```
mkdir letters\ mom
mkdir letter\ dad

```

There are other special characters that would need escaping, like the apostrophe or single quote (`'`), double quotes (`"`), and the ampersand (`&`):
```
mkdir mom\ \&\ dad\'s\ letters

```

I know what you're thinking: If the backslash has a special meaning (to wit, telling the shell it has to escape the next character), that makes it a special character, too. Then, how would you escape the escape character which is `\`?

Turns out, the exact way you escape any other special character:
```
mkdir special\\characters

```

will produce a directory called _special\characters_.

Confusing? Of course. That's why you should avoid using special characters, including spaces, in directory names.

For the record, here is a list of special characters you can refer to just in case.

### Things to Remember

  * Use `mkdir <directory name>` to create a new directory.
  * Use `rmdir <directory name>` to delete a directory (only works if it is empty).
  * Use `rm -Rf <directory name>` to annihilate a directory -- use with extreme caution.
  * Use a relative path to create directories relative to your current directory: `mkdir newdir.`.
  * Use an absolute path to create directories relative to the root directory (`/`): `mkdir /home/<username>/newdir`
  * Use `..` to create a directory in the directory above the current directory: `mkdir ../newdir`
  * You can create several directories all in one go by separating them with spaces on the command line: `mkdir onedir twodir threedir`
  * You can mix and mash relative and absolute paths when creating several directories simultaneously: `mkdir onedir twodir /home/<username>/threedir`
  * Using spaces and special characters in directory names guarantees plenty of headaches and heartburn. Don't do it.



For more information, you can look up the manuals of `mkdir`, `rmdir` and `rm`:
```
man mkdir
man rmdir
man rm

```

To exit the man pages, press _[q]_.

### Next Time

In the next installment, you'll learn about creating, modifying, and erasing files, as well as everything you need to know about permissions and privileges. See you then!

Learn more about Linux through the free ["Introduction to Linux" ][4]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2018/5/manipulating-directories-linux

作者：[Paul Brown][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/bro66
[1]:https://www.linux.com/blog/learn/intro-to-linux/2018/4/linux-filesystem-explained
[2]:https://userbase.kde.org/Dolphin
[3]:https://projects-old.gnome.org/nautilus/screenshots.html
[4]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux

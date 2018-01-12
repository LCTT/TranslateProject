translating---geekpi


Working with Vi/Vim Editor : Advanced concepts
======
Earlier we have discussed some basics about VI/VIM editor but VI & VIM are both very powerful editors and there are many other functionalities that can be used with these editors. In this tutorial, we are going to learn some advanced uses of VI/VIM editor.

( **Recommended Read** : [Working with VI editor : The Basics ][1])

## Opening multiple files with VI/VIM editor

To open multiple files, command would be same as is for a single file; we just add the file name for second file as well.

```
 $ vi file1 file2 file 3
```

Now to browse to next file, we can use

```
$ :n
```

or we can also use

```
$ :e filename
```

## Run external commands inside the editor

We can run external Linux/Unix commands from inside the vi editor, i.e. without exiting the editor. To issue a command from editor, go back to Command Mode if in Insert mode & we use the BANG i.e. '!' followed by the command that needs to be used. Syntax for running a command is,

```
$ :! command
```

An example for this would be

```
$ :! df -H
```

## Searching for a pattern

To search for a word or pattern in the text file, we use following two commands in command mode,

  * command '/' searches the pattern in forward direction

  * command '?' searched the pattern in backward direction


Both of these commands are used for same purpose, only difference being the direction they search in. An example would be,

 `$ :/ search pattern` (If at beginning of the file)

 `$ :/ search pattern` (If at the end of the file)

## Searching & replacing a pattern

We might be required to search & replace a word or a pattern from our text files. So rather than finding the occurrence of word from whole text file & replace it, we can issue a command from the command mode to replace the word automatically. Syntax for using search & replacement is,

```
$ :s/pattern_to_be_found/New_pattern/g
```

Suppose we want to find word "alpha" & replace it with word "beta", the command would be

```
$ :s/alpha/beta/g
```

If we want to only replace the first occurrence of word "alpha", then the command would be

```
$ :s/alpha/beta/
```

## Using Set commands

We can also customize the behaviour, the and feel of the vi/vim editor by using the set command. Here is a list of some options that can be use set command to modify the behaviour of vi/vim editor,

 `$ :set ic ` ignores cases while searching

 `$ :set smartcase ` enforce case sensitive search

 `$ :set nu` display line number at the begining of the line

 `$ :set hlsearch ` highlights the matching words

 `$ : set ro ` change the file type to read only

 `$ : set term ` prints the terminal type

 `$ : set ai ` sets auto-indent

 `$ :set noai ` unsets the auto-indent

Some other commands to modify vi editors are,

 `$ :colorscheme ` its used to change the color scheme for the editor. (for VIM editor only)

 `$ :syntax on ` will turn on the color syntax for .xml, .html files etc. (for VIM editor only)

This complete our tutorial, do mention your queries/questions or suggestions in the comment box below.


--------------------------------------------------------------------------------

via: http://linuxtechlab.com/working-vivim-editor-advanced-concepts/

作者：[Shusain][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/working-vi-editor-basics/

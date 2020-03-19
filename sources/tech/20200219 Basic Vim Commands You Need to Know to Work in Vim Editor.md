[#]: collector: (lujun9972)
[#]: translator: (mengxinayan)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Basic Vim Commands You Need to Know to Work in Vim Editor)
[#]: via: (https://www.2daygeek.com/basic-vim-commands-cheat-sheet-quick-start-guide/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Basic Vim Commands You Need to Know to Work in Vim Editor
======

If you are a system administrator or developer, you may need to edit a file while working on the Linux terminal.

There are several file editors on Linux, and how to choose the right one for your needs.

I would like to recommend Vim editor.

### You may ask, why?

You may spend more time in the editor to modify an existing file than writing new text.

In this case, Vim Keyboard shortcuts allow you to efficiently meet your needs.

The following articles may help you learn about file and directory manipulation.

  * [**L**][1]**[inux Basic – Linux and Unix Commands for File and Directory Manipulation][1]**
  * **[10 Methods to View Different File Formats in Linux][2]**



### What’s vim?

Vim is one of the most popular and powerful text editor that widely used by Linux administrators and developers.

It’s highly configurable text editor which enables efficient text editing. This is an updated version of the vi editor, which is already installed on most Unix systems.

Vim is often called a “programmer’s editor,” but it is not limited to it, and is suitable for all types of text editing.

It comes with many features like multi level undo, multi windows and buffers, syntax highlighting, command line editing, file name completion, visual selection.

You can easily obtain online help with the “:help” command.

### Understanding Vim Modes

Vim has two modes, the details are below:

**Command Mode:** When you launch Vim Editor, you will default to Command Mode. You can move around the file, and modify some parts of the text, cut, copy, and paste parts of the text and issue commands to do more (press ESC for Command Mode).

**Insert Mode:** The nsert mode is used to type text in a given given document (Press i for insert mode).

### How do I know which Vim mode I am on?

If you are in insert mode, you will see **“INSERT”** at the bottom of the editor. If nothing is shown, or if it shows the file name at the bottom of the editor, you are in “Command Mode”.

### Cursor Movement in Normal Mode

These Vim keyboard shortcuts allow you to move your cursor around a file in different ways.

  * `G` – Go to the last line of the file
  * `gg` – Go to the first line of the file
  * `$` – Go to the end of line.
  * `0` (zero) – Go to the beginning of line.


  * `w` – Jump by start of words
  * `W` – Jump by words (spaces separate words)
  * `b` – Jump backward by words
  * `B` – Jump backward by words (spaces separate words)


  * `PgDn` Key – Move down page-wise
  * `PgUp` Key – Move up page-wise
  * `Ctrl+d` – Move half-page down
  * `Ctrl+u` – Move half-page up



### Insert mode – insert a text

These vim keyboard shortcuts allows you to insert a cursor in varies position based on your needs.

  * `i` – Insert before the cursor
  * `a` – Insert after the cursor
  * `I` – Insert at the beginning of the line, this is useful when you are in the middle of the line.
  * `A` – Insert at the end of the line
  * `o` – Open a new line below the current line
  * `O` – Append a new line above the current line
  * `ea` – Insert at the end of the word



### Copy, Paste and Delete a Line

  * `yy` – yank (copy) a line
  * `p/P` – Paste after cursor/ put before cursor
  * `dd` – delete a line
  * `dw` – delete the word



### Search and Replace Pattern in Vim

  * `/pattern` – To search a given pattern
  * `?pattern` – To search backward a given pattern
  * `n` – To repeat search
  * `N` – To repeat backward search


  * `:%s/old-pattern/new-pattern/g` – Replace all old formats with the new format across the file.
  * `:s/old-pattern/new-pattern/g` – Replace all old formats with the new format in the current line.
  * `:%s/old-pattern/new-pattern/gc` – Replace all old formats with the new format across the file with confirmations.



### How do I go to a particular line in Vim Editor

You can do this in two ways, depending on your need. If you don’t know the line number I suggest you go with the first method.

Add line number by opening a file and running the command below.

```
:set number
```

Once you have set the line number, press **“: n”** to go to the corresponding line number. For example, if you want to go to **line 15**, enter.

```
:15
```

If you already know the line number, use the following method to go directly to the corresponding line. For example, if you want to move to line 20, enter the command below.

```
$ vim +20 [File_Name]
```

### Undo/Redo/Repeat Operation

  * `u` – Undo the changes
  * `Ctrl+r` – Redo the changes
  * `.` – Repeat last command



### Saving and Exiting Vim

  * `:w` – Save the changes but don’t exit
  * `:wq` – Write and quit
  * `:q!` – Force quit



--------------------------------------------------------------------------------

via: https://www.2daygeek.com/basic-vim-commands-cheat-sheet-quick-start-guide/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[萌新阿岩](https://github.com/mengxinayan)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/linux-basic-commands-file-directory-manipulation/
[2]: https://www.2daygeek.com/unix-linux-command-to-view-file/

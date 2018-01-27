translating by ljgibbslf

Working with VI editor : The Basics
======
VI editor is a powerful command line based text editor that was originally created for Unix but has since been ported to various Unix & Linux distributions. In Linux there exists another, advanced version of VI editor called VIM (also known as VI IMproved ). VIM only adds funtionalities to already powefrul VI editor, some of the added functionalities a

  * Support for many more Linux distributions,

  * Support for various coding languages like python, c++, perl etc with features like code folding , code highlighting etc

  * Can be used to edit files over network protocols like ssh and http,

  * Support to edit files inside a compressed archive,

  * Allows screen to split for editing multiple files.




Now let's discuss the commands/options that we can use with VI/VIM. For the purposes of this tutorial, we are going to use VI as an example but all the commands with VI can be used with VIM as well. But firstly we will start out with the two modes of VI text editor,

### Command Mode

This mode allows to handle tasks like saving files, executing a command within vi, copy/cut/paste operations, & tasks like finding/replacing. When in Insert mode, we can press escape to exit into command mode.

### Insert Mode

It's where we insert text into the file. To get into insert mode, we will press 'i' in command line mode.

### Creating a file

In order to create a file, use

```
 $ vi filename
```

Once the file is created & opened, we will enter into what's called a command mode & to enter text into the file, we need to use insert mode. Let's learn in brief about these two modes,

### Exit out of Vi

To exit out of Vi from insert mode, we will first press 'Esc' key to exit into command mode & here we can perform following tasks to exit out of vi,

  1. Exit without saving file- to exit out of vi command mode without saving of file, type : `:q!` 

  2. Save file & exit - To save a file & exit, type:  `:wq` 

Now let's discuss the commands/options that can be used in command mode.

### Cursor movement

Use the keys mentioned below to manipulate the cursor position

  1. **k** moves cursor one line up

  2. **j ** moves cursor one line down

  3. **h ** moves cursor to left one character postion

  4. **i** moves cursor to right one character position




 **Note :** If want to move multiple line up or down or left or right, we can use 4k or 5j, which will move cursor 4 lines up or 5 characters right respectively.

  5. **0** cursor will be at begining of the line

  6. **$** cursor will be at the end of a line

  7.  ** nG** moves to nth line of the file

  8. **G** moves to last line of the file

  9. **{ ** moves a paragraph back

  10. **}** moves a paragraph forward




There are several other options that can be used to manage the cursor movement but these should get the work done for you.

### Editing files

Now we will learn the options that can be used in command mode to change our mode to Insert mode for editing the files

  1. **i** Inserts text before the current cursor location

  2. **I** Inserts text at the beginning of the current line

  3.  ** a  ** Inserts text after the current cursor location

  4. **A ** Inserts text at the end of the current line

  5. **o** Creates a new line for text entry below the cursor location

  6.  ** O** Creates a new line for text entry above the cursor location




### Deleting file text

All of these commands will be excuted from command mode, so if you are in Insert mode exit out to command mode using the 'Esc' key

  1. **dd** will delete the complete line of the cursor, can use a number like 2dd to delete next 2 lines after the cursor

  2. **d$** deletes from cursor position till end of the line

  3. **d^** deletes from cursor position till beginning of line

  4. **dw** deletes from cursor to next word


### Copy & paste commands

  1. **yy** to yank or copy the current line. Can be used with a number to copy a number of lines

  2. **p** paste the copied lines after cursor position

  3. **P** paste the copied lines before the cursor postion




These were some the basic operations that we can use with VI or VIM editor. In our future tutorials, we leanrn to perform some advanced operations with VI/VIM editors. If having any queries or comments, please leave them in the comment box below.


--------------------------------------------------------------------------------

via: http://linuxtechlab.com/working-vi-editor-basics/

作者：[Shusain][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/

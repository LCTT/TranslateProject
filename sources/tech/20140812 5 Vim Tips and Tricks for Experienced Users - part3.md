5 Vim Tips and Tricks for Experienced Users
============================================================
 ![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2014/08/vim-tips-tricks-featured.jpg "5 Vim Tips and Tricks for Experienced Userss") 

This article is part of the [VIM User Guide][12] series:

*   [The Beginner’s Guide to Start Using Vim][3]
*   [Vim Keyboard Shortcuts Cheatsheet][4]
*   5 Vim Tips and Tricks for Experienced Users
*   [3 Useful VIM Editor Tips and Tricks for Advanced Users][5]

The Vim editor offers so many features that it’s very difficult to learn all of them. While, of course, spending more and more time on the command line editor always helps, there is no denying the fact that you learn new and productive things faster while interacting with fellow Vim users. Here are some Vim tips and tricks for you.


**Note** – To create the examples here, I used Vim version 7.4.52.

### 1\. Working with multiple files

If you are a software developer or someone who uses Vim as their primary editor, chances are that you have to work with multiple files simultaneously. Following are some useful tips that you can use while working with multiple files.

Instead of opening different files in different shell tabs, you can open multiple files in a single tab by passing their filenames as arguments to the vim command. For example:

```
vim file1 file2 file3
```

The first file (file1 in the example) will be the current file and read into the buffer.

Once inside the editor, use the `:next` or `:n` command to move to the next file, and the `:prev` or `:N` command to return to the previous one. To directly switch to the first or the last file, use `:bf` and `:bl` commands, respectively. To open and start editing another file, use the `:e` command with the filename as argument (use the complete path in case the file is not present in the current directory).

At any point if it is required to list down currently opened files, use the `:ls` command. See the screen shot shown below.

 ![vim-ls](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2014/08/vim-ls.png "vim-ls") 

Note that “%a” represents the file in the current active window, while “#” represents the file in the previous active window.

### 2\. Save time with auto complete

Want to save time and improve accuracy? Use abbreviations. They come in handy while writing long, complex words that recur frequently throughout the file. The Vim command for abbreviations is `ab`. For example, after you run the command

```
:ab asap as soon as possible
```

each occurrence of the word “asap” will be automatically replaced by “as soon as possible”, as you type.

Similarly, you can also use abbreviations to correct common typing mistakes. For example, the command

```
:ab recieve receive
```

will automatically correct the spelling mistake as you type. If you want to prevent the expansion/correction from happening at a particular occurrence, just type “Ctrl + V” after the last character of the word and then press the space bar key.

If you want to save the abbreviation you’ve created so that it is available to you the next time you use the Vim editor, add the complete `ab` command (without the initial colon) to “/etc/vim/vimrc” file. To remove a particular abbreviation, you can use the `una`command. For example, `:una asap`.

### 3\. Split windows to easily copy/paste

There are times when you want to copy a piece of code or a portion of text from one file to another. While the process is easy when working with GUI editors, it gets a bit tedious and time-consuming while working with a command line editor. Fortunately, Vim provides a way to minimize the time and effort required to do this.

Open one of the two files and then split the Vim window to open the other file. This can be done by using the `split` command with the file name as argument. For example,

```
:split test.c
```

will split the window and open “test.c”.

 ![vim-split](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2014/08/vim-split.png "vim-split") 

Observe that the command split the Vim window horizontally. In case you want to split the window vertically, you can do so using the `vsplit` command. Once both the files are opened, copy the stuff from one file, press “Ctrl + w” to switch the control to another file, and paste.

### 4\. Save a file you edited without the required permissions

There are times when you realize that a file is read-only only after making a bunch of changes to it.

 ![vim-sudo](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2014/08/vim-sudo.png "vim-sudo") 

Although closing the file and reopening it with the required permissions is a way out, it’s a sheer waste of time if you’ve already made a lot of changes, as all of them will be lost during the process. Vim provides you a way to handle this situation by allowing you to change the file permissions from within the editor before you save it. The command for this is:

```
:w !sudo tee %
```

The command will ask you for the password, just like `sudo` does on the command line, and will then save the changes.

**A related tip**: To quickly access the command prompt while editing a file in Vim, run the `:sh` command from within the editor. This will place you in an interactive shell. Once you are done, run the `exit` command to quickly return to your Vim session.

### 5\. Preserve indentation during copy/paste

Most of the experienced programmers work on Vim with auto indentation enabled. Although it’s a time-saving practice, it creates a problem while pasting an already indented code. For example, this is what happened when I pasted an already indented code into a file opened in Vim editor with auto indent on.

 ![vim-indentation](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2014/08/vim-indentation.png "vim-indentation") 

The solution to this problem is the `pastetoggle` option. Add the line

```
set pastetoggle=<F2>
```

to your vimrc file, and press F2 in insert mode just before pasting the code. This should preserve the original indentation. Note that you can replace F2 with any other key if it’s already mapped to some other functionality.

### Conclusion

The only way you can further improve your Vim editor skills is by using the command line editor for your day-to-day work. Just note down the actions that take time and then try to find out if there is an editor command that will do the actions more quickly.

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/vim-tips-tricks-for-experienced-users/

作者：[Himanshu Arora][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/himanshu/
[1]:https://www.maketecheasier.com/author/himanshu/
[2]:https://www.maketecheasier.com/vim-tips-tricks-for-experienced-users/#comments
[3]:https://www.maketecheasier.com/start-with-vim-linux/
[4]:https://www.maketecheasier.com/vim-keyboard-shortcuts-cheatsheet/
[5]:https://www.maketecheasier.com/vim-tips-tricks-advanced-users/
[6]:https://www.maketecheasier.com/category/linux-tips/
[7]:http://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.maketecheasier.com%2Fvim-tips-tricks-for-experienced-users%2F
[8]:http://twitter.com/share?url=https%3A%2F%2Fwww.maketecheasier.com%2Fvim-tips-tricks-for-experienced-users%2F&text=5+Vim+Tips+and+Tricks+for+Experienced+Users
[9]:mailto:?subject=5%20Vim%20Tips%20and%20Tricks%20for%20Experienced%20Users&body=https%3A%2F%2Fwww.maketecheasier.com%2Fvim-tips-tricks-for-experienced-users%2F
[10]:https://www.maketecheasier.com/enable-two-step-verification-apple-icloud-account/
[11]:https://www.maketecheasier.com/mistakes-wordpress-user-should-avoid/
[12]:https://www.maketecheasier.com/series/vim-user-guide/
[13]:https://support.google.com/adsense/troubleshooter/1631343

The Difference Between more, less And most Commands
======
![](https://www.ostechnix.com/wp-content/uploads/2018/11/more-less-and-most-commands-720x340.png)
If you’re a newbie Linux user, you might be confused with these three command like utilities, namely **more** , **less** and **most**. No problem! In this brief guide, I will explain the differences between these three commands, with some examples in Linux. To be precise, they are more or less same with slight differences. All these commands comes preinstalled in most Linux distributions.

First, we will discuss about ‘more’ command.

### The ‘more’ program

The **‘more’** is an old and basic terminal pager or paging program that is used to open a given file for interactive reading. If the content of the file is too large to fit in one screen, it displays the contents page by page. You can scroll through the contents of the file by pressing **ENTER** or **SPACE BAR** keys. But one limitation is you can scroll in **forward direction only** , not backwards. That means, you can scroll down, but can’t go up.

![](https://www.ostechnix.com/wp-content/uploads/2018/11/more-command-demo.gif)

**Update:**

A fellow Linux user has pointed out that more command do allow backward scrolling. The original version allowed only the forward scrolling. However, the newer implementations allows limited backward movement. To scroll backwards, just press **b**. The only limitation is that it doesn’t work for pipes (ls|more for example).

To quit, press **q**.

**more command examples:**

Open a file, for example ostechnix.txt, for interactive reading:

```
$ more ostechnix.txt
```

To search for a string, type search query after the forward slash (/) like below:

```
/linux
```

To go to then next matching string, press **‘n’**.

To open the file start at line number 10, simply type:

```
$ more +10 file
```

The above command show the contents of ostechnix.txt starting from 10th line.

If you want the ‘more’ utility to prompt you to continue reading file by pressing the space bar key, just use **-d** flag:

```
$ more -d ostechnix.txt
```

![][2]

As you see in the above screenshot, the more command prompts you to press SPACE to continue.

To view the summary of all options and keybindings in the help section, press **h**.

For more details about **‘more’** command, refer man pages.

```
$ man more
```

### The ‘less’ program

The **‘less** ‘ command is also used to open a given file for interactive reading, allowing scrolling and search. If the content of the file is too large, it pages the output and so you can scroll page by page. Unlike the ‘more’ command, it allows scrolling on both directions. That means, you can scroll up and down through a file.

![](https://www.ostechnix.com/wp-content/uploads/2018/11/less-command-demo.gif)

So, feature-wise, ‘less’ has more advantages than ‘more’ command. Here are some notable advantages of ‘less’ command:

  * Allows forward and backward scrolling,
  * Search in forward and backward directions,
  * Go to the end and start of the file immediately,
  * Open the given file in an editor.



**less command examples:**

Open a file:

```
$ less ostechnix.txt
```

Press **SPACE BAR** or **ENTER** key to go down and press **‘b’** to go up.

To perform a forward search, type search query after the forward slash ( **/** ) like below:

```
/linux
```

To go to then next matching string, press **‘n’**. To go back to the previous matching string, press **N** (shift+n).

To perform a backward search, type search query after the question mark ( **?** ) like below:

```
?linux
```

Press **n/N** to go to **next/previous** match.

To open the currently opened file in an editor, press **v**. It will open your file in your default text editor. You can now edit, remove, rename the text in the file.

To view the summary of less commands, options, keybindings, press **h**.

To quit, press **q**.

For more details about ‘less’ command, refer the man pages.

```
$ man less
```

### The ‘most’ program

The ‘most’ terminal pager has more features than ‘more’ and ‘less’ programs. Unlike the previous utilities, the ‘most’ command can able to open more than one file at a time. You can easily switch between the opened files, edit the current file, jump to the **N** th line in the opened file, split the current window in half, lock and scroll windows together and so on. By default, it won’t wrap the long lines, but truncates them and provides a left/right scrolling option.

**most command examples:**

Open a single file:

```
$ most ostechnix1.txt
```
![](https://www.ostechnix.com/wp-content/uploads/2018/11/most-command.png)
To edit the current file, press **e**.

To perform a forward search, press **/** or **S** or **f** and type the search query. Press **n** to find the next matching string in the current direction.

![][3]

To perform a backward search, press **?** and type the search query. Similarly, press **n** to find the next matching string in the current direction.

Open multiple files at once:

```
$ most ostechnix1.txt ostechnix2.txt ostechnix3.txt
```

If you have opened multiple files, you can switch to next file by typing **:n**. Use **UP/DOWN** arrow keys to select next file and hit **ENTER** key to view the chosen file.
![](https://www.ostechnix.com/wp-content/uploads/2018/11/most-2.gif)

To open a file at the first occurrence of given string, for example **linux** :

```
$ most file +/linux
```

To view the help section, press **h** at any time.

**List of all keybindings:**

Navigation:

  * **SPACE, D** – Scroll down one screen.
  * **DELETE, U** – Scroll Up one screen.
  * **DOWN arrow** – Move Down one line.
  * **UP arrow** – Move Up one line.
  * **T** – Goto Top of File.
  * **B** – Goto Bottom of file.
  * **> , TAB** – Scroll Window right.
  * **<** – Scroll Window left.
  * **RIGHT arrow** – Scroll Window left by 1 column.
  * **LEFT arrow** – Scroll Window right by 1 column.
  * **J, G** – Goto nth line. For example, to jump to the 10th line, simply type **“100j”** (without quotes).
  * **%** – Goto percent.



Window Commands:

  * **Ctrl-X 2, Ctrl-W 2** – Split window.
  * **Ctrl-X 1, Ctrl-W 1** – Make only one window.
  * **O, Ctrl-X O** – Move to other window.
  * **Ctrl-X 0 (zero)** – Delete Window.



Search through files:

  * **S, f, /** – Search forward.
  * **?** – Search Backward.
  * **N** – Find next match in current search direction.



Exit:

  * **q** – Quit MOST program. All opened files will be closed.
  * **:N, :n** – Quit this file and view next (Use UP/DOWN arrow keys to select next file).



For more details about ‘most’ command, refer the man pages.

```
$ man most
```

### TL;DR

**more** – An old, very basic paging program. Allows only forward navigation and limited backward navigation.

**less** – It has more features than ‘more’ utility. Allows both forward and backward navigation and search functionalities. It starts faster than text editors like **vi** when you open large text files.

**most** – It has all features of above programs including additional features, like opening multiple files at a time, locking and scrolling all windows together, splitting the windows and more.

And, that’s all for now. Hope you got the basic idea about these three paging programs. I’ve covered only the basics. You can learn more advanced options and functionalities of these programs by looking into the respective program’s man pages.

More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/the-difference-between-more-less-and-most-commands/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: http://www.ostechnix.com/wp-content/uploads/2018/11/more-1.png
[3]: http://www.ostechnix.com/wp-content/uploads/2018/11/most-1-1.gif

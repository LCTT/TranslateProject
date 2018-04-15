Translating by jessie-pang

How To Edit Multiple Files Using Vim Editor
======

![](https://www.ostechnix.com/wp-content/uploads/2018/03/Edit-Multiple-Files-Using-Vim-Editor-720x340.png)
Sometimes, you will find yourself in a situation where you want to make changes in multiple files or you might want to copy the contents of one file to another. If you’re on GUI mode, you could simply open the files in any graphical text editor, like gedit, and use CTRL+C and CTRL+V to copy/paste the contents. In CLI mode, you can’t use such editors. No worries! Where there is vim editor, there is a way! In this tutorial, we are going to learn to edit multiple files at the same time using Vim editor. Trust me, this is very interesting read.

### Installing Vim

Vim editor is available in the official repositories of most Linux distributions. So you can install it using the default package manager. For example, on Arch Linux and its variants you can install it using command:
```
$ sudo pacman -S vim

```

On Debian, Ubuntu:
```
$ sudo apt-get install vim

```

On RHEL, CentOS:
```
$ sudo yum install vim

```

On Fedora:
```
$ sudo dnf install vim

```

On openSUSE:
```
$ sudo zypper install vim

```

### Edit multiple files at a time using Vim editor in Linux

Let us now get down to the business. We can do this in two methods.

#### Method 1

I have two files namely **file1.txt** and **file2.txt** , with a bunch of random words. Let us have a look at them.
```
$ cat file1.txt
ostechnix
open source
technology
linux
unix

$ cat file2.txt
line1
line2
line3
line4
line5

```

Now, let us edit these two files at a time. To do so, run:
```
$ vim file1.txt file2.txt

```

Vim will display the contents of the files in an order. The first file’s contents will be shown first and then second file and so on.

![][2]

**Switch between files**

To move to the next file, type:
```
:n

```

![][3]

To go back to previous file, type:
```
:N

```

Vim won’t allow you to move to the next file if there are any unsaved changes. To save the changes in the current file, type:
```
ZZ

```

Please note that it is double capital letters ZZ (SHIFT+zz).

To abandon the changes and move to the previous file, type:
```
:N!

```

To view the files which are being currently edited, type:
```
:buffers

```

![][4]

You will see the list of loaded files at the bottom.

![][5]

To switch to the next file, type **:buffer** followed by the buffer number. For example, to switch to the first file, type:
```
:buffer 1

```

![][6]

**Opening additional files for editing**

We are currently editing two files namely file1.txt, file2.txt. I want to open another file named **file3.txt** for editing.
What will you do? It’s easy! Just type **:e** followed by the file name like below.
```
:e file3.txt

```

![][7]

Now you can edit file3.txt.

To view how many files are being edited currently, type:
```
:buffers

```

![][8]

Please note that you can not switch between opened files with **:e** using either **:n** or **:N**. To switch to another file, type **:buffer** followed by the file buffer number.

**Copying contents of one file into another**

You know how to open and edit multiple files at the same time. Sometimes, you might want to copy the contents of one file into another. It is possible too. Switch to a file of your choice. For example, let us say you want to copy the contents of file1.txt into file2.txt.

To do so, first switch to file1.txt:
```
:buffer 1

```

Place the move cursor in-front of a line that wants to copy and type **yy** to yank(copy) the line. Then. move to file2.txt:
```
:buffer 2

```

Place the mouse cursor where you want to paste the copied lines from file1.txt and type **p**. For example, you want to paste the copied line between line2 and line3. To do so, put the mouse cursor before line and type **p**.

Sample output:
```
line1
line2
ostechnix
line3
line4
line5

```

![][9]

To save the changes made in the current file, type:
```
ZZ

```

Again, please note that this is double capital ZZ (SHIFT+z).

To save the changes in all files and exit vim editor. type:
```
:wq

```

Similarly, you can copy any line from any file to other files.

**Copying entire file contents into another**

We know how to copy a single line. What about the entire file contents? That’s also possible. Let us say, you want to copy the entire contents of file1.txt into file2.txt.

To do so, open the file2.txt first:
```
$ vim file2.txt

```

If the files are already loaded, you can switch to file2.txt by typing:
```
:buffer 2

```

Move the cursor to the place where you wanted to copy the contents of file1.txt. I want to copy the contents of file1.txt after line5 in file2.txt, so I moved the cursor to line 5. Then, type the following command and hit ENTER key:
```
:r file1.txt

```

![][10]

Here, **r** means **read**.

Now you will see the contents of file1.txt is pasted after line5 in file2.txt.
```
line1
line2
line3
line4
line5
ostechnix
open source
technology
linux
unix

```

![][11]

To save the changes in the current file, type:
```
ZZ

```

To save all changes in all loaded files and exit vim editor, type:
```
:wq

```

#### Method 2

The another method to open multiple files at once is by using either **-o** or **-O** flags.

To open multiple files in horizontal windows, run:
```
$ vim -o file1.txt file2.txt

```

![][12]

To switch between windows, press **CTRL-w w** (i.e Press **CTRL+w** and again press **w** ). Or, you the following shortcuts to move between windows.

  * **CTRL-w k** – top window
  * **CTRL-w j** – bottom window



To open multiple files in vertical windows, run:
```
$ vim -O file1.txt file2.txt file3.txt

```

![][13]

To switch between windows, press **CTRL-w w** (i.e Press **CTRL+w** and again press **w** ). Or, use the following shortcuts to move between windows.

  * **CTRL-w l** – left window
  * **CTRL-w h** – right window



Everything else is same as described in method 1.

For example, to list currently loaded files, run:
```
:buffers

```

To switch between files:
```
:buffer 1

```

To open an additional file, type:
```
:e file3.txt

```

To copy entire contents of a file into another:
```
:r file1.txt

```

The only difference in method 2 is once you saved the changes in the current file using **ZZ** , the file will automatically close itself. Also, you need to close the files one by one by typing **:wq**. But, had you followed the method 1, when typing **:wq** all changes will be saved in all files and all files will be closed at once.

For more details, refer man pages.
```
$ man vim

```

**Suggested read:**

You know now how to edit multiples files using vim editor in Linux. As you can see, editing multiple files is not that difficult. Vim editor has more powerful features. We will write more about Vim editor in the days to come.

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-edit-multiple-files-using-vim-editor/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2018/03/edit-multiple-files-1-1.png
[3]:http://www.ostechnix.com/wp-content/uploads/2018/03/edit-multiple-files-2.png
[4]:http://www.ostechnix.com/wp-content/uploads/2018/03/edit-multiple-files-5.png
[5]:http://www.ostechnix.com/wp-content/uploads/2018/03/edit-multiple-files-6.png
[6]:http://www.ostechnix.com/wp-content/uploads/2018/03/edit-multiple-files-7.png
[7]:http://www.ostechnix.com/wp-content/uploads/2018/03/edit-multiple-files-8.png
[8]:http://www.ostechnix.com/wp-content/uploads/2018/03/edit-multiple-files-10-1.png
[9]:http://www.ostechnix.com/wp-content/uploads/2018/03/edit-multiple-files-11.png
[10]:http://www.ostechnix.com/wp-content/uploads/2018/03/edit-multiple-files-12.png
[11]:http://www.ostechnix.com/wp-content/uploads/2018/03/edit-multiple-files-13.png
[12]:http://www.ostechnix.com/wp-content/uploads/2018/03/Edit-multiple-files-16.png
[13]:http://www.ostechnix.com/wp-content/uploads/2018/03/Edit-multiple-files-17.png

DF-SHOW – A Terminal File Manager Based On An Old DOS Application
======
![](https://www.ostechnix.com/wp-content/uploads/2018/10/dfshow-720x340.png)

If you have worked on good-old MS-DOS, you might have used or heard about **DF-EDIT**. The DF-EDIT, stands for **D** irectory **F** ile **Edit** or, is an obscure DOS file manager, originally written by **Larry Kroeker** for MS-DOS and PC-DOS systems. It is used to display the contents of a given directory or file in MS-DOS and PC-DOS systems. Today, I stumbled upon a similar utility named **DF-SHOW** ( **D** irectory **F** ile **S** how), a terminal file manager for Unix-like operating systems. It is an Unix rewrite of obscure DF-EDIT file manager and is based on DF-EDIT 2.3d release from 1986. DF-SHOW is completely free, open source and released under GPLv3.

DF-SHOW can be able to,

  * List contents of a directory,
  * View files,
  * Edit files using your default file editor,
  * Copy files to/from different locations,
  * Rename files,
  * Delete files,
  * Create new directories from within the DF-SHOW interface,
  * Update file permissions, owners and groups,
  * Search files matching a search term,
  * Launch executable files.



### DF-SHOW Usage

DF-SHOW consists of two programs, namely **“show”** and **“sf”**.

**Show command**

The “show” program (similar to the `ls` command) is used to display the contents of a directory, create new directories, rename, delete files/folders, update permissions, search files and so on.

To view the list of contents in a directory, use the following command:

```
$ show <directory path>
```

Example:

```
$ show dfshow
```

Here, dfshow is a directory. If you invoke the “show” command without specifying a directory path, it will display the contents of current directory.

Here is how DF-SHOW default interface looks like.

![](https://www.ostechnix.com/wp-content/uploads/2018/10/dfshow-1.png)

As you can see, DF-SHOW interface is self-explanatory.

On the top bar, you see the list of available options such as Copy, Delete, Edit, Modify etc.

Complete list of available options are given below:

  * **C** opy,
  * **D** elete,
  * **E** dit,
  * **H** idden,
  * **M** odify,
  * **Q** uit,
  * **R** ename,
  * **S** how,
  * h **U** nt,
  * e **X** ec,
  * **R** un command,
  * **E** dit file,
  * **H** elp,
  * **M** ake dir,
  * **Q** uit,
  * **S** how dir



In each option, one letter has been capitalized and marked as bold. Just press the capitalized letter to perform the respective operation. For example, to rename a file, just press **R** and type the new name and hit ENTER to rename the selected item.

![](https://www.ostechnix.com/wp-content/uploads/2018/10/dfshow-2.png)

To display all options or cancel an operation, just press **ESC** key.

Also, you will see a bunch of function keys at the bottom of DF-SHOW interface to navigate through the contents of a directory.

  * **UP/DOWN** arrows or **F1/F2** – Move up and down (one line at time),
  * **PgUp/Pg/Dn** – Move one page at a time,
  * **F3/F4** – Instantly go to Top and bottom of the list,
  * **F5** – Refresh,
  * **F6** – Mark/Unmark files (Files marked will be indicated with an ***** in front of them),
  * **F7/F8** – Mark/Unmark all files at once,
  * **F9** – Sort the list by – Date  & time, Name, Size.,



Press **h** to learn more details about **show** command and its options.

To exit DF-SHOW, simply press **q**.

**SF Command**

The “sf” (show files) is used to display the contents of a file.

```
$ sf <file>
```

![](https://www.ostechnix.com/wp-content/uploads/2018/10/dfshow-3.png)

Press **h** to learn more “sf” command and its options. To quit, press **q**.

Want to give it a try? Great! Go ahead and install DF-SHOW on your Linux system as described below.

### Installing DF-SHOW

DF-SHOW is available in [**AUR**][1], so you can install it on any Arch-based system using AUR programs such as [**Yay**][2].

```
$ yay -S dfshow
```

On Ubuntu and its derivatives:

```
$ sudo add-apt-repository ppa:ian-hawdon/dfshow

$ sudo apt-get update

$ sudo apt-get install dfshow
```

On other Linux distributions, you can compile and build it from the source as shown below.

```
$ git clone https://github.com/roberthawdon/dfshow
$ cd dfshow
$ ./bootstrap
$ ./configure
$ make
$ sudo make install
```

The author of DF-SHOW project has only rewritten some of the applications of DF-EDIT utility. Since the source code is freely available on GitHub, you can add more features, improve the code and submit or fix the bugs (if there are any). It is still in alpha stage, but fully functional.

Have you tried it already? If so, how’d go? Tell us your experience in the comments section below.

And, that’s all for now. Hope this was useful.More good stuffs to come.

Stay tuned!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/df-show-a-terminal-file-manager-based-on-an-old-dos-application/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://aur.archlinux.org/packages/dfshow/
[2]: https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/

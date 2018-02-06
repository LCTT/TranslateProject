Prevent Files And Folders From Accidental Deletion Or Modification In Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2017/02/Prevent-Files-And-Folders-From-Accidental-Deletion-Or-Modification-In-Linux-720x340.jpg)

Some times, I accidentally “SHIFT+DELETE” my data. Yes, I am an idiot who don’t double check what I am exactly going to delete. And, I am too dumb or lazy to backup the data. Result? Data loss! They are gone in a fraction of second. I do it every now and then. If you’re anything like me, I’ve got a good news. There is a simple, yet useful commandline utility called **“chattr”** (abbreviation of **Ch** ange **Attr** ibute) which can be used to prevent files and folders from accidental deletion or modification in Unix-like distributions. It applies/removes certain attributes to a file or folder in your Linux system. So the users can’t delete or modify the files and folders either accidentally or intentionally, even as root user. Sounds useful, isn’t it?

In this brief tutorial, we are going to see how to use chattr in real time in-order to prevent files and folders from accidental deletion in Linux.

### Prevent Files And Folders From Accidental Deletion Or Modification In Linux

By default, Chattr is available in most modern Linux operating systems. Let us see some examples.

The default syntax of chattr command is:
```
chattr [operator] [switch] [filename]

```

chattr has the following operators.

  * The operator **‘+’** causes the selected attributes to be added to the existing attributes of the files;
  * The operator **‘-‘** causes them to be removed;
  * The operator **‘=’** causes them to be the only attributes that the files have.



Chattr has different attributes namely – **aAcCdDeijsStTu**. Each letter applies a particular attributes to a file.

  * **a** – append only,
  * **A** – no atime updates,
  * **c** – compressed,
  * **C** – no copy on write,
  * **d** – no dump,
  * **D** – synchronous directory updates,
  * **e** – extent format,
  * **i** – immutable,
  * **j** – data journalling,
  * **P** – project hierarchy,
  * **s** – secure deletion,
  * **S** – synchronous updates,
  * **t** – no tail-merging,
  * **T** – top of directory hierarchy,
  * **u** – undeletable.



In this tutorial, we are going to discuss the usage of two attributes, namely **a** , **i** which are used to prevent the deletion of files and folders. That’s what our topic today, isn’t? Indeed!

### Prevent files from accidental deletion

Let me create a file called **file.txt** in my current directory.
```
$ touch file.txt

```

Now, I am going to apply **“i”** attribute which makes the file immutable. It means you can’t delete, modify the file, even if you’re the file owner and the root user.
```
$ sudo chattr +i file.txt

```

You can check the file attributes using command:
```
$ lsattr file.txt

```

**Sample output:**
```
----i---------e---- file.txt

```

Now, try to remove the file either as a normal user or with sudo privileges.
```
$ rm file.txt

```

**Sample output:**
```
rm: cannot remove 'file.txt': Operation not permitted

```

Let me try with sudo command:
```
$ sudo rm file.txt

```

**Sample output:**
```
rm: cannot remove 'file.txt': Operation not permitted

```

Let us try to append some contents in the text file.
```
$ echo 'Hello World!' >> file.txt

```

**Sample output:**
```
bash: file.txt: Operation not permitted

```

Try with **sudo** privilege:
```
$ sudo echo 'Hello World!' >> file.txt

```

**Sample output:**
```
bash: file.txt: Operation not permitted

```

As you noticed in the above outputs, We can’t delete or modify the file even as root user or the file owner.

To revoke attributes, just use **“-i”** switch as shown below.
```
$ sudo chattr -i file.txt

```

Now, the immutable attribute has been removed. You can now delete or modify the file.
```
$ rm file.txt

```

Similarly, you can restrict the directories from accidental deletion or modification as described in the next section.

### Prevent folders from accidental deletion and modification

Create a directory called dir1 and a file called file.txt inside this directory.
```
$ mkdir dir1 && touch dir1/file.txt

```

Now, make this directory and its contents (file.txt) immutable using command:
```
$ sudo chattr -R +i dir1

```

Where,

  * **-R** – will make the dir1 and its contents immutable recursively.
  * **+i** – makes the directory immutable.



Now, try to delete the directory either as normal user or using sudo user.
```
$ rm -fr dir1

$ sudo rm -fr dir1

```

You will get the following output:
```
rm: cannot remove 'dir1/file.txt': Operation not permitted

```

Try to append some contents in the file using “echo” command. Did you make it? Of course, you couldn’t!

To revoke the attributes back, run:
```
$ sudo chattr -R -i dir1

```

Now, you can delete or modify the contents of this directory as usual.

### Prevent files and folders from accidental deletion, but allow append operation

We know now how to prevent files and folders from accidental deletion and modification. Next, we are going to prevent files and folders from deletion, but allow the file for writing in append mode only. That means you can’t edit, modify the existing data in the file, rename the file, and delete the file. You can only open the file for writing in append mode.

To set append mode attribution to a file/directory, we do the following.

**For files:**
```
$ sudo chattr +a file.txt

```

**For directories: **
```
$ sudo chattr -R +a dir1

```

A file/folder with the ‘a’ attribute set can only be open in append mode for writing.

Add some contents to the file(s) to check whether it works or not.
```
$ echo 'Hello World!' >> file.txt

$ echo 'Hello World!' >> dir1/file.txt

```

Check the file contents using cat command:
```
$ cat file.txt

$ cat dir1/file.txt

```

**Sample output:**
```
Hello World!

```

You will see that you can now be able to append the contents. It means we can modify the files and folders.

Let us try to delete the file or folder now.
```
$ rm file.txt

```

**Output:**
```
rm: cannot remove 'file.txt': Operation not permitted

```

Let us try to delete the folder:
```
$ rm -fr dir1/

```

**Sample output:**
```
rm: cannot remove 'dir1/file.txt': Operation not permitted

```

To remove the attributes, run the following commands:

**For files:**
```
$ sudo chattr -R -a file.txt

```

**For directories: **
```
$ sudo chattr -R -a dir1/

```

Now, you can delete or modify the files and folders as usual.

For more details, refer the man pages.
```
man chattr

```

### Wrapping up

Data protection is one of the main job of a System administrator. There are numerous free and commercial data protection software are available on the market. Luckily, we’ve got this built-in tool that helps us to protect the data from accidental deletion or modification. Chattr can be used as additional tool to protect the important system files and data in your Linux system.

And, that’s all for today. Hope this helps. I will be soon here with another useful article. Until then, stay tuned with OSTechNix!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/prevent-files-folders-accidental-deletion-modification-linux/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/

How To Rename Multiple Files At Once In Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2018/06/Rename-Multiple-Files-720x340.png)

As you may already know, we use **mv** command to rename or move files and directories in Unix-like operating systems. But, the mv command won’t support renaming multiple files at once. Worry not. In this tutorial, we are going to learn to rename multiple files at once using **“mmv”** command in Linux. This command is used to move, copy, append and rename files in bulk using standard wildcards in Unix-like operating systems.

### Rename Multiple Files At Once In Linux

The mmv utility is available in the default repositories of Debian-based systems. To install it on Debian, Ubuntu, Linux Mint, run the following command:
```
$ sudo apt-get install mmv

```

Let us say, you have the following files in your current directory.
```
$ ls
a1.txt a2.txt a3.txt

```

Now you want to rename all files that starts with letter “a” to “b”. Of course, you can do this manually in few seconds. But just think if you have hundreds of files and want to rename them? It is quite time consuming process. Here is where **mmv** command comes in help.

To rename all files starting with letter “a” to “b”, simply run:
```
$ mmv a\* b\#1

```

Let us check if the files have been renamed or not.
```
$ ls
b1.txt b2.txt b3.txt

```

As you can see, all files starts with letter “a” (i.e a1.txt, a2.txt, a3.txt) are renamed to b1.txt, b2.txt, b3.txt.

**Explanation**

In the above example, the first parameter (a\\*) is the ‘from’ pattern and the second parameter is ‘to’ pattern ( b\\#1 ). As per the above example, mmv will look for any filenames staring with letter ‘a’ and rename the matched files according to second parameter i.e ‘to’ pattern. We use wildcards, such as ‘*’, ‘?’ and ‘[]‘, to match one or more arbitrary characters. Please be mindful that you must escape the wildcard characters, otherwise they will be expanded by the shell and mmv won’t understand them.

The ‘#1′ in the ‘to’ pattern is a wildcard index. It matches the first wildcard found in the ‘from’ pattern. A ‘#2′ in the ‘to’ pattern would match the second wildcard and so on. In our example, we have only one wildcard (the asterisk), so we write a #1. And, the hash sign should be escaped as well. Also, you can enclose the patterns with quotes too.

You can even rename all files with a certain extension to a different extension. For example, to rename all **.txt** files to **.doc** file format in the current directory, simply run:
```
$ mmv \*.txt \#1.doc

```

Here is an another example. Let us say you have the following files.
```
$ ls
abcd1.txt abcd2.txt abcd3.txt

```

You want to replace the the first occurrence of **abc** with **xyz** in all files in the current directory. How would you do?

Simple.
```
$ mmv '*abc*' '#1xyz#2'

```

Please note that in the above example, I have enclosed the patterns in single quotes.

Let us check if “abc” is actually replaced with “xyz” or not.
```
$ ls
xyzd1.txt xyzd2.txt xyzd3.txt

```

See? The files **abcd1.txt** , **abcd2.txt** , and **abcd3.txt** have been renamed to **xyzd1.txt** , **xyzd2.txt** , and **xyzd3.txt**.

Another notable feature of mmv command is you can just print output instead of renaming the files using **-n** option like below.
```
$ mmv -n a\* b\#1
a1.txt -> b1.txt
a2.txt -> b2.txt
a3.txt -> b3.txt

```

This way you can simply verify what mmv command would actually do before renaming the files.

For more details, refer man pages.
```
$ man mmv

```

**Update:**

The **Thunar file manager** has built-in **bulk rename** option by default. If you’re using thunar, it much easier to rename files than using mmv command.

Thunar is available in the default repositories of most Linux distributions.

To install it on Arch-based systems, run:
```
$ sudo pacman -S thunar

```

On RHEL, CentOS:
```
$ sudo yum install thunar

```

On Fedora:
```
$ sudo dnf install thunar

```

On openSUSE:
```
$ sudo zypper install thunar

```

On Debian, Ubuntu, Linux Mint:
```
$ sudo apt-get install thunar

```

Once installed, you can launch bulk rename utility from menu or from the application launcher. To launch it from Terminal, use the following command:
```
$ thunar -B

```

This is how bulk rename looks like.

[![][1]][2]

Click the plus sign and choose the list of files you want to rename. Bulk rename can rename the name of the files, the suffix of the files or both the name and the suffix of the files. Thunar currently supports the following Bulk Renamers:

  * Insert Date or Time

  * Insert or Overwrite

  * Numbering

  * Remove Characters

  * Search & Replace

  * Uppercase / Lowercase




When you select one of these criteria from the picklist, you will see a preview of your changes in the New Name column, as shown in the below screenshot.

![][3]

Once you choose the criteria, click on **Rename Files** option to rename the files.

You can also open bulk renamer from within Thunar by selecting two or more files. After choosing the files, press F2 or right click and choose **Rename**.

And, that’s all for now. Hope this was useful. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-rename-multiple-files-at-once-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2018/06/bulk-rename.png
[3]:http://www.ostechnix.com/wp-content/uploads/2018/06/bulk-rename-1.png

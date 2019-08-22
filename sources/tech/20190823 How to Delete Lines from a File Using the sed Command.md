[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Delete Lines from a File Using the sed Command)
[#]: via: (https://www.2daygeek.com/linux-remove-delete-lines-in-file-sed-command/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How to Delete Lines from a File Using the sed Command
======

Sed command stands for Stream Editor, is used to perform basic text transformations in Linux.

sed is one of the important command, which plays major role for file manipulation. It can be used to delete or remove specific lines which matches a given pattern.

Also, it’s used to remove a particular line in a file.

It’s capable to delete expressions as well from a file, which can be identified by a specifying delimiter (such as a comma, tab, or space).

There are fifteen examples are listed in this article, which helps you to become a master in sed command.

If you understand and remember all these commands that can be useful in many ways. Also, it saves lot of time when you have some requirements to perform sed command.

**`Note:`**` ` Since it’s demonstration purpose so, i use sed command without `-i` option which prints the contents of the file on Linux terminal by removing the lines.

But, if you would like to remove the lines from the source file in real environment then use `-i` option with sed command.

To test this, i have created the sed-demo.txt file and added the following contents with line number for better understanding.

```
# cat sed-demo.txt

1 Linux Operating System
2 Unix Operating System
3 RHEL
4 Red Hat
5 Fedora
6 Arch Linux
7 CentOS
8 Debian
9 Ubuntu
10 openSUSE
```

### 1) How to Delete First Line from a File?

If you would like to delete first line from a file, use the following syntax.

**`N`**` ` denotes Nth line in a file and d option in sed command is used to delete a line.

**Syntax:**

```
sed 'Nd' file
```

The below sed command removes the first line in sed-demo.txt file.

```
# sed '1d' sed-demo.txt

2 Unix Operating System
3 RHEL
4 Red Hat
5 Fedora
6 Arch Linux
7 CentOS
8 Debian
9 Ubuntu
10 openSUSE
```

### 2) How to Delete Last Line from a File?

If you would like to delete first line from a file, use the following syntax.

The **`$`**` ` denotes the last line of a file.

The below sed command removes the last line in sed-demo.txt file.

```
# sed '$d' sed-demo.txt

1 Linux Operating System
2 Unix Operating System
3 RHEL
4 Red Hat
5 Fedora
6 Arch Linux
7 CentOS
8 Debian
9 Ubuntu
```

### 3) How to Delete Particular Line from a File?

The below sed command removes the third line in sed-demo.txt file.

```
# sed '3d' sed-demo.txt

1 Linux Operating System
2 Unix Operating System
4 Red Hat
5 Fedora
6 Arch Linux
7 CentOS
8 Debian
9 Ubuntu
10 openSUSE
```

### 4) How to Delete Range of Lines from a File?

The below sed command removes the lines ranging from 5 to 7.

```
# sed '5,7d' sed-demo.txt

1 Linux Operating System
2 Unix Operating System
3 RHEL
4 Red Hat
8 Debian
9 Ubuntu
10 openSUSE
```

### 5) How to Delete Multiple Lines from a File?

The sed command is capable to removes set of given lines.

In this example, the following sed command removes 1st line, 5th line, 9th line, and last line.

```
# sed '1d;5d;9d;$d' sed-demo.txt

2 Unix Operating System
3 RHEL
4 Red Hat
6 Arch Linux
7 CentOS
8 Debian
```

### 5a) How to Delete Lines Other Than the Specified Range from a File?

Use the following sed command to remove all the lines from the file only except specified range.

```
# sed '3,6!d' sed-demo.txt

3 RHEL
4 Red Hat
5 Fedora
6 Arch Linux
```

### 6) How to Delete Empty or Blank Lines from a File?

The following sed command removes the empty or blank lines from sed-demo.txt file.

```
# sed '/^$/d' sed-demo.txt

1 Linux Operating System
2 Unix Operating System
3 RHEL
4 Red Hat
5 Fedora
6 Arch Linux
7 CentOS
8 Debian
9 Ubuntu
10 openSUSE
```

### 7) How to Delete Lines That Contain a Pattern from a File?

The following sed command removes the lines in sed-demo.txt file which match the **`System`**` ` pattern.

```
# sed '/System/d' sed-demo.txt

3 RHEL
4 Red Hat
5 Fedora
6 Arch Linux
7 CentOS
8 Debian
9 Ubuntu
10 openSUSE
```

### 8) How to Delete Lines That Containing One of Multiple Strings from a File?

The following sed command removes the lines in sed-demo.txt file which match the **`System`**` ` or **`Linux`**` ` pattern.

```
# sed '/System\|Linux/d' sed-demo.txt

3 RHEL
4 Red Hat
5 Fedora
7 CentOS
8 Debian
9 Ubuntu
10 openSUSE
```

### 9) How to Delete Lines That Begin with Specified Character from a File?

The following sed command removes all the lines that start with given character.

To test this, i have created another file called sed-demo-1.txt with following contents.

```
# cat sed-demo-1.txt

Linux Operating System
Unix Operating System
RHEL
Red Hat
Fedora
debian
ubuntu
Arch Linux - 1
2 - Manjaro
3 4 5 6
```

The following sed command removes all the lines that start with character **`R`**` `.

```
# sed '/^R/d' sed-demo-1.txt

Linux Operating System
Unix Operating System
Fedora
debian
ubuntu
Arch Linux - 1
2 - Manjaro
3 4 5 6
```

The following sed command removes all the lines that start with character either **`R`**` ` or **`F`**` `.

```
# sed '/^[RF]/d' sed-demo-1.txt

Linux Operating System
Unix Operating System
debian
ubuntu
Arch Linux - 1
2 - Manjaro
3 4 5 6
```

### 10) How to Delete Lines That End with Specified Character from a File?

The following sed command removes all the lines that end with character **`m`**` `.

```
# sed '/m$/d' sed-demo.txt

3 RHEL
4 Red Hat
5 Fedora
6 Arch Linux
7 CentOS
8 Debian
9 Ubuntu
10 openSUSE
```

The following sed command removes all the lines that end with character either **`x`**` ` or **`m`**` `.

```
# sed '/[xm]$/d' sed-demo.txt

3 RHEL
4 Red Hat
5 Fedora
7 CentOS
8 Debian
9 Ubuntu
10 openSUSE
```

### 11) How to Delete All Lines That Start with Capital Letters

Use the following sed command to remove all the lines that start with entirely in capital letters.

```
# sed '/^[A-Z]/d' sed-demo-1.txt

debian
ubuntu
2 - Manjaro
3 4 5 6
```

### 12) How to Delete a Matching Pattern Lines with Specified Range in a File?

The below sed command removes the pattern **`Linux`**` ` only if it is present in the lines from 1 to 6.

```
# sed '1,6{/Linux/d;}' sed-demo.txt

2 Unix Operating System
3 RHEL
4 Red Hat
5 Fedora
7 CentOS
8 Debian
9 Ubuntu
10 openSUSE
```

### 13) How to Delete Pattern Matching Line and also the Next Line?

Use the following sed command to delete the line which containing the pattern ‘System’ and also the next line.

```
# sed '/System/{N;d;}' sed-demo.txt

3 RHEL
4 Red Hat
5 Fedora
6 Arch Linux
7 CentOS
8 Debian
9 Ubuntu
10 openSUSE
```

### 14) How Delete lines that contains Digits from a File?

The below sed command removes all the lines that contains digits.

```
# sed '/[0-9]/d' sed-demo-1.txt

Linux Operating System
Unix Operating System
RHEL
Red Hat
Fedora
debian
ubuntu
```

The below sed command removes all the lines Begin with digits.

```
# sed '/^[0-9]/d' sed-demo-1.txt

Linux Operating System
Unix Operating System
RHEL
Red Hat
Fedora
debian
ubuntu
Arch Linux - 1
```

The below sed command removes all the lines End with digits.

```
# sed '/[0-9]$/d' sed-demo-1.txt

Linux Operating System
Unix Operating System
RHEL
Red Hat
Fedora
debian
ubuntu
2 - Manjaro
```

### 15) How Delete lines that contains Alphabetic Characters from a File?

The below sed command removes all the lines that contains alphabetic characters.

```
# sed '/[A-Za-z]/d' sed-demo-1.txt

3 4 5 6
```
--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-remove-delete-lines-in-file-sed-command/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972

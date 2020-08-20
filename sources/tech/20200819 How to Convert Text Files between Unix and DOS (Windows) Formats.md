[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Convert Text Files between Unix and DOS (Windows) Formats)
[#]: via: (https://www.2daygeek.com/how-to-convert-text-files-between-unix-and-dos-windows-formats/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How to Convert Text Files between Unix and DOS (Windows) Formats
======

As a Linux administrator, you may have noticed some requests from developers to convert files from DOS format to Unix format, and vice versa.

This is because these files were created on a Windows system and copied to a Linux system for some reason.

It’s harmless, but some applications on the Linux system may not understand these new line of characters, so you need to convert them before using it.

DOS text files comes with carriage return (CR or \r) and line feed (LF or \n) pairs as their newline characters, whereas Unix text files only have line feed as their newline character.

There are many ways you can convert a DOS text file to a Unix format.

But I recommend using a special utility called **dos2unix** / **unix2dos** to convert text files between DOS and Unix formats.

  * **dos2unix:** To convert a text files from the DOS format to the Unix format.
  * **unix2dos:** To convert a text files from the Unix format to the DOS format.
  * **tr, awk and [sed Command][1]:** These can be used for the same purpose



You can easily identify whether the file is DOS format or Unix format using the od (octal dump) command as shown below.

```
# od -bc windows.txt
0000000 125 156 151 170 040 151 163 040 141 040 146 162 145 145 040 157
U n i x i s a f r e e o
0000020 160 145 156 163 157 165 162 143 145 040 157 160 145 162 141 164
p e n s o u r c e o p e r a t
0000040 151 156 147 040 163 171 163 164 145 155 015 012 123 165 160 145
i n g s y s t e m \r \n S u p e
0000060 162 040 143 157 155 160 165 164 145 162 163 040 141 162 145 040
r c o m p u t e r s a r e
0000100 162 165 156 156 151 156 147 040 157 156 040 125 116 111 130 015
r u n n i n g o n U N I X \r
0000120 012 071 065 045 040 157 146 040 167 145 142 163 151 164 145 163
\n 9 5 % o f w e b s i t e s
0000140 040 141 162 145 040 162 165 156 156 151 156 147 040 157 156 040
a r e r u n n i n g o n
0000160 114 151 156 165 170 040 117 123 015 012 101 156 171 164 150 151
L i n u x O S \r \n A n y t h i
0000200 156 147 040 143 141 156 040 142 145 040 144 157 156 145 040 157
n g c a n b e d o n e o
0000220 156 040 114 151 156 165 170 015 012
n L i n u x \r \n
0000231
```

The above output clearly shows that this is a DOS format file because it contains the escape sequence **`\r\n`**.

At the same time, when you print the file output on your terminal you will get the output below.

```
# cat windows.txt
Unix is a free opensource operating system
Super computers are running on UNIX
95% of websites are running on Linux OS
Anything can be done on Linux
```

### How to Install dos2unix on Linux

dos2unix can be easily installed from the distribution official repository.

For RHEL/CentOS 6/7 systems, use the **[yum command][2]** to install dos2unix.

```
$ sudo yum install -y dos2unix
```

For RHEL/CentOS 8 and Fedora systems, use the **[dnf command][3]** to install dos2unix.

```
$ sudo yum install -y dos2unix
```

For Debian based systems, use the **[apt command][4]** or **[apt-get command][5]** to install dos2unix.

```
$ sudo apt-get update
$ sudo apt-get install dos2unix
```

For openSUSE systems, use the **[zypper command][6]** to install dos2unix.

```
$ sudo zypper install -y dos2unix
```

### 1) How to Convert DOS file to UNIX format

The following command converts the “windows.txt” file from DOS to Unix format.

The modification of this file is to remove the “\r” from each line of the file.

```
# dos2unix windows.txt
dos2unix: converting file windows.txt to Unix format …
```

```
# cat windows.txt
0000000 125 156 151 170 040 151 163 040 141 040 146 162 145 145 040 157
U n i x i s a f r e e o
0000020 160 145 156 163 157 165 162 143 145 040 157 160 145 162 141 164
p e n s o u r c e o p e r a t
0000040 151 156 147 040 163 171 163 164 145 155 012 123 165 160 145 162
i n g s y s t e m \n S u p e r
0000060 040 143 157 155 160 165 164 145 162 163 040 141 162 145 040 162
c o m p u t e r s a r e r
0000100 165 156 156 151 156 147 040 157 156 040 125 116 111 130 012 071
u n n i n g o n U N I X \n 9
0000120 065 045 040 157 146 040 167 145 142 163 151 164 145 163 040 141
5 % o f w e b s i t e s a
0000140 162 145 040 162 165 156 156 151 156 147 040 157 156 040 114 151
r e r u n n i n g o n L i
0000160 156 165 170 040 117 123 012 101 156 171 164 150 151 156 147 040
n u x O S \n A n y t h i n g
0000200 143 141 156 040 142 145 040 144 157 156 145 040 157 156 040 114
c a n b e d o n e o n L
0000220 151 156 165 170 012
i n u x \n
0000225
```

The above command will overwrite the original file.

Use the following command if you want to keep the original file. This will save the converted output as a new file.

```
# dos2unix -n windows.txt unix.txt
dos2unix: converting file windows.txt to file unix.txt in Unix format …
```

### 1a) How to Convert DOS file to UNIX format Using tr Command

As discussed at the beginning of the article, you can use the tr command to convert the DOS file to Unix format as shown below.

```
Syntax: tr -d '\r' < source_file > output_file
```

The below tr command converts the “windows.txt” DOS file to Unix format file “unix.txt”.

```
# tr -d '\r' < windows.txt >unix.txt
```

**Make a note:** You can’t use the tr command to convert a file from Unix format to Windows (DOS).

### 1b) How to Convert DOS file to UNIX format Using awk Command

Use the following awk command format to convert a DOS file to a Unix format.

```
Syntax: awk '{ sub("\r$", ""); print }' source_file.txt > output_file.txt
```

The below awk command converts the “windows.txt” DOS file to Unix format file “unix.txt”.

```
# awk '{ sub("\r$", ""); print }' windows.txt > unix.txt
```

### 2) How to Convert UNIX file to DOS format

When you convert a file from UNIX to DOS format, it will add a carriage return (CR or \r) in each of the line.

```
# unix2dos unix.txt
unix2dos: converting file unix.txt to DOS format …
```

This command will keep the original file.

```
# unix2dos -n unix.txt windows.txt
unix2dos: converting file unix.txt to file windows.txt in DOS format …
```

### 2a) How to Convert UNIX file to DOS format Using awk Command

Use the following awk command format to convert UNIX file to DOS format.

```
Syntax: awk 'sub("$", "\r")' source_file.txt > output_file.txt
```

The below awk command converts the “unix.txt” file to the DOS format file “windows.txt”.

```
# awk 'sub("$", "\r")' unix.txt > windows.txt
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-convert-text-files-between-unix-and-dos-windows-formats/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/linux-sed-to-find-and-replace-string-in-files/
[2]: https://www.2daygeek.com/linux-yum-command-examples-manage-packages-rhel-centos-systems/
[3]: https://www.2daygeek.com/linux-dnf-command-examples-manage-packages-fedora-centos-rhel-systems/
[4]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[5]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[6]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/

[#]: collector: (lujun9972)
[#]: translator: (asche910)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Find and Replace a String in File Using the sed Command in Linux)
[#]: via: (https://www.2daygeek.com/linux-sed-to-find-and-replace-string-in-files/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How to Find and Replace a String in File Using the sed Command in Linux
======

When you are working on text files you may need to find and replace a string in the file.

Sed command is mostly used to replace the text in a file.

This can be done using the sed command and awk command in Linux.

In this tutorial, we will show you how to do this using the sed command and then show about the awk command.

### What is sed Command

Sed command stands for Stream Editor, It is used to perform basic text manipulation in Linux. It could perform various functions such as search, find, modify, insert or delete files.

Also, it’s performing complex regular expression pattern matching.

It can be used for the following purpose.

  * To find and replace matches with a given format.
  * To find and replace specific lines that match a given format.
  * To find and replace the entire line that matches the given format.
  * To search and replace two different patterns simultaneously.



The fifteen examples listed in this article will help you to master in the sed command.

If you want to remove a line from a file using the Sed command, go to the following article.

**`Note:`** Since this is a demonstration article, we use the sed command without the `-i` option, which removes lines and prints the contents of the file in the Linux terminal.

But if you want to remove lines from the source file in the real environment, use the `-i` option with the sed command.

Common Syntax for sed to replace a string.

```
sed -i 's/Search_String/Replacement_String/g' Input_File
```

First we need to understand sed syntax to do this. See details about it.

  * `sed:` It’s a Linux command.
  * `-i:` It’s one of the option for sed and what it does? By default sed print the results to the standard output. When you add this option with sed then it will edit files in place. A backup of the original file will be created when you add a suffix (For ex, -i.bak
  * `s:` The s is the substitute command.
  * `Search_String:` To search a given string or regular expression.
  * `Replacement_String:` The replacement string.
  * `g:` Global replacement flag. By default, the sed command replaces the first occurrence of the pattern in each line and it won’t replace the other occurrence in the line. But, all occurrences will be replaced when the replacement flag is provided
  * `/` Delimiter character.
  * `Input_File:` The filename that you want to perform the action.



Let us look at some examples of commonly used with sed command to search and convert text in files.

We have created the below file for demonstration purposes.

```
# cat sed-test.txt

1 Unix unix unix 23
2 linux Linux 34
3 linuxunix UnixLinux
linux /bin/bash CentOS Linux OS
Linux is free and opensource operating system
```

### 1) How to Find and Replace the “first” Event of the Pattern on a Line

The below sed command replaces the word **unix** with **linux** in the file. This only changes the first instance of the pattern on each line.

```
# sed 's/unix/linux/' sed-test.txt

1 Unix linux unix 23
2 linux Linux 34
3 linuxlinux UnixLinux
linux /bin/bash CentOS Linux OS
Linux is free and opensource operating system
```

### 2) How to Find and Replace the “Nth” Occurrence of the Pattern on a Line

Use the /1,/2,../n flags to replace the corresponding occurrence of a pattern in a line.

The below sed command replaces the second instance of the “unix” pattern with “linux” in a line.

```
# sed 's/unix/linux/2' sed-test.txt

1 Unix unix linux 23
2 linux Linux 34
3 linuxunix UnixLinux
linux /bin/bash CentOS Linux OS
Linux is free and opensource operating system
```

### 3) How to Search and Replace all Instances of the Pattern in a Line

The below sed command replaces all instances of the “unix” format with “Linux” on the line because “g” means a global replacement.

```
# sed 's/unix/linux/g' sed-test.txt

1 Unix linux linux 23
2 linux Linux 34
3 linuxlinux UnixLinux
linux /bin/bash CentOS Linux OS
Linux is free and opensource operating system
```

### 4) How to Find and Replace the Pattern for all Instances in a Line from the “Nth” Event

The below sed command replaces all the patterns from the “Nth” instance of a pattern in a line.

```
# sed 's/unix/linux/2g' sed-test.txt

1 Unix unix linux 23
2 linux Linux 34
3 linuxunix UnixLinux
linux /bin/bash CentOS Linux OS
Linux is free and opensource operating system
```

### 5) Search and Replace the pattern on a specific line number

You can able to replace the string on a specific line number. The below sed command replaces the pattern “unix” with “linux” only on the 3rd line.

```
# sed '3 s/unix/linux/' sed-test.txt

1 Unix unix unix 23
2 linux Linux 34
3 linuxlinux UnixLinux
linux /bin/bash CentOS Linux OS
Linux is free and opensource operating system
```

### 6) How to Find and Replace Pattern in a Range of Lines

You can specify the range of line numbers to replace the string.

The below sed command replaces the “Unix” pattern with “Linux” with lines 1 through 3.

```
# sed '1,3 s/unix/linux/' sed-test.txt

1 Unix linux unix 23
2 linux Linux 34
3 linuxlinux UnixLinux
linux /bin/bash CentOS Linux OS
Linux is free and opensource operating system
```

### 7) How to Find and Change the pattern in the Last Line

The below sed command allows you to replace the matching string only in the last line.

The below sed command replaces the “Linux” pattern with “Unix” only on the last line.

```
# sed '$ s/Linux/Unix/' sed-test.txt

1 Unix unix unix 23
2 linux Linux 34
3 linuxunix UnixLinux
linux /bin/bash CentOS Linux OS
Unix is free and opensource operating system
```

### 8) How to Find and Replace the Pattern with only Right Word in a Line

As you might have noticed, the substring “linuxunix” is replaced with “linuxlinux” in the 6th example. If you want to replace only the right matching word, use the word-boundary expression “\b” on both ends of the search string.

```
# sed '1,3 s/\bunix\b/linux/' sed-test.txt

1 Unix linux unix 23
2 linux Linux 34
3 linuxunix UnixLinux
linux /bin/bash CentOS Linux OS
Linux is free and opensource operating system
```

### 9) How to Search and Replaces the pattern with case insensitive

Everyone knows that Linux is case sensitive. To make the pattern match with case insensitive, use the I flag.

```
# sed 's/unix/linux/gI' sed-test.txt

1 linux linux linux 23
2 linux Linux 34
3 linuxlinux linuxLinux
linux /bin/bash CentOS Linux OS
Linux is free and opensource operating system
```

### 10) How to Find and Replace a String that Contains the Delimiter Character

When you search and replace for a string with the delimiter character, we need to use the backslash “\” to escape the slash.

In this example, we are going to replaces the “/bin/bash” with “/usr/bin/fish”.

```
# sed 's/\/bin\/bash/\/usr\/bin\/fish/g' sed-test.txt

1 Unix unix unix 23
2 linux Linux 34
3 linuxunix UnixLinux
linux /usr/bin/fish CentOS Linux OS
Linux is free and opensource operating system
```

The above sed command works as expected, but it looks bad. To simplify this, most of the people will use the vertical bar “|”. So, I advise you to go with it.

```
# sed 's|/bin/bash|/usr/bin/fish/|g' sed-test.txt

1 Unix unix unix 23
2 linux Linux 34
3 linuxunix UnixLinux
linux /usr/bin/fish/ CentOS Linux OS
Linux is free and opensource operating system
```

### 11) How to Find and Replaces Digits with a Given Pattern

Similarly, digits can be replaced with pattern. The below sed command replaces all digits with “[0-9]” “number” pattern.

```
# sed 's/[0-9]/number/g' sed-test.txt

number Unix unix unix numbernumber
number linux Linux numbernumber
number linuxunix UnixLinux
linux /bin/bash CentOS Linux OS
Linux is free and opensource operating system
```

### 12) How to Find and Replace only two Digit Numbers with Pattern

If you want to replace the two digit numbers with the pattern, use the sed command below.

```
# sed 's/\b[0-9]\{2\}\b/number/g' sed-test.txt

1 Unix unix unix number
2 linux Linux number
3 linuxunix UnixLinux
linux /bin/bash CentOS Linux OS
Linux is free and opensource operating system
```

### 13) How to Print only Replaced Lines with the sed Command

If you want to display only the changed lines, use the below sed command.

  * p – It prints the replaced line twice on the terminal.
  * n – It suppresses the duplicate rows generated by the “p” flag.



```
# sed -n 's/Unix/Linux/p' sed-test.txt

1 Linux unix unix 23
3 linuxunix LinuxLinux
```

### 14) How to Run Multiple sed Commands at Once

The following sed command detect and replaces two different patterns simultaneously.

The below sed command searches for “linuxunix” and “CentOS” pattern, replacing them with “LINUXUNIX” and “RHEL8” at a time.

```
# sed -e 's/linuxunix/LINUXUNIX/g' -e 's/CentOS/RHEL8/g' sed-test.txt

1 Unix unix unix 23
2 linux Linux 34
3 LINUXUNIX UnixLinux
linux /bin/bash RHEL8 Linux OS
Linux is free and opensource operating system
```

The following sed command search for two different patterns and replaces them with one string at a time.

The below sed command searches for “linuxunix” and “CentOS” pattern, replacing them with “Fedora30” at a time.

```
# sed -e 's/\(linuxunix\|CentOS\)/Fedora30/g' sed-test.txt

1 Unix unix unix 23
2 linux Linux 34
3 Fedora30 UnixLinux
linux /bin/bash Fedora30 Linux OS
Linux is free and opensource operating system
```

### 15) How to Find and Replace the Entire Line if the Given Pattern Matches

If the pattern matches, you can use the sed command to replace the entire line with the new line. This can be done using the “C” flag.

```
# sed '/OS/ c New Line' sed-test.txt

1 Unix unix unix 23
2 linux Linux 34
3 linuxunix UnixLinux
New Line
Linux is free and opensource operating system
```

### 16) How to Search and Replace lines that Matches a Pattern

You can specify a pattern for the sed command to fit on a line. In the event of pattern matching, the sed command searches for the string to be replaced.

The below sed command first looks for lines that have the “OS” pattern, then replaces the word “Linux” with “ArchLinux”.

```
# sed '/OS/ s/Linux/ArchLinux/' sed-test.txt

1 Unix unix unix 23
2 linux Linux 34
3 linuxunix UnixLinux
linux /bin/bash CentOS ArchLinux OS
Linux is free and opensource operating system
```
--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-sed-to-find-and-replace-string-in-files/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[Asche910](https://github.com/asche910)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972

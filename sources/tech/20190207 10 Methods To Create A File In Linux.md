[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (10 Methods To Create A File In Linux)
[#]: via: (https://www.2daygeek.com/linux-command-to-create-a-file/)
[#]: author: (Vinoth Kumar https://www.2daygeek.com/author/vinoth/)

10 Methods To Create A File In Linux
======

As we already know that everything is a file in Linux, that includes device as well.

Linux admin should be performing the file creation activity multiple times (It may 20 times or 50 times or more than that, it’s depends upon their environment) in a day.

Navigate to the following URL, if you would like to **[create a file in a specific size in Linux][1]**.

It’s very important. how efficiently are we creating a file. Why i’m saying efficient? there is a lot of benefit if you know the efficient way to perform an activity.

It will save you a lot of time. You can spend those valuable time on other important or major tasks, where you want to spend some more time instead of doing that in hurry.

Here i’m including multiple ways to create a file in Linux. I advise you to choose few which is easy and efficient for you to perform your activity.

You no need to install any of the following commands because all these commands has been installed as part of Linux core utilities except nano command.

It can be done using the following 6 methods.

  * **`Redirect Symbol (>):`** Standard redirect symbol allow us to create a 0KB empty file in Linux.
  * **`touch:`** touch command can create a 0KB empty file if does not exist.
  * **`echo:`** echo command is used to display line of text that are passed as an argument.
  * **`printf:`** printf command is used to display the given text on the terminal window.
  * **`cat:`** It concatenate files and print on the standard output.
  * **`vi/vim:`** Vim is a text editor that is upwards compatible to Vi. It can be used to edit all kinds of plain text.
  * **`nano:`** nano is a small and friendly editor. It copies the look and feel of Pico, but is free software.
  * **`head:`** head is used to print the first part of files..
  * **`tail:`** tail is used to print the last part of files..
  * **`truncate:`** truncate is used to shrink or extend the size of a file to the specified size.



### How To Create A File In Linux Using Redirect Symbol (>)?

Standard redirect symbol allow us to create a 0KB empty file in Linux. Basically it used to redirect the output of a command to a new file. When you use redirect symbol without a command then it’s create a file.

But it won’t allow you to input any text while creating a file. However, it’s very simple and will be useful for lazy admins. To do so, simple enter the redirect symbol followed by the filename which you want.

```
$ > daygeek.txt
```

Use the ls command to check the created file.

```
$ ls -lh daygeek.txt
-rw-rw-r-- 1 daygeek daygeek 0 Feb 4 02:00 daygeek.txt
```

### How To Create A File In Linux Using touch Command?

touch command is used to update the access and modification times of each FILE to the current time.

It’s create a new file if does not exist. Also, touch command doesn’t allow us to enter any text while creating a file. By default it creates a 0KB empty file.

```
$ touch daygeek1.txt
```

Use the ls command to check the created file.

```
$ ls -lh daygeek1.txt
-rw-rw-r-- 1 daygeek daygeek 0 Feb 4 02:02 daygeek1.txt
```

### How To Create A File In Linux Using echo Command?

echo is a built-in command found in most operating systems. It is frequently used in scripts, batch files, and as part of individual commands to insert a text.

This is nice command that allow users to input a text while creating a file. Also, it allow us to append the text in the next time.

```
$ echo "2daygeek.com is a best Linux blog to learn Linux" > daygeek2.txt
```

Use the ls command to check the created file.

```
$ ls -lh daygeek2.txt
-rw-rw-r-- 1 daygeek daygeek 49 Feb 4 02:04 daygeek2.txt
```

To view the content from the file, use the cat command.

```
$ cat daygeek2.txt
2daygeek.com is a best Linux blog to learn Linux
```

If you would like to append the content in the same file, use the double redirect Symbol (>>).

```
$ echo "It's FIVE years old blog" >> daygeek2.txt
```

You can view the appended content from the file using cat command.

```
$ cat daygeek2.txt
2daygeek.com is a best Linux blog to learn Linux
It's FIVE years old blog
```

### How To Create A File In Linux Using printf Command?

printf command also works in the same way like how echo command works.

printf command in Linux is used to display the given string on the terminal window. printf can have format specifiers, escape sequences or ordinary characters.

```
$ printf "2daygeek.com is a best Linux blog to learn Linux\n" > daygeek3.txt
```

Use the ls command to check the created file.

```
$ ls -lh daygeek3.txt
-rw-rw-r-- 1 daygeek daygeek 48 Feb 4 02:12 daygeek3.txt
```

To view the content from the file, use the cat command.

```
$ cat daygeek3.txt
2daygeek.com is a best Linux blog to learn Linux
```

If you would like to append the content in the same file, use the double redirect Symbol (>>).

```
$ printf "It's FIVE years old blog\n" >> daygeek3.txt
```

You can view the appended content from the file using cat command.

```
$ cat daygeek3.txt
2daygeek.com is a best Linux blog to learn Linux
It's FIVE years old blog
```

### How To Create A File In Linux Using cat Command?

cat stands for concatenate. It is very frequently used in Linux to reads data from a file.

cat is one of the most frequently used commands on Unix-like operating systems. It’s offer three functions which is related to text file such as display content of a file, combine multiple files into the single output and create a new file.

```
$ cat > daygeek4.txt
2daygeek.com is a best Linux blog to learn Linux
It's FIVE years old blog
```

Use the ls command to check the created file.

```
$ ls -lh daygeek4.txt
-rw-rw-r-- 1 daygeek daygeek 74 Feb 4 02:18 daygeek4.txt
```

To view the content from the file, use the cat command.

```
$ cat daygeek4.txt
2daygeek.com is a best Linux blog to learn Linux
It's FIVE years old blog
```

If you would like to append the content in the same file, use the double redirect Symbol (>>).

```
$ cat >> daygeek4.txt
This website is maintained by Magesh M, It's licensed under CC BY-NC 4.0.
```

You can view the appended content from the file using cat command.

```
$ cat daygeek4.txt
2daygeek.com is a best Linux blog to learn Linux
It's FIVE years old blog
This website is maintained by Magesh M, It's licensed under CC BY-NC 4.0.
```

### How To Create A File In Linux Using vi/vim Command?

Vim is a text editor that is upwards compatible to Vi. It can be used to edit all kinds of plain text. It is especially useful for editing programs.

There are a lot of features are available in vim to edit a single file with the command.

```
$ vi daygeek5.txt

2daygeek.com is a best Linux blog to learn Linux
It's FIVE years old blog
```

Use the ls command to check the created file.

```
$ ls -lh daygeek5.txt
-rw-rw-r-- 1 daygeek daygeek 75 Feb 4 02:23 daygeek5.txt
```

To view the content from the file, use the cat command.

```
$ cat daygeek5.txt
2daygeek.com is a best Linux blog to learn Linux
It's FIVE years old blog
```

### How To Create A File In Linux Using nano Command?

Nano’s is a another editor, an enhanced free Pico clone. nano is a small and friendly editor. It copies the look and feel of Pico, but is free software, and implements several features that Pico lacks, such as: opening multiple files, scrolling per line, undo/redo, syntax coloring, line numbering, and soft-wrapping overlong lines.

```
$ nano daygeek6.txt

2daygeek.com is a best Linux blog to learn Linux
It's FIVE years old blog
This website is maintained by Magesh M, It's licensed under CC BY-NC 4.0.
```

Use the ls command to check the created file.

```
$ ls -lh daygeek6.txt
-rw-rw-r-- 1 daygeek daygeek 148 Feb 4 02:26 daygeek6.txt
```

To view the content from the file, use the cat command.

```
$ cat daygeek6.txt
2daygeek.com is a best Linux blog to learn Linux
It's FIVE years old blog
This website is maintained by Magesh M, It's licensed under CC BY-NC 4.0.
```

### How To Create A File In Linux Using head Command?

head command is used to output the first part of files. By default it prints the first 10 lines of each FILE to standard output. With more than one FILE, precede each with a header giving the file name.

```
$ head -c 0K /dev/zero > daygeek7.txt
```

Use the ls command to check the created file.

```
$ ls -lh daygeek7.txt
-rw-rw-r-- 1 daygeek daygeek 0 Feb 4 02:30 daygeek7.txt
```

### How To Create A File In Linux Using tail Command?

tail command is used to output the last part of files. By default it prints the first 10 lines of each FILE to standard output. With more than one FILE, precede each with a header giving the file name.

```
$ tail -c 0K /dev/zero > daygeek8.txt
```

Use the ls command to check the created file.

```
$ ls -lh daygeek8.txt
-rw-rw-r-- 1 daygeek daygeek 0 Feb 4 02:31 daygeek8.txt
```

### How To Create A File In Linux Using truncate Command?

truncate command is used to shrink or extend the size of a file to the specified size.

```
$ truncate -s 0K daygeek9.txt
```

Use the ls command to check the created file.

```
$ ls -lh daygeek9.txt
-rw-rw-r-- 1 daygeek daygeek 0 Feb 4 02:37 daygeek9.txt
```

I have performed totally 10 commands in this article to test this. All together in the single output.

```
$ ls -lh daygeek*
-rw-rw-r-- 1 daygeek daygeek 0 Feb 4 02:02 daygeek1.txt
-rw-rw-r-- 1 daygeek daygeek 74 Feb 4 02:07 daygeek2.txt
-rw-rw-r-- 1 daygeek daygeek 74 Feb 4 02:15 daygeek3.txt
-rw-rw-r-- 1 daygeek daygeek 148 Feb 4 02:20 daygeek4.txt
-rw-rw-r-- 1 daygeek daygeek 75 Feb 4 02:23 daygeek5.txt
-rw-rw-r-- 1 daygeek daygeek 148 Feb 4 02:26 daygeek6.txt
-rw-rw-r-- 1 daygeek daygeek 148 Feb 4 02:32 daygeek7.txt
-rw-rw-r-- 1 daygeek daygeek 148 Feb 4 02:32 daygeek8.txt
-rw-rw-r-- 1 daygeek daygeek 148 Feb 4 02:38 daygeek9.txt
-rw-rw-r-- 1 daygeek daygeek 0 Feb 4 02:00 daygeek.txt
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-command-to-create-a-file/

作者：[Vinoth Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/vinoth/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/create-a-file-in-specific-certain-size-linux/

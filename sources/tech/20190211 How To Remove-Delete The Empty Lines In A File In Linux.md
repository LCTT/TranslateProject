[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Remove/Delete The Empty Lines In A File In Linux)
[#]: via: (https://www.2daygeek.com/remove-delete-empty-lines-in-a-file-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How To Remove/Delete The Empty Lines In A File In Linux
======

Some times you may wants to remove or delete the empty lines in a file in Linux.

If so, you can use the one of the below method to achieve it.

It can be done in many ways but i have listed simple methods in the article.

You may aware of that grep, awk and sed commands are specialized for textual data manipulation.

Navigate to the following URL, if you would like to read more about these kind of topics. For **[creating a file in specific size in Linux][1]** multiple ways, for **[creating a file in Linux][2]** multiple ways and for **[removing a matching string from a file in Linux][3]**.

These are fall in advanced commands category because these are used in most of the shell script to do required things.

It can be done using the following 5 methods.

  * **`sed Command:`** Stream editor for filtering and transforming text.
  * **`grep Command:`** Print lines that match patterns.
  * **`cat Command:`** It concatenate files and print on the standard output.
  * **`tr Command:`** Translate or delete characters.
  * **`awk Command:`** The awk utility shall execute programs written in the awk programming language, which is specialized for textual data manipulation.
  * **`perl Command:`** Perl is a programming language specially designed for text editing.



To test this, i had already created the file called `2daygeek.txt` with some texts and empty lines. The details are below.

```
$ cat 2daygeek.txt
2daygeek.com is a best Linux blog to learn Linux.

It's FIVE years old blog.

This website is maintained by Magesh M, it's licensed under CC BY-NC 4.0.

He got two GIRL babys.

Her names are Tanisha & Renusha.
```

Now everything is ready and i’m going to test this in multiple ways.

### How To Remove/Delete The Empty Lines In A File In Linux Using sed Command?

Sed is a stream editor. A stream editor is used to perform basic text transformations on an input stream (a file or input from a pipeline).

```
$ sed '/^$/d' 2daygeek.txt
2daygeek.com is a best Linux blog to learn Linux.
It's FIVE years old blog.
This website is maintained by Magesh M, it's licensed under CC BY-NC 4.0.
He got two GIRL babes.
Her names are Tanisha & Renusha.
```

Details are follow:

  * **`sed:`** It’s a command
  * **`//:`** It holds the searching string.
  * **`^:`** Matches start of string.
  * **`$:`** Matches end of string.
  * **`d:`** Delete the matched string.
  * **`2daygeek.txt:`** Source file name.



### How To Remove/Delete The Empty Lines In A File In Linux Using grep Command?

grep searches for PATTERNS in each FILE. PATTERNS is one or patterns separated by newline characters, and grep prints each line that matches a pattern.

```
$ grep . 2daygeek.txt
or
$ grep -Ev "^$" 2daygeek.txt
or
$ grep -v -e '^$' 2daygeek.txt
2daygeek.com is a best Linux blog to learn Linux.
It's FIVE years old blog.
This website is maintained by Magesh M, it's licensed under CC BY-NC 4.0.
He got two GIRL babes.
Her names are Tanisha & Renusha.
```

Details are follow:

  * **`grep:`** It’s a command
  * **`.:`** Replaces any character.
  * **`^:`** matches start of string.
  * **`$:`** matches end of string.
  * **`E:`** For extended regular expressions pattern matching.
  * **`e:`** For regular expressions pattern matching.
  * **`v:`** To select non-matching lines from the file.
  * **`2daygeek.txt:`** Source file name.



### How To Remove/Delete The Empty Lines In A File In Linux Using awk Command?

The awk utility shall execute programs written in the awk programming language, which is specialized for textual data manipulation. An awk program is a sequence of patterns and corresponding actions.

```
$ awk NF 2daygeek.txt
or
$ awk '!/^$/' 2daygeek.txt
or
$ awk '/./' 2daygeek.txt
2daygeek.com is a best Linux blog to learn Linux.
It's FIVE years old blog.
This website is maintained by Magesh M, it's licensed under CC BY-NC 4.0.
He got two GIRL babes.
Her names are Tanisha & Renusha.
```

Details are follow:

  * **`awk:`** It’s a command
  * **`//:`** It holds the searching string.
  * **`^:`** matches start of string.
  * **`$:`** matches end of string.
  * **`.:`** Replaces any character.
  * **`!:`** Delete the matched string.
  * **`2daygeek.txt:`** Source file name.



### How To Delete The Empty Lines In A File In Linux using Combination of cat And tr Command?

cat stands for concatenate. It is very frequently used in Linux to reads data from a file.

cat is one of the most frequently used commands on Unix-like operating systems. It’s offer three functions which is related to text file such as display content of a file, combine multiple files into the single output and create a new file.

Translate, squeeze, and/or delete characters from standard input, writing to standard output.

```
$ cat 2daygeek.txt | tr -s '\n'
2daygeek.com is a best Linux blog to learn Linux.
It's FIVE years old blog.
This website is maintained by Magesh M, it's licensed under CC BY-NC 4.0.
He got two GIRL babes.
Her names are Tanisha & Renusha.
```

Details are follow:

  * **`cat:`** It’s a command
  * **`tr:`** It’s a command
  * **`|:`** Pipe symbol. It pass first command output as a input to another command.
  * **`s:`** Replace each sequence of a repeated character that is listed in the last specified SET.
  * **`\n:`** To add a new line.
  * **`2daygeek.txt:`** Source file name.



### How To Remove/Delete The Empty Lines In A File In Linux Using perl Command?

Perl stands in for “Practical Extraction and Reporting Language”. Perl is a programming language specially designed for text editing. It is now widely used for a variety of purposes including Linux system administration, network programming, web development, etc.

```
$ perl -ne 'print if /\S/' 2daygeek.txt
2daygeek.com is a best Linux blog to learn Linux.
It's FIVE years old blog.
This website is maintained by Magesh M, it's licensed under CC BY-NC 4.0.
He got two GIRL babes.
Her names are Tanisha & Renusha.
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/remove-delete-empty-lines-in-a-file-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/create-a-file-in-specific-certain-size-linux/
[2]: https://www.2daygeek.com/linux-command-to-create-a-file/
[3]: https://www.2daygeek.com/empty-a-file-delete-contents-lines-from-a-file-remove-matching-string-from-a-file-remove-empty-blank-lines-from-a-file/

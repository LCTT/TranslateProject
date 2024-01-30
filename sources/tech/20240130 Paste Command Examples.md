[#]: subject: "Paste Command Examples"
[#]: via: "https://itsfoss.com/paste-command/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lujun9972/lctt-scripts-1705972010"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Paste Command Examples
======

No, it does not paste the copied text or items 😲

Surprised? I, too, was shocked when I got to know that the paste command in Linux is used to merge lines from multiple files parallelly.

In simple terms, if you have two files each containing a list of items, then you can use the paste command to merge both of them, and you end up getting data in table format.

It is similar to the cat command, which is used to concatenate files vertically. Here, the command appends the data separated by Tab as the default delimiter.

Now that you have an idea, let me walk you through how you can use the paste command with practical examples and, at last, I shall also share some practice questions.

### Here's How to use the paste command

To get the most out of any command, it is recommended to get started with the command syntax.

Here's a simple command syntax that you need to follow to use the paste command:

```

    paste [option] [files]

```

Here,

  * `[option]`: it is used to tweak the default behavior of the paste command such as when you use the `-s` option, it will stack the information of two files vertically.
  * `[files]`: here's where you append two or more files to merge them.



Unlike other commands, you are not given a long list of options, so here are the list of options available with the paste command:

Option | Description
---|---
`-d` | Specifies the delimiter to use between columns (default is a tab).
`-s` | Concatenates lines horizontally.
`--help` | Displays a summary of options.
`--version` | Outputs version information for the paste command.

Now, let's take a look at some examples of using the paste command.

#### 1\. Display the file content

Almost every Linux user uses [the cat command][1] to print the file content to standard output, but the paste command can do the same for you.

All you have to do is append the filename to the paste command, and it will get the job done:

```

    paste Filename

```

![][2]

#### 2\. Merge two files

To merge two files using the paste command, all you have to do is append the filenames separated by space (just like when using the [mv command][3]):

```

    paste File1 File2

```

For example, here, I used the paste command over two files `fruits` and `prices` so you can have a better idea of its behavior:

```

    paste fruits prices

```

![][4]

As you can see, when I executed the paste command over two files, it gave me an output showing two files were merged.

#### 3\. Save the output in the file

In the previous example, when I used the paste command, it only merged two files for the sake of the output, and the combined data was not saved.

You may come across a need to save the output in a file and in that case, you can [redirect the output to the file][5] using redirection as shown here:

```

    paste File1 File2 > Filename_to_save

```

Here's how I saved the output of the paste command, using the redirection:

```

    paste fruits prices > Fresh_prices

```

![][6]

#### 4\. Merge files horizontally

Using the paste command, you can also merge files horizontally.

To merge files horizontally, all you have to do is use the `-s` flag as shown:

```

    paste -s File1 File2

```

![][7]

#### 5\. Use delimiter while merging files

When you merge files using the paste command, it uses a tab between two columns by default, but you can specify your favorite delimiter using the `-d` option:

```

    paste -d 'delimeter' File1 File 2

```

For example, here, I've used `-` as a delimiter:

```

    paste -d '-' fruits prices

```

![][8]

You can also use a delimiter while merging files horizontally by utilizing the `-d` and `-s` flag as shown here:

```

    paste -d 'delimeter' -s File1 File2

```

![][9]

While merging more than one file, you can also use multiple delimiters as shown here:

```

    paste -d 'Delimiter1Delimiter2' File1 File2 File3

```

![][10]

### Practice questions 📓

To get better at using any command, it is important to practice the command. This is the reason you'll find plenty of exercise questions in our recent articles for commands.

Here's what you can try doing:

  1. How do you create a new file and write new lines using the paste command? (Hint: syntax is similar to the cat command)
  2. How do you sort the output of the paste command alphabetically? (Hint: pipe [the sort command][11] with the pipe command)
  3. Print only the first 3 lines while using the paste command to merge two files (Hint: pipe it with [the cut command][12])
  4. Save a copy of the merged output to a file while also displaying it. (Hint: pipe it with [the tee command][13])



If you encounter any difficulty while solving the practice questions, you can reach out to us through the comments section or post your doubts in [our community forum.][14]

### Wrapping Up

In this tutorial, we went through the basic syntax, a list of available options, practical examples, and practice questions for the paste command.

You might like some other examples for the same command on our Linux Handbook blog:

![][15]

What should I cover next? Any specific command that you want to dive into? Please let me know your thoughts in the comments.

I hope you will find this guide helpful 😊

--------------------------------------------------------------------------------

via: https://itsfoss.com/paste-command/

作者：[Sagar Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lujun9972
[1]: https://linuxhandbook.com/cat-command/
[2]: https://itsfoss.com/content/images/2024/01/Use-the-paste-command-to-print-the-file-content.png
[3]: https://itsfoss.com/mv-command/
[4]: https://itsfoss.com/content/images/2024/01/Use-paste-command-to-merge-two-files-in-linux.png
[5]: https://linuxhandbook.com/command-output-to-file/
[6]: https://itsfoss.com/content/images/2024/01/Save-output-of-the-paste-command-using-redirection-in-Linux.png
[7]: https://itsfoss.com/content/images/2024/01/Merge-files-horintally-using-the-paste-command.png
[8]: https://itsfoss.com/content/images/2024/01/use-delimiter-in-the-paste-command.png
[9]: https://itsfoss.com/content/images/2024/01/Add-delimiter-while-merging-files-horizontally-in-the-paste-command.png
[10]: https://itsfoss.com/content/images/2024/01/use-multiple-delimiters-with-the-paste-command.png
[11]: https://linuxhandbook.com/sort-command/
[12]: https://linuxhandbook.com/cut-command/
[13]: https://linuxhandbook.com/tee-command/
[14]: https://itsfoss.community/
[15]: https://linuxhandbook.com/content/images/size/w256h256/2021/08/Linux-Handbook-New-Logo.png

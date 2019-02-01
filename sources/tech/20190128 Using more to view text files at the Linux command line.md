[#]: collector: (lujun9972)
[#]: translator: ( dianbanjiu )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using more to view text files at the Linux command line)
[#]: via: (https://opensource.com/article/19/1/more-text-files-linux)
[#]: author: (Scott Nesbitt https://opensource.com/users/scottnesbitt)

Using more to view text files at the Linux command line
======
Text files and Linux go hand in hand. Or so it seems. But how you view those text files depends on what tools you're comfortable with.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/terminal_command_linux_desktop_code.jpg?itok=p5sQ6ODE)

There are a number of utilities that enable you to view text files when you're at the command line. One of them is [**more**][1].

**more** is similar to another tool I wrote about called **[less][2]**. The main difference is that **more** only allows you to move forward in a file.

While that may seem limiting, it has some useful features that are good to know about. Let's take a quick look at what **more** can do and how to use it.

### The basics

Let's say you have a text file and want to read it at the command line. Just open the terminal, pop into the directory that contains the file, and type this command:

```
more <filename>
```

For example, **more jekyll-article.md**.

![](https://opensource.com/sites/default/files/uploads/more-viewing-file.png)

Press the Spacebar on your keyboard to move through the file or press **q** to quit.

If you want to search for some text in the file, press the **/** key followed by the word or term you want to find. For example, to find the phrase terminal, type:

```
/terminal
```

![](https://opensource.com/sites/default/files/uploads/more-searching.png)

Search is case-sensitive. Typing Terminal isn't the same as typing terminal.

### Using more with other utilities

You can pipe text from other command line utilities into **more**. Why do that? Because sometimes the text that those tools spew out spans more than one page.

To do that, type the command and any options, followed by the pipe symbol ( **|** ), followed by **more**. For example, let's say you have a directory that has a large number of files in it. You can use **more** with the **ls** command to get a full view of the contents of the directory:

```
ls | more
```

![](https://opensource.com/sites/default/files/uploads/more-with_ls_cmd.png)

You can also use **more** with the **grep** command to find text in multiple files. In this example, I use **grep** to find the text productivity in multiple source files for my articles:

```
**grep ‘productivity’ core.md Dict.md lctt2014.md lctt2016.md lctt2018.md README.md | more**
```

![](https://opensource.com/sites/default/files/uploads/more-with_grep_cmd.png)

Another utility you can combine with **more** is **ps** (which lists processes that are running on your system). Again, this comes in handy when there are a large number of processes running on your system and you need a view of all of them—for example, to find one that you need to kill. To do that, use this command:

```
ps -u scott | more
```

Note that you'd replace scott with your username.

![](https://opensource.com/sites/default/files/uploads/more-with_ps_cmd.png)

As I mentioned at the beginning of this article, **more** is easy to use. It's definitely not as flexible as its cousin **less** , but it can be useful to know.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/more-text-files-linux

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/More_(command)
[2]: https://opensource.com/article/18/4/using-less-view-text-files-command-line

cvsher 翻译中
Command Line Tuesdays – Part Four
================================================================================
Heya there geekos! New week, new adventure!

Today, we’ll learn how to manipulate files using four fairly simple commands. So let’s begin!

Before we start with the commands themselves, let’s take a quick stop at a section called…

### …wildcards: ###

Copying, pasting files, creating directories etc. is probably easier using graphical tools, but, if you’d like to perform more complicated tasks, like copying only .html files from one folder to another, and only copying files that don’t exist in the destination directory, CLI just might come in handy. So, to get back to wildcards, it’s basically a shell feature, a set of special characters, that helps you pick out a set of files based on some simple rules (which characters appear in a file name, how many characters, upper/lower case characters etc.). Here’s the table (click to enlarge):

![](https://news.opensuse.org/wp-content/uploads/2014/07/Screenshot-08.-07.-2014-125946.png)

And here are a few examples mr Shotts posted in a table of usage also click to enlarge: 

![](https://news.opensuse.org/wp-content/uploads/2014/07/Screenshot-08.-07.-2014-125959.png)

If you use a command with an argument containing a filename, you can use wildcards with no problem.

### cp ###

cp is used to copy files or directories. You can use it pretty easily: navigate to the folder you’d like to copy the files from and to, and simply do

`cp file1 file2` – to copy single files,

or

`cp file1 file2 … directory` – to copy files from your current working directory to the directory specified. Here’s mr Shotts’ table with numerous options:

![](https://news.opensuse.org/wp-content/uploads/2014/07/Screenshot-08.-07.-2014-134248.png)

### mv ###

mv is the second command of the day. We can use mv to rename a file or directory, or to move a file or directory. We can use it this way:

`mv filename1 filename2` – if we want to rename filename1 to filename2

or

`mv file directory` – if we want to move file to directory.

Here’s a table of few examples of mv with options used with it:

![](https://news.opensuse.org/wp-content/uploads/2014/07/Screenshot-08.-07.-2014-133515.png)

### rm ###

The rm command removes/deletes files and directories. Usage is pretty straightforward:

    rm file

or

    rm -r directory

And here’s also a table with some additional options:

![](https://news.opensuse.org/wp-content/uploads/2014/07/Screenshot-08.-07.-2014-133529.png)

But, do be careful when using rm as there is no undelete option, so be extra careful not to inflict unwanted damage to your system!

### mkdir ###

mkdir is used for creating directories. It’s the most simple command of the day. Simply:

    mkdir directory

Voila, directory created!

So this is it for this week, geekos. Hope to see you next tuesday! All the best and kind regards,

--------------------------------------------------------------------------------

via: https://news.opensuse.org/2014/07/08/command-line-tuesdays-part-four/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

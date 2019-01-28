[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Book Review: Fundamentals of Linux)
[#]: via: (https://itsfoss.com/fundamentals-of-linux-book-review)
[#]: author: (John Paul https://itsfoss.com/author/john/)

Book Review: Fundamentals of Linux
======

There are many great books that cover the basics of what Linux is and how it works. Today, I will be taking a look at one such book. Today, the subject of our discussion is [Fundamentals of Linux][1] by Oliver Pelz and is published by [PacktPub][2].

[Oliver Pelz][3] has over ten years of experience as a software developer and a system administrator. He holds a degree in bioinformatics.

### What is the book ‘Fundamentals of Linux’ about?

![Fundamental of Linux books][4]

As can be guessed from the title, the goal of Fundamentals of Linux is to give the reader a strong foundation from which to learn about the Linux command line. The book is a little over two hundred pages long, so it only focuses on teaching the everyday tasks and problems that users commonly encounter. The book is designed for readers who want to become Linux administrators.

The first chapter starts out by giving an overview of virtualization. From there the author instructs how to create a virtual instance of [CentOS][5] in [VirtualBox][6], how to clone it, and how to use snapshots. You will also learn how to connect to the virtual machines via SSH.

The second chapter covers the basics of the Linux command line. This includes shell globbing, shell expansion, how to work with file names that contain spaces or special characters. It also explains how to interpret a command’s manual page, as well as, how to use `sed`, `awk`, and to navigate the Linux file system.

The third chapter takes a more in-depth look at the Linux file system. You will learn how files are linked in Linux and how to search for them. You will also be given an overview of users, groups and file permissions. Since the chapter focuses on interacting with files, it tells how to read text files from the command line, as well as, an overview of how to use the VIM editor.

Chapter four focuses on using the command line. It covers important commands, such as `cat`, `sort`, `awk`. `tee`, `tar`, `rsync`, `nmap`, `htop` and more. You will learn what processes are and how they communicate with each other. This chapter also includes an introduction to Bash shell scripting.

The fifth and final chapter covers networking on Linux and other advanced command line concepts. The author discusses how Linux handles networking and gives examples using multiple virtual machines. He also covers how to install new programs and how to set up a firewall.

### Thoughts on the book

Fundamentals of Linux might seem short at five chapters and a little over two hundred pages. However, quite a bit of information is covered. You are given everything that you need to get going on the command line.

The book’s sole focus on the command line is one thing to keep in mind. You won’t get any information on how to use a graphical user interface. That is partially because Linux has so many different desktop environments and so many similar system applications that it would be hard to write a book that could cover all of the variables. It is also partially because the book is aimed at potential Linux administrators.

I was kinda surprised to see that the author used [CentOS][7] to teach Linux. I would have expected him to use a more common Linux distro, like Ubuntu, Debian, or Fedora. However, because it is a distro designed for servers very little changes over time, so it is a very stable basis for a course on Linux basics.

I’ve used Linux for over half a decade. I spent most of that time using desktop Linux. I dove into the terminal when I needed to, but didn’t spend lots of time there. I have performed many of the actions covered in this book using a mouse. Now, I know how to do the same things via the terminal. It won’t change the way I do my tasks, but it will help me understand what goes on behind the curtain.

If you have either just started using Linux or are planning to do so in the future, I would not recommend this book. It might be a little overwhelming. If you have already spent some time with Linux or can quickly grasp the technical language, this book may very well be for you.

If you think this book is apt for your learning needs, you can get the book from the link below:

We will be trying to review more Linux books in coming months so stay tuned with us.

What is your favorite introductory book on Linux? Let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][8].


--------------------------------------------------------------------------------

via: https://itsfoss.com/fundamentals-of-linux-book-review

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://www.packtpub.com/networking-and-servers/fundamentals-linux
[2]: https://www.packtpub.com/
[3]: http://www.oliverpelz.de/index.html
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/01/fundamentals-of-linux-book-review.jpeg?resize=800%2C450&ssl=1
[5]: https://centos.org/
[6]: https://www.virtualbox.org/
[7]: https://www.centos.org/
[8]: http://reddit.com/r/linuxusersgroup

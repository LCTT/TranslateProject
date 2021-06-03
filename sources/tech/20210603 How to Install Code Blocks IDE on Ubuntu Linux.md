[#]: subject: (How to Install Code Blocks IDE on Ubuntu Linux)
[#]: via: (https://itsfoss.com/install-code-blocks-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to Install Code Blocks IDE on Ubuntu Linux
======

Code Blocks is an open source IDE written in C++ and ideal for C, C++ and Fortran development. It is cross-platform and runs on Linux, macOS and Windows.

Code Blocks is lightweight and fast. It supports workspaces, multi-target projects, inter project dependencies inside workspace.

You get syntax highlighting, code folding, tabbed interface, class browser, smart indentation and more. You can also extend the feature of the IDE via plugins.

In this tutorial, you’ll learn to install Code Blocks on Ubuntu-based Linux distributions.

Note

Code Blocks is also available in Ubuntu Software Center. However, as of Ubuntu 21.04, installing Code Blocks graphically from the Ubuntu Software Center installs a codeblocks-common package, not the graphical IDE. And thus you don’t see the Code Blocks installed on your system to run. For this reason, I recommend taking the terminal approach for installing Code Blocks on Ubuntu.

### Install Code Blocks on Ubuntu-based Linux distributions

The [Code Blocks IDE][1] is available in the universe repository of all Ubuntu releases. Though it is usually enabled by default, it won’t harm to [enable universe repository][2] first:

```
sudo add-apt-repository universe
```

Update the package cache so that system knows about the availability of the additional packages from the newly added repository:

```
sudo apt update
```

And finally, you can install Code Blocks on Ubuntu-based distributions using the apt install command:

```
sudo apt install codeblocks
```

![][3]

It is advised to also install additional plugins to get more out of the Code Blocks IDE. You can install them using the codeblocks-contrib package:

```
sudo apt install codeblocks-contrib
```

### How to use Code Blocks

Search for Code Blocks in the system menu. This is what it looks like in Ubuntu’s default GNOME version:

![][4]

When you first start Code Blocks, it looks for all the available compilers on your system and adds it to the path so you don’t have to configure it on your own.

In my case, I already had gcc installed on my Ubuntu system and it was well recognized by Code Blocks.

![][5]

The user interface of Code Blocks is definitely not modern but keep in mind that the IDE is lightweight and it hardly consumes 50 MB of RAM.

If you have ever used another IDE like Eclipse, you won’t find it difficult to use Code Block. You can write your code and organize them in projects.

The buttons to build, run and build and run together is right their on the top.

![][6]

When you run the code, it opens a new terminal window to display the output.

![][7]

That’s the bare minimum information you need about Code Blocks. I leave it up to you to explore it further by going through its [wiki][8] and [user manual][9].

Having an IDE makes [running C or C++ programs on Linux][10] easier. Eclipse is a good IDE for that job but it consumes more system resources than Code Blocks. Of course, in the end, it’s your choice that matters.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-code-blocks-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.codeblocks.org/
[2]: https://itsfoss.com/ubuntu-repositories/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/install-code-blocks-ubuntu.png?resize=800%2C445&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/code-blocks-ubuntu.jpg?resize=800%2C231&ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/code-blocks-ide-first-run.png?resize=800%2C529&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/code-blocks-ide.png?resize=800%2C543&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/code-blocks-code-run-terminal.png?resize=504%2C371&ssl=1
[8]: https://wiki.codeblocks.org/index.php/Main_Page
[9]: https://www.codeblocks.org/user-manual/
[10]: https://itsfoss.com/c-plus-plus-ubuntu/

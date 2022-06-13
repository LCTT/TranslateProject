[#]: subject: "Thonny is an Ideal IDE for Teaching Python Programming in Schools"
[#]: via: "https://itsfoss.com/thonny-python-ide/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Thonny is an Ideal IDE for Teaching Python Programming in Schools
======
Running a Python program in Linux is as simple as executing the Python file in the terminal.

But that’s not very convenient for everyone and it doesn’t help you debug your programs. Too raw.

There are several IDEs and text editors that can be used for Python development. The [PyCharm community edition is available for Linux users][1].

I recently came across another IDE specifically crafted for Python beginners. I liked the idea of this application and hence I am sharing it with you here.

### Thonny is a cross-platform, open source Python IDE for beginners

[Thonny][2] feels like the Python version of Eclipse in terms of UI and UX. And that’s not entirely a bad thing considering most C++ and Java beginners start with Eclipse and many stay with it afterward.

It’s not a new tool. It has been on the horizon for some years now. I don’t code in Python so I never discovered it until recently.

Dedicated to Python, Thonny has features that help Python beginners understand how their program behaves. Let’s take a look at those features.

#### Plug and play

Thonny comes with Python so you don’t need to do additional effort for installing Python. That’s not a big deal for Linux users as most distributions have Python installed by default.

The interface is simple. It gives you an editor where you can write your Python program and hit the Run button or use F5 key to play the program. The output is displayed at the bottom.

![thonny hello world][3]

#### See variables

From the View->Variables, you can see the values of all the variables. No need to print them all.

![thonny variable pane][4]

#### Built-in debugger

Run your program step by step by using the debugger. You can access it from the top menu or use the Ctrl+F5 keys. You don’t even need the breakpoints here. You can go into big steps with F6 or in small steps with F7.

![thonny step by step f6][5]

In small steps, you can see how Python sees your expressions. This is very helpful for new programmers to understand why their program is behaving in a certain manner.

![thonny step by step f7][6]

That’s not it. For function calls, it opens a new window with separate local variables table and code pointer. Super cool!

#### Syntax error highlighter

Beginners often make simple syntax errors like missing paranthesis, quotes etc. Thonny is points it out immediately in the editor itself.

Local variables are also visually distinguished from globals.

#### Auto completion

You don’t have to type everything. Thonny supports auto code completion which helps in coding faster.

![thonny auto complete][7]

#### Access to system shell

From the Tools, you can access the system shell. From here you can install new Python package or learn to handle Python from the command line.

![thonny shell terminal][8]

Please note that if you use Flatpak or Snap, Thonny may not be able to access the system shell.

#### Manage Pip from GUI

Go to Tools and Manage packages. It opens a window and you can install Pip packages from this GUI.

![thonny manage packages][9]

Good enough features for learning Python, right? Let’s see how to install it.

### Installing Thonny on Linux

Thonny is a cross-platform application. It is available for Windows, macOS and Linux.

It’s a popular application and you can find it in the repositories of most Linux distributions. Just look for it in your system’s software center.

Alternatively, you can always use the package manager of your Linux distribution.

On Debian and Ubuntu-based distributions, you can use the apt command to install it.

```
sudo apt install thonny
```

It downloads a bunch of dependencies and around 300 MB of packages.

Once installed, you can search for it in the menu and install it from there.

### Conclusion

Thonny is a decent tool for beginner Python programmers. Not that experts cannot use it but it’s more suited to be used in the schools and colleges. Students will find it helpful in learning Python and understanding how their code behaves in certain manner. In fact, it was originally developed in University of Tartu, Estonia.

Overall, a good software for Python learners.

--------------------------------------------------------------------------------

via: https://itsfoss.com/thonny-python-ide/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/install-pycharm-ubuntu/
[2]: https://thonny.org/
[3]: https://itsfoss.com/wp-content/uploads/2022/06/thonny-hello-world.png
[4]: https://itsfoss.com/wp-content/uploads/2022/06/thonny-variable-pane.png
[5]: https://itsfoss.com/wp-content/uploads/2022/06/thonny-step-by-step-f6.png
[6]: https://itsfoss.com/wp-content/uploads/2022/06/thonny-step-by-step-f7.png
[7]: https://itsfoss.com/wp-content/uploads/2022/06/thonny-auto-complete.png
[8]: https://itsfoss.com/wp-content/uploads/2022/06/thonny-shell-terminal.png
[9]: https://itsfoss.com/wp-content/uploads/2022/06/thonny-manage-packages.png

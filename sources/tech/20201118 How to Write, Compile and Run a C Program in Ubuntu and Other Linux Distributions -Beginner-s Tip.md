[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Write, Compile and Run a C Program in Ubuntu and Other Linux Distributions [Beginner’s Tip])
[#]: via: (https://itsfoss.com/run-c-program-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Write, Compile and Run a C Program in Ubuntu and Other Linux Distributions [Beginner’s Tip]
======

How do you program in C on Linux? It is indeed very easy and consists of three simple steps.

**Step 1**: You write your program and save the file with a .c extension. For example, my_program.c.

**Step 2**: You compile the program and generate the object file using gcc compiler in a terminal like this:

```
gcc -o my_program my_program.c
```

**Step 3**: You run the generated object file to run your C program in Linux:

```
./my_program
```

![][1]

This was just the quick summary on how to compile and run C program in Linux. If you are new to either C or Linux, I’ll show these steps in detail so that you feel comfortable coding C program in Linux environment.

In fact, I’ll discuss how to run C programs in Linux terminal as well as in code editor.

![][2]

### Method 1: How to run C programs in Linux terminal

In order to run a C program in Linux, you need to have a C compiler present on your systems. The most popular compiler is gcc ([GNU Compiler Collection][3]).

You can install gcc using your distribution’s package manager. In Debian and Ubuntu-based Linux distributions, use the apt command:

```
sudo apt install gcc
```

Switch to directory where you have kept your C program (or provide the path) and then generate the object file by compiling the program:

```
gcc -o my_program my_program.c
```

Keep in mind that it is optional to provide the output object file (-o my_program). If you won’t do that, an object file named a.out will be automatically generated. But this is not good because it will be overwritten for each C program and you won’t be able to know which program the a.out object file belongs to.

Once you have your object file generated, run it to run the C program. It is already executable. Simple use it like this:

```
./my_program
```

And it will display the desired output, if your program is correct. As you can see, this is not very different from [running C++ programs in Linux][4].

_**Every time you make a change in your program, you have to compile it first and then run the generated object file to run the C program.**_

### Method 2: How to run C programs in Linux using a code editor like Visual Studio Code

Not everyone is comfortable with command line and terminal and I totally understand that.

You can use a proper C/C++ IDE like Eclipse or Code Blocks but they are often too heavy programs and more suitable for large projects.

I recommend using an open source code editor like Visual Studio Code or Atom. These are basically text editors and you can install add-ons to compile and run programs directly from the graphical code editor.

I am using [Visual Studio Code editor][5] in this example. It’s a hugely [popular open source code editor][6] from Microsoft.

First thing first, [install Visual Studio Code in Ubuntu][7] from the software center. For other distributions, please check your Linux distribution’s package manager or software center. You may also check the official website for more information.

Start Visual Studio Code and open/create a project and create your C program here. I am using a sample Hello World program.

![][8]

You must ensure that you have gcc compiler installed on your Linux system.

```
sudo apt install gcc
```

Next thing you would want is to use an extension that allows you to run the C code. Microsoft may prompt you for installing its own extension for C/C++ program but it is complicated to setup and hence I won’t recommend it.

Instead, I suggest using the Code Runner extension. It’s a no-nonsense extension and you can run C and C++ code easily without additional configuration.

Go to the Extensions tab and search for ‘Code Runner’ and install it.

![Install Code Runner extension for running C/C++ program][9]

Restart Visual Studio Code. Now, you should be able to run the C code by using one of the following way:

  * Using the shortcut Ctrl+Alt+N.
  * Press F1 and then select or type Run Code.
  * Right click the text editor and the click Run code from context menu.



![Right click the program file and choose Run Code][10]

When you run the program, it is compiled automatically and then run. You can see the output in terminal that is opened at the bottom of the editor. What could be better than this?

![Program output is displayed in the bottom section of the editor][11]

Which method do you prefer?

Running a few C programs in Linux command line is okay but using a code editor is much easier and saves time. Won’t you agree?

I let you decide whichever method you want to use.

--------------------------------------------------------------------------------

via: https://itsfoss.com/run-c-program-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/running-c-program-linux.png?resize=795%2C399&ssl=1
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/Run-C-Program-Linux.png?resize=800%2C450&ssl=1
[3]: https://gcc.gnu.org/
[4]: https://itsfoss.com/c-plus-plus-ubuntu/
[5]: https://code.visualstudio.com
[6]: https://itsfoss.com/best-modern-open-source-code-editors-for-linux/
[7]: https://itsfoss.com/install-visual-studio-code-ubuntu/
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/c-program-visual-studio-code-linux.png?resize=800%2C441&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/running-c-program-in-linux-with-visual-studio-code.png?resize=800%2C500&ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/running-c-program-in-linux-with-visual-studio-code.jpg?resize=800%2C500&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/run-c-program-in-linux-with-visual-studio-code.jpg?resize=800%2C500&ssl=1

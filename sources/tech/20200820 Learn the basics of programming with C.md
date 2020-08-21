[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Learn the basics of programming with C)
[#]: via: (https://opensource.com/article/20/8/c-programming-cheat-sheet)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Learn the basics of programming with C
======
Our new cheat sheet puts all the essentials of C syntax on an
easy-to-read handout.
![Cheat Sheet cover image][1]

In 1972, Dennis Ritchie was at Bell Labs, where a few years earlier, he and his fellow team members invented Unix. After creating an enduring OS (still in use today), he needed a good way to program those Unix computers so that they could perform new tasks. It seems strange now, but at the time, there were relatively few programming languages; Fortran, Lisp, [Algol][2], and B were popular but insufficient for what the Bell Labs researchers wanted to do. Demonstrating a trait that would become known as a primary characteristic of programmers, Dennis Ritchie created his own solution. He called it C, and nearly 50 years later, it's still in widespread use.

### Why you should learn C

Today, there are many languages that provide programmers more features than C. The most obvious one is C++, a rather blatantly named language that built upon C to create a nice object-oriented language. There are many others, though, and there's a good reason they exist. Computers are good at consistent repetition, so anything predictable enough to be built into a language means less work for programmers. Why spend two lines recasting an `int` to a `long` in C when one line of C++ (`long x = long(n);`) can do the same?

And yet C is still useful today.

First of all, C is a fairly minimal and straightforward language. There aren't very advanced concepts beyond the basics of programming, largely because C is literally one of the foundations of modern programming languages. For instance, C features arrays, but it doesn't offer a dictionary (unless you write it yourself). When you learn C, you learn the building blocks of programming that can help you recognize the improved and elaborate designs of recent languages.

Because C is a minimal language, your applications are likely to get a boost in performance that they wouldn't see with many other languages. It's easy to get caught up in the race to the bottom when you're thinking about how fast your code executes, so it's important to ask whether you _need_ more speed for a specific task. And with C, you have less to obsess over in each line of code, compared to, say, Python or Java. C is fast. There's a good reason the Linux kernel is written in C.

Finally, C is easy to get started with, especially if you're running Linux. You can already run C code because Linux systems include the GNU C library (`glibc`). To write and build it, all you need to do is install a compiler, open a text editor, and start coding.

### Getting started with C

If you're running Linux, you can install a C compiler using your package manager. On Fedora or RHEL:


```
`$ sudo dnf install gcc`
```

On Debian and similar:


```
`$ sudo apt install build-essential`
```

On macOS, you can [install Homebrew][3] and use it to install [GCC][4]:


```
`$ brew install gcc`
```

On Windows, you can install a minimal set of GNU utilities, GCC included, with [MinGW][5].

Verify you've installed GCC on Linux or macOS:


```
$ gcc --version
gcc (GCC) x.y.z
Copyright (C) 20XX Free Software Foundation, Inc.
```

On Windows, provide the full path to the EXE file:


```
PS&gt; C:\MinGW\bin\gcc.exe --version
gcc.exe (MinGW.org GCC Build-2) x.y.z
Copyright (C) 20XX Free Software Foundation, Inc.
```

### C syntax

C isn't a scripting language. It's compiled, meaning that it gets processed by a C compiler to produce a binary executable file. This is different from a scripting language like [Bash][6] or a hybrid language like [Python][7].

In C, you create _functions_ to carry out your desired task. A function named `main` is executed by default.

Here's a simple "hello world" program written in C:


```
#include &lt;stdio.h&gt;

int main() {
  [printf][8]("Hello world");
  return 0;
}
```

The first line includes a _header file_, essentially free and very low-level C code that you can reuse in your own programs, called `stdio.h` (standard input and output). A function called `main` is created and populated with a rudimentary print statement. Save this text to a file called `hello.c`, then compile it with GCC:


```
`$ gcc hello.c --output hello`
```

Try running your C program:


```
$ ./hello
Hello world$
```

#### Return values

It's part of the Unix philosophy that a function "returns" something to you after it executes: nothing upon success and something else (an error message, for example) upon failure. These return codes are often represented with numbers (integers, to be precise): 0 represents nothing, and any number higher than 0 represents some non-successful state.

There's a good reason Unix and Linux are designed to expect silence upon success. It's so that you can always plan for success by assuming no errors nor warnings will get in your way when executing a series of commands. Similarly, functions in C expect no errors by design.

You can see this for yourself with one small modification to make your program appear to fail:


```
include &lt;stdio.h&gt;

int main() {
  [printf][8]("Hello world");
  return 1;
}
```

Compile it:


```
`$ gcc hello.c --output failer`
```

Now run it using a built-in Linux test for success. The `&&` operator executes the second half of a command only upon success. For example:


```
$ echo "success" &amp;&amp; echo "it worked"
success
it worked
```

The `||` test executes the second half of a command upon _failure_.


```
$ ls blah || echo "it did not work"
ls: cannot access 'blah': No such file or directory
it did not work
```

Now try your program, which does _not_ return 0 upon success; it returns 1 instead:


```
$ ./failer &amp;&amp; echo "it worked"
String is: hello
```

The program executed successfully, yet did not trigger the second command.

#### Variables and types

In some languages, you can create variables without specifying what _type_ of data they contain. Those languages have been designed such that the interpreter runs some tests against a variable in an attempt to discover what kind of data it contains. For instance, Python knows that `var=1` defines an integer when you create an expression that adds `var` to something that is obviously an integer. It similarly knows that the word `world` is a string when you concatenate `hello` and `world`.

C doesn't do any of these investigations for you; you must define your variable type. There are several types of variables, including integers (int), characters (char), float, and Boolean.

You may also notice there's no string type. Unlike Python and Java and Lua and many others, C doesn't have a string type and instead sees strings as an array of characters.

Here's some simple code that establishes a `char` array variable, and then prints it to your screen using [printf][9] along with a short message:


```
#include &lt;stdio.h&gt;

int main() {
   char var[6] = "hello";
   [printf][8]("Your string is: %s\r\n",var);
```

You may notice that this code sample allows six characters for a five-letter word. This is because there's a hidden terminator at the end of the string, which takes up one byte in the array. You can run the code by compiling and executing it:


```
$ gcc hello.c --output hello
$ ./hello
hello
```

### Functions

As with other languages, C functions take optional parameters. You can pass parameters from one function to another by defining the type of data you want a function to accept:


```
#include &lt;stdio.h&gt;

int printmsg(char a[]) {
   [printf][8]("String is: %s\r\n",a);
}

int main() {
   char a[6] = "hello";
   printmsg(a);
   return 0;
}
```

The way this code sample breaks one function into two isn't very useful, but it demonstrates that `main` runs by default and how to pass data between functions.

### Conditionals

In real-world programming, you usually want your code to make decisions based on data. This is done with _conditional_ statements, and the `if` statement is one of the most basic of them.

To make this example program more dynamic, you can include the `string.h` header file, which contains code to examine (as the name implies) strings. Try testing whether the string passed to the `printmsg` function is greater than 0 by using the `strlen` function from the `string.h` file:


```
#include &lt;stdio.h&gt;
#include &lt;string.h&gt;

int printmsg(char a[]) {
  size_t len = [strlen][10](a);
  if ( len &gt; 0) {
    [printf][8]("String is: %s\r\n",a);
  }
}

int main() {
   char a[6] = "hello";
   printmsg(a);
   return 1;
}
```

As implemented in this example, the sample condition will never be untrue because the string provided is always "hello," the length of which is always greater than 0. The final touch to this humble re-implementation of the `echo` command is to accept input from the user.

### Command arguments

The `stdio.h` file contains code that provides two arguments each time a program is launched: a count of how many items are contained in the command (`argc`) and an array containing each item (`argv`). For example, suppose you issue this imaginary command:


```
`$ foo -i bar`
```

The `argc` is three, and the contents of `argv` are:

  * `argv[0] = foo`
  * `argv[1] = -i`
  * `argv[2] = bar`



Can you modify the example C program to accept `argv[2]` as the string instead of defaulting to `hello`?

### Imperative programming

C is an imperative programming language. It isn't object-oriented, and it has no class structure. Using C can teach you a lot about how data is processed and how to better manage the data you generate as your code runs. Use C enough, and you'll eventually be able to write libraries that other languages, such as Python and Lua, can use.

To learn more about C, you need to use it. Look in `/usr/include/` for useful C header files, and see what small tasks you can do to make C useful to you. As you learn, use our [C cheat sheet][11] by [Jim Hall][12] of FreeDOS. It's got all the basics on one double-sided sheet, so you can immediately access all the essentials of C syntax while you practice.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/c-programming-cheat-sheet

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coverimage_cheat_sheet.png?itok=lYkNKieP (Cheat Sheet cover image)
[2]: https://opensource.com/article/20/6/algol68
[3]: https://opensource.com/article/20/6/homebrew-mac
[4]: https://gcc.gnu.org/
[5]: https://opensource.com/article/20/8/gnu-windows-mingw
[6]: https://opensource.com/resources/what-bash
[7]: https://opensource.com/resources/python
[8]: http://www.opengroup.org/onlinepubs/009695399/functions/printf.html
[9]: https://opensource.com/article/20/8/printf
[10]: http://www.opengroup.org/onlinepubs/009695399/functions/strlen.html
[11]: https://opensource.com/downloads/c-programming-cheat-sheet
[12]: https://opensource.com/users/jim-hall

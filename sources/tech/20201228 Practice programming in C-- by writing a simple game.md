[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Practice programming in C++ by writing a simple game)
[#]: via: (https://opensource.com/article/20/12/learn-c-game)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Practice programming in C++ by writing a simple game
======
The C++ language is complex, but it can teach you a lot about data
types, memory management, and code linking.
![A bunch of question marks][1]

There are a couple of ways to learn a programming language. If you're new to coding, you usually learn some basic computer coding concepts and try to apply them. If you already know how to code in another language, you relearn how coding concepts are expressed in the new language.

In either case, a convenient way to learn these new principles is to create a simple guessing game. This forces you to understand how a language receives input and sends output, how it compares data, how to control a program's flow, and how to leverage conditionals to affect an outcome. It also ensures that you know how a language structures its code; for instance, Lua or [Bash][2] can easily run as a script, while [Java][3] requires you to create a class.

In this article, I'll demonstrate how to implement a guessing game for the terminal in [C++][4].

### Install dependencies

To follow along with this article, you need C++ and a compiler.

You can get everything you need on Linux by installing the Qt Creator IDE from your distribution's software repository.

On Fedora, CentOS, or RHEL:


```
`$ sudo dnf install qt-creator`
```

On Debian, Ubuntu, Chromebook, or similar:


```
`$ sudo apt install qtcreator`
```

This article doesn't utilize the Qt Creator IDE, but it's an easy way to get everything you need installed, and for complex C++ projects (including those with a GUI), it's an essential tool to have. On macOS or Windows, follow the [installation instructions][5] on Qt's website.

### Set up includes and namespace

C++'s core language is minimal. Even a simple application requires the use of additional libraries. This application uses [iostream][6] to gain access to the `cout` and `cin` keywords.

Also, ensure that the program uses the `std` namespace:


```
#include &lt;iostream&gt;

using namespace std;
```

This isn't strictly necessary, but without setting the namespace to `std`, all keywords from the iostream library require a namespace prefix. For instance, instead of writing `cout`, I would have to write `std::cout`.

Statements in C++ terminate with a semicolon.

### Create a function

Every C++ application requires at least one function. The primary function of a C++ application must be called `main`, and it must return an integer (`int`), which corresponds to the [POSIX][7] expectation that a process returns 0 upon success and something else upon failure. You create a new function by providing its return type and then its name:


```
int main() {
 // code goes here
}
```

### Implement program logic

The game code must first produce a random number for the player to guess. You do this in C++ by establishing a _seed_ for pseudo-random number generation. A simple seed is the current time. Once the seed starts, you retrieve a number between 1 and 100 by calling the `rand` function with an upper constraint of 100. This generates a random number from 0 to 99, so add 1 to whatever number is chosen and assign the result to a variable called `number`. You must also declare a variable to hold the player's guess. For clarity, I'm calling this variable `guess`.

This sample code also includes a debug statement that tells you exactly what the random number is. This isn't very good for a guessing game, but it makes testing a lot faster. Later, you can remove the line or just comment it out by prefacing it with `//`:


```
 srand (time(NULL));
 int number = rand() % 100+1;
 int guess = 0;

 cout &lt;&lt; number &lt;&lt; endl; //debug
```

### Add do-while and if statements

A `do-while` statement in C++ starts with the keyword `do` and encloses everything that you want C++ to do in braces. Close the statement with the `while` keyword followed by the condition that must be met (in parentheses):


```
do {
 // code here
} while ( number != guess );
```

The game code occurs within an `if` statement with an `else if` and `else` statements to provide the player with hints.

First, prompt the player for a guess with a `cout` statement. The `cout` function prints output onto `stdout`. Because the `cout` statement isn't appended with the `endl` (endline) function, no linebreak occurs. Immediately following this `cout` statement, tell C++ to wait for input by using the `cin` function. As you might surmise, `cin` waits for input from `stdin`.

Next, the program enters the `if` control statement. If the player's guess is greater than the pseudo-random number contained in the `number` variable, then the program prints out a hint followed by a newline character. This breaks the `if` statement, but C++ is still trapped within the `do-while` loop because its condition (the `number` variable being equal to `guess`) has not yet been met.

If the player's guess is less than the pseudo-random number contained in the `number` variable, then the program prints out a hint followed by a newline character. This again breaks the `if` statement, but the program remains trapped within the `do-while` loop.

When `guess` is equal to `number`, the key condition is finally met, the `else` statement is triggered, the `do-while` loop ends, and the application ends:


```
do {
  cout &lt;&lt; "Guess a number between 1 and 100: ";
  cin &gt;&gt; guess;

  if ( guess &gt; number) { cout &lt;&lt; "Too high.\n" &lt;&lt; endl; }
  else if ( guess &lt; number ) { cout &lt;&lt; "Too low.\n" &lt;&lt; endl; }
  else {
    cout &lt;&lt; "That's right!\n" &lt;&lt; endl;
    exit(0);
  } // fi
 } while ( number != guess );
return 0;
} // main
```

### Building the code and playing the game

You can build your application with GCC:


```
`$ g++ -o guess.bin guess.cpp`
```

Run the binary to try it out:


```
$ ./guess.bin
74
Guess a number between 1 and 100: 76
Too high.

Guess a number between 1 and 100: 1
Too low.

Guess a number between 1 and 100: 74
That's right!
```

Success!

### Give C++ a try

The C++ language is complex. Writing C++ applications for terminals can teach you a lot about data types, memory management, and code linking. Try writing a useful utility in C++ and see what you can discover!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/learn-c-game

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BIZ_question_B.png?itok=f88cyt00 (A bunch of question marks)
[2]: https://opensource.com/article/20/12/learn-bash
[3]: https://opensource.com/article/20/12/learn-java-writing-guess-number-game
[4]: https://www.cplusplus.com/
[5]: https://www.qt.io/product/development-tools
[6]: http://www.cplusplus.com/reference/iostream/
[7]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains

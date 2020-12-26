[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Learn Bash by writing an interactive game)
[#]: via: (https://opensource.com/article/20/12/learn-bash)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)

Learn Bash by writing an interactive game
======
Programming a simple game is a great way to practice a new language and
compare it against others you know.
![bash logo on green background][1]

Learning a new programming language can be fun. Whenever I try to learn a new one, I focus on defining variables, writing a statement, and evaluating expressions. Once I have a general understanding of those concepts, I can usually figure out the rest on my own. Most programming languages have some similarities, so once you know one programming language, learning the next one is a matter of figuring out the unique details and recognizing the differences in it.

To help me practice a new programming language, I like to write a few test programs. One sample program I often write is a simple "guess the number" program, where the computer picks a number between one and 100 and asks me to guess the number. The program loops until I guess correctly.

The "guess the number" program exercises several concepts in programming languages: how to assign values to variables, how to write statements, and how to perform conditional evaluation and loops. It's a great practical experiment for learning a new programming language.

### Guess the number in Bash

[Bash][2] is the standard shell for most Linux systems. Aside from providing a rich command-line user interface, Bash also supports a complete programming language in the form of _scripts_.

If you're not familiar with Bash, I recommend these introductions:

  * [What is Bash?][3]
  * [Get started with Bash programming][4]
  * [Get started with Bash scripting for sysadmins][5]
  * [How to write functions in Bash][6]
  * [Read more about Bash][7]



You can explore Bash by writing a version of the "guess the number" game. Here is my implementation:


```
#!/bin/bash

number=$(( $RANDOM % 100 + 1 ))

echo "Guess a number between 1 and 100"

guess=0

while [ "0$guess" -ne $number ] ; do
        read guess
        [ "0$guess" -lt $number ] &amp;&amp; echo "Too low"
        [ "0$guess" -gt $number ] &amp;&amp; echo "Too high"
done

echo "That's right!"
exit 0
```

### Breaking down the script

The first line in the script, `#!/bin/bash` tells Linux to run this script using the Bash shell. Every script starts with the `#!` character pair, which indicates this is a shell script. What immediately follows `#!` is the shell to run. In this case, `/bin/bash` is the Bash shell.

To assign a value to a variable, list the variable's name followed by the `=` sign. For example, the statement `guess=0` assigns a zero value to the `guess` variable.

You can also prompt the user to enter a value using the `read` statement. If you write `read guess`, Bash waits for the user to enter some text then stores that value in the `guess` variable.

To reference the value of a variable, use `$` before the variable name. So, having stored a value in the `guess` variable, you can retrieve it using `$guess`.

You can use whatever names you like for variables, but Bash reserves a few special variable names for itself. One special variable is `RANDOM`, which generates a very large random number every time you reference it.

If you want to perform an operation at the same time you store a value, you need to enclose the statement in special brackets. This tells Bash to execute that statement first, and the `=` stores the resulting value in the variable. To evaluate a mathematical expression, use `$(( ))` around your statement. The double parentheses indicate an _arithmetic expression_. In my example, `number=$(( $RANDOM % 100 + 1 ))` evaluates the expression `$RANDOM % 100 + 1` and then stores the value in the `number` variable.

Standard arithmetic operators such as `+` (plus), `-` (minus), `*` (multiply), `/` (divide), and `%` (modulo) apply.

That means the statement `number=$(( $RANDOM % 100 + 1 ))` generates a random number between one and 100. The modulo operator (`%`) returns the _remainder_ after dividing two numbers. In this case, Bash divides a random number by 100, leaving a remainder in the range zero to 99. By adding one to that value, you get a random number between one and 100.

Bash supports _conditional expressions_ and _flow control_ like loops. In the "guess the number" game, Bash continues looping as long as the value in `guess` is not equal to `number`. If the guess is less than the random number, Bash prints "Too low," and if the guess is greater than the number, Bash prints "Too high."

### How it works

Now that you've written your Bash script, you can run it to play the "guess the number" game. Continue guessing until you find the correct number:


```
Guess a number between 1 and 100
50
Too high
30
Too high
20
Too high
10
Too low
15
Too high
13
Too low
14
That's right!
```

Every time you run the script, Bash will pick a different random number.

This "guess the number" game is a great introductory program when learning a new programming language because it exercises several common programming concepts in a pretty straightforward way. By implementing this simple game in different programming languages, you can demonstrate some core concepts and compare details in each language.

Do you have a favorite programming language? How would you write the "guess the number" game in it? Follow this article series to see examples of other programming languages that might interest you.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/learn-bash

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U (bash logo on green background)
[2]: https://en.wikipedia.org/wiki/Bash_(Unix_shell)
[3]: https://opensource.com/resources/what-bash
[4]: https://opensource.com/article/20/4/bash-programming-guide
[5]: https://opensource.com/article/20/4/bash-sysadmins-ebook
[6]: https://opensource.com/article/20/6/bash-functions
[7]: https://opensource.com/tags/bash

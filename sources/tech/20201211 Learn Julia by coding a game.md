[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Learn Julia by coding a game)
[#]: via: (https://opensource.com/article/20/12/julia)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

Learn Julia by coding a game
======
Writing the same application in multiple languages is a great way to
learn new ways to program.
![woman on laptop sitting at the window][1]

Most programming languages have certain things in common, such as:

  * Variables
  * Expressions
  * Statements



These concepts are the basis of most programming languages. Once you understand them, you can start figuring the rest out.

Programming languages usually share some similarities. Once you know one programming language, you can learn the basics of another by recognizing its differences.

A good tool for learning a new language is by practicing with a standard program. This allows you to focus on the language, not the program's logic. I'm doing that in this article series using a "guess the number" program, in which the computer picks a number between one and 100 and asks you to guess it. The program loops until you guess the number correctly.

This program exercises several concepts in programming languages:

  * Variables
  * Input
  * Output
  * Conditional evaluation
  * Loops



It's a great practical experiment to learn a new programming language.

### Guess the number in Julia

According to [Julia][2]'s website, the language "is dynamically typed, feels like a scripting language, and has good support for interactive use." It "was designed from the beginning for high performance. Julia programs compile to efficient native code for multiple platforms via LLVM."

You can explore Julia by writing a version of the "guess the number" game.

Here is my implementation: 


```
random = rand(1:100)

println("Guess a number between 1 and 100")

while true
    data = readline()
    if data == ""
        println("goodbye")
        break
    end
    guess = parse(Int64, data)
    if guess &lt; random
        println("Too low")
    elseif guess &gt; random
        println("Too high")
    else
        println("That's right!")
        break
end
```

To assign a value to a variable, list the variable's name followed by the `=` sign. For example, the statement `random = 0` assigns a zero value to the `random` variable.

The first line of the script reads the result of the function `rand()` and assigns it to the variable called `random`. The function takes a single argument: a range. In this case, the range is `1:100`, making the game just challenging enough.

You can also prompt the user to enter a value using the `readline()` function. If you write `data = readline()`, Julia waits for the user to enter some text, then stores that value in the guess variable.

The next step is to convert `data` to an integer type. In this case, use `Int64`, a 64-bit integer type. The result of the `parse` function is stored in a variable `guess`.

Julia supports conditional expressions and flow control like loops. In the "guess the number" game, Julia continues looping as long as the guess value is not equal to `random`.

If the guess is less than the random number, Julia prints `Too low`, and if the guess is greater than the number, Julia prints `Too high`.

### Sample output

Now that you've written your Julia program, run it to play the "guess the number" game. Every time you run the program, Julia will pick a different random number, so you need to guess until you find the correct number:


```
$ julia guess.jl
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

This "guess the number" game is a great introductory program for learning a new programming language because it exercises several common programming concepts in a pretty straightforward way. By implementing this simple game in different programming languages, you can demonstrate some core concepts of the languages and compare their details.

Do you have a favorite programming language? How would you write the "guess the number" game in it? Follow this article series to see examples of other programming languages that might interest you!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/julia

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-window-focus.png?itok=g0xPm2kD (young woman working on a laptop)
[2]: https://julialang.org/

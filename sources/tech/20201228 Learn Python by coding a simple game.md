[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Learn Python by coding a simple game)
[#]: via: (https://opensource.com/article/20/12/learn-python)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

Learn Python by coding a simple game
======
Explore Python (and other programming languages) by writing a "guess the
number" game.
![Python programming language logo with question marks][1]

In this series, we're writing the same application in different programming languages to compare how various languages work and to show how using a standard test program is a great way to learn new ways to program.

When you learn a new programming language, it's good to focus on the things they have in common. Variables, expressions, and statements are the basis of most programming languages. Once you understand these concepts, you can start figuring the rest out.

Because programming languages share many similarities, once you know one, you can usually learn the basics of another by looking at how it differs from what you know. Using a standard test program you've written in other languages enables you to focus on the language, not the program's logic.

To prove this point, we're testing how to write a "guess the number" program in multiple languages. The computer picks a number between one and 100 and asks you to guess it. The program loops until you guess the correct answer.

The "guess the number" program exercises several concepts in programming languages:

  * Variables
  * Input
  * Output
  * Conditional evaluation
  * Loops



It's a great practical experiment to learn a new programming language.

### Guess the number in Python

In the words of the [Python Software Foundation][2]: "Python is an interpreted, interactive, object-oriented programming language. It incorporates modules, exceptions, dynamic typing, very high-level dynamic data types, and classes." It's a great general-purpose programming language that's useful for everything from simple scripts to complex GUI applications.

You can explore Python by writing a version of the "guess the number" game. Here is my implementation:


```
import random as randomlib
random = randomlib.randint(1, 100)
print("Guess a number between 1 and 100")
while True:
    guess = int(input())
    if guess &lt; random:
        print("Too low")
    elif guess &gt; random:
        print("Too high")
    else:
        print("That's right!")
        break
```

To assign a value to a variable, list the variable's name, followed by the `=` sign. For example, the statement `random = 0` assigns a zero value to the `random` variable.

The first line of the script imports the `random` module. Since all the programs in this series use `random` as the name of the variable, you can use `import random as randomlib` to import it under an alias to avoid name conflicts.

Few functions are built into Python; most have to be imported explicitly from the standard library. The `random` standard library module has the functionality to generate all kinds of random values.

The second line of the script reads the result of the function `randint()` and assigns it to the variable called `random`. The function takes two arguments: a minimum and a maximum. In this case, the range is `1` to `100`, making the game just challenging enough.

You can also prompt the user to enter a value using the `input()` function. If you write `guess = int(input())`, Python waits for the user to enter some text, converts it to an integer, and then stores that value in the guess variable.

Python supports conditional expressions and flow control like loops. In the "guess the number" game, Python continues looping as long as the value in guess is not equal to `random`.

If the guess is less than the random number, Python prints `Too low`, and if the guess is greater than the number, Python prints `Too high`.

### Sample output

Now that you've written your Python program, run it to play the "guess the number" game. Every time you run the program, Python will pick a different random number. To complete this game, you need to guess until you find the correct number:


```
$ python guess.py
Guess a number between 1 and 100
 50
Too high
 25
Too high
 12
Too high
 7
Too high
 3
Too low
 5
Too low
 6
That's right!
```

This "guess the number" game is a great introductory program when learning a new programming language because it exercises several common programming concepts in a pretty straightforward way. By implementing this simple game in different programming languages, you can demonstrate some core concepts of different programming languages and compare each language's details.

Do you have a favorite programming language? How would you write the "guess the number" game? Follow this article series to see examples of other programming languages that might interest you!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/learn-python

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python_programming_question.png?itok=cOeJW-8r (Python programming language logo with question marks)
[2]: https://docs.python.org/3/faq/general.html#general-information

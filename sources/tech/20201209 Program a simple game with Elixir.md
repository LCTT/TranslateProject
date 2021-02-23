[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Program a simple game with Elixir)
[#]: via: (https://opensource.com/article/20/12/elixir)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

Program a simple game with Elixir
======
Learn Elixir by programming a "guess the number" game and comparing the
language against ones you know.
![A die with rainbow color background][1]

To you learn a new programming language, it's good to focus on the things most programming languages have in common:

  * Variables
  * Expressions
  * Statements



These concepts are the basis of most programming languages. Because of these similarities, once you know one programming language, you can start figuring another one out by recognizing its differences.

Another good tool for learning a new language is starting with a standard program. This allows you to focus on the language, not the program's logic. We're doing that in this article series using a "guess the number" program, in which the computer picks a number between one and 100 and asks you to guess it. The program loops until you guess the number correctly.

The "guess the number" program exercises several concepts in programming languages:

  * Variables
  * Input
  * Output
  * Conditional evaluation
  * Loops



It's a great practical experiment to learn a new programming language.

### Guess the number in Elixir

The [Elixir][2] programming language is a dynamically typed functional language designed for building stable and maintainable applications. It runs on top of the same virtual machine as [Erlang][3] and shares many of its strengths—but with slightly easier syntax.

You can explore Elixir by writing a version of the "guess the number" game.

Here is my implementation:


```
defmodule Guess do
  def guess() do
     random = Enum.random(1..100)
     IO.puts "Guess a number between 1 and 100"
     Guess.guess_loop(random)
  end
  def guess_loop(num) do
    data = IO.read(:stdio, :line)
    {guess, _rest} = Integer.parse(data)
    cond do
      guess &lt; num -&gt;
        IO.puts "Too low!"
        guess_loop(num)
      guess &gt; num -&gt;
        IO.puts "Too high!"
        guess_loop(num)
      true -&gt;
        IO.puts "That's right!"
    end
  end
end

Guess.guess()
```

To assign a value to a variable, list the variable's name followed by the `=` sign. For example, the statement `random = 0` assigns a zero value to the `random` variable.

The script starts by defining a **module**. In Elixir, only modules can have named functions in them.

The next line defines the function that will serve as the entry point, `guess()`, which:

  * Calls the `Enum.random()` function to get a random integer
  * Prints the game prompt
  * Calls the function that will serve as the loop



The rest of the game logic is implemented in the `guess_loop()` function.

The `guess_loop()` function uses [tail recursion][4] to loop. There are several ways to do looping in Elixir, but using tail recursion is a common one. The last thing `guess_loop()` does is call _itself_.

The first line in `guess_loop()` reads the input from the user. The next line uses `parse()` to convert the input to an integer.

The `cond` statement is Elixir's version of a multi-branch statement. Unlike `if/elif` or `if/elsif` in other languages, Elixir does not treat the first nor the last branch in a different way.

This `cond` statement has a three-way branch: The guess can be smaller, bigger, or equal to the random number. The first two options output the inequality's direction and then tail-call `guess_loop()`, looping back to the beginning. The last option outputs `That's right`, and the function finishes.

### Sample output

Now that you've written your Elixir program, you can run it to play the "guess the number" game. Every time you run the program, Elixir will pick a different random number, and you can guess until you find the correct number:


```
$ elixir guess.exs
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

Do you have a favorite programming language? How would you write the "guess the number" game in it? Follow this article series to see examples of other programming languages that might interest you.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/elixir

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/dice_tabletop_board_gaming_game.jpg?itok=y93eW7HN (A die with rainbow color background)
[2]: https://elixir-lang.org/
[3]: https://www.erlang.org/
[4]: https://en.wikipedia.org/wiki/Tail_call

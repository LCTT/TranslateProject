[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Learn Lua by writing a "guess the number" game)
[#]: via: (https://opensource.com/article/20/12/lua-guess-number-game)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Learn Lua by writing a "guess the number" game
======
Get to know Lua, a dynamically typed, lightweight, efficient, and
embeddable scripting language, by programming a simple game.
![Puzzle pieces coming together to form a computer screen][1]

If you're a fan of scripting languages like Bash, Python, or Ruby, you might find Lua interesting. Lua is a dynamically typed, lightweight, efficient, and embeddable scripting language with an API to interface with C. It runs by interpreting bytecode with a register-based virtual machine, and it can be used for everything from procedural programming to functional programming to data-driven programming. It can even be used for object-oriented programming through the clever use of arrays, or _tables_, used to mimic classes.

A great way to get a feel for a language is by writing a simple application you're already familiar with. Recently, some Opensource.com correspondents have demonstrated how to use their favorite languages to create a number-guessing game. [Lua][2] is one of my favorites, so here's my Lua version of the guessing game.

### Install Lua

If you're on Linux, you can install Lua from your distribution's software repository. On macOS, you can install Lua from [MacPorts][3] or [Homebrew][4]. On Windows, you can install Lua from [Chocolatey][5].

Once you have Lua installed, open your favorite text editor and get ready to code.

### Lua code

First, you must set up a pseudo-random number generator, so your player has something unpredictable to try to guess. This is a two-step process: first, you start a random seed based on the current time, and then you select a number within the range of 1 to 100:


```
math.randomseed(os.[time][6]())
number = math.random(1,100)
```

Next, create what Lua calls a _table_ to represent your player. A table is like an [array in Bash][7] or an ArrayList in Java. You can create a table and then assign child variables associated with that table. In this code, `player` is the table, and `player.guess` is an entry in that table:


```
player = {}
player.guess = 0
```

For the purpose of debugging, print the secret number. This isn't good for the game, but it's great for testing. Comments in Lua are preceded by double dashes:


```
`print(number) --debug`
```

Next, set up a `while` loop that runs forever upon the condition that the value assigned to `player.guess` is not equal to the random `number` established at the start of the code. Currently, `player.guess` is set to 0, so it is not equal to `number`. Lua's math operator for inequality is `~=`, which is admittedly unique, but you get used to it after a while.

The first thing that happens during this infinite loop is that the game prints a prompt so that the player understands the game.

Next, Lua pauses and waits for the player to enter a guess. Lua reads from files and standard in (stdin) using the `io.read` function. You can assign the results of `io.read` to a variable that is dynamically created in the `player` table. The problem with the player's input is that it is read as a string, even if it's a number. You can convert this input to an integer type using the `tonumber()` function, assigning the result back to the `player.guess` variable that initially contained 0:


```
while ( player.guess ~= number ) do
  print("Guess a number between 1 and 100")
  player.answer = io.read()
  player.guess = tonumber(player.answer)
```

Now that `player.guess` contains a new value, it's compared to the random number in an `if` statement. Lua uses the keywords `if`, `elseif`, and `else` and terminates the statement with the keyword `end:`


```
  if ( player.guess &gt; number ) then
    print("Too high")
  elseif ( player.guess &lt; number) then
    print("Too low")
  else
    print("That's right!")
    os.[exit][8]()
  end
end
```

At the end, the function `os.exit()` closes the application upon success and the keyword `end` is used twice: once to end the `if` statement and again to end the `while` loop.

### Run the application

Run the game in a terminal:


```
$ lua ./guess.lua
96
Guess a number between 1 and 100
1
Too low
Guess a number between 1 and 100
99
Too high
Guess a number between 1 and 100
96
That's right!
```

That's it!

### Intuitive and consistent

As you may be able to tell from this code, Lua is sublimely consistent and fairly intuitive. Its table mechanism is a refreshing way of associating data, and its syntax is minimalistic and efficient. There are few wasted lines in Lua code; in fact, at least one pair of lines in this example could be optimized further, but I wanted to demonstrate data conversion as its own step (maybe you can find the two lines I'm referring to and restructure them).

Lua is a pleasure to use, and its [documentation is a pleasure to read][9], mostly because there's just not that much to it. You'll learn the core language in no time, and then you'll be free to explore [LuaRocks][10] to discover all the great libraries others have contributed to make your time with Lua even easier. "Lua" means "moon" in Portuguese, so give it a try tonight.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/lua-guess-number-game

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/puzzle_computer_solve_fix_tool.png?itok=U0pH1uwj (Puzzle pieces coming together to form a computer screen)
[2]: https://www.lua.org/
[3]: https://opensource.com/article/20/11/macports
[4]: https://opensource.com/article/20/6/homebrew-mac
[5]: https://opensource.com/article/20/3/chocolatey
[6]: http://www.opengroup.org/onlinepubs/009695399/functions/time.html
[7]: https://opensource.com/article/20/6/associative-arrays-bash
[8]: http://www.opengroup.org/onlinepubs/009695399/functions/exit.html
[9]: https://www.lua.org/docs.html
[10]: https://opensource.com/article/19/11/getting-started-luarocks

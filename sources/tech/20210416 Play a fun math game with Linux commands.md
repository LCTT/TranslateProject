[#]: subject: (Play a fun math game with Linux commands)
[#]: via: (https://opensource.com/article/21/4/math-game-linux-commands)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Play a fun math game with Linux commands
======
Play the numbers game from the popular British game show "Countdown" at
home.
![Math formulas in green writing][1]

Like many people, I've been exploring lots of new TV shows during the pandemic. I recently discovered a British game show called _[Countdown][2]_, where contestants play two types of games: a _words_ game, where they try to make the longest word out of a jumble of letters, and a _numbers_ game, where they calculate a target number from a random selection of numbers. Because I enjoy mathematics, I've found myself drawn to the numbers game.

The numbers game can be a fun addition to your next family game night, so I wanted to share my own variation of it. You start with a collection of random numbers, divided into "small" numbers from 1 to 10 and "large" numbers that are 15, 20, 25, and so on until 100. You pick any combination of six numbers from both large and small numbers.

Next, you generate a random "target" number between 200 and 999. Then use simple arithmetic operations with your six numbers to try to calculate the target number using each "small" and "large" number no more than once. You get the highest number of points if you calculate the target number exactly and fewer points if you can get within 10 of the target number.

For example, if your random numbers were 75, 100, 2, 3, 4, and 1, and your target number was 505, you might say _2+3=5_, _5×100=500_, _4+1=5_, and _5+500=505_. Or more directly: (**2**+**3**)×**100** \+ **4** \+ **1** = **505**.

### Randomize lists on the command line

I've found the best way to play this game at home is to pull four "small" numbers from a pool of 1 to 10 and two "large" numbers from multiples of five from 15 to 100. You can use the Linux command line to create these random numbers for you.

Let's start with the "small" numbers. I want these to be in the range of 1 to 10. You can generate a sequence of numbers using the Linux `seq` command. You can run `seq` a few different ways, but the simplest form is to provide the starting and ending numbers for the sequence. To generate a list from 1 to 10, you might run this command:


```
$ seq 1 10
1
2
3
4
5
6
7
8
9
10
```

To randomize this list, you can use the Linux `shuf` ("shuffle") command. `shuf` will randomize the order of whatever you give it, usually a file. For example, if you send the output of the `seq` command to the `shuf` command, you will receive a randomized list of numbers between 1 and 10:


```
$ seq 1 10 | shuf
3
6
8
10
7
4
5
2
1
9
```

To select just four random numbers from a list of 1 to 10, you can send the output to the `head` command, which prints out the first few lines of its input. Use the `-4` option to specify that `head` should print only the first four lines:


```
$ seq 1 10 | shuf | head -4
6
1
8
4
```

Note that this list is different from the earlier example because `shuf` will generate a random order every time.

Now you can take the next step to generate the random list of "large" numbers. The first step is to generate a list of possible numbers starting at 15, incrementing by five, until you reach 100. You can generate this list with the Linux `seq` command. To increment each number by five, insert another option for the `seq` command to indicate the _step_:


```
$ seq 15 5 100
15
20
25
30
35
40
45
50
55
60
65
70
75
80
85
90
95
100
```

And just as before, you can randomize this list and select two of the "large" numbers:


```
$ seq 15 5 100 | shuf | head -2
75
40
```

### Generate a random number with Bash

I suppose you could use a similar method to select the game's target number from the range 200 to 999. But the simplest solution to generate a single random value is to use the `RANDOM` variable directly in Bash. When you reference this built-in variable, Bash generates a large random number. To put this in the range of 200 to 999, you need to put the random number into the range 0 to 799 first, then add 200.

To put a random number into a specific range starting at 0, you can use the **modulo** arithmetic operation. Modulo calculates the _remainder_ after dividing two numbers. If I started with 801 and divided by 800, the result is 1 _with a remainder of_ 1 (the modulo is 1). Dividing 800 by 800 gives 1 _with a remainder of_ 0 (the modulo is 0). And dividing 799 by 800 results in 0 _with a remainder of_ 799 (the modulo is 799).

Bash supports arithmetic expansion with the `$(( ))` construct. Between the double parentheses, Bash will perform arithmetic operations on the values you provide. To calculate the modulo of 801 divided by 800, then add 200, you would type:


```
$ echo $(( 801 % 800 + 200 ))
201
```

With that operation, you can calculate a random target number between 200 and 999:


```
$ echo $(( RANDOM % 800 + 200 ))
673
```

You might wonder why I used `RANDOM` instead of `$RANDOM` in my Bash statement. In arithmetic expansion, Bash will automatically expand any variables within the double parentheses. You don't need the `$` on the `$RANDOM` variable to reference the value of the variable because Bash will do it for you.

### Playing the numbers game

Let's put all that together to play the numbers game. Generate two random "large" numbers, four random "small" values, and the target value:


```
$ seq 15 5 100 | shuf | head -2
75
100
$ seq 1 10 | shuf | head -4
4
3
10
2
$ echo $(( RANDOM % 800 + 200 ))
868
```

My numbers are **75**, **100**, **4**, **3**, **10**, and **2**, and my target number is **868**.

I can get close to the target number if I do these arithmetic operations using each of the "small" and "large" numbers no more than once:


```
10×75 = 750
750+100 = 850

and:

4×3 = 12
850+12 = 862
862+2 = 864
```

That's only four away—not bad! But I found this way to calculate the exact number using each random number no more than once:


```
4×2 = 8
8×100 = 800

and:

75-10+3 = 68
800+68 = 868
```

Or I could perform _these_ calculations to get the target number exactly. This uses only five of the six random numbers:


```
4×3 = 12
75+12 = 87

and:

87×10 = 870
870-2 = 868
```

Give the _Countdown_ numbers game a try, and let us know how well you did in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/math-game-linux-commands

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/edu_math_formulas.png?itok=B59mYTG3 (Math formulas in green writing)
[2]: https://en.wikipedia.org/wiki/Countdown_%28game_show%29

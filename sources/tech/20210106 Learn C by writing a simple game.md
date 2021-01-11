[#]: collector: (lujun9972)
[#]: translator: (qfzy1233 )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Learn C by writing a simple game)
[#]: via: (https://opensource.com/article/21/1/learn-c)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)

Learn C by writing a simple game
======
This "guess the number" game is a great introductory program when
learning a new programming language. Here's how to write it in C.
![Business woman on laptop sitting in front of window][1]

I [taught myself about programming][2] back in elementary school. My first programs were on the Apple II, but eventually, I learned C by reading books and practicing. And the best way to practice programming is to write sample programs that help exercise your new knowledge.

One program I like to write in a new language is a simple "guess the number" game. The computer picks a random number from 1 to 100, and you have to figure it out by making guesses. In another article, I showed how to write this ["Guess the number" game in Bash][3], and my fellow Opensource.com authors have written articles about how to write it in [Java][4], [Julia][5], and other computer languages.

What's great about a "Guess the number" game is that it exercises several programming concepts: how to use variables, how to compare values, how to print output, and how to read input.

Over the summer, I recorded [a video series][6] to teach people how to write programs in the [C programming language][7]. Since then, I've heard from many people who are learning C programming by following it. So, I thought I'd follow up by writing a "Guess the number" game in C.

### Pick a random number

Start the "Guess the number" game by writing a function to pick a random number. When writing functions, good programmers try to make them flexible, so they can reuse them to solve slightly different problems. So, instead of hard-coding the function to pick a random number between 1 and 100, write the function to pick a random number between 1 and some integer value `maxval`:


```
#include &lt;stdio.h&gt;
#include &lt;sys/random.h&gt;

int
randnum(int maxval)
{
  /* pick a random number from 1 to maxval */

  int randval;

  getrandom(&amp;randval, sizeof(int), GRND_NONBLOCK);

  /* could be negative, so ensure it's positive */

  if (randval &lt; 0) {
    return (-1 * randval % maxval + 1);
  }
  else {
    return (randval % maxval + 1);
  }
}
```

The function uses the Linux system call `getrandom` to generate a series of random bits. You can learn more about this system call on the man page, but note that `getrandom` will fill the variable with random zeroes and ones. That means the final value could be positive or negative, so you need to do a test afterward to ensure the result of your `randnum` function is a positive value.

### Write the program

You can use this function to write your "Guess the number" program:


```
#include &lt;stdio.h&gt;
#include &lt;sys/random.h&gt;
 
int
randnum(int maxval)
{
  ...
}

int
main(void)
{
  int number;
  int guess;

  number = randnum(100);

  [puts][8]("Guess a number between 1 and 100");

  do {
    [scanf][9]("%d", &amp;guess);

    if (guess &lt; number) {
      [puts][8]("Too low");
    }
    else if (guess &gt; number) {
      [puts][8]("Too high");
    }
  } while (guess != number);

  [puts][8]("That's right!");

  return 0;
}
```

The program starts by picking a random number between 1 and 100 using the `randnum` function. After printing a prompt to the user, the program enters a `do-while` loop so the user can guess the number.

In each iteration of the loop, the program tests the user's guess. If the user's guess is less than the random number, the program prints "Too low," and if the guess is greater than the random number, the program prints "Too high." The loop continues until the user's guess is the same as the random number.

When the loop exits, the program prints "That's right!" and then immediately ends.


```
$ gcc -o guess -Wall guess.c

$ ./guess
Guess a number between 1 and 100
50
Too high
30
Too low
40
Too low
45
Too high
42
Too low
43
Too low
44
That's right!
```

### Try it out

This "guess the number" game is a great introductory program when learning a new programming language because it exercises several common programming concepts in a pretty straightforward way. By implementing this simple game in different programming languages, you can demonstrate some core concepts and compare details in each language.

Do you have a favorite programming language? How would you write the "guess the number" game in it? Follow this article series to see examples of other programming languages that might interest you.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/learn-c

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF (Woman using laptop concentrating)
[2]: https://opensource.com/article/20/8/learn-open-source
[3]: https://opensource.com/article/20/12/learn-bash
[4]: https://opensource.com/article/20/12/learn-java
[5]: https://opensource.com/article/20/12/julia
[6]: https://opensource.com/article/20/8/teaching-c
[7]: https://opensource.com/article/20/8/c-programming-cheat-sheet
[8]: http://www.opengroup.org/onlinepubs/009695399/functions/puts.html
[9]: http://www.opengroup.org/onlinepubs/009695399/functions/scanf.html

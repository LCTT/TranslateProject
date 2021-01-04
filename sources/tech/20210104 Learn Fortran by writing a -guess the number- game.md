[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Learn Fortran by writing a "guess the number" game)
[#]: via: (https://opensource.com/article/21/1/fortran)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)

Learn Fortran by writing a "guess the number" game
======
Because Fortran was written in the punched card era, its syntax is
pretty limited. But you can still write useful and interesting programs
with it.
![Person typing on a 1980's computer][1]

The first compiled programming language I learned was Fortran 77. While growing up, I taught myself how to write programs in BASIC on the Apple II and later in QBasic on DOS. But when I went to university to study physics, I learned [Fortran][2].

Fortran used to be quite common in scientific computing. And once upon a time, all computer systems had a Fortran compiler. Fortran used to be as ubiquitous as Python is today. So if you were a physics student like me, working in the 1990s, you learned Fortran.

I always thought Fortran was somewhat similar to BASIC, so I quickly took to Fortran whenever I needed to write a quick program to analyze lab data or perform some other numerical analysis. And when I got bored, I wrote a "Guess the number" game in Fortran, where the computer picks a number between one and 100 and asks me to guess the number. The program loops until I guess correctly.

The "Guess the number" program exercises several concepts in programming languages: how to assign values to variables, how to write statements, and how to perform conditional evaluation and loops. It's a great practical experiment for learning a new programming language.

### The basics of Fortran programming

While Fortran has been updated over the years, I am most familiar with Fortran 77, the implementation I learned years ago. Fortran was created when programmers wrote programs on punched cards, so "classic" Fortran is limited to the data you could put on a punched card. That means you could only write classic Fortran programs with these limitations:

  * Only one line of source code per card is allowed.
  * Only columns 1–72 are recognized (the last eight columns, 73-80, are reserved for the card sorter).
  * Line numbers ("labels") are in columns 1–5.
  * Program statements go in columns 7–72.
  * To continue a program line, enter a continuation character (usually `+`) in column 6.
  * To create a comment line, enter `C` or `*` in column 1.
  * Only the characters `A` to `Z` (uppercase), `0` to `9` (numbers), and the special characters `= + - * / ( ) , . $ ' :` and space are used.



With these limitations, you can still write very useful and interesting programs.

### Guess the number in Fortran

Explore Fortran by writing the "Guess the number" game. This is my implementation:


```
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C     PROGRAM TO GUESS A NUMBER 1-100
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
      PROGRAM GUESSNUM
      INTEGER SEED, NUMBER, GUESS

      PRINT *, 'ENTER A RANDOM NUMBER SEED'
      READ *, SEED
      CALL SRAND(SEED)

      NUMBER = INT( RAND(0) * 100 + 1 )

      PRINT *, 'GUESS A NUMBER BETWEEN 1 AND 100'
 10   READ *, GUESS

      IF (GUESS.LT.NUMBER) THEN
         PRINT *, 'TOO LOW'
      ELSE IF (GUESS.GT.NUMBER) THEN
         PRINT *, 'TOO HIGH'
      ENDIF

      IF (GUESS.NE.NUMBER) GOTO 10

      PRINT *, 'THATS RIGHT!'
      END
```

If you are familiar with other programming languages, you can probably figure out what this program is doing by reading the source code. The first three lines are a comment block to indicate the program's function. The fourth line, `PROGRAM GUESSNUM`, identifies this as a program, and it is closed by the `END` statement on the last line.

After defining a few variables, the program prompts the user to enter a random number seed. A Fortran program cannot initialize the random number generator from the operating system, so you must always start the random number generator with a "seed" value and the `SRAND` subroutine.

Fortran generates random numbers between 0 and 0.999... with the `RAND(0)` function. The `0` value tells the `RAND` function to generate another random number. Multiply this random number by 100 to generate a number between 0 and 99.999…, and then add 1 to get a value between 1 and 100.999… The `INT` function truncates this to an integer; thus, the variable `NUMBER` is a random number between 1 and 100.

The program prompts the user, then enters a loop. Fortran doesn't support the `while` or `do-while` loops available in more modern programming languages. Instead, you must construct your own using labels (line numbers) and `GOTO` statements. That's why the `READ` statement has a line number; you can jump to this label with the `GOTO` at the end of the loop.

Punched cards did not have the `<` (less than) or `>` (greater than) symbols, so Fortran adopted a different syntax to compare values. To test if one value is less than another, use the `.LT.` (less than) comparison. To test if a value is greater than another, use `.GT.` (greater than). Equal and not equal are `.EQ.` and `.NE.`, respectively.

In each iteration of the loop, the program tests the user's guess. If the user's guess is less than the random number, the program prints `TOO LOW`, and if the guess is greater than the random number, the program prints `TOO HIGH`. The loop continues until the user's guess is the same as the random number.

When the loop exits, the program prints `THATS RIGHT!` and ends immediately.


```
$ gfortran -Wall -o guess guess.f

$ ./guess
 ENTER A RANDOM NUMBER SEED
93759
 GUESS A NUMBER BETWEEN 1 AND 100
50
 TOO LOW
80
 TOO HIGH
60
 TOO LOW
70
 TOO LOW
75
 TOO HIGH
73
 TOO LOW
74
 THATS RIGHT!
```

Every time you run the program, the user needs to enter a different random number seed. If you always enter the same seed, the program will always pick the same random number.

### Try it in other languages

This "guess the number" game is a great introductory program when learning a new programming language because it exercises several common programming concepts in a pretty straightforward way. By implementing this simple game in different programming languages, you can demonstrate some core concepts and compare each language's details.

Do you have a favorite programming language? How would you write the "guess the number" game in it? Follow this article series to see examples of other programming languages that might interest you.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/fortran

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/1980s-computer-yearbook.png?itok=eGOYEKK- (Person typing on a 1980's computer)
[2]: https://en.wikipedia.org/wiki/Fortran

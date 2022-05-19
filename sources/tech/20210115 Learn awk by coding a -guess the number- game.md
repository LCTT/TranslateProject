[#]: collector: (lujun9972)
[#]: translator: (FYJNEVERFOLLOWS )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Learn awk by coding a "guess the number" game)
[#]: via: (https://opensource.com/article/21/1/learn-awk)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansen)

Learn awk by coding a "guess the number" game
======
Programming languages tend to share many common traits. One great way to
learn a new language is to create a familiar program. In this article, I
will create a "guess the number" game by using awk to demonstrate
familiar concepts.
![question mark in chalk][1]

When you learn a new programming language, it's good to focus on the things most programming languages have in common:

  * Variables – places where information is stored
  * Expressions – ways to calculate things
  * Statements – the means by which state changes are expressed in a program



These concepts are the basis of most programming languages.

Once you understand these concepts, you can start figuring the rest out. For example, most languages have a "way of doing things" supported by their design, and those ways can be quite different from one program to another. These ways include modularity (grouping related functionality together), declarative vs. imperative, object-orientation, low- vs. high-level syntactic features, and so on. An example familiar to many programmers is "ceremony," that is, the amount of work required to set the scene before tackling the problem. The Java programming language is said to have a significant ceremony requirement, stemming from its design, which requires all code to be defined within a class.

But back to the basics. Programming languages usually share similarities. Once you know one programming language, start by learning the basics of another to appreciate the differences in that new language.

A good way to proceed is to create a set of basic test programs. With these in hand, learning starts with these similarities.

One test program you can use is a "guess the number" program. The computer picks a number between one and one hundred and asks you to guess the number. The program loops until you make a correct guess.

The "guess the number" program exercises several concepts in programming languages:

  * Variables
  * Input
  * Output
  * Conditional evaluation
  * Loops



That's a great practical experiment to learn a new programming language.

**Note**: This article is adapted from Moshe Zadka's article on doing using this approach in [Julia][2] and Jim Hall's article on doing it in [Bash][3].

### Guess the number in awk

Let's write a "guess the number" game as an Awk program.

Awk is dynamically typed, is a scripting language oriented toward data transformation, and has surprisingly good support for interactive use. Awk has been around since the 1970s, originally as a part of the Unix operating system. If you don't know Awk but love spreadsheets, this is a sign… [go learn Awk][4]!

You can begin your exploration of Awk by writing a version of the "guess the number" game.

Here is my implementation (with line numbers so we can review some of the specific features):


```
     1    BEGIN {
     2        srand(42)
     3        randomNumber = int(rand() * 100) + 1
     4        print "random number is",randomNumber
     5        printf "guess a number between 1 and 100\n"
     6    }
     7    {
     8        guess = int($0)
     9        if (guess &lt; randomNumber) {
    10            printf "too low, try again:"
    11        } else if (guess &gt; randomNumber) {
    12            printf "too high, try again:"
    13        } else {
    14            printf "that's right\n"
    15            exit
    16        }
    17    }
```

We can immediately see similarities between Awk control structures and those of C or Java, but unlike Python. In statements such as _if-then-else_ or _while_, the _then_, _else_, and _while_ parts take either a statement or a group of statements enclosed within **{** and **}**. However, there is one big difference about AWk that needs to be understood from the start:

By design, Awk is built around a data pipeline.

What does that mean? Most Awk programs are snippets of code that receive a line of input, do something with the data, and write it to output. Recognizing the need for such a transformation pipeline, Awk by default provides all the transformation plumbing. Let's explore that through the above program by asking a basic question: Where is the 'read data from the console' structure?

The answer to that is – it's built-in. In particular, lines 7 – 17 tell Awk what to do with each line that is read. Given that context, it's pretty easy to see that lines 1 – 6 are executed before anything is read.

More specifically, the **BEGIN** keyword on line 1 is a kind of "pattern," in this case indicating to Awk that, before reading any data, it should execute what follows the **BEGIN** in the { … }. A similar **END** keyword, not used in this program, indicates to Awk what to do when everything has been read.

Coming back to lines 7 – 17, we see they create a block of code { … } that is similar, but there is no keyword in front. Because there is nothing before the **{** for Awk to match, it will apply this line to every line of input received. Each line of input will be entered as guesses by the user.

Let's look at the code being executed. First, the preamble that happens before any input is read.

In line 2, we initialize the random number generator with the number 42 (if we don't provide an argument, the system clock is used). 42? [Of course 42][5]. Line 3 calculates a random number between 1 and 100, and line 4 prints that number out for debugging purposes. Line 5 invites the user to guess a number. Note this line uses `printf`, not `print`. Like C, `printf'`s first argument is a template used to format the output.

Now that the user is aware the program expects input, she can type a guess on the console. Awk supplies this guess to the code in lines 7 – 17, as mentioned previously. Line 18 converts the input record to an integer; `$0` indicates the entire input record, whereas `$1` indicates the first field of the input record, `$2` the second, and so on. Yup, Awk splits an input line into constituent fields, using the predefined separator, which defaults to white space. Lines 9 – 15 compare the guess to the random number, printing appropriate responses. If the guess is correct, line 15 exits prematurely from the input line processing pipeline.

Simple!

Given the unusual structure of Awk programs as code snippets that react to specific input line configurations and do stuff with the data, let’s look at an alternative structure just to see how the filtering part works:


```
     1    BEGIN {
     2        srand(42)
     3        randomNumber = int(rand() * 100) + 1
     4        print "random number is",randomNumber
     5        printf "guess a number between 1 and 100\n"
     6    }
     7    int($0) &lt; randomNumber {
     8        printf "too low, try again: "
     9    }
    10    int($0) &gt; randomNumber {
    11        printf "too high, try again: "
    12    }
    13    int($0) == randomNumber {
    14        printf "that's right\n"
    15        exit
    16    }
```

Lines 1 – 6 haven’t changed. But now we see that lines 7 – 9 is code that is executed when the integer value of the line is less than the random number, lines 10 – 12 is code that is executed when the integer value of the line is greater than the random number, and lines 13 – 16 is code that is executed when the two match.

This should seem "cool but weird" – why would we repeatedly calculate `int($0)`, for example? And for sure, it would be a weird way to solve the problem. But those patterns can be really quite wonderful ways to separate conditional processing since they can employ regular expressions or any other structure supported by Awk.

For completeness, we can use these patterns to separate common computations from things that only apply to specific circumstances. Here’s a third version to illustrate:


```
     1    BEGIN {
     2        srand(42)
     3        randomNumber = int(rand() * 100) + 1
     4        print "random number is",randomNumber
     5        printf "guess a number between 1 and 100\n"
     6    }
     7    {
     8        guess = int($0)
     9    }
    10    guess &lt; randomNumber {
    11        printf "too low, try again: "
    12    }
    13    guess &gt; randomNumber {
    14        printf "too high, try again: "
    15    }
    16    guess == randomNumber {
    17        printf "that's right\n"
    18        exit
    19    }
```

Recognizing that, no matter what value of input comes in, it needs to be converted to an integer, we have created lines 7 – 9 to do just that. Now the three groups of lines, 10 – 12, 13 – 15 and 16 – 19, refer to the already-defined variable guess instead of converting the input line each time.

Let's go back to the list of things we wanted to learn:

  * variables – yup, Awk has those; we can infer that input data comes in as strings but can be converted to a numeric value when required
  * input – Awk just sends input through its "data transformation pipeline" approach to reading stuff
  * output – we have used Awk's `print` and `printf` procedures to write stuff to output
  * conditional evaluation – we have learned about Awk's _if-then-else_ and input filters that respond to specific input line configurations
  * loops – huh, imagine that! We didn't need a loop here, once again, thanks to the "data transformation pipeline" approach that Awk takes; the loop "just happens." Note the user can exit the pipeline prematurely by sending an end-of-file signal to Awk (a **CTRL-D** when using a Linux terminal window)



It's well worth considering the importance of not needing a loop to handle input. One reason Awk has remained viable for so long is that Awk programs are compact, and one of the reasons they are compact is there is no boilerplate required to read from the console or a file.

Let's run the program:


```
$ awk -f guess.awk
random number is 25
guess a number between 1 and 100: 50
too high, try again: 30
too high, try again: 10
too low, try again: 25
that's right
$
```

One thing we didn't cover was comments. An Awk comment begins with a `#` and ends with the end of line.

### Wrap up

Awk is incredibly powerful and this "guess the number" game is a great way to get started. It shouldn't be the end of your journey, though. You can [read about the history of Awk and Gawk (GNU Awk)][6], an expanded version of Awk and probably the one you have on your computer if you're running Linux, or [read all about the original from its initial developers][7].

You can also [download our cheatsheet][8] to help you keep track of everything you learn.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/learn-awk

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/FYJNEVERFOLLOWS)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/question-mark_chalkboard.jpg?itok=DaG4tje9 (question mark in chalk)
[2]: https://opensource.com/article/20/12/julia
[3]: https://opensource.com/article/20/12/learn-bash
[4]: https://opensource.com/article/20/9/awk-ebook
[5]: https://en.wikipedia.org/wiki/42_(number)#The_Hitchhiker's_Guide_to_the_Galaxy
[6]: https://www.gnu.org/software/gawk/manual/html_node/History.html
[7]: https://archive.org/details/pdfy-MgN0H1joIoDVoIC7
[8]: https://opensource.com/downloads/cheat-sheet-awk-features

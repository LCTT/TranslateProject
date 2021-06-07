[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Practice coding in Java by writing a game)
[#]: via: (https://opensource.com/article/20/12/learn-java)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Practice coding in Java by writing a game
======
Writing simple games is a fun way to learn a new programming language.
Put that principle to work to get started with Java.
![Learning and studying technology is the key to success][1]

My article about [learning different programming languages][2] lists five things you need to understand when starting a new language. An important part of learning a language, of course, is knowing what you intend to do with it.

I've found that simple games are both fun to write and useful in exploring a language's abilities. In this article, I demonstrate how to create a simple guessing game in Java.

### Install Java

To do this exercise, you must have Java installed. If you don't have it, check out these links to install Java on [Linux][3], [macOS, or Windows][4].

After installing it, run this Java command in a terminal to confirm the version you installed:


```
`$ java -version`
```

### Guess the number

This "guess the number" program exercises several concepts in programming languages: how to assign values to variables, how to write statements, and how to perform conditional evaluation and loops. It's a great practical experiment for learning a new programming language.

Here's my Java implementation:


```
package com.example.guess;

import java.util.Random;
import java.util.Scanner;
   
class Main {
    private static final [Random][5] r = new [Random][5]();
    private static final int NUMBER = r.nextInt(100) + 1;
    private static int guess = 0;

    public static void main([String][6][] args) {  
        Scanner player = new Scanner([System][7].in);
            [System][7].out.println("number is " + [String][6].valueOf(NUMBER)); //DEBUG
            while ( guess != NUMBER ) {
            // prompt player for guess
            [System][7].out.println("Guess a number between 1 and 100");
            guess = player.nextInt();
            if ( guess &gt; NUMBER ) {
                [System][7].out.println("Too high");
            } else if ( guess &lt; NUMBER ) {
                [System][7].out.println("Too low");
            } else {
                [System][7].out.println("That's right!");
                [System][7].exit(0);
            }
        }
  }
}
```

That's about 20 lines of code, excluding whitespace and trailing braces. Structurally, however, there's a lot going on, which I'll break down here.

#### Package declaration

The first line, `package com.example.guess`, is not strictly necessary in a simple one-file application like this, but it's a good habit to get into. Java is a big language, and new Java is written every day, so every Java project needs to have a unique identifier to help programmers tell one library from another.

When writing Java code, you should declare a `package` it belongs to. The format for this is usually a reverse domain name, such as `com.opensource.guess` or `org.slf4j.Logger`. As usual for Java, this line is terminated by a semicolon.

#### Import statements

The next lines of the code are import statements, which tell the Java compiler what libraries to load when building the executable application. The libraries I use here are distributed along with OpenJDK, so you don't need to download them yourself. Because they're not strictly a part of the core language, you do need to list them for the compiler.

The Random library provides access to pseudo-random number generation, and the Scanner library lets you read user input in a terminal.

#### Java class

The next part creates a Java class. Java is an object-oriented programming language, so its quintessential construct is a _class_. There are some very specific code ideas suggested by a class, and if you're new to programming, you'll pick up on them with practice. For now, think of a class as a box into which you place variables and code instructions, almost as if you were building a machine. The parts you place into the class are unique to that class, and because they're contained in a box, they can't be seen by other classes. More importantly, since there is only one class in this sample game, a class is self-sufficient: It contains everything it needs to perform its particular task. In this case, its task is the whole game, but in larger applications, classes often work together in a sort of daisy-chain to produce complex jobs.

In Java, each file generally contains one class. The class in this file is called `Main` to signify that it's the entry-point for this application. In a single-file application such as this, the significance of a main class is difficult to appreciate, but in a larger Java project with dozens of classes and source files, marking one `Main` is helpful. And anyway, it's easy to package up an application for distribution with a main class defined.

#### Java fields

In Java, as in C and C++, you must declare variables before using them. You can define "fields" at the top of a Java class. The word "field" is just a fancy term for a variable, but it specifically refers to a variable assigned to a class rather than one embedded somewhere in a function.

This game creates three fields: Two to generate a pseudo-random number, and one to establish an initial (and always incorrect) guess. The long string of keywords (`private static final`) leading up to each field may look confusing (especially when starting out with Java), but using a good IDE like Netbeans or Eclipse can help you navigate the best choice.

It's important to understand them, too. A _private_ field is one that's available only to its own class. If another class tries to access a private field, the field may as well not exist. In a one-class application such as this one, it makes sense to use private fields.

A _static_ field belongs to the class itself and not to a class instance. This doesn't make much difference in a small demo app like this because only one instance of the class exists. In a larger application, you may have a reason to define or redefine a variable each time a class instance is spawned.

A _final_ field cannot have its value changed. This application demonstrates this perfectly: The random number never changes during the game (a moving target wouldn't be very fair), while the player's guess _must_ change or the game wouldn't be winnable. For that reason, the random number established at the beginning of the game is final, but the guess is not.

#### Pseudo-random numbers

Two fields create the random number that serves as the player's target. The first creates an instance of the `Random` class. This is essentially a random seed from which you can draw a pretty unpredictable number. To do this, list the class you're invoking followed by a variable name of your choice, which you set to a new instance of the class: `Random r = new Random();`. Like other Java statements, this terminates with a semicolon.

To draw a number, you must create another variable using the `nextInt()` method of Java. The syntax looks a little different, but it's similar: You list the kind of variable you're creating, you provide a name of your choice, and then you set it to the results of some action: `int NUMBER = r.nextInt(100) + 1;`. You can (and should) look at the documentation for specific methods, like `nextInt()`, to learn how they work, but in this case, the integer drawn from the `r` random seed is limited _up to_ 100 (that is, a maximum of 99). Adding 1 to the result ensures that a number is never 0 and the functional maximum is 100.

Obviously, the decision to disqualify any number outside of the 1 to 100 range is a purely arbitrary design decision, but it's important to know these constraints before sitting down to program. Without them, it's difficult to know what you're coding toward. If possible, work with a person whose job it is to define the application you're coding. If you have no one to work with, make sure to list your targets first—and only then put on your "coder hat."

### Main method

By default, Java looks for a `main` method (or "function," as they're called in many other languages) to run in a class. Not all classes need a main method, but this demo app only has one method, so it may as well be the main one. Methods, like fields, can be made public or private and static or non-static, but the main method must be public and static for the Java compiler to recognize and utilize it.

### Application logic

For this application to work as a game, it must continue to run _while_ the player takes guesses at a secret pseudo-random number. Were the application to stop after each guess, the player would only have one guess and would very rarely win. It's also part of the game's design that the computer provides hints to guide the player's next guess.

A `while` loop with embedded `if` statements achieves this design target. A `while` loop inherently continues to run until a specific condition is met. (In this case, the `guess` variable must equal the `NUMBER` variable.) Each guess can be compared to the target `NUMBER` to prompt helpful hints.

### Syntax

The main method starts by creating a new `Scanner` instance. This is the same principle as the `Random` instance used as a pseudo-random seed: You cite the class you want to use as a template, provide a variable name (I use `player` to represent the person entering guesses), and then set that variable to the results of running the class' main method. Again, if you were coding this on your own, you'd look at the class' documentation to get the syntax when using it.

This sample code includes a debugging statement that reveals the target `NUMBER`. That makes the game moot, but it's useful to prove to yourself that it's working correctly. Even this small debugging statement reveals some important Java tips: `System.out.println` is a print statement, and the `valueOf()` method converts the integer `NUMBER` to a string to print it as part of a sentence rather than an element of math.

The `while` statement begins next, with the sole condition that the player's `guess` is not equal to the target `NUMBER`. This is an infinite loop that can end only when it's _false_ that `guess` does _not_ equal `NUMBER`.

In this loop, the player is prompted for a number. The Scanner object, called `player`, takes any valid integer entered by the player and puts its value into the `guess` field.

The `if` statement compares `guess` to `NUMBER` and responds with `System.out.println` print statements to provide feedback to the human player.

If `guess` is neither greater than nor less than `NUMBER`, then it must be equal to it. At this point, the game prints a congratulatory message and exits. As usual with [POSIX][8] application design, this game exits with a 0 status to indicate success.

### Run the game

To test your game, save the sample code as `Guess.java` and use the Java command to run it:


```
$ java ./Guess.java
number is 38
Guess a number between 1 and 100
1
Too low
Guess a number between 1 and 100
39
Too high
Guess a number between 1 and 100
38
That's right!
$
```

Just as expected!

### Package the game

While it isn't as impressive on a single-file application like this as it is on a complex project, Java makes packaging very easy. For the best results, structure your project directory to include a place for your source code, a place for your compiled class, and a manifest file. In practice, this is somewhat flexible, and using an IDE does most of the work for you. It's useful to do it by hand once in a while, though.

Create a project folder if you haven't already. Then create one directory called `src` to hold your source files. Save the sample code in this article as `src/Guess.java`:


```
$ mkdir src
$ mv sample.java src/Guess.java
```

Now, create a directory tree that mirrors the name of your Java package, which appears at the very top of your code:


```
$ head -n1 src/Guess.java
package com.example.guess;
$ mkdir -p com/example/guess
```

Create a new file called `Manifest.txt` with just one line of text in it:


```
`$ echo "Manifest-Version: 1.0" > Manifest.txt`
```

Next, compile your game into a Java class. This produces a file called `Main.class` in `com/example/guess`:


```
$ javac src/Guess.java -d com/example/guess
$ ls com/example/guess/
Main.class
```

You're all set to package your application into a JAR (Java archive). The `jar` command is a lot like the [tar][9] command, so many of the options may look familiar:


```
$ jar cfme Guess.jar \
Manifest.txt \
com.example.guess.Main \
com/example/guess/Main.class
```

From the syntax of the command, you may surmise that it creates a new JAR file called `Guess.jar` with its required manifest data located in `Manifest.txt`. Its main class is defined as an extension of the package name, and the class is `com/example/guess/Main.class`.

You can view the contents of the JAR file:


```
$ jar tvf Guess.jar
     0 Wed Nov 25 10:33:10 NZDT 2020 META-INF/
    96 Wed Nov 25 10:33:10 NZDT 2020 META-INF/MANIFEST.MF
  1572 Wed Nov 25 09:42:08 NZDT 2020 com/example/guess/Main.class
```

And you can even extract it with the `xvf` options.

Run your JAR file with the `java` command:


```
`$ java -jar Guess.jar`
```

Copy your JAR file from Linux to a macOS or Windows computer and try running it. Without recompiling, it runs as expected. This may seem normal if your basis of comparison is, say, a simple Python script that happens to run anywhere, but imagine a complex project with several multimedia libraries and other dependencies. With Java, those dependencies are packaged along with your application, and it _all_ runs on _any_ platform. Welcome to the wonderful world of Java!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/learn-java

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/studying-books-java-couch-education.png?itok=C9gasCXr (Learning and studying technology is the key to success)
[2]: https://opensource.com/article/20/10/learn-any-programming-language
[3]: https://opensource.com/article/19/11/install-java-linux
[4]: http://adoptopenjdk.org
[5]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+random
[6]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[7]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
[8]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[9]: https://opensource.com/article/17/7/how-unzip-targz-file

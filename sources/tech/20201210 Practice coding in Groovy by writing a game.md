[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Practice coding in Groovy by writing a game)
[#]: via: (https://opensource.com/article/20/12/groovy)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansen)

Practice coding in Groovy by writing a game
======
Groovy streamlines Java's syntax, making it an easy language for
experienced Java coders to adopt.
![Business woman on laptop sitting in front of window][1]

You see the same basic concepts in most programming languages, such as:

  * Variables: Places where information is stored
  * Expressions: Ways to calculate things
  * Statements: How state changes are expressed in a program



Once you understand these concepts, you can start figuring out what makes one language different from another. For example, most languages have a "way of doing things" supported by their design, and those ways can be quite different from one program to another. These include modularity (grouping related functionality together), declarative vs. imperative, object-orientation, low- vs. high-level syntactic features, and so on.

An example that is familiar to many programmers is "ceremony," that is, the amount of work required to set the scene before tackling a problem. The Java programming language is said to have a significant ceremony requirement stemming from its design, which requires all code to be defined within a class.

But back to the basics. Programming languages usually share similarities like the ones mentioned above, so once you know one, you can start learning the basics of another to appreciate its differences. One way to expand on the languages you know is by using a basic test program to begin learning. That's what we're doing in this series of articles, using a "guess the number" program, in which the computer picks a number between one and 100 and asks you to guess it. The program loops until you guess the correct answer.

The "guess the number" program exercises several concepts in programming languages:

  * Variables
  * Input
  * Output
  * Conditional evaluation
  * Loops



It's also a great practical experiment to learn a new programming language.

### Guess the number in Groovy

[Groovy][2] is dynamically typed, feels like a scripting language, and has good support for interactive use. It was designed to leverage the Java Virtual Machine (JVM) ecosystem and has a high level of source compatibility with Java, along with its streamlined and high-level syntax features.

Here is my implementation of the "guess the number" game in Groovy (with line numbers so I can review some of the specific features):


```
 1      int randomNumber = (new [Random][3]()).nextInt(100) + 1
       
 2      println "the secret number is $randomNumber"
       
 3      print 'Guess a number: '
 4      [System][4].in.withReader { reader -&gt;
 5          [String][5] response
 6          while (response = reader.readLine()) {
 7              if (! response.isNumber())
 8                  print "that's not a number! try again: "
 9              else {
10                  int guess = response as [Integer][6]
11                  if (guess &lt; randomNumber)
12                      print 'too low, try again: '
13                  else if (guess &gt; randomNumber)
14                      print 'too high, try again: '
15                  else {
16                      println "that's right"
17                      break
18                  }
19              }
20          }
21      }
```

For those familiar with Java or C, the syntax will seem broadly familiar (unlike in Python, for example). In Groovy statements such as `if-then-else` or `while`, the `then`, `else`, and `while` parts take either a statement or a group of statements enclosed within `{` and `}`. Java programmers will note that Groovy provides streamlined support for scripting—no need for wrapping the program in a class definition.

Groovy is object-oriented and has access to the Java standard library.  In line 1 of my code, to generate a random number, it creates a new instance of the Random class and calls the nextInt()  method on it with an argument of 100, which will give a number between 0 and 99; and so we add one to this result.

One more thing to note: Groovy doesn't require semicolons to terminate lines when it can figure out the end of a statement from the presence of a newline.

The second statement prints out the number that was generated, for debugging purposes. Worth mentioning here is Groovy's active efforts to hide Java ceremony; in Java, this would be written:


```
`System.out.println("The secret number is " + randomNumber);`
```

The Groovy compiler takes away the need to prepend `System.out` in front of `println`. Groovy also makes parentheses in method invocations optional as long as the arguments can be clearly identified (but a method that takes no arguments still needs the `()` following the method name).

Another cool Groovy feature, visible in line 2, is the use of a `GString`. Note the `$` in front of `randomNumber` within the string, which causes the value of the variable `randomNumber` to be interpolated into the string. An expression can be interpolated using `${ }`.

In line 3, Groovy permits the use of single quotes instead of double quotes to delineate a `String` literal. Double quotes are required for a `GString`. This line prints a prompt for the person running the script.

I want to be able to read input from the console (typically a terminal window). Java defines the `System` static class and the `in` static field as a way to get at stuff the user is typing in the console. Statement 4 calls the `withReader` method on the `System.in` field to set up and tear down a line-oriented String reader—another example of Groovy's streamlining. `withReader` takes a closure as its argument—a kind of "anonymous code block," similar to a lambda in Java. When `withReader` calls the supplied closure, it passes the reader as an argument to the closure. The corresponding parameter is defined in the closure with the fragment `reader ->`.

This closure business is a really interesting feature in Groovy. Although it's similar to a lambda, it does not have lambda's limitations, such as only being able to refer to final or equivalent-to-final variables in the enclosing scope, so there's no need to worry much about the definition of `randomNumber` external to the closure.

The closure, which begins with the `{ reader ->` on line 4 and ends with the `}` on line 21, is the chunk of code that processes the user's input.

Within that closure is code that mostly looks familiar. Line 5 declares the `String` variable `response` (which is local to the closure). Line 6 starts a `while` loop that iterates as long as the user continues to guess, terminating if the line is empty or the user signals an end-of-file (say with a **Ctrl+D** in a Linux terminal window). This `while` loop ends with the `}` on line 20.

Note the expression tested by the `while` loop is:


```
`response = reader.readLine()`
```

Groovy has an extended definition of "truth." An expression that yields `true` is true, but so is an expression that yields a non-zero numeric value, non-empty string value, or non-null value. This expression will yield an empty string if the user presses return, or a `null` if the user types a **Ctrl+D**, which `System.in` turns into a `null`.

Lines 7 and 8 check to see if the user entered a `String` value that can be converted to a number and will complain if not. Instances of the Groovy `String` class (i.e., all Strings) have a method called `isNumber()` that can be used for this kind of test. Compare this usage to the typical Java approach, which uses a `try-catch` block.

Lines 9 through 19 process the value entered by the user. Line 10 converts the `String` value entered to an `Integer` using Groovy's `as` keyword, which can handle many coercions and conversions. The rest of the code tests whether the converted integer value is too low, too high, or just right. Note again the use of single quotes vs. double quotes, particularly in the `println` call on line 19, where double quotes are used to delimit the `String` literal because of the single quote within.

### Sample output

How well did this do in demonstrating the concepts I outlined earlier?

  * Variables: Yup, Groovy has those; see the `int` variables and `String` variables.
  * Input: I used `System.in` as predefined console input and a reader to get values from that.
  * Output: I used Groovy's `println` (Java's `System.out.println`) to print messages on the console.
  * Conditional evaluation: I explored Groovy's `if-then-else` as well as Groovy truth.
  * Loops: I used these in Groovy's `while` loop.



I also used some Java standard library functionality, such as the `isNumeric()` method on `String` instances and the `withReader()` method on `System.in`. I used a closure, kind of like a Java lambda.

Run the program to play the game:


```
$ groovy guess.groovy
the secret number is 29
Guess a number: 50
too high, try again: 25
too low, try again: 37
too high, try again: 31
too high, try again: 28
too low, try again: 29
that's right
$
```

I feel I should mention that the optimal way to play this game is to use a binary search strategy: Calculate in your head the mean of the most recent "too high" and the most recent "too low" and use that as your next guess.

One thing I didn't cover is comments. Like Java, Groovy comments can begin with a `//` and run to the end of the line or can be wrapped in `/* */`. I could comment out the debug `println` with a `//` in front to make it harder to cheat.

### Learn more

If you want to learn Groovy, start with the official [Groovy website][2]. I find [Hubert A. Klein Ikkink's musings][7] on Groovy, Grails, and Java to be extremely worthwhile. There are also many fine books about Groovy; even if they are somewhat dated, they are still worth reading. I like Venkat Subramaniam's [_Programming Groovy 2: Dynamic productivity for the Java developer_][8].

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/groovy

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF (Woman using laptop concentrating)
[2]: https://groovy-lang.org/
[3]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+random
[4]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
[5]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[6]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+integer
[7]: https://www.mrhaki.com/
[8]: https://www.bookdepository.com/Programming-Groovy-2-Venkat-Subramaniam/9781937785307

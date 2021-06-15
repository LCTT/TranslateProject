[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Learn a new old language by programming a game in Algol 68)
[#]: via: (https://opensource.com/article/20/12/learn-algol-68)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansen)

Learn a new old language by programming a game in Algol 68
======
Even "dead languages" can teach you a lot about programming today.
![Old UNIX computer][1]

In this article series, Opensource.com [Correspondents][2] and others have been writing the same "guess the number" game in various programming languages. This exercise shows how the basic concepts you'll find in most programming languages—variables, expressions, and statements—can be applied to learn new languages.

Most languages have a "way of doing things" that's supported by their design, and those ways can be quite different from one program to another. These ways include modularity (grouping related functionality together), declarative vs. imperative, object-orientation, low- vs. high-level syntactic features, and so on.

In the "guess the number" program, the computer picks a number between one and 100 and asks you to guess the number. The program loops until you guess the right answer.

In this article, I'll show you how to write this application in Algol 68. I'll also try to exercise the following concepts you'll find in any programming language:

  * Variables
  * Input
  * Output
  * Conditional evaluation
  * Loops



### Guess the number in Algol 68

This example uses the [Algol 68][3] Genie compiler, available in many Linux distros, created by [Marcel Van Der Veer][4].

OK, I can hear some of you out there moaning, "oh no, why Algol 68? That language is so old and has been irrelevant since before there were implementations." And I respect your opinions, I really do. Really. But I believe many cool things exist in today's programming languages that come from the hard thinking done by the designers of Algol 68, which justifies learning a bit about the language.

Algol 68 is statically typed and not particularly verbose. Algol 68 Genie compiles and executes in one go, so Algol 68 can feel a bit like a scripting language. The Genie implementation offers many useful hooks into our favorite operating system, which keeps it from feeling horribly dated and means a fair bit of useful work can be done with it.

Some points worth mentioning at the outset:

  * One of Algol 68's design principles is letting anything that could reasonably be thought of as an expression (a construct that delivers a value) be legal code.
  * Algol 68 "reserved words" are typically expressed as boldface symbols in the program source, which is kind of hard to do with text files, so most compilers have a way of indicating that a token is a reserved word. In Algol 68 Genie, the default is to use all upper case letters; for example, `BEGIN`, `IF`, `THEN`, etc.
  * Speaking of things like `BEGIN … END`, `IF … THEN … ELSE`, Algol 68 has a "closed syntax." A `BEGIN` must have a corresponding `END`, similar to `{ }` in C or Java; an `IF` must have a `FI`, and a `DO` must have an `OD`.
  * Algol 68 generally treats whitespace as irrelevant—even within numbers or variable names. Therefore, `myvariablename` and `my variable name` (and even `myvar iablename`) all refer to the same variable.
  * Algol 68 requires "go on symbols"—semicolons—between (but not following) statements in a sequence to be evaluated statement-by-statement.
  * Algol 68 incorporates a "string" type but does not provide a rich set of string processing primitives, which can be a bit frustrating.
  * Algol 68 is imperative rather than declarative and not object-oriented.



With that preamble, here is my "guess the number" implementation (with line numbers to make it easier to review some of the specific features):


```
 1      on logical file end (stand in,
 2          (REF FILE f) BOOL: (print(("Goodbye!",new line));stop));
       
 3      first random(42);
 4      INT random number = ENTIER (next random * 100.0) + 1;
       
 5      print(("the secret number is",random number,new line));
       
 6      print("guess a number: ");
 7      WHILE
 8          INT guess = read int;
 9          IF guess &lt; random number THEN
10              print("too low, try again: ");
11              TRUE
12          ELIF guess &gt; random number THEN
13              print("too high, try again: ");
14              TRUE
15          ELSE
16              print(("that's right",new line));
17              FALSE
18          FI
19      DO SKIP OD
```

### Breaking it down

Jumping right in: lines 1 and 2 define what happens when an end of file is detected on the input coming from the console.

This situation is managed by calling the procedure `on logical file end` and passing two arguments: a file to be monitored and a procedure to be called when the end of file is detected. The file you want to monitor is the standard input, `stand in`. Line 2 is the definition of the procedure; this is an expression that yields a procedure. It has one parameter, which is a pointer to a file named "f" that is written as `REF FILE f`. It returns a boolean value, indicated by `BOOL`.

The text after the `:` is the procedure body, which:

  * Starts with a brief begin symbol, `(`
  * Is followed by a call to the `print` procedure with a list of two arguments, the string `"Goodbye!"` and the `new line` procedure that will emit a newline in the output stream
  * Is followed by a "go on symbol"—the semicolon
  * Is followed by a call to the procedure `stop`
  * Is followed by the brief end symbol, `)`
  * Is followed by the parenthesis closing the list of arguments to the "on logical file end "call
  * Is followed by the "go on symbol," `;`



More verbosely, I could have written this procedure definition as:


```
(REF FILE f) BOOL: BEGIN
     print(("Goodbye!",new line));
     stop
END
```

It's probably worth mentioning that Algol 68 makes a very strong distinction between values and references to values. An Algol 68 value is conceptually similar to a constant or immutable or final value seen in many of today's popular programming languages. A value cannot be changed. A reference to a value, on the other hand, essentially defines a location where a value can be stored and the contents of that location can be changed. This corresponds to a variable, or mutable, or non-final value.

By way of concrete examples:


```
`INT forty two = 42`
```

defines an "integer value" named `forty two`, which evaluates to the number `42`.

And:


```
`INT fink := 42`
```

defines an integral variable `fink` and uses `:=` to assign the value `42` to it. This expression is actually shorthand for:


```
REF INT fink = LOC INT;
fink := 42
```

This makes the correspondence between values (`INT forty two`) and variables (`REF INT fink`) clearer at the expense of some verbosity. The `LOC INT` thing is a "local generator"—space for an integer value is allocated on the stack. There is also a "heap generator" useful for building structures that persist across procedure calls.

Phew! Back to the code.

Lines 3 and 4 initialize the system random number generator by calling the "setup" procedure first random() with an integer "seed" argument (which kinda hasta be 42, right?), then calling the procedure next random—which takes no arguments and therefore doesn't require parentheses with nothing between—and multiplies that by 100 to give a result between 0.0 and 99.9999…, truncating the result created using the unary operator ENTIER to give a result between 0 and 99, and finally adding 1 to give a result between 1 and 100.

Worth mentioning at this point is that Algol 68 seems to be the first language to support the definition of unary and binary operators, which are distinct from procedures. You must put parentheses around the expression:


```
`next random * 100.0`
```

because otherwise `ENTIER` would bind to the next random, giving the number 0, rather than to the whole expression.

On line 5 is a call to the `print` procedure, which is used here as a debugging thing. Notice the nested parentheses; `print` takes an argument that is either a printable value or expression or a list of printable values or expressions. When it's a list, you use a "denotation," which opens and closes with parentheses.

Line 6 uses `print` again to offer the single string `guess a number:`.

Lines 7 through 20 are a `WHILE … DO … OD` loop. A few interesting things here: First, all the work is done as a part of the logical expression evaluated by the `WHILE`, so the body of the loop contains only the reserved word `SKIP`, which means "do nothing."

Lines 8 through 17 are a sequence of two statements: the definition of the integer value `guess`, which is obtained by calling the procedure `read int` to get an integer from the input, followed by the `IF … THEN … ELIF … ELSE … FI` statement. Note that each of the `THEN`, `ELIF`, and `ELSE` parts end with a boolean value `TRUE` or `FALSE`. This causes the whole `IF… FI` statement to return either `TRUE` or `FALSE`, which, being the last statement in the sequence of statements, is the value "delivered" to `WHILE` to determine whether to loop around again or not.

A more typical language might have a structure similar to:


```
boolean doAgain = true;
while (doAgain) {
       if less then
            doAgain = true
       else if more then
            doAgain = true
       else
            doAgain = false
}
```

Because Algol 68 is expression-oriented, you don't need to declare that variable `doAgain`; you just incorporate the values to be generated into the expression being evaluated by the `WHILE` part.

What's cool about this is you can do things like the ternary operator in C—except much more broadly and better—with the standard `IF...FI`:


```
`do again := IF guess < random number THEN print("something"); TRUE ELIF guess > random number THEN print("something else"); TRUE ELSE print("another thing"); FALSE FI`
```

Note that I also took care not to declare anything as a mutable value when unnecessary. Since the value `guess` only has the scope of the `WHILE` loop, it just defines a new value each time.

One nagging little problem I didn't handle stems from the use of `read int`; if the frustrated user types in a value that is not convertible to an integer, the program will stop with an error condition. You could manage this problem by calling the procedure `on value error`, which is similar to the `on logical file end` procedure. I'll leave that for you to figure out. You didn't think you'd get away from this without an exercise, did you?

### What we learned

In the introduction, I listed the programming concepts this exercise should explore. How did I do?

  * **Variables:** This shows that Algol 68 thinks of variables as named locations and supports named (immutable) values.
  * **Input:** It used `stand in` as predefined console input and handled end-of-file conditions.
  * **Output:** It used `print` to print messages on the console.
  * **Conditional evaluation:** It used Algol 68 `if-then-else-fi` and `if` statements as expressions.
  * **Loops:** It used Algol 68's `while` loop, including using a sequence of statements to calculate the value to be tested.



It also used some Algol 68 standard library (which Algol 68 calls "standard prelude") functionality, including the random number generator and I/O exception testing.

Run the program:


```
$ a68g guess.a68
the secret number is        +26
guess a number: 50
too high, try again: 25
too low, try again: 37
too high, try again: 31
too high, try again: 28
too high, try again: 26
that's right
$
```

One thing I didn't cover is comments. In Algol 68 Genie, comments can begin and end with the symbol `COMMENT`, or `CO`, or `#`, as in:


```
`# this is a comment #`
```

If you're interested in exploring Algol 68, take a look at [Marcel's site][4] or the many contributed solutions in Algol 68 on [Rosetta Code][5].

In closing, back to the "dead languages" thing. Yes, it's a bit of an esoteric pursuit. But learning obscure languages is a great way to appreciate how far we've come (or, in some cases, not) and to give a more rounded perspective on language features we take for granted.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/learn-algol-68

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/retro_old_unix_computer.png?itok=SYAb2xoW (Old UNIX computer)
[2]: https://opensource.com/correspondent-program
[3]: http://www.algol68.org/
[4]: https://jmvdveer.home.xs4all.nl/en.algol-68-genie.html
[5]: http://www.rosettacode.org/wiki/Rosetta_Code

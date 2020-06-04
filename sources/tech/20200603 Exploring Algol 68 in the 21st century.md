[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Exploring Algol 68 in the 21st century)
[#]: via: (https://opensource.com/article/20/6/algol68)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansen)

Exploring Algol 68 in the 21st century
======
An in-depth look at a forgotten language and its modern applications.
![Old UNIX computer][1]

In the preface to his excellent textbook _Algol 68: A First and Second Course_, Andrew McGettrick writes:

> "This book originated from lectures first given at the University of Strathclyde in 1973-4 to first-year undergraduates, many of whom had no previous knowledge of programming. Many of the students were not taking computer science as their main subject but merely as a subsidiary subject. They, therefore, served as a suitable audience on whom to inflict lectures attempting to teach Algol 68 as a first programming language."

Perhaps this quote carries particular weight for me as I, too, was a first-year student in 1973-1974, though at a different institution—the University of British Columbia. Moreover, "back in those days," the introductory computer science course at UBC was taught in the second year using Waterloo FORTRAN with a bit of IBM 360 Assembler thrown in; nothing so exotic as Algol 68. In my case, I didn't encounter Algol 68 until my third year. Maybe this wait, along with experiences in other programming languages, contributed to my lifelong fascination with this underrated and wonderful programming language. And thanks to Marcel van der Veer, who has created [a very fine implementation of Algol 68][2] called Algol 68 Genie, that is now in my distro's repositories, at long last, I've been able to explore Algol 68 at my leisure. I should also mention that Marcel's book, [_Learning Algol 68 Genie_][3], is of great utility both for newcomers and as a refresher course in Algol 68.

Because I've been having so much fun rediscovering Algol 68, I thought I'd share some of my thoughts and impressions.

### What people say about Algol 68

If it's worth reading [the overview of Algol 68 on Wikipedia][4], then it's really worth reading this paragraph from the [_Revised Report on the Algorithmic Language Algol 68_][5]:

> "The original authors acknowledged with pleasure and thanks the wholehearted cooperation, support, interest, criticism, and violent objections from members of WG 2.1 and many other people interested in Algol."

"Criticism and violent objections"—wow! In fact, some committee members were so unhappy with the direction the committee was taking that they left and started their own language definition projects, at least partly as a protest against Algol 68. Niklaus Wirth, for example, fed up with the complexity of Algol 68, [went off to design Pascal][6]. And having written and supported a fair bit of Pascal code from about 1984 through 2000 or so, I am here to tell you that Pascal is about as far from Algol 68 as it's possible to get. Which, it seems to me, was Wirth's point.

Dennis Ritchie [gave a talk][7] at the second ACM History of Programming Languages conference in Cambridge, Massachusetts in 1993, in which he compares Bliss, Pascal, Algol 68, and C. In that talk, he made several interesting observations:

  * All of the four languages are "based on this old, old model of machines that pick up things, do operations, and put them someplace else" and "are very much influenced by Algol 60 and FORTRAN."
  * "When Steve Bourne (yes, the person who created the Bourne shell) came to Bell Labs with the Algol 68C compiler, he made it do the same things that C could do; it had Unix system call interfaces and so forth."
  * "I think the language really did suffer from its definition in terms of acceptance. Nevertheless, it was really quite practical."
  * "In some ways, Algol 68 is the most elegant of the languages I've been discussing. I think in some ways, it's even the most influential, although as a language in itself, it has nearly gone away."



There is much more opinion on Algol 68 still prominent on the Internet today. A lot of it is negative, but oh well! I suspect a great deal of it is not informed by actual use. One very interesting place to find coders just getting down to using the language (and many others, some marvelously obscure) is on [the Rosetta Code Wiki][8]. Go there and form your own opinion! Or follow me as I review what strikes me as great and not so great about Algol 68.

### What seems important and relevant to me about Algol 68

Algol 68, as a programming language, offers some distinctive and useful ideas that were innovative at the time and have shown up, to some degree or the other, in other languages since then.

#### Key design principles clearly explained in the Revised Report

The committee that designed Algol 68 was driven by a very clear set of principles:

  * Completeness and clarity of description (aided by the use of two-level grammar, which provoked many negative opinions)
  * Orthogonal design; that is, basic concepts defined in the language can be used anywhere that usage can be said to "make sense." As an example—every expression that can reasonably be expected to yield a value does, in fact, yield a value.
  * Security by way of careful syntactical design (that two-level grammar again); most errors thought to be related to semantic concepts in other languages can be detected at compile time.
  * Efficiency, in that programs should run efficiently (on the hardware of the day) without requiring significant efforts to optimize the generated code, and furthermore:
    * No run time-type checking except in the unique case of types that present alternative configurations at run time (`united` types in Algol 68, similar to `union` types in C)
    * Type-independent parsing (again, the two-level grammar at work here) and certainty that, in a finite number of steps, any input sequence can be evaluated as to whether it is a program or not
    * Loop structures that encourage the use of well-known loop optimization strategies of the day
    * A symbol set (with alternatives) that worked on the various different character sets available on computers at the time



I find it instructive to see the emphasis on very strong static typing (50 years ago!!) and the benefits that were expected to accrue, in contrast to today's universe of dynamically-typed languages and languages with weak static typing that have helped spawn an entire industry of run-time testing. (OK maybe that's not completely fair, but it contains a certain element of truth).

#### Structures to group statements together without extra grouping constructs

In programs written in Algol 60 and Pascal, we see a lot of `begin` and `end` tokens; in C, C++, Java, and so forth, we see a lot of `{` and `}`. For example, the simple expression to calculate the absolute value `av` of an integer value `iv` can be written in either Algol 60 or Pascal as:


```
`if iv < 0 then av := -iv else av := iv`
```

If we wanted to set a Boolean value stating whether `iv` was negative, then we need to start inserting `begin` and `end`:


```
`if iv < 0 then begin av := -iv; negative := true end else begin av := iv; negative := false end`
```

Formally, Algol 68 uses boldface for tokens with special meaning like **if** or **then**, and uses italics for names of things like the _print_() procedure.  This wasn't practical back in the day when many still used keypunches for coding, and it would still be a bit weird today.  So Algol 68 implementations usually provided some method of marking special symbols (called _stropping_), leaving everything else unmarked.  By default, Algol 68 Genie uses upper case stropping, so symbols like **if** are coded as IF, and names of things can only be in lower case.  Worth noting however is that it's completely ok to have a variable named "if" should that suit the purpose at hand. Anway... in case any reader is inclined to copy / paste, I'm using the Genie convention in my code samples.

Moreover, Algol 68 has a closed syntax, which the Bourne shell and Bash have inherited.  So the previous line of code in Algol 68 Genie would be:


```
`IF iv < 0 THEN av := -iv; negative := TRUE ELSE av := iv; negative := FALSE FI`
```

The token `fi` closes off the preceding `if`, in case that's not obvious. Now, perhaps I'm the only person in the world who has ever written some Java that looks like this:


```
if (something)
    statement;
```

and then found myself inserting a call to `println` to debug that code:


```
if (something)
    statement;
    [System][9].err.println(stuff);  /* not in the then-part of if!!! */
```

cluelessly forgetting to wrap the then-part in `{` … `}`. And of course, this isn't the end of the world, but when the insertion is something with less obvious results, well, let's just say I've spent a fair bit of time debugging this kind of thing over the years.

But that can't happen in Algol 68. Well, mostly, anyway. Algol 68 still needs `begin` … `end` for operator and procedure declarations. But `if` … `fi`, `do` … `od` and `case` … `esac` (the Algol 68 switch statement) are all closed.

We see this same concept in Go today; an "if" statement looks like if … { … }; the { and } are required. And as I already mentioned, the Bourne shell and its descendants use similar constructs.

#### Almost every expression yields a value

Look at the expression `iv < 0` above; pretty obvious that yields a value, and most likely that value is Boolean (`true` or `false`). So no big deal there.

But an assignment statement also yields a value, namely, the left-hand side of the assignment statement after the assignment is completed.

A sequence of statements yields whatever the final statement (or expression) yields as a value.

An "if" statement yields either the value of the then-part or the else-part, depending on whether the expression following "if" yields `true` or `false`.

An example: think of using the C, Java… ternary operator for our absolute value calculation:


```
`av = iv < 0 ? -iv : iv;`
```

In Algol 68, we don't need an extra "ternary operator," as the "if" statement works just fine:


```
`av := IF iv < 0 THEN -iv ELSE iv FI`
```

This might be a good moment to mention that Algol 68 provides "brief" versions of symbols like `begin`, `end`, `if`, `then`, `else` and so forth, using `( |` and `)`:


```
`av := ( iv < 0 | -iv | iv )`
```

has the same meaning as the previous expression.

One thing that surprised me when I first encountered it is that loops don't yield an expression. But loops have a few differences that end up making sense once they are fully understood.

A loop in Algol 68 might look like this:


```
`FOR lv FROM 1 BY 1 TO 1000 WHILE 2 * lv * ly < limit DO … OD`
```

The variable `ly` here is the loop variable, implicitly declared by the `for` as an integer. Its scope is the entire `for` … `od`**,** and its value is retained from one iteration to the next. We can declare a regular variable in the `while` … `do` part, just like in an `if` … `then` part. Its scope is the `while` … `od` part, but its value is not retained from one iteration to the next. So, for example, if we want to accumulate the sum of the elements of an array, we must write:


```
`INT sum := 0; FOR ai FROM LWB array TO UPB array DO sum +:= array[ai] OD`
```

where the operators `lwb` and `upb` deliver the smallest and largest index values respectively defined for the array and the +:= symbol has the same meaning as += in C or Java.

If we wanted to return the sum as a value, we would write:


```
`BEGIN INT sum := 0; FOR ai FROM LWB array TO UPB array DO sum +:= array[ai] OD; sum END`
```

Of course, we could replace `begin` and `end` with `(` and `)` for brevity. This expression would be a reasonable implementation of a procedure (or operator) that returns the sum of the values of the elements of an array.

#### Orthogonality—the same expression will work almost anywhere

Look again at the expression `iv < 0` above.

Let's step back a bit and include a definition of `iv` and the acquisition of its value. Then the code might look like:


```
`INT iv; read(iv); IF iv < 0 THEN … FI`
```

However, we could just as well write:


```
`IF INT iv; read(iv); iv < 0 THEN … FI`
```

Here we can see orthogonality at work - the declaration and reading of the variable can occur between the `if` and the logical expression testing the variable, because the value delivered is just that of the final expression. Moreover, this works with Algol 68 semantics to provide an interesting difference—in the first case, the scope of `iv` is the code surrounding the "if" statement; in the second, the scope is just between the `if` and the `fi`. To my way of thinking, this option means that we should have fewer variables declared far away from where they are used, and the ones that remain really do have a "long life" in the code.

This has practical importance as well. Think, for example, of code that uses some kind of SQL interface to execute several scripts in a database and return the values for further analysis. Usually, in this case, the programmer needs to do a bit of work to set up the connection to the database, pass a query string to the execute command, and retrieve the results. Each instance requires declaring some variables to hold the connection, the query string, and the results. How nice it is when these variables can be declared locally to the results accumulation code! This also facilitates adding a new query-analysis step with a quick copy-paste. And yes, it's good to turn these code snippets into procedure calls, especially in a language that supports lambdas (anonymous procedures) so as to avoid obscuring the different analysis steps with repeated administrative steps. But having very locally-defined administrative variables facilitates the refactoring effort required.

Another great consequence of orthogonality is that we can have the equivalent of the ternary operator on the left-hand side of an assignment statement as well as on the right-hand side.

Let's suppose we're processing an input stream of signed integers, and we want to accumulate positive integers into gains and negative integers into losses. Then, the following Algol 68 code would work:


```
`IF amount < 0 THEN losses +:= amount ELSE gains +:= amount FI`
```

However, there's no need to repeat the `+:= amount` here; we can move it outside the `if` … `fi` as follows:


```
`IF amount < 0 THEN losses ELSE gains FI +:= amount`
```

This works because the "if" statement yields either the losses or gains expression as a result of the evaluation of the test, and that expression is incremented by amount. And of course, we can use the brief form, which, in my opinion at least, improves the readability in these short expressions:


```
`(amount < 0 | losses | gains) +:= amount`
```

How about a real example to show why this expression-oriented thing is so great?

Suppose you are writing a hash table facility. Two functions you will have to implement are "get the value associated with a given key" and "set the value associated with a given key".

In an expression-oriented language, those can be one function. Why? Because the "get" operation returns the location where the value is found, and then the "set" operation simply uses the "get" operation to set the value at that location. Let's assume we've created an operator called `valueat` that takes two arguments—the hash table itself and the key value. Then,


```
`ht VALUEAT 42`
```

will return the location of key 42 in the hash table ht and


```
`ht VALUEAT 42 := "the meaning of everything"`
```

will put the string "the meaning of everything" at location 42.

This reduces the amount of code required to support the application at hand, reducing the number of pathways and edge cases that must be tested, and just generally adds wonderfulness to the users' and maintainers' lives.

There is a simple example of using procedures on the left-hand side of assignment statements to store values in a table on [RosettaCode][10].

#### Anonymous procedures (lambdas)

Everyone seems to want anonymous procedures (or "here" procedures, or lambdas) these days. Algol 68 provided that out of the box, and it's really, truly useful.

By way of example, imagine that you want to create a facility to read files with delimited fields and to give users a nice interaction pathway with those. Think of the fine job `awk` does on this, basically by abstracting away all the junk related to opening the file, reading the lines, splitting the lines into fields, and providing some useful collateral variables along the way, like current-line-number, number-of-fields-on-this-line, and so forth.

It turns out that's pretty easy to do in Algol 68 as well, where the task becomes to write a procedure that takes three arguments—the first being the input file name, the second being the field separator string, and the third being a procedure that handles each line.

The declaration of that procedure might look like this:


```
PROC each line =         # 1 #
        (STRING input file name, CHAR separator, PROC (STRING, [] STRING, INT) VOID process) # 2 #
VOID: BEGIN              # 3 #
    FILE inf;            # 4 #
    open(inf, input file name, stand in channel); # 5 #
    BOOL finished reading := FALSE;
    on logical file end (inf, (REF FILE f) bool: finished reading := TRUE); # 6 #
    INT linecount := 0;  # 7 #
    WHILE                # 8 #
        string line;
        get(inf,(line, new line));
        not finished reading
    DO                   # 9 #
        linecount +:= 1;
        FLEX [1:0] STRING fields := split(line, separator);
        process(line, fields, linecount)
    OD;
    close(inf)           # 10 #
END                      # 11 #
```

Here’s what’s going on above:

  1. Comment 1 (the # 1 # above)—the declaration of the procedure `each line` (note that blanks can be inserted into the middle of names or numbers at will)

  2. The parameters to each line—the `string` file name, the field separator `char`acter, and the `pro`cedure to be called to process each line, which itself takes a `string` (the line of input) an array of `string`s (the fields of the line) and an `int`eger (the line number) and which returns a `void` value

  3. `each line` returns a `void` value, and the procedure body starts with a `begin`, allowing us to use several statements in its definition

  4. Declare the input `file`

  5. Associate the `standard input channel` with the `file`, whose name is given by `input file name` and open it (for reading)

  6. Algol 68 handles end-of-file conditions a bit differently; here, we use the I/O event detection procedure `on logical file end` to set the flag `finished reading` that we can detect while processing the file

  7. Create and initialize the line count (see the previous description of the nature of loops)

  8. This `while` loop attempts to read the next line from the input file. If successful, it processes the line; otherwise, it exits

  9. Processing the input line—increment the line count; create an array of strings corresponding to the fields of the line using the `split` procedure; call the supplied `process` procedure to consume the line, its fields and the line count

  10. Remember to `close` the file

  11. `end` of the procedure definition.




And we might use it like so, in order to build a lookup table (in conjunction with the hypothetical hash table facility mentioned in passing in the previous section):


```
# remapping definitions in remapping.csv file #
# new-reference|old-reference #
# 093M0770371|093X0012250 #
# 093M0770375|093X0012249 #
# 093M0770370|093X0012133 #

[/code] [code]

HASTABLE ht := new hashtable;

each delimited line("test.csv", "|", (STRING line, [] STRING fields, INT linecount) VOID: BEGIN
    STRING to map := fields[1], from map := fields[2];
    ht VALUEAT from map := to map
END);
```

Above, we see the call to each delimited line. Of particular interest is the declaration of the "here" procedure or lambda that stows the lookup values into the hash table. From my perspective, the big lesson here is that lambdas are a consequence of Algol 68's orthogonality; I think that's pretty neat.

One of the things I plan to dig deeper into as I continue to explore Algol 68 is how much further I can take this functional form of expression. For example, I don't see why I can't build a list or a hash table element by element and yield the finished structure as the result of the looping procedure, so the above might look more like:


```
HASHTABLE ht := each delimited line as map entry("test.csv", "|",
        (STRING line, [] STRING fields, INT linecount) VOID: BEGIN
    STRING to map := fields[1], from map := fields[2];
    (from map, to map)
END);
```

### In conclusion

Why learn about old, dusty, and forgotten languages? Well, we all know about the recent interest in COBOL, but perhaps that's an outlier in the sense that there probably aren't a lot of mission-critical applications written in SNOBOL, Icon, APL, or even Algol 68. Certainly, there is George Santayana's guidance to bear in mind: ["Those who cannot remember the past are condemned to repeat it."][11]

For me, there are a few key reasons to up my game in Algol 68 (and probably in a few other languages that don't seem to be absolutely necessary to my daily efforts):

  * Algol 68 was not defined as a reaction against some annoyances in an existing programming language; rather, according to the Revised Report:

    * The committee (Working Group 2.1 on ALGOL of the International Federation for Information Processing) "expresses its belief in the value of a common programming language serving many people in many countries."

    * "Algol 68 has not been designed as an expansion of Algol 60 but rather as a completely new language based on new insight into the essential, fundamental concepts of computing and a new description technique."

  * Whether through positive contributions copied into other languages (`do` … `od` in the Bourne shell; += in C, Java, …) or negative reactions (Pascal and all its descendants, Ada), Algol 68 can claim to have influenced computing in profound ways.

  * While Algol 68 is very much "a child of its time," being influenced by keypunches and line printers, small and diverse character sets, the wide variation in character and word sizes of computers in the 1960s and 1970s, and not explicitly incorporating object orientation or functional programming, its rather extraordinary orthogonality and expression-orientedness make up for these oddities and lacking in other useful ways.

  * Perhaps the most practical reason is having the wonderful Algol 68 Genie interpreter installed and running on my desktop, allowing me to pursue this odd small hobby!




Perhaps I should return to Santayana for a final comment:

> ["Beauty as we feel it is something indescribable: what it is or what it means can never be said."][11]

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/algol68

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/retro_old_unix_computer.png?itok=SYAb2xoW (Old UNIX computer)
[2]: https://jmvdveer.home.xs4all.nl/en.algol-68-genie.html
[3]: https://jmvdveer.home.xs4all.nl/en.download.learning-algol-68-genie-283.html
[4]: https://en.wikipedia.org/wiki/ALGOL_68
[5]: http://www.softwarepreservation.org/projects/ALGOL/report/Algol68_revised_report-AB.pdf
[6]: https://en.wikipedia.org/wiki/Pascal_(programming_language)
[7]: https://www.bell-labs.com/usr/dmr/www/hopl.html
[8]: http://rosettacode.org/wiki/Rosetta_Code
[9]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
[10]: https://rosettacode.org/wiki/Associative_array/Creation#ALGOL_68
[11]: https://en.wikiquote.org/wiki/George_Santayana

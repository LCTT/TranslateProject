[#]: subject: "Start programming in Racket by writing a "guess the number" game"
[#]: via: "https://opensource.com/article/21/1/racket-guess-number"
[#]: author: "Cristiano L. Fontana https://opensource.com/users/cristianofontana"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Start programming in Racket by writing a "guess the number" game
======
Racket is a great way to learn a language from the Scheme and Lisp families.

![Person using a laptop][1]

I am a big advocate of learning multiple programming languages. That's mostly because I tend to get bored with the languages I use the most. It also teaches me new and interesting ways to approach programming.

Writing the same program in multiple languages is a good way to learn their differences and similarities. Previously, I wrote articles showing the same sample data plotting program written in [C & C++][2], JavaScript with [Node.js][3], and [Python and Octave][4].

This article is part of another series about writing a "guess the number" game in different programming languages. In this game, the computer picks a number between one and 100 and asks you to guess it. The program loops until you make a correct guess.

### Learning a new language

Venturing into a new language always feels awkward—I feel like I am losing time since it would be much quicker to use the tools I know and use all the time. Luckily, at the start, I am also very enthusiastic about learning something new, and this helps me overcome the initial pain. And once I learn a new perspective or a solution that I would never have thought of, things become interesting! Learning new languages also helps me backport new techniques to my old and tested tools.

When I start learning a new language, I usually look for a tutorial that introduces me to its [syntax][5]. Once I have a feeling for the syntax, I start working on a program I am familiar with and look for examples that will adapt to my needs.

### What is Racket?

[Racket][6] is a programming language in the [Scheme family][7], which is a dialect of [Lisp][8]. Lisp is also a family of languages, which can make it hard to decide which "dialect" to start with when you want to learn Lisp. All of the implementations have various degrees of compatibility, and this plethora of options might turn away newbies. I think that is a pity because these languages are really fun and stimulating!

Starting with Racket makes sense because it is very mature and versatile, and the community is very active. Since Racket is a Lisp-like language, a major characteristic is that it uses the [prefix notation][9] and a [lot of parentheses][10]. Functions and operators are applied to a list of operands by prefixing them:

```
(function-name operand operand ...)

(+ 2 3)
↳ Returns 5

(list 1 2 3 5)
↳ Returns a list containing 1, 2, 3, and 5

(define x 1)
↳ Defines a variable called x with value of 1

(define (f x y) (* x x))
↳ Defines a function called f with two parameters called x and y that returns their product.
```

This is basically all there is to know about Racket syntax; the rest is learning the functions from the [documentation][11], which is very thorough. There are other aspects of the syntax, like [keyword arguments][12] and [quoting][13], but you do not need them for this example.

Mastering Racket might be difficult, and its syntax might look weird (especially if you are used to languages like Python), but I find it very fun to use. A big bonus is Racket's programming environment, [DrRacket][14], which is very supportive, especially when you are getting started with the language.

The major Linux distributions offer packaged versions of Racket, so [installation][15] should be easy.

### Guess the number game in Racket

Here is a version of the "guess the number" program written in Racket:

```
#lang racket

(define (inquire-user number)
  (display "Insert a number: ")
  (define guess (string->number (read-line)))
  (cond [(> number guess) (displayln "Too low") (inquire-user number)]
        [(< number guess) (displayln "Too high") (inquire-user number)]
        [else (displayln "Correct!")]))

(displayln "Guess a number between 1 and 100")
(inquire-user (random 1 101))
```

Save this listing to a file called `guess.rkt` and run it:

```
$ racket guess.rkt
```

Here is some example output:

```
Guess a number between 1 and 100
Insert a number: 90
Too high
Insert a number: 50
Too high
Insert a number: 20
Too high
Insert a number: 10
Too low
Insert a number: 12
Too low
Insert a number: 13
Too low
Insert a number: 14
Too low
Insert a number: 15
Correct!
```

### Understanding the program

I'll go through the program line by line. The first line declares the language the listing is written into: `#lang racket`. This might seem strange, but Racket is very good at [writing interpreters][16] for new [domain-specific languages][17]. Do not panic, though! You can use Racket as it is because it is very rich in tools.

Now for the next line. `(define ...)` is used to declare new variables or functions. Here, it defines a new function called `inquire-user` that accepts the parameter `number`. The `number` parameter is the random number that the user will have to guess. The rest of the code inside the parentheses of the `define` procedure is the body of the `inquire-user` function. Notice that the function name contains a dash; this is Racket's idiomatic style for writing a long variable name.

This function recursively calls itself to repeat the question until the user guesses the right number. Note that I am not using loops; I feel that Racket programmers do not like loops and only use recursive functions. This approach is idiomatic to Racket, but if you prefer, [loops are an option][18].

The first step of the `inquire-user` function asks the user to insert a number by writing that string to the console. Then it defines a variable called `guess` that contains whatever the user entered. The [read-line function][19] returns the user input as a string. The string is then converted to a number with the [string->number function][20]. After the variable definition, the [cond function][21] accepts a series of conditions. If a condition is satisfied, it executes the code inside that condition. These conditions, `(> number guess)` and `(< number guess)`, are followed by two functions: a `displayln` that gives clues to the user and a `inquire-user` call. The function calls itself again when the user does not guess the right number. The `else` clause executes when the two conditions are not met, i.e., the user enters the correct number. The program's guts are this `inquire-user` function.

However, the function still needs to be called! First, the program asks the user to guess a number between 1 and 100, and then it calls the `inquire-user` function with a random number. The random number is generated with the [random function][22]. You need to inform the function that you want to generate a number between 1 and 100, but the `random` function generates integer numbers up to `max-1`, so I used 101.

### Try Racket

Learning new languages is fun! I am a big advocate of programming languages polyglotism because it brings new, interesting approaches and insights to programming. Racket is a great opportunity to start learning how to program with a Lisp-like language. I suggest you give it a try.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/racket-guess-number

作者：[Cristiano L. Fontana][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cristianofontana
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/laptop_screen_desk_work_chat_text.png
[2]: https://opensource.com/article/20/2/c-data-science
[3]: https://opensource.com/article/20/6/data-science-nodejs
[4]: https://opensource.com/article/20/2/python-gnu-octave-data-science
[5]: https://en.wikipedia.org/wiki/Syntax_(programming_languages)
[6]: https://racket-lang.org/
[7]: https://en.wikipedia.org/wiki/Scheme_(programming_language)
[8]: https://en.wikipedia.org/wiki/Lisp_(programming_language)
[9]: https://en.wikipedia.org/wiki/Polish_notation
[10]: https://xkcd.com/297/
[11]: https://docs.racket-lang.org/
[12]: https://rosettacode.org/wiki/Named_parameters#Racket
[13]: https://docs.racket-lang.org/guide/quote.html
[14]: https://docs.racket-lang.org/drracket/
[15]: https://download.racket-lang.org/
[16]: https://docs.racket-lang.org/guide/hash-languages.html
[17]: https://en.wikipedia.org/wiki/Domain-specific_language
[18]: https://docs.racket-lang.org/heresy/conditionals.html
[19]: https://docs.racket-lang.org/reference/Byte_and_String_Input.html?q=read-line#%28def._%28%28quote._~23~25kernel%29._read-line%29%29
[20]: https://docs.racket-lang.org/reference/generic-numbers.html?q=string-%3Enumber#%28def._%28%28quote._~23~25kernel%29._string-~3enumber%29%29
[21]: https://docs.racket-lang.org/reference/if.html?q=cond#%28form._%28%28lib._racket%2Fprivate%2Fletstx-scheme..rkt%29._cond%29%29
[22]: https://docs.racket-lang.org/reference/generic-numbers.html?q=random#%28def._%28%28lib._racket%2Fprivate%2Fbase..rkt%29._random%29%29

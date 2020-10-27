[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 steps to learn any programming language)
[#]: via: (https://opensource.com/article/20/10/learn-any-programming-language)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

5 steps to learn any programming language
======
With just a little programming experience, you can learn a new language
in just a few days (sometimes less).
![Learning to program][1]

Some people love learning new programming languages. Other people can't imagine having to learn even one. In this article, I'm going to show you how to think like a coder so that you can confidently learn any programming language you want.

The truth is, once you've learned how to program, the language you use becomes less of a hurdle and more of a formality. In fact, that's just one of the many reasons educators say to [teach kids to code early][2]. Regardless of how simple their introductory language may be, the logic remains the same across everything else children (or adult learners) are likely to encounter later.

With just a little programming experience, which you can gain from any one of several introductory articles here on Opensource.com, you can go on to learn _any_ programming language in just a few days (sometimes less). Now, this isn't magic, and you do have to put some effort into it. And admittedly, it takes a lot longer than just a few days to learn every library available to a language or to learn the nuances of packaging your code for delivery. But getting started is easier than you might think, and the rest comes naturally with practice.

When experienced programmers sit down to learn a new language, they're looking for five things. Once you know those five things, you're ready to start coding.

### 1\. Syntax

![Syntax][3]

(Seth Kenlon, [CC BY-SA 4.0][4])

The syntax of a language describes the structure of code. This encompasses both how the code is written on a line-by-line basis as well as the actual words used to construct code statements.

[Python][5], for instance, is known for using indentation to indicate where one block ends and another one starts:


```
while j &lt; rows:
    while k &lt; columns:
        tile = Tile(k * w)
        board.add(tile)
        k += 1
    j += 1
    k = 0
```

[Lua][6] just uses the keyword `end`:


```
for i,obj in ipairs(hit) do
  if obj.moving == 1 then
     obj.x,obj.y = v.mouse.getPosition()
  end
end
```

[Java][7], [C][8], C++, and similar languages use braces:


```
while (std::getline(e,r)) {
  wc++;
  }
```

A language's syntax also involves things like including libraries, setting variables, and terminating lines. With practice, you'll learn to recognize syntactical requirements (and conventions) almost subliminally as you read sample code.

#### Take action

When learning a new programming language, strive to understand its syntax. You don't have to memorize it, just know where to look, should you forget. It also helps to use a good [IDE][9], because many of them alert you of syntax errors as they occur.

### 2\. Built-ins and conditionals

![built-in words][10]

(Seth Kenlon, [CC BY-SA 4.0][4])

A programming language, just like a natural language, has a finite number of words it recognizes as valid. This vocabulary can be expanded with additional libraries, but the core language knows a specific set of keywords. Most languages don't have as many keywords as you probably think. Even in a very low-level language like C, there are only 32 words, such as `for`, `do`, `while`, `int`, `float`, `char`, `break`, and so on.

Knowing these keywords gives you the ability to write basic expressions, the building blocks of a program. Many of the built-in words help you construct conditional statements, which influence the flow of your program. For instance, if you want to write a program that lets you click and drag an icon, then your code must detect when the user's mouse cursor is positioned over an icon. The code that causes the mouse to grab the icon must execute only _if_ the mouse cursor is within the same coordinates as the icon's outer edges. That's a classic if/then statement, but different languages can express that differently.

Python uses a combination of `if`, `elif`, and `else` but doesn't explicitly close the statement:


```
if var == 1:
    # action
elif var == 2:
    # some action
else:
    # some other action
```

[Bash][11] uses `if`, `elif`, `else`, and uses `fi` to end the statement:


```
if [ "$var" = "foo" ]; then
   # action
elif [ "$var" = "bar" ]; then
   # some action
else
   # some other action
fi
```

C and Java, however, use `if`, `else`, and `else if`, enclosed by braces:


```
if (boolean) {
   // action
} else if (boolean) {
   // some action
} else {
   // some other action
}
```

While there are small variations in word choice and syntax, the basics are always the same. Learn the ways to define conditions in the programming language you're learning, including `if/then`, `do...while`, and `case` statements.

#### Take action

Get familiar with the core set of keywords a programming language understands. In practice, your code will contain more than just a language's core words, because there are almost certainly libraries containing lots of simple functions to help you do things like print output to the screen or display a window. The logic that drives those libraries, however, starts with a language's built-in keywords.

### 3\. Data types

![Data types][12]

(Seth Kenlon, [CC BY-SA 4.0][4])

Code deals with data, so you must learn how a programming language recognizes different kinds of data. All languages understand integers and most understand decimals and individual characters (a, b, c, and so on). These are often denoted as `int`, `float` and `double`, and `char`, but of course, the language's built-in vocabulary informs you of how to refer to these entities.

Sometimes a language has extra data types built into it, and other times complex data types are enabled with libraries. For instance, Python recognizes a string of characters with the keyword `str`, but C code must include the `string.h` header file for string features.

#### Take action

Libraries can unlock all manner of data types for your code, but learning the basic ones included with a language is a sensible starting point.

### 4\. Operators and parsers

![Operators][13]

(Seth Kenlon, [CC BY-SA 4.0][4])

Once you understand the types of data a programming language deals in, you can learn how to analyze that data. Luckily, the discipline of mathematics is pretty stable, so math operators are often the same (or at least very similar) across many languages. For instance, adding two integers is usually done with a `+` symbol, and testing whether one integer is greater than another is usually done with the `>` symbol. Testing for equality is usually done with `==` (yes, that's two equal symbols, because a single equal symbol is usually reserved to _set_ a value).

There are notable exceptions to the obvious in languages like Lisp and Bash, but as with everything else, it's just a matter of mental transliteration. Once you know _how_ the expression is different, it's trivial for you to adapt. A quick review of a language's math operators is usually enough to get a feel for how math is done.

You also need to know how to compare and operate on non-numerical data, such as characters and strings. These are often done with a language's core libraries. For instance, Python features the `split()` method, while C requires `string.h` to provide the `strtok()` function.

#### Take action

Learn the basic functions and keywords for manipulating basic data types, and look for core libraries that help you accomplish complex actions.

### 5\. Functions

![Class][14]

(Seth Kenlon, [CC BY-SA 4.0][4])

Code usually isn't just a to-do list for a computer. Typically when you write code, you're looking to present a computer with a set of theoretical conditions and a set of instructions for actions that must be taken when each condition is met. While flow control with conditional statements and math and logic operators can do a lot, code is a lot more efficient once functions and classes are introduced because they let you define subroutines. For instance, should an application require a confirmation dialogue box very frequently, it's a lot easier to write that box _once_ as an instance of a class rather than re-writing it each time you need it to appear throughout your code.

You need to learn how classes and functions are defined in the programming language you're learning. More precisely, first, you need to learn whether classes and functions are available in the programming language. Most modern languages do support functions, but classes are specialized constructs common to object-oriented languages.

#### Take action

Learn the constructs available in a language that help you write and use code efficiently.

### You can learn anything

Learning a programming language is, in itself, a sort of subroutine of the coding process. Once you understand the theory behind how code works, the language you use is just a medium for delivering logic. The process of learning a new language is almost always the same: learn syntax through simple exercises, learn vocabulary so you can build up to performing complex actions, and then practice, practice, practice.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/learn-any-programming-language

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/learn-programming-code-keyboard.png?itok=xaLyptT4 (Learning to program)
[2]: https://opensource.com/article/20/9/scratch
[3]: https://opensource.com/sites/default/files/uploads/syntax_0.png (Syntax)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/downloads/cheat-sheet-python-37-beginners
[6]: https://opensource.com/article/20/2/lua-cheat-sheet
[7]: https://opensource.com/downloads/java-cheat-sheet
[8]: https://opensource.com/downloads/c-programming-cheat-sheet
[9]: https://opensource.com/resources/what-ide
[10]: https://opensource.com/sites/default/files/uploads/builtin.png (built-in words)
[11]: https://opensource.com/downloads/bash-cheat-sheet
[12]: https://opensource.com/sites/default/files/uploads/type.png (Data types)
[13]: https://opensource.com/sites/default/files/uploads/operator.png (Operators)
[14]: https://opensource.com/sites/default/files/uploads/class.png (Class)

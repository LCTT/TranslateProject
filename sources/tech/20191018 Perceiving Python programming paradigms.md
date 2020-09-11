[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Perceiving Python programming paradigms)
[#]: via: (https://opensource.com/article/19/10/python-programming-paradigms)
[#]: author: (Jigyasa Grover https://opensource.com/users/jigyasa-grover)

Perceiving Python programming paradigms
======
Python supports imperative, functional, procedural, and object-oriented
programming; here are tips on choosing the right one for a specific use
case.
![A python with a package.][1]

Early each year, TIOBE announces its Programming Language of The Year. When its latest annual [TIOBE index][2] report came out, I was not at all surprised to see [Python again winning the title][3], which was based on capturing the most search engine ranking points (especially on Google, Bing, Yahoo, Wikipedia, Amazon, YouTube, and Baidu) in 2018.

![Python data from TIOBE Index][4]

Adding weight to TIOBE's findings, earlier this year, nearly 90,000 developers took Stack Overflow's annual [Developer Survey][5], which is the largest and most comprehensive survey of people who code around the world. The main takeaway from this year's results was:

> "Python, the fastest-growing major programming language, has risen in the ranks of programming languages in our survey yet again, edging out Java this year and standing as the second most loved language (behind Rust)."

Ever since I started programming and exploring different languages, I have seen admiration for Python soaring high. Since 2003, it has consistently been among the top 10 most popular programming languages. As TIOBE's report stated:

> "It is the most frequently taught first language at universities nowadays, it is number one in the statistical domain, number one in AI programming, number one in scripting and number one in writing system tests. Besides this, Python is also leading in web programming and scientific computing (just to name some other domains). In summary, Python is everywhere."

There are several reasons for Python's rapid rise, bloom, and dominance in multiple domains, including web development, scientific computing, testing, data science, machine learning, and more. The reasons include its readable and maintainable code; extensive support for third-party integrations and libraries; modular, dynamic, and portable structure; flexible programming; learning ease and support; user-friendly data structures; productivity and speed; and, most important, community support. The diverse application of Python is a result of its combined features, which give it an edge over other languages.

But in my opinion, the comparative simplicity of its syntax and the staggering flexibility it provides developers coming from many other languages win the cake. Very few languages can match Python's ability to conform to a developer's coding style rather than forcing him or her to code in a particular way. Python lets more advanced developers use the style they feel is best suited to solve a particular problem.

While working with Python, you are like a snake charmer. This allows you to take advantage of Python's promise to offer a non-conforming environment for developers to code in the style best suited for a particular situation and to make the code more readable, testable, and coherent.

## Python programming paradigms

Python supports four main [programming paradigms][6]: imperative, functional, procedural, and object-oriented. Whether you agree that they are valid or even useful, Python strives to make all four available and working. Before we dive in to see which programming paradigm is most suitable for specific use cases, it is a good time to do a quick review of them.

### Imperative programming paradigm

The [imperative programming paradigm][7] uses the imperative mood of natural language to express directions. It executes commands in a step-by-step manner, just like a series of verbal commands. Following the "how-to-solve" approach, it makes direct changes to the state of the program; hence it is also called the stateful programming model. Using the imperative programming paradigm, you can quickly write very simple yet elegant code, and it is super-handy for tasks that involve data manipulation. Owing to its comparatively slower and sequential execution strategy, it cannot be used for complex or parallel computations.

[![Linus Torvalds quote][8]][9]

Consider this example task, where the goal is to take a list of characters and concatenate it to form a string. A way to do it in an imperative programming style would be something like:


```
&gt;&gt;&gt; sample_characters = ['p','y','t','h','o','n']
&gt;&gt;&gt; sample_string = ''
&gt;&gt;&gt; sample_string
''
&gt;&gt;&gt; sample_string = sample_string + sample_characters[0]
&gt;&gt;&gt; sample_string
'p'
&gt;&gt;&gt; sample_string = sample_string + sample_characters[1]
&gt;&gt;&gt; sample_string
'py'
&gt;&gt;&gt; sample_string = sample_string + sample_characters[2]
&gt;&gt;&gt; sample_string
'pyt'
&gt;&gt;&gt; sample_string = sample_string + sample_characters[3]
&gt;&gt;&gt; sample_string
'pyth'
&gt;&gt;&gt; sample_string = sample_string + sample_characters[4]
&gt;&gt;&gt; sample_string
'pytho'
&gt;&gt;&gt; sample_string = sample_string + sample_characters[5]
&gt;&gt;&gt; sample_string
'python'
&gt;&gt;&gt;
```

Here, the variable **sample_string** is also like a state of the program that is getting changed after executing the series of commands, and it can be easily extracted to track the progress of the program. The same can be done using a **for** loop (also considered imperative programming) in a shorter version of the above code:


```
&gt;&gt;&gt; sample_characters = ['p','y','t','h','o','n']
&gt;&gt;&gt; sample_string = ''
&gt;&gt;&gt; sample_string
&gt;&gt;&gt; for c in sample_characters:
...    sample_string = sample_string + c
...    print(sample_string)
...
p
py
pyt
pyth
pytho
python
&gt;&gt;&gt;
```

### Functional programming paradigm

The [functional programming paradigm][10] treats program computation as the evaluation of mathematical functions based on [lambda calculus][11]. Lambda calculus is a formal system in mathematical logic for expressing computation based on function abstraction and application using variable binding and substitution. It follows the "what-to-solve" approach—that is, it expresses logic without describing its control flow—hence it is also classified as the declarative programming model.

The functional programming paradigm promotes stateless functions, but it's important to note that Python's implementation of functional programming deviates from standard implementation. Python is said to be an _impure_ functional language because it is possible to maintain state and create side effects if you are not careful. That said, functional programming is handy for parallel processing and is super-efficient for tasks requiring recursion and concurrent execution.


```
&gt;&gt;&gt; sample_characters = ['p','y','t','h','o','n']
&gt;&gt;&gt; import functools
&gt;&gt;&gt; sample_string = functools.reduce(lambda s,c: s + c, sample_characters)
&gt;&gt;&gt; sample_string
'python'
&gt;&gt;&gt;
```

Using the same example, the functional way of concatenating a list of characters to form a string would be the same as above. Since the computation happens in a single line, there is no explicit way to obtain the state of the program with **sample_string** and track the progress. The functional programming implementation of this example is fascinating, as it reduces the lines of code and simply does its job in a single line, with the exception of using the **functools** module and the **reduce** method. The three keywords—**functools**, **reduce**, and **lambda**—are defined as follows:

  * **functools** is a module for higher-order functions and provides for functions that act on or return other functions. It encourages writing reusable code, as it is easier to replicate existing functions with some arguments already passed and create a new version of a function in a well-documented manner.
  * **reduce** is a method that applies a function of two arguments cumulatively to the items in sequence, from left to right, to reduce the sequence to a single value. For example: [code] &gt;&gt;&gt; sample_list = [1,2,3,4,5]
&gt;&gt;&gt; import functools
&gt;&gt;&gt; sum = functools.reduce(lambda x,y: x + y, sample_list)
&gt;&gt;&gt; sum
15
&gt;&gt;&gt; ((((1+2)+3)+4)+5)
15
&gt;&gt;&gt; 
```
  * **lambda functions** are small, anonymized (i.e., nameless) functions that can take any number of arguments but spit out only one value. They are useful when they are used as an argu
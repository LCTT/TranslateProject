[#]: subject: (Learn the Lisp programming language in 2021)
[#]: via: (https://opensource.com/article/21/5/learn-lisp)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Learn the Lisp programming language in 2021
======
A lot of Lisp code lurks inside big codebases, so it's smart to get
familiar with the language.
![Woman sitting in front of her laptop][1]

Lisp was invented in 1958, which makes it the second-oldest computer programming language. It has spawned several modern derivatives, including Common Lisp, Emacs Lisp (Elisp), Clojure, Racket, Scheme, Fennel, and GNU Guile.

People who love thinking about the design of programming languages often love Lisp because of how its syntax and data share the same structure: Lisp code is essentially a list of lists, and its name is an acronym for _LISt Processing_. People who love thinking about the aesthetics of programming languages often hate Lisp because of its frequent use of parentheses for scoping; in fact, it's a common joke that Lisp stands for _Lots of Irritating Superfluous Parentheses_.

Whether you love or hate its design philosophies, Lisp is an interesting glimpse at the past and, thanks to Clojure and Guile, into the future. You might be surprised how much Lisp code there is lurking within big codebases in any given industry, so it's a good idea to have at least a passing familiarity with the language.

### Install Lisp

There are many implementations of Lisp. Popular open source versions include [SBCL][2] and [GNU Common Lisp][3] (GCL). You can install either of these with your distribution's package manager.

On Fedora Linux:


```
`$ sudo dnf install gcl`
```

On Debian:


```
`$ sudo apt install gcl`
```

For macOS, you can use [MacPorts][4] or [Homebrew][5]:


```
`$ sudo port install gcl`
```

For Windows, download a binary from [gnu.org/software/gcl][6].

For this article, I'm using GCL and its `clisp` command, but most of the principles apply to any Lisp.

### List processing

The basic unit of Lisp source code is an _expression_, which is written as a list. For instance, this is a list of an operator (`+`) and two integers (`1` and `2`):


```
`(+ 1 2)`
```

It's also a Lisp expression, using a symbol (`+`) that evaluates to a function (addition) and two arguments (`1` and `2`). You can run this expression and others in an interactive Common Lisp environment called REPL (read-eval-print loop). If you're familiar with Python's IDLE, Lisp's REPL should feel somewhat familiar to you.

To launch a REPL, launch Common Lisp:


```
$ clisp
[1]&gt;
```

At the REPL prompt, type a few expressions:


```
[1]&gt; (+ 1 2)
3
[2]&gt; (- 1 2)
-1
[3]&gt; (- 2 1)
1
[4]&gt; (+ 2 3 4)
9
```

### Functions

Now that you know the basic structure of a Lisp expression, you can utilize Lisp functions in useful ways. The `print` function takes any argument you provide and displays it on your terminal, while the `pprint` function "pretty" prints it. There are other variations on the print function, but `pprint` is nice in REPL:


```
[1]&gt; (pprint "hello world")

"hello world"

[2]&gt;
```

You can create your own functions with `defun`. The `defun` function requires a name for your function and any parameters you want your function to accept:


```
[1]&gt; (defun myprinter (s) (pprint s))
MYPRINTER
[2]&gt; (myprinter "hello world")

"hello world"

[3]&gt;
```

### Variables

You can create variables in Lisp with `setf`:


```
[1]&gt; (setf foo "hello world")
"hello world"
[2]&gt; (pprint foo)

"hello world"

[3]&gt;
```

You can nest expressions within expressions in a kind of pipeline. For instance, you can pretty print the contents of your variable after invoking the `string-upcase` function to convert its characters to uppercase:


```
[3]&gt; (pprint (string-upcase foo))

"HELLO WORLD"

[4]&gt;
```

Lisp is dynamically typed in the sense that you don't have to declare variable types when setting them. Lisp treats integers as integers by default:


```
[1]&gt; (setf foo 2)
[2]&gt; (setf bar 3)
[3]&gt; (+ foo bar)
5
```

If you intend for an integer to be interpreted as a string, you can quote it:


```
[4]&gt; (setf foo "2")                                                                                                                      
"2"                                                                                                                                      
[5]&gt; (setf bar "3")                                                                                                                      
"3"
[6]&gt; (+ foo bar)

*** - +: "2" is not a number
The following restarts are available:
USE-VALUE      :R1      Input a value to be used instead.
ABORT          :R2      Abort main loop
Break 1 [7]&gt;
```

In this sample REPL session, both `foo` and `bar` are set to quoted numbers, so Lisp interprets them as strings. Math operators can't be used on strings, so REPL drops into a debugger mode. To get out of the debugger, press **Ctrl+D** on your keyboard.

You can do some introspection on objects using the `typep` function, which tests for a specific data type. The tokens `T` and `NIL` represent _True_ and _False_, respectively.


```
[4]&gt; (typep foo 'string)
NIL
[5]&gt; (typep foo 'integer)
T
```

The single quote (`'`) before `string` and `integer` prevents Lisp from (incorrectly) evaluating those keywords as variables:


```
[6]&gt; (typep foo string)
*** - SYSTEM::READ-EVAL-PRINT: variable STRING has no value
[...]
```

It's a shorthand way to protect the terms, normally done with the `quote` function:


```
[7]&gt; (typep foo (quote string))
NIL
[5]&gt; (typep foo (quote integer))
T
```

### Lists

Unsurprisingly, you can also create lists in Lisp:


```
[1]&gt; (setf foo (list "hello" "world"))
("hello" "world")
```

Lists can be indexed with the `nth` function:


```
[2]&gt; (nth 0 foo)
"hello"
[3]&gt; (pprint (string-capitalize (nth 1 foo)))

"World"
```

### Exiting REPL

To end a REPL session, press **Ctrl+D** on your keyboard, or use the `quit` keyword in Lisp:


```
[99]&gt; (quit)
$
```

### Scripting

Lisp can be compiled or used as an interpreted scripting language. The latter is probably the easiest option when you're starting, especially if you're already familiar with Python or [shell scripting][7].

Here's a simple dice roller script written in GNU Common Lisp:


```
#!/usr/bin/clisp

(defun roller (num)  
  (pprint (random (parse-integer (nth 0 num))))
)

(setf userput *args*)
(setf *random-state* (make-random-state t))
(roller userput)
```

The first line tells your [POSIX][8] terminal what executable to use to run the script.

The `roller` function, created with `defun`, uses the `random` function to print a pseudo-random number up to, and not including, the zeroth item of the `num` list. The `num` list hasn't been created yet in the script, but the function doesn't get executed until it's called.

The next line assigns any argument provided to the script at launch time to a variable called `userput`. The `userput` variable is a list, and it's what becomes `num` once it's passed to the `roller` function.

The penultimate line of the script starts a _random seed_. This provides Lisp with enough entropy to generate a mostly random number.

The final line invokes the custom `roller` function, providing the `userput` list as its sole argument.

Save the file as `dice.lisp` and mark it executable:


```
`$ chmod +x dice.lisp`
```

Finally, try running it, providing it with a maximum number from which to choose its random number:


```
$ ./dice.lisp 21

13
$ ./dice.lisp 21

7
$ ./dice.lisp 21

20
```

Not bad!

### Learn Lisp

Whether you can imagine using Lisp as a utilitarian language for personal scripts, to advance your career, or just as a fun experiment, you can see some particularly inventive uses at the annual [Lisp Game Jam][9] (most submissions are open source, so you can view the code to learn from what you play).

Lisp is a fun and unique language with an ever-growing developer base and enough historic and emerging dialects to keep programmers from all disciplines happy.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/learn-lisp

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_women_computing_4.png?itok=VGZO8CxT (Woman sitting in front of her laptop)
[2]: http://sbcl.org
[3]: https://www.gnu.org/software/gcl/
[4]: https://opensource.com/article/20/11/macports
[5]: https://opensource.com/article/20/6/homebrew-linux
[6]: http://mirror.lagoon.nc/gnu/gcl/binaries/stable
[7]: https://opensource.com/article/20/4/bash-programming-guide
[8]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[9]: https://itch.io/jam/spring-lisp-game-jam-2021

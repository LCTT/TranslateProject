[#]: subject: "Learn the Lisp programming language in 2021"
[#]: via: "https://opensource.com/article/21/5/learn-lisp"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Let's learn the Lisp programming language
======
A lot of Lisp code lurks inside big codebases, so it's smart to get familiar with the language.

![Women in tech and computing][1]

Image by: kris krüg

Lisp was invented in 1958, which makes it the second-oldest computer programming language. It has spawned several modern derivatives, including Common Lisp, Emacs Lisp (Elisp), Clojure, Racket, Scheme, Fennel, and GNU Guile.

People who love thinking about the design of programming languages often love Lisp because of how its syntax and data share the same structure: Lisp code is essentially a list of lists, and its name is an acronym for *LISt Processing*. People who love thinking about the aesthetics of programming languages often hate Lisp because of its frequent use of parentheses for scoping; in fact, it's a common joke that Lisp stands for *Lots of Irritating Superfluous Parentheses*.

Whether you love or hate its design philosophies, Lisp is an interesting glimpse at the past and, thanks to Clojure and Guile, into the future. You might be surprised how much Lisp code there is lurking within big codebases in any given industry, so it's a good idea to have at least a passing familiarity with the language.

### Install Lisp

There are many implementations of Lisp. Popular open source versions include [SBCL][2], [GNU Lisp][3], and [GNU Common Lisp][4] (GCL). You can install any of these with your distribution's package manager, but for this article I use `clisp`.

On Fedora Linux:

```
$ sudo dnf install clisp
```

On Debian:

```
$ sudo apt install clisp
```

For macOS, you can use [MacPorts][5] or [Homebrew][6]:

```
$ sudo port install clisp
```

For Windows, you can either use [clisp on Cygwin][7] or download a GCL binary from [gnu.org/software/gcl][8].

Even though I'm using the `clisp` command, most of the principles in this article apply to any Lisp. Should you choose to use a different Lisp implementation, the command to run Lisp code is different from what I use in this article (`gcl` or `sbcl` instead of `clisp`, for example) but everything else is the same.

### List processing

The basic unit of Lisp source code is an *expression*, which is written as a list. For instance, this is a list of an operator (`+` ) and two integers (`1` and `2` ):

```
(+ 1 2)
```

It's also a Lisp expression, using a symbol (`+` ) that evaluates to a function (addition) and two arguments (`1` and `2` ). You can run this expression and others in an interactive Common Lisp environment called REPL (read-eval-print loop). If you're familiar with Python's IDLE, Lisp's REPL should feel somewhat familiar to you.

To launch a REPL, launch Common Lisp:

```
$ clisp
[1]>
```

At the REPL prompt, type a few expressions:

```
[1]> (+ 1 2)
3
[2]> (- 1 2)
-1
[3]> (- 2 1)
1
[4]> (+ 2 3 4)
9
```

### Functions

Now that you know the basic structure of a Lisp expression, you can utilize Lisp functions in useful ways. The `print` function takes any argument you provide and displays it on your terminal, while the `pprint` function "pretty" prints it. There are other variations on the print function, but `pprint` is nice in REPL:

```
[1]> (pprint "hello world")

"hello world"

[2]>
```

You can create your own functions with `defun`. The `defun` function requires a name for your function and any parameters you want your function to accept:

```
[1]> (defun myprinter (s) (pprint s))
MYPRINTER
[2]> (myprinter "hello world")

"hello world"

[3]>
```

### Variables

You can create variables in Lisp with `setf` :

```
[1]> (setf foo "hello world")
"hello world"
[2]> (pprint foo)

"hello world"

[3]>
```

You can nest expressions within expressions in a kind of pipeline. For instance, you can pretty print the contents of your variable after invoking the `string-upcase` function to convert its characters to uppercase:

```
[3]> (pprint (string-upcase foo))

"HELLO WORLD"

[4]>
```

Lisp is dynamically typed in the sense that you don't have to declare variable types when setting them. Lisp treats integers as integers by default:

```
[1]> (setf foo 2)
[2]> (setf bar 3)
[3]> (+ foo bar)
5
```

If you intend for an integer to be interpreted as a string, you can quote it:

```
[4]> (setf foo "2")
"2"
[5]> (setf bar "3")
"3"
[6]> (+ foo bar)

*** - +: "2" is not a number
The following restarts are available:
USE-VALUE      :R1      Input a value to be used instead.
ABORT          :R2      Abort main loop
Break 1 [7]>
```

In this sample REPL session, both `foo` and `bar` are set to quoted numbers, so Lisp interprets them as strings. Math operators can't be used on strings, so REPL drops into a debugger mode. To get out of the debugger, press **Ctrl+D** on your keyboard.

You can do some introspection on objects using the `typep` function, which tests for a specific data type. The tokens `T` and `NIL` represent *True* and *False*, respectively.

```
[4]> (typep foo 'string)
NIL
[5]> (typep foo 'integer)
T
```

The single quote (`'` ) before `string` and `integer` prevents Lisp from (incorrectly) evaluating those keywords as variables:

```
[6]> (typep foo string)
*** - SYSTEM::READ-EVAL-PRINT: variable STRING has no value
[...]
```

It's a shorthand way to protect the terms, normally done with the `quote` function:

```
[7]> (typep foo (quote string))
NIL
[5]> (typep foo (quote integer))
T
```

### Lists

Unsurprisingly, you can also create lists in Lisp:

```
[1]> (setf foo (list "hello" "world"))
("hello" "world")
```

Lists can be indexed with the `nth` function:

```
[2]> (nth 0 foo)
"hello"
[3]> (pprint (string-capitalize (nth 1 foo)))

"World"
```

### Exiting REPL

To end a REPL session, press **Ctrl+D** on your keyboard, or use the `quit` keyword in Lisp:

```
[99]> (quit)
$
```

### Scripting

Lisp can be compiled or used as an interpreted scripting language. The latter is probably the easiest option when you're starting, especially if you're already familiar with Python or [shell scripting][9].

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

The first line tells your [POSIX][10] terminal what executable to use to run the script.

The `roller` function, created with `defun`, uses the `random` function to print a pseudo-random number up to, and not including, the zeroth item of the `num` list. The `num` list hasn't been created yet in the script, but the function doesn't get executed until it's called.

The next line assigns any argument provided to the script at launch time to a variable called `userput`. The `userput` variable is a list, and it's what becomes `num` once it's passed to the `roller` function.

The penultimate line of the script starts a *random seed*. This provides Lisp with enough entropy to generate a mostly random number.

The final line invokes the custom `roller` function, providing the `userput` list as its sole argument.

Save the file as `dice.lisp` and mark it executable:

```
$ chmod +x dice.lisp
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

You may notice that your emulated die has a pontential value of 0, and never reaches the maximum number you provide to it as an argument. In other words, this script never rolls 20 on a 20-sided die (unless you count 0 as 20). There's a simple fix to this, and you only need the knowledge gained from this article to do it. Can you fix this bug?

### Learn Lisp

Whether you can imagine using Lisp as a utilitarian language for personal scripts, to advance your career, or just as a fun experiment, you can see some particularly inventive uses at the annual [Lisp Game Jam][11] (most submissions are open source, so you can view the code to learn from what you play).

Lisp is a fun and unique language with an ever-growing developer base and enough historic and emerging dialects to keep programmers from all disciplines happy.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/learn-lisp

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/OSDC_women_computing_4.png
[2]: http://sbcl.org
[3]: http://clisp.org
[4]: https://www.gnu.org/software/gcl/
[5]: https://opensource.com/article/20/11/macports
[6]: https://opensource.com/article/20/6/homebrew-linux
[7]: https://cygwin.fandom.com/wiki/Clisp
[8]: http://mirror.lagoon.nc/gnu/gcl/binaries/stable
[9]: https://opensource.com/article/20/4/bash-programming-guide
[10]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[11]: https://itch.io/jam/spring-lisp-game-jam-2021

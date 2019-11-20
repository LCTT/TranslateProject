[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Loops in Emacs Lisp)
[#]: via: (https://opensourceforu.com/2019/11/loops-in-emacs-lisp/)
[#]: author: (Shakthi Kannan https://opensourceforu.com/author/shakthi-kannan/)

Loops in Emacs Lisp
======

[![][1]][2]

_This article in the Emacs series explores looping techniques that are available with Emacs Lisp._

T here are built-in constructs such as _while_ and _dolist_ that are shipped with the default GNU Emacs. The dash.el library provides functions to iterate over lists, and is written by Magnar Sveen. The latest release of dash.el is v2.16.0, and its source code is available at _<https://github.com/magnars/dash.el>_ under the GNU General Public License v3.0.
Let us also explore the structures available in loop.el, another library for implementing imperative loops. This has been written by Wilfred Hughes, and has also been released under the GNU General Public License v3.0.

**Installation**
The dash.el and loop.el packages are available in Milkypostman’s Emacs Lisp Package Archive (MELPA) and in the Marmalede repo. You can install the package using the following commands in GNU Emacs:

```
M-x package-install dash
M-x package-install loop
```

The other method of installation is to copy the dash.el and loop.el source files to your Emacs load path and load them. In order to get syntax highlighting of dash functions in Emacs buffers, you can add the following command to your Emacs initialisation settings:

```
(eval-after-load 'dash '(dash-enable-font-lock))
```

If you are using Cask (_<https://github.com/cask/cask>_) to manage your Emacs configuration, then you can simply add the following code to your Cask file:

```
(depends-on "dash")
(depends-on "loop")
```

The usage of various loop construct is as follows.

**Built-in**
GNU Emacs has built-in loop constructs. The _while_ function, for example, has the following syntax:

```
(while TEST BODY...)
```

The BODY code segment is evaluated if the result of TEST is not nil. Until TEST returns nil, the BODY will continue to be executed. An example of _while_ function usage is given below:

```
(setq alphabets '(a b c d e))

(defun print-list-elements (list)
"Print each element of the input LIST"
(while list
(print (car list))
(setq list (cdr list))))

(print-list-elements alphabets)
```

The output is as follows:

```
a
b
c
d
e
nil
```

The ‘dolist’ macro loops over a list and is also built-in with Emacs. Its definition is as follows:

```
(dolist (VAR LIST [RESULT]) BODY...)
```

The VAR argument represents each element in LIST for every iteration in the BODY segment. The value in RESULT is returned by the function, and is optional. By default, a nil is returned. The ‘alphabet’ list elements can be printed using the _dolist_ macro as shown below:

```
(setq alphabets '(a b c d e))
(dolist (element alphabets)
(print element))
```

The resultant output is the same.

```
a
b
c
d
e
nil
```

**dash.el**
The dash.el list library provides functions to iterate over lists. The -each function, for example, takes a list and a function, and applies the function to every element in the list. In the following example, a reverse of the input list is created by doubling each element’s value.

```
(-each list function) ;; Syntax

(let (s) (-each '(1 2 3) (lambda (item) (setq s (cons (* item 2) s)))) s)
(6 4 2)
```

Another function API from the dash.el library is the -each-while function, which takes three arguments – a list, a predicate and a function. The function is applied to every element in the list that satisfies the predicate. For example:

```
(-each-while list predicate function) ;; Syntax

(defun even? (num) (= 0 (% num 2)))
(let (s) (--each-while '(1 2 3 4) (< it 3) (!cons it s)) s)
(2 1)
```

The _-each-r_ function takes a list and a function, and applies the function on every item in the list in the reverse order. An example is given below:

```
(-each-r list function) ;; Syntax

(let (s) (-each-r '(1 2 3) (lambda (item) (setq s (cons (* item 2) s)))) s)

(2 4 6)
```

If you would like to use a predicate function with _-each-r_, you can use the _-each-r-while_ function as illustrated below:

```
(-each-r-while list predicate function) ;; Syntax

(let (s) (-each-r-while '(1 2 3 4 5 6) 'even? (lambda (item) (!cons item s))) s)
(6)
```

The _-dotimes_ function will repeatedly call a function from 0 to the input number, minus 1.

```
(-dotimes number function) ;; Syntax

(let (s) (-dotimes 3 (lambda (n) (!cons n s))) s)
(2 1 0)
```

You can explore more of the iterative functions available in dash.el under the Side-effects section in the GitHub source repository available at _<https://github.com/magnars/dash.el>_.

**loop.el**
We shall now explore the constructs available in the _loop.el_ library. The loop-while construct executes the body of the loop while the condition is true. In the following example, the sum of the numbers from 0 to 5 is computed.

```
(require 'loop)

;; loop-while
loop-while (condition body...) ;; Syntax

(let ((x 0)
(sum 0))
;; sum of 0..5
(loop-while (< x 5)
(setq sum (+ sum x))
(setq x (1+ x)))
sum)
10
```

If you want to evaluate the body at least once before checking the condition, you can use the _loop-do-while_ construct. In the following example, the value of x is incremented by one and then the condition is satisfied for the loop execution.

```
loop-do-while (condition body...) ;; Syntax

(let ((x 0)
(sum 0))
;; sum of 1..4
(loop-do-while (and (> x 0) (< x 5))
(setq sum (+ sum x))
(setq x (1+ x)))
sum)
10
```

The _loop-until_ construct repeatedly evaluates the body of the code until the condition becomes true. For example:

```
loop-until (condition body...) ;; Syntax

(let ((x 0)
(sum 0))
;; sum of 0..4
(loop-until (= x 5)
(setq sum (+ sum x))
(setq x (1+ x)))
sum)
10
```

The _loop-for-each_ construct takes three arguments – a var, a list and a body. The var represents an element in the list for the iteration. In the following example, the sum of numbers from 1 to 5 is calculated.

```
loop-for-each (var list body...) ;; Syntax

(let ((sum 0))
(loop-for-each x (list 1 2 3 4 5)
(setq sum (+ sum x)))
sum)
15
```

A couple of constructs are available to break or continue execution within a loop. The _loop-break_ construct breaks out of the innermost loop. For example:

```
loop-break () ;; Syntax

(let ((sum 0))
;; sum 1..5
(loop-for-each x (list 1 2 3 4 5 6)
(setq sum (+ sum x))
(when (= x 5)
(loop-break)))
sum)
15
```

The _loop-continue_ construct will skip the rest of the current loop-while, loop-do-while or loop-for-each block and will proceed to the next iteration in the loop. In the following example, the list is iterated for elements between 1 and 6, and is skipped when the iteration matches the element 2.

```
loop-continue () ;; Syntax

(let ((sum 0))
;; sum the numbers 1, 3, 5
(loop-for-each x (list 1 2 3 4 5 6)
(when (= x 2)
(loop-continue))
(setq sum (+ sum x)))
sum)
19
```

The loop.el library has unit tests included in the source code, which you can run to validate the defined constructs. In order to run the tests, you need to first clone the source repository using the following commands:

```
$ git clone https://github.com/Wilfred/loop.el
Cloning into 'loop.el'...
remote: Enumerating objects: 232, done.
remote: Total 232 (delta 0), reused 0 (delta 0), pack-reused 232
Receiving objects: 100% (232/232), 31.29 KiB | 801.00 KiB/s, done.
Resolving deltas: 100% (117/117), done.
```

If you do not have Cask, install it using the instructions provided in the README file at _<https://github.com/cask/cask>_.
You can then change the directory into the cloned loop.el folder, and run cask install. This will locally install the required dependencies for running the tests.

```
$ cd loop.el/
$ cask install
Loading package information... Select coding system (default utf-8):
done
Package operations: 3 installs, 0 removals
- Installing [ 1/3] undercover (latest)... done
- Installing [ 2/3] ert-runner (latest)... done
- Installing [ 3/3] f (latest)... already present
```

A _Makefile_ exists in the top-level directory, the contents of which are provided below for reference:

```
$ cat Makefile
CASK ?= cask
EMACS ?= emacs

all: test
test: unit

unit:
${CASK} exec ert-runner

install:
${CASK} install
```

You can now simply run _make_ test at the shell prompt to execute the tests as shown below:

```
$ make test
cask exec ert-runner
.................

Ran 17 tests in 0.001 seconds
```

Readers are encouraged to go through the README file at <https://github.com/Wilfred/loop.el> for more information.

![Avatar][3]

[Shakthi Kannan][4]

The author is a free software developer at the Fedora project, and also a blogger. He co-maintains the Fedora Electronic Lab project.

[![][5]][6]

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/11/loops-in-emacs-lisp/

作者：[Shakthi Kannan][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/shakthi-kannan/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/01/Tips-to-hire-a-web-developer-with-skills-in-2019.jpg?resize=696%2C365&ssl=1 (Tips to hire a web developer with skills in 2019)
[2]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/01/Tips-to-hire-a-web-developer-with-skills-in-2019.jpg?fit=1200%2C630&ssl=1
[3]: https://secure.gravatar.com/avatar/d6df0aa46ea197a6e5a6b80bba666830?s=100&r=g
[4]: https://opensourceforu.com/author/shakthi-kannan/
[5]: https://opensourceforu.com/wp-content/uploads/2019/11/assoc.png
[6]: https://feedburner.google.com/fb/a/mailverify?uri=LinuxForYou&loc=en_US

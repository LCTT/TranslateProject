Learn to code with Thonny — a Python IDE for beginners
======

![](https://fedoramagazine.org/wp-content/uploads/2018/02/thonny.png-945x400.jpg)
Learning to program is hard. Even when you finally get your colons and parentheses right, there is still a big chance that the program doesn’t do what you intended. Commonly, this means you overlooked something or misunderstood a language construct, and you need to locate the place in the code where your expectations and reality diverge.

Programmers usually tackle this situation with a tool called a debugger, which allows running their program step-by-step. Unfortunately, most debuggers are optimized for professional usage and assume the user already knows the semantics of language constructs (e.g. function call) very well.

Thonny is a beginner-friendly Python IDE, developed in [University of Tartu][1], Estonia, which takes a different approach as its debugger is designed specifically for learning and teaching programming.

Although Thonny is suitable for even total beginners, this post is meant for readers who have at least some experience with Python or another imperative language.

### Getting started

Thonny is included in Fedora repositories since version 27. Install it with sudo dnf install thonny or with a graphical tool of your choice (such as Software).

When first launching Thonny, it does some preparations and then presents an empty editor and the Python shell. Copy following program text into the editor and save it into a file (Ctrl+S).
```
n = 1
while n < 5:
 print(n * "*")
 n = n + 1

```

Let’s first run the program in one go. For this press F5 on the keyboard. You should see a triangle made of periods appear in the shell pane.

![A simple program in Thonny][2]

Did Python just analyze your code and understand that you wanted to print a triangle? Let’s find out!

Start by selecting “Variables” from the “View” menu. This opens a table which will show us how Python manages program’s variables. Now run the program in debug mode by pressing Ctrl+F5 (or Ctrl+Shift+F5 in XFCE). In this mode Thonny makes Python pause before each step it takes. You should see the first line of the program getting surrounded with a box. We’ll call this the focus and it indicates the part of the code Python is going to execute next.

![Thonny debugger focus][3]

The piece of code you see in the focus box is called assignment statement. For this kind of statement, Python is supposed to evaluate the expression on the right and store the value under the name shown on the left. Press F7 to take the next step. You will see that Python focused on the right part of the statement. In this case the expression is really simple, but for generality Thonny presents the expression evaluation box, which allows turning expressions into values. Press F7 again to turn the literal 1 into value 1. Now Python is ready to do the actual assignment — press F7 again and you should see the variable n with value 1 appear in the variables table.

![Thonny with variables table][4]

Continue pressing F7 and observe how Python moves forward with really small steps. Does it look like something which understands the purpose of your code or more like a dumb machine following simple rules?

### Function calls

Function call is a programming concept which often causes great deal of confusion to beginners. On the surface there is nothing complicated — you give name to a code and refer to it (call it) somewhere else in the code. Traditional debuggers show us that when you step into the call, the focus jumps into the function definition (and later magically back to the original location). Is it the whole story? Do we need to care?

Turns out the “jump model” is sufficient only with the simplest functions. Understanding parameter passing, local variables, returning and recursion all benefit from the notion of stack frame. Luckily, Thonny can explain this concept intuitively without sweeping important details under the carpet.

Copy following recursive program into Thonny and run it in debug mode (Ctrl+F5 or Ctrl+Shift+F5).
```
def factorial(n):
 if n == 0:
  return 1
 else:
  return factorial(n-1) * n

print(factorial(4))

```

Press F7 repeatedly until you see the expression factorial(4) in the focus box. When you take the next step, you see that Thonny opens a new window containing function code, another variables table and another focus box (move the window to see that the old focus box is still there).

![Thonny stepping through a recursive function][5]

This window represents a stack frame, the working area for resolving a function call. Several such windows on top of each other is called the call stack. Notice the relationship between argument 4 on the call site and entry n in the local variables table. Continue stepping with F7 and observe how new windows get created on each call and destroyed when the function code completes and how the call site gets replaced by the return value.

### Values vs. references

Now let’s make an experiment inside the Python shell. Start by typing in the statements shown in the screenshot below:

![Thonny shell showing list mutation][6]

As you see, we appended to list b, but list a also got updated. You may know why this happened, but what’s the best way to explain it to a beginner?

When teaching lists to my students I tell them that I have been lying about Python memory model. It is actually not as simple as the variables table suggests. I tell them to restart the interpreter (the red button on the toolbar), select “Heap” from the “View” menu and make the same experiment again. If you do this, then you see that variables table doesn’t contain the values anymore — they actually live in another table called “Heap”. The role of the variables table is actually to map the variable names to addresses (or ID-s) which refer to the rows in the heap table. As assignment changes only the variables table, the statement b = a only copied the reference to the list, not the list itself. This explained why we see the change via both variables.

![Thonny in heap mode][7]

(Why do I postpone telling the truth about the memory model until the topic of lists? Does Python store lists differently compared to floats or strings? Go ahead and use Thonny’s heap mode to find this out! Tell me in the comments what do you think!)

If you want to understand the references system deeper, copy following program to Thonny and small-step (F7) through it with the heap table open.
```
def do_something(lst, x):
 lst.append(x)

a = [1,2,3]
n = 4
do_something(a, n)
print(a)

```

Even if the “heap mode” shows us authentic picture, it is rather inconvenient to use. For this reason, I recommend you now switch back to normal mode (unselect “Heap” in the View menu) but remember that the real model includes variables, references and values.

### Conclusion

The features I touched in this post were the main reason for creating Thonny. It’s easy to form misconceptions about both function calls and references but traditional debuggers don’t really help in reducing the confusion.

Besides these distinguishing features, Thonny offers several other beginner friendly tools. Please look around at [Thonny’s homepage][8] to learn more!


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/learn-code-thonny-python-ide-beginners/

作者：[Aivar Annamaa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/
[1]:https://www.ut.ee/en
[2]:https://fedoramagazine.org/wp-content/uploads/2017/12/scr1.png
[3]:https://fedoramagazine.org/wp-content/uploads/2017/12/thonny-scr2.png
[4]:https://fedoramagazine.org/wp-content/uploads/2017/12/thonny-scr3.png
[5]:https://fedoramagazine.org/wp-content/uploads/2017/12/thonny-scr4.png
[6]:https://fedoramagazine.org/wp-content/uploads/2017/12/thonny-scr5.png
[7]:https://fedoramagazine.org/wp-content/uploads/2017/12/thonny-scr6.png
[8]:http://thonny.org

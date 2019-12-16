[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (3 easy steps to update your apps to Python 3)
[#]: via: (https://opensource.com/article/19/12/update-apps-python-3)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

3 easy steps to update your apps to Python 3
======
Python 2 has reached its end of life, so it's past time to convert your
Python 2 project to Python 3.
![Hands on a keyboard with a Python book ][1]

The 2.x series of Python is [officially over][2], but converting code to Python 3 is easier than you think. Over the weekend, I spent an evening converting the frontend code of a 3D renderer (and its corresponding [PySide][3] version) to Python 3, and it was surprisingly simple in retrospect, although it seemed relatively hopeless during the refactoring process. The conversion process can seem a little like a labyrinth, with every change you make revealing a dozen more changes you need to make.

You may or may not _want_ to do the conversion, but—whether it's because you procrastinated too long or you rely on a module that won't be maintained unless you convert—sometimes you just don't have a choice. And if you're looking for an easy task to start your contribution to open source, converting a Python 2 app to Python 3 is a great way to make an easy but meaningful impression.

Whatever your reason for refactoring Python 2 code into Python 3, it's an important job. Here are three steps to approach the task with clarity.

### 1\. Run 2to3

For the past several years, Python has shipped with a script called [**2to3**][4], which does the bulk of the conversion from Python 2 to Python 3 for you. Automatically. And you already have it installed (whether you realize it or not).

Here's a short snippet of code written in Python 2.6:


```
#!/usr/bin/env python
# -*- coding: utf-8 -*-
mystring = u'abcdé'
print ord(mystring[-1])
```

Run the **2to3** script:


```
$ 2to3 example.py
RefactoringTool: Refactored example.py
\--- example.py     (original)
+++ example.py     (refactored)
@@ -1,5 +1,5 @@
 #!/usr/bin/env python
 # -*- coding: utf-8 -*-
 
-mystring = u'abcdé'
-print ord(mystring[-1])
+mystring = 'abcdé'
+print(ord(mystring[-1]))
RefactoringTool: Files that need to be modified:
RefactoringTool: example.py
```

By default, **2to3** prints only the changes required to bring old Python code up to Python 3 standards. The output is a usable patch you can use to change your file, but it's easier to just let Python do that for you, using the **\--write** (or **-w**) option:


```
$ 2to3 -w example.py
[...]
RefactoringTool: Files that were modified:
RefactoringTool: example.py
```

The **2to3** script doesn't work on just a single file. You can run it on an entire directory of Python files, with or without the **\--write** option, to process all ***.py** files in the directory and its subdirectories.

### 2\. Use Pylint or Pyflakes

It's not uncommon to discover code quirks that ran without issue in Python 2 but don't work so well in Python 3. Because these quirks can't be fixed by converting syntax, they get past **2to3** unchanged, but they fail once you try to run the code.

To detect such issues, you can use an application like [Pylint][5] or a tool like [Pyflakes][6] (or the [flake8][7] wrapper). I prefer Pyflakes because, unlike Pylint, it ignores deviations in the _style_ of your code. While the "prettiness" of Python is often praised as one of its strong points, when porting someone else's code from 2 to 3, treating style and function as two separate bugs is a matter of prioritization.

Here's example output from Pyflakes:


```
$ pyflakes example/maths
example/maths/enum.py:19: undefined name 'cmp'
example/maths/enum.py:105: local variable 'e' is assigned to but never used
example/maths/enum.py:109: undefined name 'basestring'
example/maths/enum.py:208: undefined name 'EnumValueCompareError'
example/maths/enum.py:208: local variable 'e' is assigned to but never used
```

This output (compared to 143 lines from Pylint, most of which were complaints about indentation) clearly displays the problems in the code that you should repair.

The most interesting error here is the first one, on line 19. It's a little misleading because you might think that **cmp** is a variable that was never defined, but **cmp** is really a function from Python 2 that doesn't exist in Python 3. It's wrapped in a **try** statement, so the issue could easily go unnoticed until it becomes obvious that the **try** result is not getting produced.


```
    try:
        result = cmp(self.index, other.index)
        except:
                result = 42
       
        return result
```

There are countless examples of functions that no longer exist or that have changed between when an application was maintained as a Python 2 codebase and when you decide to port it. PySide(2) bindings have changed, Python functions have disappeared or been transformed (**imp** to **importlib**, for example), and so on. Fix them one by one as you encounter them. Even though it's up to you to reimplement or replace those missing functions, by now, most of these issues are known and [well-documented][8]. The real challenge is more about catching the errors than fixing them, so use Pyflakes or a similar tool.

### 3\. Repair broken Python 2 code

The **2to3** script gets your code Python 3 compliant, but it only knows about differences between Python 2 and 3. It generally can't make adjustments to account for changes in libraries that worked one way back in 2010 but have had major revisions since then. You must update that code manually.

For instance, this code apparently worked back in the days of Python 2.6:


```
class CLOCK_SPEED:
        TICKS_PER_SECOND = 16
        TICK_RATES = [int(i * TICKS_PER_SECOND)
                      for i in (0.5, 1, 2, 3, 4, 6, 8, 11, 20)]

class FPS:
        STATS_UPDATE_FREQUENCY = CLOCK_SPEED.TICKS_PER_SECOND
```

Automated tools like **2to3** and **Pyflakes** don't detect the problem, but Python 3 doesn't see **GAME_SPEED.TICKS_PER_SECOND** as a valid statement because the function being called was never explicitly declared. Adjusting the code is a simple exercise in object-oriented programming:


```
class CLOCK_SPEED:
        def TICKS_PER_SECOND():
                TICKS_PER_SECOND = 16
                TICK_RATES = [int(i * TICKS_PER_SECOND)
                        for i in (0.5, 1, 2, 3, 4, 6, 8, 11, 20)]
                return TICKS_PER_SECOND

class FPS:
        STATS_UPDATE_FREQUENCY = CLOCK_SPEED.TICKS_PER_SECOND()
```

You may be inclined to make it cleaner still by replacing the **TICKS_PER_SECOND** function with a constructor (an **__init__** function to set default values), but that would change the required call from **CLOCK_SPEED.TICKS_PER_SECOND()** to just **CLOCK_SPEED()**, which may or may not have ramifications elsewhere in the codebase. If you know the code well, then you can use your better judgment about how

much alteration is _required_ and how much would just be pleasant, but generally, I prefer to assume every change I make inevitably demands at least three changes to every other file in the project, so I try to work within its existing structure.

### Don't stop believing

If you're porting a very large project, it sometimes starts to feel like there's no end in sight. It can seem like forever before you see a useful error message that's _not_ about a Python 2 quirk that slipped past the scripts and linters, and once you get to that point, you'll start to suspect it would be easier to just start from scratch. The bright side is that you (presumably) know that the codebase you're porting works (or worked) in Python 2, and once you make your adjustments, it will work again in Python 3; it's just a matter of conversion.

Once you've done the legwork, you'll have a Python 3 module or application, and regular maintenance (and those style changes to make Pylint happy) can begin anew!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/update-apps-python-3

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python-programming-code-keyboard.png?itok=fxiSpmnd (Hands on a keyboard with a Python book )
[2]: https://opensource.com/article/19/11/end-of-life-python-2
[3]: https://pypi.org/project/PySide/
[4]: https://docs.python.org/3.1/library/2to3.html
[5]: https://opensource.com/article/19/10/python-pylint-introduction
[6]: https://pypi.org/project/pyflakes/
[7]: https://opensource.com/article/19/5/python-flake8
[8]: https://docs.python.org/3.0/whatsnew/3.0.html

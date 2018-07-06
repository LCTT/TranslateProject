Getting started with the Python debugger
======

![](https://fedoramagazine.org/wp-content/uploads/2018/05/pdb-816x345.jpg)

The Python ecosystem is rich with many tools and libraries that improve developers’ lives. For example, the Magazine has previously covered how to [enhance your Python with a interactive shell][1]. This article focuses on another tool that saves you time and improves your Python skills: the Python debugger.

### Python Debugger

The Python standard library provides a debugger called pdb. This debugger provides most features needed for debugging such as breakpoints, single line stepping, inspection of stack frames, and so on.

A basic knowledge of pdb is useful since it’s part of the standard library. You can use it in environments where you can’t install another enhanced debugger.

#### Running pdb

The easiest way to run pdb is from the command line, passing the program to debug as an argument. Considering the following script:
```
# pdb_test.py
#!/usr/bin/python3

from time import sleep

def countdown(number):
 for i in range(number, 0, -1):
 print(i)
 sleep(1)


if __name__ == "__main__":
 seconds = 10
 countdown(seconds)

```

You can run pdb from the command line like this:
```
$ python3 -m pdb pdb_test.py
> /tmp/pdb_test.py(1)<module>()
-> from time import sleep
(Pdb)

```

Another way to use pdb is to set a breakpoint in the program. To do this, import the pdb module and use the set_trace function:
```
1 # pdb_test.py
2 #!/usr/bin/python3
3
4 from time import sleep
5
6
7 def countdown(number):
8 for i in range(number, 0, -1):
9 import pdb; pdb.set_trace()
10 print(i)
11 sleep(1)
12
13
14 if __name__ == "__main__":
15 seconds = 10
16 countdown(seconds)

$ python3 pdb_test.py
> /tmp/pdb_test.py(6)countdown()
-> print(i)
(Pdb)

```

The script stops at the breakpoint, and pdb displays the next line in the script. You can also execute the debugger after a failure. This is known as postmortem debugging.

#### Navigate the execution stack

A common use case in debugging is to navigate the execution stack. Once the Python debugger is running, the following commands are useful :

+ w(here) : Shows which line is currently executed and where the execution stack is.


```
$ python3 test_pdb.py
> /tmp/test_pdb.py(10)countdown()
-> print(i)
(Pdb) w
/tmp/test_pdb.py(16)<module>()
-> countdown(seconds)
> /tmp/test_pdb.py(10)countdown()
-> print(i)
(Pdb)

```

+ l(ist) : Shows more context (code) around the current the location.


```
$ python3 test_pdb.py
> /tmp/test_pdb.py(10)countdown()
-> print(i)
(Pdb) l
5
6
7 def countdown(number):
8 for i in range(number, 0, -1):
9 import pdb; pdb.set_trace()
10 -> print(i)
11 sleep(1)
12
13
14 if __name__ == "__main__":
15 seconds = 10
(Pdb)

```

+ u(p)/d(own) : Navigate the call stack up or down.


```
$ py3 test_pdb.py
> /tmp/test_pdb.py(10)countdown()
-> print(i)
(Pdb) up
> /tmp/test_pdb.py(16)<module>()
-> countdown(seconds)
(Pdb) down
> /tmp/test_pdb.py(10)countdown()
-> print(i)
(Pdb)

```

#### Stepping through a program

pdb provides the following commands to execute and step through code:

+ n(ext): Continue execution until the next line in the current function is reached, or it returns
+ s(tep): Execute the current line and stop at the first possible occasion (either in a function that is called or in the current function)
+ c(ontinue): Continue execution, only stopping at a breakpoint.


```
$ py3 test_pdb.py
> /tmp/test_pdb.py(10)countdown()
-> print(i)
(Pdb) n
10
> /tmp/test_pdb.py(11)countdown()
-> sleep(1)
(Pdb) n
> /tmp/test_pdb.py(8)countdown()
-> for i in range(number, 0, -1):
(Pdb) n
> /tmp/test_pdb.py(9)countdown()
-> import pdb; pdb.set_trace()
(Pdb) s
--Call--
> /usr/lib64/python3.6/pdb.py(1584)set_trace()
-> def set_trace():
(Pdb) c
> /tmp/test_pdb.py(10)countdown()
-> print(i)
(Pdb) c
9
> /tmp/test_pdb.py(9)countdown()
-> import pdb; pdb.set_trace()
(Pdb)

```

The example shows the difference between next and step. Indeed, when using step the debugger stepped into the pdb module source code, whereas next would have just executed the set_trace function.

#### Examine variables content

Where pdb is really useful is examining the content of variables stored in the execution stack. For example, the a(rgs) command prints the variables of the current function, as shown below:
```
py3 test_pdb.py
> /tmp/test_pdb.py(10)countdown()
-> print(i)
(Pdb) where
/tmp/test_pdb.py(16)<module>()
-> countdown(seconds)
> /tmp/test_pdb.py(10)countdown()
-> print(i)
(Pdb) args
number = 10
(Pdb)

```

pdb prints the value of the variable number, in this case 10.

Another command that can be used to print variables value is p(rint).
```
$ py3 test_pdb.py
> /tmp/test_pdb.py(10)countdown()
-> print(i)
(Pdb) list
5
6
7 def countdown(number):
8 for i in range(number, 0, -1):
9 import pdb; pdb.set_trace()
10 -> print(i)
11 sleep(1)
12
13
14 if __name__ == "__main__":
15 seconds = 10
(Pdb) print(seconds)
10
(Pdb) p i
10
(Pdb) p number - i
0
(Pdb)

```

As shown in the example’s last command, print can evaluate an expression before displaying the result.

The [Python documentation][2] contains the reference and examples for each of the pdb commands. This is a useful read for someone starting with the Python debugger.

### Enhanced debugger

Some enhanced debuggers provide a better user experience. Most add useful extra features to pdb, such as syntax highlighting, better tracebacks, and introspection. Popular choices of enhanced debuggers include [IPython’s ipdb][3] and [pdb++][4].

These examples show you how to install these two debuggers in a virtual environment. These examples use a new virtual environment, but in the case of debugging an application, the application’s virtual environment should be used.

#### Install IPython’s ipdb

To install the IPython ipdb, use pip in the virtual environment:
```
$ python3 -m venv .test_pdb
$ source .test_pdb/bin/activate
(test_pdb)$ pip install ipdb

```

To call ipdb inside a script, you must use the following command. Note that the module is called ipdb instead of pdb:
```
import ipdb; ipdb.set_trace()

```

IPython’s ipdb is also available in Fedora packages, so you can install it using Fedora’s package manager dnf:
```
$ sudo dnf install python3-ipdb

```

#### Install pdb++

You can install pdb++ similarly:
```
$ python3 -m venv .test_pdb
$ source .test_pdb/bin/activate
(test_pdb)$ pip install pdbp

```

pdb++ overrides the pdb module, and therefore you can use the same syntax to add a breakpoint inside a program:
```
import pdb; pdb.set_trace()

```

### Conclusion

Learning how to use the Python debugger saves you time when investigating problems with an application. It can also be useful to understand how a complex part of an application or some libraries work, and thereby improve your Python developer skills.


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/getting-started-python-debugger/

作者：[Clément Verna][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org
[1]:https://fedoramagazine.org/enhance-python-interactive-shell
[2]:https://docs.python.org/3/library/pdb.html
[3]:https://github.com/gotcha/ipdb
[4]:https://github.com/antocuni/pdb

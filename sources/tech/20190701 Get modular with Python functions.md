[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Get modular with Python functions)
[#]: via: (https://opensource.com/article/19/7/get-modular-python-functions)
[#]: author: (Seth Kenlon https://opensource.com/users/seth/users/xd-deng/users/nhuntwalker/users/don-watkins)

Get modular with Python functions
======
Minimize your coding workload by using Python functions for repeating
tasks.
![OpenStack source code \(Python\) in VIM][1]

Are you confused by fancy programming terms like functions, classes, methods, libraries, and modules? Do you struggle with the scope of variables? Whether you're a self-taught programmer or a formally trained code monkey, the modularity of code can be confusing. But classes and libraries encourage modular code, and modular code can mean building up a collection of multipurpose code blocks that you can use across many projects to reduce your coding workload. In other words, if you follow along with this article's study of [Python][2] functions, you'll find ways to work smarter, and working smarter means working less.

This article assumes enough Python familiarity to write and run a simple script. If you haven't used Python, read my [intro to Python][3] article first.

### Functions

Functions are an important step toward modularity because they are formalized methods of repetition. If there is a task that needs to be done again and again in your program, you can group the code into a function and call the function as often as you need it. This way, you only have to write the code once, but you can use it as often as you like.

Here is an example of a simple function:


```
#!/usr/bin/env python3

import time

def Timer():
        print("Time is " + str(time.time() ) )
```

Create a folder called **mymodularity** and save the function code as **timestamp.py**.

In addition to this function, create a file called **__init__.py** in the **mymodularity** directory. You can do this in a file manager or a Bash shell:


```
`$ touch mymodularity/__init__.py`
```

You have now created your own Python library (a "module," in Python lingo) in your Python package called **mymodularity**. It's not a very useful module, because all it does is import the **time** module and print a timestamp, but it's a start.

To use your function, treat it just like any other Python module. Here's a small application that tests the accuracy of Python's **sleep()** function, using your **mymodularity** package for support. Save this file as **sleeptest.py** _outside_ the **mymodularity** directory (if you put this _into_ **mymodularity**, then it becomes a module in your package, and you don't want that).


```
#!/usr/bin/env python3

import time
from mymodularity import timestamp

print("Testing Python sleep()...")

# modularity
timestamp.Timer()
time.sleep(3)
timestamp.Timer()
```

In this simple script, you are calling your **timestamp** module from your **mymodularity** package (twice). When you import a module from a package, the usual syntax is to import the module you want from the package and then use the _module name + a dot + the name of the function you want to call_ (e.g., **timestamp.Timer()**).

You're calling your **Timer()** function twice, so if your **timestamp** module were more complicated than this simple example, you'd be saving yourself quite a lot of repeated code.

Save the file and run it:


```
$ python3 ./sleeptest.py
Testing Python sleep()...
Time is 1560711266.1526039
Time is 1560711269.1557732
```

According to your test, the sleep function in Python is pretty accurate: after three seconds of sleep, the timestamp was successfully and correctly incremented by three, with a little variance in microseconds.

The structure of a Python library might seem confusing, but it's not magic. Python is _programmed_ to treat a folder full of Python code accompanied by an **__init__.py** file as a package, and it's programmed to look for available modules in its current directory _first_. This is why the statement **from mymodularity import timestamp** works: Python looks in the current directory for a folder called **mymodularity**, then looks for a **timestamp** file ending in **.py**.

What you have done in this example is functionally the same as this less modular version:


```
#!/usr/bin/env python3

import time
from mymodularity import timestamp

print("Testing Python sleep()...")

# no modularity
print("Time is " + str(time.time() ) )
time.sleep(3)
print("Time is " + str(time.time() ) )
```

For a simple example like this, there's not really a reason you wouldn't write your sleep test that way, but the best part about writing your own module is that your code is generic so you can reuse it for other projects.

You can make the code more generic by passing information into the function when you call it. For instance, suppose you want to use your module to test not the _computer's_ sleep function, but a _user's_ sleep function. Change your **timestamp** code so it accepts an incoming variable called **msg**, which will be a string of text controlling how the **timestamp** is presented each time it is called:


```
#!/usr/bin/env python3

import time

# updated code
def Timer(msg):
    print(str(msg) + str(time.time() ) )
```

Now your function is more abstract than before. It still prints a timestamp, but what it prints for the user is undefined. That means you need to define it when calling the function.

The **msg** parameter your **Timer** function accepts is arbitrarily named. You could call the parameter **m** or **message** or **text** or anything that makes sense to you. The important thing is that when the **timestamp.Timer** function is called, it accepts some text as its input, places whatever it receives into a variable, and uses the variable to accomplish its task.

Here's a new application to test the user's ability to sense the passage of time correctly:


```
#!/usr/bin/env python3

from mymodularity import timestamp

print("Press the RETURN key. Count to 3, and press RETURN again.")

input()
timestamp.Timer("Started timer at ")

print("Count to 3...")

input()
timestamp.Timer("You slept until ")
```

Save your new application as **response.py** and run it:


```
$ python3 ./response.py
Press the RETURN key. Count to 3, and press RETURN again.

Started timer at 1560714482.3772075
Count to 3...

You slept until 1560714484.1628013
```

### Functions and required parameters

The new version of your timestamp module now _requires_ a **msg** parameter. That's significant because your first application is broken because it doesn't pass a string to the **timestamp.Timer** function:


```
$ python3 ./sleeptest.py
Testing Python sleep()...
Traceback (most recent call last):
  File "./sleeptest.py", line 8, in &lt;module&gt;
    timestamp.Timer()
TypeError: Timer() missing 1 required positional argument: 'msg'
```

Can you fix your **sleeptest.py** application so it runs correctly with the updated version of your module?

### Variables and functions

By design, functions limit the scope of variables. In other words, if a variable is created within a function, that variable is available to _only_ that function. If you try to use a variable that appears in a function outside the function, an error occurs.

Here's a modification of the **response.py** application, with an attempt to print the **msg** variable from the **timestamp.Timer()** function:


```
#!/usr/bin/env python3

from mymodularity import timestamp

print("Press the RETURN key. Count to 3, and press RETURN again.")

input()
timestamp.Timer("Started timer at ")

print("Count to 3...")

input()
timestamp.Timer("You slept for ")

print(msg)
```

Try running it to see the error:


```
$ python3 ./response.py
Press the RETURN key. Count to 3, and press RETURN again.

Started timer at 1560719527.7862902
Count to 3...

You slept for 1560719528.135406
Traceback (most recent call last):
  File "./response.py", line 15, in &lt;module&gt;
    print(msg)
NameError: name 'msg' is not defined
```

The application returns a **NameError** message because **msg** is not defined. This might seem confusing because you wrote code that defined **msg**, but you have greater insight into your code than Python does. Code that calls a function, whether the function appears within the same file or if it's packaged up as a module, doesn't know what happens inside the function. A function independently performs its calculations and returns what it has been programmed to return. Any variables involved are _local_ only: they exist only within the function and only as long as it takes the function to accomplish its purpose.

#### Return statements

If your application needs information contained only in a function, use a **return** statement to have the function provide meaningful data after it runs.

They say time is money, so modify your timestamp function to allow for an imaginary charging system:


```
#!/usr/bin/env python3

import time

def Timer(msg):
    print(str(msg) + str(time.time() ) )
    charge = .02
    return charge
```

The **timestamp** module now charges two cents for each call, but most importantly, it returns the amount charged each time it is called.

Here's a demonstration of how a return statement can be used:


```
#!/usr/bin/env python3

from mymodularity import timestamp

print("Press RETURN for the time (costs 2 cents).")
print("Press Q RETURN to quit.")

total = 0

while True:
    kbd = input()
    if kbd.lower() == "q":
        print("You owe $" + str(total) )
        exit()
    else:
        charge = timestamp.Timer("Time is ")
        total = total+charge
```

In this sample code, the variable **charge** is assigned as the endpoint for the **timestamp.Timer()** function, so it receives whatever the function returns. In this case, the function returns a number, so a new variable called **total** is used to keep track of how many changes have been made. When the application receives the signal to quit, it prints the total charges:


```
$ python3 ./charge.py
Press RETURN for the time (costs 2 cents).
Press Q RETURN to quit.

Time is 1560722430.345412

Time is 1560722430.933996

Time is 1560722434.6027434

Time is 1560722438.612629

Time is 1560722439.3649364
q
You owe $0.1
```

#### Inline functions

Functions don't have to be created in separate files. If you're just writing a short script specific to one task, it may make more sense to just write your functions in the same file. The only difference is that you don't have to import your own module, but otherwise the function works the same way. Here's the latest iteration of the time test application as one file:


```
#!/usr/bin/env python3

import time

total = 0

def Timer(msg):
    print(str(msg) + str(time.time() ) )
    charge = .02
    return charge

print("Press RETURN for the time (costs 2 cents).")
print("Press Q RETURN to quit.")

while True:
    kbd = input()
    if kbd.lower() == "q":
        print("You owe $" + str(total) )
        exit()
    else:
        charge = Timer("Time is ")
        total = total+charge
```

It has no external dependencies (the **time** module is included in the Python distribution), and produces the same results as the modular version. The advantage is that everything is located in one file, and the disadvantage is that you cannot use the **Timer()** function in some other script you are writing unless you copy and paste it manually.

#### Global variables

A variable created outside a function has nothing limiting its scope, so it is considered a _global_ variable.

An example of a global variable is the **total** variable in the **charge.py** example used to track current charges. The running total is created outside any function, so it is bound to the application rather than to a specific function.

A function within the application has access to your global variable, but to get the variable into your imported module, you must send it there the same way you send your **msg** variable.

Global variables are convenient because they seem to be available whenever and wherever you need them, but it can be difficult to keep track of their scope and to know which ones are still hanging around in system memory long after they're no longer needed (although Python generally has very good garbage collection).

Global variables are important, though, because not all variables can be local to a function or class. That's easy now that you know how to send variables to functions and get values back.

### Wrapping up functions

You've learned a lot about functions, so start putting them into your scripts—if not as separate modules, then as blocks of code you don't have to write multiple times within one script. In the next article in this series, I'll get into Python classes.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/get-modular-python-functions

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth/users/xd-deng/users/nhuntwalker/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/openstack_python_vim_1.jpg?itok=lHQK5zpm (OpenStack source code (Python) in VIM)
[2]: https://www.python.org/
[3]: https://opensource.com/article/17/10/python-101

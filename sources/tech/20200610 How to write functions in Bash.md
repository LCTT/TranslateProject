[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to write functions in Bash)
[#]: via: (https://opensource.com/article/20/6/bash-functions)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

How to write functions in Bash
======
Reduce redundancy and maintenance in your code by writing functions.
![woman on laptop sitting at the window][1]

When you're programming, you're literally defining a procedure, or a _routine_, you want the computer to perform. A simple analogy compares computer programming to baking bread: you list ingredients once to set up the work environment, then you list the steps you must take to end up with a loaf of bread. In both programming and baking, some steps must be repeated at different intervals. In baking bread, for instance, this could be the process of feeding a sourdough culture:


```
STIR=100
SNOOZE=86400

function feed_culture {
  remove_from(pantry)
  add(flour, water)
  stir($STIR)
  sleep($SNOOZE)
}
```

And later, kneading and proofing the dough:


```
KNEAD=600
SNOOZE=7200

function process_dough {
  remove_from(proofing_drawer)
  knead($KNEAD)
  return_to_drawer($SNOOZE)
}
```

In programming, these subroutines can be expressed as _functions_. Functions are important for programmers because they help reduce redundancy in code, which in turn reduces the amount of maintenance required. For example, in the imaginary scenario of baking bread programmatically, if you need to change the amount of time the dough proofs, as long as you've used a function before, you merely have to change the value of the seconds once, either by using a variable (called **SNOOZE** in the sample code) or directly in the subroutine that processes dough. That can save you a lot of time, because you don't have to hunt through your codebase for every possible mention of rising dough, much less worry about missing one. Many a bug's been caused by a missed value that didn't get changed or by a poorly executed **`sed`** command in hopes of catching every last match without having to hunt for them manually.

In [Bash][2], defining a function is as easy as setting it either in the script file you're writing or in a separate file. If you save functions to a dedicated file, you can `source` it into your script as you would `include` a library in C or C++ or `import` a module into Python. To create a Bash function, use the keyword `function`:


```
function foo {
# code here
}
```

Here's a simple (and somewhat contrived, as this could be made simpler) example of how a function works with arguments:


```
#!/usr/bin/env bash
ARG=$1

function mimic {
  if [[ -z $ARG ]]; then
    ARG='world'
  fi
  echo "hello $ARG"
}

mimic $ARG
```

Here are the results:


```
$ ./mimic
hello world
$ ./mimic everybody
hello everybody
```

Note the final line of the script, which executes the function. This is a common point of confusion for beginning scripters and programmers: functions don't get executed automatically. They exist as _potential_ routines until they are called.

Without a line calling the function, the function would only be defined and would never run.

If you're new to Bash, try executing the sample script once with the last line included and again with the last line commented out.

### Using functions

Functions are vital programming concepts, even for simple scripts. The more comfortable you become with functions, the better off you'll be when you're faced with a complex problem that needs something more dynamic than just declarative lines of commands. Keeping general-purpose functions in separate files can also save you some work, as it'll help you build up routines you commonly use so that you can reuse them across projects. Look at your scripting habits and see where functions might fit.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/bash-functions

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-window-focus.png?itok=g0xPm2kD (young woman working on a laptop)
[2]: https://opensource.com/resources/what-bash

[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How the Zen of Python handles errors)
[#]: via: (https://opensource.com/article/19/12/zen-python-errors)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

How the Zen of Python handles errors
======
This is part of a special series about the Zen of Python focusing on the
10th and 11th principles: on the silence (or not) of errors.
![a checklist for a team][1]

Handling "exceptional conditions" is one of the most debated issues in programming. That could be because the stakes are high: mishandled error values can bring down even the largest systems. Since "exception conditions," by nature, are the least tested but occur with unpleasant frequency, correctly handling them can often distinguish a system that horror stories are told about to a system that "just works."

From Java's **checked** exceptions through Erlang's fault isolation to Haskell's **Maybe**, different languages have remarkably different attitudes to error handling.

The [Zen][2] offers Python's meditation on the topic.

### Errors should never pass silently…

Before the Zen of Python was a twinkle in Tim Peters' eye, before Wikipedia became informally known as "wiki," the first WikiWiki site, [C2][3], existed as a trove of programming guidelines. These are principles that mostly came out of a [Smalltalk][4] programming community. Smalltalk's ideas influenced many object-oriented languages, Python included.

The C2 wiki defines the Samurai Principle: "return victorious, or not at all." In Pythonic terms, it encourages eschewing sentinel values, such as returning **None** or **-1** to indicate an inability to complete the task, in favor of raising exceptions. A **None** is silent: it looks like a value and can be put in a variable and passed around. Sometimes, it is even a _valid_ return value.

The principle here is that if a function cannot accomplish its contract, it should "fail loudly": raise an exception. The raised exception will never look like a possible value. It will skip past the **returned_value = call_to_function(parameter)** line and go up the stack, potentially crashing the program.

A crash is straightforward to debug: there is a stack trace indicating the problem as well as the call stack. The failure might mean that a necessary condition for the program was not met, and human intervention is needed. It might mean that the program's logic is faulty. In either case, the loud failure is better than a hidden, "missing" value, infecting the program's valid data with **None**, until it is used somewhere and an error message says "**None does not have method split**," which you probably already knew.

### Unless explicitly silenced.

Exceptions sometimes need to be explicitly caught. We might anticipate some of the lines in a file are misformatted and want to handle those in a special way, maybe by putting them in a "lines to be looked at by a human" file, instead of crashing the entire program.

Python allows us to catch exceptions with **except**. This means errors can be _explicitly_ silenced. This explicitness means that the **except** line is visible in code reviews. It makes sense to question why this is the right place to silence, and potentially recover from, the exception. It makes sense to ask if we are catching too many exceptions or too few.

Because this is all explicit, it is possible for someone to read the code and understand which exceptional conditions are recoverable.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/zen-python-errors

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/checklist_hands_team_collaboration.png?itok=u82QepPk (a checklist for a team)
[2]: https://www.python.org/dev/peps/pep-0020/
[3]: https://wiki.c2.com/
[4]: https://en.wikipedia.org/wiki/Smalltalk

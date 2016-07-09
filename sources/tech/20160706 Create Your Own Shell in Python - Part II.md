Create Your Own Shell in Python - Part II
===========================================

In [part 1][1], we already created a main shell loop, tokenized command input, and executed a command by fork and exec. In this part, we will solve the remaining problmes. First, `cd test_dir2` does not change our current directory. Second, we still have no way to exit from our shell gracefully.

### Step 4: Built-in Commands

The statement “cd test_dir2 does not change our current directory” is true and false in some senses. It’s true in the sense that after executing the command, we are still at the same directory. However, the directory is actullay changed, but, it’s changed in the child process.

Remember that we fork a child process, then, exec the command which does not happen on a parent process. The result is we just change the current directory of a child process, not the directory of a parent process.

Then, the child process exits, and the parent process continues with the same intact directory.

Therefore, this kind of commands must be built-in with the shell itself. It must be executed in the shell process without forking.

#### cd

Let’s start with cd command.

We first create a builtins directory. Each built-in command will be put inside this directory.

```
yosh_project
|-- yosh
   |-- builtins
   |   |-- __init__.py
   |   |-- cd.py
   |-- __init__.py
   |-- shell.py
```

In cd.py, we implement our own cd command by using a system call os.chdir.

```
import os
from yosh.constants import *


def cd(args):
    os.chdir(args[0])

    return SHELL_STATUS_RUN
```

Notice that we return shell running status from a built-in function. Therefore, we move constants into yosh/constants.py to be used across the project.

```
yosh_project
|-- yosh
   |-- builtins
   |   |-- __init__.py
   |   |-- cd.py
   |-- __init__.py
   |-- constants.py
   |-- shell.py
```

In constants.py, we put shell status constants here.

```
SHELL_STATUS_STOP = 0
SHELL_STATUS_RUN = 1
```

Now, our built-in cd is ready. Let’s modify our shell.py to handle built-in functions.

```
...
# Import constants
from yosh.constants import *

# Hash map to store built-in function name and reference as key and value
built_in_cmds = {}


def tokenize(string):
    return shlex.split(string)


def execute(cmd_tokens):
    # Extract command name and arguments from tokens
    cmd_name = cmd_tokens[0]
    cmd_args = cmd_tokens[1:]

    # If the command is a built-in command, invoke its function with arguments
    if cmd_name in built_in_cmds:
        return built_in_cmds[cmd_name](cmd_args)

    ...
```

We use a Python dictionary built_in_cmds as a hash map to store our built-in functions. In execute function, we extract command name and arguments. If the command name is in our hash map, we call that built-in function.

(Note: built_in_cmds[cmd_name] returns the function reference that can be invoked with arguments immediately.)

We are almost ready to use the built-in cd function. The last thing is to add cd function into the built_in_cmds map.

```
...
# Import all built-in function references
from yosh.builtins import *

...

# Register a built-in function to built-in command hash map
def register_command(name, func):
    built_in_cmds[name] = func


# Register all built-in commands here
def init():
    register_command("cd", cd)


def main():
    # Init shell before starting the main loop
    init()
    shell_loop()
```

We define register_command function for adding a built-in function to our built-in commmand hash map. Then, we define init function and register the built-in cd function there.

Notice the line register_command("cd", cd). The first argument is a command name. The second argument is a reference to a function. In order to let cd, in the second argument, refer to the cd function reference in yosh/builtins/cd.py, we have to put the following line in yosh/builtins/__init__.py.

```
from yosh.builtins.cd import *
```
Therefore, in yosh/shell.py, when we import * from yosh.builtins, we get cd function reference that is already imported by yosh.builtins.

We’ve done preparing our code. Let’s try by running our shell as a module python -m yosh.shell at the same level as the yosh directory.

Now, our cd command should change our shell directory correctly while non-built-in commands still work too. Cool.

#### exit

Here comes the last piece: to exit gracefully.

We need a function that changes the shell status to be SHELL_STATUS_STOP. So, the shell loop will naturally break and the shell program will end and exit.

As same as cd, if we fork and exec exit in a child process, the parent process will still remain inact. Therefore, the exit function is needed to be a shell built-in function.

Let’s start by creating a new file called exit.py in the builtins folder.

```
yosh_project
|-- yosh
   |-- builtins
   |   |-- __init__.py
   |   |-- cd.py
   |   |-- exit.py
   |-- __init__.py
   |-- constants.py
   |-- shell.py
```

The exit.py defines the exit function that just returns the status to break the main loop.

```
from yosh.constants import *


def exit(args):
    return SHELL_STATUS_STOP
```

Then, we import the exit function reference in `yosh/builtins/__init__.py`.

```
from yosh.builtins.cd import *
from yosh.builtins.exit import *
```

Finally, in shell.py, we register the exit command in `init()` function.


```
...

# Register all built-in commands here
def init():
    register_command("cd", cd)
    register_command("exit", exit)

...
```

That’s all!

Try running python -m yosh.shell. Now you can enter exit to quit the program gracefully.

### Final Thought

I hope you enjoy creating yosh (your own shell) like I do. However, my version of yosh is still in an early stage. I don’t handle several corner cases that can corrupt the shell. There are a lot of built-in commands that I don’t cover. Some non-built-in commands can also be implemented as built-in commands to improve performance (avoid new process creation time). And, a ton of features are not yet implemented (see Common features and Differing features).

I’ve provided the source code at github.com/supasate/yosh. Feel free to fork and play around.

Now, it’s your turn to make it real Your Own SHell.

Happy Coding!

--------------------------------------------------------------------------------

via: https://hackercollider.com/articles/2016/07/06/create-your-own-shell-in-python-part-2/

作者：[Supasate Choochaisri][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://disqus.com/by/supasate_choochaisri/
[1]: https://hackercollider.com/articles/2016/07/05/create-your-own-shell-in-python-part-1/
[2]: http://tldp.org/LDP/Bash-Beginners-Guide/html/x7243.html
[3]: http://www.tldp.org/LDP/intro-linux/html/x12249.html
[4]: https://github.com/supasate/yosh

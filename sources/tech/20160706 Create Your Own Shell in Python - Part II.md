使用 Python 创建你自己的 Shell:Part II
===========================================

在[part 1][1]，我们已经创建了一个主要的 shell 循环、切分了的命令输入，以及通过 fork 和 exec 执行命令。在这部分，我们将会解决剩下的问题。首先，`cd test_dir2` 命令无法修改我们的当前目录。其次，我们仍无法优雅地从 shell 中退出。

### 步骤 4：内置命令

“cd test_dir2 无法修改我们的当前目录” 这句话是对的，但在某种意义上也是错的。在执行完该命令之后，我们仍然处在同一目录，从这个意义上讲，它是对的。然而，目录实际上已经被修改，只不过它是在子进程中被修改。

还记得我们 fork 了一个子进程，然后执行命令，执行命令的过程没有发生在父进程上。结果是我们只是改变了子进程的当前目录，而不是父进程的目录。

然后子进程退出，且父进程在原封不动的目录下继续运行。

因此，这类与 shell 自己相关的命令必须是内置命令。它必须在 shell 进程中执行而没有分叉（forking）。

#### cd

让我们从 cd 命令开始。

我们首先创建一个内置目录。每一个内置命令都会被放进这个目录中。

```shell
yosh_project
|-- yosh
   |-- builtins
   |   |-- __init__.py
   |   |-- cd.py
   |-- __init__.py
   |-- shell.py
```

在 cd.py，我们通过使用系统调用 os.chdir 实现自己的 cd 命令。

```python
import os
from yosh.constants import *


def cd(args):
    os.chdir(args[0])

    return SHELL_STATUS_RUN
```

注意，我们会从内置函数返回 shell 的运行状态。所以，为了能够在项目中继续使用常量，我们将它们移至 yosh/constants.py。

```shell
yosh_project
|-- yosh
   |-- builtins
   |   |-- __init__.py
   |   |-- cd.py
   |-- __init__.py
   |-- constants.py
   |-- shell.py
```

在 constants.py，我们将状态常量放在这里。

```python
SHELL_STATUS_STOP = 0
SHELL_STATUS_RUN = 1
```

现在，我们的内置 cd 已经准备好了。让我们修改 shell.py 来处理这些内置函数。

```python
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

我们使用一个 python 字典变量 built_in_cmds 作为哈希映射（a hash map），以存储我们的内置函数。我们在 execute 函数中提取命令的名字和参数。如果该命令在我们的哈希映射中，则调用对应的内置函数。

（提示：built_in_cmds[cmd_name] 返回能直接使用参数调用的函数引用的。) 

我们差不多准备好使用内置的 cd 函数了。最后一步是将 cd 函数添加到 built_in_cmds 映射中。

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

我们定义 register_command 函数以添加一个内置函数到我们内置的命令哈希映射。 
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

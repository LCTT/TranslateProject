使用 Python 创建你自己的 Shell（下）
===========================================

在[上篇][1]中，我们已经创建了一个 shell 主循环、切分了命令输入，以及通过 `fork` 和 `exec` 执行命令。在这部分，我们将会解决剩下的问题。首先，`cd test_dir2` 命令无法修改我们的当前目录。其次，我们仍无法优雅地从 shell 中退出。

### 步骤 4：内置命令

“`cd test_dir2` 无法修改我们的当前目录” 这句话是对的，但在某种意义上也是错的。在执行完该命令之后，我们仍然处在同一目录，从这个意义上讲，它是对的。然而，目录实际上已经被修改，只不过它是在子进程中被修改。

还记得我们分叉（fork）了一个子进程，然后执行命令，执行命令的过程没有发生在父进程上。结果是我们只是改变了子进程的当前目录，而不是父进程的目录。

然后子进程退出，而父进程在原封不动的目录下继续运行。

因此，这类与 shell 自己相关的命令必须是内置命令。它必须在 shell 进程中执行而不是在分叉中（forking）。

#### cd

让我们从 `cd` 命令开始。

我们首先创建一个 `builtins` 目录。每一个内置命令都会被放进这个目录中。

```shell
yosh_project
|-- yosh
   |-- builtins
   |   |-- __init__.py
   |   |-- cd.py
   |-- __init__.py
   |-- shell.py
```

在 `cd.py` 中，我们通过使用系统调用 `os.chdir` 实现自己的 `cd` 命令。

```python
import os
from yosh.constants import *

def cd(args):
    os.chdir(args[0])

    return SHELL_STATUS_RUN
```

注意，我们会从内置函数返回 shell 的运行状态。所以，为了能够在项目中继续使用常量，我们将它们移至 `yosh/constants.py`。

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

在 `constants.py` 中，我们将状态常量都放在这里。

```python
SHELL_STATUS_STOP = 0
SHELL_STATUS_RUN = 1
```

现在，我们的内置 `cd` 已经准备好了。让我们修改 `shell.py` 来处理这些内置函数。

```python
...
### 导入常量
from yosh.constants import *

### 使用哈希映射来存储内建的函数名及其引用
built_in_cmds = {}

def tokenize(string):
    return shlex.split(string)

def execute(cmd_tokens):
    ### 从元组中分拆命令名称与参数
    cmd_name = cmd_tokens[0]
    cmd_args = cmd_tokens[1:]

    ### 如果该命令是一个内建命令，使用参数调用该函数
    if cmd_name in built_in_cmds:
        return built_in_cmds[cmd_name](cmd_args)

    ...
```

我们使用一个 python 字典变量 `built_in_cmds` 作为哈希映射（hash map），以存储我们的内置函数。我们在 `execute` 函数中提取命令的名字和参数。如果该命令在我们的哈希映射中，则调用对应的内置函数。

（提示：`built_in_cmds[cmd_name]` 返回能直接使用参数调用的函数引用。)

我们差不多准备好使用内置的 `cd` 函数了。最后一步是将 `cd` 函数添加到 `built_in_cmds` 映射中。

```
...
### 导入所有内建函数引用
from yosh.builtins import *

...

### 注册内建函数到内建命令的哈希映射中
def register_command(name, func):
    built_in_cmds[name] = func


### 在此注册所有的内建命令
def init():
    register_command("cd", cd)


def main():
    ###在开始主循环之前初始化 shell
    init()
    shell_loop()
```

我们定义了 `register_command` 函数，以添加一个内置函数到我们内置的命令哈希映射。接着，我们定义 `init` 函数并且在这里注册内置的 `cd` 函数。

注意这行 `register_command("cd", cd)` 。第一个参数为命令的名字。第二个参数为一个函数引用。为了能够让第二个参数 `cd` 引用到 `yosh/builtins/cd.py` 中的 `cd` 函数引用，我们必须将以下这行代码放在 `yosh/builtins/__init__.py` 文件中。

```
from yosh.builtins.cd import *
```

因此，在 `yosh/shell.py` 中，当我们从 `yosh.builtins` 导入 `*` 时，我们可以得到已经通过 `yosh.builtins` 导入的 `cd` 函数引用。

我们已经准备好了代码。让我们尝试在 `yosh` 同级目录下以模块形式运行我们的 shell，`python -m yosh.shell`。

现在，`cd` 命令可以正确修改我们的 shell 目录了，同时非内置命令仍然可以工作。非常好！

#### exit

最后一块终于来了：优雅地退出。

我们需要一个可以修改 shell 状态为 `SHELL_STATUS_STOP` 的函数。这样，shell 循环可以自然地结束，shell 将到达终点而退出。

和 `cd` 一样，如果我们在子进程中分叉并执行 `exit` 函数，其对父进程是不起作用的。因此，`exit` 函数需要成为一个 shell 内置函数。

让我们从这开始：在 `builtins` 目录下创建一个名为 `exit.py` 的新文件。

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

`exit.py` 定义了一个 `exit` 函数，该函数仅仅返回一个可以退出主循环的状态。

```
from yosh.constants import *

def exit(args):
    return SHELL_STATUS_STOP
```

然后，我们导入位于 `yosh/builtins/__init__.py` 文件的 `exit` 函数引用。

```
from yosh.builtins.cd import *
from yosh.builtins.exit import *
```

最后，我们在 `shell.py` 中的 `init()` 函数注册 `exit` 命令。

```
...

### 在此注册所有的内建命令
def init():
    register_command("cd", cd)
    register_command("exit", exit)

...
```

到此为止！

尝试执行 `python -m yosh.shell`。现在你可以输入 `exit` 优雅地退出程序了。

### 最后的想法

我希望你能像我一样享受创建 `yosh` （**y**our **o**wn **sh**ell）的过程。但我的 `yosh` 版本仍处于早期阶段。我没有处理一些会使 shell 崩溃的极端状况。还有很多我没有覆盖的内置命令。为了提高性能，一些非内置命令也可以实现为内置命令（避免新进程创建时间）。同时，大量的功能还没有实现（请看 [公共特性](http://tldp.org/LDP/Bash-Beginners-Guide/html/x7243.html) 和 [不同特性](http://www.tldp.org/LDP/intro-linux/html/x12249.html)）

我已经在 https://github.com/supasate/yosh 中提供了源代码。请随意 fork 和尝试。

现在该是创建你真正自己拥有的 Shell 的时候了。

Happy Coding!

--------------------------------------------------------------------------------

via: https://hackercollider.com/articles/2016/07/06/create-your-own-shell-in-python-part-2/

作者：[Supasate Choochaisri][a]
译者：[cposture](https://github.com/cposture)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://disqus.com/by/supasate_choochaisri/
[1]: https://linux.cn/article-7624-1.html
[2]: http://tldp.org/LDP/Bash-Beginners-Guide/html/x7243.html
[3]: http://www.tldp.org/LDP/intro-linux/html/x12249.html
[4]: https://github.com/supasate/yosh

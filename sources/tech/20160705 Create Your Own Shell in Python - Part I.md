使用 Python 创建你自己的 Shell：Part I
==========================================

我很好奇一个 shell （像 bash，csh 等）内部是如何工作的。为了满足自己的好奇心，我使用 Python 实现了一个名为 yosh （Your Own Shell）的 Shell。本文章所介绍的概念也可以应用于其他编程语言。

（提示：你可以发布于此的博文中找到使用的源代码，代码以 MIT 许可发布）

让我们开始吧。

### 步骤 0：项目结构

对于此项目，我使用了以下的项目结构。

```
yosh_project
|-- yosh
   |-- __init__.py
   |-- shell.py
```

`yosh_project` 为项目根目录（你也可以把它简单地命名为 `yosh`）。

`yosh` 为包目录，并且 `__init__.py` 将会使一个包名等同于包目录名字（如果你不写 Python，可以忽略它）

`shell.py` 是我们的主脚本文件。

### 步骤 1：Shell 循环

当你启动一个 shell，它会显示一个命令提示符同时等待用户输入命令。在接收了输入的命令并执行它之后（稍后文章会进行详细解释），你的 shell 会回到循环，等待下一条指令。

在 `shell.py`，我们会以一个简单的 mian 函数开始，该函数调用了 shell_loop() 函数，如下：

```
def shell_loop():
    # Start the loop here


def main():
    shell_loop()


if __name__ == "__main__":
    main()
```    

接着，在 `shell_loop()`，为了指示循环是否继续或停止，我们使用了一个状态标志。在循环的开始，我们的 shell 将显示一个命令提示符，并等待读取命令输入。

```
import sys

SHELL_STATUS_RUN = 1
SHELL_STATUS_STOP = 0


def shell_loop():
    status = SHELL_STATUS_RUN

    while status == SHELL_STATUS_RUN:
        # Display a command prompt
        sys.stdout.write('> ')
        sys.stdout.flush()

        # Read command input
        cmd = sys.stdin.readline()
```

之后，我们切分命令输入并进行执行（我们将马上解释命令切分和执行函数）。

因此，我们的 shell_loop() 会是如下这样：

```
import sys

SHELL_STATUS_RUN = 1
SHELL_STATUS_STOP = 0


def shell_loop():
    status = SHELL_STATUS_RUN

    while status == SHELL_STATUS_RUN:
        # Display a command prompt
        sys.stdout.write('> ')
        sys.stdout.flush()

        # Read command input
        cmd = sys.stdin.readline()

        # Tokenize the command input
        cmd_tokens = tokenize(cmd)

        # Execute the command and retrieve new status
        status = execute(cmd_tokens)
```

这就是我们整个 shell 循环。如果我们使用 python shell.py 命令启动 shell，它会显示命令提示符。然而如果我们输入命令并按回车，它将会抛出错误，因为我们还没定义命令切分函数。

为了退出 shell，可以尝试输入 ctrl-c。稍后我将解释如何以优雅的形式退出 shell。

### 步骤 2：命令切分

当一个用户在我们的 shell 中输入命令并按下回车键，该命令将会是一个包含命令名称及其参数的很长的字符串。因此，我们必须切分该字符串（分割一个字符串为多个标记）。

咋一看似乎很简单。我们或许可以使用 cmd.split()，用空格分割输入。它对类似 `ls -a my_folder` 的命令起作用，因为它能够将命令分割为一个列表 `['ls', '-a', 'my_folder']`，这样我们便能轻易处理它们了。

然而，也有一些类似 `echo "Hello World"` 或 `echo 'Hello World'` 以单引号或双引号引用参数的情况。如果我们使用 cmd.spilt，我们将会得到一个存有 3 个标记的列表 `['echo', '"Hello', 'World"']` 而不是 2 个标记 `['echo', 'Hello World']`。

幸运的是，Python 提供了一个名为 shlex 的库，能够帮助我们效验如神地分割命令。（提示：我们也可以使用正则表达式，但它不是本文的重点。）


```
import sys
import shlex

...

def tokenize(string):
    return shlex.split(string)

...
```

然后我们将这些标记发送到执行过程。

### 步骤 3：执行

这是 shell 中核心和有趣的一部分。当 shell 执行 mkdir test_dir 时，发生了什么？（提示：midir 是一个带有 test_dir 参数的执行程序，用于创建一个名为 test_dir 的目录。）

execvp 是涉及这一步的首个函数。在我们解释 execvp 所做的事之前，让我们看看它的实际效果。

```
import os
...

def execute(cmd_tokens):
    # Execute command
    os.execvp(cmd_tokens[0], cmd_tokens)

    # Return status indicating to wait for next command in shell_loop
    return SHELL_STATUS_RUN

...
```

再次尝试运行我们的 shell，并输入 `mkdir test_dir` 命令，接着按下回车键。

在我们敲下回车键之后，问题是我们的 shell 会直接退出而不是等待下一个命令。然而，目标正确地被创建。

因此，execvp 实际上做了什么？

execvp 是系统调用 exec 的一个变体。第一个参数是程序名字。v 表示第二个参数是一个程序参数列表（可变参数）。p 表示环境变量 PATH 会被用于搜索给定的程序名字。在我们上一次的尝试中，可以在你的 PATH 环境变量查找到 mkdir 程序。

（还有其他 exec 变体，比如 execv、execvpe、execl、execlp、execlpe；你可以 google 它们获取更多的信息。）

exec 会用即将运行的新进程替换调用进程的当前内存。在我们的例子中，我们的 shell 进程内存会被替换为 `mkdir` 程序。接着，mkdir 成为主进程并创建 test_dir 目录。最后该进程退出。

这里的重点在于我们的 shell 进程已经被 mkdir 进程所替换。这就是我们的 shell 消失且不会等待下一条命令的原因。

因此，我们需要其他的系统调用来解决问题：fork

fork 会开辟新的内存并拷贝当前进程到一个新的进程。我们称这个新的进程为子进程，调用者进程为父进程。然后，子进程内存会被替换为被执行的程序。因此，我们的 shell，也就是父进程，可以免受内存替换的危险。

让我们看看已修改的代码。

```
...

def execute(cmd_tokens):
    # Fork a child shell process
    # If the current process is a child process, its `pid` is set to `0`
    # else the current process is a parent process and the value of `pid`
    # is the process id of its child process.
    pid = os.fork()

    if pid == 0:
    # Child process
        # Replace the child shell process with the program called with exec
        os.execvp(cmd_tokens[0], cmd_tokens)
    elif pid > 0:
    # Parent process
        while True:
            # Wait response status from its child process (identified with pid)
            wpid, status = os.waitpid(pid, 0)

            # Finish waiting if its child process exits normally
            # or is terminated by a signal
            if os.WIFEXITED(status) or os.WIFSIGNALED(status):
                break

    # Return status indicating to wait for next command in shell_loop
    return SHELL_STATUS_RUN

...
```

当我们的父进程调用 `os.fork()`时，你可以想象所有的源代码被拷贝到了新的子进程。此时此刻，父进程和子进程看到的是相同的代码，并且并行运行着。

如果运行的代码属于子进程，pid 将为 0。否则，如果运行的代码属于父进程，pid 将会是子进程的进程 id。

当 os.execvp 在子进程中被调用时，你可以想象子进程的所有源代码被替换为正被调用程序的代码。然而父进程的代码不会被改变。

当父进程完成等待子进程退出或终止时，它会返回一个状态，指示继续 shell 循环。

### 运行

现在，你可以尝试运行我们的 shell 并输入 mkdir test_dir2。它应该可以正确执行。我们的主 shell 进程仍然存在并等待下一条命令。尝试执行 ls，你可以看到已创建的目录。

但是，这里仍有许多问题。

第一，尝试执行 cd test_dir2，接着执行 ls。它应该会进入到一个空的 test_dir2 目录。然而，你将会看到目录没有变为 test_dir2。

第二，我们仍然没有办法优雅地退出我们的 shell。

我们将会在 [Part 2][1] 解决诸如此类的问题。


--------------------------------------------------------------------------------

via: https://hackercollider.com/articles/2016/07/05/create-your-own-shell-in-python-part-1/

作者：[Supasate Choochaisri][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://disqus.com/by/supasate_choochaisri/
[1]: https://hackercollider.com/articles/2016/07/06/create-your-own-shell-in-python-part-2/

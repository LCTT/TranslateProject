使用 Python 创建你自己的 Shell （一）
==========================================

我很想知道一个 shell （像 bash，csh 等）内部是如何工作的。于是为了满足自己的好奇心，我使用 Python 实现了一个名为 **yosh** （Your Own Shell）的 Shell。本文章所介绍的概念也可以应用于其他编程语言。

（提示：你可以在[这里](https://github.com/supasate/yosh)查找本博文使用的源代码，代码以 MIT 许可证发布。在 Mac OS X 10.11.5 上，我使用 Python 2.7.10 和 3.4.3 进行了测试。它应该可以运行在其他类 Unix 环境，比如 Linux 和 Windows 上的 Cygwin。）

让我们开始吧。

### 步骤 0：项目结构

对于此项目，我使用了以下的项目结构。

```
yosh_project
|-- yosh
   |-- __init__.py
   |-- shell.py
```

`yosh_project` 为项目根目录（你也可以把它简单命名为 `yosh`）。

`yosh` 为包目录，且 `__init__.py` 可以使它成为与包的目录名字相同的包（如果你不用 Python 编写的话，可以忽略它。）

`shell.py` 是我们主要的脚本文件。

### 步骤 1：Shell 循环

当启动一个 shell，它会显示一个命令提示符并等待你的命令输入。在接收了输入的命令并执行它之后（稍后文章会进行详细解释），你的 shell 会重新回到这里，并循环等待下一条指令。

在 `shell.py` 中，我们会以一个简单的 main 函数开始，该函数调用了 shell_loop() 函数，如下：

```
def shell_loop():
    # Start the loop here


def main():
    shell_loop()


if __name__ == "__main__":
    main()
```    

接着，在 `shell_loop()` 中，为了指示循环是否继续或停止，我们使用了一个状态标志。在循环的开始，我们的 shell 将显示一个命令提示符，并等待读取命令输入。

```
import sys

SHELL_STATUS_RUN = 1
SHELL_STATUS_STOP = 0


def shell_loop():
    status = SHELL_STATUS_RUN

    while status == SHELL_STATUS_RUN:
        ### 显示命令提示符
        sys.stdout.write('> ')
        sys.stdout.flush()

        ### 读取命令输入
        cmd = sys.stdin.readline()
```

之后，我们切分命令（tokenize）输入并进行执行（execute）（我们即将实现 `tokenize` 和 `execute` 函数）。

因此，我们的 shell_loop() 会是如下这样：

```
import sys

SHELL_STATUS_RUN = 1
SHELL_STATUS_STOP = 0


def shell_loop():
    status = SHELL_STATUS_RUN

    while status == SHELL_STATUS_RUN:
        ### 显示命令提示符
        sys.stdout.write('> ')
        sys.stdout.flush()

        ### 读取命令输入
        cmd = sys.stdin.readline()

        ### 切分命令输入
        cmd_tokens = tokenize(cmd)

        ### 执行该命令并获取新的状态
        status = execute(cmd_tokens)
```

这就是我们整个 shell 循环。如果我们使用 `python shell.py` 启动我们的 shell，它会显示命令提示符。然而如果我们输入命令并按回车，它会抛出错误，因为我们还没定义 `tokenize` 函数。

为了退出 shell，可以尝试输入 ctrl-c。稍后我将解释如何以优雅的形式退出 shell。

### 步骤 2：命令切分（tokenize）

当用户在我们的 shell 中输入命令并按下回车键，该命令将会是一个包含命令名称及其参数的长字符串。因此，我们必须切分该字符串（分割一个字符串为多个元组）。

咋一看似乎很简单。我们或许可以使用 `cmd.split()`，以空格分割输入。它对类似 `ls -a my_folder` 的命令起作用，因为它能够将命令分割为一个列表 `['ls', '-a', 'my_folder']`，这样我们便能轻易处理它们了。

然而，也有一些类似 `echo "Hello World"` 或 `echo 'Hello World'` 以单引号或双引号引用参数的情况。如果我们使用 cmd.spilt，我们将会得到一个存有 3 个标记的列表 `['echo', '"Hello', 'World"']` 而不是 2 个标记的列表 `['echo', 'Hello World']`。

幸运的是，Python 提供了一个名为 `shlex` 的库，它能够帮助我们如魔法般地分割命令。（提示：我们也可以使用正则表达式，但它不是本文的重点。）


```
import sys
import shlex

...

def tokenize(string):
    return shlex.split(string)

...
```

然后我们将这些元组发送到执行进程。

### 步骤 3：执行

这是 shell 中核心而有趣的一部分。当 shell 执行 `mkdir test_dir` 时，到底发生了什么？（提示： `mkdir` 是一个带有 `test_dir` 参数的执行程序，用于创建一个名为 `test_dir` 的目录。）

`execvp` 是这一步的首先需要的函数。在我们解释 `execvp` 所做的事之前，让我们看看它的实际效果。

```
import os
...

def execute(cmd_tokens):
    ### 执行命令
    os.execvp(cmd_tokens[0], cmd_tokens)

    ### 返回状态以告知在 shell_loop 中等待下一个命令
    return SHELL_STATUS_RUN

...
```

再次尝试运行我们的 shell，并输入 `mkdir test_dir` 命令，接着按下回车键。

在我们敲下回车键之后，问题是我们的 shell 会直接退出而不是等待下一个命令。然而，目录正确地创建了。

因此，`execvp` 实际上做了什么？

`execvp` 是系统调用 `exec` 的一个变体。第一个参数是程序名字。`v` 表示第二个参数是一个程序参数列表（参数数量可变）。`p` 表示将会使用环境变量 `PATH` 搜索给定的程序名字。在我们上一次的尝试中，它将会基于我们的 `PATH` 环境变量查找`mkdir` 程序。

（还有其他 `exec` 变体，比如 execv、execvpe、execl、execlp、execlpe；你可以 google 它们获取更多的信息。）

`exec` 会用即将运行的新进程替换调用进程的当前内存。在我们的例子中，我们的 shell 进程内存会被替换为 `mkdir` 程序。接着，`mkdir` 成为主进程并创建 `test_dir` 目录。最后该进程退出。

这里的重点在于**我们的 shell 进程已经被 `mkdir` 进程所替换**。这就是我们的 shell 消失且不会等待下一条命令的原因。

因此，我们需要其他的系统调用来解决问题：`fork`。

`fork` 会分配新的内存并拷贝当前进程到一个新的进程。我们称这个新的进程为**子进程**，调用者进程为**父进程**。然后，子进程内存会被替换为被执行的程序。因此，我们的 shell，也就是父进程，可以免受内存替换的危险。

让我们看看修改的代码。

```
...

def execute(cmd_tokens):
    ### 分叉一个子 shell 进程
    ### 如果当前进程是子进程，其 `pid` 被设置为 `0`
    ### 否则当前进程是父进程的话，`pid` 的值
    ### 是其子进程的进程 ID。
    pid = os.fork()

    if pid == 0:
    ### 子进程
        ### 用被 exec 调用的程序替换该子进程
        os.execvp(cmd_tokens[0], cmd_tokens)
    elif pid > 0:
    ### 父进程
        while True:
            ### 等待其子进程的响应状态（以进程 ID 来查找）
            wpid, status = os.waitpid(pid, 0)

            ### 当其子进程正常退出时
            ### 或者其被信号中断时，结束等待状态
            if os.WIFEXITED(status) or os.WIFSIGNALED(status):
                break

    ### 返回状态以告知在 shell_loop 中等待下一个命令
    return SHELL_STATUS_RUN

...
```

当我们的父进程调用 `os.fork()` 时，你可以想象所有的源代码被拷贝到了新的子进程。此时此刻，父进程和子进程看到的是相同的代码，且并行运行着。

如果运行的代码属于子进程，`pid` 将为 `0`。否则，如果运行的代码属于父进程，`pid` 将会是子进程的进程 id。

当 `os.execvp` 在子进程中被调用时，你可以想象子进程的所有源代码被替换为正被调用程序的代码。然而父进程的代码不会被改变。

当父进程完成等待子进程退出或终止时，它会返回一个状态，指示继续 shell 循环。

### 运行

现在，你可以尝试运行我们的 shell 并输入 `mkdir test_dir2`。它应该可以正确执行。我们的主 shell 进程仍然存在并等待下一条命令。尝试执行 `ls`，你可以看到已创建的目录。

但是，这里仍有一些问题。

第一，尝试执行 `cd test_dir2`，接着执行 `ls`。它应该会进入到一个空的 `test_dir2` 目录。然而，你将会看到目录并没有变为 `test_dir2`。

第二，我们仍然没有办法优雅地退出我们的 shell。

我们将会在 [第二部分][1] 解决诸如此类的问题。


--------------------------------------------------------------------------------

via: https://hackercollider.com/articles/2016/07/05/create-your-own-shell-in-python-part-1/

作者：[Supasate Choochaisri][a]
译者：[cposture](https://github.com/cposture)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://disqus.com/by/supasate_choochaisri/
[1]: https://hackercollider.com/articles/2016/07/06/create-your-own-shell-in-python-part-2/

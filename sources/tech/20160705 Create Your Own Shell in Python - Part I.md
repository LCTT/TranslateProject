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

咋一看它似乎很简单。我们或许可以使用 cmd.split()，用空格分割输入。
It seems simple at first glance. We might use cmd.split() to separate the input by spaces. It works well for a command like `ls -a my_folder` because it splits the command into a list `['ls', '-a', 'my_folder']` which we can use them easily.

However, there are some cases that some arguments are quoted with single or double quotes like `echo "Hello World"` or `echo 'Hello World'`. If we use cmd.split(), we will get a list of 3 tokens `['echo', '"Hello', 'World"']` instead of 2 tokens `['echo', 'Hello World']`.

Fortunately, Python provides a library called shlex that helps us split like a charm. (Note: we can also use regular expression but it’s not the main point of this article.)

```
import sys
import shlex

...

def tokenize(string):
    return shlex.split(string)

...
```

Then, we will send these tokens to the execution process.

### Step 3: Execution

This is the core and fun part of a shell. What happened when a shell executes mkdir test_dir? (Note: mkdir is a program to be executed with arguments test_dir for creating a directory named test_dir.)

The first function involved in this step is execvp. Before I explain what execvp does, let’s see it in action.

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

Try running our shell again and input a command `mkdir test_dir`, then, hit enter.

The problem is, after we hit enter, our shell exits instead of waiting for the next command. However, the directory is correctly created.

So, what execvp really does?

execvp is a variant of a system call exec. The first argument is the program name. The v indicates the second argument is a list of program arguments (variable number of arguments). The p indicates the PATH environment will be used for searching for the given program name. In our previous attempt, the mkdir program was found based on your PATH environment variable.

(There are other variants of exec such as execv, execvpe, execl, execlp, execlpe; you can google them for more information.)

exec replaces the current memory of a calling process with a new process to be executed. In our case, our shell process memory was replaced by `mkdir` program. Then, mkdir became the main process and created the test_dir directory. Finally, its process exited.

The main point here is that our shell process was replaced by mkdir process already. That’s the reason why our shell disappeared and did not wait for the next command.

Therefore, we need another system call to rescue: fork.

fork will allocate new memory and copy the current process into a new process. We called this new process as child process and the caller process as parent process. Then, the child process memory will be replaced by a execed program. Therefore, our shell, which is a parent process, is safe from memory replacement.

Let’s see our modified code.

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

When the parent process call `os.fork()`, you can imagine that all source code is copied into a new child process. At this point, the parent and child process see the same code and run in parallel.

If the running code is belong to the child process, pid will be 0. Else, the running code is belong to the parent process, pid will be the process id of the child process.

When os.execvp is invoked in the child process, you can imagine like all the source code of the child process is replaced by the code of a program that is being called. However, the code of the parent process is not changed.

When the parent process finishes waiting its child process to exit or be terminated, it returns the status indicating to continue the shell loop.

### Run

Now, you can try running our shell and enter mkdir test_dir2. It should work properly. Our main shell process is still there and waits for the next command. Try ls and you will see the created directories.

However, there are some problems here.

First, try cd test_dir2 and then ls. It’s supposed to enter the directory test_dir2 which is an empty directory. However, you will see that the directory was not changed into test_dir2.

Second, we still have no way to exit from our shell gracefully.

We will continue to solve such problems in [Part 2][1].


--------------------------------------------------------------------------------

via: https://hackercollider.com/articles/2016/07/05/create-your-own-shell-in-python-part-1/

作者：[Supasate Choochaisri][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://disqus.com/by/supasate_choochaisri/
[1]: https://hackercollider.com/articles/2016/07/06/create-your-own-shell-in-python-part-2/

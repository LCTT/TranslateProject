Translating by cposture 2016.07.09
Create Your Own Shell in Python : Part I

I’m curious to know how a shell (like bash, csh, etc.) works internally. So, I implemented one called yosh (Your Own SHell) in Python to answer my own curiosity. The concept I explain in this article can be applied to other languages as well.

(Note: You can find source code used in this blog post here. I distribute it with MIT license.)

Let’s start.

### Step 0: Project Structure

For this project, I use the following project structure.

```
yosh_project
|-- yosh
   |-- __init__.py
   |-- shell.py
```

`yosh_project` is the root project folder (you can also name it just `yosh`).

`yosh` is the package folder and `__init__.py` will make it a package named the same as the package folder name. (If you don’t write Python, just ignore it.)

`shell.py` is our main shell file.

### Step 1: Shell Loop

When you start a shell, it will show a command prompt and wait for your command input. After it receives the command and executes it (the detail will be explained later), your shell will be back to the wait loop for your next command.

In `shell.py`, we start by a simple main function calling the shell_loop() function as follows:

```
def shell_loop():
    # Start the loop here


def main():
    shell_loop()


if __name__ == "__main__":
    main()
```    

Then, in our `shell_loop()`, we use a status flag to indicate whether the loop should continue or stop. In the beginning of the loop, our shell will show a command prompt and wait to read command input.

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

After that, we tokenize the command input and execute it (we’ll implement the tokenize and execute functions soon).

Therefore, our shell_loop() will be the following.

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

That’s all of our shell loop. If we start our shell with python shell.py, it will show the command prompt. However, it will throw an error if we type a command and hit enter because we don’t define tokenize function yet.

To exit the shell, try ctrl-c. I will tell how to exit gracefully later.

### Step 2: Tokenization

When a user types a command in our shell and hits enter. The command input will be a long string containing both a command name and its arguments. Therefore, we have to tokenize it (split a string into several tokens).

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

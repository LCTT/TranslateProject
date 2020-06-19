[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Import functions and variables into Bash with the source command)
[#]: via: (https://opensource.com/article/20/6/bash-source-command)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Import functions and variables into Bash with the source command
======
Source is like a Python import or a Java include. Learn it to expand
your Bash prowess.
![bash logo on green background][1]

When you log into a Linux shell, you inherit a specific working environment. An _environment_, in the context of a shell, means that there are certain variables already set for you, which ensures your commands work as intended. For instance, the [PATH][2] environment variable defines where your shell looks for commands. Without it, nearly everything you try to do in Bash would fail with a **command not found** error. Your environment, while mostly invisible to you as you go about your everyday tasks, is vitally important.

There are many ways to affect your shell environment. You can make modifications in configuration files, such as `~/.bashrc` and `~/.profile`, you can run services at startup, and you can create your own custom commands or script your own [Bash functions][3].

### Add to your environment with source

Bash (along with some other shells) has a built-in command called `source`. And here's where it can get confusing: `source` performs the same function as the command `.` (yes, that's but a single dot), and it's _not_ the same `source` as the `Tcl` command (which may come up on your screen if you type `man source`). The built-in `source` command isn't in your `PATH` at all, in fact. It's a command that comes included as a part of Bash, and to get further information about it, you can type `help source`.

The `.` command is [POSIX][4]-compliant. The `source` command is not defined by POSIX but is interchangeable with the `.` command.

According to Bash `help`, the `source` command executes a file in your current shell. The clause "in your current shell" is significant, because it means it doesn't launch a sub-shell; therefore, whatever you execute with `source` happens within and affects your _current_ environment.

Before exploring how `source` can affect your environment, try `source` on a test file to ensure that it executes code as expected. First, create a simple Bash script and save it as a file called `hello.sh`:


```
#!/usr/bin/env bash
echo "hello world"
```

Using `source`, you can run this script even without setting the executable bit:


```
$ source hello.sh
hello world
```

You can also use the built-in`.` command for the same results:


```
$ . hello.sh
hello world
```

The `source` and `.` commands successfully execute the contents of the test file.

### Set variables and import functions

You can use `source` to "import" a file into your shell environment, just as you might use the `include` keyword in C or C++ to reference a library or the `import` keyword in Python to bring in a module. This is one of the most common uses for `source`, and it's a common default inclusion in `.bashrc` files to `source` a file called `.bash_aliases` so that any custom aliases you define get imported into your environment when you log in.

Here's an example of importing a Bash function. First, create a function in a file called `myfunctions`. This prints your public IP address and your local IP address:


```
function myip() {
        curl <http://icanhazip.com>      

        ip addr | grep inet$IP | \
        cut -d"/" -f 1 | \
        grep -v 127\\.0 | \
        grep -v \:\:1 | \
        awk '{$1=$1};1'
}
```

Import the function into your shell:


```
`$ source myfunctions`
```

Test your new function:


```
$ myip
93.184.216.34
inet 192.168.0.23
inet6 fbd4:e85f:49c:2121:ce12:ef79:0e77:59d1
inet 10.8.42.38
```

### Search for source

When you use `source` in Bash, it searches your current directory for the file you reference. This doesn't happen in all shells, so check your documentation if you're not using Bash.

If Bash can't find the file to execute, it searches your `PATH` instead. Again, this isn't the default for all shells, so check your documentation if you're not using Bash.

These are both nice convenience features in Bash. This behavior is surprisingly powerful because it allows you to store common functions in a centralized location on your drive and then treat your environment like an integrated development environment (IDE). You don't have to worry about where your functions are stored, because you know they're in your local equivalent of `/usr/include`, so no matter where you are when you source them, Bash finds them.

For instance, you could create a directory called `~/.local/include` as a storage area for common functions and then put this block of code into your `.bashrc` file:


```
for i in $HOME/.local/include/*;
  do source $i
done
```

This "imports" any file containing custom functions in `~/.local/include` into your shell environment.

Bash is the only shell that searches both the current directory and your `PATH` when you use either the `source` or the `.` command.

### Using source for open source

Using `source` or `.` to execute files can be a convenient way to affect your environment while keeping your alterations modular. The next time you're thinking of copying and pasting big blocks of code into your `.bashrc` file, consider placing related functions or groups of aliases into dedicated files, and then use `source` to ingest them.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/bash-source-command

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U (bash logo on green background)
[2]: https://opensource.com/article/17/6/set-path-linux
[3]: https://opensource.com/article/20/6/how-write-functions-bash
[4]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains

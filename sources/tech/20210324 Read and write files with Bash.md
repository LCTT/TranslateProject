[#]: subject: (Read and write files with Bash)
[#]: via: (https://opensource.com/article/21/3/input-output-bash)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Read and write files with Bash
======
Learn the different ways Bash reads and writes data and when to use each
method.
![bash logo on green background][1]

When you're scripting with Bash, sometimes you need to read data from or write data to a file. Sometimes a file may contain configuration options, and other times the file is the data your user is creating with your application. Every language handles this task a little differently, and this article demonstrates how to handle data files with Bash and other [POSIX][2] shells.

### Install Bash

If you're on Linux, you probably already have Bash. If not, you can find it in your software repository.

On macOS, you can use the default terminal, either Bash or [Zsh][3], depending on the macOS version you're running.

On Windows, there are several ways to experience Bash, including Microsoft's officially supported [Windows Subsystem for Linux][4] (WSL).

Once you have Bash installed, open your favorite text editor and get ready to code.

### Reading a file with Bash

In addition to being [a shell][5], Bash is a scripting language. There are several ways to read data from Bash: You can create a sort of data stream and parse the output, or you can load data into memory. Both are valid methods of ingesting information, but each has pretty specific use cases.

#### Source a file in Bash

When you "source" a file in Bash, you cause Bash to read the contents of a file with the expectation that it contains valid data that Bash can fit into its established data model. You won't source data from any old file, but you can use this method to read configuration files and functions.

For instance, create a file called `example.sh` and enter this into it:


```
#!/bin/sh

greet opensource.com

echo "The meaning of life is $var"
```

Run the code to see it fail:


```
$ bash ./example.sh
./example.sh: line 3: greet: command not found
The meaning of life is
```

Bash doesn't have a command called `greet`, so it could not execute that line, and it has no record of a variable called `var`, so there is no known meaning of life. To fix this problem, create a file called `include.sh`:


```
greet() {
    echo "Hello ${1}"
}

var=42
```

Revise your `example.sh` script to include a `source` command:


```
#!/bin/sh

source include.sh

greet opensource.com

echo "The meaning of life is $var"
```

Run the script to see it work:


```
$ bash ./example.sh
Hello opensource.com
The meaning of life is 42
```

The `greet` command is brought into your shell environment because it is defined in the `include.sh` file, and it even recognizes the argument (`opensource.com` in this example). The variable `var` is set and imported, too.

#### Parse a file in Bash

The other way to get data "into" Bash is to parse it as a data stream. There are many ways to do this. You can use `grep` or `cat` or any command that takes data and pipes it to stdout. Alternately, you can use what is built into Bash: the redirect. Redirection on its own isn't very useful, so in this example, I also use the built-in `echo` command to print the results of the redirect:


```
#!/bin/sh

echo $( &lt; include.sh )
```

Save this as `stream.sh` and run it to see the results:


```
$ bash ./stream.sh
greet() { echo "Hello ${1}" } var=42
$
```

For each line in the `include.sh` file, Bash prints (or echoes) the line to your terminal. Piping it first to an appropriate parser is a common way to read data with Bash. For instance, assume for a moment that `include.sh` is a configuration file with key and value pairs separated by an equal (`=`) sign. You could obtain values with `awk` or even `cut`:


```
#!/bin/sh

myVar=`grep var include.sh | cut -d'=' -f2`

echo $myVar
```

Try running the script:


```
$ bash ./stream.sh
42
```

### Writing data to a file with Bash

Whether you're storing data your user created with your application or just metadata about what the user did in an application (for instance, game saves or recent songs played), there are many good reasons to store data for later use. In Bash, you can save data to files using common shell redirection.

For instance, to create a new file containing output, use a single redirect token:


```
#!/bin/sh

TZ=UTC
date &gt; date.txt
```

Run the script a few times:


```
$ bash ./date.sh
$ cat date.txt
Tue Feb 23 22:25:06 UTC 2021
$ bash ./date.sh
$ cat date.txt
Tue Feb 23 22:25:12 UTC 2021
```

To append data, use the double redirect tokens:


```
#!/bin/sh

TZ=UTC
date &gt;&gt; date.txt
```

Run the script a few times:


```
$ bash ./date.sh
$ bash ./date.sh
$ bash ./date.sh
$ cat date.txt
Tue Feb 23 22:25:12 UTC 2021
Tue Feb 23 22:25:17 UTC 2021
Tue Feb 23 22:25:19 UTC 2021
Tue Feb 23 22:25:22 UTC 2021
```

### Bash for easy programming

Bash excels at being easy to learn because, with just a few basic concepts, you can build complex programs. For the full documentation, refer to the [excellent Bash documentation][6] on GNU.org.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/input-output-bash

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U (bash logo on green background)
[2]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[3]: https://opensource.com/article/19/9/getting-started-zsh
[4]: https://opensource.com/article/19/7/ways-get-started-linux#wsl
[5]: https://www.redhat.com/sysadmin/terminals-shells-consoles
[6]: http://gnu.org/software/bash

[#]: subject: "How to include options in your Bash shell scripts"
[#]: via: "https://opensource.com/article/21/8/option-parsing-bash"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "unigeorge"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to include options in your Bash shell scripts
======
Give your shell scripts options.
![Terminal commands][1]

Terminal commands usually have [options or switches][2], which you can use to modify how the command does what it does. Options are included in the [POSIX specification][3] for command-line interfaces. It's also a time-honored convention established with the earliest UNIX applications, so it's good to know how to include them in your [Bash scripts][4] when you're creating your own commands.

As with most languages, there are several ways to solve the problem of parsing options in Bash. To this day, my favorite method remains the one I learned from Patrick Volkerding's Slackware build scripts, which served as my introduction to shell scripting back when I first discovered Linux and dared to venture into the plain text files that shipped with the OS.

### Option parsing in Bash

The strategy for parsing options in Bash is to cycle through all arguments passed to your shell script, determine whether they are an option or not, and then shift to the next argument. Repeat this process until no options remain.

Start with a simple Boolean option (sometimes called a _switch_ or a _flag_):


```
#!/bin/bash

while [ True ]; do
if [ "$1" = "--alpha" -o "$1" = "-a" ]; then
    ALPHA=1
    shift 1
else
    break
fi
done

echo $ALPHA
```

In this code, I create a `while` loop which serves as an infinite loop until there are no further arguments to process. An `if` statement attempts to match whatever argument is found in the first position (`$1`) to either `--alpha` or `-a`. (These are arbitrary option names with no special significance. In an actual script, you might use `--verbose` and `-v` to trigger verbose output).

The `shift` keyword causes all arguments to shift by 1, such that an argument in position 2 (`$2`) is moved into position 1 (`$1`). The `else` statement is triggered when there are no further arguments to process, which breaks the `while` loop.

At the end of the script, the value of `$ALPHA` is printed to the terminal.

Test the script:


```
$ bash ./test.sh --alpha
1
$ bash ./test.sh

$ bash ./test.sh -a
1
```

The option is correctly detected.

### Detecting arguments in Bash

There is a problem, though: Extra arguments are ignored.


```
$ bash ./test.sh --alpha foo
1
$
```

To catch arguments that aren't intended as options, you can dump remaining arguments into a [Bash array][5].


```
#!/bin/bash

while [ True ]; do
if [ "$1" = "--alpha" -o "$1" = "-a" ]; then
    ALPHA=1
    shift 1
else
    break
fi
done

echo $ALPHA

ARG=( "${@}" )
for i in ${ARG[@]}; do
    echo $i
done
```

Test the new version of the script:


```
$ bash ./test.sh --alpha foo
1
foo
$ bash ./test.sh foo

foo
$ bash ./test.sh --alpha foo bar
1
foo
bar
```

### Options with arguments

Some options require an argument all their own. For instance, you might want to allow the user to set an attribute such as a color or the resolution of a graphic or to point your application to a custom configuration file.

To implement this in Bash, you can use the `shift` keyword as you do with Boolean switches but shift the arguments by 2 instead of 1.


```
#!/bin/bash

while [ True ]; do
if [ "$1" = "--alpha" -o "$1" = "-a" ]; then
    ALPHA=1
    shift 1
elif [ "$1" = "--config" -o "$1" = "-c" ]; then
    CONFIG=$2
    shift 2
else
    break
fi
done

echo $ALPHA
echo $CONFIG

ARG=( "${@}" )

for i in ${ARG[@]}; do
    echo $i
done
```

In this code, I add an `elif` clause to compare each argument to both `--config` and `-c`. In the event of a match, the value of a variable called `CONFIG` is set to the value of whatever the second argument is (this means that the `--config` option requires an argument). All arguments shift place by 2: 1 to shift `--config` or `-c`, and 1 to move its argument. As usual, the loop repeats until no matching arguments remain.

Here's a test of the new version of the script:


```
$ bash ./test.sh --config my.conf foo bar
my.conf
foo
bar
$ bash ./test.sh -a --config my.conf baz
1
my.conf
baz
```

### Option parsing made easy

There are other ways to parse options in Bash. You can alternately use a `case` statement or the `getopt` command. Whatever you choose to use, options for your users are important features for any application, and Bash makes it easy.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/option-parsing-bash

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[unigeorge](https://github.com/unigeorge)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/terminal-commands_1.png?itok=Va3FdaMB (Terminal commands)
[2]: https://opensource.com/article/21/8/linux-terminal#options
[3]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[4]: https://opensource.com/downloads/bash-scripting-ebook
[5]: https://opensource.com/article/18/5/you-dont-know-bash-intro-bash-arrays

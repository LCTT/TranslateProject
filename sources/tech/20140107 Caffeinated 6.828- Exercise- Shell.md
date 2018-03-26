translating---geekpi

Caffeinated 6.828: Exercise: Shell
======

This assignment will make you more familiar with the Unix system call interface and the shell by implementing several features in a small shell. You can do this assignment on any operating system that supports the Unix API (a Linux Athena machine, your laptop with Linux or Mac OS, etc.). Please submit your shell to the the [submission web site][1] at any time before the first lecture.

While you shouldn't be shy about emailing the [staff mailing list][2] if you get stuck or don't understand something in this exercise, we do expect you to be able to handle this level of C programming on your own for the rest of the class. If you're not very familiar with C, consider this a quick check to see how familiar you are. Again, do feel encouraged to ask us for help if you have any questions.

Download the [skeleton][3] of the xv6 shell, and look it over. The skeleton shell contains two main parts: parsing shell commands and implementing them. The parser recognizes only simple shell commands such as the following:
```
ls > y
cat < y | sort | uniq | wc > y1
cat y1
rm y1
ls | sort | uniq | wc
rm y

```

Cut and paste these commands into a file `t.sh`

You can compile the skeleton shell as follows:
```
$ gcc sh.c

```

which produces a file named `a.out`, which you can run:
```
$ ./a.out < t.sh

```

This execution will panic because you have not implemented several features. In the rest of this assignment you will implement those features.

### Executing simple commands

Implement simple commands, such as:
```
$ ls

```

The parser already builds an `execcmd` for you, so the only code you have to write is for the ' ' case in `runcmd`. To test that you can run "ls". You might find it useful to look at the manual page for `exec`; type `man 3 exec`.

You do not have to implement quoting (i.e., treating the text between double-quotes as a single argument).

### I/O redirection

Implement I/O redirection commands so that you can run:
```
echo "6.828 is cool" > x.txt
cat < x.txt

```

The parser already recognizes '>' and '<', and builds a `redircmd` for you, so your job is just filling out the missing code in `runcmd` for those symbols. Make sure your implementation runs correctly with the above test input. You might find the man pages for `open` (`man 2 open`) and `close` useful.

Note that this shell will not process quotes in the same way that `bash`, `tcsh`, `zsh` or other UNIX shells will, and your sample file `x.txt` is expected to contain the quotes.

### Implement pipes

Implement pipes so that you can run command pipelines such as:
```
$ ls | sort | uniq | wc

```

The parser already recognizes "|", and builds a `pipecmd` for you, so the only code you must write is for the '|' case in `runcmd`. Test that you can run the above pipeline. You might find the man pages for `pipe`, `fork`, `close`, and `dup` useful.

Now you should be able the following command correctly:
```
$ ./a.out < t.sh

```

Don't forget to submit your solution to the [submission web site][1], with or without challenge solutions.

### Challenge exercises

If you'd like to experiment more, you can add any feature of your choice to your shell. You might try one of the following suggestions:

  * Implement lists of commands, separated by `;`
  * Implement subshells by implementing `(` and `)`
  * Implement running commands in the background by supporting `&` and `wait`
  * Implement quoting of arguments



All of these require making changing to the parser and the `runcmd` function.

--------------------------------------------------------------------------------

via: https://sipb.mit.edu/iap/6.828/lab/shell/

作者：[mit][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://sipb.mit.edu
[1]:https://exokernel.scripts.mit.edu/submit/
[2]:mailto:sipb-iap-6.828@mit.edu
[3]:https://sipb.mit.edu/iap/6.828/files/sh.c

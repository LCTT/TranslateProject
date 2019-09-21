[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Understanding a *nix Shell by Writing One)
[#]: via: (https://theartofmachinery.com/2018/11/07/writing_a_nix_shell.html)
[#]: author: (Simon Arneaud https://theartofmachinery.com)

Understanding a *nix Shell by Writing One
======

A typical *nix shell has a lot of programming-like features, but works quite differently from languages like Python or C++. This can make a lot of shell features — like process management, argument quoting and the `export` keyword — seem like mysterious voodoo.

But a shell is just a program, so a good way to learn how a shell works is to write one. I’ve written [a simple shell that fits in a few hundred lines of commented D source][1]. Here’s a post that walks through how it works and how you could write one yourself.

### First (Cheating) Steps

A shell is a kind of REPL (Read Evaluate Print Loop). At its heart is just a simple loop that reads commands from the input, processes them, and returns a result:

```
import std.process;
import io = std.stdio;

enum kPrompt = "> ";

void main()
{
    io.write(kPrompt);
    foreach (line; io.stdin.byLineCopy())
    {
        // "Cheating" by using the existing shell for now
        auto result = executeShell(line);
        io.write(result.output);
        io.write(kPrompt);
    }
}

$ dmd shell.d
$ ./shell
> head /usr/share/dict/words
A
a
aa
aal
aalii
aam
Aani
aardvark
aardwolf
Aaron
> # Press Ctrl+D to quit
>
$
```

If you try out this code out for yourself, you’ll soon notice that you don’t have any nice editing features like tab completion or command history. The popular Bash shell uses a library called [GNU Readline][2] for that. You can get most of the features of Readline when playing with these toy examples just by running them under [rlwrap][3] (probably already in your system’s package manager).

### DIY Command Execution (First Attempt)

That first example demonstrated the absolute basic structure of a shell, but it cheated by passing commands directly to the shell already running on the system. Obviously, that doesn’t explain anything about how a real shell processes commands.

The basic idea, though, is very simple. Nearly everything that gets called a “shell command” (e.g., `ls` or `head` or `grep`) is really just a program on the filesystem. The shell just has to run it. At the operating system level, running a program is done using the `execve` system call (or one of its alternatives). For portability and convenience, the normal way to make a system call is to use one of the wrapper functions in the C library. Let’s try using `execv()`:

```
import core.sys.posix.stdio;
import core.sys.posix.unistd;

import io = std.stdio;
import std.string;

enum kPrompt = "> ";

void main()
{
    io.write(kPrompt);
    foreach (line; io.stdin.byLineCopy())
    {
        runCommand(line);
        io.write(kPrompt);
    }
}

void runCommand(string cmd)
{
    // Need to convert D string to null-terminated C string
    auto cmdz = cmd.toStringz();

    // We need to pass execv an array of program arguments
    // By convention, the first element is the name of the program

    // C arrays don't carry a length, just the address of the first element.
    // execv starts reading memory from the first element, and needs a way to
    // know when to stop.  Instead of taking a length value as an argument,
    // execv expects the array to end with a null as a stopping marker.

    auto argsz = [cmdz, null];
    auto error = execv(cmdz, argsz.ptr);
    if (error)
    {
        perror(cmdz);
    }
}
```

Here’s a sample run:

```
> ls
ls: No such file or directory
> head
head: No such file or directory
> grep
grep: No such file or directory
> ಠ_ಠ
ಠ_ಠ: No such file or directory
>
```

Okay, so that’s not working so well. The problem is that that the `execve` call isn’t as smart as a shell: it just literally executes the program it’s told to. In particular, it has no smarts for finding the programs that implement `ls` or `head`. For now, let’s do the finding ourselves, and then give `execve` the full path to the command:

```
$ which ls
/bin/ls
$ ./shell
> /bin/ls
shell shell.d shell.o
$
```

This time the `ls` command worked, but our shell quit and we dropped straight back into the system’s shell. What’s going on? Well, `execve` really is a single-purpose call: it doesn’t spawn a new process for running the program separately from the current program, it _replaces_ the current program. (The toy shell actually quit when `ls` started, not when it finished.) Creating a new process is done with a different system call: traditionally `fork`. This isn’t how programming languages normally work, so it might seem like weird and annoying behaviour, but it’s actually really useful. Decoupling process creation from program execution allows a lot of flexibility, as will become clearer later.

### Fork and Exec

To keep the shell running, we’ll use the `fork()` C function to create a new process, and then make that new process `execv()` the program that implements the command. (On modern GNU/Linux systems, `fork()` is actually a wrapper around a system call called `clone`, but it still behaves like the classic `fork` system call.)

`fork()` duplicates the current process. We get a second process that’s running the same program, at the same point, with a copy of everything in memory and all the same open files. Both the original process (parent) and the duplicate (child) keep running normally. Of course, we want the parent process to keep running the shell, and the child to `execv()` the command. The `fork()` function helps us differentiate them by returning zero in the child and a non-zero value in the parent. (This non-zero value is the process ID of the child.)

Let’s try it out in a new version of the `runCommand()` function:

```
int runCommand(string cmd)
{
    // fork() duplicates the process
    auto pid = fork();
    // Both the parent and child keep running from here as if nothing happened
    // pid will be < 0 if forking failed for some reason
    // Otherwise pid == 0 for the child and != 0 for the parent
    if (pid < 0)
    {
        perror("Can't create a new process");
        exit(1);
    }
    if (pid == 0)
    {
        // Child process
        auto cmdz = cmd.toStringz();
        auto argsz = [cmdz, null];
        execv(cmdz, argsz.ptr);

        // Only get here if exec failed
        perror(cmdz);
        exit(1);
    }
    // Parent process
    // This toy shell can only run one command at a time
    // All the parent does is wait for the child to finish
    int status;
    wait(&status);
    // This is the exit code of the child
    // (Conventially zero means okay, non-zero means error)
    return WEXITSTATUS(status);
}
```

Here it is in action:

```
> /bin/ls
shell shell.d shell.o
> /bin/uname
Linux
>
```

Progress! But it still doesn’t feel like a real shell if we have to tell it exactly where to find each command.

### PATH

If you try using `which` to find the implementations of various commands, you might notice they’re all in the same small set of directories. The list of directories that contains commands is stored in an environment variable called `PATH`. It looks something like this:

```
$ echo $PATH
/home/user/bin:/home/user/local/bin:/home/user/.local/bin:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/games/bin
```

As you can see, it’s a list of directories separated by colons. If you ask a shell to run `ls`, it’s supposed to search each directory in this list for a program called `ls`. The search should be done in order starting from the first directory, so a personal implementation of `ls` in `/home/user/bin` could override the one in `/bin`. Production-ready shells cache this lookup.

`PATH` is only used by default. If we type in a path to a program, that program will be used directly.

Here’s a simple implemention of a smarter conversion of a command name to a C string that points to the executable. It returns a null if the command can’t be found.

```
const(char*) findExecutable(string cmd)
{
    if (cmd.canFind('/'))
    {
        if (exists(cmd)) return cmd.toStringz();
        return null;
    }

    foreach (dir; environment["PATH"].splitter(":"))
    {
        import std.path : buildPath;
        auto candidate = buildPath(dir, cmd);
        if (exists(candidate)) return candidate.toStringz();
    }
    return null;
}
```

Here’s what the shell looks like now:

```
> ls
shell shell.d shell.o
> uname
Linux
> head shell.d
head shell.d: No such file or directory
>
```

### Complex Commands

That last command failed because the toy shell doesn’t handle program arguments yet, so it tries to find a command literally called “head shell.d”.

If you look back at the implementation of `runCommand()`, you’ll see that `execv()` takes a C array of arguments, as well as the path to the program to run. All we have to do is process the command to make the array `["head", "shell.d", null]`. Something like this would do it:

```
// Key difference: split the command into pieces
auto args = cmd.split();

auto cmdz = findExecutable(args[0]);
if (cmdz is null)
{
    io.stderr.writef("%s: No such file or directory\n", args[0]);
    // 127 means "Command not found"
    // http://tldp.org/LDP/abs/html/exitcodes.html
    exit(127);
}
auto argsz = args.map!(toStringz).array;
argsz ~= null;
auto error = execv(cmdz, argsz.ptr);
```

That makes simple arguments work, but we quickly get into problems:

```
> head -n 5 shell.d
import core.sys.posix.fcntl;
import core.sys.posix.stdio;
import core.sys.posix.stdlib;
import core.sys.posix.sys.wait;
import core.sys.posix.unistd;
> echo asdf
asdf
> echo $HOME
$HOME
> ls *.d
ls: cannot access '*.d': No such file or directory
> ls '/home/user/file with spaces.txt'
ls: cannot access "'/home/user/file": No such file or directory
ls: cannot access 'with': No such file or directory
ls: cannot access "spaces.txt'": No such file or directory
>
```

As you might guess by looking at the above, shells like a POSIX Bourne shell (or Bash) do a _lot_ more than just `split()`. Take the `echo $HOME` example. It’s a common idiom to use `echo` for viewing environment variables (like `HOME`), but `echo` itself doesn’t actually do any environment variable handling. A POSIX shell processes a command like `echo $HOME` into an array like `["echo", "/home/user", null]` and passes it to `echo`, which does nothing but reflect its arguments back to the terminal.

A POSIX shell also handles glob patterns like `*.d`. That’s why glob patterns work with _any_ command in *nix (unlike MS-DOS, for example): the commands don’t even see the globs.

The command `ls '/home/user/file with spaces.txt'` got split into `["ls", "'/home/user/file", "with", "spaces.txt'", null]`. Any useful shell lets you use quoting and escaping to prevent any processing (like splitting into arguments) that you don’t want. Once again, quotes are completely handled by the shell; commands don’t even see them. Also, unlike most programming languages, everything is a string in shell, so there’s no difference between `head -n 5 shell.d` and `head -n '5' shell.d` — both turn into `["head", "-n", "5", "shell.d", null]`.

There’s something you might notice from that last example: the shell can’t treat flags like `-n 5` differently from positional arguments like `shell.d` because `execve` only takes a single array of all arguments. So that means argument types are one thing that programs _do_ have to figure out for themselves, which explains [the clichéd inteview question about why quotes won’t help you delete a file called `-`][4] (i.e., the quotes are processed before the `rm` command sees them).

A POSIX shell supports quite complex constructs like `while` loops and pipelines, but the toy shell only supports simple commands.

### Tweaking the Child Process

I said earlier that decoupling `fork` from `exec` allows extra flexibility. Let me give a couple of examples.

#### I/O Redirection

A key design principle of Unix is that commands should be agnostic about where their input and output are from, so that user input/output can be replaced with file input/output, or even input/output of other commands. E.g.:

```
sort events.txt | head -n 10 > /tmp/top_ten_events.txt
```

How does it work? Take the `head` command. The shell forks off a new child process. The child is a duplicate of the parent, so it inherits the same standard input and output. However, the child can replace its own standard input with a pipe shared with the process for `sort`, and replace its own standard output with a file handle for `/tmp/top_ten_events.txt`. After calling `execv()`, the process will become a `head` process that blindly reads/writes to/from whatever standard I/O it has.

Getting down to the low-level details, *nix systems represent all file handles with so-called “file descriptors”, which are just integers as far as user programs are concerned, but point to data structures inside the operating system kernel. Standard input is file descriptor 0, and standard output is file descriptor 1. Replacing standard output for `head` looks something like this (minus error handling):

```
// The fork happens somewhere back here
// Now running in the child process

// Open the new file (no control over the file descriptor)
auto new_fd = open("/tmp/top_ten_events.txt", O_WRONLY | O_CREAT, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
// Copy the open file into file #1 (standard output)
dup2(new_fd, 1);
// Close the spare file descriptor
close(new_fd);

// The exec happens somewhere down here
```

The pipeline works in the same kind of way, except instead of using `open()` to open a file, we use `pipe()` to create _two_ connected file descriptors, and then let `sort` use one, and `head` use the other.

#### Environment Variables

If you’ve ever had to deploy something using a command line, there’s a good chance you’ve had to set some of these configuration variables. Each process carries its own set of environment variables, so you can override, say, `AUDIODEV` for one running program without affecting others. The C standard library provides functions for manipulating environment variables, but they’re not actually managed by the operating system kernel — the [C runtime][5] manages them using the same user-space memory that other program variables use. That means they also get copied to child processes on a `fork`. The runtime and the kernel co-operate to preserve them on `execve`.

There’s no reason we can’t manipulate the environment variables the child process ends up using. POSIX shells support this: just put any variable assignments you want directly in front of the command.

```
$ uname
Linux
$ # LD_DEBUG is an environment variable for enabling linker debugging
$ # (Doesn't work on all systems.)
$ LD_DEBUG=statistics uname
12128:
12128:    runtime linker statistics:
12128:      total startup time in dynamic loader: 2591152 cycles
12128:            time needed for relocation: 816752 cycles (31.5%)
12128:                     number of relocations: 153
12128:          number of relocations from cache: 3
12128:            number of relative relocations: 1304
12128:           time needed to load objects: 1196148 cycles (46.1%)
Linux
$ # LD_DEBUG was only set for uname
$ echo $LD_DEBUG

$ # Pop quiz: why doesn't this print "bar"?
$ FOO=bar echo $FOO

$
```

These temporary environment variables are useful and easy to implement.

### Builtins

It’s great that the fork/exec pattern lets us reconfigure the child process as much as we like without affecting the parent shell. But some commands _need_ to affect the shell. A good example is the `cd` command for changing the current working directory. It would be pointless if it ran in a child process, changed its own working directory, then just quit, leaving the shell unchanged.

The simple solution to this problem is builtins. I said that most shell commands are implemented as external programs on the filesystem. Well, some aren’t — they’re handled directly by the shell itself. Before searching PATH for a command implementation, the shell just checks if it has it’s own built-in implementation. A neat way to code this is [the function pointer approach I described in a previous post][6].

You can read [a list of Bash builtins in the Advanced Bash-Scripting Guide][7]. Some, like `cd`, are builtins because they’re highly coupled to the shell. Others, like `echo`, have built-in implementations for performance reasons (most systems also have a standalone `echo` program).

There’s one builtin that confuses a lot of people: `export`. It makes sense if you realise that the POSIX shell scripting language has its own variables that are totally separate from environment variables. A variable assignment is just a shell variable by default, and `export` makes it into an environment variable (when spawning child processes, at least). The difference is that the C runtime doesn’t know anything about shell variables, so they get lost on `execve`.

```
$ uname
Linux
$ # Let's try setting LD_DEBUG
$ LD_DEBUG=statistics
$ # It has no effect because that's actually just a shell variable
$ uname
Linux
$ # Let's try making into an environment variable:
$ export LD_DEBUG
$ uname
12128:
12128:  runtime linker statistics:
12128:    total startup time in dynamic loader: 2591152 cycles
12128:          time needed for relocation: 816752 cycles (31.5%)
12128:                   number of relocations: 153
12128:        number of relocations from cache: 3
12128:          number of relative relocations: 1304
12128:         time needed to load objects: 1196148 cycles (46.1%)
Linux
$ # Now every non-builtin will dump debugging info
$ # Let's stop that for sanity's sake
$ unset LD_DEBUG
$
```

### Putting it Together

A POSIX-compliant shell does a lot more stuff (like signal handling and job management) but that’s enough to understand how to write an MVP *nix shell. You can see all the pieces together by checking out [the complete working example in my repository][1].

--------------------------------------------------------------------------------

via: https://theartofmachinery.com/2018/11/07/writing_a_nix_shell.html

作者：[Simon Arneaud][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://theartofmachinery.com
[b]: https://github.com/lujun9972
[1]: https://gitlab.com/sarneaud/toyshell
[2]: https://tiswww.case.edu/php/chet/readline/rltop.html
[3]: https://github.com/hanslub42/rlwrap
[4]: https://unix.stackexchange.com/questions/1519/how-do-i-delete-a-file-whose-name-begins-with-hyphen-a-k-a-dash-or-minus
[5]: /2017/06/04/what_is_the_d_runtime.html#what-about-c--does-c-really-have-a-runtime-too
[6]: /2018/04/02/inheritance_and_polymorphism.html
[7]: https://www.tldp.org/LDP/abs/html/internal.html

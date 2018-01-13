Translating by jessie-pang

What happens when you start a process on Linux?
===========================================================


This is about how fork and exec works on Unix. You might already know about this, but some people don’t, and I was surprised when I learned it a few years back!

So. You want to start a process. We’ve talked a lot about **system calls** on this blog – every time you start a process, or open a file, that’s a system call. So you might think that there’s a system call like this

```
start_process(["ls", "-l", "my_cool_directory"])

```

This is a reasonable thing to think and apparently it’s how it works in DOS/Windows. I was going to say that this  _isn’t_  how it works on Linux. But! I went and looked at the docs and apparently there is a [posix_spawn][2] system call that does basically this. Shows what I know. Anyway, we’re not going to talk about that.

### fork and exec

`posix_spawn` on Linux is behind the scenes implemented in terms of 2 system calls called `fork` and `exec` (actually `execve`), which are what people usually actually use anyway. On OS X apparently people use `posix_spawn` and fork/exec are discouraged! But we’ll talk about Linux.

Every process in Linux lives in a “process tree”. You can see that tree by running `pstree`. The root of the tree is `init`, with PID 1\. Every process (except init) has a parent, and any process has many children.

So, let’s say I want to start a process called `ls` to list a directory. Do I just have a baby `ls`? No!

Instead of having children, what I do is you have a child that is a clone of myself, and then that child gets its brain eaten and turns into `ls`. Really.

We start out like this:

```
my parent
    |- me

```

Then I run `fork()`. I have a child which is a clone of myself.

```
my parent
    |- me
       |-- clone of me

```

Then I organize it so that my child runs `exec("ls")`. That leaves us with

```
my parent
    |- me
       |-- ls

```

and once ls exits, I’ll be all by myself again. Almost

```
my parent
    |- me
       |-- ls (zombie)

```

At this point ls is actually a zombie process! That means it’s dead, but it’s waiting around for me in case I want to check on its return value (using the `wait` system call.) Once I get its return value, I will really be all alone again.

```
my parent
    |- me

```

### what fork and exec looks like in code

This is one of the exercises you have to do if you’re going to write a shell (which is a very fun and instructive project! Kamal has a great workshop on Github about how to do it: [https://github.com/kamalmarhubi/shell-workshop][3])

It turns out that with a bit of work & some C or Python skills you can write a very simple shell (like bash!) in C or Python in just a few hours (at least if you have someone sitting next to you who knows what they’re doing, longer if not :)). I’ve done this and it was awesome.

Anyway, here’s what fork and exec look like in a program. I’ve written fake C pseudocode. Remember that [fork can fail!][4]

```
int pid = fork();
// now i am split in two! augh!
// who am I? I could be either the child or the parent
if (pid == 0) {
    // ok I am the child process
    // ls will eat my brain and I'll be a totally different process 
    exec(["ls"])
} else if (pid == -1) {
    // omg fork failed this is a disaster 
} else {
    // ok i am the parent
    // continue my business being a cool program
    // I could wait for the child to finish if I want
}

```

### ok what does it mean for your brain to be eaten julia

Processes have a lot of attributes!

You have

*   open files (including open network connections)

*   environment variables

*   signal handlers (what happens when you run Ctrl+C on the program?)

*   a bunch of memory (your “address space”)

*   registers

*   an “executable” that you ran (/proc/$pid/exe)

*   cgroups and namespaces (“linux container stuff”)

*   a current working directory

*   the user your program is running as

*   some other stuff that I’m forgetting

When you run `execve` and have another program eat your brain, actually almost everything stays the same! You have the same environment variables and signal handlers and open files and more.

The only thing that changes is, well, all of your memory and registers and the program that you’re running. Which is a pretty big deal.

### why is fork not super expensive (or: copy on write)

You might ask “julia, what if I have a process that’s using 2GB of memory! Does that mean every time I start a subprocess all that 2GB of memory gets copied?! That sounds expensive!”

It turns out that Linux implements “copy on write” for fork() calls, so that for all the 2GB of memory in the new process it’s just like “look at the old process! it’s the same!”. And then if the either process writes any memory, then at that point it’ll start copying. But if the memory is the same in both processes, there’s no need to copy!

### why you might care about all this

Okay, julia, this is cool trivia, but why does it matter? Do the details about which signal handlers or environment variables get inherited or whatever actually make a difference in my day-to-day programming?

Well, maybe! For example, there’s this [delightful bug on Kamal’s blog][5]. It talks about how Python sets the signal handler for SIGPIPE to ignore. So if you run a program from inside Python, by default it will ignore SIGPIPE! This means that the program will **behave differently** depending on whether you started it from a Python script or from your shell! And in this case it was causing a weird bug!

So, your program’s environment (environment, signal handlers, etc.) can matter! It inherits its environment from its parent process, whatever that was! This can sometimes be a useful thing to know when debugging.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2016/10/04/exec-will-eat-your-brain/

作者：[ Julia Evans][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://jvns.ca
[1]:https://jvns.ca/categories/favorite
[2]:http://man7.org/linux/man-pages/man3/posix_spawn.3.html
[3]:https://github.com/kamalmarhubi/shell-workshop
[4]:https://rachelbythebay.com/w/2014/08/19/fork/
[5]:http://kamalmarhubi.com/blog/2015/06/30/my-favourite-bug-so-far-at-the-recurse-center/

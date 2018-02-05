translating by ucasFL

How does gdb call functions?
============================================================

(previous gdb posts: [how does gdb work? (2016)][4] and [three things you can do with gdb (2014)][5])

I discovered this week that you can call C functions from gdb! I thought this was cool because I’d previously thought of gdb as mostly a read-only debugging tool.

I was really surprised by that (how does that WORK??). As I often do, I asked [on Twitter][6] how that even works, and I got a lot of really useful answers! My favorite answer was [Evan Klitzke’s example C code][7] showing a way to do it. Code that  _works_  is very exciting!

I believe (through some stracing & experiments) that that example C code is different from how gdb actually calls functions, so I’ll talk about what I’ve figured out about what gdb does in this post and how I’ve figured it out.

There is a lot I still don’t know about how gdb calls functions, and very likely some things in here are wrong.

### What does it mean to call a C function from gdb?

Before I get into how this works, let’s talk quickly about why I found it surprising / nonobvious.

So, you have a running C program (the “target program”). You want to run a function from it. To do that, you need to basically:

*   pause the program (because it is already running code!)

*   find the address of the function you want to call (using the symbol table)

*   convince the program (the “target program”) to jump to that address

*   when the function returns, restore the instruction pointer and registers to what they were before

Using the symbol table to figure out the address of the function you want to call is pretty straightforward – here’s some sketchy (but working!) Rust code that I’ve been using on Linux to do that. This code uses the [elf crate][8]. If I wanted to find the address of the `foo` function in PID 2345, I’d run `elf_symbol_value("/proc/2345/exe", "foo")`.

```
fn elf_symbol_value(file_name: &str, symbol_name: &str) -> Result<u64, Box<std::error::Error>> {
    // open the ELF file
    let file = elf::File::open_path(file_name).ok().ok_or("parse error")?;
    // loop over all the sections & symbols until you find the right one!
    let sections = &file.sections;
    for s in sections {
        for sym in file.get_symbols(&s).ok().ok_or("parse error")? {
            if sym.name == symbol_name {
                return Ok(sym.value);
            }
        }
    }
    None.ok_or("No symbol found")?
}

```

This won’t totally work on its own, you also need to look at the memory maps of the file and add the symbol offset to the start of the place that file is mapped. But finding the memory maps isn’t so hard, they’re in `/proc/PID/maps`.

Anyway, this is all to say that finding the address of the function to call seemed straightforward to me but that the rest of it (change the instruction pointer? restore the registers? what else?) didn’t seem so obvious!

### You can’t just jump

I kind of said this already but – you can’t just find the address of the function you want to run and then jump to that address. I tried that in gdb (`jump foo`) and the program segfaulted. Makes sense!

### How you can call C functions from gdb

First, let’s see that this is possible. I wrote a tiny C program that sleeps for 1000 seconds and called it `test.c`:

```
#include <unistd.h>

int foo() {
    return 3;
}
int main() {
    sleep(1000);
}

```

Next, compile and run it:

```
$ gcc -o test  test.c
$ ./test

```

Finally, let’s attach to the `test` program with gdb:

```
$ sudo gdb -p $(pgrep -f test)
(gdb) p foo()
$1 = 3
(gdb) quit

```

So I ran `p foo()` and it ran the function! That’s fun.

### Why is this useful?

a few possible uses for this:

*   it lets you treat gdb a little bit like a C REPL, which is fun and I imagine could be useful for development

*   utility functions to display / navigate complex data structures quickly while debugging in gdb (thanks [@invalidop][1])

*   [set an arbitrary process’s namespace while it’s running][2] (featuring a not-so-surprising appearance from my colleague [nelhage][3]!)

*   probably more that I don’t know about

### How it works

I got a variety of useful answers on Twitter when I asked how calling functions from gdb works! A lot of them were like “well you get the address of the function from the symbol table” but that is not the whole story!!

One person pointed me to this nice 2 part series on how gdb works that they’d written: [Debugging with the natives, part 1][9] and [Debugging with the natives, part 2][10]. Part 1 explains approximately how calling functions works (or could work – figuring out what gdb **actually** does isn’t trivial, but I’ll try my best!).

The steps outlined there are:

1.  Stop the process

2.  Create a new stack frame (far away from the actual stack)

3.  Save all the registers

4.  Set the registers to the arguments you want to call your function with

5.  Set the stack pointer to the new stack frame

6.  Put a trap instruction somewhere in memory

7.  Set the return address to that trap instruction

8.  Set the instruction pointer register to the address of the function you want to call

9.  Start the process again!

I’m not going to go through how gdb does all of these (I don’t know!) but here are a few things I’ve learned about the various pieces this evening.

**Create a stack frame**

If you’re going to run a C function, most likely it needs a stack to store variables on! You definitely don’t want it to clobber your current stack. Concretely – before gdb calls your function (by setting the instruction pointer to it and letting it go), it needs to set the **stack pointer** to… something.

There was some speculation on Twitter about how this works:

> i think it constructs a new stack frame for the call right on top of the stack where you’re sitting!

and:

> Are you certain it does that? It could allocate a pseudo stack, then temporarily change sp value to that location. You could try, put a breakpoint there and look at the sp register address, see if it’s contiguous to your current program register?

I did an experiment where (inside gdb) I ran:`

```
(gdb) p $rsp
$7 = (void *) 0x7ffea3d0bca8
(gdb) break foo
Breakpoint 1 at 0x40052a
(gdb) p foo()
Breakpoint 1, 0x000000000040052a in foo ()
(gdb) p $rsp
$8 = (void *) 0x7ffea3d0bc00

```

This seems in line with the “gdb constructs a new stack frame for the call right on top of the stack where you’re sitting” theory, since the stack pointer (`$rsp`) goes from being `...bca8` to `..bc00` – stack pointers grow downward, so a `bc00`stack pointer is **after** a `bca8` pointer. Interesting!

So it seems like gdb just creates the new stack frames right where you are. That’s a bit surprising to me!

**change the instruction pointer**

Let’s see whether gdb changes the instruction pointer!

```
(gdb) p $rip
$1 = (void (*)()) 0x7fae7d29a2f0 <__nanosleep_nocancel+7>
(gdb) b foo
Breakpoint 1 at 0x40052a
(gdb) p foo()
Breakpoint 1, 0x000000000040052a in foo ()
(gdb) p $rip
$3 = (void (*)()) 0x40052a <foo+4>

```

It does! The instruction pointer changes from `0x7fae7d29a2f0` to `0x40052a` (the address of the `foo` function).

I stared at the strace output and I still don’t understand **how** it changes, but that’s okay.

**aside: how breakpoints are set!!**

Above I wrote `break foo`. I straced gdb while running all of this and understood almost nothing but I found ONE THING that makes sense to me!!

Here are some of the system calls that gdb uses to set a breakpoint. It’s really simple! It replaces one instruction with `cc` (which [https://defuse.ca/online-x86-assembler.htm][11] tells me means `int3` which means `send SIGTRAP`), and then once the program is interrupted, it puts the instruction back the way it was.

I was putting a breakpoint on a function `foo` with the address `0x400528`.

This `PTRACE_POKEDATA` is how gdb changes the code of running programs.

```
// change the 0x400528 instructions
25622 ptrace(PTRACE_PEEKTEXT, 25618, 0x400528, [0x5d00000003b8e589]) = 0
25622 ptrace(PTRACE_POKEDATA, 25618, 0x400528, 0x5d00000003cce589) = 0
// start the program running
25622 ptrace(PTRACE_CONT, 25618, 0x1, SIG_0) = 0
// get a signal when it hits the breakpoint
25622 ptrace(PTRACE_GETSIGINFO, 25618, NULL, {si_signo=SIGTRAP, si_code=SI_KERNEL, si_value={int=-1447215360, ptr=0x7ffda9bd3f00}}) = 0
// change the 0x400528 instructions back to what they were before
25622 ptrace(PTRACE_PEEKTEXT, 25618, 0x400528, [0x5d00000003cce589]) = 0
25622 ptrace(PTRACE_POKEDATA, 25618, 0x400528, 0x5d00000003b8e589) = 0

```

**put a trap instruction somewhere**

When gdb runs a function, it **also** puts trap instructions in a bunch of places! Here’s one of them (per strace). It’s basically replacing one instruction with `cc` (`int3`).

```
5908  ptrace(PTRACE_PEEKTEXT, 5810, 0x7f6fa7c0b260, [0x48f389fd89485355]) = 0
5908  ptrace(PTRACE_PEEKTEXT, 5810, 0x7f6fa7c0b260, [0x48f389fd89485355]) = 0
5908 ptrace(PTRACE_POKEDATA, 5810, 0x7f6fa7c0b260, 0x48f389fd894853cc) = 0

```

What’s `0x7f6fa7c0b260`? Well, I looked in the process’s memory maps, and it turns it’s somewhere in `/lib/x86_64-linux-gnu/libc-2.23.so`. That’s weird! Why is gdb putting trap instructions in libc?

Well, let’s see what function that’s in. It turns out it’s `__libc_siglongjmp`. The other functions gdb is putting traps in are `__longjmp`, `____longjmp_chk`, `dl_main`, and `_dl_close_worker`.

Why? I don’t know! Maybe for some reason when our function `foo()` returns, it’s calling `longjmp`, and that is how gdb gets control back? I’m not sure.

### how gdb calls functions is complicated!

I’m going to stop there (it’s 1am!), but now I know a little more!

It seems like the answer to “how does gdb call a function?” is definitely not that simple. I found it interesting to try to figure a little bit of it out and hopefully you have too!

I still have a lot of unanswered questions about how exactly gdb does all of these things, but that’s okay. I don’t really need to know the details of how this works and I’m happy to have a slightly improved understanding.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2018/01/04/how-does-gdb-call-functions/

作者：[Julia Evans ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://jvns.ca/
[1]:https://twitter.com/invalidop/status/949161146526781440
[2]:https://github.com/baloo/setns/blob/master/setns.c
[3]:https://github.com/nelhage
[4]:https://jvns.ca/blog/2016/08/10/how-does-gdb-work/
[5]:https://jvns.ca/blog/2014/02/10/three-steps-to-learning-gdb/
[6]:https://twitter.com/b0rk/status/948060808243765248
[7]:https://github.com/eklitzke/ptrace-call-userspace/blob/master/call_fprintf.c
[8]:https://cole14.github.io/rust-elf
[9]:https://www.cl.cam.ac.uk/~srk31/blog/2016/02/25/#native-debugging-part-1
[10]:https://www.cl.cam.ac.uk/~srk31/blog/2017/01/30/#native-debugging-part-2
[11]:https://defuse.ca/online-x86-assembler.htm

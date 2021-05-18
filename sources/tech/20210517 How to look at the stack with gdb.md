[#]: subject: (How to look at the stack with gdb)
[#]: via: (https://jvns.ca/blog/2021/05/17/how-to-look-at-the-stack-in-gdb/)
[#]: author: (Julia Evans https://jvns.ca/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to look at the stack with gdb
======

I was chatting with someone yesterday and they mentioned that they don’t really understand exactly how the stack works or how to look at it.

So here’s a quick walkthrough of how you can use gdb to look at the stack of a C program. I think this would be similar for a Rust program, but I’m going to use C because I find it a little simpler for a toy example and also you can do Terrible Things in C more easily.

### our test program

Here’s a simple C program that declares a few variables and reads two strings from standard input. One of the strings is on the heap, and one is on the stack.

```
#include <stdio.h>
#include <stdlib.h>

int main() {
    char stack_string[10] = "stack";
    int x = 10;
    char *heap_string;

    heap_string = malloc(50);

    printf("Enter a string for the stack: ");
    gets(stack_string);
    printf("Enter a string for the heap: ");
    gets(heap_string);
    printf("Stack string is: %s\n", stack_string);
    printf("Heap string is: %s\n", heap_string);
    printf("x is: %d\n", x);
}
```

This program uses the extremely unsafe function `gets` which you should never use, but that’s on purpose – we learn more when things go wrong.

### step 0: compile the program.

We can compile it with `gcc -g -O0 test.c -o test`.

The `-g` flag compiles the program with debugging symbols, which is going to make it a lot easier to look at our variables.

`-O0` tells gcc to turn off optimizations which I did just to make sure our `x` variable didn’t get optimized out.

### step 1: start gdb

We can start gdb like this:

```
$ gdb ./test
```

It prints out some stuff about the GPL and then gives a prompt. Let’s create a breakpoint on the `main` function.

```
(gdb) b main
```

Then we can run the program:

```
(gdb) b main
Starting program: /home/bork/work/homepage/test
Breakpoint 1, 0x000055555555516d in main ()

(gdb) run
Starting program: /home/bork/work/homepage/test

Breakpoint 1, main () at test.c:4
4   int main() {
```

Okay, great! The program is running and we can start looking at the stack

### step 2: look at our variables’ addresses

Let’s start out by learning about our variables. Each of them has an address in memory, which we can print out like this:

```
(gdb) p &x
$3 = (int *) 0x7fffffffe27c
(gdb) p &heap_string
$2 = (char **) 0x7fffffffe280
(gdb) p &stack_string
$4 = (char (*)[10]) 0x7fffffffe28e
```

So if we look at the stack at those addresses, we should be able to see all of these variables!

### concept: the stack pointer

We’re going to need to use the stack pointer so I’ll try to explain it really quickly.

There’s an x86 register called ESP called the “stack pointer”. Basically it’s the address of the start of the stack for the current function. In gdb you can access it with `$sp`. When you call a new function or return from a function, the value of the stack pointer changes.

### step 3: look at our variables on the stack at the beginning of `main`

First, let’s look at the stack at the start of the `main` function. Here’s the value of our stack pointer right now:

```
(gdb) p $sp
$7 = (void *) 0x7fffffffe270
```

So the stack for our current function starts at `0x7fffffffe270`. Cool.

Now let’s use gdb to print out the first 40 words (aka 160 bytes) of memory after the start of the current function’s stack. It’s possible that some of this memory isn’t part of the stack because I’m not totally sure how big the stack is here. But at least the beginning of this is part of the stack.

```
(gdb) x/40x $sp
0x7fffffffe270: 0x00000000  0x00000000  0x55555250  0x00005555
0x7fffffffe280: 0x00000000  0x00000000  0x55555070  0x00005555
0x7fffffffe290: 0xffffe390  0x00007fff  0x00000000  0x00000000
0x7fffffffe2a0: 0x00000000  0x00000000  0xf7df4b25  0x00007fff
0x7fffffffe2b0: 0xffffe398  0x00007fff  0xf7fca000  0x00000001
0x7fffffffe2c0: 0x55555169  0x00005555  0xffffe6f9  0x00007fff
0x7fffffffe2d0: 0x55555250  0x00005555  0x3cae816d  0x8acc2837
0x7fffffffe2e0: 0x55555070  0x00005555  0x00000000  0x00000000
0x7fffffffe2f0: 0x00000000  0x00000000  0x00000000  0x00000000
0x7fffffffe300: 0xf9ce816d  0x7533d7c8  0xa91a816d  0x7533c789
```

I’ve bolded approximately where the `stack_string`, `heap_string`, and `x` variables are and colour coded them:

  * `x` is red and starts at `0x7fffffffe27c`
  * `heap_string` is blue and starts at `0x7fffffffe280`
  * `stack_string` is purple and starts at `0x7fffffffe28e`



I think I might have bolded the location of some of those variables a bit wrong here but that’s approximately where they are.

One weird thing you might notice here is that `x` is the number `0x5555`, but we set `x` to 10! That because `x` doesn’t actually get set until after our `main` function starts, and we’re at the very beginning of `main`.

### step 3: look at the stack again on line 10

Let’s skip a few lines and wait for our variables to actually get set to the values we initialized them to. By the time we get to line 10, `x` should be set to 10.

First, we need to set another breakpoint:

```
(gdb) b test.c:10
Breakpoint 2 at 0x5555555551a9: file test.c, line 11.
```

and continue the program running:

```
(gdb) continue
Continuing.

Breakpoint 2, main () at test.c:11
11      printf("Enter a string for the stack: ");
```

Okay! Let’s look at all the same things again! `gdb` is formatting the bytes in a slightly different way here and I don’t actually know why. Here’s a reminder of where to find our variables on the stack:

  * `x` is red and starts at `0x7fffffffe27c`
  * `heap_string` is blue and starts at `0x7fffffffe280`
  * `stack_string` is purple and starts at `0x7fffffffe28e`



```
(gdb) x/80x $sp
0x7fffffffe270:  0x00  0x00  0x00  0x00  0x00  0x00  0x00  0x00
0x7fffffffe278:  0x50  0x52  0x55  0x55  0x0a  0x00  0x00  0x00
0x7fffffffe280:  0xa0  0x92  0x55  0x55  0x55  0x55  0x00  0x00
0x7fffffffe288:  0x70  0x50  0x55  0x55  0x55  0x55  0x73  0x74
0x7fffffffe290:  0x61  0x63  0x6b  0x00  0x00  0x00  0x00  0x00
0x7fffffffe298:  0x00  0x80  0xf7  0x8a  0x8a  0xbb  0x58  0xb6
0x7fffffffe2a0:  0x00  0x00  0x00  0x00  0x00  0x00  0x00  0x00
0x7fffffffe2a8:  0x25  0x4b  0xdf  0xf7  0xff  0x7f  0x00  0x00
0x7fffffffe2b0:  0x98  0xe3  0xff  0xff  0xff  0x7f  0x00  0x00
0x7fffffffe2b8:  0x00  0xa0  0xfc  0xf7  0x01  0x00  0x00  0x00
```

There are a couple of interesting things to discuss here before we go further in the program.

### how `stack_string` is represented in memory

Right now (on line 10) `stack_string` is set to “stack”. Let’s take a look at how that’s represented in memory.

We can print out the bytes in the string like this:

```
(gdb) x/10x stack_string
0x7fffffffe28e: 0x73    0x74    0x61    0x63    0x6b    0x00    0x00    0x00
0x7fffffffe296: 0x00    0x00
```

The string “stack” is 5 characters which corresponds to 5 ASCII bytes – `0x73`, `0x74`, `0x61`, `0x63`, and `0x6b`. `0x73` is `s` in ASCII, `0x74` is `t`, etc.

We can also get gdb to show us the string with `x/1s`:

```
(gdb) x/1s stack_string
0x7fffffffe28e: "stack"
```

### how `heap_string` and `stack_string` are different

You’ll notice that `stack_string` and `heap_string` are represented in very different ways on the stack:

  * `stack_string` has the contents of the string (“stack”)
  * `heap_string` is a pointer to an address somewhere else in memory



Here are the bytes on the stack for the `heap_string` variable:

```
0xa0  0x92  0x55  0x55  0x55  0x55  0x00  0x00
```

These bytes actually get read backwards because x86 is little-endian, so the memory address of `heap_string` is `0x5555555592a0`

Another way to see the address of `heap_string` in gdb is just to print it out with `p`:

```
(gdb) p heap_string
$6 = 0x5555555592a0 ""
```

### the bytes that represent the integer `x`

`x` is a 32-bit integer, and the bytes that represent it are `0x0a 0x00 0x00 0x00`.

We need to read these bytes backwards again (the same way reason we read the bytes for `heap_string` address backwards), so this corresponds to the number `0x000000000a`, or `0xa`, which is 10.

That makes sense! We set `int x = 10;`!

### step 4: read input from standard input

Okay, we’ve initialized the variables, now let’s see how the stack changes when this part of the C program runs:

```
printf("Enter a string for the stack: ");
gets(stack_string);
printf("Enter a string for the heap: ");
gets(heap_string);
```

We need to set another breakpoint:

```
(gdb) b test.c:16
Breakpoint 3 at 0x555555555205: file test.c, line 16.
```

and continue running the program

```
(gdb) continue
Continuing.
```

We’re prompted for 2 strings, and I entered `123456789012` for the stack string and `bananas` for the heap.

### let’s look at `stack_string` first (there’s a buffer overflow!)

```
(gdb) x/1s stack_string
0x7fffffffe28e: "123456789012"
```

That seems pretty normal, right? We entered `123456789012` and now it’s set to `123456789012`.

But there’s something weird about this. Here’s what those bytes look like on the stack. They’re highlighted in purple again.

```
0x7fffffffe270:  0x00  0x00  0x00  0x00  0x00  0x00  0x00  0x00
0x7fffffffe278:  0x50  0x52  0x55  0x55  0x0a  0x00  0x00  0x00
0x7fffffffe280:  0xa0  0x92  0x55  0x55  0x55  0x55  0x00  0x00
0x7fffffffe288:  0x70  0x50  0x55  0x55  0x55  0x55  0x31  0x32
0x7fffffffe290:  0x33  0x34  0x35  0x36  0x37  0x38  0x39  0x30
0x7fffffffe298:  0x31  0x32  0x00  0x8a  0x8a  0xbb  0x58  0xb6
0x7fffffffe2a0:  0x00  0x00  0x00  0x00  0x00  0x00  0x00  0x00
0x7fffffffe2a8:  0x25  0x4b  0xdf  0xf7  0xff  0x7f  0x00  0x00
0x7fffffffe2b0:  0x98  0xe3  0xff  0xff  0xff  0x7f  0x00  0x00
0x7fffffffe2b8:  0x00  0xa0  0xfc  0xf7  0x01  0x00  0x00  0x00
```

The weird thing about this is that **stack_string was only supposed to be 10 bytes**. But now suddenly we’ve put 13 bytes in it? What’s happening?

This is a classic buffer overflow, and what’s happening is that `stack_string` wrote over other data from the program. This hasn’t caused a problem yet in our case, but it can crash your program or, worse, open you up to Very Bad Security Problems.

For example, if `stack_string` were before `heap_string` in memory, then we could overwrite the address that `heap_string` points to. I’m not sure exactly what’s in memory after `stack_string` here but we could probably use this to do some kind of shenanigans.

### something actually detects the buffer overflow

When I cause this buffer overflow problem, here’s

```
 ./test
Enter a string for the stack: 01234567891324143
Enter a string for the heap: adsf
Stack string is: 01234567891324143
Heap string is: adsf
x is: 10
*** stack smashing detected ***: terminated
fish: Job 1, './test' terminated by signal SIGABRT (Abort)
```

My guess about what’s happening here is that the `stack_string` variable is actually at the end of this function’s stack, and so the extra bytes are going into a different region of memory.

When you do this intentionally as a security exploit it’s called “stack smashing”, and somehow something is detecting that this is happening. I’m not totally sure how this is being detected.

I also thing this is interesting because the program gets killed, but it doesn’t get killed immediately when the buffer overflow happens – a few more lines of code run after the buffer overflow and the program gets killed later. Weird!

That’s all I have to say about buffer overflows.

### now let’s look at `heap_string`

We also read a value (`bananas`) into the `heap_string` variable. Let’s see what that looks like in memory.

Here’s what `heap_string` looks on the stack after we read the variable in.

```
(gdb) x/40x $sp
0x7fffffffe270:  0x00  0x00  0x00  0x00  0x00  0x00  0x00  0x00
0x7fffffffe278:  0x50  0x52  0x55  0x55  0x0a  0x00  0x00  0x00
0x7fffffffe280:  0xa0  0x92  0x55  0x55  0x55  0x55  0x00  0x00
0x7fffffffe288:  0x70  0x50  0x55  0x55  0x55  0x55  0x31  0x32
0x7fffffffe290:  0x33  0x34  0x35  0x36  0x37  0x38  0x39  0x30
```

The thing to notice here is that it looks exactly the same! It’s an address, and the address hasn’t changed. But let’s look at what’s at that address.

```
(gdb) x/10x 0x5555555592a0
0x5555555592a0: 0x62    0x61    0x6e    0x61    0x6e    0x61    0x73    0x00
0x5555555592a8: 0x00    0x00
```

Those are the bytes for `bananas`! Those bytes aren’t in the stack at all, they’re somewhere else in memory (on the heap)

### where are the stack and the heap?

We’ve talked about how the stack and the heap are different regions of memory, but how can you tell where they are in memory?

There’s a file for each process called `/proc/$PID/maps` that shows you the memory maps for each process. Here’s where you can see the stack and the heap in there.

```
$ cat /proc/24963/maps
... lots of stuff omitted ...
555555559000-55555557a000 rw-p 00000000 00:00 0                          [heap]
... lots of stuff omitted ...
7ffffffde000-7ffffffff000 rw-p 00000000 00:00 0                          [stack]
```

One thing to notice is that here the heap addresses start with `0x5555` and the stack addresses start with `0x7fffff`. So it’s pretty easy to tell the difference between an address on the stack and an address on the heap.

### playing about with gdb like this is really helpful

This was kind of a whirlwind tour and I didn’t explain everything, but hopefully seeing what the data actually looks like in memory makes it a little more clear what the stack actually is.

I really recommend playing around with gdb like this – even if you don’t understand every single thing that you see in memory, I find that actually seeing the data in my program’s memory like this makes these abstract concepts like “the stack” and “the heap” and “pointers” a lot easier to understand.

### ideas for more exercises

A few ideas (in no particular order) for followup exercises to think about the stack:

  * try adding another function to `test.c` and make a breakpoint at the beginning of that function and see if you can find the stack from `main`! They say that “the stack grows down” when you call a function, can you see that happening in gdb?
  * return a pointer from a function to a string on the stack and see what goes wrong. Why is it bad to return a pointer to a string on the stack?
  * try causing a stack overflow in C and try to understand exactly what happens when the stack overflows by looking at it in gdb!
  * look at the stack in a Rust program and try to find the variables!
  * try some of the buffer overflow challenges in the [nightmare course][1]. The README for each challenge is the solution so avoid reading it if you don’t want to be spoiled. The idea with all of those challenges is that you’re given a binary and you need to figure out how to cause a buffer overflow to get it to print out the “flag” string.



--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2021/05/17/how-to-look-at-the-stack-in-gdb/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://github.com/guyinatuxedo/nightmare

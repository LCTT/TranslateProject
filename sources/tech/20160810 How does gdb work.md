translating by ucasFL

How does gdb work?
============================================================

Hello! Today I was working a bit on my [ruby stacktrace project][1] and I realized that now I know a couple of things about how gdb works internally.

Lately I’ve been using gdb to look at Ruby programs, so we’re going to be running gdb on a Ruby program. This really means the Ruby interpreter. First, we’re going to print out the address of a global variable: `ruby_current_thread`:

### getting a global variable

Here’s how to get the address of the global `ruby_current_thread`:

```
$ sudo gdb -p 2983
(gdb) p & ruby_current_thread
$2 = (rb_thread_t **) 0x5598a9a8f7f0 <ruby_current_thread>

```

There are a few places a variable can live: on the heap, the stack, or in your program’s text. Global variables are part of your program! You can think of them as being allocated at compile time, kind of. It turns out we can figure out the address of a global variable pretty easily! Let’s see how `gdb` came up with `0x5598a9a8f7f0`.

We can find the approximate region this variable lives in by looking at a cool file in `/proc` called `/proc/$pid/maps`.

```
$ sudo cat /proc/2983/maps | grep bin/ruby
5598a9605000-5598a9886000 r-xp 00000000 00:32 323508                     /home/bork/.rbenv/versions/2.1.6/bin/ruby
5598a9a86000-5598a9a8b000 r--p 00281000 00:32 323508                     /home/bork/.rbenv/versions/2.1.6/bin/ruby
5598a9a8b000-5598a9a8d000 rw-p 00286000 00:32 323508                     /home/bork/.rbenv/versions/2.1.6/bin/ruby

```

So! There’s this starting address `5598a9605000` That’s  _like_  `0x5598a9a8f7f0`, but different. How different? Well, here’s what I get when I subtract them:

```
(gdb) p/x 0x5598a9a8f7f0 - 0x5598a9605000
$4 = 0x48a7f0

```

“What’s that number?”, you might ask? WELL. Let’s look at the **symbol table**for our program with `nm`.

```
sudo nm /proc/2983/exe | grep ruby_current_thread
000000000048a7f0 b ruby_current_thread

```

What’s that we see? Could it be `0x48a7f0`? Yes it is! So!! If we want to find the address of a global variable in our program, all we need to do is look up the name of the variable in the symbol table, and then add that to the start of the range in `/proc/whatever/maps`, and we’re done!

So now we know how gdb does that. But gdb does so much more!! Let’s skip ahead to…

### dereferencing pointers

```
(gdb) p ruby_current_thread
$1 = (rb_thread_t *) 0x5598ab3235b0

```

The next thing we’re going to do is **dereference** that `ruby_current_thread`pointer. We want to see what’s in that address! To do that, gdb will run a bunch of system calls like this:

```
ptrace(PTRACE_PEEKTEXT, 2983, 0x5598a9a8f7f0, [0x5598ab3235b0]) = 0

```

You remember this address `0x5598a9a8f7f0`? gdb is asking “hey, what’s in that address exactly”? `2983` is the PID of the process we’re running gdb on. It’s using the `ptrace` system call which is how gdb does everything.

Awesome! So we can dereference memory and figure out what bytes are at what memory addresses. Some useful gdb commands to know here are `x/40w variable` and `x/40b variable` which will display 40 words / bytes at a given address, respectively.

### describing structs

The memory at an address looks like this. A bunch of bytes!

```
(gdb) x/40b ruby_current_thread
0x5598ab3235b0:	16	-90	55	-85	-104	85	0	0
0x5598ab3235b8:	32	47	50	-85	-104	85	0	0
0x5598ab3235c0:	16	-64	-55	115	-97	127	0	0
0x5598ab3235c8:	0	0	2	0	0	0	0	0
0x5598ab3235d0:	-96	-83	-39	115	-97	127	0	0

```

That’s useful, but not that useful! If you are a human like me and want to know what it MEANS, you need more. Like this:

```
(gdb) p *(ruby_current_thread)
$8 = {self = 94114195940880, vm = 0x5598ab322f20, stack = 0x7f9f73c9c010,
	stack_size = 131072, cfp = 0x7f9f73d9ada0, safe_level = 0,    raised_flag = 0,
	last_status = 8, state = 0, waiting_fd = -1, passed_block = 0x0,
	passed_bmethod_me = 0x0, passed_ci = 0x0,    top_self = 94114195612680,
	top_wrapper = 0, base_block = 0x0, root_lep = 0x0, root_svar = 8, thread_id =
	140322820187904,

```

GOODNESS. That is a lot more useful. How does gdb know that there are all these cool fields like `stack_size`? Enter DWARF. DWARF is a way to store extra debugging data about your program, so that debuggers like gdb can do their job better! It’s generally stored as part of a binary. If I run `dwarfdump` on my Ruby binary, I get some output like this:

(I’ve redacted it heavily to make it easier to understand)

```
DW_AT_name                  "rb_thread_struct"
DW_AT_byte_size             0x000003e8
DW_TAG_member
  DW_AT_name                  "self"
  DW_AT_type                  <0x00000579>
  DW_AT_data_member_location  DW_OP_plus_uconst 0
DW_TAG_member
  DW_AT_name                  "vm"
  DW_AT_type                  <0x0000270c>
  DW_AT_data_member_location  DW_OP_plus_uconst 8
DW_TAG_member
  DW_AT_name                  "stack"
  DW_AT_type                  <0x000006b3>
  DW_AT_data_member_location  DW_OP_plus_uconst 16
DW_TAG_member
  DW_AT_name                  "stack_size"
  DW_AT_type                  <0x00000031>
  DW_AT_data_member_location  DW_OP_plus_uconst 24
DW_TAG_member
  DW_AT_name                  "cfp"
  DW_AT_type                  <0x00002712>
  DW_AT_data_member_location  DW_OP_plus_uconst 32
DW_TAG_member
  DW_AT_name                  "safe_level"
  DW_AT_type                  <0x00000066>

```

So. The name of the type of `ruby_current_thread` is `rb_thread_struct`. It has size `0x3e8` (or 1000 bytes), and it has a bunch of member items. `stack_size` is one of them, at an offset of 24, and it has type 31\. What’s 31? No worries! We can look that up in the DWARF info too!

```
< 1><0x00000031>    DW_TAG_typedef
                      DW_AT_name                  "size_t"
                      DW_AT_type                  <0x0000003c>
< 1><0x0000003c>    DW_TAG_base_type
                      DW_AT_byte_size             0x00000008
                      DW_AT_encoding              DW_ATE_unsigned
                      DW_AT_name                  "long unsigned int"

```

So! `stack_size` has type `size_t`, which means `long unsigned int`, and is 8 bytes. That means that we can read the stack size!

How that would break down, once we have the DWARF debugging data, is:

1.  Read the region of memory that `ruby_current_thread` is pointing to

2.  Add 24 bytes to get to `stack_size`

3.  Read 8 bytes (in little-endian format, since we’re on x86)

4.  Get the answer!

Which in this case is 131072 or 128 kb.

To me, this makes it a lot more obvious what debugging info is **for** – if we didn’t have all this extra metadata about what all these variables meant, we would have no idea what the bytes at address `0x5598ab3235b0` meant.

This is also why you can install debug info for a program separately from your program – gdb doesn’t care where it gets the extra debug info from.

### DWARF is confusing

I’ve been reading a bunch of DWARF info recently. Right now I’m using libdwarf which hasn’t been the best experience – the API is confusing, you initialize everything in a weird way, and it’s really slow (it takes 0.3 seconds to read all the debugging data out of my Ruby program which seems ridiculous). I’ve been told that libdw from elfutils is better.

Also, I casually remarked that you can look at `DW_AT_data_member_location` to get the offset of a struct member! But I looked up on Stack Overflow how to actually do that and I got [this answer][2]. Basically you start with a check like:

```
dwarf_whatform(attrs[i], &form, &error);
    if (form == DW_FORM_data1 || form == DW_FORM_data2
        form == DW_FORM_data2 || form == DW_FORM_data4
        form == DW_FORM_data8 || form == DW_FORM_udata) {

```

and then it keeps GOING. Why are there 8 million different `DW_FORM_data` things I need to check for? What is happening? I have no idea.

Anyway my impression is that DWARF is a large and complicated standard (and possibly the libraries people use to generate DWARF are subtly incompatible?), but it’s what we have, so that’s what we work with!

I think it’s really cool that I can write code that reads DWARF and my code actually mostly works. Except when it crashes. I’m working on that.

### unwinding stacktraces

In an earlier version of this post, I said that gdb unwinds stacktraces using libunwind. It turns out that this isn’t true at all!

Someone who’s worked on gdb a lot emailed me to say that they actually spent a ton of time figuring out how to unwind stacktraces so that they can do a better job than libunwind does. This means that if you get stopped in the middle of a weird program with less debug info than you might hope for that’s done something strange with its stack, gdb will try to figure out where you are anyway. Thanks <3

### other things gdb does

The few things I’ve described here (reading memory, understanding DWARF to show you structs) aren’t everything gdb does – just looking through Brendan Gregg’s [gdb example from yesterday][3], we see that gdb also knows how to

*   disassemble assembly

*   show you the contents of your registers

and in terms of manipulating your program, it can

*   set breakpoints and step through a program

*   modify memory (!! danger !!)

Knowing more about how gdb works makes me feel a lot more confident when using it! I used to get really confused because gdb kind of acts like a C REPL sometimes – you type `ruby_current_thread->cfp->iseq`, and it feels like writing C code! But you’re not really writing C at all, and it was easy for me to run into limitations in gdb and not understand why.

Knowing that it’s using DWARF to figure out the contents of the structs gives me a better mental model and have more correct expectations! Awesome.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2016/08/10/how-does-gdb-work/

作者：[ Julia Evans][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://jvns.ca/
[1]:http://jvns.ca/blog/2016/06/12/a-weird-system-call-process-vm-readv/
[2]:https://stackoverflow.com/questions/25047329/how-to-get-struct-member-offset-from-dwarf-info
[3]:http://www.brendangregg.com/blog/2016-08-09/gdb-example-ncurses.html

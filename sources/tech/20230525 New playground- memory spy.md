[#]: subject: "New playground: memory spy"
[#]: via: "https://jvns.ca/blog/2023/05/25/new-playground--memory-spy/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

New playground: memory spy
======

Hello! Today we’re releasing a new playground called “memory spy”. It lets you run C programs and see how their variables are represented in memory. It’s designed to be accessible to folks who don’t know C – it comes with bunch of extremely simple example C programs that you can poke at. Here’s the link:

>> [Memory Spy][1] <<

This is a companion to the “how integers and floats work” [zine][2] we’ve been working on, so the goal is mostly to look at how number types (integers and floats) are represented.

### why spy on memory?

How computers actually represent variables can seem kind of abstract, so I wanted to make it easy for folks to see how a real computer actually represents variables in memory.

### why is it useful to look at C?

You might be wondering – I don’t write C! Why should I care how C programs represent variables in memory?

In this playground I’m mostly interested in showing people how integers and floats are represented. And low-level languages generally all represent integers and floats in the same way – a 32-bit unsigned int is going to be the same in C, C++, Rust, Go, Swift, etc. The exact name of the type is different, but the representation is the same.

In higher-level languages like Python it’s a little different, but under the hood a `float` in Python contains a C `double`, so the C representation is still pretty relevant.

### you don’t have to know C

It uses C because C is the language where it’s the most straightforward to map between “the code in your program” and “what’s in your computer’s memory”.

But if you’re not comfortable with C, this playground is still for you! We put together a bunch of example programs where you can run them and look at each variable’s value.

None of the example programs use any fancy features of C – a lot of the code is extremely simple, like `char byte = 'a';`. So you should be mostly able to understand what’s going on even if you don’t know C at all.

### how does it work?

Behind the scenes, there’s a server that:

  * compiles the program with `clang`
  * runs the program with the C debugger `lldb` (using a Python lldb script)
  * returns a JSON file with the values of the variable on every line, as an array of bytes



Then the frontend formats the array of bytes so you can look at it. The display logic isn’t very fancy – ultimately it’s a pretty thin wrapper around lldb.

### some limitations

The two main limitations I can think of right now are:

  * there’s no support for loops (it’ll run them, but it’ll only tell you the value of the variable the first time through the loop)
  * it only supports defining one variable per line



There are probably more, it’s a very simple project.

### the inspiration

[Python Tutor][3] by Philip Guo was a huge inspiration. It has a different focus – it also lets you step through programs in a debugger, but it’s more focused on helping the user build a mental model for how variables and control flow work.

### what about security?

In general my approach to running arbitrary untrusted code is 20% sandboxing and 80% making sure that it’s an extremely low value attack target so it’s not worth trying to break in.

Programs are terminated after 1 second of runtime, they run in a container with no network access, and the machine they’re running on has no sensitive data on it and a very small CPU.

### some notes on the tech stack

The backend is in Go, plus a Python script to script the interactions with lldb. (here’s [the source for the lldb script][4] and [the source for the Go server right now][5]). I’m using [bubblewrap][6] to sandbox lldb.

As always the frontend is using Vue. You can see the frontend source with “view source” if you want.

The main fancy thing that happens on the frontend is that I use [tree sitter][7] to figure out which lines of the code have variables defined on them.

### some design notes

As usual these days, I built this project with [Marie Claire LeBlanc Flanagan][8]. I think the design decision I’m the happiest with is how we handled navigating the program you’re running. Instead of using next/previous arrows to step through the code one line at a time, you can just click on a line to view its variables.

This “click on a line” design wouldn’t make sense in a normal debugger context because usually you have loops and a line might be run more than once. But our focus here isn’t on control flow, and none of the example programs have loops.

The other thing I’m happy with is the decision to use regular links like (`<a href="#example=hexadecimal">`) for all the navigation. There’s an `onhashchange` Javascript event that takes care of making sure we update the page to match the new URL.

I think there were more design struggles but I forget what they were right now.

### that’s all!

Here’s the link again:

>> [Memory Spy][1] <<

Let me know on Twitter or Mastodon if you notice any problems.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2023/05/25/new-playground--memory-spy/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://memory-spy.wizardzines.com
[2]: https://wizardzines.com
[3]: https://pythontutor.com/
[4]: https://gist.github.com/jvns/7f1eff7cdda26412cc8df280a1641fd4
[5]: https://gist.github.com/jvns/14b8f65537004a56013260d9219ef36f
[6]: https://jvns.ca/blog/2022/06/28/some-notes-on-bubblewrap/
[7]: https://tree-sitter.github.io/tree-sitter/
[8]: https://marieflanagan.com/

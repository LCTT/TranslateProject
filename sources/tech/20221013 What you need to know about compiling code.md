[#]: subject: "What you need to know about compiling code"
[#]: via: "https://opensource.com/article/22/10/compiling-code"
[#]: author: "Alan Smithee https://opensource.com/users/alansmithee"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

What you need to know about compiling code
======
Use this handy mousetrap analogy to understand compiling code. Then download our new eBook, An open source developer's guide to building applications.

Source code must be compiled in order to run, and in open source software everyone has access to source code. Whether you've written code yourself and you want to compile and run it, or whether you've downloaded somebody's project to try it out, it's useful to know how to process source code through a [compiler][2], and also what exactly a compiler does with all that code.

### Build a better mousetrap

We don't usually think of a mousetrap as a computer, but believe it or not, it does share some similarities with the CPU running the device you're reading this article on. The classic (non-cat) mousetrap has two states: it's either set or released. You might consider that *on* (the kill bar is set and stores potential energy) and *off* (the kill bar has been triggered.) In a sense, a mousetrap is a computer that calculates the presence of a mouse. You might imagine this code, in an imaginary language, describing the process:

```
if mousetrap == 0 then
  There's a mouse!
else
  There's no mouse yet.
end
```

In other words, you can derive mouse data based on the state of a mousetrap. The mousetrap isn't foolproof, of course. There could be a mouse next to the mousetrap, and the mousetrap would still be registered as *on* because the mouse has not yet triggered the trap. So the program could use a few enhancements, but that's pretty typical.

### Switches

A mousetrap is ultimately a switch. You probably use a switch to turn on the lights in your house. A lot of information is stored in these mechanisms. For instance, people often assume that you're at home when the lights are on.

You could program actions based on the activity of lights on in your neighborhood. If all lights are out, then turn down your loud music because people have probably gone to bed.

A CPU uses the same logic, multiplied by several orders of measure, and shrunken to a microscopic level. When a CPU receives an electrical signal at a specific register, then some other register can be tripped, and then another, and so on. If those registers are made to be meaningful, then there's communication happening. Maybe a chip somewhere on the same motherboard becomes active, or an LED lights up, or a pixel on a screen changes color.

**[[ Related read 6 Python interpreters to try in 2022 ]][3]**

What comes around goes around. If you really want to detect a rodent in more places than the one spot you happen to have a mousetrap set, you could program an application to do just that. With a webcam and some rudimentary image recognition software, you could establish a baseline of what an empty kitchen looks like and then scan for changes. When a mouse enters the kitchen, there's a shift in the pixel values where there was previously no mouse. Log the data, or better yet trigger a drone that focuses in on the mouse, captures it, and moves it outside. You've built a better mousetrap through the magic of on and off signals.

### Compilers

A code compiler translates human-readable code into a machine language that speaks directly to the CPU. It's a complex process because CPUs are legitimately complex (even more complex than a mousetrap), but also because the process is more flexible than it strictly "needs" to be. Not all compilers are flexible. There are some compilers that have exactly one target, and they only accept code files in a specific layout, and so the process is relatively straight-forward.

Luckily, modern general-purpose compilers aren't simple. They allow you to write code in a variety of languages, and they let you link libraries in different ways, and they can target several different architectures. The [GNU C Compiler (GCC)][4] has over 50 lines of options in its `--help` output, and the LLVM `clang` compiler has over 1000 lines in its `--help` output. The GCC manual contains over 100,000 words.

You have lots of options when you compile code.

Of course, most people don't need to know all the possible options. There are sections in the GCC man page I've never read, because they're for Objective-C or Fortran or chip architectures I've never even heard of. But I value the ability to compile code for several different architectures, for 64-bit and 32-bit, and to run open source software on computers the rest of the industry has left behind.

### The compilation lifecycle

Just as importantly, there's real power to understanding the different stages of compiling code. Here's the lifecycle of a simple C program:

1. C source with macros (.c) is preprocessed with `cpp` to render an `.i` file.
2. C source code with expanded macros (.i) is translated with `gcc` to render an `.s` file.
3. A text file in Assembly language (.s) is `as`sembled with as into an `.o` file.
4. Binary object code with instructions for the CPU, and with offsets not tied to memory areas relative to other object files and libraries (*.o) is linked with `ld` to produce an executable.
5. The final binary file either has all required objects within it, or it's set to load linked dynamic libraries (*.so files).

And here's a simple demonstration you can try (with some adjustment for library paths):

```
$ cat << EOF >> hello.c
 #include
 int main(void)
 { printf("hello world\n");
   return 0; }
   EOF
$ cpp hello.c > hello.i
$ gcc -S hello.i
$ as -o hello.o hello.s
$ ld -static -o hello \
-L/usr/lib64/gcc/x86_64-slackware-linux/5.5.0/ \
/usr/lib64/crt1.o /usr/lib64/crti.o hello.o \
/usr/lib64/crtn.o  --start-group -lc -lgcc \
-lgcc_eh --end-group
$ ./hello
hello world
```

### Attainable knowledge

Computers have become amazingly powerful, and pleasantly user-friendly. Don't let that fool you into believing either of the two possible extremes: computers aren't as simple as mousetraps and light switches, but they also aren't beyond comprehension. You can learn about compiling code, about how to link, and compile for a different architecture. Once you know that, you can debug your code better. You can understand the code you download. You may even fix a bug or two. Or, in theory, you could build a better mousetrap. Or a CPU out of mousetraps. It's up to you.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/10/compiling-code

作者：[Alan Smithee][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alansmithee
[b]: https://github.com/lkxed
[2]: https://opensource.com/article/19/5/primer-assemblers-compilers-interpreters
[3]: https://opensource.com/article/22/9/python-interpreters-2022
[4]: https://opensource.com/article/22/5/gnu-c-compiler

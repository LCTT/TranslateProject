dongdongmian 翻译中

Uncommon but useful GCC command line options
============================================================

### On this page

1.  [See intermediate output during each compilation stage][1]
2.  [Make your code debugging and profiling ready][2]
3.  [Conclusion][3]

Software tools usually offer multiple features, but - as most of you will agree - not all their features are used by everyone. Generally speaking, there's nothing wrong in that, as each user has their own requirement and they use the tools within that sphere only. However, it's always good to keep exploring the tools you use as you never know when one of their features might come in handy, saving you some of your precious time in the process.

Case in point: compilers. A good programming language compiler always offers plethora of options, but users generally know and use a limited set only. Specifically, if you are C language developer and use Linux as your development platform, it's highly likely that you'd using the gcc compiler, which offers an endless list of command line options.

Do you know that if you want, you can ask gcc to save the output at each stage of the compilation process? Do you know the -Wall option that you use for generating warnings doesn't cover some specific warnings? There are many command line gcc options that are not commonly used, but can be extremely useful in certain scenarios, for example, while debugging the code.

So, in this article, we will cover a couple of such options, offering all the required details, and explaining them through easy to understand examples wherever necessary.

But before we move ahead, please keep in mind that all the examples, command, and instructions mentioned in this tutorial have been tested on Ubuntu 16.04 LTS, and the gcc version that we've used is 5.4.0.

### See intermediate output during each compilation stage

Do you know there are, broadly, a total of four stages that your C code goes through when you compile it using the gcc compiler? These are preprocessing, compilation, assembly, and linking. After each stage, gcc produces a temporary output file which is handed over to the next stage. Now, these are all temporary files that are produced, and hence we don't get to see them - all we see is that we've issued the compilation command and it produces the binary/executable that we can run.

But suppose, if while debugging, there's a requirement to see how the code looked after, say, the preprocessing stage. Then, what would you do? Well, the good thing is that the gcc compiler offers a command line option that you can use in your standard compilation command and you'll get those intermediate files that are deleted by the compiler otherwise. The option we're talking about is -save-temps.

Here's what the [gcc man page][4] says about this option:

```
           Store the usual "temporary" intermediate files permanently; place
           them in the current directory and name them based on the source
           file.  Thus, compiling foo.c with -c -save-temps produces files
           foo.i and foo.s, as well as foo.o.  This creates a preprocessed
           foo.i output file even though the compiler now normally uses an
           integrated preprocessor.

           When used in combination with the -x command-line option,
           -save-temps is sensible enough to avoid over writing an input
           source file with the same extension as an intermediate file.  The
           corresponding intermediate file may be obtained by renaming the
           source file before using -save-temps.
```

Following is an example command that'll give you an idea on how you can use this option:

gcc -Wall **-save-temps** test.c -o test-exec

And this is how I verified that all the intermediate files were indeed produced after the above mentioned command was executed:

[
 ![](https://www.howtoforge.com/images/uncommon-but-useful-gcc-command-line-options/gcc-save-temps.png) 
][5]

So as you can see in the screenshot above, the test.i, test.s, and test.o files were produced by the -save-temps option. These files correspond to the preprocessing, compiling, and linking stages, respectively.

### Make your code debugging and profiling ready

There are dedicated tools that let you debug and profile your source code. For example, [gdb][6] is used for debugging purposes, while [gprof][7] is a popular tool for profiling purposes. But do you know there are specific command line options that gcc offers in order to make your code debugging as well profiling ready?

Let us start with debugging. To be able to use gdb for code debugging, you'll have to compile your code using the -g command line option provided the gcc compiler. This option basically allows gcc to produce debugging information that's required by gdb to successfully debug your program.

In case you plan to use this option, you are advised to go through the details the [gcc man page][8] offers on this option - some of that can prove to be vital in some cases. For example, following is an excerpt taken from the man page:

```
           GCC allows you to use -g with -O.  The shortcuts taken by optimized
           code may occasionally produce surprising results: some variables
           you declared may not exist at all; flow of control may briefly move
           where you did not expect it; some statements may not be executed
           because they compute constant results or their values are already
           at hand; some statements may execute in different places because
           they have been moved out of loops.

           Nevertheless it proves possible to debug optimized output.  This
           makes it reasonable to use the optimizer for programs that might
           have bugs.
```

Not only gdb, compiling your code using the -g option also opens up the possibility of using Valgrind's memcheck tool to its complete potential. For those who aren't aware, memcheck is used by programmers to check for memory leaks (if any) in their code. You can learn more about this tool [here][9].

Moving on, to be able to use gprof for code profiling, you have to compile your code using the -pg command line option. It allows gcc to generate extra code to write profiling information, which is required by gprof for code analysis. "You must use this option when compiling the source files you want data about, and you must also use it when linking," the [gcc man page][10] says. To learn more about how to perform code profiling using gprof, head to this [dedicated tutorial][11] on our website.

**Note**: Usage of both -g and -pg options is similar to the way the -save-temps option was used in the previous section.

### Conclusion

Unless you are a gcc pro, I am sure you learned something new with this article. Do give these options a try, and see how they work. Meanwhile, wait for the [next part][12] in this tutorial series where-in we'll discuss more such interesting and useful gcc command line options.

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/uncommon-but-useful-gcc-command-line-options/

作者：[ Ansh][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://twitter.com/howtoforgecom
[1]:https://www.howtoforge.com/tutorial/uncommon-but-useful-gcc-command-line-options/#see-intermediate-output-during-each-compilation-stage
[2]:https://www.howtoforge.com/tutorial/uncommon-but-useful-gcc-command-line-options/#make-your-code-debugging-and-profiling-ready
[3]:https://www.howtoforge.com/tutorial/uncommon-but-useful-gcc-command-line-options/#conclusion
[4]:https://linux.die.net/man/1/gcc
[5]:https://www.howtoforge.com/images/uncommon-but-useful-gcc-command-line-options/big/gcc-save-temps.png
[6]:https://www.gnu.org/software/gdb/
[7]:https://sourceware.org/binutils/docs/gprof/
[8]:https://linux.die.net/man/1/gcc
[9]:http://valgrind.org/docs/manual/mc-manual.html
[10]:https://linux.die.net/man/1/gcc
[11]:https://www.howtoforge.com/tutorial/how-to-install-and-use-profiling-tool-gprof/
[12]:https://www.howtoforge.com/tutorial/uncommon-but-useful-gcc-command-line-options-2/

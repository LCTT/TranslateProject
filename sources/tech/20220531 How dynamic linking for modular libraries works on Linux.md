[#]: subject: "How dynamic linking for modular libraries works on Linux"
[#]: via: "https://opensource.com/article/22/5/dynamic-linking-modular-libraries-linux"
[#]: author: "Jayashree Huttanagoudar https://opensource.com/users/jayashree-huttanagoudar"
[#]: collector: "lkxed"
[#]: translator: "robsean"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How dynamic linking for modular libraries works on Linux
======
Learn how to combine multiple C object files into single executable with dynamic libraries.

![Links][1]

Image by: Paul Lewin. Modified by Opensource.com. CC BY-SA 2.0

When you write an application using the C programming language, your code usually has multiple source files.

Ultimately, these files must be compiled into a single executable. You can do this by creating either static or dynamic libraries (the latter are also referred to as shared libraries). These two types of libraries vary in how they are created and linked. Both have advantages and disadvantages, depending on your use case.

Dynamic linking is the most common method, especially on Linux systems. Dynamic linking keeps libraries modular, so just one library can be shared between any number of applications. Modularity also allows a shared library to be updated independently of the applications that rely upon it.

In this article, I demonstrate how dynamic linking works. In a future article, I'll demonstrate static linking.

### Linker

A linker is a command that combines several pieces of a program together and reorganizes the memory allocation for them.

The functions of a linker include:

* Integrating all the pieces of a program
* Figuring out a new memory organization so that all the pieces fit together
* Reviving addresses so that the program can run under the new memory organization
* Resolving symbolic references

As a result of all these linker functionalities, a runnable program called an executable is created. Before you can create a dynamically linked executable, you need some libraries to link *to* and an application to compile. Get your [favorite text editor][2] ready and follow along.

### Create the object files

First, create the header file `mymath.h` with these function signatures:

```
int add(int a, int b);
int sub(int a, int b);
int mult(int a, int b);
int divi(int a, int b);
```

Create `add.c`, `sub.c` , `mult.c` and `divi.c` with these function definitions. I'm placing all of the code in one code block, so divide it up among four files, as indicated in the comments:

```
// add.c
int add(int a, int b){
return (a+b);
}

//sub.c
int sub(int a, int b){
return (a-b);
}

//mult.c
int mult(int a, int b){
return (a*b);
}

//divi.c
int divi(int a, int b){
return (a/b);
}
```

Now generate object files `add.o`, `sub.o`, `mult.o`, and `divi.o` using GCC:

```
$ gcc -c add.c sub.c mult.c divi.c
```

The `-c` option skips the linking step and creates only object files.

### Creating a shared object file

Dynamic libraries are linked during the execution of the final executable. Only the name of the dynamic library is placed in the final executable. The actual linking happens during runtime, when both executable and library are placed in the main memory.

In addition to being sharable, another advantage of a dynamic library is that it reduces the size of the final executable file. Instead of having a redundant copy of the library, an application using a library includes only the name of the library when the final executable is created.

You can create dynamic libraries from your existing sample code:

```
$ gcc -Wall -fPIC -c add.c sub.c mult.c divi.c
```

The option `-fPIC` tells GCC to generate position-independent code (PIC). The `-Wall` option isn't necessary and has nothing to do with how the code is compiling. Still, it's a valuable option because it enables compiler warnings, which can be helpful when troubleshooting.

Using GCC, create the shared library `libmymath.so` :

```
$ gcc -shared -o libmymath.so \
add.o sub.o mult.o divi.o
```

You have now created a simple example math library, `libmymath.so`, which you can use in C code. There are, of course, very complex C libraries out there, and this is the process their developers use to generate the final product that you or I install for use in C code.

Next, you can use your new math library in some custom code, then link it.

### Creating a dynamically linked executable

Suppose you've written a command for mathematics. Create a file called `mathDemo.c` and paste this code into it:

```
#include <mymath.h>
#include <stdio.h>
#include <stdlib.h>

int main()
{
  int x, y;
  printf("Enter two numbers\n");
  scanf("%d%d",&x,&y);
 
  printf("\n%d + %d = %d", x, y, add(x, y));
  printf("\n%d - %d = %d", x, y, sub(x, y));
  printf("\n%d * %d = %d", x, y, mult(x, y));

  if(y==0){
    printf("\nDenominator is zero so can't perform division\n");
      exit(0);
  }else{
      printf("\n%d / %d = %d\n", x, y, divi(x, y));
      return 0;
  }
}
```

Notice that the first line is an `include` statement referencing, by name, your own `libmymath` library. To use a shared library, you must have it installed. If you don't install the library you use, then when your executable runs and searches for the included library, it won't be able to find it. Should you need to compile code without installing a library to a known directory, there are [ways to override default settings][3]. For general use, however, it's expected that libraries exist in known locations, so that's what I'm demonstrating here.

Copy the file `libmymath.so` to a standard system directory, such as `/usr/lib64`, and then run `ldconfig`. The `ldconfig` command creates the required links and cache to the most recent shared libraries found in the standard library directories.

```
$ sudo cp libmymath.so /usr/lib64/
$ sudo ldconfig
```

### Compiling the application

Create an object file called `mathDemo.o` from your application source code (`mathDemo.c` ):

```
$ gcc -I . -c mathDemo.c
```

The `-I` option tells GCC to search for header files (`mymath.h` in this case) in the directory listed after it. In this case, you're specifying the current directory, represented by a single dot (`.` ). Create an executable, referring to your shared math library by name using the `-l` option:

```
$ gcc -o mathDynamic mathDemo.o -lmymath
```

GCC finds `libmymath.so` because it exists in a default system library directory. Use `ldd` to verify the shared libraries used:

```
$ ldd mathDemo
    linux-vdso.so.1 (0x00007fffe6a30000)
    libmymath.so => /usr/lib64/libmymath.so (0x00007fe4d4d33000)
    libc.so.6 => /lib64/libc.so.6 (0x00007fe4d4b29000)
    /lib64/ld-linux-x86-64.so.2 (0x00007fe4d4d4e000)
```

Take a look at the size of the `mathDemo` executable:

```
$ du ./mathDynamic
24   ./mathDynamic
```

It's a small application, of course, and the amount of disk space it occupies reflects that. For comparison, a statically linked version of the same code (as you'll see in my next article) is 932K!

```
$ ./mathDynamic
Enter two numbers
25
5

25 + 5 = 30
25 - 5 = 20
25 * 5 = 125
25 / 5 = 5
```

You can verify that it's dynamically linked with the `file` command:

```
$ file ./mathDynamic
./mathDynamic: ELF 64-bit LSB executable, x86-64,
dynamically linked,
interpreter /lib64/ld-linux-x86-64.so.2,
with debug_info, not stripped
```

Success!

### Dynamically linking

A shared library leads to a lightweight executable, as the linking happens during runtime. Because it resolves references during runtime, it does take more time for execution. However, since the vast majority of commands on everyday Linux systems are dynamically linked and on modern hardware, the time saved is negligible. Its inherent modularity is a powerful feature for developers and users alike.

In this article, I described how to create dynamic libraries and link them into a final executable. I'll use the same source code to create a statically linked executable in my next article.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/5/dynamic-linking-modular-libraries-linux

作者：[Jayashree Huttanagoudar][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jayashree-huttanagoudar
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/links.png
[2]: https://opensource.com/article/21/2/open-source-text-editors
[3]: https://opensource.com/article/22/5/compile-code-ldlibrarypath

[#]: subject: "How static linking works on Linux"
[#]: via: "https://opensource.com/article/22/6/static-linking-linux"
[#]: author: "Jayashree Huttanagoudar https://opensource.com/users/jayashree-huttanagoudar"
[#]: collector: "lkxed"
[#]: translator: "robsean"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How static linking works on Linux
======
Learn how to combine multiple C object files into a single executable with static libraries.

![Woman using laptop concentrating][1]

Image by Mapbox Uncharted ERG, [CC-BY 3.0 US][2]

Code for applications written using C usually has multiple source files, but ultimately you will need to compile them into a single executable.

You can do this in two ways: by creating a static library or a dynamic library (also called a shared library). These two types of libraries vary in terms of how they are created and linked. Your choice of which to use depends on your use case.

In a [previous article][3], I demonstrated how to create a dynamically linked executable, which is the more commonly used method. In this article, I explain how to create a statically linked executable.

### Using a linker with static libraries

A linker is a command that combines several pieces of a program together and reorganizes the memory allocation for them.

The functions of a linker include:

* Integrating all the pieces of a program
* Figuring out a new memory organization so that all the pieces fit together
* Reviving addresses so that the program can run under the new memory organization
* Resolving symbolic references

As a result of all these linker functionalities, a runnable program called an executable is created.

Static libraries are created by copying all necessary library modules used in a program into the final executable image. The linker links static libraries as a last step in the compilation process. An executable is created by resolving external references, combining the library routines with program code.

### Create the object files

Here's an example of a static library, along with the linking process. First, create the header file `mymath.h` with these function signatures:

```
int add(int a, int b);
int sub(int a, int b);
int mult(int a, int b);
int divi(int a, int b);
```

Create `add.c`, `sub.c` , `mult.c` and `divi.c` with these function definitions:

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

Create a static library called `libmymath.a`, then remove the object files, as they're no longer required. (Note that using a `trash` [command][4] is safer than `rm`.)

```
$ ar rs libmymath.a add.o sub.o mult.o divi.o
$ trash *.o
$ ls
add.c  divi.c  libmymath.a  mult.c  mymath.h  sub.c
```

You have now created a simple example math library called `libmymath`, which you can use in C code. There are, of course, very complex C libraries out there, and this is the process their developers use to generate the final product that you and I install for use in C code.

Next, use your math library in some custom code and then link it.

### Create a statically linked application

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

Notice that the first line is an `include` statement referencing, by name, your own `libmymath` library.

Create an object file called `mathDemo.o` for `mathDemo.c` :

```
$ gcc -I . -c mathDemo.c
```

The `-I` option tells GCC to search for header files listed after it. In this case, you're specifying the current directory, represented by a single dot (`.` ).

Link `mathDemo.o` with `libmymath.a` to create the final executable. There are two ways to express this to GCC.

You can point to the files:

```
$ gcc -static -o mathDemo mathDemo.o libmymath.a
```

Alternately, you can specify the library path along with the library name:

```
$ gcc -static -o mathDemo -L . mathDemo.o -lmymath
```

In the latter example, the `-lmymath` option tells the linker to link the object files present in the `libmymath.a` with the object file `mathDemo.o` to create the final executable. The `-L` option directs the linker to look for libraries in the following argument (similar to what you would do with `-I` ).

### Analyzing the result

Confirm that it's statically linked using the `file` command:

```
$ file mathDemo
mathDemo: ELF 64-bit LSB executable, x86-64...
statically linked, with debug_info, not stripped
```

Using the `ldd` command, you can see that the executable is not dynamically linked:

```
$ ldd ./mathDemo
        not a dynamic executable
```

You can also check the size of the `mathDemo` executable:

```
$ du -h ./mathDemo
932K    ./mathDemo
```

In the example from my [previous article][5], the dynamic executable took up just 24K.

Run the command to see it work:

```
$ ./mathDemo
Enter two numbers
10
5

10 + 5 = 15
10 - 5 = 5
10 * 5 = 50
10 / 5 = 2
```

Looks good!

### When to use static linking

Dynamically linked executables are generally preferred over statically linked executables because dynamic linking keeps an application's components modular. Should a library receive a critical security update, it can be easily patched because it exists outside of the applications that use it.

When you use static linking, a library's code gets "hidden" within the executable you create, meaning the only way to patch it is to re-compile and re-release a new executable every time a library gets an update—and you have better things to do with your time, trust me.

However, static linking is a reasonable option if the code of a library exists either in the same code base as the executable using it or in specialized embedded devices that are expected to receive no updates.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/static-linking-linux

作者：[Jayashree Huttanagoudar][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jayashree-huttanagoudar
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png
[2]: https://creativecommons.org/licenses/by/3.0/us/
[3]: https://opensource.com/article/22/5/dynamic-linking-modular-libraries-linux
[4]: https://www.redhat.com/sysadmin/recover-file-deletion-linux
[5]: https://opensource.com/article/22/5/dynamic-linking-modular-libraries-linux

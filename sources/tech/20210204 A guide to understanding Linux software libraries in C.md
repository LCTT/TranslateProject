[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A guide to understanding Linux software libraries in C)
[#]: via: (https://opensource.com/article/21/2/linux-software-libraries)
[#]: author: (Marty Kalin https://opensource.com/users/mkalindepauledu)

A guide to understanding Linux software libraries in C
======
Software libraries are an easy and sensible way to reuse code.
![5 pengiuns floating on iceburg][1]

Software libraries are a longstanding, easy, and sensible way to reuse code. This article explains how to build libraries from scratch and make them available to clients. Although the two sample libraries target Linux, the steps for creating, publishing, and using these libraries apply to other Unix-like systems.

The sample libraries are written in C, which is well suited to the task. The Linux kernel is written mostly in C with the rest in assembly language. (The same goes for Windows and Linux cousins such as macOS.) The standard system libraries for input/output, networking, string processing, mathematics, security, data encoding, and so on are likewise written mainly in C. To write a library in C is therefore to write in Linux's native language. Moreover, C sets the mark for performance among high-level languages.

There are also two sample clients (one in C, the other in Python) to access the libraries. It's no surprise that a C client can access a library written in C, but the Python client illustrates that a library written in C can serve clients from other languages.

### Static versus dynamic libraries

Linux systems have two types of libraries:

  * A **static library (aka library archive)** is baked into a statically compiled client (e.g., one in C or Rust) during the compilation process' link phase. In effect, each client gets its own copy of the library. A significant downside of a static library comes to the fore if the library needs to be revised (for example, to fix a bug), as each library client must be relinked to the static library. A dynamic library, described next, avoids this shortcoming.
  * A **dynamic (aka shared) library** is flagged during a statically compiled client program's link phase, but the client program and the library code remain otherwise unconnected until runtime—the library code is not baked into the client. At runtime, the system's dynamic loader connects a shared library with an executing client, regardless of whether the client comes from a statically compiled language, such as C, or a dynamically compiled language, such as Python. As a result, a dynamic library can be updated without inconveniencing clients. Finally, multiple clients can share a single copy of a dynamic library.



In general, dynamic libraries are preferred over static ones, although there is a cost in complexity and performance. Here's how each library type is created and published:

  1. The source code for the library is compiled into one or more object modules, which are binary files that can be included in a library and linked to executable clients.
  2. The object modules are packaged into a single file. For a static library, the standard extension is `.a` for "archive." For a dynamic library, the extension is `.so` for "shared object." The two sample libraries, which have the same functionality, are published as the files `libprimes.a` (static) and `libshprimes.so` (dynamic). The prefix `lib` is used for both types of library.
  3. The library file is copied to a standard directory so that client programs, without fuss, can access the library. A typical location for the library, whether static or dynamic, is `/usr/lib` or `/usr/local/lib`; other locations are possible.



Detailed steps for building and publishing each type of library are coming shortly. First, however, I will introduce the C functions in the two libraries.

### The sample library functions

The two sample libraries are built from the same five C functions, four of which are accessible to client programs. The fifth function, which is a utility for one of the other four, shows how C supports hiding information. The source code for each function is short enough that the functions can be housed in a single source file, although multiple source files (e.g., one per each of the four published functions) is an option.

The library functions are elementary and deal, in various ways, with prime numbers. All of the functions expect unsigned (i.e., non-negative) integer values as arguments:

  * The `is_prime` function tests whether its single argument is a prime.
  * The `are_coprimes` function checks whether its two arguments have a greatest common divisor (gcd) of 1, which defines co-primes.
  * The `prime_factors` function lists the prime factors of its argument.
  * The `goldbach` function expects an even integer value of 4 or more, listing whichever two primes sum to this argument; there may be multiple summing pairs. The function is named after the 18th-century mathematician [Christian Goldbach][2], whose conjecture that every even integer greater than two is the sum of two primes remains one of the oldest unsolved problems in number theory.



The utility function `gcd` resides in the deployed library files, but this function is not accessible outside of its containing file; hence, a library client cannot directly invoke the `gcd` function. A closer look at C functions clarifies the point.

### More on C functions

Every function in C has a storage class, which determines the function's scope. For functions there are two options:

  * The default storage class for functions is `extern`, which gives a function global scope. A client program can call any `extern` function in the sample libraries. Here's the definition for the function `are_coprimes` with an explicit `extern`: [code] extern unsigned are_coprimes(unsigned n1, unsigned n2) {
  ...
} 
```
  * The storage class `static` limits a function's scope to the file in which the function is defined. In the sample libraries, the utility function `gcd` is `static`: [code] static unsigned gcd(unsigned n1, unsigned n2) {
  ...
}
```



Only functions within the `primes.c` file can invoke `gcd`, and only the function `are_coprimes` does so. When the static and dynamic libraries are built and published, other programs can call an `extern` function such as `are_coprimes` but not the `static` function `gcd`. The `static` storage class thus hides the `gcd` function from library clients by limiting the function's scope to the other library functions.

The functions other than `gcd` in the `primes.c` file need not specify a storage class, which would default to `extern`. However, it is common in libraries to make the `extern` explicit.

C distinguishes between function definitions and declarations, which is important for libraries. Let's start with definitions. C has named functions only, and every function is defined with:

  * A unique name. No two functions in a program can have the same name.
  * An argument list, which may be empty. The arguments are typed.
  * Either a return value type (e.g., `int` for a 32-bit signed integer) or `void` if there is no value returned.
  * A body enclosed in curly braces. In a contrived example, the body could be empty.



Every function in a program must be defined exactly once.

Here's the full definition for the library function `are_coprimes`:


```
extern unsigned are_coprimes(unsigned n1, unsigned n2) { /* definition */
  return 1 == gcd(n1, n2); /* greatest common divisor of 1? */
}
```

The function returns a boolean value (either 0 for false or 1 for true), depending on whether the two integer arguments have a greatest common divisor of 1. The utility function `gcd` computes the greatest common divisor of integer arguments `n1` and `n2`.

A function declaration, unlike a definition, does not have a body:


```
`extern unsigned are_coprimes(unsigned n1, unsigned n2); /* declaration */`
```

The declaration ends with a semicolon after the argument list; there are no curly braces enclosing a body. A function may be declared multiple times within a program.

Why are declarations needed at all? In C, a called function must be visible to its caller. There are various ways to provide such visibility, depending on how fussy the compiler is. One sure way is to define the called function above its caller when both reside in the same file:


```
void f() {...}     /* f is defined before being called */
void g() { f(); }  /* ok */
```

The definition of function `f` could be moved below the call from function `g` if `f` were declared above the call:


```
void f();         /* declaration makes f visible to caller */
void g() { f(); } /* ok */
void f() {...}    /* easier to put this above the call from g */
```

But what if the called function resides in a different file than its caller? How are functions defined in one file made visible in another file, given that each function must be defined exactly once in a program?

This issue impacts libraries, whether static or dynamic. For example, the functions in the two primes libraries are defined in the source file `primes.c`, binary copies of which are in each library; but these defined functions must be visible to a library client in C, which is a separate program with its own source file(s).

Providing visibility across files is what function declarations can do. For the "primes" examples, there is a header file named `primes.h` that declares the four functions to be made visible to library clients in C:


```
/** header file primes.h: function declarations **/
extern unsigned is_prime(unsigned);
extern void prime_factors(unsigned);
extern unsigned are_coprimes(unsigned, unsigned);
extern void goldbach(unsigned);
```

These declarations serve as an interface by specifying the invocation syntax for each function.

For client convenience, the text file `primes.h` could be stored in a directory on the C compiler's search path. Typical locations are `/usr/include` and `/usr/local/include`. A C client would `#include` this header file near the top of the client's source code. (A header file is thus imported into the "head" of another source file.) C header files also serve as input to utilities (e.g., Rust's `bindgen`) that enable clients in other languages to access a C library.

In summary, a library function is defined exactly once but declared wherever needed; any library client in C needs the declaration. A header file should contain function declarations—but not function definitions. If a header file did contain definitions, the file might be included multiple times in a C program, thereby breaking the rule that a function must be defined exactly once in a C program.

### The library source code

Below is the source code for two libraries. This code, the header file, and the two sample clients are available on my [website][3].

**The library functions**


```
#include &lt;stdio.h&gt;
#include &lt;math.h&gt;

extern unsigned is_prime(unsigned n) {
  if (n &lt;= 3) return n &gt; 1;                   /* 2 and 3 are prime */
  if (0 == (n % 2) || 0 == (n % 3)) return 0; /* multiples of 2 or 3 aren't */

  /* check that n is not a multiple of other values &lt; n */
  unsigned i;
  for (i = 5; (i * i) &lt;= n; i += 6)
    if (0 == (n % i) || 0 == (n % (i + 2))) return 0; /* not prime */

  return 1; /* a prime other than 2 or 3 */
}

extern void prime_factors(unsigned n) {
  /* list 2s in n's prime factorization */
  while (0 == (n % 2)) {  
    [printf][4]("%i ", 2);
    n /= 2;
  }

  /* 2s are done, the divisor is now odd */
  unsigned i;
  for (i = 3; i &lt;= [sqrt][5](n); i += 2) {
    while (0 == (n % i)) {
      [printf][4]("%i ", i);
      n /= i;
    }
  }

  /* one more prime factor? */
  if (n &gt; 2) [printf][4]("%i", n);
}

/* utility function: greatest common divisor */
static unsigned gcd(unsigned n1, unsigned n2) {
  while (n1 != 0) {
    unsigned n3 = n1;
    n1 = n2 % n1;
    n2 = n3;
  }
  return n2;
}

extern unsigned are_coprimes(unsigned n1, unsigned n2) {
  return 1 == gcd(n1, n2);
}

extern void goldbach(unsigned n) {
  /* input errors */
  if ((n &lt;= 2) || ((n &amp; 0x01) &gt; 0)) {
    [printf][4]("Number must be &gt; 2 and even: %i is not.\n", n);
    return;
  }

  /* two simple cases: 4 and 6 */
  if ((4 == n) || (6 == n)) {
    [printf][4]("%i = %i + %i\n", n, n / 2, n / 2);
    return;
  }
 
  /* for n &gt;= 8: multiple possibilities for many */
  unsigned i;
  for (i = 3; i &lt; (n / 2); i++) {
    if (is_prime(i) &amp;&amp; is_prime(n - i)) {
      [printf][4]("%i = %i + %i\n", n, i, n - i);
      /* if one pair is enough, replace this with break */
    }
  }
}
```

These functions serve as grist for the library mill. The two libraries derive from exactly the same source code, and the header file `primes.h` is the C interface for both libraries.

### Building the libraries

The steps for building and publishing static and dynamic libraries differ in a few details. Only three steps are required for the static library and just two more for the dynamic library. The additional steps in building the dynamic library reflect the added flexibility of the dynamic approach. Let's start with the static library.

The library source file `primes.c` is compiled into an object module. Here's the command, with the percent sign as the system prompt (double sharp signs introduce my comments):


```
`% gcc -c primes.c ## step 1 static`
```

This produces the binary file `primes.o`, the object module. The flag `-c` means compile only.

The next step is to archive the object module(s) by using the Linux `ar` utility:


```
`% ar -cvq libprimes.a primes.o ## step 2 static`
```

The three flags `-cvq` are short for "create," "verbose," and "quick append" (in case new files must be added to an archive). Recall that the prefix `lib` is standard, but the library name is arbitrary. Of course, the file name for a library must be unique to avoid conflicts.

The archive is ready to be published:


```
`% sudo cp libprimes.a /usr/local/lib ## step 3 static`
```

The static library is now accessible to clients, examples of which are forthcoming. (The `sudo` is included to ensure the correct access rights for copying a file into `/usr/local/lib`.)

The dynamic library also requires one or more object modules for packaging:


```
`% gcc primes.c -c -fpic ## step 1 dynamic`
```

The added flag `-fpic` directs the compiler to generate position-independent code, which is a binary module that need not be loaded into a fixed memory location. Such flexibility is critical in a system of multiple dynamic libraries. The resulting object module is slightly larger than the one generated for the static library.

Here's the command to create the single library file from the object module(s):


```
`% gcc -shared -Wl,-soname,libshprimes.so -o libshprimes.so.1 primes.o ## step 2 dynamic`
```

The flag `-shared` indicates that the library is shared (dynamic) rather than static. The `-Wl` flag introduces a list of compiler options, the first of which sets the dynamic library's `soname`, which is required. The `soname` first specifies the library's logical name (`libshprimes.so`) and then, following the `-o` flag, the library's physical file name (`libshprimes.so.1`). The goal to is keep the logical name constant while allowing the physical file name to change with new versions. In this example, the 1 at the end of the physical file name `libshprimes.so.1` represents the first version of the library. The logical and physical file names could be the same, but best practice is to have separate names. A client accesses the library through its logical name (in this case, `libshprimes.so`), as I will clarify shortly.

The next step is to make the shared library easily accessible to clients by copying it to the appropriate directory; for example, `/usr/local/lib again:`


```
`% sudo cp libshprimes.so.1 /usr/local/lib ## step 3 dynamic`
```

A symbolic link is now set up between the shared library's logical name (`libshprimes.so`) and its full physical file name (`/usr/local/lib/libshprimes.so.1`). It's easiest to give the command with `/usr/local/lib` as the working directory:


```
`% sudo ln --symbolic libshprimes.so.1 libshprimes.so ## step 4 dynamic`
```

The logical name `libshprimes.so` should not change, but the target of the symbolic link (`libshrimes.so.1`) can be updated as needed for new library implementations that fix bugs, boost performance, and so on.

The final step (a precautionary one) is to invoke the `ldconfig` utility, which configures the system's dynamic loader. This configuration ensures that the loader will find the newly published library:


```
`% sudo ldconfig ## step 5 dynamic`
```

The dynamic library is now ready for clients, including the two sample ones that follow.

### A C library client

The sample C client is the program tester, whose source code begins with two `#include` directives:


```
#include &lt;stdio.h&gt;  /* standard input/output functions */
#include &lt;primes.h&gt; /* my library functions */
```

The angle brackets around the file names indicate that these header files are to be found on the compiler's search path (in the case of `primes.h`, the directory `/usr/local/include`). Without this `#include`, the compiler would complain about missing declarations for functions such as `is_prime` and `prime_factors`, which are published in both libraries. By the way, the source code for the tester program need not change at all to test each of the two libraries.

By contrast, the source file for the library (`primes.c`) opens with these `#include` directives:


```
#include &lt;stdio.h&gt;
#include &lt;math.h&gt;
```

The header file `math.h` is required because the library function `prime_factors` calls the mathematics function `sqrt` in the standard library `libm.so`.

For reference, here is the source code for the tester program:

**The tester program**


```
#include &lt;stdio.h&gt;
#include &lt;primes.h&gt;

int main() {
  /* is_prime */
  [printf][4]("\nis_prime\n");
  unsigned i, count = 0, n = 1000;
  for (i = 1; i &lt;= n; i++) {
    if (is_prime(i)) {
      count++;
      if (1 == (i % 100)) [printf][4]("Sample prime ending in 1: %i\n", i);
    }
  }
  [printf][4]("%i primes in range of 1 to a thousand.\n", count);

  /* prime_factors */
  [printf][4]("\nprime_factors\n");
  [printf][4]("prime factors of 12: ");
  prime_factors(12);
  [printf][4]("\n");
 
  [printf][4]("prime factors of 13: ");
  prime_factors(13);
  [printf][4]("\n");
 
  [printf][4]("prime factors of 876,512,779: ");
  prime_factors(876512779);
  [printf][4]("\n");

  /* are_coprimes */
  [printf][4]("\nare_coprime\n");
  [printf][4]("Are %i and %i coprime? %s\n",
         21, 22, are_coprimes(21, 22) ? "yes" : "no");
  [printf][4]("Are %i and %i coprime? %s\n",
         21, 24, are_coprimes(21, 24) ? "yes" : "no");

  /* goldbach */
  [printf][4]("\ngoldbach\n");
  goldbach(11);    /* error */
  goldbach(4);     /* small one */
  goldbach(6);     /* another */
  for (i = 100; i &lt;= 150; i += 2) goldbach(i);

  return 0;
}
```

In compiling `tester.c` into an executable, the tricky part is the order of the link flags. Recall that the two sample libraries begin with the prefix `lib`, and each has the usual extension: `.a` for the static library `libprimes.a` and `.so` for the dynamic library `libshprimes.so`. In a links specification, the prefix `lib` and the extension fall away. A link flag begins with `-l` (lowercase L), and a compilation command may contain many link flags. Here is the full compilation command for the tester program, using the dynamic library as the example:


```
`% gcc -o tester tester.c -lshprimes -lm`
```

The first link flag identifies the library `libshprimes.so` and the second link flag identifies the standard mathematics library `libm.so`.

The linker is lazy, which means that the order of the link flags matters. For example, reversing the order of the link specifications generates a compile-time error:


```
`% gcc -o tester tester.c -lm -lshprimes ## danger!`
```

The flag that links to `libm.so` comes first, but no function from this library is invoked explicitly in the tester program; hence, the linker does not link to the `math.so` library. The call to the `sqrt` library function occurs only in the `prime_factors` function that is now contained in the `libshprimes.so` library. The resulting error in compiling the tester program is:


```
`primes.c: undefined reference to 'sqrt'`
```

Accordingly, the order of the link flags should notify the linker that the `sqrt` function is needed:


```
`% gcc -o tester tester.c -lshprimes -lm ## -lshprimes 1st`
```

The linker picks up the call to the library function `sqrt` in the `libshprimes.so` library and, therefore, does the appropriate link to the mathematics library `libm.so`. There is a more complicated option for linking that supports either link-flag order; in this case, however, the easy way is to arrange the link flags appropriately.

Here is some output from a run of the tester client:


```
is_prime
Sample prime ending in 1: 101
Sample prime ending in 1: 401
...
168 primes in range of 1 to a thousand.

prime_factors
prime factors of 12: 2 2 3
prime factors of 13: 13
prime factors of 876,512,779: 211 4154089

are_coprime
Are 21 and 22 coprime? yes
Are 21 and 24 coprime? no

goldbach
Number must be &gt; 2 and even: 11 is not.
4 = 2 + 2
6 = 3 + 3
...
32 =  3 + 29
32 = 13 + 19
...
100 =  3 + 97
100 = 11 + 89
...
```

For the `goldbach` function, even a relatively small even value (e.g., 18) may have multiple pairs of primes that sum to it (in this case, 5+13 and 7+11). Such multiple prime pairs are among the factors that complicate an attempted proof of Goldbach's conjecture.

### Wrapping up with a Python client

Python, unlike C, is not a statically compiled language, which means that the sample Python client must access the dynamic rather than the static version of the primes library. To do so, Python has various modules (standard and third-party) that support a foreign function interface (FFI), which allows a program written in one language to invoke functions written in another. Python `ctypes` is a standard and relatively simple FFI that enables Python code to call C functions.

Any FFI has challenges because the interfacing languages are unlikely to have exactly the same data types. For example, the primes library uses the C type `unsigned int`, which Python does not have; the `ctypes` FFI maps a C `unsigned int` to a Python `int`. Of the four `extern` C functions published in the primes library, two behave better in Python with explicit `ctypes` configuration.

The C functions `prime_factors` and `goldbach` have `void` instead of a return type, but `ctypes` by default replaces the C `void` with the Python `int`. When called from Python code, the two C functions then return a random (hence, meaningless) integer value from the stack. However, `ctypes` can be configured to have the functions return `None` (Python's null type) instead. Here's the configuration for the `prime_factors` function:


```
`primes.prime_factors.restype = None`
```

A similar statement handles the `goldbach` function.

The interactive session below (in Python 3) shows that the interface between a Python client and the primes library is straightforward:


```
&gt;&gt;&gt; from ctypes import cdll

&gt;&gt;&gt; primes = cdll.LoadLibrary("libshprimes.so") ## logical name

&gt;&gt;&gt; primes.is_prime(13)
1
&gt;&gt;&gt; primes.is_prime(12)
0

&gt;&gt;&gt; primes.are_coprimes(8, 24)
0
&gt;&gt;&gt; primes.are_coprimes(8, 25)
1

&gt;&gt;&gt; primes.prime_factors.restype = None
&gt;&gt;&gt; primes.goldbach.restype = None

&gt;&gt;&gt; primes.prime_factors(72)
2 2 2 3 3

&gt;&gt;&gt; primes.goldbach(32)
32 = 3 + 29
32 = 13 + 19
```

The functions in the primes library use only a simple data type, `unsigned int`. If this C library used complicated types such as structures, and if pointers to structures were passed to and returned from library functions, then an FFI more powerful than `ctypes` might be better for a smooth interface between Python and C. Nonetheless, the `ctypes` example shows that a Python client can use a library written in C. Indeed, the popular NumPy library for scientific computing is written in C and then exposed in a high-level Python API.

The simple primes library and the advanced NumPy library underscore that C remains the lingua franca among programming languages. Almost every language can talk to C—and, through C, to any other language that talks to C. Python talks easily to C and, as another example, Java may do the same when [Project Panama][6] becomes an alternative to Java Native Interface (JNI).

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/linux-software-libraries

作者：[Marty Kalin][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mkalindepauledu
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_linux31x_cc.png?itok=Pvim4U-B (5 pengiuns floating on iceburg)
[2]: https://en.wikipedia.org/wiki/Christian_Goldbach
[3]: https://condor.depaul.edu/mkalin
[4]: http://www.opengroup.org/onlinepubs/009695399/functions/printf.html
[5]: http://www.opengroup.org/onlinepubs/009695399/functions/sqrt.html
[6]: https://openjdk.java.net/projects/panama

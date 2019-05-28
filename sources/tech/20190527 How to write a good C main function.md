[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to write a good C main function)
[#]: via: (https://opensource.com/article/19/5/how-write-good-c-main-function)
[#]: author: (Erik O'Shaughnessy https://opensource.com/users/jnyjny)

How to write a good C main function
======
Learn how to structure a C file and write a C main function that handles
command line arguments like a champ.
![Hand drawing out the word "code"][1]

I know, Python and JavaScript are what the kids are writing all their crazy "apps" with these days. But don't be so quick to dismiss C—it's a capable and concise language that has a lot to offer. If you need speed, writing in C could be your answer. If you are looking for job security and the opportunity to learn how to hunt down [null pointer dereferences][2], C could also be your answer! In this article, I'll explain how to structure a C file and write a C main function that handles command line arguments like a champ.

**Me** : a crusty Unix system programmer.
**You** : someone with an editor, a C compiler, and some time to kill.

_Let's do this._

### A boring but correct C program

![Parody O'Reilly book cover, "Hating Other People's Code"][3]

A C program starts with a **main()** function, usually kept in a file named **main.c**.


```
/* main.c */
int main(int argc, char *argv[]) {

}
```

This program _compiles_ but doesn't _do_ anything.


```
$ gcc main.c
$ ./a.out -o foo -vv
$
```

Correct and boring.

### Main functions are unique

The **main()** function is the first function in your program that is executed when it begins executing, but it's not the first function executed. The _first_ function is **_start()** , which is typically provided by the C runtime library, linked in automatically when your program is compiled. The details are highly dependent on the operating system and compiler toolchain, so I'm going to pretend I didn't mention it.

The **main()** function has two arguments that traditionally are called **argc** and **argv** and return a signed integer. Most Unix environments expect programs to return **0** (zero) on success and **-1** (negative one) on failure.

Argument | Name | Description
---|---|---
argc | Argument count | Length of the argument vector
argv | Argument vector | Array of character pointers

The argument vector, **argv** , is a tokenized representation of the command line that invoked your program. In the example above, **argv** would be a list of the following strings:


```
`argv = [ "/path/to/a.out", "-o", "foo", "-vv" ];`
```

The argument vector is guaranteed to always have at least one string in the first index, **argv[0]** , which is the full path to the program executed.

### Anatomy of a main.c file

When I write a **main.c** from scratch, it's usually structured like this:


```
/* main.c */
/* 0 copyright/licensing */
/* 1 includes */
/* 2 defines */
/* 3 external declarations */
/* 4 typedefs */
/* 5 global variable declarations */
/* 6 function prototypes */

int main(int argc, char *argv[]) {
/* 7 command-line parsing */
}

/* 8 function declarations */
```

I'll talk about each of these numbered sections, except for zero, below. If you have to put copyright or licensing text in your source, put it there.

Another thing I won't talk about adding to your program is comments.


```
"Comments lie."
\- A cynical but smart and good looking programmer.
```

Instead of comments, use meaningful function and variable names.

Appealing to the inherent laziness of programmers, once you add comments, you've doubled your maintenance load. If you change or refactor the code, you need to update or expand the comments. Over time, the code mutates away from anything resembling what the comments describe.

If you have to write comments, do not write about _what_ the code is doing. Instead, write about _why_ the code is doing what it's doing. Write comments that you would want to read five years from now when you've forgotten everything about this code. And the fate of the world is depending on you. _No pressure_.

#### 1\. Includes

The first things I add to a **main.c** file are includes to make a multitude of standard C library functions and variables available to my program. The standard C library does lots of things; explore header files in **/usr/include** to find out what it can do for you.

The **#include** string is a [C preprocessor][4] (cpp) directive that causes the inclusion of the referenced file, in its entirety, in the current file. Header files in C are usually named with a **.h** extension and should not contain any executable code; only macros, defines, typedefs, and external variable and function prototypes. The string **< header.h>** tells cpp to look for a file called **header.h** in the system-defined header path, usually **/usr/include**.


```
/* main.c */
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <libgen.h>
#include <errno.h>
#include <string.h>
#include <getopt.h>
#include <sys/types.h>
```

This is the minimum set of global includes that I'll include by default for the following stuff:

#include File | Stuff It Provides
---|---
stdio | Supplies FILE, stdin, stdout, stderr, and the fprint() family of functions
stdlib | Supplies malloc(), calloc(), and realloc()
unistd | Supplies EXIT_FAILURE, EXIT_SUCCESS
libgen | Supplies the basename() function
errno | Defines the external errno variable and all the values it can take on
string | Supplies memcpy(), memset(), and the strlen() family of functions
getopt | Supplies external optarg, opterr, optind, and getopt() function
sys/types | Typedef shortcuts like uint32_t and uint64_t

#### 2\. Defines


```
/* main.c */
<...>

#define OPTSTR "vi⭕f:h"
#define USAGE_FMT "%s [-v] [-f hexflag] [-i inputfile] [-o outputfile] [-h]"
#define ERR_FOPEN_INPUT "fopen(input, r)"
#define ERR_FOPEN_OUTPUT "fopen(output, w)"
#define ERR_DO_THE_NEEDFUL "do_the_needful blew up"
#define DEFAULT_PROGNAME "george"
```

This doesn't make a lot of sense right now, but the **OPTSTR** define is where I will state what command line switches the program will recommend. Consult the [**getopt(3)**][5] man page to learn how **OPTSTR** will affect **getopt()** 's behavior.

The **USAGE_FMT** define is a **printf()** -style format string that is referenced in the **usage()** function.

I also like to gather string constants as **#defines** in this part of the file. Collecting them makes it easier to fix spelling, reuse messages, and internationalize messages, if required.

Finally, use all capital letters when naming a **#define** to distinguish it from variable and function names. You can run the words together if you want or separate words with an underscore; just make sure they're all upper case.

#### 3\. External declarations


```
/* main.c */
<...>

extern int errno;
extern char *optarg;
extern int opterr, optind;
```

An **extern** declaration brings that name into the namespace of the current compilation unit (aka "file") and allows the program to access that variable. Here we've brought in the definitions for three integer variables and a character pointer. The **opt** prefaced variables are used by the **getopt()** function, and **errno** is used as an out-of-band communication channel by the standard C library to communicate why a function might have failed.

#### 4\. Typedefs


```
/* main.c */
<...>

typedef struct {
int verbose;
uint32_t flags;
FILE *input;
FILE *output;
} options_t;
```

After external declarations, I like to declare **typedefs** for structures, unions, and enumerations. Naming a **typedef** is a religion all to itself; I strongly prefer a **_t** suffix to indicate that the name is a type. In this example, I've declared **options_t** as a **struct** with four members. C is a whitespace-neutral programming language, so I use whitespace to line up field names in the same column. I just like the way it looks. For the pointer declarations, I prepend the asterisk to the name to make it clear that it's a pointer.

#### 5\. Global variable declarations


```
/* main.c */
<...>

int dumb_global_variable = -11;
```

Global variables are a bad idea and you should never use them. But if you have to use a global variable, declare them here and be sure to give them a default value. Seriously, _don't use global variables_.

#### 6\. Function prototypes


```
/* main.c */
<...>

void usage(char *progname, int opt);
int do_the_needful(options_t *options);
```

As you write functions, adding them after the **main()** function and not before, include the function prototypes here. Early C compilers used a single-pass strategy, which meant that every symbol (variable or function name) you used in your program had to be declared before you used it. Modern compilers are nearly all multi-pass compilers that build a complete symbol table before generating code, so using function prototypes is not strictly required. However, you sometimes don't get to choose what compiler is used on your code, so write the function prototypes and drive on.

As a matter of course, I always include a **usage()** function that **main()** calls when it doesn't understand something you passed in from the command line.

#### 7\. Command line parsing


```
/* main.c */
<...>

int main(int argc, char *argv[]) {
int opt;
options_t options = { 0, 0x0, stdin, stdout };

opterr = 0;

while ((opt = getopt(argc, argv, OPTSTR)) != EOF)
switch(opt) {
case 'i':
if (!(options.input = [fopen][6](optarg, "r")) ){
[perror][7](ERR_FOPEN_INPUT);
[exit][8](EXIT_FAILURE);
/* NOTREACHED */
}
break;

case 'o':
if (!(options.output = [fopen][6](optarg, "w")) ){
[perror][7](ERR_FOPEN_OUTPUT);
[exit][8](EXIT_FAILURE);
/* NOTREACHED */
}
break;

case 'f':
options.flags = (uint32_t )[strtoul][9](optarg, NULL, 16);
break;

case 'v':
options.verbose += 1;
break;

case 'h':
default:
usage(basename(argv[0]), opt);
/* NOTREACHED */
break;
}

if (do_the_needful(&options) != EXIT_SUCCESS) {
[perror][7](ERR_DO_THE_NEEDFUL);
[exit][8](EXIT_FAILURE);
/* NOTREACHED */
}

return EXIT_SUCCESS;
}
```

OK, that's a lot. The purpose of the **main()** function is to collect the arguments that the user provides, perform minimal input validation, and then pass the collected arguments to functions that will use them. This example declares an **options** variable initialized with default values and parse the command line, updating **options** as necessary.

The guts of this **main()** function is a **while** loop that uses **getopt()** to step through **argv** looking for command line options and their arguments (if any). The **OPTSTR** **#define** earlier in the file is the template that drives **getopt()** 's behavior. The **opt** variable takes on the character value of any command line options found by **getopt()** , and the program's response to the detection of the command line option happens in the **switch** statement.

Those of you paying attention will now be questioning why **opt** is declared as a 32-bit **int** but is expected to take on an 8-bit **char**? It turns out that **getopt()** returns an **int** that takes on a negative value when it gets to the end of **argv** , which I check against **EOF** (the _End of File_ marker). A **char** is a signed quantity, but I like matching variables to their function return values.

When a known command line option is detected, option-specific behavior happens. Some options have an argument, specified in **OPTSTR** with a trailing colon. When an option has an argument, the next string in **argv** is available to the program via the externally defined variable **optarg**. I use **optarg** to open files for reading and writing or converting a command line argument from a string to an integer value.

There are a couple of points for style here:

  * Initialize **opterr** to 0, which disables **getopt** from emiting a **?**.
  * Use **exit(EXIT_FAILURE);** or **exit(EXIT_SUCCESS);** in the middle of **main()**.
  * **/* NOTREACHED */** is a lint directive that I like.
  * Use **return EXIT_SUCCESS;** at the end of functions that return **int**.
  * Explicitly cast implicit type conversions.



The command line signature for this program, if it were compiled, would look something like this:


```
$ ./a.out -h
a.out [-v] [-f hexflag] [-i inputfile] [-o outputfile] [-h]
```

In fact, that's what **usage()** will emit to **stderr** once compiled.

#### 8\. Function declarations


```
/* main.c */
<...>

void usage(char *progname, int opt) {
[fprintf][10](stderr, USAGE_FMT, progname?progname:DEFAULT_PROGNAME);
[exit][8](EXIT_FAILURE);
/* NOTREACHED */
}

int do_the_needful(options_t *options) {

if (!options) {
errno = EINVAL;
return EXIT_FAILURE;
}

if (!options->input || !options->output) {
errno = ENOENT;
return EXIT_FAILURE;
}

/* XXX do needful stuff */

return EXIT_SUCCESS;
}
```

Finally, I write functions that aren't boilerplate. In this example, function **do_the_needful()** accepts a pointer to an **options_t** structure. I validate that the **options** pointer is not **NULL** and then go on to validate the **input** and **output** structure members. **EXIT_FAILURE** returns if either test fails and, by setting the external global variable **errno** to a conventional error code, I signal to the caller a general reason. The convenience function **perror()** can be used by the caller to emit human-readable-ish error messages based on the value of **errno**.

Functions should almost always validate their input in some way. If full validation is expensive, try to do it once and treat the validated data as immutable. The **usage()** function validates the **progname** argument using a conditional assignment in the **fprintf()** call. The **usage()** function is going to exit anyway, so I don't bother setting **errno** or making a big stink about using a correct program name.

The big class of errors I am trying to avoid here is de-referencing a **NULL** pointer. This will cause the operating system to send a special signal to my process called **SYSSEGV** , which results in unavoidable death. The last thing users want to see is a crash due to **SYSSEGV**. It's much better to catch a **NULL** pointer in order to emit better error messages and shut down the program gracefully.

Some people complain about having multiple **return** statements in a function body. They make arguments about "continuity of control flow" and other stuff. Honestly, if something goes wrong in the middle of a function, it's a good time to return an error condition. Writing a ton of nested **if** statements to just have one return is never a "good idea."™

Finally, if you write a function that takes four or more arguments, consider bundling them in a structure and passing a pointer to the structure. This makes the function signatures simpler, making them easier to remember and not screw up when they're called later. It also makes calling the function slightly faster, since fewer things need to be copied into the function's stack frame. In practice, this will only become a consideration if the function is called millions or billions of times. Don't worry about it if that doesn't make sense.

### Wait, you said no comments!?!!

In the **do_the_needful()** function, I wrote a specific type of comment that is designed to be a placeholder rather than documenting the code:


```
`/* XXX do needful stuff */`
```

When you are in the zone, sometimes you don't want to stop and write some particularly gnarly bit of code. You'll come back and do it later, just not now. That's where I'll leave myself a little breadcrumb. I insert a comment with a **XXX** prefix and a short remark describing what needs to be done. Later on, when I have more time, I'll grep through source looking for **XXX**. It doesn't matter what you use, just make sure it's not likely to show up in your codebase in another context, as a function name or variable, for instance.

### Putting it all together

OK, this program _still_ does almost nothing when you compile and run it. But now you have a solid skeleton to build your own command line parsing C programs.


```
/* main.c - the complete listing */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <libgen.h>
#include <errno.h>
#include <string.h>
#include <getopt.h>

#define OPTSTR "vi⭕f:h"
#define USAGE_FMT "%s [-v] [-f hexflag] [-i inputfile] [-o outputfile] [-h]"
#define ERR_FOPEN_INPUT "fopen(input, r)"
#define ERR_FOPEN_OUTPUT "fopen(output, w)"
#define ERR_DO_THE_NEEDFUL "do_the_needful blew up"
#define DEFAULT_PROGNAME "george"

extern int errno;
extern char *optarg;
extern int opterr, optind;

typedef struct {
int verbose;
uint32_t flags;
FILE *input;
FILE *output;
} options_t;

int dumb_global_variable = -11;

void usage(char *progname, int opt);
int do_the_needful(options_t *options);

int main(int argc, char *argv[]) {
int opt;
options_t options = { 0, 0x0, stdin, stdout };

opterr = 0;

while ((opt = getopt(argc, argv, OPTSTR)) != EOF)
switch(opt) {
case 'i':
if (!(options.input = [fopen][6](optarg, "r")) ){
[perror][7](ERR_FOPEN_INPUT);
[exit][8](EXIT_FAILURE);
/* NOTREACHED */
}
break;

case 'o':
if (!(options.output = [fopen][6](optarg, "w")) ){
[perror][7](ERR_FOPEN_OUTPUT);
[exit][8](EXIT_FAILURE);
/* NOTREACHED */
}
break;

case 'f':
options.flags = (uint32_t )[strtoul][9](optarg, NULL, 16);
break;

case 'v':
options.verbose += 1;
break;

case 'h':
default:
usage(basename(argv[0]), opt);
/* NOTREACHED */
break;
}

if (do_the_needful(&options) != EXIT_SUCCESS) {
[perror][7](ERR_DO_THE_NEEDFUL);
[exit][8](EXIT_FAILURE);
/* NOTREACHED */
}

return EXIT_SUCCESS;
}

void usage(char *progname, int opt) {
[fprintf][10](stderr, USAGE_FMT, progname?progname:DEFAULT_PROGNAME);
[exit][8](EXIT_FAILURE);
/* NOTREACHED */
}

int do_the_needful(options_t *options) {

if (!options) {
errno = EINVAL;
return EXIT_FAILURE;
}

if (!options->input || !options->output) {
errno = ENOENT;
return EXIT_FAILURE;
}

/* XXX do needful stuff */

return EXIT_SUCCESS;
}
```

Now you're ready to write C that will be easier to maintain. If you have any questions or feedback, please share them in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/how-write-good-c-main-function

作者：[Erik O'Shaughnessy][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jnyjny
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_hand_draw.png?itok=dpAf--Db (Hand drawing out the word "code")
[2]: https://www.owasp.org/index.php/Null_Dereference
[3]: https://opensource.com/sites/default/files/uploads/hatingotherpeoplescode-big.png (Parody O'Reilly book cover, "Hating Other People's Code")
[4]: https://en.wikipedia.org/wiki/C_preprocessor
[5]: https://linux.die.net/man/3/getopt
[6]: http://www.opengroup.org/onlinepubs/009695399/functions/fopen.html
[7]: http://www.opengroup.org/onlinepubs/009695399/functions/perror.html
[8]: http://www.opengroup.org/onlinepubs/009695399/functions/exit.html
[9]: http://www.opengroup.org/onlinepubs/009695399/functions/strtoul.html
[10]: http://www.opengroup.org/onlinepubs/009695399/functions/fprintf.html

[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (When to choose C or Python for a command-line interface)
[#]: via: (https://opensource.com/article/20/6/c-python-cli)
[#]: author: (Erik O'Shaughnessy https://opensource.com/users/jnyjny)

When to choose C or Python for a command-line interface
======
Take lessons from the history of C and learn how to write useful CLI
programs in Python.
![Searching for code][1]

This article has a simple goal: to help new Python developers with some of the history and terminology around [command-line interfaces][2] (CLIs) and explore how to write these useful programs in Python.

### In the beginning…

First, a [Unix][3] perspective on command-line interface design.

Unix is a computer operating system and the ancestor of Linux and macOS (and many other operating systems as well). Before graphical user interfaces, the user interacted with the computer via a command-line prompt (think of today's [Bash][4] environment). The primary language for developing these programs under Unix is [C][5], which is amazingly [powerful][6]. 

So it behooves us to at least understand the basics of a [C program][7].

Assuming you didn't read that link, the basic architecture of a C program is a function called `main`, and its signature looks like this:


```
   int main(int argc, char **argv)
   {
   ...
   }
```

This shouldn't look too strange to a Python programmer. C functions have a return type first, a function name, and then the typed arguments inside the parenthesis. Last, the body of the function resides between the curly braces. The function name `main` is how the [runtime linker][8] (the program that constructs and runs programs) decides where to start executing your program. If you write a C program and it doesn't include a function named `main`, it will not do anything. Sad.

The function argument variables `argc` and `argv` together describe a list of strings that are typed by the user on the command line when the program is invoked. In the typical terse Unix naming tradition, `argc` means _argument count_ and `argv` means _argument vector_. Vector sounds cooler than list, and `argl` sounds like a strangled cry for help. We are Unix system programmers, and we do not cry for help. We make _other_ people cry for help.

#### Moving on


```
`$ ./myprog foo bar -x baz`
```

If `myprog` is implemented in C, `argc` will have the value 5 and `argv` will be an array of pointers to characters with five entries. (Don't worry if that sounds super-technical; it's a list of five strings.) The first entry in the vector, `argv[0]`, is the name of the program. The rest of `argv` contains the arguments:


```
   argv[0] == "./myprog"
   argv[1] == "foo"
   argv[2] == "bar"
   argv[3] == "-x"
   argv[4] == "baz"
   
   /* Note: not valid C */
```

In C, you have many choices to handle the strings in `argv`. You could loop over the array `argv` _manually_ and interpret each of the strings according to the needs of the program. This is relatively easy, but it leads to programs with wildly different interfaces, as different programmers have different ideas about what is "good."


```
include &lt;stdio.h&gt;

/* A simple C program that prints the contents of argv */

int main(int argc, char **argv) {
    int i;
   
    for(i=0; i&lt;argc; i++)
      [printf][9]("%s\n", argv[i]);
}
```

#### Early attempts to standardize the command line

The next weapon in the command-line arsenal is a [C standard library][10] function called [`getopt`][11]. This function allows the programmer to parse switches, arguments with a dash preceding it, like `-x`, and optionally pair follow-on arguments with their switches. Think about command invocations like "`/bin/ls -alSh", ``getopt` is the function originally used to parse that argument string. Using `getopt` makes parsing the command line pretty easy and improves the user experience (UX).


```
#include &lt;stdio.h&gt;
#include &lt;getopt.h&gt;

#define OPTSTR "b:f:"

extern char *optarg;

int main(int argc, char **argv) {
    int opt;
    char *bar = NULL;
    char *foo = NULL;
   
    while((opt=getopt(argc, argv, OPTSTR)) != EOF)
       switch(opt) {
          case 'b':
              bar = optarg;
              break;
          case 'f':
              foo = optarg;
              break;
          case 'h':
          default':
              fprintf(stderr, "Huh? try again.");
              exit(-1);
              /* NOTREACHED */
       }
    printf("%s\n", foo ? foo : "Empty foo");
    printf("%s\n", bar ? bar : "Empty bar");
}
```

On a personal note, I _wish_ Python had `switch`es, but that will [never][12], ever [happen][13].

#### The GNU generation

The [GNU][14] project came along and introduced longer format arguments for their implementations of traditional Unix command-line tools, things like `--file-format foo`. Of course, we Unix programmers hated that because it was too much to type, but like the dinosaurs we are, we lost because the users _liked_ the longer options. I never wrote any code using the GNU-style option parsing, so no code example here.

GNU-style arguments also accept short names like `-f foo` that have to be supported, too. All of this choice resulted in more workload for the programmer who just wanted to know what the user was asking for and get on with it. But the user got an even more consistent UX: long and short format options and automatically generated help that often kept the user from attempting to read infamously difficult-to-parse [manual][15] pages (see [`ps`][16] for a particularly egregious example).

### But we're talking about Python?

You have now been exposed to enough (too much?) command-line history to have some context about how to approach writing CLIs with our favorite language. Python gives a similar number of choices for command-line parsing; do it yourself, a batteries-included option, and a plethora of third-party options. Which one you choose depends on your particular circumstances and needs.

#### First, do it yourself

You can get your program's arguments from the [`sys`][17] module.


```
import sys

if __name__ == '__main__':
   for value in sys.argv:
       print(value)
```

#### Batteries included

There have been several implementations of argument-parsing modules in the Python standard library; [`getopt`][18], [`optparse`][19], and most recently, [`argparse`][20]. `Argparse` allows the programmer to provide the user with a consistent and helpful UX, but like its GNU antecedents, it takes a lot of work and "[boilerplate code][21]" on the part of the programmer to make it "good."


```
from argparse import ArgumentParser

if __name__ == "__main__":

   argparser = ArgumentParser(description='My Cool Program')
   argparser.add_argument("--foo", "-f", help="A user supplied foo")
   argparser.add_argument("--bar", "-b", help="A user supplied bar")
   
   results = argparser.parse_args()
   print(results.foo, results.bar)
```

The payoff is automatically generated help available when the user invokes `--help`. But what about the advantage of [batteries included][22]? Sometimes the circumstances of your project dictate that you have limited or no access to third-party libraries, and you have to "make do" with the Python standard library.

#### A modern approach to CLIs

And then there was [`Click`][23]. The `Click` framework uses a [decorator][24] approach to building command-line parsing. All of a sudden, it's fun and easy to write a rich command-line interface. Much of the complexity melts away under the cool and futuristic use of decorators, and users marvel at the automatic support for keyword completion as well as contextual help. All while writing less code than previous solutions. Anytime you can write less code and still get things done is a win. And we all want wins.


```
import click

@click.command()
@click.option("-f", "--foo", default="foo", help="User supplied foo.")
@click.option("-b", "--bar", default="bar", help="User supplied bar.")
def echo(foo, bar):
    """My Cool Program
   
    It does stuff. Here is the documentation for it.
    """
    print(foo, bar)
   
if __name__ == "__main__":
    echo()
```

You can see some of the same boilerplate code in the `@click.option` decorator as you saw with `argparse`. But the "work" of creating and managing the argument parser has been abstracted away. Now the function `echo` is called _magically_ with the command-line arguments parsed and the values assigned to the function arguments.

Adding arguments to a `Click` interface is as easy as adding another decorator to the stack and adding the new argument to the function definition.

### But wait, there's more!

Built on top of `Click`, [`Typer`][25] is an even _newer_ CLI framework that combines the functionality of Click with modern Python [type hinting][26]. One of the drawbacks of using Click is the stack of decorators that have to be added to a function. CLI arguments have to be specified in two places: the decorator and the function argument list. `Typer` [DRYs][27] out CLI specifications, resulting in code that's easier to read and maintain.


```
import typer

cli = typer.Typer()

@cli.command()
def echo(foo: str = "foo", bar: str = "bar"):
    """My Cool Program
   
    It does stuff. Here is the documentation for it.
    """
    print(foo, bar)
   
if __name__ == "__main__":
    cli()
```

### Time to start writing some code

Which one of these approaches is right? It depends on _your_ use case. Are you writing a quick and dirty script that only you will use? Use `sys.argv` directly and drive on. Do you need more robust command-line parsing? Maybe `argparse` is enough. Do you have lots of subcommands and complicated options, and is your team going to use it daily? Now you should definitely consider `Click` or `Typer`. Part of the fun of being a programmer is hacking out alternate implementations to see which one suits you best.

Finally, there are _many_ third-party packages for parsing command-line arguments in Python. I've only presented the ones I like or have used. It is entirely fine and expected for you to like and/or use different packages. My advice is to start with these and see where you end up.

Go write something cool.

* * *

_This article originally appeared on [PyBites][28] and is republished with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/c-python-cli

作者：[Erik O'Shaughnessy][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jnyjny
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/search_find_code_python_programming.png?itok=ynSL8XRV (Searching for code)
[2]: https://en.wikipedia.org/wiki/Command-line_interface
[3]: https://en.wikipedia.org/wiki/Unix
[4]: https://www.gnu.org/software/bash/
[5]: https://en.wikipedia.org/wiki/C_(programming_language)
[6]: https://www.toptal.com/c/after-all-these-years-the-world-is-still-powered-by-c-programming
[7]: https://opensource.com/article/19/5/how-write-good-c-main-function
[8]: https://en.wikipedia.org/wiki/Dynamic_linker
[9]: http://www.opengroup.org/onlinepubs/009695399/functions/printf.html
[10]: https://en.wikipedia.org/wiki/C_standard_library
[11]: http://man7.org/linux/man-pages/man3/getopt.3.html
[12]: https://www.python.org/dev/peps/pep-0275/
[13]: https://www.python.org/dev/peps/pep-3103/
[14]: https://www.gnu.org
[15]: https://en.wikipedia.org/wiki/Man_page
[16]: http://man7.org/linux/man-pages/man1/ps.1.html
[17]: https://docs.python.org/3/library/sys.html
[18]: https://docs.python.org/2/library/getopt.html
[19]: https://docs.python.org/2/library/optparse.html
[20]: https://docs.python.org/3/library/argparse.html
[21]: https://en.wikipedia.org/wiki/Boilerplate_code
[22]: https://www.python.org/dev/peps/pep-0206/
[23]: https://click.palletsprojects.com/en/7.x/
[24]: https://wiki.python.org/moin/PythonDecorators
[25]: https://typer.tiangolo.com
[26]: https://docs.python.org/3/library/typing.html
[27]: https://en.wikipedia.org/wiki/Don%27t_repeat_yourself
[28]: https://pybit.es/guest-exploring-python-clis.html

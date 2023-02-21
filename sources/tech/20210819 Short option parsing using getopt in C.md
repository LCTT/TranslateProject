[#]: subject: "Short option parsing using getopt in C"
[#]: via: "https://opensource.com/article/21/8/short-option-parsing-c"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lujun9972"
[#]: translator: "toknow-gh"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Short option parsing using getopt in C
======
Use the command line to make your programs more flexible by allowing
users to tell them what to do.
![Person programming on a laptop on a building][1]

Writing a C program to process files is easy when you already know what files you'll operate on and what actions to take. If you "hard code" the filename into your program, or if your program is coded to do things only one way, then your program will always know what to do.

But you can make your program much more flexible if it can respond to the user every time the program runs. Let your user tell your program what files to use or how to do things differently. And for that, you need to read the command line.

### Reading the command line

When you write a program in C, you might start with the declaration:


```
`int main()`
```

That's the simplest way to start a C program. But if you add these standard parameters in the parentheses, your program can read the options given to it on the command line:


```
`int main(int argc, char **argv)`
```

The `argc` variable is the argument count or the number of arguments on the command line. This will always be a number that's at least one.

The `argv` variable is a double pointer, an array of strings, that contains the arguments from the command line. The first entry in the array, `*argv[0]`, is always the name of the program. The other elements of the `**argv` array contain the rest of the command-line arguments.

I'll write a simple program to echo back the options given to it on the command line. This is similar to the Linux `echo` command, except it also prints the name of the program. It also prints each command-line option on its own line using the `puts` function:


```
#include &lt;stdio.h&gt;

int
main(int argc, char **argv)
{
  int i;

  [printf][2]("argc=%d\n", argc); /* debugging */

  for (i = 0; i &lt; argc; i++) {
    [puts][3](argv[i]);
  }

  return 0;
}
```

Compile this program and run it with some command-line options, and you'll see your command line printed back to you, each item on its own line:


```
$ ./echo this program can read the command line
argc=8
./echo
this
program
can
read
the
command
line
```

This command line sets the program's `argc` to `8`, and the `**argv` array contains eight entries: the name of the program, plus the seven words the user entered. And as always in C programs, the array starts at zero, so the elements are numbered 0, 1, 2, 3, 4, 5, 6, 7. That's why you can process the command line with the `for` loop using the comparison `i < argc`.

You can use this to write your own versions of the Linux `cat` or `cp` commands. The `cat` command's basic functionality displays the contents of one or more files. Here's a simple version of `cat` that reads the filenames from the command line:


```
#include &lt;stdio.h&gt;

void
copyfile(FILE *in, FILE *out)
{
  int ch;

  while ((ch = [fgetc][4](in)) != EOF) {
    [fputc][5](ch, out);
  }
}

int
main(int argc, char **argv)
{
  int i;
  FILE *fileptr;

  for (i = 1; i &lt; argc; i++) {
    fileptr = [fopen][6](argv[i], "r");

    if (fileptr != NULL) {
      copyfile(fileptr, stdout);
      [fclose][7](fileptr);
    }
  }

  return 0;
}
```

This simple version of `cat` reads a list of filenames from the command line and displays the contents of each file to the standard output, one character at a time. For example, if I have one file called `hello.txt` that contains a few lines of text, I can display its contents with my own `cat` command:


```
$ ./cat hello.txt
Hi there!
This is a sample text file.
```

Using this sample program as a starting point, you can write your own versions of other Linux commands, such as the `cp` program, by reading only two filenames: one file to read from and another file to write the copy.

### Reading command-line options

Reading filenames and other text from the command line is great, but what if you want your program to change its behavior based on the _options_ the user gives it? For example, the Linux `cat` command supports several command-line options, including:

  * `-b` Put line numbers next to non-blank lines
  * `-E` Show the ends of lines as `$`
  * `-n` ` `Put line numbers next to all lines
  * `-s` Suppress printing repeated blank lines
  * `-T` Show tabs as `^I`
  * `-v` ` `Verbose; show non-printing characters using `^x` and `M-x` notation, except for new lines and tabs



These _single-letter_ options are called _short options_, and they always start with a single hyphen character. You usually see these short options written separately, such as `cat -E -n`, but you can also combine the short options into a single _option string_ such as `cat -En`.

Fortunately, there's an easy way to read these from the command line. All Linux and Unix systems include a special C library called `getopt`, defined in the `unistd.h` header file. You can use `getopt` in your program to read these short options.

Unlike other Unix systems, `getopt` on Linux will always ensure your short options appear at the front of your command line. For example, say a user types `cat -E file -n`. The `-E` option is upfront, but the `-n` option is after the filename. But if you use Linux `getopt`, your program will always behave as though the user types `cat -E -n file`. That makes processing a breeze because `getopt` can parse the short options, leaving you a list of filenames on the command line that your program can read using the `**argv` array.

You use `getopt` like this:


```
       #include &lt;unistd.h&gt;

       int getopt(int argc, char **argv, char *optstring);
```

The option string `optstring` contains a list of the valid option characters. If your program only allows the `-E` and `-n` options, you use "`En"` as your option string.

You usually use `getopt` in a loop to parse the command line for options. At each `getopt` call, the function returns the next short option it finds on the command line or the value `'?'` for any unrecognized short options. When `getopt` can't find any more short options, it returns `-1` and sets the global variable `optind` to the next element in `**argv` after all the short options.

Let's look at a simple example. This demo program isn't a full replacement of `cat` with all the options, but it can parse its command line. Every time it finds a valid command-line option, it prints a short message to indicate it was found. In your own programs, you might instead set a variable or take some other action that responds to that command-line option:


```
#include &lt;stdio.h&gt;
#include &lt;unistd.h&gt;

int
main(int argc, char **argv)
{
  int i;
  int option;

  /* parse short options */

  while ((option = getopt(argc, argv, "bEnsTv")) != -1) {
    switch (option) {
    case 'b':
      [puts][3]("Put line numbers next to non-blank lines");
      break;
    case 'E':
      [puts][3]("Show the ends of lines as $");
      break;
    case 'n':
      [puts][3]("Put line numbers next to all lines");
      break;
    case 's':
      [puts][3]("Suppress printing repeated blank lines");
      break;
    case 'T':
      [puts][3]("Show tabs as ^I");
      break;
    case 'v':
      [puts][3]("Verbose");
      break;
    default:                          /* '?' */
      [puts][3]("What's that??");
    }
  }

  /* print the rest of the command line */

  [puts][3]("------------------------------");

  for (i = optind; i &lt; argc; i++) {
    [puts][3](argv[i]);
  }

  return 0;
}
```

If you compile this program as `args`, you can try out different command lines to see how they parse the short options and always leave you with the rest of the command line. In the simplest case, with all the options up front, you get this:


```
$ ./args -b -T file1 file2
Put line numbers next to non-blank lines
Show tabs as ^I
\------------------------------
file1
file2
```

Now try the same command line but combine the two short options into a single option string:


```
$ ./args -bT file1 file2
Put line numbers next to non-blank lines
Show tabs as ^I
\------------------------------
file1
file2
```

If necessary, `getopt` can "reorder" the command line to deal with short options that are out of order:


```
$ ./args -E file1 file2 -T
Show the ends of lines as $
Show tabs as ^I
\------------------------------
file1
file2
```

If your user gives an incorrect short option, `getopt` prints a message:


```
$ ./args -s -an file1 file2
Suppress printing repeated blank lines
./args: invalid option -- 'a'
What's that??
Put line numbers next to all lines
\------------------------------
file1
file2
```

### Download the cheat sheet

`getopt` can do lots more than what I've shown. For example, short options can take their own options, such as `-s string` or `-f file`. You can also tell `getopt` to not display error messages when it finds unrecognized options. Read the `getopt(3)` manual page using `man 3 getopt` to learn more about what `getopt` can do for you.

If you're looking for gentle reminders on the syntax and structure of `getopt()` and `getopt_long()`, [download my getopt cheat sheet][8]. One page demonstrates short options, and the other side demonstrates long options with minimum viable code and a listing of the global variables you need to know.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/short-option-parsing-c

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_code_programming_laptop.jpg?itok=ormv35tV (Person programming on a laptop on a building)
[2]: http://www.opengroup.org/onlinepubs/009695399/functions/printf.html
[3]: http://www.opengroup.org/onlinepubs/009695399/functions/puts.html
[4]: http://www.opengroup.org/onlinepubs/009695399/functions/fgetc.html
[5]: http://www.opengroup.org/onlinepubs/009695399/functions/fputc.html
[6]: http://www.opengroup.org/onlinepubs/009695399/functions/fopen.html
[7]: http://www.opengroup.org/onlinepubs/009695399/functions/fclose.html
[8]: https://opensource.com/downloads/c-getopt-cheat-sheet

[#]: subject: (Learn how file input and output works in C)
[#]: via: (https://opensource.com/article/21/3/file-io-c)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: (wyxplus)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Learn how file input and output works in C
======
Understanding I/O can help you do things faster.
![4 manilla folders, yellow, green, purple, blue][1]

If you want to learn input and output in C, start by looking at the `stdio.h` include file. As you might guess from the name, that file defines all the standard ("std") input and output ("io") functions.

The first `stdio.h` function that most people learn is the `printf` function to print formatted output. Or the `puts` function to print a simple string. Those are great functions to print information to the user, but if you want to do more than that, you'll need to explore other functions.

You can learn about some of these functions and methods by writing a replica of a common Linux command. The `cp` command will copy one file to another. If you look at the `cp` man page, you'll see that `cp` supports a broad set of command-line parameters and options. But in the simplest case, `cp` supports copying one file to another:


```
`cp infile outfile`
```

You can write your own version of this `cp` command in C by using only a few basic functions to _read_ and _write_ files.

### Reading and writing one character at a time

You can easily do input and output using the `fgetc` and `fputc` functions. These read and write data one character at a time. The usage is defined in `stdio.h` and is quite straightforward: `fgetc` reads (gets) a single character from a file, and `fputc` puts a single character into a file.


```
int [fgetc][2](FILE *stream);
int [fputc][3](int c, FILE *stream);
```

Writing the `cp` command requires accessing files. In C, you open a file using the `fopen` function, which takes two arguments: the _name_ of the file and the _mode_ you want to use. The mode is usually `r` to read from a file or `w` to write to a file. The mode supports other options too, but for this tutorial, just focus on reading and writing.

Copying one file to another then becomes a matter of opening the source and destination files, then _reading one character at a time_ from the first file, then _writing that character_ to the second file. The `fgetc` function returns either the single character read from the input file or the _end of file_ (`EOF`) marker when the file is done. Once you've read `EOF`, you've finished copying and you can close both files. That code looks like this:


```
  do {
    ch = [fgetc][2](infile);
    if (ch != EOF) {
      [fputc][3](ch, outfile);
    }
  } while (ch != EOF);
```

You can write your own `cp` program with this loop to read and write one character at a time by using the `fgetc` and `fputc` functions. The `cp.c` source code looks like this:


```
#include &lt;stdio.h&gt;

int
main(int argc, char **argv)
{
  FILE *infile;
  FILE *outfile;
  int ch;

  /* parse the command line */

  /* usage: cp infile outfile */

  if (argc != 3) {
    [fprintf][4](stderr, "Incorrect usage\n");
    [fprintf][4](stderr, "Usage: cp infile outfile\n");
    return 1;
  }

  /* open the input file */

  infile = [fopen][5](argv[1], "r");
  if (infile == NULL) {
    [fprintf][4](stderr, "Cannot open file for reading: %s\n", argv[1]);
    return 2;
  }

  /* open the output file */

  outfile = [fopen][5](argv[2], "w");
  if (outfile == NULL) {
    [fprintf][4](stderr, "Cannot open file for writing: %s\n", argv[2]);
    [fclose][6](infile);
    return 3;
  }

  /* copy one file to the other */

  /* use fgetc and fputc */

  do {
    ch = [fgetc][2](infile);
    if (ch != EOF) {
      [fputc][3](ch, outfile);
    }
  } while (ch != EOF);

  /* done */

  [fclose][6](infile);
  [fclose][6](outfile);

  return 0;
}
```

And you can compile that `cp.c` file into a full executable using the GNU Compiler Collection (GCC):


```
`$ gcc -Wall -o cp cp.c`
```

The `-o cp` option tells the compiler to save the compiled program into the `cp` program file. The `-Wall` option tells the compiler to turn on all warnings. If you don't see any warnings, that means everything worked correctly.

### Reading and writing blocks of data

Programming your own `cp` command by reading and writing data one character at a time does the job, but it's not very fast. You might not notice when copying "everyday" files like documents and text files, but you'll really notice the difference when copying large files or when copying files over a network. Working on one character at a time requires significant overhead.

A better way to write this `cp` command is by reading a chunk of the input into memory (called a _buffer_), then writing that collection of data to the second file. This is much faster because the program can read more of the data at one time, which requires fewer "reads" from the file.

You can read a file into a variable by using the `fread` function. This function takes several arguments: the array or memory buffer to read data into (`ptr`), the size of the smallest thing you want to read (`size`), how many of those things you want to read (`nmemb`), and the file to read from (`stream`):


```
`size_t fread(void *ptr, size_t size, size_t nmemb, FILE *stream);`
```

The different options provide quite a bit of flexibility for more advanced file input and output, such as reading and writing files with a certain data structure. But in the simple case of _reading data from one file_ and _writing data to another file_, you can use a buffer that is an array of characters.

And you can write the buffer to another file using the `fwrite` function. This uses a similar set of options to the `fread` function: the array or memory buffer to read data from, the size of the smallest thing you need to write, how many of those things you need to write, and the file to write to.


```
`size_t fwrite(const void *ptr, size_t size, size_t nmemb, FILE *stream);`
```

In the case where the program reads a file into a buffer, then writes that buffer to another file, the array (`ptr`) can be an array of a fixed size. For example, you can use a `char` array called `buffer` that is 200 characters long.

With that assumption, you need to change the loop in your `cp` program to _read data from a file into a buffer_ then _write that buffer to another file_:


```
  while (![feof][7](infile)) {
    buffer_length = [fread][8](buffer, sizeof(char), 200, infile);
    [fwrite][9](buffer, sizeof(char), buffer_length, outfile);
  }
```

Here's the full source code to your updated `cp` program, which now uses a buffer to read and write data:


```
#include &lt;stdio.h&gt;

int
main(int argc, char **argv)
{
  FILE *infile;
  FILE *outfile;
  char buffer[200];
  size_t buffer_length;

  /* parse the command line */

  /* usage: cp infile outfile */

  if (argc != 3) {
    [fprintf][4](stderr, "Incorrect usage\n");
    [fprintf][4](stderr, "Usage: cp infile outfile\n");
    return 1;
  }

  /* open the input file */

  infile = [fopen][5](argv[1], "r");
  if (infile == NULL) {
    [fprintf][4](stderr, "Cannot open file for reading: %s\n", argv[1]);
    return 2;
  }

  /* open the output file */

  outfile = [fopen][5](argv[2], "w");
  if (outfile == NULL) {
    [fprintf][4](stderr, "Cannot open file for writing: %s\n", argv[2]);
    [fclose][6](infile);
    return 3;
  }

  /* copy one file to the other */

  /* use fread and fwrite */

  while (![feof][7](infile)) {
    buffer_length = [fread][8](buffer, sizeof(char), 200, infile);
    [fwrite][9](buffer, sizeof(char), buffer_length, outfile);
  }

  /* done */

  [fclose][6](infile);
  [fclose][6](outfile);

  return 0;
}
```

Since you want to compare this program to the other program, save this source code as `cp2.c`. You can compile that updated program using GCC:


```
`$ gcc -Wall -o cp2 cp2.c`
```

As before, the `-o cp2` option tells the compiler to save the compiled program into the `cp2` program file. The `-Wall` option tells the compiler to turn on all warnings. If you don't see any warnings, that means everything worked correctly.

### Yes, it really is faster

Reading and writing data using buffers is the better way to write this version of the `cp` program. Because it reads chunks of a file into memory at once, the program doesn't need to read data as often. You might not notice a difference in using either method on smaller files, but you'll really see the difference if you need to copy something that's much larger or when copying data on slower media like over a network connection.

I ran a runtime comparison using the Linux `time` command. This command runs another program, then tells you how long that program took to complete. For my test, I wanted to see the difference in time, so I copied a 628MB CD-ROM image file I had on my system.

I first copied the image file using the standard Linux `cp` command to see how long that takes. By running the Linux `cp` command first, I also eliminated the possibility that Linux's built-in file-cache system wouldn't give my program a false performance boost. The test with Linux `cp` took much less than one second to run:


```
$ time cp FD13LIVE.iso tmpfile

real    0m0.040s
user    0m0.001s
sys     0m0.003s
```

Copying the same file using my own version of the `cp` command took significantly longer. Reading and writing one character at a time took almost five seconds to copy the file:


```
$ time ./cp FD13LIVE.iso tmpfile

real    0m4.823s
user    0m4.100s
sys     0m0.571s
```

Reading data from an input into a buffer and then writing that buffer to an output file is much faster. Copying the file using this method took less than a second:


```
$ time ./cp2 FD13LIVE.iso tmpfile

real    0m0.944s
user    0m0.224s
sys     0m0.608s
```

My demonstration `cp` program used a buffer that was 200 characters. I'm sure the program would run much faster if I read more of the file into memory at once. But for this comparison, you can already see the huge difference in performance, even with a small, 200 character buffer.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/file-io-c

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/file_system.jpg?itok=pzCrX1Kc (4 manilla folders, yellow, green, purple, blue)
[2]: http://www.opengroup.org/onlinepubs/009695399/functions/fgetc.html
[3]: http://www.opengroup.org/onlinepubs/009695399/functions/fputc.html
[4]: http://www.opengroup.org/onlinepubs/009695399/functions/fprintf.html
[5]: http://www.opengroup.org/onlinepubs/009695399/functions/fopen.html
[6]: http://www.opengroup.org/onlinepubs/009695399/functions/fclose.html
[7]: http://www.opengroup.org/onlinepubs/009695399/functions/feof.html
[8]: http://www.opengroup.org/onlinepubs/009695399/functions/fread.html
[9]: http://www.opengroup.org/onlinepubs/009695399/functions/fwrite.html

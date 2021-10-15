[#]: subject: "5 common bugs in C programming and how to fix them"
[#]: via: "https://opensource.com/article/21/10/programming-bugs"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lujun9972"
[#]: translator: "unigeorge"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

5 common bugs in C programming and how to fix them
======
Five ways to make your C programs more resilient and reliable.
![Bug tracking magnifying glass on computer screen][1]

Even the best programmers can create programming bugs. Depending on what your program does, these bugs could introduce security vulnerabilities, cause the program to crash, or create unexpected behavior.

The C programming language sometimes gets a bad reputation because it is not memory safe like more recent programming languages, including Rust. But with a little extra code, you can avoid the most common and most serious C programming bugs. Here are five bugs that can break your application and how you can avoid them:

### 1\. Uninitialized variables

When the program starts up, the system will assign it a block of memory that the program uses to store data. That means your variables will get whatever random value was in memory when the program started.

Some environments will intentionally "zero out" the memory as the program starts up, so every variable starts with a zero value. And it can be tempting to assume in your programs that all variables will begin at zero. However, the C programming specification says that the system does not initialize variables.

Consider a sample program that uses a few variables and two arrays:


```
#include &lt;stdio.h&gt;
#include &lt;stdlib.h&gt;

int
main()
{
  int i, j, k;
  int numbers[5];
  int *array;

  [puts][2]("These variables are not initialized:");

  [printf][3]("  i = %d\n", i);
  [printf][3]("  j = %d\n", j);
  [printf][3]("  k = %d\n", k);

  [puts][2]("This array is not initialized:");

  for (i = 0; i &lt; 5; i++) {
    [printf][3]("  numbers[%d] = %d\n", i, numbers[i]);
  }

  [puts][2]("malloc an array ...");
  array = [malloc][4](sizeof(int) * 5);

  if (array) {
    [puts][2]("This malloc'ed array is not initialized:");

    for (i = 0; i &lt; 5; i++) {
      [printf][3]("  array[%d] = %d\n", i, array[i]);
    }

    [free][5](array);
  }

  /* done */

  [puts][2]("Ok");
  return 0;
}
```

The program does not initialize the variables, so they start with whatever values the system had in memory at the time. Compiling and running this program on my Linux system, you'll see that some variables happen to have "zero" values, but others do not:


```
These variables are not initialized:
  i = 0
  j = 0
  k = 32766
This array is not initialized:
  numbers[0] = 0
  numbers[1] = 0
  numbers[2] = 4199024
  numbers[3] = 0
  numbers[4] = 0
malloc an array ...
This malloc'ed array is not initialized:
  array[0] = 0
  array[1] = 0
  array[2] = 0
  array[3] = 0
  array[4] = 0
Ok
```

Fortunately, the `i` and `j` variables start at zero, but `k` has a starting value of 32766. In the numbers array, most elements also happen to start with zero, except the third element, which gets an initial value of 4199024.

Compiling the same program on a different system further shows the danger in uninitialized variables. Don't assume "all the world runs Linux" because one day, your program might run on a different platform. For example, here's the same program running on FreeDOS:


```
These variables are not initialized:
  i = 0
  j = 1074
  k = 3120
This array is not initialized:
  numbers[0] = 3106
  numbers[1] = 1224
  numbers[2] = 784
  numbers[3] = 2926
  numbers[4] = 1224
malloc an array ...
This malloc'ed array is not initialized:
  array[0] = 3136
  array[1] = 3136
  array[2] = 14499
  array[3] = -5886
  array[4] = 219
Ok
```

Always initialize your program's variables. If you assume a variable will start with a zero value, add the extra code to assign zero to the variable. This extra bit of typing upfront will save you headaches and debugging later on.

### 2\. Going outside of array bounds

In C, arrays start at array index zero. That means an array that is ten elements long goes from 0 to 9, or an array that is a thousand elements long goes from 0 to 999.

Some programmers sometimes forget this and introduce "off by one" bugs where they reference the array starting at one. In an array that is five elements long, the value the programmer intended to find at array element "5" is not actually the fifth element of the array. Instead, it is some other value in memory, not associated with the array at all.

Here's an example that goes well outside the array bounds. The program starts with an array that's only five elements long but references array elements from outside that range:


```
#include &lt;stdio.h&gt;
#include &lt;stdlib.h&gt;

int
main()
{
  int i;
  int numbers[5];
  int *array;

  /* test 1 */

  [puts][2]("This array has five elements (0 to 4)");

  /* initalize the array */
  for (i = 0; i &lt; 5; i++) {
    numbers[i] = i;
  }

  /* oops, this goes beyond the array bounds: */
  for (i = 0; i &lt; 10; i++) {
    [printf][3]("  numbers[%d] = %d\n", i, numbers[i]);
  }

  /* test 2 */

  [puts][2]("malloc an array ...");

  array = [malloc][4](sizeof(int) * 5);

  if (array) {
    [puts][2]("This malloc'ed array also has five elements (0 to 4)");

    /* initalize the array */
    for (i = 0; i &lt; 5; i++) {
      array[i] = i;
    }

    /* oops, this goes beyond the array bounds: */
    for (i = 0; i &lt; 10; i++) {
      [printf][3]("  array[%d] = %d\n", i, array[i]);
    }

    [free][5](array);
  }

  /* done */

  [puts][2]("Ok");
  return 0;
}
```

Note that the program initializes all the values of the array, from 0 to 4, but then tries to read 0 to 9 instead of 0 to 4. The first five values are correct, but after that you don’t know what the values will be:


```
This array has five elements (0 to 4)
  numbers[0] = 0
  numbers[1] = 1
  numbers[2] = 2
  numbers[3] = 3
  numbers[4] = 4
  numbers[5] = 0
  numbers[6] = 4198512
  numbers[7] = 0
  numbers[8] = 1326609712
  numbers[9] = 32764
malloc an array ...
This malloc'ed array also has five elements (0 to 4)
  array[0] = 0
  array[1] = 1
  array[2] = 2
  array[3] = 3
  array[4] = 4
  array[5] = 0
  array[6] = 133441
  array[7] = 0
  array[8] = 0
  array[9] = 0
Ok
```

When referencing arrays, always keep track of its size. Store that in a variable; don't hard-code an array size. Otherwise, your program might stray outside the array bounds when you later update it to use a different array size, but you forget to change the hard-coded array length.

### 3\. Overflowing a string

Strings are just arrays of a different kind. In the C programming language, a string is an array of `char` values, with a zero character to indicate the end of the string.

And so, like arrays, you need to avoid going outside the range of the string. This is sometimes called _overflowing a string_.

One easy way to overflow a string is to read data with the `gets` function. The `gets` function is very dangerous because it doesn't know how much data it can store in a string, and it naively reads data from the user. This is fine if your user enters short strings like `foo` but can be disastrous when the user enters a value that is too long for your string value.

Here's a sample program that reads a city name using the `gets` function. In this program, I've also added a few unused variables to show how string overflow can affect other data:


```
#include &lt;stdio.h&gt;
#include &lt;string.h&gt;

int
main()
{
  char name[10];                       /* Such as "Chicago" */
  int var1 = 1, var2 = 2;

  /* show initial values */

  [printf][3]("var1 = %d; var2 = %d\n", var1, var2);

  /* this is bad .. please don't use gets */

  [puts][2]("Where do you live?");
  [gets][6](name);

  /* show ending values */

  [printf][3]("&lt;%s&gt; is length %d\n", name, [strlen][7](name));
  [printf][3]("var1 = %d; var2 = %d\n", var1, var2);

  /* done */

  [puts][2]("Ok");
  return 0;
}
```

That program works fine when you test for similarly short city names, like `Chicago` in Illinois or `Raleigh` in North Carolina:


```
var1 = 1; var2 = 2
Where do you live?
Raleigh
&lt;Raleigh&gt; is length 7
var1 = 1; var2 = 2
Ok
```

The Welsh town of `Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch` has one of the longest names in the world. At 58 characters, this string goes well beyond the 10 characters reserved in the `name` variable. As a result, the program stores values in other areas of memory, including the values of `var1` and `var2`:


```
var1 = 1; var2 = 2
Where do you live?
Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch
&lt;Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch&gt; is length 58
var1 = 2036821625; var2 = 2003266668
Ok
Segmentation fault (core dumped)
```

Before aborting, the program used the long string to overwrite other parts of memory. Note that `var1` and `var2` no longer have their starting values of `1` and `2`.

Avoid `gets`, and use safer methods to read user data. For example, the `getline` function will allocate enough memory to store user input, so the user cannot accidentally overflow the string by entering a long value.

### 4\. Freeing memory twice

One of the rules of good C programming is, "if you allocate memory, you should free it." Programs can allocate memory for arrays and strings using the `malloc` function, which reserves a block of memory and returns a pointer to the starting address in memory. Later, the program can release the memory using the `free` function, which uses the pointer to mark the memory as unused.

However, you should only use the `free` function once. Calling `free` a second time will result in unexpected behavior that will probably break your program. Here's a short example program to show that. It allocates memory, then immediately releases it. But like a forgetful-but-methodical programmer, I also freed the memory at the end of the program, resulting in freeing the same memory twice:


```
#include &lt;stdio.h&gt;
#include &lt;stdlib.h&gt;

int
main()
{
  int *array;

  [puts][2]("malloc an array ...");

  array = [malloc][4](sizeof(int) * 5);

  if (array) {
    [puts][2]("malloc succeeded");

    [puts][2]("Free the array...");
    [free][5](array);
  }

  [puts][2]("Free the array...");
  [free][5](array);

  [puts][2]("Ok");
}
```

Running this program causes a dramatic failure on the second use of the `free` function:


```
malloc an array ...
malloc succeeded
Free the array...
Free the array...
free(): double free detected in tcache 2
Aborted (core dumped)
```

Avoid calling `free` more than once on an array or string. One way to avoid freeing memory twice is to locate the `malloc` and `free` functions in the same function.

For example, a solitaire program might allocate memory for a deck of cards in the main function, then use that deck in other functions to play the game. Free the memory in the main function, rather than some other function. Keeping the `malloc` and `free` statements together helps to avoid freeing memory more than once.

### 5\. Using invalid file pointers

Files are a handy way to store data. For example, you might store configuration data for your program in a file called `config.dat`. The Bash shell reads its initial script from `.bash_profile` in the user's home directory. The GNU Emacs editor looks for the file `.emacs` for its starting values. And the Zoom meeting client uses the `zoomus.conf` file to read its program configuration.

So the ability to read data from a file is important for pretty much all programs. But what if the file you want to read isn't there?

To read a file in C, you first open the file using the `fopen` function, which returns a stream pointer to the file. You can use this pointer with other functions to read data, such as `fgetc` to read the file one character at a time.

If the file you want to read isn't there or isn't readable by your program, then the `fopen` function will return `NULL` as the file pointer, which is an indication the file pointer is invalid. But here's a sample program that innocently does not check if `fopen` returned `NULL` and tries to read the file regardless:


```
#include &lt;stdio.h&gt;

int
main()
{
  FILE *pfile;
  int ch;

  [puts][2]("Open the FILE.TXT file ...");

  pfile = [fopen][8]("FILE.TXT", "r");

  /* you should check if the file pointer is valid, but we skipped that */

  [puts][2]("Now display the contents of FILE.TXT ...");

  while ((ch = [fgetc][9](pfile)) != EOF) {
    [printf][3]("&lt;%c&gt;", ch);
  }

  [fclose][10](pfile);

  /* done */

  [puts][2]("Ok");
  return 0;
}
```

When you run this program, the first call to `fgetc` results in a spectacular failure, and the program immediately aborts:


```
Open the FILE.TXT file ...
Now display the contents of FILE.TXT ...
Segmentation fault (core dumped)
```

Always check the file pointer to ensure it's valid. For example, after calling `fopen` to open a file, check the pointer's value with something like `if (pfile != NULL)` to ensure that the pointer is something you can use.

We all make mistakes, and programming bugs happen to the best of programmers. But if you follow these guidelines and add a little extra code to check for these five types of bugs, you can avoid the most serious C programming mistakes. A few lines of code up front to catch these errors may save you hours of debugging later.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/programming-bugs

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[unigeorge](https://github.com/unigeorge)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bug_software_issue_tracking_computer_screen.jpg?itok=6qfIHR5y (Bug tracking magnifying glass on computer screen)
[2]: http://www.opengroup.org/onlinepubs/009695399/functions/puts.html
[3]: http://www.opengroup.org/onlinepubs/009695399/functions/printf.html
[4]: http://www.opengroup.org/onlinepubs/009695399/functions/malloc.html
[5]: http://www.opengroup.org/onlinepubs/009695399/functions/free.html
[6]: http://www.opengroup.org/onlinepubs/009695399/functions/gets.html
[7]: http://www.opengroup.org/onlinepubs/009695399/functions/strlen.html
[8]: http://www.opengroup.org/onlinepubs/009695399/functions/fopen.html
[9]: http://www.opengroup.org/onlinepubs/009695399/functions/fgetc.html
[10]: http://www.opengroup.org/onlinepubs/009695399/functions/fclose.html

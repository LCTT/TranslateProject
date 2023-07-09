[#]: subject: "How to (safely) read user input with the getline function"
[#]: via: "https://opensource.com/article/22/5/safely-read-user-input-getline"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lkxed"
[#]: translator: "MjSeven"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to (safely) read user input with the getline function
======
Getline offers a more flexible way to read user data into your program without breaking the system.

![Woman using laptop concentrating][1]
(Image by Mapbox Uncharted ERG, [CC-BY 3.0 US][2])

Reading strings in C used to be a very dangerous thing to do. When reading input from the user, programmers might be tempted to use the `gets` function from the C Standard Library. The usage for `gets` is simple enough:

`char *gets(char *string);`

That is, `gets` reads data from standard input, and stores the result in a string variable. Using `gets` returns a pointer to the string, or the value NULL if nothing was read.

As a simple example, we might ask the user a question and read the result into a string:

```c
#include <stdio.h>
#include <string.h>

int main()
{
  char city[10]; // Such as "Chicago"

  // this is bad .. please don't use gets

  puts("Where do you live?");
  gets(city);

  printf("<%s> is length %ld\n", city, strlen(city));

  return 0;
}
```

Entering a relatively short value with the above program works well enough:

```
Where do you live?
Chicago
<Chicago> is length 7
```

However, the `gets` function is very simple, and will naively read data until it thinks the user is finished. But `gets` doesn't check that the string is long enough to hold the user's input. Entering a very long value will cause `gets` to store more data than the string variable can hold, resulting in overwriting other parts of memory.

```
Where do you live?
Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch
<Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch> is length 58
Segmentation fault (core dumped)
```

At best, overwriting parts of memory simply breaks the program. At worst, this introduces a critical security bug where a bad user can insert arbitrary data into the computer's memory via your program.

That's why the `gets` function is dangerous to use in a program. Using `gets`, you have no control over how much data your program attempts to read from the user. This often leads to buffer overflow.

The `fgets` function has historically been the recommended way to read strings safely. This version of `gets` provides a safety check by only reading up to a certain number of characters, passed as a function argument:

`char *fgets(char *string, int size, FILE *stream);`

The `fgets` function reads from the file pointer, and stores data into a string variable, but only up to the length indicated by `size`. We can test this by updating our sample program to use `fgets` instead of `gets` :

```c
#include <stdio.h>
#include <string.h>

int main()
{
    char city[10]; // Such as "Chicago"

    puts("Where do you live?");

    // fgets is better but not perfect
    fgets(city, 10, stdin);

    printf("<%s> is length %ld\n", city, strlen(city));

    return 0;
}
```

If you compile and run this program, you can enter an arbitrarily long city name at the prompt. However, the program will only read enough data to fit into a string variable of `size` =10. And because C adds a null (‘\0') character to the ends of strings, that means`fgets` will only read 9 characters into the string:

```
Where do you live?
Minneapolis
<Minneapol> is length 9
```

While this is certainly safer than using `fgets` to read user input, it does so at the cost of "cutting off" your user's input if it is too long.

A more flexible solution to reading long data is to allow the string-reading function to allocate more memory to the string, if the user entered more data than the variable might hold. By resizing the string variable as necessary, the program always has enough room to store the user's input.

The `getline` function does exactly that. This function reads input from an input stream, such as the keyboard or a file, and stores the data in a string variable. But unlike `fgets` and `gets`, `getline` resizes the string with `realloc` to ensure there is enough memory to store the complete input.

`ssize_t getline(char **pstring, size_t *size, FILE *stream);`

The`getline` is actually a wrapper to a similar function called `getdelim` that reads data up to a special delimiter character. In this case, `getline` uses a newline ('\n') as the delimiter, because when reading user input either from the keyboard or from a file, lines of data are separated by a newline character.

The result is a much safer method to read arbitrary data, one line at a time. To use `getline`, define a string pointer and set it to NULL to indicate no memory has been set aside yet. Also define a "string size" variable of type `size_t` and give it a zero value. When you call `getline`, you'll use pointers to both the string and the string size variables, and indicate where to read data. For a sample program, we can read from the standard input:

```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main()
{
  char *string = NULL;
  size_t size = 0;
  ssize_t chars_read;

  // read a long string with getline

  puts("Enter a really long string:");

  chars_read = getline(&string, &size, stdin);
  printf("getline returned %ld\n", chars_read);

  // check for errors

  if (chars_read < 0) {
    puts("couldn't read the input");
    free(string);
    return 1;
  }

  // print the string

  printf("<%s> is length %ld\n", string, strlen(string));

  // free the memory used by string

  free(string);

  return 0;
}
```

As the `getline` reads data, it will automatically reallocate more memory for the string variable as needed. When the function has read all the data from one line, it updates the size of the string via the pointer, and returns the number of characters read, including the delimiter.

```
Enter a really long string:
Supercalifragilisticexpialidocious
getline returned 35
<Supercalifragilisticexpialidocious
> is length 35
```

Note that the string includes the delimiter character. For `getline`, the delimiter is the newline, which is why the output has a line feed in there. If you don't want the delimiter in your string value, you can use another function to change the delimiter to a null character in the string.

With`getline`, programmers can safely avoid one of the common pitfalls of C programming. You can never tell what data your user might try to enter, which is why using `gets` is unsafe, and `fgets` is awkward. Instead, `getline` offers a more flexible way to read user data into your program without breaking the system.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/5/safely-read-user-input-getline

作者：[Jim Hall][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png
[2]: https://creativecommons.org/licenses/by/3.0/us/

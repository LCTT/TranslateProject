[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to use printf to format output)
[#]: via: (https://opensource.com/article/20/8/printf)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

How to use printf to format output
======
Get to know printf, a mysterious, flexible, and feature-rich alternative
to echo, print, and cout.
![Person drinking a hot drink at the computer][1]

When I started learning Unix, I was introduced to the `echo` command pretty early in the process. Likewise, my initial [Python][2] lesson involved the `print` function. Picking up C++ and [Java][2] introduced me to `cout` and `systemout`. It seemed every language proudly had a convenient one-line method of producing output and advertised it like it was going out of style.

But once I turned the first page of intermediate lessons, I met `printf`, a cryptic, mysterious, and surprisingly flexible function. In going against the puzzling tradition of hiding `printf` from beginners, this article aims to introduce to the world the humble `printf` function and explain how it can be used in nearly any language.

### A brief history of printf

The term `printf` stands for "print formatted" and may have first appeared in the [Algol 68][3] programming language. Since its inclusion in C, `printf` has been reimplemented in C++, Java, Bash, PHP, and quite probably in whatever your favorite (post-C) language happens to be.

It's clearly popular, and yet many people seem to regard its syntax to be complex, especially compared to alternatives such as `echo` or `print` or `cout`. For example, here's a simple echo statement in Bash:


```
$ echo hello
hello
$
```

Here's the same result using `printf` in Bash:


```
$ printf "%s\n" hello
hello
$
```

But you get a lot of features for that added complexity, and that's exactly why `printf` is well worth learning.

### printf output

The main concept behind `printf` is its ability to format its output based on style information _separate_ from the content. For instance, there is a collection of special sequences that `printf` recognizes as special characters. Your favorite language may have greater or fewer sequences, but common ones include:

  * `\n`: New line
  * `\r`: Carriage return
  * `\t`: Horizontal tab
  * `\NNN`: A specific byte with an octal value containing one to three digits



For example:


```
$ printf "\t\123\105\124\110\n"
     SETH
$
```

In this Bash example, `printf` renders a tab character followed by the ASCII characters assigned to a string of four octal values. This is terminated with the control sequence to produce a new line (`\n`).

Attempting the same thing with `echo` produces something a little more literal:


```
$ printf "\t\123\105\124\110\n"
\t\123\105\124\110\n
$
```

Using Python's `print` function for the same task reveals there's more to Python's `print` command than you might expect:


```
&gt;&gt;&gt; print("\t\123\n")
        S

&gt;&gt;&gt;
```

Obviously, Python's `print` incorporates traditional `printf` features as well as the features of a simple `echo` or `cout`.

These examples contain nothing more than literal characters, though, and while they're useful in some situations, they're probably the least significant thing about `printf`. The true power of `printf` lies in format specification.

### Format output with printf

Format specifiers are characters preceded by a percent sign (`%`).
Common ones include:

  * `%s`: String
  * `%d`: Digit
  * `%f`: Floating-point number
  * `%o`: A number in octal



These are placeholders in a `printf` statement, which you can replace with a value you provide somewhere else in your `printf` statement. Where these values are provided depends on the language you're using and its syntax, but here's a simple example in Java:


```
string var="hello\n";
system.out.printf("%s", var);
```

This, wrapped in appropriate boilerplate code and executed, renders:


```
$ ./example
hello
$
```

It gets even more interesting, though, when the content of a variable changes. Suppose you want to update your output based on an ever-increasing number:


```
#include &lt;stdio.h&gt;

int main() {
  int var=0;
  while ( var &lt; 100) {
    var++;
  printf("Processing is %d% finished.\n", var);
  }
  return 0;
}
```

Compiled and run:


```
Processing is 1% finished.
[...]
Processing is 100% finished.
```

Notice that the double `%` in the code resolves to a single printed `%` symbol.

### Limiting decimal places with printf

Numbers can get complex, and `printf` offers many formatting options. You can limit how many decimal places are printed using the `%f` for floating-point numbers. By placing a dot (`.`) along with a limiter number between the percent sign and the `f`, you tell `printf` how many decimals to render. Here's a simple example written in Bash for brevity:


```
$ printf "%.2f\n" 3.141519
3.14
$
```

Similar syntax applies to other languages. Here's an example in C:


```
#include &lt;math.h&gt;
#include &lt;stdio.h&gt;

int main() {
  [fprintf][4](stdout, "%.2f\n", 4 * [atan][5](1.0));
  return 0;
}
```

For three decimal places, use `.3f`, and so on.

### Adding commas to a number with printf

Since big numbers can be difficult to parse, it's common to break them up with a comma. You can have `printf` add commas as needed by placing an apostrophe (`'`) between the percent sign and the `d`:


```
$ printf "%'d\n" 1024
1,024
$ printf "%'d\n" 1024601
1,024,601
$
```

### Add leading zeros with printf

Another common use for `printf` is to impose a specific format upon numbers in file names. For instance, if you have 10 sequential files on a computer, the computer may sort `10.jpg` before `1.jpg`, which is probably not your intent. When writing to a file programmatically, you can use `printf` to form the file name with leading zero characters. Here's an example in Bash for brevity:


```
$ printf "%03d.jpg\n" {1..10}
001.jpg
002.jpg
[...]
010.jpg
```

Notice that a maximum of 3 places are used in each number.

### Using printf

As you can tell from these `printf` examples, including control characters, especially `\n`, can be tedious, and the syntax is relatively complex. This is the reason shortcuts like `echo` and `cout` were developed. However, if you use `printf` every now and again, you'll get used to the syntax, and it will become second nature. I don't see any reason `printf` should be your _first_ choice for printing statements during everyday activities, but it's a great tool to be comfortable enough with that it won't slow you down when you need it.

Take some time to learn `printf` in your language of choice, and use it when you need it. It's a powerful tool you won't regret having at your fingertips.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/printf

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_tea_laptop_computer_work_desk.png?itok=D5yMx_Dr (Person drinking a hot drink at the computer)
[2]: https://opensource.com/resources/python
[3]: https://opensource.com/article/20/6/algol68
[4]: http://www.opengroup.org/onlinepubs/009695399/functions/fprintf.html
[5]: http://www.opengroup.org/onlinepubs/009695399/functions/atan.html

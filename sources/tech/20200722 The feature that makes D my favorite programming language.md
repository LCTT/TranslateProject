[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The feature that makes D my favorite programming language)
[#]: via: (https://opensource.com/article/20/7/d-programming)
[#]: author: (Lawrence Aberba https://opensource.com/users/aberba)

The feature that makes D my favorite programming language
======
UFCS gives you the power to compose reusable code that has a natural
flow without sacrificing convenience.
![Coding on a computer][1]

Back in 2017, I wrote about why the [D programming language is a great choice for development][2]. But there is one outstanding feature in D I didn't expand enough on: the [Universal Function Call Syntax][3] (UFCS). UFCS is a [syntactic sugar][4] in D that enables chaining any regular function on a type (string, number, boolean, etc.) like its member function of that type.

If you don't already have D installed, [install a D compiler][5] so you can [run the D code][6] in this article yourself.

Consider this example code:


```
// file: ufcs_demo.d

module ufcs_demo;

import std.stdio : writeln;

int[] evenNumbers(int[] numbers)
{
    import std.array : array;
    import std.algorithm : filter;

    return numbers.filter!(n =&gt; n % 2 == 0).array;
}

void main()
{
    writeln(evenNumbers([1, 2, 3, 4]));
}
```

Compile this with your favorite D compiler to see what this simple example application does:


```
$ dmd ufcs_demo.d
$ ./ufcs_demo
[2, 4]
```

But with UFCS as a built-in feature of D, you can also write your code in a natural way:


```
...
writeln([1, 2, 3, 4].evenNumbers());
...
```

or completely remove the now-redundant parenthesis to make it feel like `evenNumbers` is a property:


```
...
writeln([1, 2, 3, 4].evenNumbers); // prints 2, 4
...
```

So the complete code now becomes:


```
// file: ufcs_demo.d

module ufcs_demo;

import std.stdio : writeln;

int[] evenNumbers(int[] numbers)
{
    import std.array : array;
    import std.algorithm : filter;

    return numbers.filter!(n =&gt; n % 2 == 0).array;
}

void main()
{
    writeln([1, 2, 3, 4].evenNumbers);
}
```

Compile it with your favorite D compiler and try it out. As expected, it produces the same output:


```
$ dmd ufcs_demo.d
$ ./ufcs_demo
[2, 4]
```

During compilation, the compiler _automatically_ places the array as the first argument to the function. This is a regular pattern that makes using D such a joy, so it very much feels the same as you naturally think about your code. The result is functional-style programming.

You can probably guess what this prints:


```
//file: cool.d
import std.stdio : writeln;
import std.uni : asLowerCase, asCapitalized;

void main()
{
    string mySentence = "D IS COOL";
    writeln(mySentence.asLowerCase.asCapitalized);
}
```

But just to confirm:


```
$ dmd cool.d
$ ./cool
D is cool
```

Combined with [other D features][7], UFCS gives you the power to compose reusable code that has a natural flow to it without sacrificing convenience.

### Time to try D

As I've written before, D is a great language for development. It's easy to install from [the D download page][8], so download the compiler, take a look at the examples, and experience D for yourself.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/d-programming

作者：[Lawrence Aberba][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/aberba
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: https://opensource.com/article/17/5/d-open-source-software-development
[3]: http://ddili.org/ders/d.en/ufcs.html
[4]: https://en.wikipedia.org/wiki/Syntactic_sugar
[5]: https://tour.dlang.org/tour/en/welcome/install-d-locally
[6]: https://tour.dlang.org/tour/en/welcome/run-d-program-locally
[7]: https://dlang.org/comparison.html
[8]: https://dlang.org/download.html

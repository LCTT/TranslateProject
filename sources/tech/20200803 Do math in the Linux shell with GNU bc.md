[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Do math in the Linux shell with GNU bc)
[#]: via: (https://opensource.com/article/20/7/bc-math)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Do math in the Linux shell with GNU bc
======
Do better math in the shell with bc, a mathematical language for
advanced calculation.
![old school calculator][1]

Most [POSIX][2] systems come with [GNU bc][3], an arbitrary precision numeric processing language. Its syntax is similar to C, but it also supports interactive execution of statements and processing data from standard in (`stdin`). For that reason, it's often the answer to the question, "How do I do math in the Linux shell?" This style of response is common online:


```
$ echo "1+1" | bc
2
```

While that's perfectly valid, few users argue it's elegant compared to something more intuitive, such as:


```
$ 1+1  #this does not work
2
```

The interactive mode is a little easier:


```
$ bc
1+1
2
quit
$
```

But interactive modes don't always fit the desired and intuitive workflow of something simple, like just typing in the calculation you want. For this, I suggest Bluebat's [calculator in pure Bash][4].

What bc actually provides is a mathematical language for advanced calculation.

### Advanced functions with mathlib

On its own, `bc` provides basic math functions. You can test them in the interactive mode:


```
$ bc
3^2
9
(3^2)*(9)/3
27
```

Use the `--mathlib` option to gain advanced functions, including sine, cosine, tangent, and more. In the interactive mode, you can test some of them. Here's the cosine of 90:


```
c(90)
-.44807361612917015236
```

The sine of 9:


```
s(9)
.41211848524175656975
```

### Creating your own bc functions

You can also create your own functions in bc. Function definitions start with the `define` keyword and are enclosed with braces. Here is a simple function entered into an interactive session that returns whatever number it's given:


```
$ bc
define echo(n) {
  return (n);
}
```

In the same interactive session, test it out:


```
echo(2)
2
echo(-2)
-2
```

### If statements in bc

The bc language also has a variety of control statements, the simplest of which is if/else. The syntax may appear familiar at first glance, but there are subtleties in how braces are handled. Note that the _else_ clause of an if-statement is enclosed in braces, while the _then_ clause is not, but both are terminated with a semicolon. Here's a function to find the absolute value of a number _n_:


```
define abso(n) {
  if ( n &gt; 0 ) return (n);
  { return (-n); }
}
```

In the same interactive session, test it out:


```
abso(-5)
5
abso(5)
5
```

### Importing data into bc

Working in an interactive session is tolerable for quick calculations and experimentation, but you lose your data when you quit, and it's difficult to edit when you make mistakes. Fortunately, bc can load variables and functions from external files.

Here's a file containing two variables (`sol` and `foo`) and a custom `abso` function to find an absolute value:


```
sol=299792458

foo=42

define abso(n) {
  if ( n &gt; 0 ) return (n);
  { return (-n); }
}
```

Save this into a file called `bcvars.bc`, so you can import it into a bc interactive session:


```
$ bc bcvars.bc
foo
42
sol
299792458
abso(-23)
23
```

### Power-up your math with bc

The bc language is relatively simple, provided you know enough math to construct the equation for whatever you're trying to accomplish. While bc by default provides useful basic functions and allows you to create your own, you can reduce your workload by standing on the shoulders of giants. Files loaded with new functions, both for mathematic fundamentals as well as for specific tasks (for instance, calculating compound interest), are available from [GNU bc page][5], and [full documentation][6] for bc is available.

If you're interested in doing better math in a shell, try bc. It won't turn you into a mathematics genius, but it just might make it easier to become one.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/bc-math

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/math_money_financial_calculator_colors.jpg?itok=_yEVTST1 (old school calculator)
[2]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[3]: https://www.gnu.org/software/bc/
[4]: https://raw.githubusercontent.com/bluebat/.bash/master/bashbc.sh
[5]: http://phodd.net/gnu-bc/
[6]: https://www.gnu.org/software/bc/manual/html_mono/bc.html

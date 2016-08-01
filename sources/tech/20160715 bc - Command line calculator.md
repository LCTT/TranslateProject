bc: Command line calculator
============================

![](https://cdn.fedoramagazine.org/wp-content/uploads/2016/07/bc-calculator-945x400.jpg)

If you run a graphical desktop environment, you probably point and click your way to a calculator when you need one. The Fedora Workstation, for example, includes the Calculator tool. It features several different operating modes that allow you to do, for example, complex math or financial calculations. But did you know the command line also offers a similar calculator called bc?

The bc utility gives you everything you expect from a scientific, financial, or even simple calculator. What’s more, it can be scripted from the command line if needed. This allows you to use it in shell scripts, in case you need to do more complex math.

Because bc is used by some other system software, like CUPS printing services, it’s probably installed on your Fedora system already. You can check with this command:

```
dnf list installed bc
```

If you don’t see it for some reason, you can install the package with this command:

```
sudo dnf install bc
```

### Doing simple math with bc

One way to use bc is to enter the calculator’s own shell. There you can run many calculations in a row. When you enter, the first thing that appears is a notice about the program:

```
$ bc
bc 1.06.95
Copyright 1991-1994, 1997, 1998, 2000, 2004, 2006 Free Software Foundation, Inc.
This is free software with ABSOLUTELY NO WARRANTY.
For details type `warranty'.
```

Now you can type in calculations or commands, one per line:

```
1+1
```

The calculator helpfully answers:

```
2
```

You can perform other commands here. You can use addition (+), subtraction (-), multiplication (*), division (/), parentheses, exponents (^), and so forth. Note that the calculator respects all expected conventions such as order of operations. Try these examples:

```
(4+7)*2
4+7*2
```

To exit, send the “end of input” signal with the key combination Ctrl+D.

Another way is to use the echo command to send calculations or commands. Here’s the calculator equivalent of “Hello, world,” using the shell’s pipe function (|) to send output from echo into bc:

```
echo '1+1' | bc
```

You can send more than one calculation using the shell pipe, with a semicolon to separate entries. The results are returned on separate lines.

```
echo '1+1; 2+2' | bc
```

### Scale

The bc calculator uses the concept of scale, or the number of digits after a decimal point, in some calculations. The default scale is 0. Division operations always use the scale setting. So if you don’t set scale, you may get unexpected answers:

```
echo '3/2' | bc
echo 'scale=3; 3/2' | bc
```

Multiplication uses a more complex decision for scale:

```
echo '3*2' | bc
echo '3*2.0' | bc
```

Meanwhile, addition and subtraction are more as expected:

```
echo '7-4.15' | bc
```

### Other base number systems

Another useful function is the ability to use number systems other than base-10 (decimal). For instance, you can easily do hexadecimal or binary math. Use the ibase and obase commands to set input and output base systems between base-2 and base-16. Remember that once you use ibase, any number you enter is expected to be in the new declared base.

To do hexadecimal to decimal conversions or math, you can use a command like this. Note the hexadecimal digits above 9 must be in uppercase (A-F):

```
echo 'ibase=16; A42F' | bc
echo 'ibase=16; 5F72+C39B' | bc
```

To get results in hexadecimal, set the obase as well:

```
echo 'obase=16; ibase=16; 5F72+C39B' | bc
```

Here’s a trick, though. If you’re doing these calculations in the shell, how do you switch back to input in base-10? The answer is to use ibase, but you must set it to the equivalent of decimal number 10 in the current input base. For instance, if ibase was set to hexadecimal, enter:

```
ibase=A
```

Once you do this, all input numbers are now decimal again, so you can enter obase=10 to reset the output base system.

### Conclusion

This is only the beginning of what bc can do. It also allows you to define functions, variables, and loops for complex calculations and programs. You can save these programs as text files on your system to run whenever you need. You can find numerous resources on the web that offer examples and additional function libraries. Happy calculating!



--------------------------------------------------------------------------------

via: http://www.tecmint.com/mandatory-access-control-with-selinux-or-apparmor-linux/

作者：[Paul W. Frields][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[1]: http://phodd.net/gnu-bc/

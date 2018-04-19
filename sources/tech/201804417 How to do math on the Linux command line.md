How to do math on the Linux command line
======

![](https://images.techhive.com/images/article/2014/12/math_blackboard-100534564-large.jpg)
Can you do math on the Linux command line? You sure can! In fact, there are quite a few commands that can make the process easy and some you might even find interesting. Let's look at some very useful commands and syntax for command line math.

### expr

First and probably the most obvious and commonly used command for performing mathematical calculations on the command line is the **expr** (expression) command. It can manage addition, subtraction, division, and multiplication. It can also be used to compare numbers. Here are some examples:

#### Incrementing a variable
```
$ count=0
$ count=`expr $count + 1`
$ echo $count
1

```

#### Performing a simple calculations
```
$ expr 11 + 123
134
$ expr 134 / 11
12
$ expr 134 - 11
123
$ expr 11 * 123
expr: syntax error      <== oops!
$ expr 11 \* 123
1353
$ expr 20 % 3
2

```

Notice that you have to use a \ character in front of * to avoid the syntax error. The % operator is for modulo calculations.

Here's a slightly more complex example:
```
participants=11
total=156
share=`expr $total / $participants`
remaining=`expr $total - $participants \* $share`
echo $share
14
echo $remaining
2

```

If we have 11 participants in some event and 156 prizes to distribute, each participant's fair share of the take is 14, leaving 2 in the pot.

#### Making comparisons

Now let's look at the logic for comparisons. These statements may look a little odd at first. They are not setting values, but only comparing the numbers. What **expr** is doing in the examples below is determining whether the statements are true. If the result is 1, the statement is true; otherwise, it's false.
```
$ expr 11 = 11
1
$ expr 11 = 12
0

```

Read them as "Does 11 equal 11?" and "Does 11 equal 12?" and you'll get used to how this works. Of course, no one would be asking if 11 equals 11 on the command line, but they might ask if $age equals 11.
```
$ age=11
$ expr $age = 11
1

```

If you put the numbers in quotes, you'd actually be doing a string comparison rather than a numeric one.
```
$ expr "11" = "11"
1
$ expr "eleven" = "11"
0

```

In the following examples, we're asking whether 10 is greater than 5 and, then, whether it's greater than 99.
```
$ expr 10 \> 5
1
$ expr 10 \> 99
0

```

Of course, having true comparisons resulting in 1 and false resulting in 0 goes against what we generally expect on Linux systems. The example below shows that using **expr** in this kind of context doesn't work because **if** works with the opposite orientation (0=true).
```
#!/bin/bash

echo -n "Cost to us> "
read cost
echo -n "Price we're asking> "
read price

if [ `expr $price \> $cost` ]; then
 echo "We make money"
else
 echo "Don't sell it"
fi

```

Now, let's run this script:
```
$ ./checkPrice
Cost to us> 11.50
Price we're asking> 6
We make money

```

That sure isn't going to help with sales! With a small change, this would work as we'd expect:
```
#!/bin/bash

echo -n "Cost to us> "
read cost
echo -n "Price we're asking> "
read price

if [ `expr $price \> $cost` == 1 ]; then
 echo "We make money"
else
 echo "Don't sell it"
fi

```

### factor

The **factor** command works just like you'd probably expect. You feed it a number, and it tells you what its factors are.
```
$ factor 111
111: 3 37
$ factor 134
134: 2 67
$ factor 17894
17894: 2 23 389
$ factor 1987
1987: 1987

```

NOTE: The factor command didn't get very far on factoring that last value because 1987 is a **prime number**.

### jot

The **jot** command allows you to create a list of numbers. Provide it with the number of values you want to see and the number that you want to start with.
```
$ jot 8 10
10
11
12
13
14
15
16
17

```

You can also use **jot** like this. Here we're asking it to decrease the numbers by telling it we want to stop when we get to 2:
```
$ jot 8 10 2
10
9
8
7
5
4
3
2

```

The **jot** command can be useful if you want to iterate through a series of numbers to create a list for some other purpose.
```
$ for i in `jot 7 17`; do echo April $i; done
April 17
April 18
April 19
April 20
April 21
April 22
April 23

```

### bc

The **bc** command is probably one of the best tools for doing calculations on the command line. Enter the calculation that you want performed, and pipe it to the command like this:
```
$ echo "123.4+5/6-(7.89*1.234)" | bc
113.664

```

Notice that **bc** doesn't shy away from precision and that the string you need to enter is fairly straightforward. It can also make comparisons, handle Booleans, and calculate square roots, sines, cosines, tangents, etc.
```
$ echo "sqrt(256)" | bc
16
$ echo "s(90)" | bc -l
.89399666360055789051

```

In fact, **bc** can even calculate pi. You decide how many decimal points you want to see:
```
$ echo "scale=5; 4*a(1)" | bc -l
3.14156
$ echo "scale=10; 4*a(1)" | bc -l
3.1415926532
$ echo "scale=20; 4*a(1)" | bc -l
3.14159265358979323844
$ echo "scale=40; 4*a(1)" | bc -l
3.1415926535897932384626433832795028841968

```

And **bc** isn't just for receiving data through pipes and sending answers back. You can also start it interactively and enter the calculations you want it to perform. Setting the scale (as shown below) determines how many decimal places you'll see.
```
$ bc
bc 1.06.95
Copyright 1991-1994, 1997, 1998, 2000, 2004, 2006 Free Software Foundation, Inc.
This is free software with ABSOLUTELY NO WARRANTY.
For details type `warranty'.
scale=2
3/4
.75
2/3
.66
quit

```

Using **bc** , you can also convert numbers between different bases. The **obase** setting determines the output base.
```
$ bc
bc 1.06.95
Copyright 1991-1994, 1997, 1998, 2000, 2004, 2006 Free Software Foundation, Inc.
This is free software with ABSOLUTELY NO WARRANTY.
For details type `warranty'.
obase=16
16      <=== entered
10      <=== response
256     <=== entered
100     <=== response
quit

```

One of the easiest ways to convert between hex and decimal is to use **bc** like this:
```
$ echo "ibase=16; F2" | bc
242
$ echo "obase=16; 242" | bc
F2

```

In the first example above, we're converting from hex to decimal by setting the input base (ibase) to hex (base 16). In the second, we're doing the reverse by setting the outbut base (obase) to hex.

### Easy bash math

With sets of double-parentheses, we can do some easy math in bash. In the examples below, we create a variable and give it a value and then perform addition, decrement the result, and then square the remaining value.
```
$ ((e=11))
$ (( e = e + 7 ))
$ echo $e
18

$ ((e--))
$ echo $e
17

$ ((e=e**2))
$ echo $e
289

```

The arithmetic operators allow you to:
```
+ -     Add and subtract
++ --   Increment and decrement
* / %   Multiply, divide, find remainder
^       Get exponent

```

You can also use both logical and boolean operators:
```
$ ((x=11)); ((y=7))
$ if (( x > y )); then
> echo "x > y"
> fi
x > y

$ ((x=11)); ((y=7)); ((z=3))
$ if (( x > y )) >> (( y > z )); then
> echo "letters roll downhill"
> fi
letters roll downhill

```

or if you prefer ...
```
$ if [ x > y ] << [ y > z ]; then echo "letters roll downhill"; fi
letters roll downhill

```

Now let's raise 2 to the 3rd power:
```
$ echo "2 ^ 3"
2 ^ 3
$ echo "2 ^ 3" | bc
8

```

### Wrap-up

There are sure a lot of different ways to work with numbers and perform calculations on the command line on Linux systems. I hope you picked up a new trick or two by reading this post.

Join the Network World communities on [Facebook][1] and [LinkedIn][2] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3268964/linux/how-to-do-math-on-the-linux-command-line.html

作者：[Sandra Henry-Stocker][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]:https://www.facebook.com/NetworkWorld/
[2]:https://www.linkedin.com/company/network-world

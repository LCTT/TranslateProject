[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Generating numeric sequences with the Linux seq command)
[#]: via: (https://www.networkworld.com/article/3511954/generating-numeric-sequences-with-the-linux-seq-command.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Generating numeric sequences with the Linux seq command
======
The Linux seq command can generate lists of numbers and at lightning speed. It's easy to use and flexible, too.
[Jamie][1] [(CC BY 2.0)][2]

One of the easiest ways to generate a list of numbers in Linux is to use the **seq** (sequence) command. In its simplest form, **seq** will take a single number and then list all the numbers from 1 to that number. For example:

```
$ seq 5
1
2
3
4
5
```

Unless directed otherwise, **seq** always starts with 1. You can start a sequence with a different number by inserting it before the final number.

```
$ seq 3 5
3
4
5
```

### Specifying an increment

You can also specify an increment. Say you want to list multiples of 3. Specify your starting point (first 3 in this example), increment (second 3) and end point (18).

[][3]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][3]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

```
$ seq 3 3 18
3
6
9
12
15
18
```

You can elect to go from larger to smaller numbers by using a negative increment (i.e., a decrement).

```
$ seq 18 -3 3
18
15
12
9
6
3
```

The **seq** command is also very fast. You can probably generate a list of a million numbers in under 10 seconds.

Advertisement

```
$ time seq 1000000
1
2
3
…
…
999998
999999
1000000

real    0m9.290s  <== 9+ seconds
user    0m0.020s
sys     0m0.899s
```

## Using a separator

Another very useful option is to use a separator. Instead of listing a single number on each line, you can insert commas, colons or some other characters. The -s option followed by the character you wish to use.

```
$ seq -s: 3 3 18
3:6:9:12:15:18
```

In fact, if you simply want your numbers to be listed on a single line, you can use a blank as your separator in place of the default linefeed.

**[ Also see [Invaluable tips and tricks for troubleshooting Linux][4]. ]**

```
$ seq -s' '  3 3 18
3 6 9 12 15 18
```

### Getting to the math

It may seem like a big leap to go from generating a sequence of numbers to doing math, but given the right separators, **seq** can easily prepare calculations that you can pass to **bc**. For example:

```
$ seq -s* 5 | bc
120
```

What is going on in this command? Let’s take a look. First, **seq** is generating a list of numbers and using * as the separator.

```
$ seq -s* 5
1*2*3*4*5
```

It’s then passing the string to the calculator (**bc**) which promptly multiplies the numbers. And you can do a fairly extensive calculation in a fraction of a second.

```
$ time seq -s* 117 | bc
39699371608087208954019596294986306477904063601683223011297484643104\
22041758630649341780708631240196854767624444057168110272995649603642\
560353748940315749184568295424000000000000000000000000000

real    0m0.003s
user    0m0.004s
sys     0m0.000s
```

### Limitations

You only get to choose one separator, so your calculations will be very limited. Use **bc** by itself for more complicated math. In addition, **seq** only works with numbers. To generate a sequence of single letters, use a command like this instead:

```
$ echo {a..g}
a b c d e f g
```

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3511954/generating-numeric-sequences-with-the-linux-seq-command.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://creativecommons.org/licenses/by/2.0/
[2]: https://creativecommons.org/licenses/by/2.0/legalcode
[3]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[4]: https://www.networkworld.com/article/3242170/linux/invaluable-tips-and-tricks-for-troubleshooting-linux.html
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world

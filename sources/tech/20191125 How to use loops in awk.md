[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to use loops in awk)
[#]: via: (https://opensource.com/article/19/11/loops-awk)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

How to use loops in awk
======
Learn how to use different types of loops to run commands on a record
multiple times.
![arrows cycle symbol for failing faster][1]

Awk scripts have three main sections: the optional BEGIN and END functions and the functions you write that are executed on each record. In a way, the main body of an awk script is a loop, because the commands in the functions run for each record. However, sometimes you want to run commands on a record more than once, and for that to happen, you must write a loop.

There are several kinds of loops, each serving a unique purpose.

### While loop

A **while** loop tests a condition and performs commands _while_ the test returns _true_. Once a test returns _false_, the loop is broken.


```
#!/bin/awk -f

BEGIN {
        # Print the squares from 1 to 10

    i=1;
    while (i &lt;= 10) {
        print "The square of ", i, " is ", i*i;
        i = i+1;
    }
exit;
}
```

In this simple example, awk prints the square of whatever integer is contained in the variable _i_. The **while (i &lt;= 10)** phrase tells awk to perform the loop only as long as the value of _i_ is less than or equal to 10. After the final iteration (while _i_ is 10), the loop ends.

### Do while loop

The **do while** loop performs commands after the keyword **do**. It performs a test afterward to determine whether the stop condition has been met. The commands are repeated only _while_ the test returns true (that is, the end condition has _not_ been met). If a test fails, the loop is broken because the end condition has been met.


```
#!/usr/bin/awk -f
BEGIN {

        i=2;
        do {
                print "The square of ", i, " is ", i*i;
                i = i + 1
        }
        while (i &lt; 10)

exit;
}
```

### For loops

There are two kinds of **for** loops in awk.

One kind of **for** loop initializes a variable, performs a test, and increments the variable together, performing commands while the test is true.


```
#!/bin/awk -f

BEGIN {
    for (i=1; i &lt;= 10; i++) {
        print "The square of ", i, " is ", i*i;
    }
exit;
}
```

Another kind of **for** loop sets a variable to successive indices of an array, performing a collection of commands for each index. In other words, it uses an array to "collect" data from a record.

This example implements a simplified version of the Unix command **uniq**. By adding a list of strings into an array called **a** as a key and incrementing the value each time the same key occurs, you get a count of the number of times a string appears (like the **\--count** option of **uniq**). If you print the keys of the array, you get every string that appears one or more times.

For example, using the demo file **colours.txt** (from the previous articles):


```
name       color  amount
apple      red    4
banana     yellow 6
raspberry  red    99
strawberry red    3
grape      purple 10
apple      green  8
plum       purple 2
kiwi       brown  4
potato     brown  9
pineapple  yellow 5
```

Here is a simple version of **uniq -c** in awk form:


```
#! /usr/bin/awk -f

NR != 1 {
    a[$2]++
}
END {
    for (key in a) {
                print a[key] " " key
    }
}
```

The third column of the sample data file contains the number of items listed in the first column. You can use an array and a **for** loop to tally the items in the third column by color:


```
#! /usr/bin/awk -f

BEGIN {
    FS=" ";
    OFS="\t";
    print("color\tsum");
}
NR != 1 {
    a[$2]+=$3;
}
END {
    for (b in a) {
        print b, a[b]
    }
}
```

As you can see, you are also printing a header column in the BEFORE function (which always happens only once) prior to processing the file.

### Loops

Loops are a vital part of any programming language, and awk is no exception. Using loops can help you control how your awk script runs, what information it's able to gather, and how it processes your data. Our next article will cover switch statements, **continue**, and **next**.

* * *

Would you rather listen to this article? It was adapted from an episode of [Hacker Public Radio][2], a community technology podcast by hackers, for hackers.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/loops-awk

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/fail_progress_cycle_momentum_arrow.png?itok=q-ZFa_Eh (arrows cycle symbol for failing faster)
[2]: http://hackerpublicradio.org/eps.php?id=2330

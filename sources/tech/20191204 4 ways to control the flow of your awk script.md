[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 ways to control the flow of your awk script)
[#]: via: (https://opensource.com/article/19/12/control-awk-script)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

4 ways to control the flow of your awk script
======
Learn to use switch statements and the break, continue, and next
commands to control awk scripts.
![JavaScript in Vim][1]

There are many ways to control the flow of an awk script, including [loops][2], **switch** statements and the **break**, **continue**, and **next** commands.

### Sample data

Create a sample data set called **colours.txt** and copy this content into it:


```
name       color  amount
apple      red    4
banana     yellow 6
strawberry red    3
raspberry  red    99
grape      purple 10
apple      green  8
plum       purple 2
kiwi       brown  4
potato     brown  9
pineapple  yellow 5
```

### Switch statements

The **switch** statement is a feature specific to GNU awk, so you can only use it with **gawk**. If your system or your target system doesn't have **gawk**, then you should not use a switch statement.

The **switch** statement in **gawk** is similar to the one in C and many other languages. The syntax is:


```
switch (expression) {
        case VALUE:
                &lt;do something here&gt;
        [...]
        default:
                &lt;do something here&gt;
}
```

The **expression** part can be any awk expression that returns a numeric or string result. The **VALUE** part (after the word **case**) is a numeric or string constant or a regular expression.

When a **switch** statement runs, the _expression_ is evaluated, and the result is matched against each case value. If there's a match, then the code contained within a case definition is executed. If there's no match in any case definition, then the default statement is executed.

The keyword **break** is at the end of the code in each case definition to break the loop. Without **break**, awk would continue to search for matching case values.

Here's an example **switch** statement:


```
#!/usr/bin/awk -f
#
# Example of the use of 'switch' in GNU Awk.

NR &gt; 1 {
    printf "The %s is classified as: ",$1

    switch ($1) {
        case "apple":
            print "a fruit, pome"
            break
        case "banana":
        case "grape":
        case "kiwi":
            print "a fruit, berry"
            break
                case "raspberry":
                        print "a computer, pi"
                        break
        case "plum":
            print "a fruit, drupe"
            break
        case "pineapple":
            print "a fruit, fused berries (syncarp)"
            break
        case "potato":
            print "a vegetable, tuber"
            break
        default:
            print "[unclassified]"
    }
}
```

This script notably ignores the first line of the file, which in the case of the sample data is just a header. It does this by operating only on records with an index number greater than 1. On all other records, this script compares the contents of the first field (**$1**, as you know from previous articles) to the value of each **case** definition. If there's a match, the **print** function is used to print the botanical classification of the entry. If there are no matches, then the **default** instance prints **"[unclassified]"**.

The banana, grape, and kiwi are all botanically classified as a berry, so there are three **case** definitions associated with one **print** result.

Run the script on the **colours.txt** sample file, and you should get this:


```
The apple is classified as: a fruit, pome
The banana is classified as: a fruit, berry
The strawberry is classified as: [unclassified]
The raspberry is classified as: a computer, pi
The grape is classified as: a fruit, berry
The apple is classified as: a fruit, pome
The plum is classified as: a fruit, drupe
The kiwi is classified as: a fruit, berry
The potato is classified as: a vegetable, tuber
The pineapple is classified as: a fruit, fused berries (syncarp)
```

### Break

The **break** statement is mainly used for the early termination of a **for**, **while**, or **do-while** loop or a **switch** statement. In a loop, **break** is often used where it's not possible to determine the number of iterations of the loop beforehand. Invoking **break** terminates the enclosing loop (which is relevant when there are nested loops or loops within loops).

This example, straight out of the [GNU awk manual][3], shows a method of finding the smallest divisor. Read the additional comments for a clear understanding of how the code works:


```
#!/usr/bin/awk -f

{
    num = $1

    # Make an infinite FOR loop
    for (divisor = 2; ; divisor++) {

        # If num is divisible by divisor, then break
        if (num % divisor == 0) {
            printf "Smallest divisor of %d is %d\n", num, divisor
            break
        }

        # If divisor has gotten too large, the number has no
        # divisor, so is a prime
        if (divisor * divisor &gt; num) {
            printf "%d is prime\n", num
            break
        }
    }
}
```

Try running the script to see its results:


```
    $ echo 67 | ./divisor.awk
    67 is prime
    $ echo 69 | ./divisor.awk
    Smallest divisor of 69 is 3
```

As you can see, even though the script starts out with an explicit _infinite_ loop with no end condition, the **break** function ensures that the script eventually terminates.

### Continue

The **continue** function is similar to **break**. It can be used in a **for**, **while**, or **do-while** loop (it's not relevant to a **switch** statements, though). Invoking **continue** skips the rest of the enclosing loop and begins the next cycle.

Here's another good example from the GNU awk manual to demonstrate a possible use of **continue**:


```
#!/usr/bin/awk -f

# Loop, printing numbers 0-20, except 5

BEGIN {
    for (x = 0; x &lt;= 20; x++) {
        if (x == 5)
            continue
        printf "%d ", x
    }
    print ""
}
```

This script analyzes the value of **x** before printing anything. If the value is exactly 5, then **continue** is invoked, causing the **printf** line to be skipped, but leaves the loop unbroken. Try the same code but with **break** instead to see the difference.

### Next

This statement is not related to loops like **break** and **continue** are. Instead, **next** applies to the main record processing cycle of awk: the functions you place between the BEGIN and END functions. The **next** statement causes awk to stop processing the _current input record_ and to move to the next one.

As you know from the earlier articles in this series, awk reads records from its input stream and applies rules to them. The **next** statement stops the execution of rules for the current record and moves to the next one.

Here's an example of **next** being used to "hold" information upon a specific condition:


```
#!/usr/bin/awk -f

# Ignore the header
NR == 1 { next }

# If field 2 (colour) is less than 6
# characters, then save it with its
#  line number and skip it

length($2) &lt; 6 {
    skip[NR] = $0
    next
}

# It's not the header and
# the colour name is &gt; 6 characters,
# so print the line
{
    print
}

# At the end, show what was skipped
END {
    printf "\nSkipped:\n"
    for (n in skip)
        print n": "skip[n]
}
```

This sample uses **next** in the first rule to avoid the first line of the file, which is a header row. The second rule skips lines when the color name is less than six characters long, but it also saves that line in an array called **skip**, using the line number as the key (also known as the _index_).

The third rule prints anything it sees, but it is not invoked if either rule 1 or rule 2 causes it to be skipped.

Finally, at the end of all the processing, the **END** rule prints the contents of the array.

Run the sample script on the **colours.txt** file from above (and previous articles):


```
$ ./next.awk colours.txt
banana     yellow 6
grape      purple 10
plum       purple 2
pineapple  yellow 5

Skipped:
2: apple      red    4
4: strawberry red    3
6: apple      green  8
8: kiwi       brown  4
9: potato     brown  9
```

### Control freak

In summary, **switch**, **continue**, **next**, and **break** are important preemptive exceptions to awk rules that provide greater control of your script. You don't have to use them directly; often, you can gain the same logic through other means, but they're great convenience functions that make the coder's life a lot easier. The next article in this series covers the **printf** statement.

* * *

Would you rather listen to this article? It was adapted from an episode of [Hacker Public Radio][4], a community technology podcast by hackers, for hackers.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/control-awk-script

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/javascript_vim.jpg?itok=mqkAeakO (JavaScript in Vim)
[2]: https://opensource.com/article/19/11/loops-awk
[3]: https://www.gnu.org/software/gawk/manual/
[4]: http://hackerpublicradio.org/eps.php?id=2438

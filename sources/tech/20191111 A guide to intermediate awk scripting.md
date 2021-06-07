[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A guide to intermediate awk scripting)
[#]: via: (https://opensource.com/article/19/11/intermediate-awk-scripting)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

A guide to intermediate awk scripting
======
Learn how to structure commands into executable scripts.
![Coding on a computer][1]

This article explores awk's capabilities, which are easier to use now that you know how to structure your command into an executable script.

### Logical operators and conditionals

You can use the logical operators **and** (written **&amp;&amp;**) and **or** (written **||**) to add specificity to your conditionals.

For example, to select and print only records with the string "purple" in the second column _and_ an amount less than five in the third column:


```
`$2 == "purple" && $3 < 5 {print $1}`
```

If a record has "purple" in column two but a value greater than five in column three, then it is _not_ selected. Similarly, if a record matches column three's requirement but lacks "purple" in column two, it is also _not_ selected.

### Next command

Say you want to select every record in your file where the amount is greater than or equal to eight and print a matching record with two asterisks (******). You also want to flag every record with a value between five (inclusive) and eight with only one asterisk (*****). There are a few ways to do this, and one way is to use the **next** command to instruct awk that after it takes an action, it should stop scanning and proceed to the _next_ record.

Here's an example:


```
NR == 1 {
  print $0;
  next;
}

$3 &gt;= 8 {
  printf "%s\t%s\n", $0, "**";
  next;
}

$3 &gt;= 5 {
  printf "%s\t%s\n", $0, "*";
  next;
}

$3 &lt; 5 {
  print $0;
}
```

### BEGIN command

The **BEGIN** command lets you print and set variables before awk starts scanning a text file. For instance, you can set the input and output field separators inside your awk script by defining them in a **BEGIN** statement. This example adapts the simple script from the previous article for a file with fields delimited by commas instead of whitespace:


```
#!/usr/bin/awk -f
#
# Print each record EXCEPT
# IF the first record contains "raspberry",
# THEN replace "red" with "pi"

BEGIN {
        FS=",";
}

$1 == "raspberry" {
        gsub(/red/,"pi")
}
```

### END command

The **END** command, like **BEGIN**, allows you to perform actions in awk after it completes its scan through the text file you are processing. If you want to print cumulative results of some value in all records, you can do that only after all records have been scanned and processed.

The **BEGIN** and **END** commands run only once each. All rules between them run zero or more times on _each record_. In other words, most of your awk script is a loop that is executed at every new line of the text file you're processing, with the exception of the **BEGIN** and **END** rules, which run before and after the loop.

Here is an example that wouldn't be possible without the **END** command. This script accepts values from the output of the **df** Unix command and increments two custom variables (**used** and **available**) with each new record.


```
$1 != "tempfs" {
    used += $3;
    available += $4;
}

END {
    printf "%d GiB used\n%d GiB available\n", used/2^20, available/2^20;
}
```

Save the script as **total.awk** and try it:


```
`df -l | awk -f total.awk`
```

The **used** and **available** variables act like variables in many other programming languages. You create them arbitrarily and without declaring their type, and you add values to them at will. At the end of the loop, the script adds the records in the respective columns together and prints the totals.

### Math

As you can probably tell from all the logical operators and casual calculations so far, awk does math quite naturally. This arguably makes it a very useful calculator for your terminal. Instead of struggling to remember the rather unusual syntax of **bc**, you can just use awk along with its special **BEGIN** function to avoid the requirement of a file argument:


```
$ awk 'BEGIN { print 2*21 }'
42
$ awk 'BEGIN {print 8*log(4) }'
11.0904
```

Admittedly, that's still a lot of typing for simple (and not so simple) math, but it wouldn't take much effort to write a frontend, which is an exercise for you to explore.

* * *

_This article is adapted from an episode of [Hacker Public Radio][2], a community technology podcast._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/intermediate-awk-scripting

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/lnrCoder)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: http://hackerpublicradio.org/eps.php?id=2129

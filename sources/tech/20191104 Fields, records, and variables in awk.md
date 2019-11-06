[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Fields, records, and variables in awk)
[#]: via: (https://opensource.com/article/19/11/fields-records-variables-awk)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Fields, records, and variables in awk
======
In the second article in this intro to awk series, learn about fields,
records, and some powerful awk variables.
![Man at laptop on a mountain][1]

Awk comes in several varieties: There is the original **awk**, written in 1977 at AT&amp;T Bell Laboratories, and several reimplementations, such as **mawk**, **nawk**, and the one that ships with most Linux distributions, GNU awk, or **gawk**. On most Linux distributions, awk and gawk are synonyms referring to GNU awk, and typing either invokes the same awk command. See the [GNU awk user's guide][2] for the full history of awk and gawk.

The [first article][3] in this series showed that awk is invoked on the command line with this syntax:


```
`$ awk [options] 'pattern {action}' inputfile`
```

Awk is the command, and it can take options (such as **-F** to define the field separator). The action you want awk to perform is contained in single quotes, at least when it's issued in a terminal. To further emphasize which part of the awk command is the action you want it to take, you can precede your program with the **-e** option (but it's not required):


```
$ awk -F, -e '{print $2;}' colours.txt
yellow
blue
green
[...]
```

### Records and fields

Awk views its input data as a series of _records_, which are usually newline-delimited lines. In other words, awk generally sees each line in a text file as a new record. Each record contains a series of _fields_. A field is a component of a record delimited by a _field separator_.

By default, awk sees whitespace, such as spaces, tabs, and newlines, as indicators of a new field. Specifically, awk treats multiple _space_ separators as one, so this line contains two fields:


```
`raspberry red`
```

As does this one:


```
`tuxedo                  black`
```

Other separators are not treated this way. Assuming that the field separator is a comma, the following example record contains three fields, with one probably being zero characters long (assuming a non-printable character isn't hiding in that field):


```
`a,,b`
```

### The awk program

The _program_ part of an awk command consists of a series of rules. Normally, each rule begins on a new line in the program (although this is not mandatory). Each rule consists of a pattern and one or more actions:


```
`pattern { action }`
```

In a rule, you can define a pattern as a condition to control whether the action will run on a record. Patterns can be simple comparisons, regular expressions, combinations of the two, and more.

For instance, this will print a record _only_ if it contains the word "raspberry":


```
$ awk '/raspberry/ { print $0 }' colours.txt
raspberry red 99
```

If there is no qualifying pattern, the action is applied to every record.

Also, a rule can consist of only a pattern, in which case the entire record is written as if the action was **{ print }**.

Awk programs are essentially _data-driven_ in that actions depend on the data, so they are quite a bit different from programs in many other programming languages.

### The NF variable

Each field has a variable as a designation, but there are special variables for fields and records, too. The variable **NF** stores the number of fields awk finds in the current record. This can be printed or used in tests. Here is an example using the [text file][3] from the previous article:


```
$ awk '{ print $0 " (" NF ")" }' colours.txt
name       color  amount (3)
apple      red    4 (3)
banana     yellow 6 (3)
[...]
```

Awk's **print** function takes a series of arguments (which may be variables or strings) and concatenates them together. This is why, at the end of each line in this example, awk prints the number of fields as an integer enclosed by parentheses.

### The NR variable

In addition to counting the fields in each record, awk also counts input records. The record number is held in the variable **NR**, and it can be used in the same way as any other variable. For example, to print the record number before each line:


```
$ awk '{ print NR ": " $0 }' colours.txt
1: name       color  amount
2: apple      red    4
3: banana     yellow 6
4: raspberry  red    3
5: grape      purple 10
[...]
```

Note that it's acceptable to write this command with no spaces other than the one after **print**, although it's more difficult for a human to parse:


```
`$ awk '{print NR": "$0}' colours.txt`
```

### The printf() function

For greater flexibility in how the output is formatted, you can use the awk **printf()** function. This is similar to **printf** in C, Lua, Bash, and other languages. It takes a _format_ argument followed by a comma-separated list of items. The argument list may be enclosed in parentheses.


```
`$ printf format, item1, item2, ...`
```

The format argument (or _format string_) defines how each of the other arguments will be output. It uses _format specifiers_ to do this, including **%s** to output a string and **%d** to output a decimal number. The following **printf** statement outputs the record followed by the number of fields in parentheses:


```
$ awk 'printf "%s (%d)\n",$0,NF}' colours.txt
name       color  amount (3)
raspberry  red    4 (3)
banana     yellow 6 (3)
[...]
```

In this example, **%s (%d)** provides the structure for each line, while **$0,NF** defines the data to be inserted into the **%s** and **%d** positions. Note that, unlike with the **print** function, no newline is generated without explicit instructions. The escape sequence **\n** does this.

### Awk scripting

All of the awk code in this article has been written and executed in an interactive Bash prompt. For more complex programs, it's often easier to place your commands into a file or _script_. The option **-f FILE** (not to be confused with **-F**, which denotes the field separator) may be used to invoke a file containing a program.

For example, here is a simple awk script. Create a file called **example1.awk** with this content:


```
/^a/ {print "A: " $0}
/^b/ {print "B: " $0}
```

It's conventional to give such files the extension **.awk** to make it clear that they hold an awk program. This naming is not mandatory, but it gives file managers and editors (and you) a useful clue about what the file is.

Run the script:


```
$ awk -f example1.awk colours.txt
A: raspberry  red    4
B: banana     yellow 6
A: apple      green  8
```

A file containing awk instructions can be made into a script by adding a **#!** line at the top and making it executable. Create a file called **example2.awk** with these contents:


```
#!/usr/bin/awk -f
#
# Print all but line 1 with the line number on the front
#

NR &gt; 1 {
    printf "%d: %s\n",NR,$0
}
```

Arguably, there's no advantage to having just one line in a script, but sometimes it's easier to execute a script than to remember and type even a single line. A script file also provides a good opportunity to document what a command does. Lines starting with the **#** symbol are comments, which awk ignores.

Grant the file executable permission:


```
`$ chmod u+x example2.awk`
```

Run the script:


```
$ ./example2.awk colours.txt
2: apple      red    4
2: banana     yellow 6
4: raspberry red    3
5: grape      purple 10
[...]
```

An advantage of placing your awk instructions in a script file is that it's easier to format and edit. While you can write awk on a single line in your terminal, it can get overwhelming when it spans several lines.

### Try it

You now know enough about how awk processes your instructions to be able to write a complex awk program. Try writing an awk script with more than one rule and at least one conditional pattern. If you want to try more functions than just **print** and **printf**, refer to [the gawk manual][4] online.

Here's an idea to get you started:


```
#!/usr/bin/awk -f
#
# Print each record EXCEPT
# IF the first record contains "raspberry",
# THEN replace "red" with "pi"

$1 == "raspberry" {
        gsub(/red/,"pi")
}

{ print }
```

Try this script to see what it does, and then try to write your own.

The next article in this series will introduce more functions for even more complex (and useful!) scripts.

* * *

_This article is adapted from an episode of [Hacker Public Radio][5], a community technology podcast._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/fields-records-variables-awk

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_laptop_code_programming_mountain_view.jpg?itok=yx5buqkr (Man at laptop on a mountain)
[2]: https://www.gnu.org/software/gawk/manual/html_node/History.html#History
[3]: https://opensource.com/article/19/10/intro-awk
[4]: https://www.gnu.org/software/gawk/manual/
[5]: http://hackerpublicradio.org/eps.php?id=2129

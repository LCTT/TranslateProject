[#]: collector: (lujun9972)
[#]: translator: (luuming)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The many faces of awk)
[#]: via: (https://www.networkworld.com/article/3454979/the-many-faces-of-awk.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

The many faces of awk
======
The awk command provides a lot more than simply selecting fields from input strings, including pulling out columns of data, printing simple text, evaluating content – even doing math.
Thinkstock

If you only use **awk** when you need to select a specific field from lines of text, you might be missing out on a lot of other services that the command can provide. In this post, we'll look at this simple use along with some of the other things that **awk** can do for you and provide some examples.

### Plucking out columns of data

The easiest and most commonly used service that **awk** provides is selecting specific fields from files or from data that is piped to it. With the default of using white space as a field separator, this is very simple.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][1]

```
$ echo one two three four five | awk ‘{print $4}’
four
$ who | awk ‘{print $1}’
jdoe
fhenry
```

White space is any sequence of blanks and tabs. In the commands shown above, **awk** is extracting just the fourth and first fields from the data provided.

[][2]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][2]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

Awk can also pull text from files by just adding the name of the file after the **awk** command.

```
$ awk '{print $1,$5,$NF}' HelenKellerQuote
The beautiful heart.
```

In this case, **awk** has picked out the first, fifth and last words in the single line of test.

The **$NF** specification in the command picks the last piece of text on each line. That is because **NF** represents the number of fields in a line (23) while **$NF** then represents the _value_ of that field ("heart."). The period is included because it's part of the final text string.

Fields can be printed in any order that you might find useful. In this example, we are rearranging the fields in **date** command output.

```
$ date | awk '{print $4,$3,$2}'
2019 Nov 22
```

If you omit the commas between the field designators in an **awk** command, the output will be pushed into a single string.

```
$ date | awk '{print $4 $3 $2}'
2019Nov21
```

If you replace the usual commas with hyphens, **awk** will attempt to subtract one field from another – probably not what you intended. It doesn't take the hyphens as characters to be inserted into the print output. Instead, it puts some of its mathematical prowess into play.

```
$ date | awk '{print $4-$3-$2}'
1997
```

In this case, it's subtracting 22 (the day of the month) from the year (2019) and simply ignoring "Nov".

If you want your output to be separated by something other than white space, you can specify your output separator with **OFS** (output field separator) like this:

```
$ date | awk '{OFS="-"; print $4,$3,$2}'
2019-Nov-22
```

### Printing simple text

You can also use **awk** to simply display some text. Of course, if all you want to do is print a line of text, you'd be better off using an **echo** command. On the other hand, as part of an **awk** script, printing some relevant text can be very useful. Here's a practically useless example:

```
$ awk 'BEGIN {print "Hello, World" }'
Hello, World
```

Here's a more sensible example in which adding a line of text to label your data can help identify what you're looking at:

```
$ who | awk 'BEGIN {print "Current logins:"} {print $1}'
Current logins:
shs
nemo
```

### Specifying a field separator

Not all input is going to be separated by white space. If your text is separated by some other character (e.g., commas, colons or semicolons), you can inform **awk** by using the **-F** (input separator) option as shown here:

```
$ cat testfile
a:b:c,d:e
$ awk -F : '{print $2,$3}' testfile
b c,d
```

Here's a more useful example – pulling a field from the colon-separated **/etc/passwd** file:

```
$ awk -F: '{print $1}' /etc/passwd | head -11
root
daemon
bin
sys
sync
games
man
lp
mail
news
uucp
```

### Evaluating content

You can also evaluate fields using **awk**. If you, for example, want to list only _user accounts_ in **/etc/passwd**, you can include a test for the 3rd field. Here we're only going after UIDs that are 1000 and above:

```
$ awk -F":" ' $3 >= 1000 ' /etc/passwd
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
shs:x:1000:1000:Sandra Henry-Stocker,,,:/home/shs:/bin/bash
nemo:x:1001:1001:Nemo,,,:/home/nemo:/usr/bin/zsh
dory:x:1002:1002:Dory,,,:/home/dory:/bin/bash
...
```

If you want to add a title for your listing, you can add a BEGIN clause:

```
$ awk -F":" 'BEGIN {print "user accounts:"} $3 >= 1000 ' /etc/passwd
user accounts:
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
shs:x:1000:1000:Sandra Henry-Stocker,,,:/home/shs:/bin/bash
nemo:x:1001:1001:Nemo,,,:/home/nemo:/usr/bin/zsh
dory:x:1002:1002:Dory,,,:/home/dory:/bin/bash
```

If you want more than one line in your title, you can separate your intended output lines with "\n" (newline characters).

```
$ awk -F":" 'BEGIN {print "user accounts\n============="} $3 >= 1000 ' /etc/passwd
user accounts
=============
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
shs:x:1000:1000:Sandra Henry-Stocker,,,:/home/shs:/bin/bash
nemo:x:1001:1001:Nemo,,,:/home/nemo:/usr/bin/zsh
dory:x:1002:1002:Dory,,,:/home/dory:/bin/bash
```

### Doing math with awk

**awk** provides a surprising mathematical ability and can calculate square roots, logs, tangents, etc.

Here are a couple examples:

```
$ awk 'BEGIN {print sqrt(2019)}'
44.9333
$ awk 'BEGIN {print log(2019)}'
7.61036
```

For more details on **awk**'s mathematical skills, check out [Doing math with awk][3].

### awk scripts

You can also write standalone scripts with **awk**. Here's an example that mimics one of the examples provided earlier, but also counts the number of users with accounts on the system.

```
#!/usr/bin/awk -f

# This line is a comment

BEGIN {
    printf "%s\n","User accounts:"
    print "=============="
    FS=":"
    n=0
}

# Now we'll run through the data
{
    if ($3 >= 1000) {
        print $1
        n ++
    }
}

END {
    print "=============="
    print n " accounts"
}
```

Notice how the BEGIN section, which is run only when the script starts, provides a heading, dictates the field separator and sets up a counter to start with 0. The script also includes an END section which only runs after all the lines in the text provided to the script have been processed. It displays the final count of lines that meet the specification in the middle section (third field is 1,000 or larger)

A long-standing Unix command, **awk** still provides very useful services and remains one of the reasons that I fell in love with Unix many decades ago.

To see **awk** in action, click below.

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3454979/the-many-faces-of-awk.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[2]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[3]: https://www.networkworld.com/article/2974753/doing-math-with-awk.html
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world

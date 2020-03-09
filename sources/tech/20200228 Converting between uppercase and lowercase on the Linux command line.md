[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Converting between uppercase and lowercase on the Linux command line)
[#]: via: (https://www.networkworld.com/article/3529409/converting-between-uppercase-and-lowercase-on-the-linux-command-line.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Converting between uppercase and lowercase on the Linux command line
======
Converting text between uppercase and lowercase can be very tedious, especially when you want to avoid inadvertent misspellings. Fortunately, Linux provides a handful of commands that can make the job very easy.
[andy.brandon50][1] [(CC BY-SA 2.0)][2]

There are many ways to change text on the Linux command line from lowercase to uppercase and vice versa. In fact, you have an impressive set of commands to choose from. This post examines some of the best commands for the job and how you can get them to do just what you want.

### Using tr

The **tr** (translate) command is one of the easiest to use on the command line or within a script. If you have a string that you want to be sure is in uppercase, you just pass it through a **tr** command like this:

```
$ echo Hello There | tr [:lower:] [:upper:]
HELLO THERE
```

[[Get regularly scheduled insights by signing up for Network World newsletters.]][3]

Below is an example of using this kind of command in a script when you want to be sure that all of the text that is added to a file is in uppercase for consistency:

```
#!/bin/bash

echo -n "Enter department name: "
read dept
echo $dept | tr [:lower:] [:upper:] >> depts
```

Switching the order to [:upper:] [:lower:] would have the opposite effect, putting all the department names in lowercase:

```
echo $dept | tr [:upper:] [:lower:] >> depts
```

Similarly, you could use the **sed** command's **A-Z** and **a-z** strings to accomplish the same thing:

```
echo $dept | tr a-z A-Z >> depts
```

As you undoubtedly suspect, reversing the order of the a-z and A-Z strings will have the opposite effect, turning the text to all lowercase.

### Using awk

The **awk** command lets you do the same thing with its **toupper** and **tolower** options. The command in the script shown in the previous example could be done this way instead:

[][4]

```
echo $dept | awk '{print toupper($0)}' >> depts
```

The reverse (switching to lowercase) would look like this:

```
echo $dept | awk '{print tolower($0)}' >> depts
```

### Using sed

The **sed** (stream editor) command also does a great job of switching between upper- and lowercase. This command would have the same effect as the first of the two shown above.

```
echo $dept | sed 's/[a-z]/\U&/g' >> depts
```

Switching from uppercase to lowercase would simply involve replacing the **U** near the end of the line with an **L**.

```
echo $dept | sed 's/[A-Z]/\L&/g' >> depts
```

### Manipulating text in a file

Both **awk** and **sed** also allow you to change the case of text for entire files. So, you just found out your boss wanted those department names in all lowercase? No problem. Just run a command like this with the file name provided:

```
$ awk '{print tolower($0)}' depts
finance
billing
bookkeeping
```

If you want to overwrite the **depts** file, instead of just displaying its contents in lowercase, you would need to do something like this:

```
$ awk '{print tolower($0)}' depts > depts-
$ mv depts- depts
```

Making the change with **sed**, however, you can avoid that last step because **sed** can edit a file "in place" as shown here, leaving the file intact, but the text in all lowercase:

```
$ sed 's/[A-Z]/\L&/g' depts
```

### Capitalizing first letters only

To capitalize only the first letters of words in a string, you can do something like this:

```
$ echo design \& engineering| sed -e "s/\b\(.\)/\u\1/g"
Design & Engineering
```

That command will ensure that first letters are capitalized, but won't change the rest of the letters.

### Making sure only first letters are uppercase

It's a little more challenging when you want to change text so that only first letters are in uppercase. Say you're manipulating a list of staff members' names and you want them to be formatted in the normal Firstname Lastname manner.

##### with sed

You could use a considerably more complex **sed** command to ensure this result:

```
$ echo design \& ENGINEERING | sed 's/\b\([[:alpha:]]\)\([[:alpha:]]*\)\b/\u\1\L\2/g'
Design & Engineering
```

##### with python

If you have python loaded, you can run a command like this that also formats text so that only the first letters of each word are capitalized and the command may be a little easier to parse than the **sed** command shown above:

```
$ echo -n "design & engineering" | python3 -c "import sys; print(sys.stdin.read().title())"
Design & Engineering
```

There are many ways to change the formatting of text between upper- and lowercase. Which works best depends in part of whether you're manipulating a single string or an entire file and how you want the end result to look.

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3529409/converting-between-uppercase-and-lowercase-on-the-linux-command-line.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.flickr.com/photos/54027476@N07/4999959929
[2]: https://creativecommons.org/licenses/by-sa/2.0/legalcode
[3]: https://www.networkworld.com/newsletters/signup.html
[4]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world

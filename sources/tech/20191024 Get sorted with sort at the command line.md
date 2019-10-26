[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Get sorted with sort at the command line)
[#]: via: (https://opensource.com/article/19/10/get-sorted-sort)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Get sorted with sort at the command line
======
Reorganize your data in a format that makes sense to you—right from the
Linux, BSD, or Mac terminal—with the sort command.
![Coding on a computer][1]

If you've ever used a spreadsheet application, then you know that rows can be sorted by the contents of a column. For instance, if you have a list of expenses, you might want to sort them by date or by ascending price or by category, and so on. If you're comfortable using a terminal, you may not want to have to use a big office application just to sort text data. And that's exactly what the [**sort**][2] command is for.

### Installing

You don't need to install **sort** because it's invariably included on any [POSIX][3] system. On most Linux systems, the **sort** command is bundled in a collection of utilities from the GNU organization. On other POSIX systems, such as BSD and Mac, the default **sort** command is not from GNU, so some options may differ. I'll attempt to account for both GNU and BSD implementations in this article.

### Sort lines alphabetically

The **sort** command, by default, looks at the first character of each line of a file and outputs each line in ascending alphabetic order. In the event that two characters on multiple lines are the same, it considers the next character. For example:


```
$ cat distro.list
Slackware
Fedora
Red Hat Enterprise Linux
Ubuntu
Arch
1337
Mint
Mageia
Debian
$ sort distro.list
1337
Arch
Debian
Fedora
Mageia
Mint
Red Hat Enterprise Linux
Slackware
Ubuntu
```

Using **sort** doesn't change the original file. Sort is a filter, so if you want to preserve your data in its sorted form, you must redirect the output using either **&gt;** or **tee**:


```
$ sort distro.list | tee distro.sorted
1337
Arch
Debian
[...]
$ cat distro.sorted
1337
Arch
Debian
[...]
```

### Sort by column

Complex data sets sometimes need to be sorted by something other than the first letter of each line. Imagine, for instance, a list of animals and each one's species and genus, and each "field" (a "cell" in a spreadsheet) is defined by a predictable delimiter character. This is such a common data format for spreadsheet exports that the CSV (comma-separated values) file extension exists to identify such files (although a CSV file doesn't have to be comma-separated, nor does a delimited file have to use the CSV extension to be valid and usable). Consider this example data set:


```
Aptenodytes;forsteri;Miller,JF;1778;Emperor
Pygoscelis;papua;Wagler;1832;Gentoo
Eudyptula;minor;Bonaparte;1867;Little Blue
Spheniscus;demersus;Brisson;1760;African
Megadyptes;antipodes;Milne-Edwards;1880;Yellow-eyed
Eudyptes;chrysocome;Viellot;1816;Southern Rockhopper
Torvaldis;linux;Ewing,L;1996;Tux
```

Given this sample data set, you can use the **\--field-separator** (use **-t** on BSD and Mac—or on GNU to reduce typing) option to set the delimiting character to a semicolon (because this example uses semicolons instead of commas, but it could use any character), and use the **\--key** (**-k** on BSD and Mac or on GNU to reduce typing) option to define which field to sort by. For example, to sort by the second field (starting at 1, not 0) of each line:


```
sort --field-separator=";" --key=2
Megadyptes;antipodes;Milne-Edwards;1880;Yellow-eyed
Eudyptes;chrysocome;Viellot;1816;Sothern Rockhopper
Spheniscus;demersus;Brisson;1760;African
Aptenodytes;forsteri;Miller,JF;1778;Emperor
Torvaldis;linux;Ewing,L;1996;Tux
Eudyptula;minor;Bonaparte;1867;Little Blue
Pygoscelis;papua;Wagler;1832;Gentoo
```

That's somewhat difficult to read, but Unix is famous for its _pipe_ method of constructing commands, so you can use the **column** command to "prettify" the output. Using GNU **column**:


```
$ sort --field-separator=";" \
\--key=2 penguins.list | \
column --table --separator ";"
Megadyptes   antipodes   Milne-Edwards  1880  Yellow-eyed
Eudyptes     chrysocome  Viellot        1816  Southern Rockhopper
Spheniscus   demersus    Brisson        1760  African
Aptenodytes  forsteri    Miller,JF      1778  Emperor
Torvaldis    linux       Ewing,L        1996  Tux
Eudyptula    minor       Bonaparte      1867  Little Blue
Pygoscelis   papua       Wagler         1832  Gentoo
```

Slightly more cryptic to the new user (but shorter to type), the command options on BSD and Mac:


```
$ sort -t ";" \
-k2 penguins.list | column -t -s ";"
Megadyptes   antipodes   Milne-Edwards  1880  Yellow-eyed
Eudyptes     chrysocome  Viellot        1816  Southern Rockhopper
Spheniscus   demersus    Brisson        1760  African
Aptenodytes  forsteri    Miller,JF      1778  Emperor
Torvaldis    linux       Ewing,L        1996  Tux
Eudyptula    minor       Bonaparte      1867  Little Blue
Pygoscelis   papua       Wagler         1832  Gentoo
```

The **key** definition doesn't have to be set to **2**, of course. Any existing field may be used as the sorting key.

### Reverse sort

You can reverse the order of a sorted list with the **\--reverse** (**-r** on BSD or Mac or GNU for brevity):


```
$ sort --reverse alphabet.list
z
y
x
w
[...]
```

You can achieve the same result by piping the output of a normal sort through [tac][4].

### Sorting by month (GNU only)

In a perfect world, everyone would write dates according to the ISO 8601 standard: year, month, day. It's a logical method of specifying a unique date, and it's easy for computers to understand. And yet quite often, humans use other means of identifying dates, including months with pretty arbitrary names.

Fortunately, the GNU **sort** command accounts for this and is able to sort correctly by month name. Use the **\--month-sort** (**-M**) option:


```
$ cat month.list
November
October
September
April
[...]
$ sort --month-sort month.list
January
February
March
April
May
[...]
November
December
```

Months may be identified by their full name or some portion of their names.

### Human-readable numeric sort (GNU only)

Another common point of confusion between humans and computers is groups of numbers. For instance, humans often write "1024 kilobytes" as "1KB" because it's easier and quicker for the human brain to parse "1KB" than "1024" (and it gets easier the larger the number becomes). To a computer, though, a string such as 9KB is larger than, for instance, 1MB (even though 9KB is only a fraction of a megabyte). The GNU **sort** command provides the **\--human-numeric-sort** (**-h**) option to help parse these values correctly.


```
$ cat sizes.list
2M
12MB
1k
9k
900
7000
$ sort --human-numeric-sort
900
7000
1k
9k
2M
12MB
```

There are some inconsistencies. For example, 16,000 bytes is greater than 1KB, but **sort** fails to recognize that:


```
$ cat sizes0.list
2M
12MB
16000
1k
$ sort -h sizes0.list
16000
1k
2M
12MB
```

Logically, 16,000 should be written 16KB in this context, so GNU **sort** is not entirely to blame. As long as you are sure that your numbers are consistent, the **\--human-numeric-sort** can help parse human-readable numbers in a computer-friendly way.

### Randomized sort (GNU only)

Sometimes utilities provide the option to do the opposite of what they're meant to do. In a way, it makes no sense for a **sort** command to have the ability to "sort" a file randomly. Then again, the workflow of the command makes it a convenient feature to have. You _could_ use a different command, like [**shuf**][5], or you could just add an option to the command you're using. Whether it's bloat or ingenious UX design, the GNU **sort** command provides the means to sort a file arbitrarily.

The purest form of arbitrary sorting is the **\--random-sort** or **-R** option (not to be confused with the **-r** option, which is short for **\--reverse**).


```
$ sort --random-sort alphabet.list
d
m
p
a
[...]
```

You can run a random sort multiple times on a file for different results each time.

### Sorted

There are many more features available with the **sort** GNU and BSD commands, so spend some time getting to know the options. You'll be surprised at how flexible **sort** can be, especially when it's combined with other Unix utilities.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/get-sorted-sort

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: https://en.wikipedia.org/wiki/Sort_(Unix)
[3]: https://en.wikipedia.org/wiki/POSIX
[4]: https://opensource.com/article/19/9/tac-command
[5]: https://www.gnu.org/software/coreutils/manual/html_node/shuf-invocation.html

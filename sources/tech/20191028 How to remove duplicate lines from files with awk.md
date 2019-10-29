[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to remove duplicate lines from files with awk)
[#]: via: (https://opensource.com/article/19/10/remove-duplicate-lines-files-awk)
[#]: author: (Lazarus Lazaridis https://opensource.com/users/iridakos)

How to remove duplicate lines from files with awk
======
Learn how to use awk '!visited[$0]++' without sorting or changing their
order.
![Coding on a computer][1]

Suppose you have a text file and you need to remove all of its duplicate lines.

### TL;DR

To remove the duplicate lines while _preserving their order in the file_, use:


```
`awk '!visited[$0]++' your_file > deduplicated_file`
```

### How it works

The script keeps an associative array with _indices_ equal to the unique lines of the file and _values_ equal to their occurrences. For each line of the file, if the line occurrences are zero, then it increases them by one and _prints the line_, otherwise, it just increases the occurrences _without printing the line_.

I was not familiar with **awk**, and I wanted to understand how this can be accomplished with such a short script (**awk**ward). I did my research, and here is what is going on:

  * The awk "script" **!visited[$0]++** is executed for _each line_ of the input file.
  * **visited[]** is a variable of type [associative array][2] (a.k.a. [Map][3]). We don't have to initialize it because **awk** will do it the first time we access it.
  * The **$0** variable holds the contents of the line currently being processed.
  * **visited[$0]** accesses the value stored in the map with a key equal to **$0** (the line being processed), a.k.a. the occurrences (which we set below).
  * The **!** negates the occurrences' value:
    * In awk, [any nonzero numeric value or any nonempty string value is true][4].
    * By default, [variables are initialized to the empty string][5], which is zero if converted to a number.
    * That being said:
      * If **visited[$0]** returns a number greater than zero, this negation is resolved to **false**.
      * If **visited[$0]** returns a number equal to zero or an empty string, this negation is resolved to **true**.
  * The **++** operation increases the variable's value (**visited[$0]**) by one.
    * If the value is empty, **awk** converts it to **0** (number) automatically and then it gets increased.
    * **Note:** The operation is executed after we access the variable's value.



Summing up, the whole expression evaluates to:

  * **true** if the occurrences are zero/empty string
  * **false** if the occurrences are greater than zero



**awk** statements consist of a [_pattern-expression_ and an _associated action_][6].


```
`<pattern/expression> { <action> }`
```

If the pattern succeeds, then the associated action is executed. If we don't provide an action, **awk**, by default, **print**s the input.

> An omitted action is equivalent to **{ print $0 }**.

Our script consists of one **awk** statement with an expression, omitting the action. So this:


```
`awk '!visited[$0]++' your_file > deduplicated_file`
```

is equivalent to this:


```
`awk '!visited[$0]++ { print $0 }' your_file > deduplicated_file`
```

For every line of the file, if the expression succeeds, the line is printed to the output. Otherwise, the action is not executed, and nothing is printed.

### Why not use the **uniq** command?

The **uniq** command removes only the _adjacent duplicate lines_. Here's a demonstration:


```
$ cat test.txt
A
A
A
B
B
B
A
A
C
C
C
B
B
A
$ uniq &lt; test.txt
A
B
A
C
B
A
```

### Other approaches

#### Using the sort command

We can also use the following [**sort**][7] command to remove the duplicate lines, but _the line order is not preserved_.


```
`sort -u your_file > sorted_deduplicated_file`
```

#### Using cat, sort, and cut

The previous approach would produce a de-duplicated file whose lines would be sorted based on the contents. [Piping a bunch of commands][8] can overcome this issue:


```
`cat -n your_file | sort -uk2 | sort -nk1 | cut -f2-`
```

##### How it works

Suppose we have the following file:


```
abc
ghi
abc
def
xyz
def
ghi
klm
```

**cat -n test.txt** prepends the order number in each line.


```
1       abc
2       ghi
3       abc
4       def
5       xyz
6       def
7       ghi
8       klm
```

**sort -uk2** sorts the lines based on the second column (**k2** option) and keeps only the first occurrence of the lines with the same second column value (**u** option).


```
1       abc
4       def
2       ghi
8       klm
5       xyz
```

**sort -nk1** sorts the lines based on their first column (**k1** option) treating the column as a number (**-n** option).


```
1       abc
2       ghi
4       def
5       xyz
8       klm
```

Finally, **cut -f2-** prints each line starting from the second column until its end (**-f2-** option: _Note the **-** suffix, which instructs it to include the rest of the line_).


```
abc
ghi
def
xyz
klm
```

### References

  * [The GNU awk user's guide][9]
  * [Arrays in awk][2]
  * [Awk—Truth values][4]
  * [Awk expressions][5]
  * [How can I delete duplicate lines in a file in Unix?][10]
  * [Remove duplicate lines without sorting [duplicate]][11]
  * [How does awk '!a[$0]++' work?][12]



That's all. Cat photo.

![Duplicate cat][13]

* * *

_This article originally appeared on the iridakos blog by [Lazarus Lazaridis][14] under a [CC BY-NC 4.0 License][15] and is republished with the author's permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/remove-duplicate-lines-files-awk

作者：[Lazarus Lazaridis][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/iridakos
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: http://kirste.userpage.fu-berlin.de/chemnet/use/info/gawk/gawk_12.html
[3]: https://en.wikipedia.org/wiki/Associative_array
[4]: https://www.gnu.org/software/gawk/manual/html_node/Truth-Values.html
[5]: https://ftp.gnu.org/old-gnu/Manuals/gawk-3.0.3/html_chapter/gawk_8.html
[6]: http://kirste.userpage.fu-berlin.de/chemnet/use/info/gawk/gawk_9.html
[7]: http://man7.org/linux/man-pages/man1/sort.1.html
[8]: https://stackoverflow.com/a/20639730/2292448
[9]: https://www.gnu.org/software/gawk/manual/html_node/
[10]: https://stackoverflow.com/questions/1444406/how-can-i-delete-duplicate-lines-in-a-file-in-unix
[11]: https://stackoverflow.com/questions/11532157/remove-duplicate-lines-without-sorting
[12]: https://unix.stackexchange.com/questions/159695/how-does-awk-a0-work/159734#159734
[13]: https://opensource.com/sites/default/files/uploads/duplicate-cat.jpg (Duplicate cat)
[14]: https://iridakos.com/about/
[15]: http://creativecommons.org/licenses/by-nc/4.0/

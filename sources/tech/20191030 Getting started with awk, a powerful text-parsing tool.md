[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting started with awk, a powerful text-parsing tool)
[#]: via: (https://opensource.com/article/19/10/intro-awk)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Getting started with awk, a powerful text-parsing tool
======
Let's jump in and start using it.
![Woman programming][1]

Awk is a powerful text-parsing tool for Unix and Unix-like systems, but because it has programmed functions that you can use to perform common parsing tasks, it's also considered a programming language. You probably won't be developing your next GUI application with awk, and it likely won't take the place of your default scripting language, but it's a powerful utility for specific tasks.

What those tasks may be is surprisingly diverse. The best way to discover which of your problems might be best solved by awk is to learn awk; you'll be surprised at how awk can help you get more done but with a lot less effort.

Awk's basic syntax is:


```
`awk [options] 'pattern {action}' file`
```

To get started, create this sample file and save it as **colours.txt**


```
name       color  amount
apple      red    4
banana     yellow 6
strawberry red    3
grape      purple 10
apple      green  8
plum       purple 2
kiwi       brown  4
potato     brown  9
pineapple  yellow 5
```

This data is separated into columns by one or more spaces. It's common for data that you are analyzing to be organized in some way. It may not always be columns separated by whitespace, or even a comma or semicolon, but especially in log files or data dumps, there's generally a predictable pattern. You can use patterns of data to help awk extract and process the data that you want to focus on.

### Printing a column

In awk, the **print** function displays whatever you specify. There are many predefined variables you can use, but some of the most common are integers designating columns in a text file. Try it out:


```
$ awk '{print $2;}' colours.txt
color
red
yellow
red
purple
green
purple
brown
brown
yellow
```

In this case, awk displays the second column, denoted by **$2**. This is relatively intuitive, so you can probably guess that **print $1** displays the first column, and **print $3** displays the third, and so on.

To display _all_ columns, use **$0**.

The number after the dollar sign (**$**) is an _expression_, so **$2** and **$(1+1)** mean the same thing.

### Conditionally selecting columns

The example file you're using is very structured. It has a row that serves as a header, and the columns relate directly to one another. By defining _conditional_ requirements, you can qualify what you want awk to return when looking at this data. For instance, to view items in column 2 that match "yellow" and print the contents of column 1:


```
awk '$2=="yellow"{print $1}' file1.txt
banana
pineapple
```

Regular expressions work as well. This conditional looks at **$2** for approximate matches to the letter **p** followed by any number of (one or more) characters, which are in turn followed by the letter **p**:


```
$ awk '$2 ~ /p.+p/ {print $0}' colours.txt
grape   purple  10
plum    purple  2
```

Numbers are interpreted naturally by awk. For instance, to print any row with a third column containing an integer greater than 5:


```
awk '$3&gt;5 {print $1, $2}' colours.txt
name    color
banana  yellow
grape   purple
apple   green
potato  brown
```

### Field separator

By default, awk uses whitespace as the field separator. Not all text files use whitespace to define fields, though. For example, create a file called **colours.csv** with this content:


```
name,color,amount
apple,red,4
banana,yellow,6
strawberry,red,3
grape,purple,10
apple,green,8
plum,purple,2
kiwi,brown,4
potato,brown,9
pineapple,yellow,5
```

Awk can treat the data in exactly the same way, as long as you specify which character it should use as the field separator in your command. Use the **\--field-separator** (or just **-F** for short) option to define the delimiter:


```
$ awk -F"," '$2=="yellow" {print $1}' file1.csv
banana
pineapple
```

### Saving output

Using output redirection, you can write your results to a file. For example:


```
`$ awk -F, '$3>5 {print $1, $2} colours.csv > output.txt`
```

This creates a file with the contents of your awk query.

You can also split a file into multiple files grouped by column data. For example, if you want to split colours.txt into multiple files according to what color appears in each row, you can cause awk to redirect _per query_ by including the redirection in your awk statement:


```
`$ awk '{print > $2".txt"}' colours.txt`
```

This produces files named **yellow.txt**, **red.txt**, and so on.

In the next article, you'll learn more about fields, records, and some powerful awk variables.

* * *

This article is adapted from an episode of [Hacker Public Radio][2], a community technology podcast.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/intro-awk

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop-music-headphones.png?itok=EQZ2WKzy (Woman programming)
[2]: http://hackerpublicradio.org/eps.php?id=2114

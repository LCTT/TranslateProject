[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Awk one-liners and scripts to help you sort text files)
[#]: via: (https://opensource.com/article/19/11/how-sort-awk)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Awk one-liners and scripts to help you sort text files
======
Awk is a powerful tool for doing tasks that might otherwise be left to
other common utilities, including sort.
![Green graph of measurements][1]

Awk is the ubiquitous Unix command for scanning and processing text containing predictable patterns. However, because it features functions, it's also justifiably called a programming language.

Confusingly, there is more than one awk. (Or, if you believe there can be only one, then there are several clones.) There's **awk**, the original program written by Aho, Weinberger, and Kernighan, and then there's **nawk**, **mawk**, and the GNU version, **gawk**. The GNU version of awk is a highly portable, free software version of the utility with several unique features, so this article is about GNU awk.

While its official name is gawk, on GNU+Linux systems it's aliased to awk and serves as the default version of that command. On other systems that don't ship with GNU awk, you must install it and refer to it as gawk, rather than awk. This article uses the terms awk and gawk interchangeably.

Being both a command and a programming language makes awk a powerful tool for tasks that might otherwise be left to **sort**, **cut**, **uniq**, and other common utilities. Luckily, there's lots of room in open source for redundancy, so if you're faced with the question of whether or not to use awk, the answer is probably a solid "maybe."

The beauty of awk's flexibility is that if you've already committed to using awk for a task, then you can probably stay in awk no matter what comes up along the way. This includes the eternal need to sort data in a way other than the order it was delivered to you.

### Sample set

Before exploring awk's sorting methods, generate a sample dataset to use. Keep it simple so that you don't get distracted by edge cases and unintended complexity. This is the sample set this article uses:


```
Aptenodytes;forsteri;Miller,JF;1778;Emperor
Pygoscelis;papua;Wagler;1832;Gentoo
Eudyptula;minor;Bonaparte;1867;Little Blue
Spheniscus;demersus;Brisson;1760;African
Megadyptes;antipodes;Milne-Edwards;1880;Yellow-eyed
Eudyptes;chrysocome;Viellot;1816;Sothern Rockhopper
Torvaldis;linux;Ewing,L;1996;Tux
```

It's a small dataset, but it offers a good variety of data types:

  * A genus and species name, which are associated with one another but considered separate
  * A surname, sometimes with first initials after a comma
  * An integer representing a date
  * An arbitrary term
  * All fields separated by semi-colons



Depending on your educational background, you may consider this a 2D array or a table or just a line-delimited collection of data. How you think of it is up to you, because awk doesn't expect anything more than text. It's up to you to tell awk how you want to parse it.

### The sort cheat

If you just want to sort a text dataset by a specific, definable field (think of a "cell" in a spreadsheet), then you can use the [sort command][2].

### Fields and records

Regardless of the format of your input, you must find patterns in it so that you can focus on the parts of the data that are important to you. In this example, the data is delimited by two factors: lines and fields. Each new line represents a new _record_, as you would likely see in a spreadsheet or database dump. Within each line, there are distinct _fields_ (think of them as cells in a spreadsheet) that are separated by semicolons (;).

Awk processes one record at a time, so while you're structuring the instructions you will give to awk, you can focus on just one line. Establish what you want to do with one line, then test it (either mentally or with awk) on the next line and a few more. You'll end up with a good hypothesis on what your awk script must do in order to provide you with the data structure you want.

In this case, it's easy to see that each field is separated by a semicolon. For simplicity's sake, assume you want to sort the list by the very first field of each line.

Before you can sort, you must be able to focus awk on just the first field of each line, so that's the first step. The syntax of an awk command in a terminal is **awk**, followed by relevant options, followed by your awk command, and ending with the file of data you want to process.


```
$ awk --field-separator=";" '{print $1;}' penguins.list
Aptenodytes
Pygoscelis
Eudyptula
Spheniscus
Megadyptes
Eudyptes
Torvaldis
```

Because the field separator is a character that has special meaning to the Bash shell, you must enclose the semicolon in quotes or precede it with a backslash. This command is useful only to prove that you can focus on a specific field. You can try the same command using the number of another field to view the contents of another "column" of your data:


```
$ awk --field-separator=";" '{print $3;}' penguins.list
Miller,JF
Wagler
Bonaparte
Brisson
Milne-Edwards
Viellot
Ewing,L
```

Nothing has been sorted yet, but this is good groundwork.

### Scripting

Awk is more than just a command; it's a programming language with indices and arrays and functions. That's significant because it means you can grab a list of fields you want to sort by, store the list in memory, process it, and then print the resulting data. For a complex series of actions such as this, it's easier to work in a text file, so create a new file called **sort.awk** and enter this text:


```
#!/bin/gawk -f

BEGIN {
        FS=";";
}
```

This establishes the file as an awk script that executes the lines contained in the file.

The **BEGIN** statement is a special setup function provided by awk for tasks that need to occur only once. Defining the built-in variable **FS**, which stands for _field separator_ and is the same value you set in your awk command with **\--field-separator**, only needs to happen once, so it's included in the **BEGIN** statement.

#### Arrays in awk

You already know how to gather the values of a specific field by using the **$** notation along with the field number, but in this case, you need to store it in an array rather than print it to the terminal. This is done with an awk array. The important thing about an awk array is that it contains keys and values. Imagine an array about this article; it would look something like this: **author:"seth",title:"How to sort with awk",length:1200**. Elements like **author** and **title** and **length** are keys, with the following contents being values.

The advantage to this in the context of sorting is that you can assign any field as the key and any record as the value, and then use the built-in awk function **asorti()** (sort by index) to sort by the key. For now, assume arbitrarily that you _only_ want to sort by the second field.

Awk statements _not_ preceded by the special keywords **BEGIN** or **END** are loops that happen at each record. This is the part of the script that scans the data for patterns and processes it accordingly. Each time awk turns its attention to a record, statements in **{}** (unless preceded by **BEGIN** or **END**) are executed.

To add a key and value to an array, create a variable (in this example script, I call it **ARRAY**, which isn't terribly original, but very clear) containing an array, and then assign it a key in brackets and a value with an equals sign (**=**).


```
{   # dump each field into an array
    ARRAY[$2] = $R;
}
```

In this statement, the contents of the second field (**$2**) are used as the key term, and the current record (**$R**) is used as the value.

### The asorti() function

In addition to arrays, awk has several basic functions that you can use as quick and easy solutions for common tasks. One of the functions introduced in GNU awk, **asorti()**, provides the ability to sort an array by key (or _index_) or value.

You can only sort the array once it has been populated, meaning that this action must not occur with every new record but only the final stage of your script. For this purpose, awk provides the special **END** keyword. The inverse of **BEGIN**, an **END** statement happens only once and only after all records have been scanned.

Add this to your script:


```
END {
    asorti(ARRAY,SARRAY);
    # get length
    j = length(SARRAY);
   
    for (i = 1; i &lt;= j; i++) {
        printf("%s %s\n", SARRAY[i],ARRAY[SARRAY[i]])
    }
}
```

The **asorti()** function takes the contents of **ARRAY**, sorts it by index, and places the results in a new array called **SARRAY** (an arbitrary name I invented for this article, meaning _Sorted ARRAY_).

Next, the variable **j** (another arbitrary name) is assigned the results of the **length()** function, which counts the number of items in **SARRAY**.

Finally, use a **for** loop to iterate through each item in **SARRAY** using the **printf()** function to print each key, followed by the corresponding value of that key in **ARRAY**.

### Running the script

To run your awk script, make it executable:


```
`$ chmod +x sorter.awk`
```

And then run it against the **penguin.list** sample data:


```
$ ./sorter.awk penguins.list
antipodes Megadyptes;antipodes;Milne-Edwards;1880;Yellow-eyed
chrysocome Eudyptes;chrysocome;Viellot;1816;Sothern Rockhopper
demersus Spheniscus;demersus;Brisson;1760;African
forsteri Aptenodytes;forsteri;Miller,JF;1778;Emperor
linux Torvaldis;linux;Ewing,L;1996;Tux
minor Eudyptula;minor;Bonaparte;1867;Little Blue
papua Pygoscelis;papua;Wagler;1832;Gentoo
```

As you can see, the data is sorted by the second field.

This is a little restrictive. It would be better to have the flexibility to choose at runtime which field you want to use as your sorting key so you could use this script on any dataset and get meaningful results.

### Adding command options

You can add a command variable to an awk script by using the literal value **var** in your script. Change your script so that your iterative clause uses **var** when creating your array:


```
{ # dump each field into an array
    ARRAY[$var] = $R;
}
```

Try running the script so that it sorts by the third field by using the **-v var** option when you execute it:


```
$ ./sorter.awk -v var=3 penguins.list
Bonaparte Eudyptula;minor;Bonaparte;1867;Little Blue
Brisson Spheniscus;demersus;Brisson;1760;African
Ewing,L Torvaldis;linux;Ewing,L;1996;Tux
Miller,JF Aptenodytes;forsteri;Miller,JF;1778;Emperor
Milne-Edwards Megadyptes;antipodes;Milne-Edwards;1880;Yellow-eyed
Viellot Eudyptes;chrysocome;Viellot;1816;Sothern Rockhopper
Wagler Pygoscelis;papua;Wagler;1832;Gentoo
```

### Fixes

This article has demonstrated how to sort data in pure GNU awk. The script can be improved so, if it's useful to you, spend some time researching [awk functions][3] on gawk's man page and customizing the script for better output.

Here is the complete script so far:


```
#!/usr/bin/awk -f
# GPLv3 appears here
# usage: ./sorter.awk -v var=NUM FILE

BEGIN { FS=";"; }

{ # dump each field into an array
    ARRAY[$var] = $R;
}

END {
    asorti(ARRAY,SARRAY);
    # get length
    j = length(SARRAY);
   
    for (i = 1; i &lt;= j; i++) {
        printf("%s %s\n", SARRAY[i],ARRAY[SARRAY[i]])
    }
}
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/how-sort-awk

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_lead-steps-measure.png?itok=DG7rFZPk (Green graph of measurements)
[2]: https://opensource.com/article/19/10/get-sorted-sort
[3]: https://www.gnu.org/software/gawk/manual/html_node/Built_002din.html#Built_002din

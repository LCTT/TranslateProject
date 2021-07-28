[#]: subject: (Command line quick tips: wc, sort, sed and tr)
[#]: via: (https://fedoramagazine.org/command-line-quick-tips-wc-sort-sed-and-tr/)
[#]: author: (mahesh1b https://fedoramagazine.org/author/mahesh1b/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Command line quick tips: wc, sort, sed and tr
======

![][1]

Image by Ryan Lerch (CC BY-SA 4.0)

Linux distributions are great to use and they have some tricks under their sleeves which users may not be aware of. Let’s have a look at some command line utilities which really come in handy when you’re the guy that likes to stick with the terminal rather than using a GUI. 

We all know that using a terminal is more efficient to use the system. In case you are editing or playing with text files on a terminal then these tools will surely make your life easy.

For this article let’s have a look at _wc_, _sort_, _tr_, and _sed_ commands.

## **wc**

wc is a utility whose name stands for “word count”. As the name suggests it will count the lines, words or byte count from any file. 

Let’s see how it works:

```
$ wc filename
lines words characters filename
```

So in output we get the total number of newlines in the file, total number of words, total number of characters, and the filename.

To get some specific output we have to use options:

  * -c To print the byte counts
  * -l   To print the newline counts
  * -w To print the word counts
  * -m To print the character counts



### wc demo

Let’s see it in action:

Here we start with a text file, _loremipsm.txt_. First, we print out the file and then use _wc_ on it.

```
$ cat loremipsm.txt
Linux is the best-known and most-used open source operating system.
As an operating system, Linux is software that sits underneath all of the other software on a computer,
receiving requests from those programs and replaying these requests to the computer's hardware.

$ wc loremipsm.txt
3 41 268 loremipsm.txt
```

Suppose I only want to see the byte count of the file: 

```
$ wc -c loremipsm.txt
268 loremipsm.txt
```

For the newline count of the file:

```
$ wc -l loremipsm.txt
3 loremipsm.txt
```

To see the word count of the file:

```
$ wc -w loremipsm.txt
41 loremipsm.txt
```

Now only the character count of the file:

```
$ wc -m loremipsm.txt
268 loremipsm.txt
```

## **sort**

The _sort_ command is one of the most useful tools. It will sort the data in a file. Sorting is by either characters or numbers in ascending or descending order. It can also be used to sort or randomize the lines of files.

Using _sort_ can be very simple.  All we need to do is provide the name of the file.

```
$ sort filename
```

By default it sorts the data in alphabetical order. One thing to note is that the _sort_ command just displays the sorted data. It does not overwrite the file.

Some useful options for _sort_: 

  * -r  To sort the lines in the file in reverse order
  * -R To shuffle the lines in the file into random order
  * -o To save the output in another file
  * -k To sort as per specific column
  * -t To mention the field separator
  * -n To sort the data according to numerical value



### sort demo

Let’s use _sort_ in some short demos:

We have a file, _list.txt_, containing names and numeric values separated by commas.

First let’s print out the file and just do simple sorting.

```
$ cat list.txt
Cieran Wilks, 9
Adelina Rowland, 4
Hayden Mcfarlnd, 1
Ananya Lamb, 5
Shyam Head, 2
Lauryn Fuents, 8
Kristian Felix, 10
Ruden Dyer, 3
Greyson Meyers, 6
Luther Cooke, 7

$ sort list.txt
Adelina Rowland, 4
Ananya Lamb, 5
Cieran Wilks, 9
Greyson Meyers, 6
Hayden Mcfarlnd, 1
Kristian Felix, 10
Lauryn Fuents, 8
Luther Cooke, 7
Ruden Dyer, 3
Shyam Head, 2
```

Now sort the data in the reverse order.

```
$ sort -r list.txt
Shyam Head, 2
Ruden Dyer, 3
Luther Cooke, 7
Lauryn Fuents, 8
Kristian Felix, 10
Hayden Mcfarlnd, 1
Greyson Meyers, 6
Cieran Wilks, 9
Ananya Lamb, 5
Adelina Rowland, 4
```

Let’s shuffle the data.

```
$ sort -R list.txt
Cieran Wilks, 9
Greyson Meyers, 6
Adelina Rowland, 4
Kristian Felix, 10
Luther Cooke, 7
Ruden Dyer, 3
Lauryn Fuents, 8
Hayden Mcfarlnd, 1
Ananya Lamb, 5
Shyam Head, 2
```

Let’s make it more complex. This time we sort the data according to the second field, which is the numeric value, and save the output in another file using the -o option.

```
$ sort -n -k2 -t ',' -o sorted_list.txt list.txt
$ ls
   sorted_list.txt    list.txt
$ cat sorted_list.txt
Hayden Mcfarlnd, 1
Shyam Head, 2
Ruden Dyer, 3
Adelina Rowland, 4
Ananya Lamb, 5
Greyson Meyers, 6
Luther Cooke, 7
Lauryn Fuents, 8
Cieran Wilks, 9
Kristian Felix, 10
```

Here we used -n to sort in numerical order, -k to specify the field to sort (2 in this case) -t to indicate the delimiter or field-separator (a comma) and -o to save the output in the file _sorted_list.txt_. 

## **sed**

Sed is a stream editor that will filter and transform text in the output. This means we are not making changes in the file, only to the output. We can also save the changes in a new file if needed. Sed comes with a lot of options that are useful in filtering or editing the data. 

The syntax for sed is:

```
$ sed [OPTION] ‘PATTERN’ filename
```

Some of the options used with sed:

  * -n : To suppress the printing 
  * p: To print the current pattern 
  * d : To delete the pattern 
  * q : To quit the sed script



### sed demo

Lets see _sed_ in action. We start with the file _data_ with the fields indicating number, name, age and operating system.

Printing the lines twice if they occur in a specific range of lines.

```
$ cat data
1    Vicky Grant      20   linux
2    Nora Burton    19   Mac
3    Willis Castillo   21  Windows
4    Gilberto Mack 30   Windows
5    Aubrey Hayes  17   windows
6    Allan Snyder    21   mac
7    Freddie Dean   25   linux
8    Ralph Martin    19   linux
9    Mindy Howard  20   Mac

$ sed '3,7 p' data
1    Vicky Grant      20   linux
2    Nora Burton    19   Mac
3    Willis Castillo   21  Windows
3    Willis Castillo   21  Windows
4    Gilberto Mack 30   Windows
4    Gilberto Mack 30   Windows
5    Aubrey Hayes  17   windows
5    Aubrey Hayes  17   windows
6    Allan Snyder    21   mac
6    Allan Snyder    21   mac
7    Freddie Dean   25   linux
7    Freddie Dean   25   linux
8    Ralph Martin    19   linux
9    Mindy Howard 20   Mac
```

Here the operation is specified in single quotes indicating lines 3 through 7 and using ‘p’ to print the pattern found. The default behavior of sed is to print every line after parsing it. This means lines 3 through 7 appear twice because of the ‘p’ instruction.

So how can you print specific lines from the file? Use the ‘-n’ option to eliminate lines that do not match from the output.

```
$ sed -n '3,7 p' data
3    Willis Castillo     21    Windows
4    Gilberto Mack    30   Windows
5    Aubrey Hayes     17   windows
6    Allan Snyder       21   mac
7    Freddie Dean      25  linux
```

Only lines 3 through 7 will appear using ‘-n’ .

Omitting specific lines from the file. This uses the ‘d’ to delete the lines from the output.

```
$ sed '3 d' data
1    Vicky Grant      20    linux
2   Nora Burton     19    Mac
4   Gilberto Mack  30    Windows
5   Aubrey Hayes   17    windows
6   Allan Snyder     21    mac
7   Freddie Dean    25   linux
8   Ralph Martin    19    linux
9   Mindy Howard  20   Mac

$ sed '5,9 d' data
1    Vicky Grant     20   linux
2   Nora Burton    19   Mac
3   Willis Castillo   21   Windows
4   Gilberto Mack 30   Windows
```

Searching for a specific keyword in the file.

```
$ sed -n '/linux/ p' data
7    Freddie Dean   25  linux
8    Ralph Martin   19   linux

$ sed -n '/linux/I p' data
1     Vicky Grant      20  Linux
7     Freddie Dean  25  linux
8     Ralph Martin   19  linux
```

In these examples we have a regular expression which appears in ‘/ /’. If we have similar words in the file but not with proper case then we use the “I” to make the search case insensitive. Recall that the -n eliminates the lines that do not match from the output.

Replacing the words in the file.

```
$ sed 's/linux/linus/' data
1   Vicky Grant      20   Linux
2   Nora Burton    19   Mac
3   Willis Castillo   21   Windows
4   Gilberto Mack  30  Windows
5   Aubrey Hayes   17  windows
6   Allan Snyder     21  mac
7   Freddie Dean    25 linus
8   Ralph Martin    19  linus
9   Mindy Howard 20  Mac
```

Here ‘s/ / /’ denotes that it is a regex. The located word and then the new word to replace it appear between the two ‘/’.

## **tr**

The _tr_ command will translate or delete characters. It can transform the lowercase letters to uppercase or vice versa, eliminate repeating characters, and delete specific characters.

One thing weird about _tr_ is that it does not take files as input like _wc_, _sort_ and _sed_ do. We use “|” (the pipe symbol) to provide input to the _tr_ command.

```
$ cat filename | tr [OPTION]
```

Some options used with _tr_:

  * -d : To delete the characters in first set of output
  * -s : To replace the repeated characters with single occurrence



### tr demo

Now let’s use the _tr_ command with the file _letter_ to convert all the characters from lowercase to uppercase.

```
$ cat letter
Linux is too easy to learn,
And you should try it too.

$ cat letter | tr 'a-z' 'A-Z'
LINUX IS TOO EASY TO LEARN,
AND YOU SHOULD TRY IT TOO.
```

Here ‘a-z’ ‘A-Z’ denotes that we want to convert characters in the range from “a” to “z” from lowercase to uppercase.

Deleting the “o” character  from the file.

```
$ cat letter | tr -d 'o'
Linux is t easy t learn,
And yu shuld try it t.
```

Squeezing the character “o” from the file means that if “o” is repeated in line then it will remove it and print it only once. 

```
$ cat letter | tr -s 'o'
Linux is to easy to learn,
And you should try it to.
```

## **Conclusion**

This was a quick demonstration of the _wc_, _sort_, _sed_ and _tr_ commands. These commands make it easy to manipulate the text files on the terminal in a quick and efficient way. You may use the _man_ command to learn more about these commands.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/command-line-quick-tips-wc-sort-sed-and-tr/

作者：[mahesh1b][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mahesh1b/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2018/10/commandlinequicktips-816x345.jpg

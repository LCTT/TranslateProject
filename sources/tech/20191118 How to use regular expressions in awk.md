[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to use regular expressions in awk)
[#]: via: (https://opensource.com/article/19/11/how-regular-expressions-awk)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

How to use regular expressions in awk
======
Use regex to search code using dynamic and complex pattern definitions.
![Coding on a computer][1]

In awk, regular expressions (regex) allow for dynamic and complex pattern definitions. You're not limited to searching for simple strings but also patterns within patterns.

The syntax for using regular expressions to match lines in awk is:


```
`word ~ /match/`
```

The inverse of that is _not_ matching a pattern:


```
`word !~ /match/`
```

If you haven't already, create the sample file from our [previous article][2]:


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

Save the file as **colours.txt** and run:


```
$ awk -e '$1 ~ /p[el]/ {print $0}' colours.txt
apple      red    4
grape      purple 10
apple      green  8
plum       purple 2
pineapple  yellow 5
```

You have selected all records containing the letter **p** followed by _either_ an **e** or an **l**.

Adding an **o** inside the square brackets creates a new pattern to match:


```
$ awk -e '$1 ~ /p[el]/ {print $0}' colours.txt
apple      red    4
grape      purple 10
apple      green  8
plum       purple 2
pineapple  yellow 5
potato     brown  9
```

### Regular expression basics

Certain characters have special meanings when they're used in regular expressions.

#### Anchors

Anchor | Function
---|---
**^** | Indicates the beginning of the line
**$** | Indicates the end of a line
**\A** | Denotes the beginning of a string
**\z** | Denotes the end of a string
**\b** | Marks a word boundary

For example, this awk command prints any record containing an **r** character:


```
$ awk -e '$1 ~ /r/ {print $0}' colours.txt
strawberry red    3
raspberry  red    99
grape      purple 10
```

Add a **^** symbol to select only records where **r** occurs at the beginning of the line:


```
$ awk -e '$1 ~ /^r/ {print $0}' colours.txt
raspberry  red    99
```

#### Characters

Character | Function
---|---
**[ad]** | Selects **a** or **d**
**[a-d]** | Selects any character **a** through **d** (a, b, c, or d)
**[^a-d]** | Selects any character _except_ **a** through **d** (e, f, g, h…)
**\w** | Selects any word
**\s** | Selects any whitespace character
**\d** | Selects any digit

The capital versions of w, s, and d are negations; for example, **\D** _does not_ select any digit.

[POSIX][3] regex offers easy mnemonics for character classes:

POSIX mnemonic | Function
---|---
**[:alnum:]** | Alphanumeric characters
**[:alpha:]** | Alphabetic characters
**[:space:]** | Space characters (such as space, tab, and formfeed)
**[:blank:]** | Space and tab characters
**[:upper:]** | Uppercase alphabetic characters
**[:lower:]** | Lowercase alphabetic characters
**[:digit:]** | Numeric characters
**[:xdigit:]** | Characters that are hexadecimal digits
**[:punct:]** | Punctuation characters (i.e., characters that are not letters, digits, control characters, or space characters)
**[:cntrl:]** | Control characters
**[:graph:]** | Characters that are both printable and visible (e.g., a space is printable but not visible, whereas an **a** is both)
**[:print:]** | Printable characters (i.e., characters that are not control characters)

### Quantifiers

Quantifier | Function
---|---
**.** | Matches any character
**+** | Modifies the preceding set to mean _one or more times_
***** | Modifies the preceding set to mean _zero or more times_
**?** | Modifies the preceding set to mean _zero or one time_
**{n}** | Modifies the preceding set to mean _exactly n times_
**{n,}** | Modifies the preceding set to mean _n or more times_
**{n,m}** | Modifies the preceding set to mean _between n and m times_

Many quantifiers modify the character sets that precede them. For example, **.** means any character that appears exactly once, but **.*** means _any or no_ character. Here's an example; look at the regex pattern carefully:


```
$ printf "red\nrd\n"
red
rd
$ printf "red\nrd\n" | awk -e '$0 ~ /^r.d/ {print}'
red
$ printf "red\nrd\n" | awk -e '$0 ~ /^r.*d/ {print}'
red
rd
```

Similarly, numbers in braces specify the number of times something occurs. To find records in which an **e** character occurs exactly twice:


```
$ awk -e '$2 ~ /e{2}/ {print $0}' colours.txt
apple      green  8
```

### Grouped matches

Quantifier | Function
---|---
**(red)** | Parentheses indicate that the enclosed letters must appear contiguously
** | **

For instance, the pattern **(red)** matches the word **red** and **ordered** but not any word that contains all three of those letters in another order (such as the word **order**).

### Awk like sed with sub() and gsub()

Awk features several functions that perform find-and-replace actions, much like the Unix command **sed**. These are functions, just like **print** and **printf**, and can be used in awk rules to replace strings with a new string, whether the new string is a string or a variable.

The **sub** function substitutes the _first_ matched entity (in a record) with a replacement string. For example, if you have this rule in an awk script:


```
{ sub(/apple/, "nut", $1);
    print $1 }
```

running it on the example file **colours.txt** produces this output:


```
name
nut
banana
raspberry
strawberry
grape
nut
plum
kiwi
potato
pinenut
```

The reason both **apple** and **pineapple** were replaced with **nut** is that both are the first match of their records. If the records were different, then the results could differ:


```
$ printf "apple apple\npineapple apple\n" | \
awk -e 'sub(/apple/, "nut")'
nut apple
pinenut apple
```

The **gsub** command substitutes _all_ matching items:


```
$ printf "apple apple\npineapple apple\n" | \
awk -e 'gsub(/apple/, "nut")'
nut nut
pinenut nut
```

#### Gensub

An even more complex version of these functions, called **gensub()**, is also available.

The **gensub** function allows you to use the **&amp;** character to recall the matched text. For example, if you have a file with the word **Awk** and you want to change it to **GNU Awk**, you could use this rule:


```
`{ print gensub(/(Awk)/, "GNU &", 1) }`
```

This searches for the group of characters **Awk** and stores it in memory, represented by the special character **&amp;**. Then it substitutes the string for **GNU &amp;**, meaning **GNU Awk**. The **1** character at the end tells **gensub()** to replace the first occurrence.


```
$ printf "Awk\nAwk is not Awkward" \
| awk -e ' { print gensub(/(Awk)/, "GNU &amp;",1) }'
GNU Awk
GNU Awk is not Awkward
```

### There's a time and a place

Awk is a powerful tool, and regex are complex. You might think awk is so very powerful that it could easily replace **grep** and **sed** and **tr** and [**sort**][4] and many more, and in a sense, you'd be right. However, awk is just one tool in a toolbox that's overflowing with great options. You have a choice about what you use and when you use it, so don't feel that you have to use one tool for every job great and small.

With that said, awk really _is_ a powerful tool with lots of great functions. The more you use it, the better you get to know it. Remember its capabilities, and fall back on it occasionally so can you get comfortable with it.

Our next article will cover looping in Awk, so come back soon!

* * *

_This article is adapted from an episode of [Hacker Public Radio][5], a community technology podcast._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/how-regular-expressions-awk

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[lixin555](https://github.com/lixin555)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: https://opensource.com/article/19/10/intro-awk
[3]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[4]: https://opensource.com/article/19/10/get-sorted-sort
[5]: http://hackerpublicradio.org/eps.php?id=2129

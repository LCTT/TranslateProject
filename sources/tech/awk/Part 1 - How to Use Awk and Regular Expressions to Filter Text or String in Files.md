How to Use Awk and Regular Expressions to Filter Text or String in Files
=============================================================================

![](http://www.tecmint.com/wp-content/uploads/2016/04/Linux-Awk-Command-Examples.png)

When we run certain commands in Unix/Linux to read or edit text from a string or file, we most times try to filter output to a given section of interest. This is where using regular expressions comes in handy.

### What are Regular Expressions?

A regular expression can be defined as a strings that represent several sequence of characters. One of the most important things about regular expressions is that they allow you to filter the output of a command or file, edit a section of a text or configuration file and so on.

### Features of Regular Expression

Regular expressions are made of:

- Ordinary characters such as space, underscore(_), A-Z, a-z, 0-9.
- Meta characters that are expanded to ordinary characters, they include:
  - `(.)` it matches any single character except a newline.
  - `(*)` it matches zero or more existences of the immediate character preceding it.
  - `[ character(s) ]` it matches any one of the characters specified in character(s), one can also use a hyphen (-) to mean a range of characters such as [a-f], [1-5], and so on.
  - `^` it matches the beginning of a line in a file.
  - `$` matches the end of line in a file.
  - `\` it is an escape character.
  
In order to filter text, one has to use a text filtering tool such as awk. You can think of awk as a programming language of its own. But for the scope of this guide to using awk, we shall cover it as a simple command line filtering tool.

The general syntax of awk is:

```
# awk 'script' filename
```

Where `'script'` is a set of commands that are understood by awk and are execute on file, filename.

It works by reading a given line in the file, makes a copy of the line and then executes the script on the line. This is repeated on all the lines in the file.

The `'script'` is in the form `'/pattern/ action'` where pattern is a regular expression and the action is what awk will do when it finds the given pattern in a line.

### How to Use Awk Filtering Tool in Linux

In the following examples, we shall focus on the meta characters that we discussed above under the features of awk.

#### A simple example of using awk:

The example below prints all the lines in the file /etc/hosts since no pattern is given.

```
# awk '//{print}'/etc/hosts
```

![](http://www.tecmint.com/wp-content/uploads/2016/04/Awk-Command-Example.gif)
>Awk Prints all Lines in a File

#### Use Awk with Pattern:

I the example below, a pattern `localhost` has been given, so awk will match line having localhost in the `/etc/hosts` file.

```
# awk '/localhost/{print}' /etc/hosts 
```

![](http://www.tecmint.com/wp-content/uploads/2016/04/Use-Awk-Command-with-Pattern.gif)
>Awk Print Given Matching Line in a File

#### Using Awk with (.) wild card in a Pattern

The `(.)` will match strings containing loc, localhost, localnet in the example below.

That is to say *** l some_single_character c ***.

```
# awk '/l.c/{print}' /etc/hosts
```

![](http://www.tecmint.com/wp-content/uploads/2016/04/Use-Awk-with-Wild-Cards.gif)
>Use Awk to Print Matching Strings in a File

#### Using Awk with (*) Character in a Pattern

It will match strings containing localhost, localnet, lines, capable, as in the example below:

```
# awk '/l*c/{print}' /etc/localhost
```

![](http://www.tecmint.com/wp-content/uploads/2016/04/Use-Awk-to-Match-Strings-in-File.gif)
>Use Awk to Match Strings in File

You will also realize that `(*)` tries to a get you the longest match possible it can detect.

Let look at a case that demonstrates this, take the regular expression `t*t` which means match strings that start with letter `t` and end with `t` in the line below:

```
this is tecmint, where you get the best good tutorials, how to's, guides, tecmint. 
```

You will get the following possibilities when you use the pattern `/t*t/`:

```
this is t
this is tecmint
this is tecmint, where you get t
this is tecmint, where you get the best good t
this is tecmint, where you get the best good tutorials, how t
this is tecmint, where you get the best good tutorials, how tos, guides, t
this is tecmint, where you get the best good tutorials, how tos, guides, tecmint
```

And `(*)` in `/t*t/` wild card character allows awk to choose the the last option:

```
this is tecmint, where you get the best good tutorials, how to's, guides, tecmint
```

#### Using Awk with set [ character(s) ]

Take for example the set [al1], here awk will match all strings containing character a or l or 1 in a line in the file /etc/hosts.

```
# awk '/[al1]/{print}' /etc/hosts
```

![](http://www.tecmint.com/wp-content/uploads/2016/04/Use-Awk-to-Print-Matching-Character.gif)
>Use-Awk to Print Matching Character in File

The next example matches strings starting with either `K` or `k` followed by `T`:

```
# awk '/[Kk]T/{print}' /etc/hosts 
```

![](http://www.tecmint.com/wp-content/uploads/2016/04/Use-Awk-to-Print-Matched-String-in-File.gif)
>Use Awk to Print Matched String in File

#### Specifying Characters in a Range

Understand characters with awk:

- `[0-9]` means a single number
- `[a-z]` means match a single lower case letter
- `[A-Z]` means match a single upper case letter
- `[a-zA-Z]` means match a single letter
- `[a-zA-Z 0-9]` means match a single letter or number

Lets look at an example below:

```
# awk '/[0-9]/{print}' /etc/hosts 
```

![](http://www.tecmint.com/wp-content/uploads/2016/04/Use-Awk-To-Print-Matching-Numbers-in-File.gif)
>Use Awk To Print Matching Numbers in File

All the line from the file /etc/hosts contain at least a single number [0-9] in the above example.

#### Use Awk with (^) Meta Character

It matches all the lines that start with the pattern provided as in the example below:

```
# awk '/^fe/{print}' /etc/hosts
# awk '/^ff/{print}' /etc/hosts
```

![](http://www.tecmint.com/wp-content/uploads/2016/04/Use-Awk-to-Print-All-Matching-Lines-with-Pattern.gif)
>Use Awk to Print All Matching Lines with Pattern

#### Use Awk with ($) Meta Character

It matches all the lines that end with the pattern provided:

```
# awk '/ab$/{print}' /etc/hosts
# awk '/ost$/{print}' /etc/hosts
# awk '/rs$/{print}' /etc/hosts
```

![](http://www.tecmint.com/wp-content/uploads/2016/04/Use-Awk-to-Print-Given-Pattern-String.gif)
>Use Awk to Print Given Pattern String

#### Use Awk with (\) Escape Character

It allows you to take the character following it as a literal that is to say consider it just as it is.

In the example below, the first command prints out all line in the file, the second command prints out nothing because I want to match a line that has $25.00, but no escape character is used.

The third command is correct since a an escape character has been used to read $ as it is.

```
# awk '//{print}' deals.txt
# awk '/$25.00/{print}' deals.txt
# awk '/\$25.00/{print}' deals.txt
```

![](http://www.tecmint.com/wp-content/uploads/2016/04/Use-Awk-with-Escape-Character.gif)
>Use Awk with Escape Character

### Summary

That is not all with the awk command line filtering tool, the examples above a the basic operations of awk. In the next parts we shall be advancing on how to use complex features of awk. Thanks for reading through and for any additions or clarifications, post a comment in the comments section.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/use-linux-awk-command-to-filter-text-string-in-files/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/

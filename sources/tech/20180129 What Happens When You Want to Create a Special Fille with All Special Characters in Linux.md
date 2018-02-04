What Happens When You Want to Create a Special File with All Special Characters in Linux?
============================================================


![special chars](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/special-chars.png?itok=EEvlt5Nw "special chars")
Learn how to handle creation of a special file filled with special characters.[Used with permission][1]

I recently joined Holberton School as a student, hoping to learn full-stack software development. What I did not expect was that in two weeks I would be pretty much proficient with creating shell scripts that would make my coding life easy and fast!

So what is the post about? It is about a novel problem that my peers and I faced when we were asked to create a file with no regular alphabets/ numbers but instead special characters!! Just to give you a look at what kind of file name we were dealing with —

### \*\\’”Holberton School”\’\\*$\?\*\*\*\*\*:)

What a novel file name! Of course, this question was met with the collective groaning and long drawn sighs of all 55 (batch #5) students!

![1*Lf_XPhmgm-RB5ipX_lBjsQ.gif](https://cdn-images-1.medium.com/max/1600/1*Lf_XPhmgm-RB5ipX_lBjsQ.gif)

Some proceeded to make their lives easier by breaking the file name into pieces on a doc file and adding in the **“\\” or “\”** in front of certain special character which kind of resulted in this format -

#### \\*\\\\’\”Holberton School\”\\’\\\\*$\\?\\*\\*\\*\\*\\*:)

![1*p6s8WlysClalj0x2fQhGOg.gif](https://cdn-images-1.medium.com/max/1600/1*p6s8WlysClalj0x2fQhGOg.gif)

Everyone trying to get the \\ right

bamboozled? me, too! I did not want to believe that this was the only way to solve this, as I was getting frustrated with every “\\” or “\” that was required to escape and print those special characters as normal characters!

If you’re new to shell scripting, here is a quick walk through on why so many “\\” , “\” were required and where.

In shell scripting “ ” and ‘ ’ have special usage and once you understand and remember when and where to use them it can make your life easier!

#### Double Quoting

The first type of quoting we will look at is double quotes. **If you place text inside double quotes, all the special characters used by the shell lose their special meaning and are treated as ordinary characters. The exceptions are “$”, “\” (backslash), and “`” (back- quote).**This means that word-splitting, pathname expansion, tilde expansion, and brace expansion are suppressed, but parameter expansion, arithmetic expansion, and command substitution are still carried out. Using double quotes, we can cope with filenames containing embedded spaces.

So this means that you can create file with names that have spaces between words — if that is your thing, but I would suggest you to not do that as it is inconvenient and rather an unpleasant experience for you to try to find that file when you need !

**Quoting “THE” guide for linux I follow and read like it is the Harry Potter of the linux coding world —**

Say you were the unfortunate victim of a file called two words.txt. If you tried to use this on the command line, word-splitting would cause this to be treated as two separate arguments rather than the desired single argument:

**[[me@linuxbox][3] me]$ ls -l two words.txt**

```
ls: cannot access two: No such file or directory
ls: cannot access words.txt: No such file or directory
```

By using double quotes, you can stop the word-splitting and get the desired result; further, you can even repair the damage:

```
[me@linuxbox me]$ ls -l “two words.txt”
-rw-rw-r — 1 me me 18 2008–02–20 13:03 two words.txt
[me@linuxbox me]$ mv “two words.txt” two_words.t
```

There! Now we don’t have to keep typing those pesky double quotes.

Now, let us talk about single quotes and what is their significance in shell —

#### Single Quotes

Enclosing characters in single quotes (‘’’) preserves the literal value of each character within the quotes. A single quote may not occur between single quotes, even when preceded by a backslash.

Yes! that got me and I was wondering how will I use it, apparently when I was googling to find and easier way to do it I stumbled across this piece of information on the internet —

### Strong quoting

Strong quoting is very easy to explain:

Inside a single-quoted string **nothing** is interpreted, except the single-quote that closes the string.

```
echo 'Your PATH is: $PATH'
```

`$PATH` won't be expanded, it's interpreted as ordinary text because it's surrounded by strong quotes.

In practice that means to produce a text like `Here's my test…` as a single-quoted string, **you have to leave and re-enter the single quoting to get the character "`'`" as literal text:**

```
# WRONG
echo 'Here's my test...'
```

```
# RIGHT
echo 'Here'\''s my test...'
```

```
# ALTERNATIVE: It's also possible to mix-and-match quotes for readability:
echo "Here's my test"
```

Well now you’re wondering — “well that explains the quotes but what about the “\”??”

So for certain characters we need a special way to escape those pesky “\” we saw in that file name.

#### Escaping Characters

Sometimes you only want to quote a single character. To do this, you can precede a character with a backslash, which in this context is called the  _escape character_ . Often this is done inside double quotes to selectively prevent an expansion:

```
[me@linuxbox me]$ echo “The balance for user $USER is: \$5.00”
The balance for user me is: $5.00
```

It is also common to use escaping to eliminate the special meaning of a character in a filename. For example, it is possible to use characters in filenames that normally have special meaning to the shell. These would include “$”, “!”, “&”, “ “, and others. To include a special character in a filename you can to this:

```
[me@linuxbox me]$ mv bad\&filename good_filename
```

> _**To allow a backslash character to appear, escape it by typing “\\”. Note that within single quotes, the backslash loses its special meaning and is treated as an ordinary character.**_

Looking at the filename now we can understand better as to why the “\\” were used in front of all those “\”s.

So, to print the file name without losing “\” and other special characters what others did was to suppress the “\” with “\\” and to print the single quotes there are a few ways you can do that.

```
1. echo $'It\'s Shell Programming'  # ksh, bash, and zsh only, does not expand variables
2. echo "It's Shell Programming"   # all shells, expands variables
3. echo 'It'\''s Shell Programming' # all shells, single quote is outside the quotes
4\. echo 'It'"'"'s Shell Programming' # all shells, single quote is inside double quotes
```

```
for further reading please follow this link
```

Looking at option 3, I realized this would mean that I would only need to use “\” and single quotes at certain places to be able to write the whole file without getting frustrated with “\\” placements.

So with the hope in mind and lesser trial and errors I was actually able to print out the file name like this:

#### ‘\*\\’\’’”Holberton School”\’\’’\\*$\?\*\*\*\*\*:)’

to understand better I have added an **“a”** instead of my single quotes so that the file name and process becomes more clearer. For a better understanding, I’ll break them down into modules:

![1*hP1gmzbn7G7gUEhoynj1ew.gif](https://cdn-images-1.medium.com/max/1600/1*hP1gmzbn7G7gUEhoynj1ew.gif)

#### a\*\\a \’ a”Holberton School”\a \’ a\\*$\?\*\*\*\*\*:)a

#### Module 1 — a\*\\a

Here the use of single quote (a) creates a safe suppression for \*\\ and as mentioned before in strong quoting, the only way we can print the ‘ is to leave and re-enter the single quoting to get the character.

#### Module 2 , 4— \’

The \ suppresses the single quote as a standalone module.

#### Module 3 — a”Holberton School”\a

Here the use of single quote (a) creates a safe suppression for double quotes and \ along with regular text.

#### Module 5 — a\\*$\?\*\*\*\*\*:)a

Here the use of single quote (a) creates a safe suppression for all special characters being used such as *, \, $, ?, : and ).

so in the end I was able to be lazy and maintain my sanity, and got away with only using single quotes to create small modules and “\” in certain places.

![1*rO34jp-bYSkCnHSdwoO3qQ.gif](https://cdn-images-1.medium.com/max/1600/1*rO34jp-bYSkCnHSdwoO3qQ.gif)

And, that is how I was able to get the file to work right! After a few misses, it felt amazing and it was great to learn a new way to do things!

![1*PE9_VtcfGGQjnYMwJ8YB1A.gif](https://cdn-images-1.medium.com/max/1600/1*PE9_VtcfGGQjnYMwJ8YB1A.gif)

Handled that curve-ball pretty well! Hope this helps you in the future when, someday you might need to create a special file for a special reason in shell!

 _**Mitali Sengupta **is a former digital marketing professional, currently enrolled as a full-stack engineering student at Holberton School. She is passionate about innovation in AI and Blockchain technologies.. You can contact Mitali on [Twitter][4], [LinkedIn][5] or [GitHub][6]._

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/what-happens-when-you-want-create-special-file-all-special-characters-linux

作者：[MITALI SENGUPTA ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/mitalisengupta
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/files/images/special-charspng
[3]:mailto:me@linuxbox
[4]:https://twitter.com/aadhiBangalan
[5]:https://www.linkedin.com/in/mitali-sengupta-auger
[6]:https://github.com/MitaliSengupta
[7]:http://mywiki.wooledge.org/Quotes#Examples
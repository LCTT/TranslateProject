[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to use Bash history commands)
[#]: via: (https://opensource.com/article/20/6/bash-history-commands)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

How to use Bash history commands
======
Bash's history command surpasses all other Linux shell history
interfaces in the number of features it offers.
![Person typing on a 1980's computer][1]

Bash has a rich history. That is, it's an old shell with an even older ancestor (the Bourne shell), but it also has a great `history` command that surpasses all other shell history interfaces based on its number of features. The [Bash][2] version of `history` allows for reverse searches, quick recall, rewriting history, and more.

The `history` command isn't like many other commands. You might be used to commands being executable files placed in common system-level locations like `/usr/bin`, `/usr/local/bin`, or `~/bin`. The built-in `history` command isn't in your `PATH` and has no physical location:


```
$ which history

which: no history in [PATH]
```

Instead, `history` is a built-in function of the shell itself:


```
$ type history
history is a shell builtin
$ help history
history: history [-c] [-d offset] [n] or
history -anrw [filename] or
history -ps arg [arg...]

Display or manipulate the history list.
[...]
```

For that reason, the history function in each shell is unique, so what you use in Bash may not work in Tcsh or Fish or Dash, and what you use in those may not work in Bash. In some cases, knowing what Bash can do may inspire users of other shells to create interesting hacks to clone Bash behavior, and it may unlock Bash features that you never knew existed.

### View your Bash history

The most basic and frequent use of the `history` command is to view a history of your shell session:


```
$ echo "hello"
hello
$ echo "world"
world
$ history
  1  echo "hello"
  2  echo "world"
  3  history
```

### Event designators

Event designators search through your history by event. An _event_ in this context is a command logged in your history, delineated by a newline character. In other words, it's one line, marked by an index number for reference.

Event designators mostly start with an exclamation point, sometimes also called a _bang_ (`!`).

To rerun a command from your history, use the exclamation point followed immediately (no spaces) by the index number of the command you want. For instance, assume line 1 contains the command `echo "hello"`, and you want to run it again:


```
$ !1
echo "hello"
hello
```

You can use relative positioning by providing a negative number of lines back from your current position in history. For example, to go back three entries in history:


```
$ echo "foo"
foo
$ echo "bar"
bar
$ echo "baz"
baz
$ !-3
echo "foo"
foo
```

If you're just going back one line, you can use the shorthand `!!` instead of `!-1`. That's a savings of one whole keystroke!


```
$ echo "foo"
$ !!
echo "foo"
foo
```

### String search

You can also search for a specific string through the entries, in reverse, for a command to run. To search for a command _starting_ with a specific string, use an exclamation point followed immediately (no space) by the string you want to search for:


```
$ echo "foo"
$ true
$ false
$ !echo
echo "foo"
foo
```

You can also search for a command containing a string in any position (not just at the start). To do that, use `!` plus the string you're searching for, as usual, but surround the string with question marks on either end. You may omit the trailing question mark if you know that the string is immediately followed by a newline character (meaning it's the last thing you typed before you pressed **Return**):


```
$ echo "foo"
$ true
$ false
$ !?foo?
echo "foo"
foo
```

### String substitution

Similar to searching for strings at the start of a line, you can search for a string and replace it with a new string, changing the command:


```
$ echo "hello"
hello
$ echo "world"
world
$ ^hello^foo
echo "foo"
foo
```

### Make history useful

In Bash, the history command is capable of much more than what's been covered here, but this is a good start for getting used to _using_ your history instead of just treating it as a reference. Use the `history` command often, and see how much you can do without having to type commands. You might surprise yourself!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/bash-history-commands

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/1980s-computer-yearbook.png?itok=eGOYEKK- (Person typing on a 1980's computer)
[2]: https://opensource.com/resources/what-bash

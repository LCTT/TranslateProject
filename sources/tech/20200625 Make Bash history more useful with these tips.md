[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Make Bash history more useful with these tips)
[#]: via: (https://opensource.com/article/20/6/bash-history-control)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Make Bash history more useful with these tips
======
Tell Bash what you want it to remember—or even rewrite history by
deleting entries you don't want or need.
![A person programming][1]

A Linux terminal running [Bash][2] has a built-in history that you can use to track what you've been doing lately. To view a history of your Bash session, use the built-in command `history`:


```
$ echo "foo"
foo
$ echo "bar"
bar
$ history
  1  echo "foo"
  2  echo "bar"
  3  history
```

The `history` command isn't an executable file on your filesystem, like most commands, but a function of Bash. You can verify this by using the `type` command:


```
$ type history
history is a shell builtin
```

### History control

The upper limit of lines in your shell history is defined by the `HISTSIZE` variable. You can set this variable in your `.bashrc` file. The following sets your history to 3,000 lines, after which the oldest line is removed to make room for the newest command, placed at the bottom of the list:


```
`export HISTSIZE=3000`
```

There are other history-related variables, too. The `HISTCONTROL` variable controls what history is stored. You can force Bash to exclude commands starting with empty space by placing this in your `.bashrc` file:


```
`export HISTCONTROL=$HISTCONTROL:ignorespace`
```

Now, if you type a command starting with a space, that command won't get recorded in history:


```
$ echo "hello"
$     mysql -u bogus -h badpassword123 mydatabase
$ echo "world"
$ history
  1  echo "hello"
  2  echo "world"
  3  history
```

You can avoid duplicate entries, too:


```
`export HISTCONTROL=$HISTCONTROL:ignoredups`
```

Now, if you type two commands, one after another, only one appears in history:


```
$ ls
$ ls
$ ls
$ history
  1  ls
  2  history
```

If you like both of these ignores, you can just use `ignoreboth`:


```
`export HISTCONTROL=$HISTCONTROL:ignoreboth`
```

### Remove a command from history

Sometimes you make a mistake and type something sensitive into your shell, or maybe you just want to clean up your history so that it more accurately represents the steps you took to get something working correctly. If you want to delete a command from your history in Bash, use the `-d` option with the line number of the item you want to remove:


```
$ echo "foo"
foo
$ echo "bar"
bar
$ history | tail
  535  echo "foo"
  536  echo "bar"
  537  history | tail
$ history -d 536
$ history | tail
  535  echo "foo"
  536  history | tail
  537  history -d 536
  538  history | tail
```

To stop adding `history` entries, you can place a `space` before the command, as long as you have `ignorespace` in your `HISTCONTROL` environment variable:


```
$  history | tail
  535  echo "foo"
  536  echo "bar"
$  history -d 536
$  history | tail
  535  echo "foo"
```

You can clear your entire session history with the `-c` option:


```
$ history -c
$  history
$
```

### History lessons

Manipulating history is usually less dangerous than it sounds, especially when you're curating it with a purpose in mind. For instance, if you're documenting a complex problem, it's often best to use your session history to record your commands because, by slotting them into your history, you're running them and thereby testing the process. Very often, documenting without doing leads to overlooking small steps or writing minor details wrong.

Use your history sessions as needed, and exercise your power over history wisely. Happy history hacking!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/bash-history-control

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_keyboard_laptop_development_code_woman.png?itok=vbYz6jjb (A person programming)
[2]: https://opensource.com/resources/what-bash

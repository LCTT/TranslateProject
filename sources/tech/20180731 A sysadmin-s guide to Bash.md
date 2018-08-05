translating by Flowsnow
A sysadmin's guide to Bash
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/build_structure_tech_program_code_construction.png?itok=nVsiLuag)

Each trade has a tool that masters in that trade wield most often. For many sysadmins, that tool is their [shell][1]. On the majority of Linux and other Unix-like systems out there, the default shell is Bash.

Bash is a fairly old program—it originated in the late 1980s—but it builds on much, much older shells, like the C shell ([csh][2]), which is easily 10 years its senior. Because the concept of a shell is that old, there is an enormous amount of arcane knowledge out there waiting to be consumed to make any sysadmin guy's or gal's life a lot easier.

Let's take a look at some of the basics.

Who has, at some point, unintentionally ran a command as root and caused some kind of issue? raises hand

I'm pretty sure a lot of us have been that guy or gal at one point. Very painful. Here are some very simple tricks to prevent you from hitting that stone a second time.

### Use aliases

First, set up aliases for commands like **`mv`** and **`rm`** that point to `mv -I` and `rm -I`. This will make sure that running `rm -f /boot` at least asks you for confirmation. In Red Hat Enterprise Linux, these aliases are set up by default if you use the root account.

If you want to set those aliases for your normal user account as well, just drop these two lines into a file called .bashrc in your home directory (these will also work with sudo):
```
alias mv='mv -i'

alias rm='rm -i'

```

### Make your root prompt stand out

Another thing you can do to prevent mishaps is to make sure you are aware when you are using the root account. I usually do that by making the root prompt stand out really well from the prompt I use for my normal, everyday work.

If you drop the following into the .bashrc file in root's home directory, you will have a root prompt that is red on black, making it crystal clear that you (or anyone else) should tread carefully.
```
export PS1="\[$(tput bold)$(tput setab 0)$(tput setaf 1)\]\u@\h:\w # \[$(tput sgr0)\]"

```

In fact, you should refrain from logging in as root as much as possible and instead run the majority of your sysadmin commands through sudo, but that's a different story.

Having implemented a couple of minor tricks to help prevent "unintentional side-effects" of using the root account, let's look at a couple of nice things Bash can help you do in your daily work.

### Control your history

You probably know that when you press the Up arrow key in Bash, you can see and reuse all (well, many) of your previous commands. That is because those commands have been saved to a file called .bash_history in your home directory. That history file comes with a bunch of settings and commands that can be very useful.

First, you can view your entire recent command history by typing **`history`** , or you can limit it to your last 30 commands by typing **`history 30`**. But that's pretty vanilla. You have more control over what Bash saves and how it saves it.

For example, if you add the following to your .bashrc, any commands that start with a space will not be saved to the history list:
```
HISTCONTROL=ignorespace

```

This can be useful if you need to pass a password to a command in plaintext. (Yes, that is horrible, but it still happens.)

If you don't want a frequently executed command to show up in your history, use:
```
HISTCONTROL=ignorespace:erasedups

```

With this, every time you use a command, all its previous occurrences are removed from the history file, and only the last invocation is saved to your history list.

A history setting I particularly like is the **`HISTTIMEFORMAT`** setting. This will prepend all entries in your history file with a timestamp. For example, I use:
```
HISTTIMEFORMAT="%F %T  "

```

When I type **`history 5`** , I get nice, complete information, like this:
```
1009  2018-06-11 22:34:38  cat /etc/hosts

1010  2018-06-11 22:34:40  echo $foo

1011  2018-06-11 22:34:42  echo $bar

1012  2018-06-11 22:34:44  ssh myhost

1013  2018-06-11 22:34:55  vim .bashrc

```

That makes it a lot easier to browse my command history and find the one I used two days ago to set up an SSH tunnel to my home lab (which I forget again, and again, and again…).

### Best Bash practices

I'll wrap this up with my top 11 list of the best (or good, at least; I don't claim omniscience) practices when writing Bash scripts.

  11. Bash scripts can become complicated and comments are cheap. If you wonder whether to add a comment, add a comment. If you return after the weekend and have to spend time figuring out what you were trying to do last Friday, you forgot to add a comment.


  10. Wrap all your variable names in curly braces, like **`${myvariable}`**. Making this a habit makes things like `${variable}_suffix` possible and improves consistency throughout your scripts.


  9. Do not use backticks when evaluating an expression; use the **`$()`** syntax instead. So use:
```
     for  file in $(ls); do
```


not
```
     for  file in `ls`; do

```

The former option is nestable, more easily readable, and keeps the general sysadmin population happy. Do not use backticks.



  8. Consistency is good. Pick one style of doing things and stick with it throughout your script. Obviously, I would prefer if people picked the **`$()`** syntax over backticks and wrapped their variables in curly braces. I would prefer it if people used two or four spaces—not tabs—to indent, but even if you choose to do it wrong, do it wrong consistently.


  7. Use the proper shebang for a Bash script. As I'm writing Bash scripts with the intention of only executing them with Bash, I most often use **`#!/usr/bin/bash`** as my shebang. Do not use **`#!/bin/sh`** or **`#!/usr/bin/sh`**. Your script will execute, but it'll run in compatibility mode—potentially with lots of unintended side effects. (Unless, of course, compatibility mode is what you want.)


  6. When comparing strings, it's a good idea to quote your variables in if-statements, because if your variable is empty, Bash will throw an error for lines like these:
```
    if [ ${myvar} == "foo" ]; then

      echo "bar"

    fi

```

And will evaluate to false for a line like this:
```
    if [ "${myvar}" == "foo" ]; then

      echo "bar"

    fi
```

Also, if you are unsure about the contents of a variable (e.g., when you are parsing user input), quote your variables to prevent interpretation of some special characters and make sure the variable is considered a single word, even if it contains whitespace.



  5. This is a matter of taste, I guess, but I prefer using the double equals sign ( **`==`** ) even when comparing strings in Bash. It's a matter of consistency, and even though—for string comparisons only—a single equals sign will work, my mind immediately goes "single equals is an assignment operator!"


  4. Use proper exit codes. Make sure that if your script fails to do something, you present the user with a written failure message (preferably with a way to fix the problem) and send a non-zero exit code:
```
     # we have failed

    echo "Process has failed to complete, you need to manually restart the whatchamacallit"

    exit 1

```

This makes it easier to programmatically call your script from yet another script and verify its successful completion.



  3. Use Bash's built-in mechanisms to provide sane defaults for your variables or throw errors if variables you expect to be defined are not defined:
```
  # this sets the value of $myvar to redhat, and prints 'redhat'

    echo ${myvar:=redhat}

    # this throws an error reading 'The variable myvar is undefined, dear reader' if $myvar is undefined

    ${myvar:?The variable myvar is undefined, dear reader}

```



  2. Especially if you are writing a large script, and especially if you work on that large script with others, consider using the **`local`** keyword when defining variables inside functions. The **`local`** keyword will create a local variable, that is one that's visible only within that function. This limits the possibility of clashing variables.


  1. Every sysadmin must do it sometimes: debug something on a console, either a real one in a data center or a virtual one through a virtualization platform. If you have to debug a script that way, you will thank yourself for remembering this: Do not make the lines in your scripts too long!

On many systems, the default width of a console is still 80 characters. If you need to debug a script on a console and that script has very long lines, you'll be a sad panda. Besides, a script with shorter lines—the default is still 80 characters—is a lot easier to read and understand in a normal editor, too!




I truly love Bash. I can spend hours writing about it or exchanging nice tricks with fellow enthusiasts. Make sure you drop your favorites in the comments!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/admin-guide-bash

作者：[Maxim Burgerhout][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/wzzrd
[1]:http://www.catb.org/jargon/html/S/shell.html
[2]:https://en.wikipedia.org/wiki/C_shell

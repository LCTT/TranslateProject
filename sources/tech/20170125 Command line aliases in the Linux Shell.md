Command line aliases in the Linux Shell
============================================================

### On this page

1.  [Command line aliases in Linux][1]
2.  [Related details][2]
3.  [Conclusion][3]

So far, in this tutorial series, we have discussed the basic usage as well as related details of the [cd -][5] and **pushd**/**popd** commands, as well as the **CDPATH** environment variable. In this fourth and the final installment, we will discuss the concept of aliases as well how you can use them to make your command line navigation easier and smoother.

As always, before jumping on to the heart of the tutorial, it's worth sharing that all the instructions as well examples presented in this article have been tested on Ubuntu 14.04LTS. The command line shell we've used is bash (version  4.3.11).

### Command line aliases in Linux

In layman's terms, aliases can be thought of as short names or abbreviations to a complex command or a group of commands, including their arguments or options. So basically, with aliases, you create easy to remember names for not-so-easy-to-type/remember commands.

For example, the following command creates an alias 'home' for the 'cd ~' command:

alias home="cd ~"

This means that now you can quickly type 'home' and press enter whenever you want to come back to your home directory from anywhere on your system.

Here's what the alias command man page says about this utility:

```
The alias utility shall create or redefine alias definitions or write the values of existing alias definitions to standard output. An alias definition provides a string value that shall replace a command name when it is encountered

An alias definition shall affect the current shell execution environment and the execution environments of the subshells of the current shell. When used as specified by this volume of IEEE Std 1003.1-2001, the alias definition shall not affect the parent process of the current shell nor any utility environment invoked by the shell.
```

So, how exactly aliases help in command line navigation? Well, here's a simple example:

Suppose you are working in the _/home/himanshu/projects/howtoforge_ directory, which further contains many subdirectories, and sub-subdirectories. For example, following is one complete directory branch:

```
/home/himanshu/projects/howtoforge/command-line/navigation/tips-tricks/part4/final
```

Now imagine, you are in the 'final' directory, and then you want to get back to the 'tips-tricks' directory, and from there, you need to get back to the 'howtoforge' directory. What would you do?

Well, normally, you'd run the following set of commands:

cd ../..

cd ../../..

While this approach isn't wrong per se, it's definitely not convenient, especially when you've to go back, say 5 directories in a very long path. So, what's the solution? The answer is: aliases.

What you can do is, you can create easy to remember (and type) aliases for each of the _cd .._ commands. For example:

alias bk1="cd .."
alias bk2="cd ../.."
alias bk3="cd ../../.."
alias bk4="cd ../../../.."
alias bk5="cd ../../../../.."

So now whenever you want to go back, say 5 places, from your current working directory, you can just run the following command:

bk5

Isn't that easy now?

### Related details

While the technique we've used to define aliases so far (using the alias command) on the shell prompt does the trick, the aliases exist only for the current terminal session. There are good chances that you may want aliases defined by you to persist so that they can be used in any new command line terminal window/tab you launch thereafter.

For this, you need to define your aliases in the _~/.bash_aliases_ file, which is loaded by your _~/.bashrc_ file by default (please verify this if you are using an older Ubuntu version).

Following is the excerpt from my .bashrc file that talks about the .bash_aliases file:

```
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then 
      . ~/.bash_aliases
fi
```

Once you've added an alias definition to your .bash_aliases file, that alias will be available on any and every new terminal. However, you'll not be able to use it in any other terminal which was already open when you defined that alias - the way out is to source .bashrc from those terminals. Following is the exact command that you'll have to run:

source ~/.bashrc

If that sounds a little too much of work (yes, I am looking at you LAZY ONES), then here's a shortcut to do all this:

"alias [the-alias]" >> ~/.bash_aliases && source ~/.bash_aliases

Needless to say, you'll have to replace [the-alias] with the actual command. For example:

"alias bk5='cd ../../../../..'" >> ~/.bash_aliases && source ~/.bash_aliases

Moving on, now suppose you've created some aliases, and have been using them on and off for a few months. Suddenly, one day, you doubt that one of them isn't working as expected. So you feel the need to look at the exact command that was assigned to that alias. What would you do?

Of course, you can open your .bash_aliases file and take a look there, but this process can be a bit time consuming, especially when the file contains a lot of aliases. So, if you're looking for an easy way out, here's one: all you have to do is to run the _alias_ command with the alias-name as argument.

Here's an example:

$ alias bk6
alias bk6='cd ../../../../../..'

As you can see, the aforementioned command displayed the actual command assigned to the bk6 alias. There's one more way: to use the _type_ command. Following is an example:

$ type bk6
bk6 is aliased to `cd ../../../../../..'

So the type command produces a more human-understandable output.

Another thing worth sharing here is that you can use aliases for the common typos you make. For example:

alias mroe='more'

_Finally, it's also worth mentioning that not everybody is in favor of using aliases. Most of them argue that once you get used to the aliases you define for your ease, it gets really difficult for you to work on some other system where those aliases don't exist (and you're not allowed to create any as well). For more (as well as precise reasons) why some experts don't recommend using aliases, you can head[here][4]. _

### Conclusion

Like the CDPATH environment variable we discussed in the previous part, alias is also a double edged sword that one should use very cautiously. Don't get discouraged though, as everything has its own advantages and disadvantages. Just that practice and complete knowledge is the key when you're dealing with concepts like aliases.

So this marks the end of this tutorial series. Hope you enjoyed it as well learned some new things/concepts from it. In case you have any doubts or queries, please share them with us (and the rest of the world) in comments below.

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/command-line-aliases-in-linux/

作者：[Ansh][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/command-line-aliases-in-linux/
[1]:https://www.howtoforge.com/tutorial/command-line-aliases-in-linux/#command-line-aliases-in-linux
[2]:https://www.howtoforge.com/tutorial/command-line-aliases-in-linux/#related-details
[3]:https://www.howtoforge.com/tutorial/command-line-aliases-in-linux/#conclusion
[4]:http://unix.stackexchange.com/questions/66934/why-is-aliasing-over-standard-commands-not-recommended
[5]:https://www.howtoforge.com/tutorial/linux-command-line-navigation-tips-and-tricks-part-1/

How to Customize Bash Colors and Content in Linux Terminal Prompt
============================================================

Today, Bash is the default shell in most (if not all) modern Linux distributions. However, you may have noticed that the text color in the terminal and the prompt content can be different from one distro to another.

In case you have been wondering how to customize this for better accessibility or mere whim, keep reading – in this article we will explain how to do just that.

### The PS1 Bash Environment Variable

The command prompt and terminal appearance are governed by an environment variable called `PS1`. According to the Bash man page, PS1 represents the primary prompt string which is displayed when the shell is ready to read a command.

The allowed content in PS1 consists of several backslash-escaped special characters whose meaning is listed in the PROMPTING section of the man page.

To illustrate, let’s display the current content of `PS1` in our system (this may be somewhat different in your case):

```
$ echo $PS1
[\u@\h \W]\$
```

We will now explain how to customize PS1 as per our needs.

#### Customizing the PS1 Format

According to the PROMPTING section in the man page, this is the meaning of each special character:

1.  `\u:` the username of the current user.
2.  `\h:` the hostname up to the first dot (.) in the Fully-Qualified Domain Name.
3.  `\W:` the basename of the current working directory, with $HOME abbreviated with a tilde (~).
4.  `\$:` If the current user is root, display #, $ otherwise.

For example, we may want to consider adding `\!` If we want to display the history number of the current command, or `\H` if we want to display the FQDN instead of the short server name.

In the following example we will import both into our current environment by executing this command:

```
PS1="[\u@\H \W \!]\$"
```

When you press Enter you will see that the prompt content changes as shown below. Compare the prompt before and after executing the above command:

[
 ![Customize Linux Terminal Prompt PS1](http://www.tecmint.com/wp-content/uploads/2017/01/Customize-Linux-Terminal-Prompt.png) 
][1]

Customize Linux Terminal Prompt PS1

Now let’s go one step further and change the color of the user and hostname in command prompt – both the text and its surrounding background.

Actually, we can customize 3 aspects of the prompt:

| Text Format | Foreground (text) color | Background color |
| 0: normal text | 30: Black | 40: Black |
| 1: bold | 31: Red | 41: Red |
| 4: Underlined text | 32: Green | 42: Green |
|  | 33: Yellow | 43: Yellow |
|  | 34: Blue | 44: Blue |
|  | 35: Purple | 45: Purple |
|  | 36: Cyan | 46: Cyan |
|  | 37: White | 47: White |

We will use the `\e` special character at the beginning and an `m` at the end to indicate that what follows is a color sequence.

In this sequence the three values (background, format, and foreground) are separated by commas (if no value is given the default is assumed).

**Suggested Read:** [Learn Bash Shell Scripting in Linux][2]

Also, since the value ranges are different, it does not matter which one (background, format, or foreground) you specify first.

For example, the following `PS1` will cause the prompt to appear in yellow underlined text with red background:

```
PS1="\e[41;4;33m[\u@\h \W]$ "
```
[
 ![Change Linux Terminal Color Prompt PS1](http://www.tecmint.com/wp-content/uploads/2017/01/Change-Linux-Terminal-Color-Prompt.png) 
][3]

Change Linux Terminal Color Prompt PS1

As good as it looks, this customization will only last for the current user session. If you close your terminal or exit the session, the changes will be lost.

In order to make these changes permanent, you will have to add the following line to `~/.bashrc` or `~/.bash_profile` depending on your distribution:

```
PS1="\e[41;4;33m[\u@\h \W]$ "
```

Feel free to play around with the colors to find what works best for you.

##### Summary

In this article we have explained how to customize the color and content of your Bash prompt. If you have questions or suggestions about this post, feel free to use the comment form below to reach us. We look forward to hearing from you!

--------------------------------------------------------------------------------

作者简介：Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

![](http://1.gravatar.com/avatar/4e444ab611c7b8c7bcb76e58d2e82ae0?s=128&d=blank&r=g)

--------------------------------------------------------------------------------

via: http://www.tecmint.com/customize-bash-colors-terminal-prompt-linux/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/wp-content/uploads/2017/01/Customize-Linux-Terminal-Prompt.png
[2]:http://www.tecmint.com/category/bash-shell/
[3]:http://www.tecmint.com/wp-content/uploads/2017/01/Change-Linux-Terminal-Color-Prompt.png

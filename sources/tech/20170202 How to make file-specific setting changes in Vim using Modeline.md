How to make file-specific setting changes in Vim using Modeline
============================================================
ch-cn translating

### On this page

1.  [VIM Modeline][2]
    1.  [Usage][1]
2.  [Conclusion][3]

While [plugins][4] are no doubt one of Vim's biggest strengths, there are several other functionalities that make it one of the most powerful and feature-rich text editors/IDEs available to Linux users today. One of these functionalities is the ability to make file-specific setting changes. This ability can be accessed using the editor's Modeline feature.

In this article, we will discuss how you can use Vim's [Modeline][5] feature using easy to understand examples.

But before we start doing that, it's worth mentioning that all the examples, commands, and instructions mentioned in this tutorial have been tested on Ubuntu 16.04, and the Vim version we've used is 7.4.

### VIM Modeline

### Usage

As we've already mentioned, Vim's Modeline feature lets you make file-specific changes. For example, suppose you want to replace all the tabs used in a particular file of your project with spaces, and make sure that all other files aren't affected by this change. This is an ideal use-case where Modeline helps you in what you want to do.

So, what you can do is, you can put the following line in the beginning or end of the file in question:

```
# vim: set expandtab:
```

There are high chances that if you try doing the aforementioned exercise to test the use-case on your Linux machine, things won't work as expected. If that's the case, worry not, as the Modeline feature needs to be activated first in some cases (it's disabled by default on systems such as Debian, Ubuntu, Gentoo, and OSX for security reasons).

To enable the feature, open the .vimrc file (located in your home directory), and then add the following line to it:

```
set modeline
```

Now, whenever you enter a tab and save the file (where the expandtab modeline command was entered), the tab will automatically convert into white spaces.

Let's consider another use-case. Suppose the default tab space in Vim is set to 4, but for a particular file, you want to increase it to 8. For this, you need to add the following line in the beginning or the end of the file:

```
// vim: noai:ts=8:
```

Now try entering a tab and you'll see that the number of spaces it covers will be 8. 

You might have noticed me saying that these modeline commands need to be entered somewhere near the top or the bottom of the file. If you're wondering why this is so, the reason is that the feature is designed this way. The following lines (taken from the official Vim documentation) should make this more clear:

"The modeline cannot be anywhere in the file: it must be in the first or last few lines. The exact location where vim checks for the modeline is controlled by the `modelines` variable; see :help modelines. By default, it is set to 5 lines."

And here's what the :help modelines command (referred to in the above lines) says:

If 'modeline' is on 'modelines' gives the number of lines that is checked for set commands. If 'modeline' is off or 'modelines' is zero no lines are checked.

Try and put the modeline command beyond the default 5 lines (either from the bottom or from the top) range, and you'll notice that tab spaces will revert to the Vim default - in my case that's 4 spaces.

However, you can change this behavior if you want, using the following command in your .vimrc file. 

```
set modelines=[new-value]
```

For example, I increased the value from 5 to 10.

```
set modelines=10
```

This means that now I can put the modeline command anywhere between first or last 10 lines of the file.

Moving on, at any point in time, while editing a file, you can enter the following (with the Vim editor in the command mode) to see the current modeline-related settings as well as where they were last set.

```
:verbose set modeline? modelines?
```

For example, in my case, the above command produced the following output:

```
 modeline
      Last set from ~/.vimrc
 modelines=10
      Last set from ~/.vimrc
```

Here are some of the important points you need to know about Vim's Modeline feature:

*   This feature is enabled by default for Vim running in nocompatible (non Vi-compatible) mode, but some notable distributions of Vim disable this option in the system vimrc for security.
*   The feature is disabled by default when editing as root (if you've opened the file using 'sudo' then there's no issue - the feature works).
*   With '`set'`, the modeline ends at the first colon not following a backslash. And without '`set'`, no text can follow the options. For example, **/* vim: noai:ts=4:sw=4 */** is an invalid modeline.

### Security Concerns

Sadly, Vim's Modeline feature can be used to compromise security. In fact, multiple security-related Modeline issues have been reported in the past, including [shell command injection][6], [arbitrary commands execution][7], [unauthorized access][8], and more. Agreed, most of these are old, and would have been fixed by now, but it does give an idea that the Modeline feature could be misused by hackers.

### Conclusion

Modeline may be an advanced feature of the Vim editor, but it's not very difficult to understand. There's no doubt that a bit of learning curve involved, but that's not much to ask for given how useful the feature is. Of course, there are security concerns, which means that you should weigh your options before enabling and using the feature.

Have you ever used the Modeline feature? How was your experience? Share with us (and the whole HowtoForge community) in the comments below.

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/vim-modeline-settings/

作者：[ Ansh][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/vim-modeline-settings/
[1]:https://www.howtoforge.com/tutorial/vim-modeline-settings/#usage
[2]:https://www.howtoforge.com/tutorial/vim-modeline-settings/#vim-modeline
[3]:https://www.howtoforge.com/tutorial/vim-modeline-settings/#conclusion
[4]:https://www.howtoforge.com/tutorial/vim-editor-plugins-for-software-developers-3/
[5]:http://vim.wikia.com/wiki/Modeline_magic
[6]:https://tools.cisco.com/security/center/viewAlert.x?alertId=13223
[7]:http://usevim.com/2012/03/28/modelines/
[8]:https://tools.cisco.com/security/center/viewAlert.x?alertId=5169

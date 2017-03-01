yangmingming translating
How to access shell or run external commands from within Vim
============================================================

### On this page

1.  [Execute external commands in Vim][1]
2.  [Access Shell in Vim][2]
3.  [The loophole to keep in mind][3]

Vim, as you might already know, is a feature-packed and powerful editor. Here at HowtoForge, we've written several tutorials on Vim, covering its [basic usage][4], [plugins][5], as well as some [other][6] [useful][7] features. But given the sea of features Vim offers, we always find something useful to share with our readership.

In this tutorial, we will focus on how you can execute external commands as well as access the command line shell from within the editor window.

But before we start doing that, it's worth mentioning that all the examples, commands, and instructions mentioned in this tutorial have been tested on Ubuntu 14.04, and the Vim version we've used is 7.4.

### Execute external commands in Vim

Sometimes you might want to execute external commands from within the Vim editor window. For example, consider a situation where-in you've opened a file in Vim, made some changes, and then while trying to save those changes, Vim throws an error saying you don't have sufficient permissions.

[
 ![Execute commands in VIM](https://www.howtoforge.com/images/how-to-access-shell-or-run-external-commands-from-within-vim/vim-perm-error.png) 
][8]

Now, exiting the current vim session and again opening the file with sufficient privileges will mean loss of all the changes you've done, so that'd, you'll agree, not be an option in most of the cases. It's situations like these where the ability to run external commands from within the editor comes in handy.

We'll come back to the above use-case later(**), but for now, let's understand how you can run basic commands from within vim.

Suppose while editing a file, you want to know the number of lines, words, and characters the file contains. To do this, in the command mode of Vim, just input colon (:) followed by a bang (!) and finally the command ('wc' in this case) followed by the file name (use % for current file).

```
:! wc %
```

Here's an example:

File with the aforementioned command ready to be executed:

[
 ![Command ready to be executed in VIM](https://www.howtoforge.com/images/how-to-access-shell-or-run-external-commands-from-within-vim/vim-count-lines.png) 
][9]

and here's the output on the terminal:

[
 ![command output](https://www.howtoforge.com/images/how-to-access-shell-or-run-external-commands-from-within-vim/vim-wc-output.png) 
][10]

After you are done seeing the output, press the Enter key and you'll be taken back to your Vim session.

This feature can come in really handy in situations where, say, you are writing a code or script, and want to quickly know whether or not the code/script contains any compile-time or syntax errors.

Moving on, in case the requirement is to add the output to the file, use the ':read !' command. Here's an example:

```
:read ! wc %
```

The 'read' command inserts the output of the external command on a new line below the current line in the file being edited. If you want, you can also specify a particular line number - the output will be added after that particular line.

For example, the following command will add the output of 'wc' after the second line the file.

```
:2read ! wc %
```

**Note**: Use '$' to insert after the last line and '0' to insert before the first line.

Now, coming back to the usecase we discussed in the beginning (**), here's the command that'll help you save the file without needing to close it first (which means no loss of unsaved changes) and then opening it with, say, [sudo][11]. 

```
:w ! sudo tee %
```

[
 ![](https://www.howtoforge.com/images/how-to-access-shell-or-run-external-commands-from-within-vim/vim-sudo-passwrd.png) 
][12]

### Access Shell in Vim

In addition to executing individual commands, you can also have yourself dropped in a newly-launched shell from within Vim. For this, all you have to do is to run the following command from the editor:

```
:shell
```

or

```
:sh
```

and type 'exit' when you are done with the shell work - this will bring you back into the Vim session from where you left initially.

### The loophole to keep in mind

While the ability to access a shell definitely has its own uses in real world, it can also be used as a privilege escalation technique. As we have explained in one of our earlier tutorials (on sudoedit), even if you provide a user sudo access to only edit one file through Vim, they may launch a new shell from within the editor using this technique, and will then be able to do anything as 'root' or superuser.

# Conclusion

Ability to run external commands from within Vim is an important feature that can come in handy in many situations (some of them we have mentioned in this tutorial). The learning curve for this feature isn't steep, so both beginners as well as experienced users can take advantage of it.

Have you been using this feature for quite some time now? Do you have something to share? Please leave your thoughts in comments below.

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-access-shell-or-run-external-commands-from-within-vim/

作者：[Himanshu Arora][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/how-to-access-shell-or-run-external-commands-from-within-vim/
[1]:https://www.howtoforge.com/tutorial/how-to-access-shell-or-run-external-commands-from-within-vim/#execute-external-commands-in-vim
[2]:https://www.howtoforge.com/tutorial/how-to-access-shell-or-run-external-commands-from-within-vim/#access-shell-in-vim
[3]:https://www.howtoforge.com/tutorial/how-to-access-shell-or-run-external-commands-from-within-vim/#the-loophole-to-keep-in-mind
[4]:https://www.howtoforge.com/vim-basics
[5]:https://www.howtoforge.com/tutorial/vim-editor-plugins-for-software-developers-3/
[6]:https://www.howtoforge.com/tutorial/vim-modeline-settings/
[7]:https://www.howtoforge.com/tutorial/vim-editor-modes-explained/
[8]:https://www.howtoforge.com/images/how-to-access-shell-or-run-external-commands-from-within-vim/big/vim-perm-error.png
[9]:https://www.howtoforge.com/images/how-to-access-shell-or-run-external-commands-from-within-vim/big/vim-count-lines.png
[10]:https://www.howtoforge.com/images/how-to-access-shell-or-run-external-commands-from-within-vim/big/vim-wc-output.png
[11]:https://www.howtoforge.com/tutorial/sudo-beginners-guide/
[12]:https://www.howtoforge.com/images/how-to-access-shell-or-run-external-commands-from-within-vim/big/vim-sudo-passwrd.png

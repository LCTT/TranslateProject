Understanding Linux cd Command with Examples
================================================================================
The cd command is the most basic command in *nix world. What linux cd command does is it changes your current working directory. This article details about this command, what this command can do and the internals about the command.

### cd command: An internal command ###

The BASH shell is the default shell in most Linux distributions. The shell has some internal commands of its own. cd is one od the internal commands. I will explain what internal commands are and why cd is an internal command. First, confirm that your current shell with SHELL environment variable:

![](http://linoxide.com/wp-content/uploads/2013/12/01.cd_shell.png)

Now check with which command what is the path of cd command binary(if any):

![](http://linoxide.com/wp-content/uploads/2013/12/02.cd_which.png)

It results in no output. Its because no binary is present on the system for cd command. Still you are able to execute the command. This is because cd is an BASH internal command. Internal commands are built into the shell. Another internal command ‘type’ will give you the information that cd is internal command.

![](http://linoxide.com/wp-content/uploads/2013/12/03.cd_type.png)

If you try to access the manual entry for any internal command, there is no separate manual page for them.

![](http://linoxide.com/wp-content/uploads/2013/12/04.cd_man.png)

For these internal commands, no separate process is created. So they are very fast.

To get full list of internal commands, you can give help command (which itself is an internal command):

![](http://linoxide.com/wp-content/uploads/2013/12/05.cd_help_1.png)

![](http://linoxide.com/wp-content/uploads/2013/12/06.cd_help_2.png)

### Why cd is internal command? ###

To keep things simple, I won’t go into much details, but it requires a little understanding of Unix processes to understand the answer to this question.
Whenever a processes is created by BASH, it is executed in a subshell of BASH (child process of current BASH process). The new processes makes changes and outputs (if reqquired) and no property of this subshell is returned to the parent when the process dies. Note that cd command changed the PWD of the shell. If cd were an external command, it would have changed the PWD of the subshell, returning nothing to the parent shell. And hence, the PWD of the shell will never change. All the commands that make changes to the environment of the shell, must be implemented as internal command. we could never achieve what we require by making cd an external command.

Now let us explore cd command usage.

### cd command usage: ###

If you issue cd command without any argument, it will take you to your home directory, no matter what your current directory is.

![](http://linoxide.com/wp-content/uploads/2013/12/07.cd_home.png)

The tilde sign (~) also represents the home directory. You can se this as well to go to your home directory.

![](http://linoxide.com/wp-content/uploads/2013/12/08.cd_home_tilde.png)

If you are root, you can go to any user’s home directory by using tilde sign followed by that user’s name. In some Linux distributions, unpriviledged users do not by default have permission to go to other users’ home directories. 

![](http://linoxide.com/wp-content/uploads/2013/12/09.cd_home_user.png)

The . directory represents the current directory and the .. represents the parent directory. To go to parent directory, use ..

![](http://linoxide.com/wp-content/uploads/2013/12/10.cd_parent.png)

The . directory will not change your PWD in most of the cases. For example:

![](http://linoxide.com/wp-content/uploads/2013/12/11.cd_dot.png)

But if your current directory is renamed somehow, then your PWD will be changed with this command:

![](http://linoxide.com/wp-content/uploads/2013/12/12.cd_dot_renamed.png)

In BASH and most of other shells, you can provide two types of paths: Absolute path and Relative path. Absolute paths begin with / and are independent of your PWD. On the other hand, relative paths never begin with / and depend what your PWD is.

Changing PWD with absolute path:

![](http://linoxide.com/wp-content/uploads/2013/12/13.cd_abs_path.png)

Changing PWD with relative path:

![](http://linoxide.com/wp-content/uploads/2013/12/14cd_rel_path.png)

Toggling between two directories:

The “cd -” command will take you to the last working directory. You can toggle between two directories with this command.

![](http://linoxide.com/wp-content/uploads/2013/12/15.cd_toggle.png)

The last working directory is strored in OLDPWD variable. If you try to use previous command in a new terminal, it shows following error:

![](http://linoxide.com/wp-content/uploads/2013/12/16.cd_OLDPWD_not_set.png)

![](http://linoxide.com/wp-content/uploads/2013/12/16.cd_OLDPWD_not_set.png)

You can use some bash tricks as well with cd command.
With ? wild card:

![](http://linoxide.com/wp-content/uploads/2013/12/17.cd_question_mark_wild_card.png)

Using *

![](http://linoxide.com/wp-content/uploads/2013/12/18.cd_star_wild_card.png)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-cd-command-examples/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:
[2]:
[3]:
[4]:
[5]:
[6]:
[7]:
[8]:
[9]:
[10]:
[11]:
[12]:
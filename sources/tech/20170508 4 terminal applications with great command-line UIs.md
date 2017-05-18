4 terminal applications with great command-line UIs
============================================================

### We look at a few well-designed CLI programs and how they overcome some discoverability problems.


![4 awesome command-line tools](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/code_computer_development_programming.png?itok=wMspQJcO "4 awesome command-line tools")
>Image by : opensource.com

In this article, I'll look at a shortcoming of command-line interfaces—discoverability—and a few ways to overcome this problem.

I love command lines. My first command line was DOS 6.2, back in 1997\. I learned the syntax for various commands and showed off how to list hidden files in a directory (**attrib**). I would carefully craft my commands one character at a time. When I made a mistake, I would proceed to retype the command from the beginning. One fine day someone showed me how to traverse the history using the up and down arrow keys and I was blown away.

Programming and development

*   [New Python content][1]

*   [Our latest JavaScript articles][2]

*   [Recent Perl posts][3]

*   [Red Hat Developers Blog][4]

Later when I was introduced to Linux, I was pleasantly surprised that up and down arrows retained their ability to traverse the history. I was still typing each character meticulously, but by now I knew how to touch type and I was doing exceedingly well with my 55 words per minute. Then someone showed me tab-completion and changed my life once again.

In GUI applications menus, tool tips and icons are used to advertise a feature for the user. Command lines lack that ability, but there are ways to overcome this problem. Before diving into solutions, I'll look at a couple of problematic CLI apps:

### 1\. MySQL

First we have our beloved MySQL REPL. I often find myself typing **SELECT * FROM** and then press **Tab** out of habit. MySQL asks whether I'd like to see all 871 possibilities. I most definitely don't have 871 tables in my database. If I said **yes**, it shows a bunch of SQL keywords, tables, functions, and so on.

![MySQL gif](https://opensource.com/sites/default/files/mysql.gif)

### 2\. Python

Let's look at another example, the standard Python REPL. I start typing a command and press the **Tab** key out of habit. Lo and behold a **Tab** character is inserted, which is a problem considering that a **Tab** character has no business in a Python source code.

![Python gif](https://opensource.com/sites/default/files/python.gif "Python gif")

### Good UX

Now let's look at well-designed CLI programs and how they overcome some discoverability problems.

### Auto-completion: bpython

[Bpython][15] is a fancy replacement for the Python REPL. When I launch bpython and start typing, suggestions appear right away. I haven't triggered them via a special key combo, not even the famed **Tab** key.

![bpython gif](https://opensource.com/sites/default/files/bpython.gif "bpython gif")

When I press the **Tab** key out of habit, it completes the first suggestion from the list. This is a great example of bringing discoverability to CLI design.

The next aspect of bpython is the way it surfaces documentation for modules and functions. When I type in the name of a function, it presents the function signature and the doc string attached with the function. What an incredibly thoughtful design.

### Context-aware completion: mycli

[Mycli][16] is a modern alternative to the default MySQL client. This tool does to MySQL what bpython does to the standard Python REPL. Mycli will auto-complete keywords, table names, columns, and functions as you type them.

The completion suggestions are context-sensitive. For example, after the **SELECT * FROM**, only tables from the current database are listed in the completion, rather than every possible keyword under the sun.

![mycli gif](https://opensource.com/sites/default/files/mycli.gif "mycli gif")

### Fuzzy search and online Help: pgcli

If you're looking for a PostgreSQL version of mycli, check out [pgcli][17]. As with mycli, context-aware auto-completion is presented. The items in the menu are narrowed down using fuzzy search. Fuzzy search allows users to type sub-strings from different parts of the whole string to try and find the right match.

![pgcli gif](https://opensource.com/sites/default/files/pgcli.gif "pgcli gif")

Both pgcli and mycli implement this feature in their CLI. Documentation for slash commands are presented as part of the completion menu.

### Discoverability: fish

In traditional Unix shells (Bash, zsh, etc.), there is a way to search your history. This search mode is triggered by **Ctrl-R**. This is an incredibly useful tool for recalling a command you ran last week that starts with, for example, **ssh** or **docker**. Once you know this feature, you'll find yourself using it often.

If this feature is so useful, why not do this search all the time? That's exactly what the [**fish** shell][18] does. As soon as you start typing a command, **fish** will start suggesting commands from history that are similar to the one you're typing. You can then press the right arrow key to accept that suggestion.

### Command-line etiquette

I've reviewed innovative ways to solve the discoverability problems, but there are command-line basics everyone should implement as part of the basic REPL functionality:

*   Make sure the REPL has a history that can be recalled via the arrow keys. Make sure the history persists between sessions.

*   Provide a way to edit the command in an editor. No matter how awesome your completions are, sometimes users just need an editor to craft that perfect command to drop all the tables in production.

*   Use a pager to pipe the output. Don't make the user scroll through their terminal. Oh, and use sane defaults for your pager. (Add the option to handle color codes.)

*   Provide a way to search the history either via the **Ctrl-R** interface or the **fish**-style auto-search.

### Conclusion

In part 2, I'll look at specific libraries in Python that allow you to implement these techniques. In the meantime, check out some of these well-designed command-line applications:

*   [bpython][5] or [ptpython][6]: Fancy REPL for Python with auto-completion support.

*   [http-prompt][7]: An interactive HTTP client.

*   [mycli][8]: A command-line interface for MySQL, MariaDB, and Percona with auto-completion and syntax highlighting.

*   [pgcli][9]: An alternative to [psql][10] with auto-completion and syntax-highlighting.

*   [wharfee][11]: A shell for managing Docker containers.

 _Learn more in Amjith Ramanujam's  [PyCon US 2017][12] talk, [Awesome Commandline Tools][13], May 20th in Portland, Oregon._

--------------------------------------------------------------------------------


作者简介：

Amjith Ramanujam - Amjith Ramanujam is the creator of pgcli and mycli. People think they're pretty cool and he doesn't disagree. He likes programming in Python, Javascript and C. He likes to write simple, understandable code, sometimes he even succeeds.

-----------------------

via: https://opensource.com/article/17/5/4-terminal-apps

作者：[Amjith Ramanujam ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/amjith
[1]:https://opensource.com/tags/python?src=programming_resource_menu
[2]:https://opensource.com/tags/javascript?src=programming_resource_menu
[3]:https://opensource.com/tags/perl?src=programming_resource_menu
[4]:https://developers.redhat.com/?intcmp=7016000000127cYAAQ&src=programming_resource_menu
[5]:http://bpython-interpreter.org/
[6]:http://github.com/jonathanslenders/ptpython/
[7]:https://github.com/eliangcs/http-prompt
[8]:http://mycli.net/
[9]:http://pgcli.com/
[10]:https://www.postgresql.org/docs/9.2/static/app-psql.html
[11]:http://wharfee.com/
[12]:https://us.pycon.org/2017/
[13]:https://us.pycon.org/2017/schedule/presentation/518/
[14]:https://opensource.com/article/17/5/4-terminal-apps?rate=3HL0zUQ8_dkTrinonNF-V41gZvjlRP40R0RlxTJQ3G4
[15]:https://bpython-interpreter.org/
[16]:http://mycli.net/
[17]:http://pgcli.com/
[18]:https://fishshell.com/
[19]:https://opensource.com/user/125521/feed
[20]:https://opensource.com/article/17/5/4-terminal-apps#comments
[21]:https://opensource.com/users/amjith

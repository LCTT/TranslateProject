[#]: collector: (lujun9972)
[#]: translator: (nophDog)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Customizing Bash)
[#]: via: (https://fedoramagazine.org/customizing-bash/)
[#]: author: (Stephen Snow https://fedoramagazine.org/author/jakfrost/)

Customizing Bash
======

![][1]

The outermost layer of your operating system – the part you interact with – is called the [shell][2]. Fedora comes with several preinstalled shells. Shells can be either graphical or text-based. In documentation, you will often see the acronyms GUI (Graphical User Interface) and CLI (Command-Line Interface) used to distinguish between graphical and text-based shells/interfaces. Other [GUI][3] and [CLI][4] shells can be used, but [GNOME][5] is Fedora’s default GUI and [Bash][6] is its default CLI.

The remainder of this article will cover recommended dotfile practices for the Bash CLI.

### Bash overview

From the Bash reference manual:

> At its base, a shell is simply a macro processor that executes commands. The term macro processor means functionality where text and symbols are expanded to create larger expressions.
>
> Reference Documentation for Bash
>  Edition 5.0, for Bash Version 5.0.
>  May 2019

In addition to helping the user start and interact with other programs, the Bash shell also includes several built-in commands and keywords. Bash’s built-in functionality is extensive enough that it is considered a [high-level programming language][7] in its own right. Several of Bash’s keywords and operators resemble those of [the C programming language][8].

Bash can be invoked in either interactive or non-interactive mode. Bash’s interactive mode is the typical terminal/command-line interface that most people are familiar with. [GNOME Terminal][9], by default, launches Bash in interactive mode. An example of when Bash runs in non-interactive mode is when commands and data are [piped][10] to it from a file or shell script. Other modes of operation that Bash can operate in include: login, non-login, remote, POSIX, unix sh, restricted, and with a different UID/GID than the user. Various combinations of these modes are possible. For example interactive+restricted+POSIX or non-interactive+non-login+remote. Which startup files Bash will process depends on the combination of modes that are requested when it is invoked. Understanding these modes of operation is necessary when modifying the startup files.

According to the Bash reference manual, Bash …

> 1\. Reads its input from a file …, from a string supplied as an argument to the -c invocation option …, or from the user’s terminal.
>
> 2\. Breaks the input into words and operators, obeying [its] quoting rules. … These tokens are separated by metacharacters. Alias expansion is performed by this step.
>
> 3\. Parses the tokens into simple and compound commands.
>
> 4\. Performs the various shell expansions …, breaking the expanded tokens into lists of filenames … and commands and arguments.
>
> 5\. Performs any necessary redirections … and removes the redirection operators and their operands from the argument list.
>
> 6\. Executes the command.
>
> 7\. Optionally waits for the command to complete and collects its exit status.
>
> Reference Documentation for Bash
>  Edition 5.0, for Bash Version 5.0.
>  May 2019

When a user starts a terminal emulator to access the command line, an interactive shell session is started. GNOME Terminal, by default, launches the user’s shell in non-login mode. Whether GNOME Terminal launches the shell in login or non-login mode can be configured under _Edit_ → _Preferences_ → _Profiles_ → _Command_. Login mode can also be requested by passing the _–login_ flag to Bash on startup. Also note that Bash’s _login_ and _non-interactive_ modes are not exclusive. It is possible to run Bash in both _login_ and _non-interactive_ mode at the same time.

### Invoking Bash

Unless it is passed the ***—***_noprofile_ flag, a Bash login shell will read and execute the commands found in certain initialization files. The first of those files is _/etc/profile_ if it exists, followed by one of _~/.bash_profile_, _~/.bash_login_, or _~/.profile_; searched in that order. When the user exits the login shell, or if the script calls the _exit_ built-in in the case of a non-interactive login shell, Bash will read and execute the commands found in _~/.bash_logout_ followed by _/etc/bash_logout_ if it exists. The file _/etc/profile_ will normally source _/etc/bashrc_, reading and executing commands found there, then search through _/etc/profile.d_ for any files with an _sh_ extension to read and execute. As well, the file _~/.bash_profile_ will normally source the file _~/.bashrc_. Both _/etc/bashrc_ and _~/.bashrc_ have checks to prevent double sourcing.

An interactive shell that is not a login shell, will source the _~/.bashrc_ file when it is first invoked. This is the usual type of shell a user will enter when opening a terminal on Fedora. When Bash is started in non-interactive mode – as it is when running a shell script – it will look for the _BASH_ENV_ variable in the environment. If it is found, will expand the value, and use the expanded value as the name of a file to read and execute. Bash behaves just as if the following command were executed:

```
if [ -n "$BASH_ENV" ]; then . "$BASH_ENV"; fi
```

It is important to note that the value of the _PATH_ variable is not used to search for the filename.

### Important user-specific dotfiles

Bash’s best-known user dotfile is _~/.bashrc_. Most user customization is done by editing this file. Most user customization, may be a stretch since there are reasons to modify all of the mentioned files; as well as other files that have not been mentioned. Bash’s environment is designed to be highly customizable in order to suit the needs of many different users with many different tastes.

![][11]

When a Bash login shell exits cleanly, _~/.bash_logout_ and then _/etc/bash_logout_ will be called if they exist. The next diagram is a sequence diagram showing the process Bash follows when being invoked as an interactive shell. The below sequence is followed, for example, when the user opens a terminal emulator from their desktop environment.

![][12]

Armed with the knowledge of how Bash behaves under different invocation methods, it becomes apparent that there are only a few typical invocation methods to be most concerned with. These are the non-interactive and interactive login shell, and the non-interactive and interactive non-login shell. If global environment customizations are needed, then the desired settings should be placed in a uniquely-named file with a _.sh_ extension (_custom.sh_, for example) and that file should be placed in the _/etc/profile.d_ directory.

The non-interactive, non-login invocation method needs special attention. This invocation method causes Bash to check the _BASH_ENV_ variable. If this variable is defined, the file it references will be sourced. Note that the values stored in the _PATH_ environment variable are not utilized when processing _BASH_ENV_. So it must contain the full path to the file to be sourced. For example, if someone wanted the settings from their _~/.bashrc_ file to be available to shell scripts they run non-interactively, they could place something like the following in a file named _/etc/profile.d/custom.sh_ …

```
# custom.sh
.
.
.
#If Fedora Workstation
BASH_ENV="/home/username/.bashrc"
.
.
.
#If Fedora Silverblue Workstation
BASH_ENV="/var/home/username/.bashrc"

export BASH_ENV
```

The above profile drop-in script will cause the user’s _~/.bashrc_ file to be sourced just before every shell script is executed.

Users typically customizie their system environment so that it will better fit their work habits and preferences. An example of the sort of customization that a user can make is an alias. Commands frequently run with the same set of starting parameters are good candidates for aliases. Some example aliases are provided in the _~/.bashrc_ file shown below.

```
# .bashrc
# Source global definitions
if [ -f /etc/bashrc ];
   then . /etc/bashrc
fi
.
.
.
# User specific aliases and functions
alias ls='ls -hF --color=auto'
alias la='ls -ahF --color=auto'
# make the dir command work kinda like in windows (long format)
alias dir='ls --color=auto --format=long'
# make grep highlight results using color
alias grep='grep --color=auto'
```

Aliases are a way to customize various commands on your system. They can make commands more convenient to use and reduce your keystrokes. Per-user aliases are often configured in the user’s _~/.bashrc_ file.

If you find you are looking back through your command line history a lot, you may want to configure your history settings. Per-user history options can also be configured in _~/.bashrc_. For example, if you have a habit of using multiple terminals at once, you might want to enable the _histappend_ option. Bash-specific shell options that are [boolean][13] in nature (take either _on_ or _off_ as a value) are typically enabled or disabled using the _shopt_ built-in command. Bash settings that take a more complex value (for example, _HISTTIMEFORMAT_) tend to be configured by assigning the value to an environment variable. Customizing Bash with both shell options and environment variable is demonstrated below.

```
# Configure Bash History

# Expand dir env vars on tab and set histappend
shopt -s direxpand histappend

#  - ignoreboth = ignorespace and ignoredup
HISTCONTROL='ignoreboth'

# Controls the format of the time in output of `history`
HISTTIMEFORMAT="[%F %T] "

# Infinite history
# NB: on newer bash, anything < 0 is the supported way, but on CentOS/RHEL
# at least, only this works
HISTSIZE=
HISTFILESIZE=

# or for those of us on newer Bash
HISTSIZE=-1
HISTFILESIZE=-1
```

The _direxpand_ option shown in the example above will cause Bash to replace directory names with the results of word expansion when performing filename completion. This will change the contents of the readline editing buffer, so what you typed is masked by what the completion expands it to.

The _HISTCONTROL_ variable is used to enable or disable some filtering options for the command history. Duplicate lines, lines with leading blank spaces, or both can be filtered from the command history by configuring this setting. To quote Dusty Mabe, the engineer I got the tip from:

> _ignoredup_ makes history not log duplicate entries (if you are running a command over and over). _ignorespace_ ignores entries with a space in the front, which is useful if you are setting an environment variable with a secret or running a command with a secret that you don’t want logged to disk. _ignoreboth_ does both.
>
> Dusty Mabe – Redhat Principle Software Engineer, June 19, 2020

For users who do a lot of work on the command line, Bash has the _CDPATH_ environment variable. If _CDPATH_ is configured with a list of directories to search, the _cd_ command, when provided a relative path as its first argument, will check all the listed directories in order for a matching subdirectory and change to the first one found.

```
# .bash_profile

# set CDPATH
CDPATH="/var/home/username/favdir1:/var/home/username/favdir2:/var/home/username/favdir3"

# or could look like this
CDPATH="/:~:/var:~/favdir1:~/favdir2:~/favdir3"

export CDPATH
```

_CDPATH_ should be updated the same way _PATH_ is typically updated – by referencing itself on the right hand side of the assignment to preserve the previous values.

```
# .bash_profile

# set CDPATH
CDPATH="/var/home/username/favdir1:/var/home/username/favdir2:/var/home/username/favdir3"

# or could look like this
CDPATH="/:~:/var:~/favdir1:~/favdir2:~/favdir3"

CDPATH="$CDPATH:~/favdir4:~/favdir5"

export CDPATH
```

_PATH_ is another very important variable. It is the search path for commands on the system. Be aware that some applications require that their own directories be included in the _PATH_ variable to function properly. As with _CDPATH_, appending new values to _PATH_ can be done by referencing the old values on the right hand side of the assignment. If you want to prepend the new values instead, simply place the old values (_$PATH_) at the end of the list. Note that on Fedora, the list values are separated with the colon character (**:**).

```
# .bash_profile

# Add PATH values to the PATH Environment Variable
PATH="$PATH:~/bin:~:/usr/bin:/bin:~/jdk-13.0.2:~/apache-maven-3.6.3"

export PATH
```

The command prompt is another popular candidate for customization. The command prompt has seven customizable parameters:

> **PROMPT_COMMAND** If set, the value is executed as a command prior to issuing each primary prompt ($PS1).
>
> **PROMPT_DIRTRIM** If set to a number greater than zero, the value is used as the number of trailing directory components to retain when expanding the \w and \W prompt string escapes. Characters removed are replaced with an ellipsis.
>
> **PS0** The value of this parameter is expanded like _PS1_ and displayed by interactive shells after reading a command and before the command is executed.
>
> **PS1** The primary prompt string. The default value is ‘**\s-\v\$** ‘. …
>
> **PS2** The secondary prompt string. The default is ‘_**&gt;**_ ‘. _PS2_ is expanded in the same way as _PS1_ before being displayed.
>
> **PS3** The value of this parameter is used as the prompt for the _select_ command. If this variable is not set, the _select_ command prompts with ‘**#?** ‘
>
> **PS4** The value of this parameter is expanded like _PS1_ and the expanded value is the prompt printed before the command line is echoed when the _-x_ option is set. The first character of the expanded value is replicated multiple times, as necessary, to indicate multiple levels of indirection. The default is ‘_**+**_ ‘.
>
> Reference Documentation for Bash
>  Edition 5.0, for Bash Version 5.0.
>  May 2019

An entire article could be devoted to this one aspect of Bash. There are copious quantities of information and examples available. Some example dotfiles, including prompt reconfiguration, are provided in a repository linked at the end of this article. Feel free to use and experiment with the examples provided in the repository.

### Conclusion

Now that you are armed with a little knowledge about how Bash works, feel free to modify your Bash dotfiles to suit your own needs and preferences. Pretty up your prompt. Go nuts making aliases. Or otherwise make your computer truly yours. Examine the content of _/etc/profile_, _/etc/bashrc_, and _/etc/profile.d/_ for inspiration.

Some comments about terminal emulators are fitting here. There are ways to setup your favorite terminal to behave exactly as you want. You may have already realized this, but often this modification is done with a … wait for it … dotfile in the users home directory. The terminal emulator can also be started as a login session, and some people always use login sessions. How you use your terminal, and your computer, will have a bearing on how you modify (or not) your dotfiles.

If you’re curious about what type session you are in at the command line the following script can help you determine that.

```
#!/bin/bash

case "$-" in
   (*i*) echo This shell is interactive ;;
   (*) echo This shell is not interactive ;;
esac
```

Place the above in a file, mark it executable, and run it to see what type of shell you are in. _$-_ is a variable in Bash that contains the letter **i** when the shell is interactive. Alternatively, you could just echo the $- variable and inspect the output for the presence of the **i** flag:

```
$ echo $-
```

### Reference information

The below references can be consulted for more information and examples. The Bash man page is also a great source of information. Note that your local man page is guaranteed to document the features of the version of Bash you are running whereas information found online can sometimes be either too old (outdated) or too new (not yet available on your system).

<https://opensource.com/tags/command-line>

<https://opensource.com/downloads/bash-cheat-sheet>

You will have to enter a valid email address at the above site, or sign up, to download from it.

<https://opensource.com/article/19/12/bash-script-template>

Community members who provided contributions to this article in the form of example dotfiles, tips, and other script files:

  * Micah Abbott – Principal Quality Engineer
  * John Lebon – Principal Software Engineer
  * Dusty Mabe – Principal Software Engineer
  * Colin Walters – Senior Principal Software Engineer



A repository of example dotfiles and scripts can be found here:

<https://github.com/TheOneandOnlyJakfrost/bash-article-repo>

Please carefully review the information provided in the above repository. Some of it may be outdated. There are many examples of not only dotfiles for Bash, but also custom scripts and pet container setups for development. I recommend starting with John Lebon’s dotfiles. They are some of the most detailed I have seen and contain very good descriptions throughout. Enjoy!

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/customizing-bash/

作者：[Stephen Snow][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/jakfrost/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/05/bashenvironment-816x346.png
[2]: https://en.wikipedia.org/wiki/Shell_(computing)
[3]: https://fedoramagazine.org/fedoras-gaggle-of-desktops/
[4]: https://en.wikipedia.org/wiki/Comparison_of_command_shells
[5]: https://en.wikipedia.org/wiki/GNOME
[6]: https://en.wikipedia.org/wiki/Bash_(Unix_shell)
[7]: https://en.wikipedia.org/wiki/High-level_programming_language
[8]: https://en.wikipedia.org/wiki/C_(programming_language)
[9]: https://en.wikipedia.org/wiki/GNOME_Terminal
[10]: https://en.wikipedia.org/wiki/Pipeline_(Unix)
[11]: https://fedoramagazine.org/wp-content/uploads/2020/06/bash-initialization-1-1024x711.png
[12]: https://fedoramagazine.org/wp-content/uploads/2020/06/bash-initialization-2-1024x544.png
[13]: https://en.wikipedia.org/wiki/Boolean_data_type

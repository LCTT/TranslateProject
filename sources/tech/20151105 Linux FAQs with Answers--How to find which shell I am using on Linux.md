Linux FAQs with Answers--How to find which shell I am using on Linux
================================================================================
> **Question**: I often change between different shells at the command line. Is there a quick and easy way to find out which shell I am currently in? Also how can I find out the version of the shell?

### Find out Which Shell You are In ###

There are different ways to tell what shell you are currently in. The easiest way to find that out is by using special shell parameters.

For one, [a special parameter named "$$"][1] denotes the PID of the current instance of the shell you are running. This parameter is read-only and cannot be modified. So the following command will also show you the name of the shell you are running:

    $ ps -p $$

----------

      PID TTY          TIME CMD
    21666 pts/4    00:00:00 bash

The above command works across all available shells.

If you are not using csh, another way to find out the current shell is to use an special shell parameter called "$$", which denotes the name of the shell or shell script that is currently running. This is one of the Bash special parameters, but available in other shells as well, such as sh, zsh, tcsh or dash. Using echo command to print out its value will tell you the name of the shell you are currently in.

    $ echo $0

----------

    bash

Don't be confused with a separate environment variable called $SHELL, which is set to the full path to your default shell. As such, this variable is not necessarily point to the current shell you are using. For example, $SHELL remains the same even if you invoke a different shell within a terminal.

    $ echo $SHELL

----------

    /bin/shell

![](https://c2.staticflickr.com/6/5688/22544087680_4a9c180485_c.jpg)

Thus to find out the current shell, you should use either $$ or $0, but not $SHELL.

### Find out the Version of the Shell You are Using ###

Once you know which shell you are in, you may want to find out what version of the shell it is. For that, type the name of your shell followed by "--version" at the command line. For example:

**For** bash **shell**:

    $ bash --version

----------

    GNU bash, version 4.3.30(1)-release (x86_64-pc-linux-gnu)
    Copyright (C) 2013 Free Software Foundation, Inc.
    License GPLv3+: GNU GPL version 3 or later 
    
    This is free software; you are free to change and redistribute it.
    There is NO WARRANTY, to the extent permitted by law.

**For** zsh **shell**:

    $ zsh --version

----------

    zsh 5.0.7 (x86_64-pc-linux-gnu)

**For** tcsh **shell**:
    $ tcsh --version

----------

    tcsh 6.18.01 (Astron) 2012-02-14 (x86_64-unknown-linux) options wide,nls,dl,al,kan,rh,nd,color,filec

For some shells, you can also use shell-specific variables (e.g., $BASH_VERSION or $ZSH_VERSION).

    $ echo $BASH_VERSION

----------

    4.3.8(1)-release

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/which-shell-am-i-using.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://ask.xmodulo.com/process-id-pid-shell-script.html
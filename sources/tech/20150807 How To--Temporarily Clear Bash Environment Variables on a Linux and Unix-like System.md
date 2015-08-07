Translating by ictlyh
How To: Temporarily Clear Bash Environment Variables on a Linux and Unix-like System
================================================================================
I'm a bash shell user. I would like to temporarily clear bash shell environment variables. I do not want to delete or unset an exported environment variable. How do I run a program in a temporary environment in bash or ksh shell?

You can use the env command to set and print environment on a Linux or Unix-like systems. The env command executes utility after modifying the environment as specified on the command line.

### How do I display my current environment? ###

Open the terminal application and type any one of the following command:

    printenv

OR

    env

Sample outputs:

![Fig.01: Unix/Linux: List All Environment Variables Command](http://s0.cyberciti.org/uploads/faq/2015/08/env-unix-linux-command-output.jpg)
Fig.01: Unix/Linux: List All Environment Variables Command

### Counting your environment variables ###

Type the following command:

    env | wc -l
    printenv | wc -l

Sample outputs:

    20

### Run a program in a clean environment in bash/ksh/zsh ###

The syntax is as follows:

    env -i your-program-name-here arg1 arg2 ...

For example, run the wget program without using http_proxy and/or all other variables i.e. temporarily clear all bash/ksh/zsh environment variables and run the wget program:

    env -i /usr/local/bin/wget www.cyberciti.biz
    env -i wget www.cyberciti.biz

This is very useful when you want to run a command ignoring any environment variables you have set. I use this command many times everyday to ignore the http_proxy and other environment variable I have set.

#### Example: With the http_proxy ####

    $ wget www.cyberciti.biz
    --2015-08-03 23:20:23--  http://www.cyberciti.biz/
    Connecting to 10.12.249.194:3128... connected.
    Proxy request sent, awaiting response... 200 OK
    Length: unspecified [text/html]
    Saving to: 'index.html'
    index.html                 [  <=>                         ]  36.17K  87.0KB/s   in 0.4s
    2015-08-03 23:20:24 (87.0 KB/s) - 'index.html' saved [37041]

#### Example: Ignore the http_proxy ####

    $ env -i /usr/local/bin/wget www.cyberciti.biz
    --2015-08-03 23:25:17--  http://www.cyberciti.biz/
    Resolving www.cyberciti.biz... 74.86.144.194
    Connecting to www.cyberciti.biz|74.86.144.194|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: unspecified [text/html]
    Saving to: 'index.html.1'
    index.html.1               [  <=>                         ]  36.17K   115KB/s   in 0.3s
    2015-08-03 23:25:18 (115 KB/s) - 'index.html.1' saved [37041]

The option -i causes env command to completely ignore the environment it inherits. However, it does not prevent your command (such as wget or curl) setting new variables. Also, note down the side effect of running bash/ksh shell:

    env -i env | wc -l ## empty ##
    # Now run bash ##
    env -i bash
    ## New enviroment set by bash program ##
    env | wc -l

#### Example: Set an environmental variable ####

The syntax is:

    env var=value /path/to/command arg1 arg2 ...
    ## OR ## 
    var=value  /path/to/command arg1 arg2 ...

For example set http_proxy:

    env http_proxy="http://USER:PASSWORD@server1.cyberciti.biz:3128/" \
    /usr/local/bin/wget www.cyberciti.biz

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/linux-unix-temporarily-clearing-environment-variables-command/

作者：Vivek Gite
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出
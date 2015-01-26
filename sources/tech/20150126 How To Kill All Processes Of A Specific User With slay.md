Translating---geekpi

How To Kill All Processes Of A Specific User With ‘slay’
================================================================================
**slay** written by **Chris Ausbrooks** is a command line tool that can be used to kill all running processes of a specific user. slay will be useful to system administrators who finds out certain users are running process they shouldn’t have.

slay is available in the official repositories of most distros.

To install

### Ubuntu and it’s derivatives ###

    sudo apt-get install slay

### Arch Linux and Its derivatives ###

    sudo pacman -S slay

### Fedora and its derivatives ###

    sudo yum install slay

### Usage ###

You need administrative rights to use slay,

to kill all processes of a specific user all you need is:

    sudo slay <usename>

For example; if I want to kill all processes of a user named **amitooo**

    ~ sudo slay amitooo
    slay: Done.

![](http://180016988.r.cdn77.net/wp-content/uploads/2015/01/slay-amitoo-kpenee.png)

You should see feedback for slay when done slaying.

Enjoy.

--------------------------------------------------------------------------------

via: http://www.unixmen.com/kill-processes-specific-user-slay/

作者：[ Enock Seth Nyamador][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/seth/
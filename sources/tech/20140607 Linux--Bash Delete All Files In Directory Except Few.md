>> chenguang is translating 

Linux: Bash Delete All Files In Directory Except Few
================================================================================
![](http://s0.cyberciti.org/images/category/old/terminal.png)

I'm a new Linux system user. I need to cleanup in a download directory i.e. delete all files from ~/Downloads/ folders except the following types:

*.iso - All iso images files.
*.zip - All zip files.

How do I delete all file except some in bash shell on a Linux, OS X or Unix-like systems?

Bash shell supports rich file pattern matching such as follows:

- * - Match any files.
- ? - Matches any single character in filenames.
- [...] - Matches any one of the enclosed characters.

### Method #1: Say hello to extended pattern matching operators ###

You need to use the extglob shell option using the shopt builtin command to use extended pattern matching operators such as:

1. ?(pattern-list) - Matches zero or one occurrence of the given patterns.
1. *(pattern-list) - Matches zero or more occurrences of the given patterns.
1. +(pattern-list) - Matches one or more occurrences of the given patterns.
1. @(pattern-list) - Matches one of the given patterns.
1. !(pattern-list) - Matches anything except one of the given patterns.

A pattern-list is nothing but a list of one or more patterns (filename) separated by a |. First, turn on extglob option:

    shopt -s extglob
 
#### Bash remove all files except *.zip and *.iso files ####

The rm command syntax is:

    ## Delete all file except file1 ##
    rm  !(file1)
     
    ## Delete all file except file1 and file2 ##
    rm  !(file1|file2)
     
    ## Delete all file except all zip files ##
    rm  !(*.zip)
     
    ## Delete all file except all zip and iso files ##
    rm  !(*.zip|*.iso)
     
    ## You set full path too ##
    rm /Users/vivek/!(*.zip|*.iso|*.mp3)
     
    ## Pass options ##
    rm [options]  !(*.zip|*.iso)
    rm -v  !(*.zip|*.iso)
    rm -f  !(*.zip|*.iso)
    rm -v -i  !(*.php)
 
Finally, turn off extglob option:

    shopt -u extglob
 
### Method #2: Using bash GLOBIGNORE variable to remove all files except specific ones ###

From the [bash(1)][1] page:

> A colon-separated list of patterns defining the set of filenames to be ignored by pathname expansion. If a filename matched by a pathname expansion pattern also matches one of the patterns in GLOBIGNORE, it is removed from the list of matches.

To delete all files except zip and iso files, set GLOBIGNORE as follows:

    ## only works with BASH ##
    cd ~/Downloads/
    GLOBIGNORE=*.zip:*.iso
    rm -v *
    unset GLOBIGNORE
 
### Method #3: Find command to rm all files except zip and iso files ###

If you are using tcsh/csh/sh/ksh or any other shell, try the following find command syntax on a Unix-like system to delete files:

    find /dir/ -type f -not -name 'PATTERN' -delete
 
OR

    ## deals with weird file names using xargs ##
    find /dir/ -type f -not -name 'PATTERN' -print0 | xargs -0 -I {} rm {}
    find /dir/ -type f -not -name 'PATTERN' -print0 | xargs -0 -I {} rm [options] {}
 
To delete all files except php files in ~/sources/ directory, type:

    find ~/sources/ -type f -not -name '*.php' -delete

OR

    find ~/sources/ -type f -not -name '*.php' -print0 | xargs -0 -I {} rm -v {}
 
The syntax to delete all files except *.zip and *.iso is as follows:

    find . -type f -not \( -name '*zip' -or -name '*iso' \) -delete
 
For more information see [bash command man page][1] and [find command man page][2].

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/linux-bash-delete-all-files-in-directory-except-few/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.manpager.com/linux/man1/bash.1.html
[2]:http://www.manpager.com/linux/man1/find.1.html

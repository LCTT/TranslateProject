Translating----geekpi

How To Extract a Tar Files To a Different Directory on a Linux/Unix-like Systems
================================================================================
I want to extract tar file to specific directory called /tmp/data. How can I extract a tar archive to a different directory using tar command on a Linux or Unix-like systems?

You do not need to change the directory using cd command and extract files. Untarring a file can be done using the following syntax:

### Syntax ###

Typical Unix tar syntax:

    tar -xf file.name.tar -C /path/to/directory

GNU/tar syntax:

    tar xf file.tar -C /path/to/directory

    tar xf file.tar --directory /path/to/directory

### Example: Extract files to another directory ###

In this example, I'm extracting $HOME/etc.backup.tar file to a directory called /tmp/data. First, you have to create the directory manually, enter:

    mkdir /tmp/data

To extract a tar archive $HOME/etc.backup.tar into a /tmp/data, enter:

    tar -xf $HOME/etc.backup.tar -C /tmp/data

To see a progress pass the -v option:

    tar -xvf $HOME/etc.backup.tar -C /tmp/data

Sample outputs:

![Gif 01: tar Command Extract Archive To Different Directory Command](http://s0.cyberciti.org/uploads/faq/2015/01/tar-extract-archive-to-dir.gif)

Gif 01: tar Command Extract Archive To Different Directory Command

You can extract specific files too use:

    tar -xvf $HOME/etc.backup.tar file1 file2 file3 dir1 -C /tmp/data

To extract a foo.tar.gz (.tgz extension file) tarball to /tmp/bar, enter:

    mkdir /tmp/bar
    tar -zxvf foo.tar.gz -C /tmp/bar

To extract a foo.tar.bz2 (.tbz, .tbz2 & .tb2 extension file) tarball to /tmp/bar, enter:

    mkdir /tmp/bar
    tar -jxvf foo.tar.bz2  -C /tmp/bar

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/howto-extract-tar-file-to-specific-directory-on-unixlinux/

作者：[nixCraft][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.cyberciti.biz/tips/about-us
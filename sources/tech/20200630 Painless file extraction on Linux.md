[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Painless file extraction on Linux)
[#]: via: (https://www.networkworld.com/article/3564265/painless-file-extraction-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Painless file extraction on Linux
======

Thinkstock

Extracting files from archives in Linux systems is considerably less painful than tooth extraction, but sometimes seems more complicated. In this post, we will take a look at how you can easily extract files from just about any kind of archive you’re likely to run into on a Linux system.

There’s a pile of them – everything from .gz to .tbz2 files with some variations for how those files are named. Sure, you can memorize all of the various commands available for extracting files from archives along with the options they offer, but you can also just deposit all that know-how into a script and stop worrying about the details.

In this post, we assemble a series of extraction commands into a script that calls the proper command to extract the content of file archives depending on the archive file names. The script starts with some commands to verify that a file name has been provided as an argument or ask that the person running the script provide one.

```
#!/bin/bash

if [ $# -eq 0 ]; then
    echo -n "filename> "
    read filename
else
    filename=$1
fi

if [ ! -f "$filename" ]; then
    echo "No such file: $filename"
    exit $?
fi
```

Got that? The script prompts for a file name if no arguments were offered and uses the argument provided if there is one. It then verifies that the file actually exists. If not, the script exits.

The next step is to use a bash case statement to call the appropriate extraction command for the archive depending on its name. For some of these file types (e.g., .bz2), other commands than tar would also work, but we only include one extraction command for each file naming convention. So, here’s the case statement with the various archive file names.

```
 case $filename in
    *.tar)      tar xf $filename;;
    *.tar.bz2)  tar xjf $filename;;
    *.tbz)      tar xjf $filename;;
    *.tbz2)     tar xjf $filename;;
    *.tgz)      tar xzf $filename;;
    *.tar.gz)   tar xzf $filename;;
    *.gz)       gunzip $filename;;
    *.bz2)      bunzip2 $filename;;
    *.zip)      unzip $filename;;
    *.Z)        uncompress $filename;;
    *)          echo "No extract option for $filename"
esac
```

If the file provided to the script has a file extension that doesn’t match any of those known to the script, the “No extract option for $filename” message will be issued. If any archive types that you use are missing, just add them along with the required extraction commands.

Add the bash header to the top of the script, make it executable and you should be ready to go.

```
#!/bin/bash

if [ $# -eq 0 ]; then
    echo -n "filename> "
    read filename
else
    filename=$1
fi

if [ ! -f "$filename" ]; then
    echo "No such file: $filename"
    exit $?
fi

case $filename in
    *.tar)      tar xf $filename;;
    *.tar.bz2)  tar xjf $filename;;
    *.tbz)      tar xjf $filename;;
    *.tbz2)     tar xjf $filename;;
    *.tgz)      tar xzf $filename;;
    *.tar.gz)   tar xzf $filename;;
    *.gz)       gunzip $filename;;
    *.bz2)      bunzip2 $filename;;
    *.zip)      unzip $filename;;
    *.Z)        uncompress $filename;;
    *.rar)      rar x $filename ;;
    *)
```

If you want the script to display the contents of the archive as they are being extracted, add the verbose option (-v) to each string of command arguments:

```
#!/bin/bash

if [ $# -eq 0 ]; then
    echo -n "filename> "
    read filename
else
    filename=$1
fi

if [ ! -f "$filename" ]; then
    echo "No such file: $filename"
    exit $?
fi

case $filename in
    *.tar)      tar xvf $filename;;
    *.tar.bz2)  tar xvjf $filename;;
    *.tbz)      tar xvjf $filename;;
    *.tbz2)     tar xvjf $filename;;
    *.tgz)      tar xvzf $filename;;
    *.tar.gz)   tar xvzf $filename;;
    *.gz)       gunzip -v $filename;;
    *.bz2)      bunzip2 -v $filename;;
    *.zip)      unzip -v $filename;;
    *.Z)        uncompress -v $filename;;
    *)          echo "No extract option for $filename"
esac
```

### Wrap-up

While it’s certainly possible to create an alias for each extraction command you’re likely to use, it’s easier to let a script provide the command for each file type you encounter than having to stop and work out each of the commands and options yourself.

Join the Network World communities on [Facebook][1] and [LinkedIn][2] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3564265/painless-file-extraction-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.facebook.com/NetworkWorld/
[2]: https://www.linkedin.com/company/network-world

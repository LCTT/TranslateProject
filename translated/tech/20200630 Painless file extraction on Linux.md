[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Painless file extraction on Linux)
[#]: via: (https://www.networkworld.com/article/3564265/painless-file-extraction-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Linux 上无痛文件解压
======

从 Linux 系统的存档中解压文件要比拔牙要麻烦得多，但有时看起来更麻烦。在本文中，我们将探讨如何轻松地从几乎任何可能在 Linux 系统中使用的存档中解压文件。

它们有很多格式，从 .gz 到 .tbz2，这些文件的命名方式有一些变化。当然，你可以记住所有可用于从存档中解压文件的命令以及它们的选项，但是你也可以将所有经验保存到脚本中，而不必担心细节。

在本文中，我们将一系列解压命令组合成一个脚本，它会调用适当的命令根据文档名解压文件的内容。该脚本以一些命令开头来验证文件名是否已经提供作为参数，或要求运行脚本的人提供文件名。

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

了解了么？如果未提供任何参数，脚本将提示输入文件名，如果存在则使用它。然后，它验证文件是否实际存在。如果不是，那么脚本退出。

下一步是使用 bash case 语句根据存档文件的名称为存档文件调用适当的解压命令。对于其中某些文件类型（例如 .bz2），也可以使用除 tar 之外的其他命令，但是对于每种文件命名约定，我们仅包含一个解压命令。因此，这是带有各种存档文件名的 case 语句。

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

如果提供给脚本的文件扩展名与脚本已知的扩展名都不匹配，那么会发出 “No extract option for $filename” 的消息。如果缺少你使用的任何存档类型，只需将它们与所需的提取命令一起添加即可。

将 bash 头添加到脚本顶部，使其可执行，然后就可以开始了。

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

如果你希望脚本在解压文件时显示内容，请将详细选项（-v）添加到每个命令参数字符串中：

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

### 总结

虽然可以为每个可能用到的解压命令创建别名，但是让脚本为遇到的每种文件类型提供命令要比自己停下来编写每个命令和选项容易。

加入 [Facebook][1] 和 [LinkedIn][2] 上的 Network World 社区，评论热门主题。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3564265/painless-file-extraction-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.facebook.com/NetworkWorld/
[2]: https://www.linkedin.com/company/network-world

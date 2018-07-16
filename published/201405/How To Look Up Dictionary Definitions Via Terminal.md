如何在Linux命令行下查询字典？
================================================================================
大多数人在遇到他们不熟悉的单词时会查询google。或者他们用一个最喜欢的在线字典来提供答案。当你在没有网络连接的时候怎么办？或者你只有一个古老的Linux发行版且你没有GUI界面？你需要离线查找的话，这里有一个好的方法。

首先你需要本地设置dictd。**dictd** 是一个字典数据库服务器。它允许你访问在线字典。但是等一下，我们不是要离线使用么？这是为什么我们要将其安装到本地的原因。它带有一个命令行客户端。

要在Ubuntu或者Debian上安装你要输入：

    $ sudo apt-get install dictd

这个很简单。现在你需要安装用的字典。安装完每个字典插件后dictd都会自动重新加载它的数据库。让我们来安装英语字典和英语同义词词典。

输入：

    $ sudo apt-get install dict-gcide
    $ sudo apt-get  install dict-moby-thesaurus

如果你希望查询其他可以查询的语言，你可以输入：

    $ sudo apt-cache search “dict package”

这会列出下面这样的：

    dict-freedict-eng-ara - Dict package for English-Arabic Freedict dictionary
    dict-freedict-eng-cro - Dict package for English-Croatian Freedict dictionary
    dict-freedict-eng-cze - Dict package for English-Czech Freedict dictionary
    dict-freedict-eng-deu - Dict package for English-German Freedict dictionary
    dict-freedict-eng-fra - Dict package for English-French Freedict dictionary

现在你已成功安装dictd了，之后你就可以查找字典了。

首先，让我们检查一下dictd服务是否在运行并且安装了什么数据库：

    $ dict -I

示例输出：

    dictd 1.12.0/rf on Linux 3.2.0-29-generic-pae
    On my_host: up 95.000, 2 forks (75.8/hour)

    Database      Headwords         Index          Data  Uncompressed
    gcide              203645       3859 kB         12 MB         38 MB
    moby-thesaurus      30263        528 kB         10 MB         28 MB

为了查询一个单词，你可以指定要查询的字典。让我们查询一下English one字典（gcid）：

    $ dict -d gcide [你要查的单词]

如果你不使用**-d** 参数，dictd会搜寻所有的安装字典并返回匹配的结果。

--------------------------------------------------------------------------------

via: http://www.unixmen.com/look-dictionary-definitions-via-terminal/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

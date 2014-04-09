如何通过终端查询字典定义
================================================================================
大多数人在遇到他们不熟悉的单词时会查询google。或者他们有一个最喜欢的在线字典来提供答案。当你在没有网络连接的时候怎么办？或者你只有一个古老的Linux发行版且你没有GUI界面？你需要离线查找。一个好的方法在这里。

首先你需要本地设置dicted。**Dicted** 是一个字典数据库服务器。它允许你访问在线字典。但是等一下，这是我们希望避免的，对么？一个通过因特网的连接。这是为什么你要在本地设置。这是一个命令行客户端。

要在Ubuntu或者Debian上安装你要输入：

    $ sudo apt-get install dictd

这个很简单。现在你需要安装用的字典。安装完每个字典插件后dicted都会自动重启加载它的数据库。让我们来英语字典和英语词库（查询近义词）

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

你成功安装完成dicted之后你可以查找定义。

首先，让我们检查一下dicted服务是否在运行并且安装了什么数据库：

    $ dict -I

示例输出：

    dictd 1.12.0/rf on Linux 3.2.0-29-generic-pae
    On my_host: up 95.000, 2 forks (75.8/hour)

    Database      Headwords         Index          Data  Uncompressed
    gcide              203645       3859 kB         12 MB         38 MB
    moby-thesaurus      30263        528 kB         10 MB         28 MB

为了查询一个你需要的单词定义，你需要使用一个你已经安装的特别字典。让我们检查一下英语（gcid）：

    $ dict -d gcide [word you want to look up]

如果你不使用**-d** 参数，dicted会搜寻所有的已有数据库并返回匹配的定义。

--------------------------------------------------------------------------------

via: http://www.unixmen.com/look-dictionary-definitions-via-terminal/

译者：[geekpi](https://github.com/geekpi) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

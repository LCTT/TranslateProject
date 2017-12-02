在命令行中使用 DuckDuckGo 搜索
=============

![](http://www.omgubuntu.co.uk/wp-content/uploads/2017/11/duckduckgo.png)

此前我们介绍了[如何在命令行中使用 Google 搜索][3]。许多读者反馈说他们平时使用 [Duck Duck Go][4]，这是一个功能强大而且保密性很强的搜索引擎。

正巧，最近出现了一款能够从命令行搜索 DuckDuckGo 的工具。它叫做 ddgr（我把它读作 “dodger”），非常好用。

像 [Googler][7] 一样，ddgr 是一个完全开源而且非官方的工具。没错，它并不属于 DuckDuckGo。所以，如果你发现它返回的结果有些奇怪，请先询问这个工具的开发者，而不是搜索引擎的开发者。

### DuckDuckGo 命令行应用

![](http://www.omgubuntu.co.uk/wp-content/uploads/2017/11/ddgr-gif.gif)

[DuckDuckGo Bangs（DuckDuckGo 快捷搜索）][8] 可以帮助你轻易地在 DuckDuckGo 上找到想要的信息（甚至 _本网站 omgubuntu_ 都有快捷搜索）。ddgr 非常忠实地呈现了这个功能。

和网页版不同的是，你可以更改每页返回多少结果。这比起每次查询都要看三十多条结果要方便一些。默认界面经过了精心设计，在不影响可读性的情况下尽量减少了占用空间。

`ddgr` 有许多功能和亮点，包括：

*   更改搜索结果数
*   支持 Bash 自动补全
*   使用 DuckDuckGo Bangs
*   在浏览器中打开链接
*   ”手气不错“选项
*   基于时间、地区、文件类型等的筛选功能
*   极少的依赖项

你可以从 Github 的项目页面上下载支持各种系统的 `ddgr`：

- [从 Github 下载 “ddgr”][9]

另外，在 Ubuntu 16.04 LTS 或更新版本中，你可以使用 PPA 安装 ddgr。这个仓库由 ddgr 的开发者维护。如果你想要保持在最新版本的话，推荐使用这种方式安装。

需要提醒的是，在本文创作时，这个 PPA 中的 ddgr _并不是_ 最新版本，而是一个稍旧的版本（缺少 -num 选项）。

使用以下命令添加 PPA：

```
sudo add-apt-repository ppa:twodopeshaggy/jarun
sudo apt-get update
```

### 如何使用 ddgr 在命令行中搜索 DuckDuckGo

安装完毕后，你只需打开你的终端模拟器，并运行：

```
ddgr
```

然后输入查询内容：

```
search-term
```

你可以限制搜索结果数：

```
ddgr --num 5 search-term
```

或者自动在浏览器中打开第一条搜索结果：


```
ddgr -j search-term
```

你可以使用参数和选项来提高搜索精确度。使用以下命令来查看所有的参数：

```
ddgr -h
```

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2017/11/duck-duck-go-terminal-app

作者：[JOEY SNEDDON][a]
译者：[yixunx](https://github.com/yixunx)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:https://plus.google.com/117485690627814051450/?rel=author
[2]:http://www.omgubuntu.co.uk/category/download
[3]:http://www.omgubuntu.co.uk/2017/08/search-google-from-the-command-line
[4]:http://duckduckgo.com/
[5]:http://www.omgubuntu.co.uk/2017/11/duck-duck-go-terminal-app
[6]:https://github.com/jarun/ddgr
[7]:https://github.com/jarun/googler
[8]:https://duckduckgo.com/bang
[9]:https://github.com/jarun/ddgr/releases/tag/v1.1

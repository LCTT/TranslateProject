如何在终端中浏览 Stack Overflow
======

![](https://www.ostechnix.com/wp-content/uploads/2018/04/how2-720x340.png)

前段时间，我们写了一篇关于 [SoCLI][1] 的文章，它是一个从命令行搜索和浏览 Stack Overflow 网站的 python 脚本。今天，我们将讨论一个名为 “how2” 的类似工具。它是一个命令行程序，可以从终端浏览 Stack Overflow。你可以如你在 [Google 搜索][2]中那样直接用英语查询，然后它会使用 Google 和 Stackoverflow API 来搜索给定的查询。它是使用 NodeJS 编写的自由开源程序。

### 使用 how2 从终端浏览 Stack Overflow

由于 `how2` 是一个 NodeJS 包，我们可以使用 Npm 包管理器安装它。如果你尚未安装 Npm 和 NodeJS，请参考以下指南。

在安装 Npm 和 NodeJS 后，运行以下命令安装 how2。

```
$ npm install -g how2
```

现在让我们看下如何使用这个程序浏览 Stack Overflow。使用 `how2` 搜索 Stack Overflow 站点的典型用法是：

```
$ how2 <search-query>
```

例如，我将搜索如何创建 tgz 存档。

```
$ how2 create archive tgz
```

哎呀！我收到以下错误。

```
/home/sk/.nvm/versions/node/v9.11.1/lib/node_modules/how2/node_modules/devnull/transports/transport.js:59
Transport.prototype.__proto__ = EventEmitter.prototype;
 ^

 TypeError: Cannot read property 'prototype' of undefined
 at Object.<anonymous> (/home/sk/.nvm/versions/node/v9.11.1/lib/node_modules/how2/node_modules/devnull/transports/transport.js:59:46)
 at Module._compile (internal/modules/cjs/loader.js:654:30)
 at Object.Module._extensions..js (internal/modules/cjs/loader.js:665:10)
 at Module.load (internal/modules/cjs/loader.js:566:32)
 at tryModuleLoad (internal/modules/cjs/loader.js:506:12)
 at Function.Module._load (internal/modules/cjs/loader.js:498:3)
 at Module.require (internal/modules/cjs/loader.js:598:17)
 at require (internal/modules/cjs/helpers.js:11:18)
 at Object.<anonymous> (/home/sk/.nvm/versions/node/v9.11.1/lib/node_modules/how2/node_modules/devnull/transports/stream.js:8:17)
 at Module._compile (internal/modules/cjs/loader.js:654:30)

```

我可能遇到了一个 bug。我希望它在未来版本中得到修复。但是，我在[这里][3]找到了一个临时方法。


要临时修复此错误，你需要使用以下命令编辑 `transport.js`：

```
$ vi /home/sk/.nvm/versions/node/v9.11.1/lib/node_modules/how2/node_modules/devnull/transports/transport.js
```

此文件的实际路径将显示在错误输出中。用你自己的文件路径替换上述文件路径。然后找到以下行：

```
var EventEmitter = process.EventEmitter;
```

并用以下行替换它：

```
var EventEmitter = require('events');
```

按 `ESC` 并输入 `:wq` 以保存并退出文件。

现在再次搜索查询。

```
$ how2 create archive tgz
```

这是我的 Ubuntu 系统的示例输出。

![][5]

如果你要查找的答案未显示在上面的输出中，请按**空格键**键开始交互式搜索，你可以通过它查看 Stack Overflow 站点中的所有建议问题和答案。

![][6]

使用向上/向下箭头在结果之间移动。得到正确的答案/问题后，点击空格键或回车键在终端中打开它。

![][7]

要返回并退出，请按 `ESC`。

**搜索特定语言的答案**

如果你没有指定语言，它**默认为 Bash** unix 命令行，并立即为你提供最可能的答案。你还可以将结果缩小到特定语言，例如 perl、python、c、Java 等。

例如，使用 `-l` 标志仅搜索与 “Python” 语言相关的查询，如下所示。

```
$ how2 -l python linked list
```

![][8]

要获得快速帮助，请输入：

```
$ how2 -h
```

### 总结

`how2` 是一个基本的命令行程序，它可以快速搜索 Stack Overflow 中的问题和答案，而无需离开终端，并且它可以很好地完成这项工作。但是，它只是 Stack overflow 的 CLI 浏览器。对于一些高级功能，例如搜索投票最多的问题，使用多个标签搜索查询，彩色界面，提交新问题和查看问题统计信息等，**SoCLI** 做得更好。

就是这些了。希望这篇文章有用。我将很快写一篇新的指南。在此之前，请继续关注！

干杯!

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-browse-stack-overflow-from-terminal/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/search-browse-stack-overflow-website-commandline/
[2]:https://www.ostechnix.com/google-search-navigator-enhance-keyboard-navigation-in-google-search/
[3]:https://github.com/santinic/how2/issues/79
[4]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[5]:http://www.ostechnix.com/wp-content/uploads/2018/04/stack-overflow-1.png
[6]:http://www.ostechnix.com/wp-content/uploads/2018/04/stack-overflow-2.png
[7]:http://www.ostechnix.com/wp-content/uploads/2018/04/stack-overflow-3.png
[8]:http://www.ostechnix.com/wp-content/uploads/2018/04/stack-overflow-4.png

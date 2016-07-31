GNU KHATA：开源的会计管理软件
============================================

作为一个活跃的 Linux 爱好者，我经常向我的朋友们介绍 Linux，帮助他们选择最适合他们的发行版本，同时也会帮助他们安装一些适用于他们工作的开源软件。

但是在这一次，我就变得很无奈。我的叔叔，他是一个自由职业的会计师。他会有一系列的为了会计工作的漂亮而成熟的付费软件。我不那么确定我能在在开源软件中找到这么一款可以替代的软件——直到昨天。

Abhishek 给我推荐了一些[很酷的软件][1]，而其中 GNU Khata 脱颖而出。

[GNU Khata][2] 是一个会计工具。 或者，我应该说成是一系列的会计工具集合？它就像经济管理方面的 [Evernote][3] 一样。它的应用是如此之广，以至于它不但可以用于个人的财务管理，也可以用于大型公司的管理，从店铺存货管理到税率计算，都可以有效处理。

有个有趣的地方，Khata 这个词在印度或者是其他的印度语国家中意味着账户，所以这个会计软件叫做 GNU Khata。

### 安装

互联网上有很多关于旧的 Web 版本的 Khata 安装介绍。现在，GNU Khata 只能用在 Debian/Ubuntu 和它们的衍生版本中。我建议你按照 GNU Khata 官网给出的如下步骤来安装。我们来快速过一下。

- 从[这里][4]下载安装器。
- 在下载目录打开终端。
- 粘贴复制以下的代码到终端，并且执行。

```
sudo chmod 755 GNUKhatasetup.run
sudo ./GNUKhatasetup.run
```

这就结束了，从你的 Dash 或者是应用菜单中启动 GNU Khata 吧。

### 第一次启动

GNU Khata 在浏览器中打开，并且展现以下的画面。

![](https://itsfoss.com/wp-content/uploads/2016/07/GNU-khata-1.jpg)

填写组织的名字、组织形式，财务年度并且点击 proceed 按钮进入管理设置页面。

![](https://itsfoss.com/wp-content/uploads/2016/07/GNU-khata-2.jpg)

仔细填写你的用户名、密码、安全问题及其答案，并且点击“create and login”。

![](https://itsfoss.com/wp-content/uploads/2016/07/GNU-khata-3.jpg)

你已经全部设置完成了。使用菜单栏来开始使用 GNU Khata 来管理你的财务吧。这很容易。

### 移除 GNU KHATA

如果你不想使用 GNU Khata 了，你可以执行如下命令移除：

```
sudo apt-get remove --auto-remove gnukhata-core-engine
```

你也可以通过新立得软件管理来删除它。

### GNU KHATA 真的是市面上付费会计应用的竞争对手吗？

首先，GNU Khata 以简化为设计原则。顶部的菜单栏组织的很方便，可以帮助你有效的进行工作。你可以选择管理不同的账户和项目，并且切换非常容易。[它们的官网][5]表明，GNU Khata 可以“像说印度语一样方便”（LCTT 译注：原谅我，这个软件作者和本文作者是印度人……）。同时，你知道 GNU Khata 也可以在云端使用吗？

所有的主流的账户管理工具，比如分类账簿、项目报表、财务报表等等都用专业的方式整理，并且支持自定义格式和即时展示。这让会计和仓储管理看起来如此的简单。

这个项目正在积极的发展，正在寻求实操中的反馈以帮助这个软件更加进步。考虑到软件的成熟性、使用的便利性还有免费的情况，GNU Khata 可能会成为你最好的账簿助手。

请在评论框里留言吧，让我们知道你是如何看待 GNU Khata 的。

--------------------------------------------------------------------------------

via: https://itsfoss.com/using-gnu-khata/

作者：[Aquil Roshan][a]
译者：[MikeCoder](https://github.com/MikeCoder)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/aquil/
[1]: https://itsfoss.com/category/apps/
[2]: http://www.gnukhata.in/
[3]: https://evernote.com/
[4]: https://cloud.openmailbox.org/index.php/s/L8ppsxtsFq1345E/download
[5]: http://www.gnukhata.in/

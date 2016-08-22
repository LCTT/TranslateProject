Ubuntu 里的“间谍软件”将在 Ubuntu 16.04 LTS 中被禁用
================================================================================

出于用户隐私的考虑，Ubuntu 阉割了一个有争议的功能。

![](http://www.omgubuntu.co.uk/wp-content/uploads/2013/09/as2.jpg)

**Unity 中有争议的在线搜索功能将在今年四月份发布的 Ubuntu 16.04 LTS 中被默认禁用**

用户在 Unity 7 的 Dash 搜索栏里将**只能搜索到本地文件、文件夹以及应用**。这样，用户输入的关键词将不会被发送到 Canonical 或任何第三方内容提供商的服务器里。

> “现在，Unity 的在线搜索在默认状况下是关闭的”

在目前 ubuntu 的支持版本中，Dash 栏会将用户搜索的关键词发送到 Canonical 运营的远程服务器中。它发送这些数据以用于从50多家在线服务获取搜索结果，这些服务包括维基百科、YouTube 和 The Weather Channel 等。

我们可以选择去**系统设置 > 隐私控制**关闭这项功能。但是，一些开源社区针对的是默认打开这个事情。

### Ubuntu 在线搜索引发的争议 ###

> “Richard Stallman 将这个功能描述为 ‘间谍软件’”

早在2012年，在 Ubuntu 搜索中整合了来自亚马逊的内容之后，开源社区就表示为其用户的隐私感到担忧。在2013年，“Smart Scopes 服务”全面推出后，开源社区再度表示担忧.

风波如此之大，以至于开源界大神 [Richard Stallman 都称 Ubuntu 为"间谍软件"][1]。

[电子前哨基金会 (EFF)][2]也在一系列博文中表达出对此的关注，并且建议 Canonical 将这个功能做成用户自由选择是否开启的功能。Privacy International 比其他的组织走的更远，对于 Ubuntu 的工作，他们给 Ubuntu 的缔造者发了一个“[老大哥奖][3]”。

[Canonical][4] 坚称 Unity 的在线搜索功能所收集的数据是匿名的以及“不可识别是来自哪个用户的”。

在[2013年 Canoical 发布的博文中][5]他们解释道：“**(我们)会使用户了解我们收集哪些信息以及哪些第三方服务商将会在他们搜索时从 Dash 栏中给出结果。我们只会收集能够提升用户体验的信息。**”

### Ubuntu 开始严肃对待的用户数据隐私###

Canonical 在给新安装的 Ubuntu 14.04 LTS 以及以上版本中禁用了来自亚马逊的产品搜索结果（尽管来自其他服务商的搜索结果仍然在出现，直到你关闭这个选项）

在下一个LTS（长期支持）版，也就是 Ubuntu 16.04 中，Canonical 完全关闭了这个有争议的在线搜索功能，这个功能在用户安装完后就是关闭的。就如同 EFF 在2012年建议他们做的那样。

“你搜索的关键词将不会逃出你的计算机。” [Ubuntu 桌面主管 Will Cooke][6]解释道，“对于搜索结果的更精细的控制”和 Unity 8 所提供的“更有针对性的结果添加不到 Unity 7 里”。

这也就是“[Unity 7]的在线搜索功能将会退役”的原因。

这个变化也会降低对 Unity 7 的支持以及对 Canonical 基础设施的压力。Unity 提供的搜索结果越少，Canonical 就能把时间和工程师放到更加振奋人心的地方，比如更早的发布 Unity 8 桌面环境。

### 在 Ubuntu 16.04 中你需要自己开启在线搜索功能 ###

![Privacy settings in Ubuntu let you opt in to seeing online results](http://www.omgubuntu.co.uk/wp-content/uploads/2013/04/privacy.jpg)

*在 Ubuntu 隐私设置中你可以打开在线搜索功能*

禁用 Ubuntu 桌面的在线搜索功能的决定将获得众多开源/免费软件社区的欢呼。但是并不是每一个人都对 Dash 提供的语义搜索功能反感，如果你认为你失去了在搜索时预览天气、查看新闻或其他来自 Dash 在线搜索提供的内容所带来的效率的话，你只需要简单的点几下鼠标就可以**再次打开这个功能**，定位到 Ubuntu 的**系统设置 > 隐私控制 > 搜索**然后将选项调至“**开启**”。

这个选项不会自动把亚马逊的产品信息加入到搜索结果中。如果你想看产品信息的话，需要打开第二个可选项“shipping lens”才能看到来自 Amazon （和 Skimlinks）的内容。

### 总结 ###


- 默认情况下，Ubuntu 16.04 LTS 的 Dash 栏将不会搜索到在线结果
- 可以手动打开在线搜索
- **系统设置 > 隐私控制 > 搜索**中的第二个可选项允许你看到亚马逊的产品信息
- 这个变动只会影响新安装的系统。从老版本升级的将会保留用户的喜好

你同意这个决定吗？抑或是 Cononical 可能降低了新用户的体验？在评论中告诉我们。

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2016/01/ubuntu-online-search-feature-disabled-16-04

作者：[Joey-Elijah Sneddon][a]
译者：[name1e5s](https://github.com/name1e5s)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:http://arstechnica.com/information-technology/2012/12/richard-stallman-calls-ubuntu-spyware-because-it-tracks-searches/?utm_source=omgubuntu
[2]:https://www.eff.org/deeplinks/2012/10/privacy-ubuntu-1210-amazon-ads-and-data-leaks?utm_source=omgubuntu
[3]:http://www.omgubuntu.co.uk/2013/10/ubuntu-wins-big-brother-austria-privacy-award
[4]:http://blog.canonical.com/2012/12/07/searching-in-the-dash-in-ubuntu-13-04/
[5]:http://blog.canonical.com/2012/12/07/searching-in-the-dash-in-ubuntu-13-04/?utm_source=omgubuntu
[6]:http://www.whizzy.org/2015/12/online-searches-in-the-dash-to-be-off-by-default?utm_source=omgubuntu

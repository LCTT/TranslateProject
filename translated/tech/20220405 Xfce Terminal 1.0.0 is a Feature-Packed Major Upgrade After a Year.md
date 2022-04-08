[#]: subject: "Xfce Terminal 1.0.0 is a Feature-Packed Major Upgrade After a Year"
[#]: via: "https://news.itsfoss.com/xfce-terminal-1-0-0-release/"
[#]: author: "Jacob Crume https://news.itsfoss.com/author/jacob/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Xfce Terminal 1.0.0 是时隔一年后的一次功能丰富的重大升级
======

作为几乎所有 Xfce 发行版上流行的终端模拟器，Xfce Terminal 刚刚在新的维护者（和新的版本计划）下发布了它的第一次重大升级。

让我们来看看这个版本的一些亮点。

### 新的维护者和版本管理方案

Igor Zakharov 从 2016 年到 2020 年一直在领导开发工作。不幸的是，在 2021 年，当新的维护者 [Sergios][1] Anestis Kefalidis（也是 Thunar 文件管理器的开发者）接手后，它就没有被维护了。

而且，自从 Sergios 接管了这个项目后，版本管理方案也发生了变化。经过与社区的协商，Thunar 的旧版本计划被采用。

例如，1.1.x 版本将是开发版本，而 1.2.0 版本将是下一个主要升级版本。

现在，随着 Xfce Terminal 1.0.0 的发布，一些令人兴奋的新特性已经被纳入。

### 新特性

Xfce Terminal 1.0.0 的一些新特性包括：

  * 改进了自定义选项
  * 支持叠加滚动条
  * 命令行选项的改进
  * 更多使用 XfceTitledDialog



#### 更好的自定义选项

和现在许多应用的更新一样，Xfce Terminal 1.0.0 包括大量新的自定义选项。也许我最喜欢的是，图像背景功能现在有一个“填充”风格选项。伴随着这一点的是暂时禁用不安全的粘贴对话框的能力，它也被改造了。

最后，XFCE Terminal 也成为首批支持新的 XFCE 快捷键编辑器的应用之一。因此，用户不再需要潜心研究配置文件，而是有了一个简单的 UI 来使用。

![][2]

有了这么多新的定制选项，我相信很多人都会对一个只包含这些的版本感到满意。但可惜的是! 开发者设法加入了更多令人兴奋的新功能，其中下一个是改进的命令行参数。

#### 更好的命令行参数

在这个版本中，“-tab” 和 “-window” 命令行参数已经被修复，变得更加直观。这修复了 XFCE Terminal 中一个[长期存在的 bug][3]，它已经存在了近 6 年。

尽管等待了很久，但现在它已经被修复了。迟到总比不到好，是吧？

不管怎么说，看到每一个新版本的 bug 被修复总是很好的，这个趋势在这里继续。

#### 更多使用 Xfce 专用的小工具

虽然我相信很多用户可能会认为这是一个降级，但 XFCE Terminal 使用更多的 XFCE 专用小工具带来了很多好处。虽然这确实意味着对非 XFCE 用户有更多的依赖性，但它意味着与 XFCE 更好的整合。

可以说，大多数的 Xfce Terminal 用户都坚持使用同一个桌面环境。所以，这种改变应该会带来更大的一致性和用户体验的改善。

#### 其他变化

这个版本的其他变化包括：

  * “输出滚动”偏好的改进
  * 右键点击行为的自定义选项
  * 为缩小代码库而进行的代码重做


关于完整的功能列表，请随时参考[发布说明][4]。发布说明中还提到了下一个主要版本的未来计划，即 v1.2.0。

### 总结

总的来说，Xfce Terminal 1.0.0 看起来是一个很好的版本，也说明了其新的维护者的奉献精神。

如果你想试试 Xfce Terminal 1.0.0，它应该会在接下来的几周内进入你的发行库，如果还没有的话。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/xfce-terminal-1-0-0-release/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[1]: https://www.youtube.com/channel/UCu8-J-XWcXQhoCopBiJ5-uw/videos
[2]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUwOSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[3]: https://bugzilla.xfce.org/show_bug.cgi?id=12926
[4]: http://users.uoa.gr/~sdi1800073/sources/xfce_blog12.html

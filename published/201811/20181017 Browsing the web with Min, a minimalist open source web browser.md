使用极简浏览器 Min 浏览网页
======

> 并非所有 web 浏览器都要做到无所不能，Min 就是一个极简主义风格的浏览器。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/openweb-osdc-lead.png?itok=yjU4KliG)

现在还有开发新的 Web 浏览器的需要吗？即使现在浏览器领域已经成为了寡头市场，但仍然不断涌现出各种前所未有的浏览器产品。

[Min][1] 就是其中一个。顾名思义，Min 是一个小的浏览器，也是一个极简主义的浏览器。但它麻雀虽小五脏俱全，而且还是一个开源的浏览器，它的 Apache 2.0 许可证引起了我的注意。

让我们来看看 Min 有什么值得关注的方面。

### 开始

Min 基于 [Electron][2] 框架开发，值得一提的是，[Atom 文本编辑器][3]也是基于这个框架开发的。它提供 Linux、MacOS 和 Windows 的[安装程序][4]，当然也可以[从 GitHub 获取它的源代码][5]自行编译安装。

我使用的 Linux 发行版是 Manjaro，但没有完全匹配这个发行版的安装程序。还好，我通过 Manjaro 的包管理器也能安装 Min。

安装完成后，在终端就可以直接启动 Min。

![](https://opensource.com/sites/default/files/uploads/min-main.png)

Min 号称是更智能、更快速的浏览器。经过尝试以后，我觉得它比我在其它电脑上使用过的 Firefox 和 Chrome 浏览器启动得更快。

而使用 Min 浏览网页的过程则和 Firefox 或 Chrome 一样，只要再地址栏输入 URL，回车，就好了。

### Min 的功能

尽管 Min 不可能带有 Firefox 或 Chrome 等浏览器得所有功能，但它也有可取之处。

Min 和其它浏览器一样，支持页面选项卡。它还有一个称为 Tasks 的功能，可以对打开的选项卡进行分组。

[DuckDuckGo][6] 是我最喜欢的搜索引擎，而 Min 的默认搜索引擎恰好就是它，这正合我意。当然，如果你喜欢另一个搜索引擎，也可以在 Min 的偏好设置中配置你喜欢的搜索引擎作为默认搜索引擎。

Min 没有使用类似 AdBlock 这样的插件来过滤你不想看到的内容，而是使用了一个名为 [EasyList][7] 的内置的广告拦截器，你可以使用它来屏蔽脚本和图片。另外 Min 还带有一个内置的防跟踪软件。

类似 Firefox，Min 有一个名为叫做 Reading List 的阅读模式。只需点击地址栏中的对应图标，就可以去除页面中的大部分无关内容，让你专注于正在阅读的内容。网页在阅读列表中可以保留 30 天。

![](https://opensource.com/sites/default/files/uploads/min-reading-list.png)

Min 还有一个专注模式，可以隐藏其它选项卡并阻止你打开新的选项卡。在专注模式下，如果一个 web 页面中进行工作，需要多点击好几次才能打开一个新页面。

Min 也有很多快捷键让你快速使用某个功能。你可以[在 GitHub 上][8]找到这些这些快捷键的参考文档，也可以在 Min 的偏好设置中进行更改。

我发现 Min 可以在 YouTube、Vimeo、Dailymotion 等视频网站上播放视频，还可以在音乐网站 7Digital 上播放音乐。但由于我没有账号，所以没法测试是否能在 Spotify 或 Last.fm 等这些网站上播放音乐。

![](https://opensource.com/sites/default/files/uploads/min-video.png)

### Min 的弱点

Min 确实也有自己的缺点，例如它无法将网站添加为书签。替代方案要么是查看 Min 的搜索历史来找回你需要的链接，要么是使用一个第三方的书签服务。

最大的缺点是 Min 不支持插件。这对我来说不是一件坏事，因为浏览器启动速度和运行速度快的主要原因就在于此。当然也有一些人非常喜欢使用浏览器插件，Min 就不是他们的选择。

### 总结

Min 算是一个中规中矩的浏览器，它可以凭借轻量、快速的优点吸引很多极简主义的用户。但是对于追求多功能的用户来说，Min 就显得相当捉襟见肘了。

所以，如果你想摆脱当今多功能浏览器的束缚，我觉得可以试用一下 Min。


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/min-web-browser

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: https://minbrowser.github.io/min/
[2]: http://electron.atom.io/apps/
[3]: https://opensource.com/article/17/5/atom-text-editor-packages-writers
[4]: https://github.com/minbrowser/min/releases/
[5]: https://github.com/minbrowser/min
[6]: http://duckduckgo.com
[7]: https://easylist.to/
[8]: https://github.com/minbrowser/min/wiki


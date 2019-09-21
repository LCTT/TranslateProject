4 个值得一提的 Firefox 扩展插件
======

> 这些扩展可以使火狐更具生产力和使用乐趣。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/firefox_blue_lead.jpg?itok=gYaubJUv)

自从大约 12 年前 Firefox（火狐浏览器）v2.0 推出以来, 我一直是它的用户。它不是那时最好的网络浏览器，但是总会有一个理由让我回到它：我最喜爱的浏览器扩展插件不能工作在其它浏览器上。

如今，我喜欢现下的 Firefox，因为它快速、可定制和开源，我也很欣赏那些体现了原开发人员从未想到过的想法的扩展插件：如果你想在没有鼠标的情况下浏览网页呢？如果你不喜欢盯着晚上从显示器里发出来的强光呢？如何在 YouTube 和其他视频托管网站上使用一个更专业的播放器来获得更好的性能和更多播放控制呢？如果你需要更复杂的方法来禁用跟踪器和加快加载页面，该怎么办？

幸运的是，这些问题都有答案，我将展现给你我最喜爱的扩展 —— 所有这些都是免费软件或开源的 (即，在 [GNU GPL][1]、[MPL][2] 或 [Apache][3] 许可帧下) ，它们可以使一个优秀的浏览器更优秀。

尽管术语<ruby>加载项<rt>add-on</rt></ruby>和<ruby>扩展<rt>extension</rt></ruby>的含义稍微不同，但我在本文中的使用不会区分它们。

### Tridactyl

![Tridactyl screenshot][5]

*Tridactyl 的新选项卡页面，展示了链接的指引。*

[Tridactyl][6] 使你能够在大多数浏览活动中使用键盘。它的灵感来自于现已不复存在的 [Vimperator][7] 和 [Pentadactyl][8]，而它们受到了 [Vim][9] 的默认键绑定的启发。由于我已经习惯了 Vim 和其他命令行应用程序，我发现了它的功能类似于使用键值 `h/j/k/l` 进行导航，用 `f/F` 可以与超链接进行交互，而且创建自定义的键绑定和命令非常方便。

Tridactyl 最近刚刚实现了一个可选的本地信使（目前，仅适用于 GNU/Linux 和 Mac OSX），提供了更酷的功能。例如，有了它，你可以隐藏 Firefox 用户界面上的一些元素（以 Vimperator 和 Pentadactyl 的方式）、在外部程序中打开链接或当前页（我经常用 [mpv][10] 和 [youtube-dl][11] 播放视频）、通过按 `Ctrl-I`（或者任意你选择的组合键）用你喜爱的编辑器来编辑文本框的内容。

话虽如此，但要记住，这是一个相对早期的项目，细节可能还是很粗糙。另一方面，它的开发非常活跃，当你回顾它早期的缺陷时，未尝不是一种乐趣。

### Open With

![Open With Screenshot][13]

*Open With 提供的菜单。我可以用这里列出的一个外部程序打开当前页面。*

说到与外部程序的互动，有时能够用鼠标来做到这一点还是让人很高兴的。这是 [Open With][14] 的用武之地。

除了添加的上下文菜单（如屏幕截图所示）之外，你还可以通过单击加载项栏上的扩展图标来找到自己定义的命令。如[它在 Mozilla Add-ons 页面上][14] 的图标和描述所示，它主要是为了切换到其它的 web 浏览器，但我也可以轻松地将它与 mpv 和 youtube-dl 相配合。

它也提供了键盘快捷方式，但它们受到了严重限制。可以在扩展设置的下拉列表中选择的组合不超过三种。相反，Tridactyl 允许我将命令分配给几乎任何没有被 Firefox 所阻止的东西。没错，Open With 目前为鼠标而准备的。

### Stylus

![Stylus Screenshot][16]

*在这个屏幕截图中，我刚刚搜索并为当前正在浏览的 Stylus 的网站安装了一个黑暗主题。即使是弹出窗口也可以定制风格（称为 Deepdark Stylus）！*

[Stylus][17] 是一个用户样式管理器，这意味着可以通过编写自定义 CSS 规则并将其加载到 Stylus 中来更改任何网页的外观。如果你不懂 CSS，在如 [userstyles.org][18] 这样网站上有大量的其他人制作的样式。

现在，你可能会问，“这不就是 [Stylish][19] 么？” 你是对的！Stylus 是基于 Stylish 的，并提供了更多的改进：它不包含任何远程记录、尊重你的隐私，所有开发都是公开的（尽管 Stylish 仍在积极开发，我一直未能找到最新版本的源代码），而且它还支持 [UserCSS][20]。

UserCSS 是一种有趣的格式，尤其是对于开发人员来说。我已经为不同的网站写了几种用户样式（主要是黑暗主题，和为了提高可读性的调整），虽然 Stylus 的内部编辑器很好，我还是喜欢用 Neovim 编辑代码。为了做到这样我所需要做的就是用 “.user.css” 作为本地加载文件的后缀名，在 Stylus 里启动 “Live Reload” 选项，只要我在 Neovim 中保存文件就会应用所有的更改。它也支持远程 UserCSS 文件，因此，每当我将更改推送到 GitHub 或任何基于 git 的开发平台时，它们将自动对用户可用。（我提供了指向该文件的原始版本的链接，以便他们可以轻松地访问它。）

### uMatrix

![uMatrix Screenshot][22]

*uMatrix 的用户界面，显示当前访问过的网页的当前规则。*

Jeremy Garcia 在他发表在 Opensource.com 的[文章][23]中提到了一个优秀的拦截器 uBlock Origin。我想提请大家关注另一个由 [gorhill][24] 开发的扩展插件: uMatrix 。

[uMatrix][25] 允许你为网页上的某些请求设置拦截规则，可以通过点击该加载项的弹出窗口来切换（在上面的屏幕截图中可以看到）。这些请求的区别在于脚本的类别、脚本发起的请求、cookies、CSS 规则、图像、媒体、帧，和被 uMatrix 标记为“other” 的其它内容。例如，你可以设置全局规则，以便在默认情况下允许所有请求，并将特定的请求添加到黑名单中（更方便的方法），或在默认情况下阻止所有内容，并手动将某些请求列入白名单（更安全的方法）。如果你一直在使用 NoScript 或 RequestPolicy，你可以从它们 [导入][26] 你的白名单规则。

另外 uMatrix 支持 [hosts 文件][27]，可用于阻止来自某些域的请求。不要与 uBlock Origin 所使用的筛选列表混淆，它使用的语法同 Adblock Plus 一样。默认情况下，uMatrix 会通过几个 hosts 文件阻止已知的分发广告、跟踪器和恶意软件的服务器，如果需要，你可以添加更多外部数据源。

那么你将选择哪一个：uBlock Origin 或 uMatrix ？就个人而言，我在电脑上两个都用，而只在安卓手机上用 uMatrix 。[据 gorhill 所说][28]，两者之间存在某种重叠，但它们有不同的目标用户和目地。如果你想要的只是阻止跟踪器和广告的简单方法，uBlock Origine 是更好的选择；另一方面，如果你希望对网页在浏览器中可以执行或不能执行的操作进行精细的控制，即使需要一些时间来进行配置，并且可能会阻止某些网站如预期的工作，uMatrix 也是更好的选择。

### 结论

目前，这些是 Firefox 里我最喜欢的扩展。Tridactyl 通过依靠键盘和与外部程序交互，加快了浏览导航速度；Open With 能让我用鼠标在另外一个程序中打开页面；Stylus 是全面的用户样式管理器，对用户和开发人员都很有吸引力；uMatrix 本质上是 Firefox 的防火墙，可以用于过滤未知的请求。

尽管我基本上只是讨论了这些加载项的好处，但没有一个软件是完美的。如果你喜欢它们中的任何一个，并认为它们的某些方面可以改进，我建议你去它们的 Github 页面，并查看它们的贡献指南。通常情况下，自由开源软件的开发人员是欢迎错误报告和提交请求的。告诉你的朋友或道谢也是帮助开发者的好方法，特别是如果这些开发者是在业余时间从事他们的项目的话。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/firefox-open-source-extensions

作者：[Zsolt Szakács][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[lixinyuxx](https://github.com/lixinyuxx)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/zsolt
[1]:https://www.gnu.org/licenses/gpl-3.0.en.html
[2]:https://www.mozilla.org/en-US/MPL/
[3]:https://www.apache.org/licenses/LICENSE-2.0
[4]:/file/398411
[5]:https://opensource.com/sites/default/files/uploads/tridactyl.png "Tridactyl's new tab page, showcasing link hinting"
[6]:https://addons.mozilla.org/en-US/firefox/addon/tridactyl-vim/
[7]:https://github.com/vimperator/vimperator-labs
[8]:https://addons.mozilla.org/en-US/firefox/addon/pentadactyl/
[9]:https://www.vim.org/
[10]:https://mpv.io/
[11]:https://rg3.github.io/youtube-dl/index.html
[12]:/file/398416
[13]:https://opensource.com/sites/default/files/uploads/openwith.png "A context menu provided by Open With. I can open the current page with one of the external programs listed here."
[14]:https://addons.mozilla.org/en-US/firefox/addon/open-with/
[15]:/file/398421
[16]:https://opensource.com/sites/default/files/uploads/stylus.png "In this screenshot, I've just searched for and installed a dark theme for the site I'm currently on with Stylus. Even the popup has custom style (called Deepdark Stylus)!"
[17]:https://addons.mozilla.org/en-US/firefox/addon/styl-us/
[18]:https://userstyles.org/
[19]:https://addons.mozilla.org/en-US/firefox/addon/stylish/
[20]:https://github.com/openstyles/stylus/wiki/Usercss
[21]:/file/398426
[22]:https://opensource.com/sites/default/files/uploads/umatrix.png "The user interface of uMatrix, showing the current rules for the currently visited webpage."
[23]:https://opensource.com/article/18/5/firefox-extensions
[24]:https://addons.mozilla.org/en-US/firefox/user/gorhill/
[25]:https://addons.mozilla.org/en-US/firefox/addon/umatrix
[26]:https://github.com/gorhill/uMatrix/wiki/FAQ
[27]:https://en.wikipedia.org/wiki/Hosts_(file)
[28]:https://github.com/gorhill/uMatrix/issues/32#issuecomment-61372436

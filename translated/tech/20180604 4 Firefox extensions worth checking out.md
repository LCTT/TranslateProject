4个值得一提的 Firefox 拓展插件
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/firefox_blue_lead.jpg?itok=gYaubJUv)

自从大约12年前  V2.0 推出以来, 我一直是 Firefox （火狐浏览器）的用户。那时它不是最好的网络浏览器，但我仍旧因为一个理由使用它：我最喜爱的无可比拟的浏览器拓展插件

如今, 我喜欢 Firefox 的当前状态，因为它快速、可定制和开源，但我也很欣赏扩展插件来体现原开发人员从未想到的特点： 如果您想在没有鼠标的情况下浏览呢？如果您不喜欢盯着晚上从显示器里出来的强光呢？对于 YouTube 和其他视频托管网站为了更好的性能和扩展使用一个更专业的播放器又如何呢？如果您需要更复杂的方法来禁用跟踪器和加快加载页面, 该怎么办？

幸运的是， 这些问题都有答案， 我将展现给你我最喜爱的拓展--所有这些都是免费软件或开源的 (即, 在 [GNU GPL][1]， [MPL][2]，或  [Apache][3] 许可下) 并使一个优秀的浏览器更好。

尽管术语加载项和扩展具有微微不同的含义,，但我将在本文中交替使用它们。

### Tridactyl

![Tridactyl screenshot][5]

Tridactyl 的新选项卡页面，展示隐藏连接。

[Tridactyl][6] 使您能够在大多数浏览活动中使用键盘。它的灵感来自于现已解散的 [Vimperator][7] 和 [Pentadactyl][8] ，这是由 [Vim][9] 默认绑定值启发的。由于我已经习惯了 Vim 和其他命令行应用程序，我发现了一些功能，比如能够使用键值 `h/j/k/l` 进行导航，用 `f/F`  与超链接进行交互，并创建非常方便的自定义键绑定和命令。

Tridactyl 的可选本地信代理（目前，仅适用于GNU/Linux 和 Mac OSX）， 最近才实现的，提供了更酷的功能来启动。例如， 有了它， 您可以隐藏 Firefox GUI 的一些元素（à la Vimperator 和 Pentadactyl），在外部程序中打开链接或当前页 （我经常用 [mpv][10] 和 [youtube-dl][11] 在视频上）通过按 `Ctrl-I` 用您喜爱的编辑器编辑文本内容（或者任意您选择的组合键）。

话虽如此， 但要记住，这是一个相对早期的项目，细节可能还是很粗糙。 另一方面，它的发展非常活跃， 当你回顾它早期的缺陷时， 使用它可能是一种乐趣。

### Open With

![Open With Screenshot][13]

Open With 提供的菜单。我可以在当前页面打开一个额外的列表。

说到与外部程序的互动，有时很高兴有能力用鼠标来做到这一点。这是 [Open With][14] 想法的来源.

除了添加的上下文菜单 （如屏幕截图所示） 外，您还可以通过单击加载项栏上的扩展图标来找到自己定义的命令。 [its page on Mozilla Add-ons][14] 建议作为它的图标和描述，它主要是为了与其他 web 浏览器一起工作， 但我也可以轻松地使用它与 mpv 和 youtube-dl 。

这里也提供键盘快捷方式，但它们受到严重限制。可以在扩展设置的下拉列表中选择的组合不超过三种。相反， Tridactyl 允许我将命令分配给几乎任何没有被 Firefox 阻止的东西。打开与是目前为鼠标，真的。

### Stylus

![Stylus Screenshot][16]

在这个屏幕截图中， 我刚刚搜索并安装了一个黑暗的主题, 我正在上 Stylus 的网站。即使是弹出窗口也可以定制风格 （称为 Deepdark Stylus）！

[Stylus][17] 是一个用户样式管理器，这意味着通过编写自定义 CSS 规则并将其加载到 Stylus 中，您可以更改任何网页的外观。如果你不知道 CSS ，有大量的风格在其他网站上，如 [userstyles.org][18] 。

现在，你可能会问，“这不正是什么 [Stylish][19] 么？” 你是对的！你看 Stylus 是基于 Stylish 并提供了更多的改进：它不包含任何遥测数据， 尊重您的隐私，所有开发都是公开的(尽管 Stylish 仍在积极开发， 我一直未能找到最新版本的源代码）， 而且它还支持 [UserCSS][20]。

UserCSS 是一种有趣的格式，尤其是对于开发人员。我已经为不同的网站写了几种用户样式（主要是黑暗的主题和调整，以提高可读性），虽然 Stylus 的内部编辑器很好，我还是喜欢用 Neovim 编辑代码。为了做到这样我所需要做的就是用 ".user.css" 作为本地加载文件的后缀名，在 Stylus 里启动 "Live Reload" 选项，所有更改都会被应用只要我在 Neovim 中启保存和更改文件。远程 UserCSS 文件也支持，因此，每当我将更改推送到 Github 或任何基于 git 的开发平台时，它们将自动对用户可用。（我提供了指向该文件的原始版本的链接， 以便他们可以轻松地访问它。）

### uMatrix

![uMatrix Screenshot][22]

uMatrix 的用户使用界面，显示当前访问过的网页的当前规则。

Jeremy Garcia 提到了 uBlock Origin 在 [his article][23] 在 Opensource.com 作为一个优秀的 blocker 。我想推荐另一个拓展插件作者是 [gorhill][24]: uMatrix 。

[uMatrix][25] 允许您为网页上的某些请求设置阻止规则，可以通过点击加载项的弹出窗口来切换（在上面的屏幕截图中可以看到）。 这些请求的区别在于脚本的类别、 scripts, cookies, CSS rules, images, media content, frames，和其他被 uMatrix 标记为 "other" 的 。 例如，您可以设置全局规则， 以便在默认情况下允许所有请求， 并将特定请求添加到黑名单中（更方便的方法），或在默认情况下阻止所有内容， 并手动将某些请求列入白名单 （更安全的方法）。如果您一直在使用NoScript 或 RequestPolicy，你可以 [import][26] 你的白名单规则。

另外 uMatrix 支持 [hosts files ][27]，可用于阻止来自某些网站的请求。 不能与原始 uBlock 的筛选列表相比， 其使用的语法是 Adblock Plus 。默认情况下， uMatrix 会在几个文件的帮助下阻止已知分发广告、跟踪器和恶意软件的服务器， 如果需要， 您可以添加更多外部源。

那么你将选择哪一个-- uBlock Origin 或 uMatrix ？就个人而言，我在电脑上两个都用，只在安卓手机上用 uMatrix 。两者之间会有重叠的部分 [according to gorhill][28] ，但他们有不同的用户和目标群，如果你想要的只是阻止跟踪器和广告的简单方法， uBlock Origine 是更好的选择， 另一方面，如果您希望对网页在浏览器中可以执行或不能执行的操作进行精细的控制， 即使需要一些时间来进行配置， 并且可能会阻止网站按预期运行， uMatrix 是更好的选择。

### 结论

目前, 这些是 Firefox 里我最喜欢的扩展。Tridactyl 是依靠键盘和与外部程序交互， 加快浏览导航速度；Open With 能让我用鼠标点击程序操作， Stylus 是明确的用户风格的管理器， 对用户和开发人员都有吸引力； uMatrix 本质上是 Firefox 的防火墙用于过滤未知的请求。

尽管我几乎完全讨论了这些加载项的好处，但没有一个软件是完美的。如果你喜欢他们中的任何一个，并认为他们可以以任何方式改进， 我建议你去他们的 Github 页面，并寻找他们的贡献指南。通常情况下，免费和开源软件的开发人员欢迎错误报告和提交请求。告诉你的朋友或道谢也是帮助开发者的好方法， 特别是如果他们在业余时间从事他们的项目。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/firefox-open-source-extensions

作者：[Zsolt Szakács][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[lixinyuxx](https://github.com/lixinyuxx)
校对：[校对者ID](https://github.com/校对者ID)

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

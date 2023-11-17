[#]: subject: "7 Things You Never Knew You Could Do in GNOME's Activity Search"
[#]: via: "https://itsfoss.com/gnome-search/"
[#]: author: "Sreenath https://itsfoss.com/author/sreenath/"
[#]: collector: "lujun9972"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16273-1.html"

GNOME 活动搜索：你可能从未了解过的 7 个功能
======

![][0]

> GNOME 的桌面环境中隐藏着丰富的搜索特性，爱探索的你不妨尝试寻找。挖掘新知，将是一场乐趣无穷的旅程。

在我之前的 [一篇文章][1] 中，分享过在 Nautilus 文件管理器中如何掌握搜索的技巧。

在这次的教程中，我将介绍 GNOME 活动区域中一些被忽视的搜索功能。

如果 “<ruby>GNOME 活动<rt>GNOME Activities</rt></ruby>” 这个术语你并不熟悉，你可以在 GNOME 桌面环境的左上角找到并点击 “<ruby>活动<rt>Activities</rt></ruby>” 按钮，进入相应界面。

![点击活动以访问][2]

你也可以通过按下 `Super` 键（即：`Windows` 键）来快速访问。

![GNOME 搜索界面][3]

尽管 GNOME 内置了强大的搜索功能，但大部分人却仅仅用它来搜索和运行应用。

![大部分人用 GNOME 活动来搜索和运行应用][4]

而实则，它还有更多的功能等待你去探索，这些可能在你使用过程中派上大用场，同时让你带上专业用户的范儿。

就让我们逐个介绍这些隐藏功能吧。

### 1、全局文件搜索

这个功能和打开应用非常类似。当你在搜索区域开始输入，你会发现搜索结果在不断的变化。如果有文件与你的搜索关键词匹配上，你可以点击文件名，也可以按回车，以默认的应用打开它。

![文件搜索][5]

在同一界面中，你可以看到每个文件都有一个小型的预览。并且，列表中的每个文件都会标注其完整路径。

如果你细看，你会发现这里有一个文件管理器的图标，点击它。

![文件管理器图标][6]

点击后，会打开 Nautilus 文件管理器，并进入搜索模式，你可以看到所有匹配到的文件。

![Nautilus 文件管理器的搜索模式][7]

同样的，如果你点击了搜索结果中的某个应用图标，将打开这个应用，并同时展示相应的搜索结果。

> 💡 如果你已经安装了 GNOME Sushi，你甚至可以在开始使用这些文件前，使用全屏模式预览它们。

### 2、复制表情符和特殊字符

GNOME 提供了一个名为 `gnome-characters` 的应用，它包含了许多表情符以及相关字符。如果你还未安装这个应用，可以使用以下命令进行安装：

```
sudo apt install gnome-characters
```

安装完成后，这个应用将配置自己的搜索提供器。这意味着你能够搜索任何字符的名称，并且在输入过程中，系统会为你提供各种搜索建议。

![搜索概览中的字符][8]

一旦你找到了想要的字符，按回车键，就可以将其复制到剪贴板。然后使用 `CTRL+V` 进行粘贴。

![字符已复制][9]

### 3、不必打开计算器便能进行计算

你完全可以利用 GNOME shell 的搜索功能当作一个快捷的计算器。对于一些简单的数学运算，并无必要额外打开计算器应用。

相反，你可以直接在 GNOME 活动区域内完成计算。

![获取计算结果][11]

此外，你还可以将计算结果复制到剪贴板。

### 4、轻松获取全球时间

想要知道另一个城市现在的具体时间吗？不必使用其他小工具或程序，仅仅输入城市名称，GNOME shell 就能告诉你该地的时间。

![GNOME Shell 搜索中的世界时钟][12]

### 5、方便地在运行中的终端窗口之间切换

假设你同时运行了多个终端窗口，或者在同一终端窗口中打开多个标签，各自运行了不同的活动命令，例如 `top`，或者用 `bat` 或 `less` 在读取某个文件等，

你可以通过在 GNOME shell 搜索中输入命令名称，快速定位到正在运行该命令的终端窗口。

![获取运行中的终端窗口][13]

你会发现，我在其中一个终端中运行了 `top` 可以直接跳转到此终端窗口。若这是在不同的标签中，它也能帮你切换到运行着这个特定命令的标签页。

### 6、执行网络搜索

你可以通过 GNOME Shell 直达 Firefox 的网页搜索。为能实现这个功能，你需要先在后台打开 Firefox。

![设置中的 Firefox 角色——搜索提供器][14]

启动 Firefox 后，你可以在活动概览中搜索并找到网页结果。除此之外，你还可以在系统设置中，根据你的喜好对 Firefox 的显示顺序进行调整。

![Firefox 搜索结果][15]

> 🚧 遗憾的是，在我使用的 Fedora 38 系统中，虽然 Firefox 是搜索提供器，但我无法从中获得任何搜索结果。但在 Manjaro 上，一切运行正常。

如果你使用的是其他的发行版，你可以在 GNOME shell 搜索中，通过 Epiphany 或 GNOME Web 浏览器来访问网络搜索结果。首先，你可以使用你的包管理器来安装 Epiphany：

```
sudo apt install epiphany
```

或者，你也可以从 Flathub 安装：

```
flatpak install flathub org.gnome.Epiphany
```

安装完成后，打开设置，找到搜索功能。这时，你会看到 GNOME Web 已经出现在列表中了。

![搜索设置中的 GNOME Web][16]

如果它未被激活，只需开启这个开关。即使 GNOME Web 并没有被打开，它仍能正常工作。

![使用 GNOME Web 搜索得到的网络结果][17]

> 💡 如果一个新安装的应用程序提供了某种搜索功能，它将会出现在搜索标签页中。

### 7、管理搜索结果的显示顺序

你可以使用系统设置对显示的搜索结果进行重新排序，禁用某些结果等操作。

#### 在系统设置应用中访问搜索设置

打开系统设置，然后进入搜索选项卡。

![设置中的搜索选项卡][18]

#### 重新排序搜索结果显示的顺序

打开搜索设置后，你可以看到列出了所有可用的搜索提供器。每一个项目的左侧有一个把手，右侧有三个点的菜单。

![用于排列项目的按钮和把手][19]

你可以直接拖拽左侧的把手来调整项目顺序，将其放到你希望的位置。

![拖拽调整项目显示的顺序][20]

或者，你也可以点击右侧三点菜单，然后选择“<ruby>向上移动<rt>Move Up</rt></ruby>”或“<ruby>向下移动<rt>Move Down</rt></ruby>”。

![使用按钮上下移动][21]

调整后的设置将会作为 GNOME shell 搜索结果新的显示顺序。

#### 管理各个文件的搜索位置

通过搜索选项卡里的“<ruby>搜索位置<rt>Search Locations</rt></ruby>”选项，你可以调整系统应用，如文件、照片、视频等的搜索位置。

![][22]

现在，你可以开启或者关闭已有的搜索位置。或者点击添加按钮，添加新的位置。

![添加或移除位置][23]

#### 从搜索中启用或禁用搜索提供器

如果你并未使用某些搜索提供器，你可以通过禁用未使用的搜索提供器在搜索界面释放一些空间。具体操作是，使用每个项目右侧的切换按钮关闭指定提供器。

![启用 - 禁用开关][24]

如果需要，你可以随时重新开启它们，只需切换相同的按钮至开启状态。

#### 整体禁用搜索

你可以通过关闭 **应用搜索** 按钮来彻底禁用 GNOME Shell 中的应用内搜索。

![在概览中禁用搜索][25]

在这种情况下，只有应用程序可以进行搜索，搜索结果会被隐藏。

![应用内搜索被禁用状态][26]

### 额外技巧：扩展插件增强搜索效能

有一些 GNOME 扩展件可以使你的搜索更便捷、有效。

#### 快速网络搜索

这是一个名为 “Quick Web Search” 的扩展，它会为 DuckDuckGo 提供一个搜索选项。每当我们在 GNOME shell 搜索中输入一些词汇时，DuckDuckGo 的图标就会出现。单击它，将在你的首选浏览器中打开搜索结果。

![Shell 中的 DuckDuckGo 搜索][27]

即使所有的浏览器实例都已关闭，这个功能也可以正常工作。此外，你可以通过扩展设置将搜索提供器更改为谷歌或其他选项。

> **[获取 Quick Web Search 扩展][28]**

#### GNOME 模糊应用搜寻

此扩展为 GNOME 搜索提供了模糊应用搜寻结果。因此，即便你输错或拼错了某些名字，它都会尽力为你找到匹配的结果。

![使用模糊搜索的 GNOME 搜索][29]

> **[获取 GNOME 模糊应用搜索][30]**

### 充分利用 GNOME

如你所见，你可能从未充分地利用过所有的 GNOME 搜索特性，或者可能未曾对其给予足够的关注。

🗨 期望你能喜欢这些技巧。欢迎在评论区留下你的建议。

*（题图：MJ/81a823e0-ed00-4988-a0a8-47c88e4ed188）*

--------------------------------------------------------------------------------

via: https://itsfoss.com/gnome-search/

作者：[Sreenath][a]
选题：[lujun9972][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sreenath/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/nautilus-file-search/
[2]: https://itsfoss.com/content/images/2023/08/click-on-activities.png
[3]: https://itsfoss.com/content/images/2023/08/GNOME-Search-interface.png
[4]: https://itsfoss.com/content/images/2023/08/installed-apps-in-search.png
[5]: https://itsfoss.com/content/images/2023/08/file-search.png
[6]: https://itsfoss.com/content/images/2023/08/file-manager-icon-highlighted.png
[7]: https://itsfoss.com/content/images/2023/08/nautilus-file-manager-in-search-mode.png
[8]: https://itsfoss.com/content/images/2023/08/characters-in-search-overview.png
[9]: https://itsfoss.com/content/images/2023/08/character-copied-to-clipboard-message.png
[10]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[11]: https://itsfoss.com/content/images/2023/08/get-math-result.png
[12]: https://itsfoss.com/content/images/2023/08/get-time.png
[13]: https://itsfoss.com/content/images/2023/08/get-terminal.png
[14]: https://itsfoss.com/content/images/2023/08/firefox-as-a-search-provider-in-settings.png
[15]: https://itsfoss.com/content/images/2023/08/firefox-search.png
[16]: https://itsfoss.com/content/images/2023/08/GNOME-Web-in-search-settings.png
[17]: https://itsfoss.com/content/images/2023/08/gnome-web-results-in-search.png
[18]: https://itsfoss.com/content/images/2023/08/search-tab-in-settings.png
[19]: https://itsfoss.com/content/images/2023/08/button-to-arrage-items.png
[20]: https://itsfoss.com/content/images/2023/08/arrage-order-in-searches.gif
[21]: https://itsfoss.com/content/images/2023/08/move-up-and-down.gif
[22]: https://itsfoss.com/content/images/2023/08/search-locations.png
[23]: https://itsfoss.com/content/images/2023/08/Add-remove-locations.png
[24]: https://itsfoss.com/content/images/2023/08/enable-disable-toggle-button.png
[25]: https://itsfoss.com/content/images/2023/08/Disable-search-rsults.png
[26]: https://itsfoss.com/content/images/2023/08/no-in-app-searches.png
[27]: https://itsfoss.com/content/images/2023/08/ddg-web-search-plugin.png
[28]: https://extensions.gnome.org/extension/6051/quick-web-search/?ref=itsfoss.com
[29]: https://itsfoss.com/content/images/2023/08/no-result-in-misspell.png
[30]: https://extensions.gnome.org/extension/3956/gnome-fuzzy-app-search/?ref=itsfoss.com
[0]: https://img.linux.net.cn/data/attachment/album/202310/10/224338y0d7dgqlez0e0nmz.jpg
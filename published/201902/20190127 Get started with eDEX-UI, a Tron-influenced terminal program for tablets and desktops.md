[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10525-1.html)
[#]: subject: (Get started with eDEX-UI, a Tron-influenced terminal program for tablets and desktops)
[#]: via: (https://opensource.com/article/19/1/productivity-tool-edex-ui)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney (Kevin Sonney))

开始使用 eDEX-UI 吧，一款受《电子世界争霸战》影响的终端程序
======

> 使用 eDEX-UI 让你的工作更有趣，这是我们开源工具系列中的第 15 个工具，它将使你在 2019 年更高效。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/button_push_open_keyboard_file_organize.png?itok=KlAsk1gx)

每年年初似乎都有疯狂的冲动想提高工作效率。新年的决心，渴望开启新的一年，当然，“抛弃旧的，拥抱新的”的态度促成了这一切。通常这时的建议严重偏向闭源和专有软件，但事实上并不用这样。

这是我挑选出的 19 个新的（或者对你而言新的）开源工具中的第 15 个工具来帮助你在 2019 年更有效率。

### eDEX-UI

当[《电子世界争霸战》][1]上映时我才 11 岁。我不能否认，尽管这部电影充满幻想，但它对我后来的职业选择产生了影响。

![](https://opensource.com/sites/default/files/uploads/edex-ui-1.png)

[eDEX-UI][2] 是一款专为平板电脑和台式机设计的跨平台终端程序，它的用户界面受到《电子世界争霸战》的启发。它在选项卡式界面中有五个终端，因此可以轻松地在任务之间切换，以及显示有用的系统信息。

在启动时，eDEX-UI 会启动一系列的东西，其中包含它所基于的 ElectronJS 系统的信息。启动后，eDEX-UI 会显示系统信息、文件浏览器、键盘（用于平板电脑）和主终端选项卡。其他四个选项卡（被标记为 EMPTY）没有加载任何内容，并且当你单击它时将启动一个 shell。eDEX-UI 中的默认 shell 是 Bash（如果在 Windows 上，则可能需要将其更改为 PowerShell 或 cmd.exe）。

![](https://opensource.com/sites/default/files/uploads/edex-ui-2.png)

更改文件浏览器中的目录也将更改活动终端中的目录，反之亦然。文件浏览器可以执行你期望的所有操作，包括在单击文件时打开关联的应用。唯一的例外是 eDEX-UI 的 `settings.json` 文件（默认在 `.config/eDEX-UI`），它会打开配置编辑器。这允许你为终端设置 shell 命令、更改主题以及修改用户界面的其他几个设置。主题也保存在配置目录中，因为它们也是 JSON 文件，所以创建自定义主题非常简单。

![](https://opensource.com/sites/default/files/uploads/edex-ui-3.png)

eDEX-UI 允许你使用完全仿真运行五个终端。默认终端类型是 xterm-color，这意味着它支持全色彩。需要注意的一点是，输入时键会亮起，因此如果你在平板电脑上使用 eDEX-UI，键盘可能会在人们看见屏幕的环境中带来安全风险。因此最好在这些设备上使用没有键盘的主题，尽管在打字时看起来确实很酷。

![](https://opensource.com/sites/default/files/uploads/edex-ui-4.png)

虽然 eDEX-UI 仅支持五个终端窗口，但这对我来说已经足够了。在平板电脑上，eDEX-UI 给了我网络空间感而不会影响我的效率。在桌面上，eDEX-UI 支持所有功能，并让我在我的同事面前显得很酷。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/productivity-tool-edex-ui

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney (Kevin Sonney)
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Tron
[2]: https://github.com/GitSquared/edex-ui

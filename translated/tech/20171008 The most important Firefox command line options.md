最重要的 Firefox 命令行选项
======
Firefox web 浏览器支持很多命令行选项，可以定制它启动的方式。

你可能已经接触过一些了，比如 `-P "profile name"` 指定浏览器启动加载时的配置文件，`-private` 开启一个私有会话。

本指南会列出对 FIrefox 来说比较重要的那些命令行选项。它并不包含所有的可选项，因为很多选项只用于特定的目的，对一般用户来说没什么价值。

你可以在 Firefox 开发者网站上看到[完整 ][1] 的命令行选项。需要注意的是，很多命令行选项对其他基于 Mozilla 的产品一样有效，甚至对某些第三方的程序也有效。

### 重要的 Firefox 命令行选项

![firefox command line][2]

#### Profile 相关选项

  +  **-CreateProfile profile 名称** -- 创建新的用户配置信息，但并不立即使用它。
  +  **-CreateProfile "profile 名 存放 profile 的目录"** -- 跟上面一样，只是指定了存放 profile 的目录。
  +  **-ProfileManager**，或 **-P** -- 打开内置的 profile 管理器。
  + - **P "profile 名"** -- 使用 n 指定的 profile 启动 Firefox。若指定的 profile 不存在则会打开 profile 管理器。只有在没有其他 Firefox 实例运行时才有用。
  +  **-no-remote** -- 与 `-P` 连用来创建新的浏览器实例。它允许你在同一时间运行多个 profile。

#### 浏览器相关选项

  +  **-headless** -- 以无头模式启动 Firefox。Linux 上需要 Firefox 55 才支持，Windows 和 Mac OS X 上需要 Firefox 56 才支持。
  +  **-new-tab URL** -- 在 Firefox 的新标签页中加载指定 URL。
  +  **-new-window URL** -- 在 Firefox 的新窗口中加载指定 URL。
  +  **-private** -- 以私隐私浏览模式启动 Firefox。可以用来让 Firefox 始终运行在隐私浏览模式下。
  +  **-private-window** -- 打开一个隐私窗口
  +  **-private-window URL** -- 在新的隐私窗口中打开 URL。若已经打开了一个隐私浏览窗口，则在那个窗口中打开 URL。
  +  **-search 单词** -- 使用 FIrefox 默认的搜索引擎进行搜索。
  + - **url URL** -- 在新的标签也或窗口中加载 URL。可以省略这里的 `-url`，而且支持打开多个 URL，每个 URL 之间用空格分离。



#### 其他 options

  +  **-safe-mode** -- 在安全模式下启动 Firefox。在启动 Firefox 时一直按住 Shift 键也能进入安全模式。
  +  **-devtools** -- 启动 Firefox，同时加载并打开 Developer Tools。
  +  **-inspector URL** -- 使用 DOM Inspector 查看指定的 URL
  +  **-jsconsole** -- 启动 Firefox，同时打开 Browser Console。
  +  **-tray** -- 启动 Firefox，但保持最小化。




--------------------------------------------------------------------------------

via: https://www.ghacks.net/2017/10/08/the-most-important-firefox-command-line-options/

作者：[Martin Brinkmann][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ghacks.net/author/martin/
[1]:https://developer.mozilla.org/en-US/docs/Mozilla/Command_Line_Options

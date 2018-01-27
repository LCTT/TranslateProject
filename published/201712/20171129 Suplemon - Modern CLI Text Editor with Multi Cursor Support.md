Suplemon：带有多光标支持的现代 CLI 文本编辑器
======

Suplemon 是一个 CLI 中的现代文本编辑器，它模拟 [Sublime Text][1] 的多光标行为和其它特性。它是轻量级的，非常易于使用，就像 Nano 一样。

使用 CLI 编辑器的好处之一是，无论你使用的 Linux 发行版是否有 GUI，你都可以使用它。这种文本编辑器也很简单、快速和强大。

你可以在其[官方仓库][2]中找到有用的信息和源代码。

### 功能

这些是一些它有趣的功能：

*   多光标支持
*   撤销/重做
*   复制和粘贴，带有多行支持
*   鼠标支持
*   扩展
*   查找、查找所有、查找下一个
*   语法高亮
*   自动完成
*   自定义键盘快捷键

### 安装

首先，确保安装了最新版本的 python3 和 pip3。

然后在终端输入：

```
$ sudo pip3 install suplemon
```

### 使用

#### 在当前目录中创建一个新文件

打开一个终端并输入：

```
$ suplemon
```

你将看到如下：

![suplemon new file](https://linoxide.com/wp-content/uploads/2017/11/suplemon-new-file.png)

#### 打开一个或多个文件

打开一个终端并输入：

```
$ suplemon <filename1> <filename2> ... <filenameN>
```

例如：

```
$ suplemon example1.c example2.c
```

### 主要配置

你可以在 `~/.config/suplemon/suplemon-config.json` 找到配置文件。

编辑这个文件很简单，你只需要进入命令模式（进入 suplemon 后）并运行 `config` 命令。你可以通过运行 	`config defaults` 来查看默认配置。

#### 键盘映射配置

我会展示 suplemon 的默认键映射。如果你想编辑它们，只需运行 `keymap` 命令。运行 `keymap default` 来查看默认的键盘映射文件。

| 操作 | 快捷键 |
| ---- | ---- |
|   退出| `Ctrl + Q`|
|   复制行到缓冲区|`Ctrl + C`|
|   剪切行缓冲区| `Ctrl + X`|
|   插入缓冲区| `Ctrl + V`|
|   复制行| `Ctrl + K`|
|   跳转| `Ctrl + G`。 你可以跳转到一行或一个文件（只需键入一个文件名的开头）。另外，可以输入类似于 `exam:50` 跳转到 `example.c` 第 `50` 行。|
|   用字符串或正则表达式搜索| `Ctrl + F`|
|   搜索下一个| `Ctrl + D`|
|   去除空格| `Ctrl + T`|
|   在箭头方向添加新的光标| `Alt + 方向键`|
|   跳转到上一个或下一个单词或行| `Ctrl + 左/右`|
|   恢复到单光标/取消输入提示| `Esc`|
|   向上/向下移动行| `Page Up` / `Page Down`|
|   保存文件|`Ctrl + S`|
|   用新名称保存文件|`F1`|
|   重新载入当前文件|`F2`|
|   打开文件|`Ctrl + O`|
|   关闭文件|`Ctrl + W`|
|   切换到下一个/上一个文件|`Ctrl + Page Up` / `Ctrl + Page Down`|
|   运行一个命令|`Ctrl + E`|
|   撤消|`Ctrl + Z`|
|   重做|`Ctrl + Y`|
|   触发可见的空格|`F7`|
|   切换鼠标模式|`F8`|
|   显示行号|`F9`|
|   显示全屏|`F11`|



#### 鼠标快捷键

*   将光标置于指针位置：左键单击
*   在指针位置添加一个光标：右键单击
*   垂直滚动：向上/向下滚动滚轮

### 总结

在尝试 Suplemon 一段时间后，我改变了对 CLI 文本编辑器的看法。我以前曾经尝试过 Nano，是的，我喜欢它的简单性，但是它的现代特征的缺乏使它在日常使用中变得不实用。

这个工具有 CLI 和 GUI 世界最好的东西……简单性和功能丰富！所以我建议你试试看，并在评论中写下你的想法 :-)

--------------------------------------------------------------------------------

via: https://linoxide.com/tools/suplemon-cli-text-editor-multi-cursor/

作者：[Ivo Ursino][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linoxide.com/author/ursinov/
[1]:https://linoxide.com/tools/install-sublime-text-editor-linux/
[2]:https://github.com/richrd/suplemon/

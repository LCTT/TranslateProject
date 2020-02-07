[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11741-1.html)
[#]: subject: (Darktable 3 Released With GUI Rework and New Features)
[#]: via: (https://itsfoss.com/darktable-3-release/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Darktable 3 发布，带来重新打造的 UI 及新的功能
======

> 这是给摄影爱好者的圣诞节礼物。Darktable 3.0 刚刚发布了。

[Darktable][1] 是[在 Linux 上编辑 RAW 图像的最佳应用之一][2]。你可以将其视为 [Adobe Lightroom 的自由开源替代品][3]。

Darktable 3 是一个主版本更新，它带来了大量的功能改进和重新打造的用户界面。现在，GUI 完全由 GTK+ CSS 规则所控制，这使得整个 GUI 都可定制主题。它默认有八个主题。

借助 3000 多个提交和 553 个拉取请求，新版本修复了 66 个 bug 并添加了许多新功能。

让我们看看这个新版本带来了什么功能。

### Darktable 3.0 的新功能

![Darktable 3.0 Screenshot][4]

以下是重要的新功能：

* 重新打造的 UI
* 用于处理 3D RGB Lut 变换的新模块
* 对“降噪（轮廓化）”模块进行了许多改进
* 添加了新的“剔除”模式和时间轴视图
* 对“降噪（轮廓化）”模块进行了许多改进
* 新色调均衡器的基本和电影 RGB 模块
* 更好的 4K/5K 显示支持
* 撤消/重做支持更多操作
* 针对 CPU 和 SSE 路径的许多代码优化
* 支持导出到 Google 相册
* 支持更多的相机，白平衡预设和噪点配置
* 大量的 bug 修复和功能改进

你可以在 [GitHub 发行说明][5]中了解所有更改。

### 在 Linux 上安装 Darktable 3.0

让我们看看如何获​​取最新的 Darktable 版本。

#### 在基于 Ubuntu 的发行版上安装 Darktable 3.0

Ubuntu 仓库中有 Darktable，但你不能得到马上最新的版本。对于 LTS 版本，它的更新可能需要几个月的时间。

不用担心！Darktable 提供了[自己的 PPA][6] 来在基于 Ubuntu 的发行版上安装最新版本。

不幸的是，此 Darktable PPA 尚未随新版本更新。

不用担心了！多亏了我们的朋友 [Ubuntu Handbook 的 Ji M][7]，我们有一个非正式的 PPA，可以轻松地在 Ubuntu 和其他基于 Ubuntu 的发行版上安装 Darktable 3.0。

打开终端，并使用这些命令：

```
sudo add-apt-repository ppa:ubuntuhandbook1/darktable
sudo apt update
sudo apt install darktable
```

#### 卸载 Darktable 3

要删除通过此 PPA 安装的 Darktable，你可以先卸载该应用：

```
sudo apt remove darktable
```

接着[删除 PPA][8]：

```
sudo add-apt-repository -r ppa:ubuntuhandbook1/darktable
```

#### 在其他 Linux 发行版上安装 Darktable

你可以等待到你的发行版的软件管理器提供新版本。

你也可以从 GitHub 发布页面（位于页面底部）下载 tarball 或所有源代码。

- [下载 Darktable 3.0][5]

使用 Darktable 3，你可以更好地编辑自己的假期照片：）

--------------------------------------------------------------------------------

via: https://itsfoss.com/darktable-3-release/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.darktable.org/
[2]: https://itsfoss.com/raw-image-tools-linux/
[3]: https://itsfoss.com/open-source-photoshop-alternatives/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/darktable_3_screenshot.jpg?ssl=1
[5]: https://github.com/darktable-org/darktable/releases/tag/release-3.0.0
[6]: https://launchpad.net/~pmjdebruijn/+archive/ubuntu/darktable-release
[7]: http://ubuntuhandbook.org/index.php/2019/12/install-darktable-3-0-0-ubuntu-18-04-19-10/
[8]: https://itsfoss.com/how-to-remove-or-delete-ppas-quick-tip/

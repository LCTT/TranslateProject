[#]: subject: "Fixing “cannot find signatures with metadata for snap” Error in Ubuntu and other Linux"
[#]: via: "https://itsfoss.com/snap-metadata-signature-error/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14815-1.html"

修复 Ubuntu 中的 “cannot find signatures with metadata for snap” 错误
======

![](https://img.linux.net.cn/data/attachment/album/202207/11/112312l4y0jf3gag8sam4g.jpg)

前几天我试图安装 [massCode][1] 应用。对于安装，它提供了一个 Snap 文件以供下载。

当我尝试从 Snap 文件安装应用程序时：

```
sudo snap install snap_file
```

它给了我以下错误：

```
error: cannot find signatures with metadata for snap "masscode_2.6.1_amd64.snap"
```

![cannot find signature with metadata for snap][2]

这很奇怪。[在 Ubuntu 中添加外部仓库][3] 时，你必须添加 GPG 密钥。但是这里的开发人员没有提供这样的东西。

“修复”简单易行。让我给你解释一下。

### 处理 “cannot find signatures with metadata for snap” 错误

这里其实不涉及签名。

发生的情况是你从第三方下载了 Snap 安装程序。 Ubuntu 中的 Snap 机制希望你从官方 Snap 商店获取 Snap 包。

由于它不是来自 Snap 商店，因此你会看到 “cannot find signatures with metadata for snap” 的错误消息。与大多数错误消息一样，这个错误消息不是描述性的。

那么，这里的解决方案是什么？

任何未通过 Snap 商店分发的 Snap 包都必须使用 `--dangerous` 选项进行安装。这就是规则。

```
sudo snap install --dangerous path_to_snap_file
```

这样，你告诉 Snap 包管理器显式安装 Snap 包。

在这里，我使用了这个选项并且能够成功地从它的 Snap 包中安装 massCode。

![installing third party snap packages][4]

以这种方式安装 Snap 包有多“危险”？几乎和下载并 [安装 deb 格式安装包][5] 相同。

在我看来，如果你是从项目开发者的网站上下载 Snap 包，你已经在信任该项目了。在这种情况下，你可以使用 `--dangerous` 选项安装它。

当然，你应该首先搜索该软件包是否在 Snap 商店中可用：

```
snap find package_name
```

我希望这个快速的小技巧可以帮助你修复 Snap 错误。如果你有任何问题或建议，请告诉我。如果你想了解更多信息，请参阅 [这个使用 Snap 命令指南][6]。

--------------------------------------------------------------------------------

via: https://itsfoss.com/snap-metadata-signature-error/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1]: https://masscode.io/
[2]: https://itsfoss.com/wp-content/uploads/2022/07/cannot-find-signature-with-metadata-for-snap-800x205.png
[3]: https://itsfoss.com/adding-external-repositories-ubuntu/
[4]: https://itsfoss.com/wp-content/uploads/2022/07/installing-third-party-snap-packages-800x358.png
[5]: https://itsfoss.com/install-deb-files-ubuntu/
[6]: https://itsfoss.com/use-snap-packages-ubuntu-16-04/

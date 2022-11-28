[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12384-1.html)
[#]: subject: (An open source browser extension to zoom in on images)
[#]: via: (https://opensource.com/article/20/6/hoverzoom)
[#]: author: (Jeff Macharyas https://opensource.com/users/jeffmacharyas)

一个可放大图像的开源的浏览器扩展
======

> 想细看网络图像并不总是那么简单，但是 Hover Zoom+ 让它像鼠标滑动一样容易。

![Digital images of a computer desktop][1]

你是否曾经在访问网站时希望查看更大的图像？我经常遇到这种情况，而要做到这点并不总是那么容易。

有时，我在源码中筛选，使用 `Ctrl + F` 搜索图像，复制图像源地址并将其粘贴到新窗口中，以便以全尺寸查看图像。或者，另一个选择是右键单击，复制图像地址，然后粘贴到新选项卡中。

![Example image source code ][2]

Hover Zoom+ 让这个过程更加简单。Hover Zoom+ 是一个简单 Chrome 扩展程序，在 MIT 许可证下发布，可在 Chrome 商店中找到，它的源码可在 [GitHub][3] 上获得。它也适用于 Firefox。

这个应用使得该过程更加容易。只需将鼠标悬停在图像上，你将看到一个弹出窗口来显示该图像的全部内容，它会匹配你的浏览器窗口，无论图像是否被裁剪（或者图像尺寸适当，它看上去会是一样的）。这可能很有趣，因为有时可能会裁剪原始图像，以适应空间或聚焦于图像的特定部分。但是，你无法右键单击并直接从弹出窗口中保存图像。

根据加州圣何塞的开发人员 Oleg Anashkin 的说法，“这是原始 HoverZoom 扩展的开源版本，现已被恶意软件所占领，并被从商店中删除。在此版本中，所有间谍软件均已删除，许多 bug 已被修复，并添加了新功能。它默认不会收集任何统计信息。”

我在 Windows 10 笔记本上的 Chrome 中安装了此扩展，然后试用了一下。安装扩展后，我将鼠标悬停在图像上，它在弹出窗口中显示了比实际更大的图像。

但是，Hover Zoom+ 不适用于所有网站或所有图像。它适用于 Facebook 和 Twitter，但不适用于这些网站上的赞助内容。用户可以轻松切换该应用以针对特定站点启用或禁用它。使用 Hover Zoom+ 可以很容易地看到 Instagram 上的这只可爱小猫而无需实际阅读帖子（方便！）：

![Zoomed-in image of a kitten from Facebook][4]

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/hoverzoom

作者：[Jeff Macharyas][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jeffmacharyas
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_browser_web_desktop.png?itok=Bw8ykZMA (Digital images of a computer desktop)
[2]: https://opensource.com/sites/default/files/uploads/source.jpg (Example image source code)
[3]: https://github.com/extesy/hoverzoom/
[4]: https://opensource.com/sites/default/files/uploads/fb-cat.jpg (HoverZoom+ enlarged image)

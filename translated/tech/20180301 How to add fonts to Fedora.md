如何将字体添加到 Fedora
===================

![](https://fedoramagazine.org/wp-content/uploads/2017/11/install-fonts-1024x433.jpg)

字体可帮助你通过设计以创意的方式表达你的想法。无论给图片加标题、编写演示文稿，还是设计问候语或广告，字体都可以将你的想法提升到更高水平。很容易仅仅为了它们的审美品质而爱上它们。幸运的是，Fedora 使安装变得简单。以下是如何做的。

### 全系统安装

如果你在系统范围内安装字体，那么它可以让所有用户使用。此方式的最佳方法是使用官方软件库中的 RPM 软件包。

开始前打开 Fedora Workstation 中的 _Software_  工具，或者其他使用官方仓库的工具。选择横栏中选择 _Add-ons_ 类别。接着在 add-on 类别中选择 _Fonts_。你会看到类似于下面截图中的可用字体：

 [![](https://fedoramagazine.org/wp-content/uploads/2017/11/Software-fonts-1024x768.png)][1] 

当你选择一种字体时，会出现一些细节。根据几种情况，你可能能够预览字体的一些示例文本。点击 _Install_  按钮将其添加到你的系统。根据系统速度和网络带宽，完成此过程可能需要一些时间。

你还可以在字体细节中通过  _Remove_ 按钮删除前面带有勾的已经安装的字体。

### 个人安装

如果你以兼容格式：_.ttf_、 _otf_ 、_.ttc_、_.pfa_ 、_.pfb_ 或者 . _pcf_ 下载了字体，则此方法效果更好。这些字体扩展名不应通过将它们放入系统文件夹来安装在系统范围内。这种类型的非打包字体不能自动更新。他们也可能会在稍后干扰一些软件操作。安装这些字体的最佳方法是在你自己的个人数据目录中。

打开 Fedora Workstation 中的 _Files_ 应用或你选择的类似文件管理器应用。如果你使用 _Files_，那么可能需要使用 _Ctrl+H_ 组合键来显示隐藏的文件和文件夹。查找 _.fonts_ 文件夹并将其打开。如果你没有 _.fonts_ 文件夹，请创建它。 （记住最前面的点并全部使用小写。）

将已下载的字体文件复制到 _.fonts_ 文件夹中。此时你可以关闭文件管理器。打开一个终端并输入以下命令：

```
fc-cache
```

这将重建字体缓存，帮助 Fedora 可以找到并引用它。你可能还需要重新启动需要使用新字体的应用程序，例如 Inkscape 或 LibreOffice。你重新启动后，新的字体应该就可以使用了。

* * *

照片由 [Raphael Schaller][2] 发布在 [Unsplash][3] 中。

--------------------------------------------------------------------------------

作者简介:

Paul W. Frields
Paul W. Frields 自 1997 年以来一直是 Linux 用户和爱好者，并于 2003  年 Fedora 发布不久后加入项目。他是 Fedora 项目委员会的创始成员之一，并从事文档、网站发布、倡导、工具链开发和维护软件工作。他于 2008 年 2 月至 2010 年 7 月在红帽担任 Fedora 项目负责人，现任红帽公司工程部经理。他目前和他的妻子和两个孩子一起住在弗吉尼亚州。

-----------------------------

via: https://fedoramagazine.org/add-fonts-fedora/

作者：[ Paul W. Frields ][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/pfrields/
[1]:https://fedoramagazine.org/wp-content/uploads/2017/11/Software-fonts.png
[2]:https://unsplash.com/photos/GkinCd2enIY?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]:https://unsplash.com/search/photos/fonts?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText

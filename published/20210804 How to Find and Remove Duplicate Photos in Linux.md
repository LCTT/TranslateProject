[#]: subject: (How to Find and Remove Duplicate Photos in Linux)
[#]: via: (https://itsfoss.com/find-remove-duplicate-photos-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (zpl1025)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13661-1.html)

如何在 Linux 系统里查找并删除重复相片
======

![](https://img.linux.net.cn/data/attachment/album/202108/09/101511dq8uo51o8go5s9n9.jpg)

点击打开了很多相似的相片？同样的相片保存在不同文件夹里？我理解这种感受。

在相机里点击相片，通过 WhatsApp 发送。然后又备份相片，于是在 WhatsApp 和系统相册里就会存下同样的拷贝。这个很烦人，很乱而且额外占用不必要的存储空间。

我是在翻看我岳父的相片收藏时遇到这个问题的。下面是我如何找出重复相片并删除的做法。

### 使用 digiKam 来找出和删除重复相片

[digiKam][1] 是一个 [用来管理和收集相片的自由开源应用][2]。它主要是方便摄影师，但并不是说一定要专业玩相机的人才能用。

我可以演示如何使用这个工具来查找重复相片，然后根据需要删除重复内容。

#### 第一步

首先是安装 digiKam。它是一个很流行的应用程序，应该可以在软件中心里直接安装，或者通过你的发行版的包管理器安装。

![通过软件中心安装 digikam][3]

#### 第二步

在第一次运行 digiKam 时，它会要求你选择相片保存的位置。然后会创建一个 SQLite 数据库并开始导入图片。

![][4]

![][5]

![][6]

#### 第三步

在相片导入完成以后，在文件菜单里选择**工具->查找重复图片**。

![在文件菜单里，选择工具->查找重复图片][7]

#### 第四步

根据你所收集的图片数量，会需要一些时间。之后，你应该可以在左侧边栏里看到有重复的所有相片。在选中图片后，重复的相片会在右侧边栏里显示出来。

![digiKam 找到的重复图片][8]

在上面的截图里，我在左侧选中的图片有四张一样的。其中有一张图片标记了“<ruby>参考图片<rt>Reference image</rt></ruby>”，不过还是由你来确定哪张是原始的，哪张是复制的。

重复的相片默认会按保存位置（比如文件夹）来分组。可以在文件菜单里选择**视图->分类显示**选择其他方式。

**要删除重复相片的话**，选中有侧边栏里的相片并按下删除键。

可以重复这个操作，选择左侧边栏里的图片，一个个删除重复图片。会花太长时间？有个方法可以一次删除多个重复内容。

#### 在 digiKam 里删除多个重复图片

如果想一次把所有重复相片全删掉的话，可以在左侧边栏里选中所有相片。

然后，打开**文件菜单->视图->排序**，然后选择按相似程度。

![删除多个重复相片][9]

之后会在底部显示所有参考图片。然后可以在右侧边栏里选中所有没有标记重复的相片，并按下删除按钮。

#### 额外提示：可以在垃圾桶里恢复已删除的相片

意外总是有的。人们经常会不小心误删了相片。这也是为什么 digiKam 不会立刻彻底删除图片。而是选择在保存相片的文件夹下创建隐藏的 `.dtrash` 文件夹，然后将“已删除”的相片移动到里面。

在应用程序界面上，你也可以看到这个垃圾桶文件夹。在里面可以找到你“删除”的相片，然后根据需要可以选择恢复。

![digiKam 的垃圾桶文件夹][10]

希望你能喜欢这个关于在 Linux 上查找和删除重复图片的简短教程。类似的，你可能会想了解 [使用 GUI 工具在 Linux 系统里搜索重复文件][11]。

有任何问题和建议，请在下方留评。

--------------------------------------------------------------------------------

via: https://itsfoss.com/find-remove-duplicate-photos-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[zpl1025](https://github.com/zpl1025)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.digikam.org/
[2]: https://itsfoss.com/linux-photo-management-software/
[3]: https://itsfoss.com/wp-content/uploads/2021/08/digikam-software-center-800x452.webp
[4]: https://itsfoss.com/wp-content/uploads/2021/08/digikam-initial-setup-1.webp
[5]: https://itsfoss.com/wp-content/uploads/2021/08/digikam-initial-setup-2.webp
[6]: https://itsfoss.com/wp-content/uploads/2021/08/digikam-initial-setup-3-800x607.webp
[7]: https://itsfoss.com/wp-content/uploads/2021/08/find-duplicates-digikam-800x462.webp
[8]: https://itsfoss.com/wp-content/uploads/2021/08/duplicate-images-found-with-digikam-800x530.webp
[9]: https://itsfoss.com/wp-content/uploads/2021/08/remove-multiple-duplicate-photos-800x528.webp
[10]: https://itsfoss.com/wp-content/uploads/2021/08/trash-option-digiKam-800x545.webp
[11]: https://itsfoss.com/find-duplicate-files-linux/

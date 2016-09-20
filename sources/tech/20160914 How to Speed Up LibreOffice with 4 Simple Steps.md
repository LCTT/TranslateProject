

如何用四个简单的步骤加速 LibreOffice
====

![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/08/speed-up-libreoffice-featured-2.jpg)


对于许多许多开源软件的粉丝和支持者来说，LibreOffice 是 Microsoft Office 最好的替代品，在过去的一些发行版中可以看到它明显有了巨大的改进。然而，开始启动依然有许多经验需要掌握。有一些方法可以缩短 LibreOffice 的启动时间并改善它的所有性能。

在下面的段落里，我将会展示一些实用性的步骤，你可以通过它们来改善 LibreOffice 的加载时间和响应能力。

### 1. 增加每个对象和图像缓存的存储空间

这将可以通过分配更多的内存资源给图像缓存和对象来加快程序的加载时间。

1. 启动 LibreOffice Writer (或者 Calc)

2. 点击菜单栏上的 “工具 -> 选择” 或者按键盘上的快捷键“Alt + F12.”

3. 点击 LibreOffice 下面的“内存”然后增加“LibreOffice使用”到128MB

4. 同样的增加“每个对象的内存”到20MB。

5. 点击确定来保存你的修改。
![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/08/speed-up-libreoffice-step-1.png)


注意：你可以根据自己机器的性能把数值设置得比建议值的高一些或低一些。最好通过亲自体验来看看什么值能够让机器达到最佳性能。

### 2.启用 LibreOffice 的快速启动

如果你的机器上有足够大的 RAM（随机存取存储器），比如 4GB 或者更大，你可以启用“系统托盘快速启动”，从而让内存中的部分 LibreOffice 在打开新文件时能够快速反应。

在启用这个选择以后，你会清楚的看到在打开新文件时它的性能有了很大的提高。

1.通过点击“工具 -> 选择”来打开选择对话框

2. 在 “LibreOffice” 下面的侧边栏选择“内存。”

3. 勾选“系统托盘快速启动”复选框。

4. 点击“确定”来保存修改。
![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/08/speed-up-libreoffice-2.png)


一旦这个选项启用以后，你将会在你的系统托盘看到 LibreOffice 图标，可以选择来打开任何类型的文件。

### 3. 关闭 Java 运行环境

另一个加快 LibreOffice 加载时间和响应能力的简单方法是关闭 Java。

1. 同时按下“Alt + F12”打开选择对话框

2. 在侧边栏里，选择“Libreoffice”, 然后选择“高级”。

3. 取消勾选“使用 Java 运行环境”选项。

4. 点击“确定”来关闭对话框。
![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/08/speed-up-libreoffice-3.png)


如果你只使用 Writer 和 Calc，那么关闭 Java 不会影响你正常使用，但如果你需要使用 LibreOffice Base 和一些其他的特性，那么你可能需要重新启用它。在那种情况，将会弹出一个框询问你是否希望再次打开它。

### 4. 减少使用撤销步骤

默认情况下，LibreOffice 允许你最多撤销一个文件的 100 个改变。绝大多数用户不需要靠近那儿任何地方（使用撤销操作），所以多次使用撤销步骤是对内存资源的巨大浪费。

我建议减少撤销步骤到 20 次以下来为其他东西释放内存，但是这部分可以自由选择来满足你的需求。

1. 通过点击 “工具 -> 选择”来打开选择对话框。

2. 在 “LibreOffice” 下面的侧边栏，选择“内存”。

3. 在“撤销”下面把步骤数目改成最适合你的值。

4. 点击“确定”来保存修改。
![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/08/speed-up-libreoffice-5.png)


如果你这些技巧为加速你的 LibreOffice 套件的加载时间提供了帮助，请在评论里告诉我们。同样，请分享你知道的任何其他技巧来给其他人带来帮助。


--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/speed-up-libreoffice/?utm_medium=feed&utm_source=feedpress.me&utm_campaign=Feed%3A+maketecheasier

作者：[Ayo Isaiah][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.maketecheasier.com/author/ayoisaiah/

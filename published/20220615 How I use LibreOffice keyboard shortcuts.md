[#]: subject: "How I use LibreOffice keyboard shortcuts"
[#]: via: "https://opensource.com/article/22/6/libreoffice-keyboard-shortcuts"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14765-1.html"

使用 LibreOffice 键盘快捷键的小技巧
======

![](https://img.linux.net.cn/data/attachment/album/202206/27/144807lc4csplt17xm6mee.jpg)

> 键盘快捷键让我专注于我要传递的内容，而不是它的外观。

从我记事起，我就一直在使用文字处理软件。当文字处理器从直接格式化转向利用样式来改变文本在页面上的显示方式时，这对我的写作有很大的推动作用。

LibreOffice 提供了多种样式，你可以使用它们来创建各种内容。 LibreOffice 将段落样式应用于文本块，例如正文、列表和代码示例。字符样式类似，只是这些样式适用于段落内的内联词或其他短文本。使用“<ruby>视图<rt>View</rt></ruby> -> <ruby>样式<rt>Styles</rt></ruby>”菜单，或使用 `F11` 键盘快捷键，调出样式选择器。

![Image of LibreOffice styles][2]

使用样式可以更轻松地编写更长的文档。看看这个例子：作为咨询实践的一部分，我写了很多工作簿和培训材料。一个工作簿可能有 40 或 60 页长，具体取决于主题，并且可以包含各种内容，例如正文、表格和列表。我的一些技术培训材料可能还包括源代码示例。

我有一个提供给客户的标准培训集，但我也做定制的培训计划。在处理自定义程序时，我可能会先从另一个工作簿导入文本，然后从那里开始工作。根据客户的不同，我可能还会调整字体和其他样式元素以匹配客户的样式偏好。对于其他材料，我可能需要添加源代码示例。

要使用直接格式输入示例源代码，我需要设置字体并调整工作簿中每个代码块的边距。如果我后来决定我的工作簿应该对正文文本或源代码示例使用不同的字体，我需要返回并更改所有内容。对于包含多个代码示例的工作簿，这可能需要几个小时来查找每个源代码示例并调整字体和边距以匹配新的首选格式。

但是，通过使用样式，我可以更新定义一次，为正文样式使用不同的字体，并且 LibreOffice Writer 会在所有使用正文样式的地方更新我的文档。同样，我可以调整预格式化文本样式的字体和边距，LibreOffice Writer 会将这种新样式应用到每个具有预格式化文本样式的源代码示例中。这对于其他文本块也是如此，包括标题、源代码、列表以及页眉和页脚。

我最近有了一个好主意，更新 LibreOffice 键盘快捷键以简化我的写作过程。我重新定义了 `Ctrl + B` 设置加粗强调字符样式，`Ctrl + I` 设置强调字符样式，`Ctrl + 空格` 设置取消字符样式。这使我的写作变得更加容易，因为我不必暂停写作，这样我就可以高亮显示一些文本并选择一种新的风格。相反，我可以使用新的 `Ctrl + I` 键盘快捷键来设置字符样式，它本质上是斜体文本。之后我输入的任何内容都使用强调样式，直到我按 `Ctrl + 空格` 将字符样式重置为默认的无字符样式。

![Image of LibreOffice character styles][3]

如果你想自己设置的，请使用“<ruby>工具<rt>Tools</rt></ruby> -> <ruby>自定义<rt>Customize</rt></ruby>”， 然后单击“<ruby>键盘<rt>Keyboard</rt></ruby>”选项卡以修改键盘快捷键。

![Image of LibreOffice keyboard customizations][4]

LibreOffice 通过样式使技术写作变得更加容易。通过利用键盘快捷键，我简化了我的写作方式，让我专注于我要交付的内容，而不是它的外观。稍后我可能会更改格式，但样式保持不变。

*图片来源：（Jim Hall，CC BY-SA 40）*

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/libreoffice-keyboard-shortcuts

作者：[Jim Hall][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/programming_keyboard_coding.png
[2]: https://opensource.com/sites/default/files/2022-06/libreofficestyles.png
[3]: https://opensource.com/sites/default/files/2022-06/libreofficecharstyles.png
[4]: https://opensource.com/sites/default/files/2022-06/libreofficekeyboardcustom.png

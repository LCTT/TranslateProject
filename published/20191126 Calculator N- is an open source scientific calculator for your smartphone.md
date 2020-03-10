[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11981-1.html)
[#]: subject: (Calculator N+ is an open source scientific calculator for your smartphone)
[#]: via: (https://opensource.com/article/19/11/calculator-n-mobile)
[#]: author: (Ricardo Berlasso https://opensource.com/users/rgb-es)

Calculator N+：一款智能手机上的开源科学计算器
======

> 这个 Android 应用可在掌中计算许多高级数学函数。

![](https://img.linux.net.cn/data/attachment/album/202003/10/113543hlb5xu7b5e17ba90.jpg)

移动电话每天都在变得越来越强大，因此毫不奇怪它们可以击败不太久前的大多数计算机。这也意味着移动手机上的工具每天都在变得越来越强大。

之前，我写过一篇 [两款 Linux 桌面端可用的科学计算器][2]，我接着将介绍 [Calculator N+][3]，这是一款很棒的适用于 Android 设备的计算机代数系统（CAS）应用，采用  GPL v3.0 许可证下。

Calculator N+ 被认为是“适用于 Android 的强大计算器”，但这是一个谦虚的说法。它不仅可以以任意精度工作，还可以显示根数和分数等*很多*功能。

寻找多项式根？可以。分解因数？可以。导数、积分和极限？可以。数论（模算术、组合学、素因数分解）？可以。

你还可以求解方程系统、简化表达式（包括三角函数）、转换单位，只要你想到的，它都能做！

![Calculator N+ graphical interface][4]

其结果以 LaTeX 输出。左上方的菜单提供了许多强大的功能，只需触摸一下即可使用。同样在该菜单中，你将找到该应用所有功能的帮助文件。在屏幕的右上角，你可以在精确表示法和十进制表示法之间切换。最后，点击屏幕底部的蓝色栏，即可访问应用中的所有函数库。不过要小心！如果你不是数学家、物理学家或工程师，那么这么长的列表会看上去很吓人。

所有这些功能都来自 [Symja 库][5]，这是另一个出色的 GPL 3 项目。

这两个项目都处于积极开发中，并且每个版本都在不断完善。特别是，Calculator N+ 的 v3.4.6 在用户界面（UI）品质方面取得了重大飞跃。虽然还是存在一些不够好的地方，但是要在智能手机的小巧的用户界面中发挥如此强大的功能是一项艰巨的任务，我认为应用开发人员正在很好地解决其剩余的问题。对他们表示敬意！

如果你是老师、学生或在理工科领域工作，请试试 Calculator N+。它是免费、无广告、开源的，并可以满足你所有的数学需求。（当然，除了数学考试期间，为防止作弊绝对不允许使用智能手机。）

可以在 [Google Play 商店][6]找到 Calculator N+，也可以使用 GitHub 页面上的说明[从源代码构建][7]。

如果你知道用于科学或工程的其他有用的开源应用，请在评论中告知我们。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/calculator-n-mobile

作者：[Ricardo Berlasso][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rgb-es
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/calculator_money_currency_financial_tool.jpg?itok=2QMa1y8c (scientific calculator)
[2]: https://linux.cn/article-9643-1.html
[3]: https://github.com/tranleduy2000/ncalc
[4]: https://opensource.com/sites/default/files/uploads/calculatornplus_sqrt-frac.png (Calculator N+ graphical interface)
[5]: https://github.com/axkr/symja_android_library
[6]: https://play.google.com/store/apps/details?id=com.duy.calculator.free
[7]: https://github.com/tranleduy2000/ncalc/blob/master/README.md

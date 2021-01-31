[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13070-1.html)
[#]: subject: (Why keeping a journal improves productivity)
[#]: via: (https://opensource.com/article/21/1/open-source-journal)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

为什么写日记能提高效率
======

> 写日记有着悠久的历史。这里有三个开源工具，可以帮助你写日记变得更轻松。

![](https://img.linux.net.cn/data/attachment/album/202101/31/082622p6wgh7szzuvevug4.jpg)

在前几年，这个年度系列涵盖了单个的应用。今年，我们除了关注 2021 年的策略外，还将关注一体化解决方案。欢迎来到 2021 年 21 天生产力的第十天。

在我的小学时代，商业互联网还没有出现，老师经常会给我们班级布置一个让我们写日记的作业。有时会针对一些特定的内容，例如特定格式的虫子列表和说明，或者是公民课的每周新闻摘要。

几个世纪以来，人们一直在写日记。它们是一种方便的信息保存方式。它们有很多形式，比如意大利的 [Zibaldone][2]、[备忘录][3]，或者记录今天做了什么的事件日记。

![Notebook folders][4]

*（Kevin Sonney, [CC BY-SA 4.0][5]）*

为什么我们要写某种日记呢？第一个原因是为了让我们不至于把所有的事情都记在脑子里。我们中没有多少人有<ruby>[遗觉记忆][6]<rt>Eidetic memory</rt></ruby>，维护运行日记或一组笔记可以让我们更容易地参考我们之前做的一些事情。日记也更容易分享，因为它们可以在聊天、邮件中复制/粘贴。正如 [Robert Boyce][7] 的名言：“知识就是力量。知识共享使力量倍增。”知识的共享是开源的一个内在组成部分。

![Today's journal][8]

*今天的日记 （Kevin Sonney, [CC BY-SA 4.0][5]）*

在写事件日记的时候，有一个很关键的点就是要快速、简单、方便。最简单的方法是打开文档，添加一行当前日期和备注，然后保存。

有几个程序或附加软件可以让这一切变得更简单。[GNote 的 Note of the Day 插件][9]会自动创建一个以日期为标题的笔记，可以用来保存当天的内容。

Emacs Org 模式有一个热键组合，可以“捕捉”事物并将其放入文档中。结合 [org-journal][10] 附加组件，这将在文档中创建当天的条目。

Kontact 的 KNotes 组件会自动将日期和时间添加到新笔记中。

![Finding a note][11]

*查找笔记 （Kevin Sonney, [CC BY-SA 4.0][5]）*

写日记或记录事情是一种方便的方法，可以记录做了什么和怎么做的。它的作用不仅仅是“我做了什么”，它还可以包括阅读的书籍、吃过的食物、去过的地方，以及一大堆对未来有用的信息。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/open-source-journal

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/note-taking.jpeg?itok=fiF5EBEb (Note taking hand writing)
[2]: https://en.wikipedia.org/wiki/Zibaldone
[3]: https://en.wikipedia.org/wiki/Commonplace_book
[4]: https://opensource.com/sites/default/files/pictures/day10-image1.png (Notebook folders)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://en.wikipedia.org/wiki/Eidetic_memory
[7]: https://en.wikipedia.org/wiki/Robert_Boyce
[8]: https://opensource.com/sites/default/files/pictures/day10-image2.png (Today's journal)
[9]: https://help.gnome.org/users/gnote/unstable/addin-noteoftheday.html.en
[10]: https://github.com/bastibe/org-journal
[11]: https://opensource.com/sites/default/files/pictures/day10-image3.png (Finding a note)

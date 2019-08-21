[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10574-1.html)
[#]: subject: (Get started with Org mode without Emacs)
[#]: via: (https://opensource.com/article/19/1/productivity-tool-org-mode)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney (Kevin Sonney))

开始使用 Org 模式吧，在没有 Emacs 的情况下
======

> 不，你不需要 Emacs 也能用 Org，这是我开源工具系列的第 16 集，将会让你在 2019 年变得更加有生产率。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/web_browser_desktop_devlopment_design_system_computer.jpg?itok=pfqRrJgh)

每到年初似乎总有这么一个疯狂的冲动来寻找提高生产率的方法。新年决心，正确地开始一年的冲动，以及“向前看”的态度都是这种冲动的表现。软件推荐通常都会选择闭源和专利软件。但这不是必须的。

这是我 2019 年改进生产率的 19 个新工具中的第 16 个。

### Org (非 Emacs)

[Org 模式][1] (或者就称为 Org) 并不是新鲜货，但依然有许多人没有用过。他们很乐意试用一下以体验 Org 是如何改善生产率的。但最大的障碍来自于 Org 是与 Emacs 相关联的，而且很多人都认为两者缺一不可。并不是这样的！一旦你理解了其基础，Org 就可以与各种其他工具和编辑器一起使用。

![](https://opensource.com/sites/default/files/uploads/org-1.png)

Org，本质上，是一个结构化的文本文件。它有标题、子标题，以及各种关键字，其他工具可以根据这些关键字将文件解析成日程表和代办列表。Org 文件可以被任何纯文本编辑器编辑（例如，[Vim][2]、[Atom][3] 或 [Visual Studio Code][4]），而且很多编辑器都有插件可以帮你创建和管理 Org 文件。

一个基础的 Org 文件看起来是这样的：

```
* Task List
** TODO Write Article for Day 16 - Org w/out emacs
   DEADLINE: <2019-01-25 12:00>
*** DONE Write sample org snippet for article
    - Include at least one TODO and one DONE item
    - Show notes
    - Show SCHEDULED and DEADLINE
*** TODO Take Screenshots
** Dentist Appointment
   SCHEDULED: <2019-01-31 13:30-14:30>
```

Org 是一种大纲格式，它使用 `*` 作为标识指明事项的级别。任何以 `TODO`（是的，全大些）开头的事项都是代办事项。标注为 `DONE` 的工作表示该工作已经完成。`SCHEDULED` 和 `DEADLINE` 标识与该事务相关的日期和时间。如何任何地方都没有时间，则该事务被视为全天活动。

使用正确的插件，你喜欢的文本编辑器可以成为一个充满生产率和组织能力的强大工具。例如，[vim-orgmode][5] 插件包括创建 Org 文件、语法高亮的功能，以及各种用来生成跨文件的日程和综合代办事项列表的关键命令。

![](https://opensource.com/sites/default/files/uploads/org-2.png)

Atom 的 [Organized][6] 插件可以在屏幕右边添加一个侧边栏，用来显示 Org 文件中的日程和代办事项。默认情况下它从配置项中设置的路径中读取多个 Org 文件。Todo 侧边栏允许你通过点击未完事项来将其标记为已完成，它会自动更新源 Org 文件。

![](https://opensource.com/sites/default/files/uploads/org-3.png)

还有一大堆 Org 工具可以帮助你保持生产率。使用 Python、Perl、PHP、NodeJS 等库，你可以开发自己的脚本和工具。当然，少不了 [Emacs][7]，它的核心功能就包括支持 Org。

![](https://opensource.com/sites/default/files/uploads/org-4.png)

Org 模式是跟踪需要完成的工作和时间的最好工具之一。而且，与传闻相反，它无需 Emacs，任何一个文本编辑器都行。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/productivity-tool-org-mode

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney (Kevin Sonney)
[b]: https://github.com/lujun9972
[1]: https://orgmode.org/
[2]: https://www.vim.org/
[3]: https://atom.io/
[4]: https://code.visualstudio.com/
[5]: https://github.com/jceb/vim-orgmode
[6]: https://atom.io/packages/organized
[7]: https://www.gnu.org/software/emacs/

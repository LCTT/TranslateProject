[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11908-1.html)
[#]: subject: (Use Vim to send email and check your calendar)
[#]: via: (https://opensource.com/article/20/1/vim-email-calendar)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

使用 Vim 发送邮件和检查日历
======

> 在 2020 年用开源实现更高生产力的二十种方式的第十六篇文章中，直接通过文本编辑器管理你的电子邮件和日历。

![](https://img.linux.net.cn/data/attachment/album/202002/19/185842eyz2znxx1yc2ctnc.jpg)

去年，我在 19 天里给你介绍了 19 个新（对你而言）的生产力工具。今年，我换了一种方式：使用你在使用或者还没使用的工具，构建一个使你可以在新一年更加高效的环境。

### 用 Vim 做（几乎）所有事情，第一部分

我经常使用两个文本编辑器 —— [Vim][2] 和 [Emacs][3]。为什么两者都用呢？它们有不同的使用场景，在本系列的后续几篇文章中，我将讨论其中的一些用例。

![][4]

好吧，为什么要在 Vim 中执行所有操作？因为如果有一个应用程序是我可以访问的每台计算机上都有的，那就是 Vim。如果你像我一样，可能已经在 Vim 中打发了很多时光。那么，为什么不将其用于**所有事情**呢？

但是，在此之前，你需要做一些事情。首先是确保你的 Vim 具有 Ruby 支持。你可以使用 `vim --version | grep ruby`。如果结果不是 `+ruby`，则需要解决这个问题。这可能有点麻烦，你应该查看发行版的文档以获取正确的软件包。在 MacOS 上，用的是官方的 MacVim（不是 Brew 发行的），在大多数 Linux 发行版中，用的是 vim-nox 或 vim-gtk，而不是 vim-gtk3。

我使用 [Pathogen][5] 自动加载插件和捆绑软件。如果你使用 [Vundle][6] 或其他 Vim 软件包管理器，则需要调整以下命令才能使用它。

#### 在 Vim 中管理你的邮件

使 Vim 在你的生产力计划中发挥更大作用的一个很好的起点是使用它通过  [Notmuch] [7] 发送和接收电子邮件，和使用 [abook] [8] 访问你的联系人列表。你需要为此安装一些东西。下面的所有示例代码都运行在 Ubuntu 上，因此如果你使用其他发行版，则需要对此进行调整。通过以下步骤进行设置：

```
sudo apt install notmuch-vim ruby-mail
curl -o ~/.vim/plugin/abook --create-dirs https://raw.githubusercontent.com/dcbaker/vim-abook/master/plugin/abook.vim
```

到目前为止，一切都很顺利。现在启动 Vim 并执行  `:NotMuch`。由于是用较旧版本的邮件库 `notmuch-vim` 编写的，可能会出现一些警告，但总的来说，Vim 现在将成为功能齐全的 Notmuch 邮件客户端。

![Reading Mail in Vim][9]

如果要搜索特定标签，请输入 `\t`，输入标签名称，然后按回车。这将拉出一个带有该标签的所有消息的列表。`\s` 组合键会弹出 `Search:` 提示符，可以对 Notmuch 数据库进行全面搜索。使用箭头键浏览消息列表，按回车键显示所选项目，然后输入 `\q` 退出当前视图。

要撰写邮件，请使用 `\c` 按键。你将看到一条空白消息。这是 `abook.vim` 插件发挥作用的位置。按下 `Esc` 并输入 `:AbookQuery <SomeName>`，其中 `<SomeName>` 是你要查找的名称或电子邮件地址的一部分。你将在 abook 数据库中找到与你的搜索匹配的条目列表。通过键入你想要的地址的编号，将其添加到电子邮件的地址行中。完成电子邮件的键入和编辑，按 `Esc` 退出编辑模式，然后输入 `,s` 发送。

如果要在 `:NotMuch` 启动时更改默认文件夹视图，则可以将变量 `g:notmuch_folders` 添加到你的 `.vimrc` 文件中：

```
let g:notmuch_folders = [
      \ [ 'new', 'tag:inbox and tag:unread' ],
      \ [ 'inbox', 'tag:inbox' ],
      \ [ 'unread', 'tag:unread' ],
      \ [ 'News', 'tag:@sanenews' ],
      \ [ 'Later', 'tag:@sanelater' ],
      \ [ 'Patreon', 'tag:@patreon' ],
      \ [ 'LivestockConservancy', 'tag:livestock-conservancy' ],
    \ ]
```

Notmuch 插件的文档中涵盖了更多设置，包括设置标签键和使用其它的邮件程序。

#### 在 Vim 中查询日历

![][10]

遗憾的是，似乎没有使用 vCalendar 或 iCalendar 格式的 Vim 日历程序。有个 [Calendar.vim][11]，做得很好。设置 Vim 通过以下方式访问你的日历：

```
cd ~/.vim/bundle
git clone git@github.com:itchyny/calendar.vim.git
```

现在，你可以通过输入 `:Calendar` 在 Vim 中查看日历。你可以使用 `<` 和 `>` 键在年、月、周、日和时钟视图之间切换。如果要从一个特定的视图开始，请使用 `-view=` 标志告诉它你希望看到哪个视图。你也可以在任何视图中定位日期。例如，如果我想查看 2020 年 7 月 4 日这一周的情况，请输入 `:Calendar -view week 7 4 2020`。它的帮助信息非常好，可以使用 `?` 键参看。

![][13]

Calendar.vim 还支持 Google Calendar（我需要），但是在 2019 年 12 月，Google 禁用了它的访问权限。作者已在 [GitHub 上的这个提案][14]中发布了一种变通方法。

这样你就在 Vim 中有了这些：你的邮件、地址簿和日历。但是这些还没有完成； 下一篇你将在 Vim 上做更多的事情！

Vim 为作家提供了很多好处，无论他们是否具有技术意识。

需要保持时间表正确吗？了解如何使用这些免费的开源软件来做到这一点。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/vim-email-calendar

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/calendar.jpg?itok=jEKbhvDT (Calendar close up snapshot)
[2]: https://www.vim.org/
[3]: https://www.gnu.org/software/emacs/
[4]: https://opensource.com/sites/default/files/uploads/day16-image1.png
[5]: https://github.com/tpope/vim-pathogen
[6]: https://github.com/VundleVim/Vundle.vim
[7]: https://opensource.com/article/20/1/organize-email-notmuch
[8]: https://opensource.com/article/20/1/sync-contacts-locally
[9]: https://opensource.com/sites/default/files/uploads/productivity_16-2.png (Reading Mail in Vim)
[10]: https://opensource.com/sites/default/files/uploads/day16-image3.png
[11]: https://github.com/itchyny/calendar.vim
[12]: mailto:git@github.com
[13]: https://opensource.com/sites/default/files/uploads/day16-image4.png
[14]: https://github.com/itchyny/calendar.vim/issues/156

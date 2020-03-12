[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11912-1.html)
[#]: subject: (Use Vim to manage your task list and access Reddit and Twitter)
[#]: via: (https://opensource.com/article/20/1/vim-task-list-reddit-twitter)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

使用 Vim 管理任务列表和访问 Reddit 和 Twitter
======

> 在 2020 年用开源实现更高生产力的二十种方式的第十七篇文章中，了解在编辑器中处理待办列表以及获取社交信息。

![](https://img.linux.net.cn/data/attachment/album/202002/21/112633yf3mx8qlssltugzm.jpg)

去年，我在 19 天里给你介绍了 19 个新（对你而言）的生产力工具。今年，我换了一种方式：使用你在使用或者还没使用的工具，构建一个使你可以在新一年更加高效的环境。

### 用 Vim 做（几乎）所有事情，第 2 部分

在[昨天的文章][2]中，你开始用 Vim 检查邮件和日历。今天，你可以做的更多。首先，你会在 Vim 编辑器中跟踪任务，然后获取社交信息。

#### 使用 todo.txt-vim 在 Vim 中跟踪待办任务

![to-dos and Twitter with Vim][3]

使用 Vim 编辑一个文本待办事件是一件自然的事，而 [todo.txt-vim][4] 包使其更加简单。首先安装 todo.txt-vim 包：

```
git clone https://github.com/freitass/todo.txt-vim ~/.vim/bundle/todo.txt-vim
vim ~/path/to/your/todo.txt
```

todo.txt-vim 自动识别以 `todo.txt` 和 `done.txt` 结尾的文件作为 [todo.txt][5] 文件。它添加特定于 todo.txt 格式的键绑定。你可以使用 `\x` 标记“已完成”的内容，使用 `\d` 将其设置为当前日期，然后使用 `\a`、`\b` 和 `\c` 更改优先级。你可以提升（`\k`）或降低（`\j`）优先级，并根据项目（`\s+`）、上下文（`\s@`）或日期（`\sd`）排序（`\s`）。完成后，你可以和平常一样关闭和保存文件。

todo.txt-vim 包是我几天前写的 [todo.sh 程序][6]的一个很好的补充，使用 [todo edit][7] 加载项，它可以增强的你待办事项列表跟踪。

#### 使用 vim-reddit 读取 Reddit

![Reddit in Vim][8]

Vim 还有一个不错的用于 [Reddit][9] 的加载项，叫 [vim-reddit][10]。它不如 [Tuir][11] 好，但是用于快速查看最新的文章，它还是不错的。首先安装捆绑包：

```
git clone https://github.com/DougBeney/vim-reddit.git ~/.vim/bundle/vim-reddit
vim
```

现在输入 `:Reddit` 将加载 Reddit 首页。你可以使用 `:Reddit name` 加载特定子板。打开文章列表后，使用箭头键导航或使用鼠标滚动。按 `o` 将在 Vim 中打开文章（除非它多媒体文章，它会打开浏览器），然后按 `c` 打开评论。如果要直接转到页面，请按 `O` 而不是 `o`。只需按 `u` 就能返回。当你 Reddit 看完后，输入 `:bd` 就行。vim-reddit 唯一的缺点是无法登录或发布新文章和评论。话又说回来，有时这是一件好事。

#### 使用 twitvim 在 Vim 中发推

![Twitter in Vim][12]

最后，我们有 [twitvim][13]，这是一个于阅读和发布 Twitter 的 Vim 软件包。它需要更多设置。首先从 GitHub 安装 twitvim：

```
git clone https://github.com/twitvim/twitvim.git ~/.vim/bundle/twitvim
```

现在你需要编辑 `.vimrc` 文件并设置一些选项。它帮助插件知道使用哪些库与 Twitter 交互。运行 `vim --version` 并查看哪些语言的前面有 `+` 就代表你的 Vim 支持它。

![Enabled and Disabled things in vim][14]

因为我的是 `+perl -python +python3`，所以我知道我可以启用 Perl 和 Python 3 但不是 Python 2 （python）。

```
" TwitVim Settings
let twitvim_enable_perl = 1
" let twitvim_enable_python = 1
let twitvim_enable_python3 = 1
```

现在，你可以通过运行 `:SetLoginTwitter` 启动浏览器窗口，它会打开一个浏览器窗口要求你授权 VimTwit 访问你的帐户。在 Vim 中输入提供的 PIN 后就可以了。

Twitvim 的命令不像其他包中一样简单。要加载好友和关注者的时间线，请输入 `:FriendsTwitter`。要列出提及你的和回复，请使用 `:MentionsTwitter`。发布新推文是 `:PosttoTwitter <Your message>`。你可以滚动列表并输入 `\r` 回复特定推文，你可以用 `\d` 直接给某人发消息。

就是这些了。你现在可以在 Vim 中做（几乎）所有事了！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/vim-task-list-reddit-twitter

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_chat_communication_message.png?itok=LKjiLnQu (Chat via email)
[2]: https://linux.cn/article-11908-1.html
[3]: https://opensource.com/sites/default/files/uploads/productivity_17-1.png (to-dos and Twitter with Vim)
[4]: https://github.com/freitass/todo.txt-vim
[5]: http://todotxt.org
[6]: https://opensource.com/article/20/1/open-source-to-do-list
[7]: https://github.com/todotxt/todo.txt-cli/wiki/Todo.sh-Add-on-Directory#edit-open-in-text-editor
[8]: https://opensource.com/sites/default/files/uploads/productivity_17-2.png (Reddit in Vim)
[9]: https://reddit.com
[10]: https://github.com/DougBeney/vim-reddit
[11]: https://opensource.com/article/20/1/open-source-reddit-client
[12]: https://opensource.com/sites/default/files/uploads/productivity_17-3.png (Twitter in Vim)
[13]: https://github.com/twitvim/twitvim
[14]: https://opensource.com/sites/default/files/uploads/productivity_17-4.png (Enabled and Disabled things in vim)

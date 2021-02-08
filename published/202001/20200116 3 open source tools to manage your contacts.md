[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11834-1.html)
[#]: subject: (3 open source tools to manage your contacts)
[#]: via: (https://opensource.com/article/20/1/sync-contacts-locally)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

用于联系人管理的三个开源工具
======

> 通过将联系人同步到本地从而更快访问它。在我们的 20 个使用开源提升生产力的系列的第六篇文章中了解该如何做。

![](https://img.linux.net.cn/data/attachment/album/202001/30/194811bbtt449zfr9zppb3.jpg)

去年，我在 19 天里给你介绍了 19 个新（对你而言）的生产力工具。今年，我换了一种方式：使用你在使用或者还没使用的工具，构建一个使你可以在新一年更加高效的环境。

### 用于联系人管理的开源工具

在本系列之前的文章中，我解释了如何在本地同步你的[邮件][2]和[日历][3]。希望这些加速了你访问邮件和日历。现在，我将讨论联系人同步，你可以给他们发送邮件和日历邀请。

![abook][4]

我目前收集了很多邮件地址。管理这些数据可能有点麻烦。有基于 Web 的服务，但它们不如本地副本快。

几天前，我谈到了用于管理日历的 [vdirsyncer][5]。vdirsyncer 还使用 CardDAV 协议处理联系人。vdirsyncer 除了可以使用**文件系统**存储日历外，还支持通过 **google_contacts** 和 **carddav** 进行联系人同步，但 `fileext` 设置会被更改，因此你无法在日历文件中存储联系人。

我在配置文件添加了一块配置，并从 Google 镜像了我的联系人。设置它需要额外的步骤。从 Google 镜像完成后，配置非常简单：

```
[pair address_sync]
a = "googlecard"
b = "localcard"
collections = ["from a", "from b"]
conflict_resolution = "a wins"

[storage googlecard]
type = "google_contacts"
token_file = "~/.vdirsyncer/google_token"
client_id = "my_client_id"
client_secret = "my_client_secret"

[storage localcard]
type = "filesystem"
path = "~/.calendars/Addresses/"
fileext = ".vcf"
```

现在，当我运行 `vdirsyncer discover` 时，它会找到我的 Google 联系人，并且 `vdirsyncer sync` 将它们复制到我的本地计算机。但同样，这只进行到一半。现在我想查看和使用联系人。需要 [khard][6] 和 [abook][7]。

![khard search][8]

为什么选择两个应用？因为每个都有它自己的使用场景，在这里，越多越好。khard 用于管理地址，类似于 [khal][9] 用于管理日历条目。如果你的发行版附带了旧版本，你可能需要通过 `pip` 安装最新版本。安装 khard 后，你需要创建 `~/.config/khard/khard.conf`，因为 khard 没有与 khal 那样漂亮的配置向导。我的看起来像这样：

```
[addressbooks]
[[addresses]]
path = ~/.calendars/Addresses/default/

[general]
debug = no
default_action = list
editor = vim, -i, NONE
merge_editor = vimdiff

[contact table]
display = first_name
group_by_addressbook = no
reverse = no
show_nicknames = yes
show_uids = no
sort = last_name
localize_dates = yes

[vcard]
preferred_version = 3.0
search_in_source_files = yes
skip_unparsable = no
```

这会定义源通讯簿（并给它一个友好的名称）、显示内容和联系人编辑程序。运行 `khard list` 将列出所有条目，`khard list <some@email.adr>` 可以搜索特定条目。如果要添加或编辑条目，`add` 和 `edit` 命令将使用相同的基本模板打开配置的编辑器，唯一的区别是 `add` 命令的模板将为空。

![editing in khard][11]

abook 需要你导入和导出 VCF 文件，但它为查找提供了一些不错的功能。要将文件转换为 abook 格式，请先安装 abook 并创建 `~/.abook` 默认目录。然后让 abook 解析所有文件，并将它们放入 `~/.abook/addresses` 文件中：

```
apt install abook
ls ~/.calendars/Addresses/default/* | xargs cat | abook --convert --informat vcard --outformat abook > ~/.abook/addresses
```

现在运行 `abook`，你将有一个非常漂亮的 UI 来浏览、搜索和编辑条目。将它们导出到单个文件有点痛苦，所以我用 khard 进行大部分编辑，并有一个 cron 任务将它们导入到 abook 中。

abook 还可在命令行中搜索，并有大量有关将其与邮件客户端集成的文档。例如，你可以在 `.config/alot/config` 文件中添加一些信息，从而在 [Nmuch][12] 的邮件客户端 [alot][13] 中使用 abook 查询联系人：

```
[accounts]
  [[Personal]]
     realname = Kevin Sonney
     address = kevin@sonney.com
     alias_regexp = kevin\+.+@sonney.com
     gpg_key = 7BB612C9
     sendmail_command = msmtp --account=Personal -t
     # ~ expansion works
     sent_box = maildir://~/Maildir/Sent
     draft_box = maildir://~/Maildir/Drafts
    [[[abook]]]
        type = abook
```

这样你就可以在邮件和日历中快速查找联系人了！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/sync-contacts-locally

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/talk_chat_team_mobile_desktop.png?itok=d7sRtKfQ (Team communication, chat)
[2]: https://linux.cn/article-11804-1.html
[3]: https://linux.cn/article-11812-1.html
[4]: https://opensource.com/sites/default/files/uploads/productivity_6-1.png (abook)
[5]: https://github.com/pimutils/vdirsyncer
[6]: https://github.com/scheibler/khard
[7]: http://abook.sourceforge.net/
[8]: https://opensource.com/sites/default/files/uploads/productivity_6-2.png (khard search)
[9]: https://khal.readthedocs.io/en/v0.9.2/index.html
[10]: mailto:some@email.adr
[11]: https://opensource.com/sites/default/files/uploads/productivity_6-3.png (editing in khard)
[12]: https://opensource.com/article/20/1/organize-email-notmuch
[13]: https://github.com/pazz/alot
[14]: mailto:kevin@sonney.com
[15]: mailto:+.+@sonney.com

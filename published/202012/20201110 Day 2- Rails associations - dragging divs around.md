[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12890-1.html)
[#]: subject: (Day 2: Rails associations & dragging divs around)
[#]: via: (https://jvns.ca/blog/2020/11/10/day-2--rails-associations---dragging-divs-around/)
[#]: author: (Julia Evans https://jvns.ca/)

Rails 之旅第 2 天：Rails 关联和拖动 div
======

![](https://img.linux.net.cn/data/attachment/album/202012/05/212345zz8jajhaj0hh8h2f.jpg)

大家好！今天是我搭建这个玩具项目的第 2 天。下面再来记录一下关于 Rails 的一些有趣的事情吧！

### 目标：做一个冰箱诗歌论坛

我想做一种无聊的标准网站来学习 Rails，并且其他人可以与之互动，就像一个论坛一样! 但如果人们真的可以在网站上打字，那就会产生各种各样的问题（如果他们是垃圾邮件发送者怎么办？又或者只是言语刻薄？）。

我想到的第一个想法是，可以让人们与网站互动，但实际上却不能在网站上打字，那就是一个“冰箱诗歌论坛”，只给你一组固定的字，你就可以随意组合。

所以，这就是我们的计划！

我这个项目的目标是想知道我是否能用 Rails 来做其他的小型网络项目（而不是像我通常做的那样，使用一些更基本的东西，比如 Flask，或者放弃后端，用 Javascript 来写所有东西）。

### 怎么把字拖来拖去呢？jQuery 的可拖放 UI！

我想让大家能够把文字拖动起来，但我又不想写很多 Javascript。结果发现这超级简单 —— 有一个 jQuery 库可以做到，它叫做 `draggable`！一开始，拖动并不成功。

一开始拖动在手机上是不行的，但是有一个技巧可以让 jQuery UI 在手机上工作，叫做 [jQuery UI touch punch][1]。下面是它的样子（有兴趣看工作原理的可以查看源码，代码很少）。

> `banana` `forest` `cake` `is`

### 一个有趣的 Rails 功能：关联

我以前从来没有使用过关系型 ORM，对于 Rails，我很兴奋的一件事就是想看看使用 Active Record 是什么样子的！今天我了解了 Rails 的 ORM 功能之一：[关联][2]。如果你像我一样对 ORM 完全不了解的话，那就来看看是怎么回事吧。

在我的论坛中，我有：

  * 用户
  * 话题（我本来想把它叫做“线索”，但显然这在 Rails 中是一个保留词，所以现在叫做“话题”）。
  * 帖子

当显示一个帖子时，我需要显示创建该帖子的用户的用户名。所以我想我可能需要写一些代码来加载帖子，并为每个帖子加载用户，就像这样（在 Rails 中，`Post.where` 和 `User.find` 将会运行 SQL 语句，并将结果转化为 Ruby 对象）：

```
@posts = Post.where(topic_id: id)
@posts.each do |post|
    user = User.find(post.user_id)
    post.user = user
end
```

这还不够好，它要为每个帖子做一次单独的 SQL 查询！我知道有一个更好的方法，我发现它叫做[关联][2]。这个链接是来自 <https://guides.rubyonrails.org> 的指南，到目前为止，它对我很有帮助。

基本上我需要做的就是：

  1. 在 `User` 模型中添加一行 `has_many :post`。
  2. 在 `Post` 模型中添加一行 `belongs_to :user`。
  3. Rails 现在知道如何将这两个表连接起来，尽管我没有告诉它要连接到什么列上！我认为这是因为我按照它所期望的惯例命名了 `posts` 表中的 `user_id` 列。
  4. 对 `User` 和 `Topic` 做完全相同的事情（一个主题也有很多帖子：`has_many :posts`）。

然后我加载每一个帖子和它的关联用户的代码就变成了只有一行! 就是这一行：

```
@posts = @topic.posts.order(created_at: :asc).preload(:user)
```

比起只有一行更重要的是，它不是单独做一个查询来获取每个帖子的用户，而是在 1 个查询中获取所有用户。显然，在 Rails 中，有一堆[不同的方法][3]来做类似的事情（预加载、急切加载、联接和包含？），我还不知道这些都是什么，但也许我以后会知道的。

### 一个有趣的 Rails 功能：脚手架！

Rails 有一个叫 `rails` 的命令行工具，它可以生成很多代码。例如，我想添加一个 `Topic` 模型/控制器。我不用去想在哪里添加所有的代码，可以直接运行

```
rails generate scaffold Topic title:text
```

并生成了一堆代码，这样我已经有了基本的端点来创建/编辑/删除主题（`Topic`）。例如，这是我的[现在的主题控制器][4]，其中大部分我没有写（我只写了高亮的 3 行）。我可能会删除很多内容，但是有一个起点，让我可以扩展我想要的部分，删除我不想要的部分，感觉还不错。

### 数据库迁移！

`rails` 工具还可以生成数据库迁移! 例如，我决定要删除帖子中的 `title` 字段。

下面是我要做的：

```
rails generate migration RemoveTitleFromPosts title:string
rails db:migrate
```

就是这样 —— 只要运行几个命令行咒语就可以了! 我运行了几个这样的迁移，因为我改变了对我的数据库模式的设想。它是相当直接的，到目前为止 —— 感觉很神奇。

当我试图在一列中的某些字段为空的地方添加一个“不为空”（`not null`）约束时，情况就变得有点有趣了 —— 迁移失败。但我可以修复违例的记录，并轻松地重新运行迁移。

### 今天就到这里吧！

明天，如果我有更多的进展，也许我会把它放在互联网上。

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/11/10/day-2--rails-associations---dragging-divs-around/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://github.com/furf/jquery-ui-touch-punch
[2]: https://guides.rubyonrails.org/association_basics.html
[3]: https://blog.bigbinary.com/2013/07/01/preload-vs-eager-load-vs-joins-vs-includes.html
[4]: https://github.com/jvns/refrigerator-forum/blob/776b3227cfd7004cb1efb00ec7e3f82a511cbdc4/app/controllers/topics_controller.rb#L13-L15

[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12884-1.html)
[#]: subject: (Day 1: a confusing Rails error message)
[#]: via: (https://jvns.ca/blog/2020/11/09/day-1--a-little-rails-/)
[#]: author: (Julia Evans https://jvns.ca/)

Rails 之旅第 1 天：一个令人困惑的 Rails 错误信息
======

![](https://img.linux.net.cn/data/attachment/album/202012/04/080957f0p4piqz52bypqb5.jpg)

今天，我开始了一个 Recurse Center 的班次学习！我认识了一些人，并开始了一个小小的有趣的 Rails 项目。我想我今天不会谈太多关于这个项目的实际内容，但这里有一些关于 Rails 一天的快速笔记。

### 一些关于开始的笔记

在建立 Rails 项目的过程中，我学到的主要是：

  1. 它默认使用 sqlite，你必须告诉它使用 Postgres。
  2. Rails 默认包含了大量的东西，你可以禁用。

我安装并 `rm -rf` Rails 大概 7 次后才满意，最后用了这个咒语：

```
rails new . -d postgresql --skip-sprockets --skip-javascript
```

主要是因为我想用 Postgres 而不是 sqlite，而且跳过 sprockets 和 javascript 似乎能让安装 Rails 的速度更快，而且我想如果我决定要它们的话，我可以在以后再安装。

### 官方的 Rails 指南真的很不错

我在创建我的 Rails 入门应用时主要参考了 2 个资源：

  * DHH 在 2005 年的 Rails 原版演讲 <https://www.youtube.com/watch?v=Gzj723LkRJY>（这次我没有看，但上次我花了一天时间学习 Rails 时看了，我发现它很有启发和帮助）。
  * 官方的 Rails 入门指南，似乎非常简短明了 <https://guides.rubyonrails.org/v5.0/getting_started.html>。

### 一个神秘的错误信息：`undefined method 'user'`

我喜欢 bug，所以今天我遇到了一个奇怪的 Rails 错误! 我有一些看起来像这样的代码：

```
@user = User.new(user_params)
@user.save
```

很简单吧？但当这段代码运行时，我得到了这个令人费解的错误信息：

```
undefined method `user' for #<User:0x00007fb6f4012ab8> Did you mean? super
```

我对这里发生的事情感到**超级**困惑，因为我没有调用一个叫做 `user` 的方法。我调用的是 `.save`。什么嘛？！我对此感到困惑和沮丧，大概呆了 20 分钟，最后我看了看我的 `User` 模型，发现了这段代码：

```
class User < ApplicationRecord
  has_secure_password

  validates :user, presence: true, uniqueness: true
end
```

`validates :user...` *应该*是一些 Rails 魔法，验证每个 `User` 都有一个 `username`，而且用户名必须是唯一的。但我犯了一个错，我写的是 `user` 而不是 `username`。我把这个问题解决了，然后一切都正常了！万岁。

我仍然不明白我应该如何调试这个问题：堆栈跟踪告诉我问题出在 `@user.save` 行，根本没有提到 `validates :user` 的事情。我觉得一定有办法调试这个问题，但我不知道是什么办法。

我学 Rails 的目的就是想看看 Rails 的魔力在实践中是如何发挥的，所以这是个很有意思的 bug，早早的就掉坑里了。

### 一个简单的用户管理系统

我决定在我的玩具应用中加入用户。我在网上搜索了一下，发现有一个非常流行的叫做 [devise][1] 的工具可以处理用户。我发现它的 `README` 有点让人不知所措，而且我知道想要在我的玩具应用中建立一个非常简陋的用户管理系统，所以我遵循了这个名为《[Rails 5.2 中从零开始进行用户验证][2]》的指南，到目前为止，这个指南似乎还不错。Rails 似乎已经有了一大堆管理用户的内置东西，我真的很惊讶于这本指南的短小和我需要写的代码之少。

我在实现用户功能的时候了解到，Rails 有一个内置的神奇的会话管理系统（参见 [Rails 会话如何工作][3]。默认情况下，所有的会话数据似乎都存储在用户电脑上的 cookie 中，不过我想如果 cookie 太大了，你也可以把会话数据存储在数据库中。

已经有了会话管理系统，有了 cookie 和用户，却不太清楚到底发生了什么，这肯定是有点奇怪的，但也是挺好玩的！我们会看看情况如何。我们将拭目以待。

### 明天：更多的 Rails!

也许明天我可以在实现我的有趣的 rails 应用的想法上取得一些进展!

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/11/09/day-1--a-little-rails-/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://github.com/heartcombo/devise
[2]: https://medium.com/@wintermeyer/authentication-from-scratch-with-rails-5-2-92d8676f6836
[3]: https://www.justinweiss.com/articles/how-rails-sessions-work/

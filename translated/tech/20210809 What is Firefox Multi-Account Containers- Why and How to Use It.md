[#]: subject: "What is Firefox Multi-Account Containers? Why and How to Use It?"
[#]: via: "https://itsfoss.com/firefox-containers/"
[#]: author: "Hunter Wittenborn https://itsfoss.com/author/hunter/"
[#]: collector: "lujun9972"
[#]: translator: "hanszhao80"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

浅议 Firefox 多账户容器
======

随着在设备上使用各种程序的用户的需求变得越来越复杂，程序本身也需要跟上用户的现实需求和未来期望。

我发现我每天都需要的东西是用一个简便的方法在网页浏览器保持登录多个账号。我  _可以_ 根据需要对我的每个账号进行登录和注销操作，但在短时间内切换多个账号时，这变得非常乏味。 

最初，我使用谷歌浏览器，它拥有管理多个帐户的能力。这很有效，但管理起来略显繁琐，而且明明只需 _一个_ 账号就能搞定的事却要创建一个新的谷歌账号来完成，这显得有点儿笨拙。

这是我转而使用 Firefox <ruby>多账户容器<rt>Multi-Account Containers</rt></ruby> 功能的原因。它不仅比我在谷歌 Chrome 浏览器上的设置灵活得多，而且我还使用了由我的浏览器开发者自己创建的工具，从而在整体上获得了更流畅和更简单的体验。

![Firefox 中的容器图示][1]

### Firefox 中的多帐户容器是什么？

如果你想将数字生活的各个部分彼此分开，多账户容器也非常有效。当你使用容器时，你在一个容器中的浏览活动不会与其他容器共享。这种隔离意味着你可以在不同容器中登录同一网站上的两个不同帐户。你的登录会话、网站偏好和跟踪数据将被限制在你使用某个网站的容器中。

它还有什么其他优势？想象一下，你在亚马逊或其他电子商务网站上购物。你浏览了一些商品，但没有购买任何东西。现在，如果你浏览网络，你会看到与你浏览的产品相关的广告。尽管有广告拦截器，一些网站仍会显示广告。使用容器，你可以将你的购物网站与其他网站分开。

再给大家分享一个例子。Firefox 默认提供一个 Facebook 容器。默认情况下，此容器包括 Facebook、Messenger 和 Instagram 网站。这意味着当你打开这三个网站中的任何一个时，它们都只会在“Facebook 容器”中打开。因此，Facebook 将无法跟踪你在其他网站上的活动。

这是 [很少有人知道或使用的 Firefox 功能][2] 之一。

### 使用多账户容器

安装 Firefox 多账户容器是一个非常简单的过程，只需点击几下。

首先，前往 Firefox 附加组件网站上的 [扩展程序页面][3]。之后你唯一需要做的就是单击 `添加到 Firefox` 按钮。

![][4]

安装完成！现在我们可以实际使用一下这个新的扩展。

可能你还没有注意到，你的搜索栏右侧应该会出现一个新图标：

![][5]

这是你将用于与 Firefox 多帐户容器交互的图标。如果你单击该图标，你将看到一个小菜单：

![][6]

让我们使用这个扩展尝试一些例子，看看多账户容器是如何工作的。

#### 设置容器

首先，我们需要生成一个容器。点击多账户容器菜单中的 `<ruby>管理容器<rt>Manage Containers</rt></ruby>，然后点击 <ruby>新建容器<rt>New Container</rt></ruby>。

![][7]

![][8]

接着输入新容器的名称，选择颜色和图标。然后，点击 `OK` 保存新容器。

![][9]

大功告成！我们现在可以返回主菜单在新容器中打开一个新选项卡：

![][10]

你还会注意到新选项卡有一些样式，表示它正在容器内运行：

![][11]

#### 观察容器工作

现在让我们看看容器在使用时实际做了什么。

我们将在一个普通的浏览器选项卡中访问 Linode 管理网站，我已经在其中登录：

![][12]

现在让我们尝试在 Firefox 容器中打开相同的页面，此时我被重定向到 Linode 登录页面：

![][13]

为什么我被重定向了？因为现在我没有登录。这就是 Firefox 容器的乐趣之一：在一个浏览器会话中登录后，再进入一个容器，就好像你以前从未访问过该站点一样。

如果你在容器内完成对某个网站的登录，你从容器中访问该网站时将会保持登录状态。你还可以使用此功能从容器内登录网站，从而使该网站的所有数据远离你的正常浏览器数据。

注意：你的浏览器历史记录本身之类的内容仍会暴露给你的正常浏览器会话。容器功能只是提供了一种方法来分离本文中提到的登录帐户等内容。

### 总结

对于那些在乎自己的隐私，或者只是想真正尝试对其系统的安全性进行严格控制的人来说，多账户容器被证明是一个很棒的功能。

例如，你可以在容器内登录你的 Google 帐户，Google 永远不会知悉你在容器外的信息。
个帐户的人来说，此扩展程序是一个不错的选择。有了它无需为你要使用的每样东西创建单独的浏览器帐户。

好了，这就是 Firefox 的多帐户容器的基本知识。

需要任何帮助，或者只是有一个一般的问题？请随时在评论区指出。

--------------------------------------------------------------------------------

via: https://itsfoss.com/firefox-containers/

作者：[Hunter Wittenborn][a]
选题：[lujun9972][b]
译者：[hanszhao80](https://github.com/hanszhao80)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/hunter/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/Firefox-container.png?resize=800%2C450&ssl=1
[2]: https://itsfoss.com/firefox-useful-features/
[3]: https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/firefox-containers-install-page.png?resize=800%2C366&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/firefox-containers-searchbar-icon-1.png?resize=800%2C48&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/firefox-containers-main-menu.png?resize=302%2C474&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/firefox-containers-manage-containers-1.png?resize=291%2C402&ssl=1
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/firefox-containers-new-container.png?resize=290%2C399&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/firefox-containers-new-container-itsfoss.png?resize=292%2C401&ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/firefox-containers-opening-new-container.png?resize=290%2C398&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/firefox-containers-new-container-styling.png?resize=800%2C370&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/firefox-containers-linode.png?resize=800%2C114&ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/firefox-containers-linode-login.png?resize=800%2C405&ssl=1

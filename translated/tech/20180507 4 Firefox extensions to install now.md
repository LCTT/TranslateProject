4 个 Firefox 扩展
=====

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/redpanda_firefox_pet_animal.jpg?itok=aSpKsyna)
正如我在关于 Firefox 扩展的[原创文章][1]中提到的，web 浏览器已成为许多用户计算（机）验的关键组件。现代浏览器已经发展成为功能强大且可扩展的平台，扩展可以添加或修改其功能。Firefox 的扩展是使用 WebExtensions API（一种跨浏览器开发系统）构建的。

在第一篇文章中，我问读者：“你应该安装哪些扩展？” 重申一下，这一决定主要取决于你如何使用浏览器，你对隐私的看法，你对扩展程序开发人员的信任程度以及其他个人偏好。自文章发表以来，我推荐的一个扩展（Xmarks）已经停止。另外，该文章收到了大量的反馈，在这篇更新中，这些反馈已经被考虑到。

我想再次指出，浏览器扩展通常需要能够阅读和（或）更改你访问的网页上的所有内容。你应该仔细考虑这一点。如果扩展程序修改了你访问的所有网页的访问权限，那么它可能充当键盘记录程序，拦截信用卡信息，在线跟踪，插入广告以及执行各种其他恶意活动。这并不意味着每个扩展程序都会暗中执行这些操作，但在安装任何扩展程序之前，你应该仔细考虑安装源，涉及的权限，风险配置文件以及其他因素。请记住，你可以使用配置文件来管理扩展如何影响你的攻击面 - 例如，使用没有扩展的专用配置文件来 执行网上银行等任务。

考虑到这一点，这里有你可能想要考虑的四个开源 Firefox 扩展。

### uBlock Origin

![ublock origin ad blocker screenshot][2]

我的第一个建议保持不变。[uBlock Origin][3] 是一款快速，低内存，广泛的拦截器，它不仅可以拦截广告，而且还可以执行你自己的内容过滤。 uBlock Origin 的默认行为是使用多个预定义的过滤器列表来拦截广告，跟踪器和恶意软件站点。它允许你任意添加列表和规则，甚至可以锁定到默认拒绝模式。尽管它很强大，但它已被证明是高效和高性能的。它将继续定期更新，并且是该功能的最佳选择之一。

### Privacy Badger

![privacy badger ad blocker][4]

我的第二个建议也保持不变。如果说有什么区别的话，那就是自从我上一篇文章发表以来，隐私问题就一直被带到最前沿，这使得这个扩展成为一个简单的建议。顾名思义，[Privacy Badger][5] 是一个专注于隐私的扩展，可以拦截广告和其他第三方跟踪器。这是 Electronic Freedom （to 校正者：这里 Firefox 添加此扩展后，弹出页面译为电子前哨基金会）基金会的一个项目，他们说：

> Privacy Badger 诞生于我们希望能够推荐一个单独的扩展，它可以自动分析和拦截任何违反用户同意原则的追踪器或广告；在用户没有任何设置、有关知识或配置的情况下，它可以很好地运行；它是由一个明确为其用户而不是为广告商工作的组织所产生的；它使用了算法的方法来决定什么是什么，什么是不跟踪的。”

为什么 Privacy Badger 会出现在这个列表上，它的功能与上一个扩展看起来很类似？因为一些原因。首先，它从根本上工作原理与 uBlock Origin 不同。其次，深度防御的实践是一项合理的策略。说到深度防御，EFF 还维护着 [HTTPS Everywhere][6] 扩展，它自动确保 https 用于许多主流网站。当你安装 Privacy Badger 时，你也可以考虑使用 HTTPS Everywhere。

如果你开始认为这篇文章只是对上一篇文章的重新讨论，那么以下是我的建议分歧。

### Bitwarden

![Bitwarden][7]

在上一篇文章中推荐 LastPass 时，我提到这可能是一个有争议的选择。这无疑属实。无论你是否应该使用密码管理器 - 如果你使用，那么是否应该选择带有浏览器插件的密码管理器 - 这是一个备受争议的话题，答案很大程度上取决于你的个人风险状况。我认为大多数普通的计算机用户应该使用一个，因为它比最常见的选择要好得多：在任何地方都使用相同的弱密码。我仍然相信这一点。

[Bitwarden][8] 自从我上次审视以后确实成熟了。像 LastPass 一样，它对用户友好，支持双因素身份验证，并且相当安全。与 LastPass 不同的是，它是[开源的][9]。它可以使用或不使用浏览器插件，并支持从其他解决方案（包括 LastPass）导入。它的核心功能完全免费，它还有一个 10 美元/年的高级版本。

### Vimium-FF

![Vimium][10]

[Vimium][11] 是另一个开源的扩展，它为 Firefox 键盘快捷键提供了类似 Vim 一样的导航和控制，其称之为“黑客的浏览器”。对于 Ctrl+x, Meta+x 和 Alt+x，分别对应 **< c-x>**, **< m-x>** 和 **< a-x>**，默认值可以轻松定制。一旦你安装了 Vimium，你可以随时键入 **？** 来查看键盘绑定列表。请注意，如果你更喜欢 Emacs，那么也有一些针对这些键绑定的扩展。无论哪种方式，我认为键盘快捷键是未充分利用的生产力推动力。

### 额外福利: Grammarly

不是每个人都有幸在 Opensource.com 上撰写专栏 - 尽管你应该认真考虑为网站撰写文章；如果你有问题，有兴趣，或者想要一个导师，伸出手，让我们聊天吧。但是，即使没有专栏撰写，正确的语法在各种各样的情况下都是有益的。试一下 [Grammarly][12]。不幸的是，这个扩展不是开源的，但它确实可以确保你输入的所有东西都是清晰的，有效的并且没有错误。它通过扫描你文本中的常见的和复杂的语法错误来实现这一点，涵盖了从主谓一致到文章使用到修饰词的放置这些所有内容。它的基本功能是免费的，它有一个高级版本，每月收取额外的费用。我在这篇文章中使用了它，它发现了许多我的校对没有发现的错误。

再次说明，Grammarly 是这个列表中包含的唯一不是开源的扩展，因此如果你知道类似的高质量开源替代品，请在评论中告诉我们。

这些扩展是我发现有用并推荐给其他人的扩展。请在评论中告诉我你对更新建议的看法。


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/firefox-extensions

作者：[Jeremy Garcia][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MjSeven](https://github.com/MjSeven)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jeremy-garcia
[1]:https://opensource.com/article/18/1/top-5-firefox-extensions
[2]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/ublock.png?itok=_QFEbDmq (ublock origin ad blocker screenshot)
[3]:https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/
[4]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/privacy_badger_1.0.1.png?itok=qZXQeKtc (privacy badger ad blocker screenshot)
[5]:https://www.eff.org/privacybadger
[6]:https://www.eff.org/https-everywhere
[7]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/bitwarden.png?itok=gZPrCYoi (Bitwarden)
[8]:https://bitwarden.com/
[9]:https://github.com/bitwarden
[10]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/vimium.png?itok=QRESXjWG (Vimium)
[11]:https://addons.mozilla.org/en-US/firefox/addon/vimium-ff/
[12]:https://www.grammarly.com/

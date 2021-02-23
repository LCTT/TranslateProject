[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10957-1.html)
[#]: subject: (How we built a Linux desktop app with Electron)
[#]: via: (https://opensource.com/article/19/4/linux-desktop-electron)
[#]: author: (Nils Ganther https://opensource.com/users/nils-ganther)

我们是如何使用 Electron 构建 Linux 桌面应用程序的
======

> 这是借助 Electron 框架，构建一个在 Linux 桌面上原生运行的开源电子邮件服务的故事。

![document sending](https://img.linux.net.cn/data/attachment/album/201906/10/123114abz0lvbllktkulx7.jpg)

[Tutanota][2] 是一种安全的开源电子邮件服务，它可通过浏览器使用，也有 iOS 和 Android 应用。其客户端代码在 GPLv3 下发布，Android 应用程序可在 [F-Droid][3] 上找到，以便每个人都可以使用完全与 Google 无关的版本。

由于 Tutanota 关注开源和 Linux 客户端开发，因此我们希望为 Linux 和其他平台发布一个桌面应用程序。作为一个小团队，我们很快就排除了为 Linux、Windows 和 MacOS 构建原生应用程序的可能性，并决定使用 [Electron][4] 来构建我们的应用程序。

对于任何想要快速交付视觉一致的跨平台应用程序的人来说，Electron 是最适合的选择，尤其是如果你已经有一个 Web 应用程序，想要从浏览器 API 的束缚中摆脱出来时。Tutanota 就是这样一个案例。

Tutanota 基于 [SystemJS][5] 和 [Mithril][6]，旨在为每个人提供简单、安全的电子邮件通信。 因此，它必须提供很多用户期望从电子邮件客户端获得的标准功能。

由于采用了现代 API 和标准，其中一些功能（如基本的推送通知、搜索文本和联系人以及支持双因素身份验证）很容易在浏览器中提供。其它功能（例如自动备份或无需我们的服务器中转的 IMAP 支持）需要对系统资源的限制性访问，而这正是 Electron 框架提供的功能。

虽然有人批评 Electron “只是一个基本的包装”，但它有明显的好处：

* Electron 可以使你能够快速地为 Linux、Windows 和 MacOS 桌面构造 Web 应用。事实上，大多数 Linux 桌面应用都是使用 Electron 构建的。
* Electron 可以轻松地将桌面客户端与 Web 应用程序达到同样的功能水准。
* 发布桌面应用程序后，你可以自由使用开发功能添加桌面端特定的功能，从而增强可用性和安全性。
* 最后但同样重要的是，这是让应用程序具备原生的感觉、融入用户系统，而同时保持其识别度的好方法。
   
### 满足用户的需求

Tutanota 不依靠于大笔的投资资金，而是依靠社区驱动的项目。基于越来越多的用户升级到我们的免费服务的付费计划，我们有机地发展我们的团队。倾听用户的需求不仅对我们很重要，而且对我们的成功至关重要。

提供桌面客户端是 Tutanota 用户[最想要的功能][7]，我们感到自豪的是，我们现在可以为所有用户提供免费的桌面客户端测试版。（我们还实现了另一个高度要求的功能 —— [搜索加密数据][8] —— 但这是另一个主题了。）

我们喜欢为用户提供签名版本的 Tutanota 并支持浏览器中无法实现的功能，例如通过后台进程推送通知。 现在，我们计划添加更多特定于桌面的功能，例如 IMAP 支持（而不依赖于我们的服务器充当代理），自动备份和离线可用性。

我们选择 Electron 是因为它的 Chromium 和 Node.js 的组合最适合我们的小型开发团队，因为它只需要对我们的 Web 应用程序进行最小的更改。在我们开始使用时，可以将浏览器 API 用于所有功能特别有用，随着我们的进展，慢慢地用更多原生版本替换这些组件。这种方法对附件下载和通知特别方便。

### 调整安全性

我们知道有些人关注 Electron 的安全问题，但我们发现 Electron 在 Web 应用程序中微调访问的选项非常令人满意。你可以使用 Electron 的[安全文档][9]和 Luca Carettoni 的[Electron 安全清单][10]等资源，来帮助防止 Web 应用程序中不受信任的内容发生灾难性事故。

### 实现特定功能

Tutanota Web 客户端从一开始就构建了一个用于进程间通信的可靠协议。我们利用 Web 线程在加密和请求数据时保持用户界面（UI）响应性。当我们开始实现我们的移动应用时，这就派上用场，这些应用程序使用相同的协议在原生部分和 Web 视图之间进行通信。

这就是为什么当我们开始构建桌面客户端时，很多用于本机推送通知、打开邮箱和使用文件系统的部分等已经存在，因此只需要实现原生端（Node.js）。

另一个便利是我们的构建过程使用 [Babel 转译器][11]，它允许我们以现代 ES6 JavaScript 编写整个代码库，并在不同环境之间混合和匹配功能模块。这使我们能够快速调整基于 Electron 的桌面应用程序的代码。但是，我们也遇到了一些挑战。

### 克服挑战

虽然 Electron 允许我们很容易地与不同平台的桌面环境集成，但你不能低估投入的时间！最后，正是这些小事情占用了比我们预期更多的时间，但对完成桌面客户端项目也至关重要。

特定于平台的代码导致了大部分阻碍：

* 例如，窗口管理和托盘仍然在三个平台上以略有不同的方式处理。
* 注册 Tutanota 作为默认邮件程序并设置自动启动需要深入 Windows 注册表，同时确保以 [UAC] [12] 兼容的方式提示用户进行管理员访问。
* 我们需要使用 Electron 的 API 作为快捷方式和菜单，以提供复制、粘贴、撤消和重做等标准功能。

由于用户对不同平台上的应用程序的某些（有时不直接兼容）行为的期望，此过程有点复杂。使三个版本感觉像原生的需要一些迭代，甚至需要对 Web 应用程序进行一些适度的补充，以提供类似于浏览器中的文本搜索的功能。

### 总结

我们在 Electron 方面的经验基本上是积极的，我们在不到四个月的时间内完成了该项目。尽管有一些相当耗时的功能，但我们感到惊讶的是，我们可以轻松地为 Linux 提供一个测试版的 [Tutanota 桌面客户端][13]。如果你有兴趣，可以深入了解 [GitHub][14] 上的源代码。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/linux-desktop-electron

作者：[Nils Ganther][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/nils-ganther
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_paper_envelope_document.png?itok=uPj_kouJ (document sending)
[2]: https://tutanota.com/
[3]: https://f-droid.org/en/packages/de.tutao.tutanota/
[4]: https://electronjs.org/
[5]: https://github.com/systemjs/systemjs
[6]: https://mithril.js.org/
[7]: https://tutanota.uservoice.com/forums/237921-general/filters/top?status_id=1177482
[8]: https://tutanota.com/blog/posts/first-search-encrypted-data/
[9]: https://electronjs.org/docs/tutorial/security
[10]: https://www.blackhat.com/docs/us-17/thursday/us-17-Carettoni-Electronegativity-A-Study-Of-Electron-Security-wp.pdf
[11]: https://babeljs.io/
[12]: https://en.wikipedia.org/wiki/User_Account_Control
[13]: https://tutanota.com/blog/posts/desktop-clients/
[14]: https://www.github.com/tutao/tutanota

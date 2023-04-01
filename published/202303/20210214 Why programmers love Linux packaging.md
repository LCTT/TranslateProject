[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-15674-1.html)
[#]: subject: (Why programmers love Linux packaging)
[#]: via: (https://opensource.com/article/21/2/linux-packaging)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

为什么程序员喜欢为 Linux 打包
======

> 程序员可以通过 Flatpak 轻松、稳定地发布他们的软件，让他们专注于他们的激情工作：编程。

![][0]

如今，人们比以往任何时候都喜爱 Linux。在这个系列中，我将分享使用 Linux 的 21 个不同理由。今天，我将谈一谈是什么让 Linux 的打包成为程序员的理想选择。

程序员喜欢编程。这可能看起来是一个显而易见的说法，但重要的是要明白，开发软件所涉及的不仅仅是编写代码。它包括编译、文档、源代码管理、安装脚本、配置默认值、支持文件、交付格式等等。从一个空白的屏幕到一个可交付的软件安装程序，需要的不仅仅是编程，但大多数程序员宁愿编程也不愿打包。

### 什么是打包？

当食物被送到商店购买时，它是被包装好的。当直接从农民或从环保的散装或桶装商店购买时，包装是你所带的任何容器。当从杂货店购买时，包装可能是一个纸板箱、塑料袋、一个铁罐等等。

当软件被提供给广大计算机用户时，它也必须被打包起来。像食品一样，软件也有几种打包方式。开源软件可以不进行打包，因为用户在获得原始代码后，可以自己编译和打包它。然而，打包也有好处，所以应用程序通常以某种特定于用户平台的格式交付。而这正是问题的开始，因为软件包的格式并不只有一种。

对于用户来说，软件包使安装软件变得容易，因为所有的工作都由系统的安装程序完成。软件被从软件包中提取出来，并分发到操作系统中的适当位置。几乎没有任何出错的机会。

然而，对于软件开发者来说，打包意味着你必须学会如何创建一个包 —— 而且不仅仅是一个包，而是为你希望你的软件可以安装到的每一个操作系统创建一个独特的包。更加复杂的是，每个操作系统都有多种打包格式和选项，有时甚至是不同的编程语言。

### 为 Linux 打包

传统上，Linux 的打包方式似乎是非常多的。从 Fedora 衍生出来的 Linux 发行版，如 Red Hat 和 CentOS，默认使用 .rpm 包。Debian 和 Ubuntu（以及类似的）默认使用 .deb 包。其他发行版可能使用其中之一，或者两者都不使用，选择自定义的格式。当被问及时，许多 Linux 用户说，理想情况下，程序员根本不会为 Linux 打包他们的软件，而是依靠每个发行版的软件包维护者来创建软件包。所有安装在 Linux 系统上的软件都应该来自该发行版的官方软件库。然而，目前还不清楚如何让你的软件可靠地被一个发行版打包和包含，更不用说所有的发行版了。

### Linux 的 Flatpak

Flatpak 打包系统是为了统一和去中心化 Linux 作为开发者的交付目标而推出的。通过 Flatpak，无论是开发者还是其他人（Linux 社区的成员、不同的开发者、Flatpak 团队成员或其他任何人）都可以自由地打包软件。然后他们可以将软件包提交给 Flathub，或者选择自我托管软件包，并将其提供给几乎任何 Linux 发行版。Flatpak 系统适用于所有 Linux 发行版，所以针对一个发行版就等于针对所有发行版。

### Flatpak 技术如何工作

Flatpak 具有普遍吸引力的秘密是一个标准基础。Flatpak 系统允许开发者引用一套通用的软件开发者工具包（SDK）模块。这些模块由 Flatpak 系统的维护者进行打包和管理。当你安装 Flatpak 时，SDK 会根据需要被拉入，以确保与你的系统兼容。任何特定的 SDK 只需要一次，因为它所包含的库可以在任何 Flatpak 中共享。

如果开发者需要一个尚未包含在现有 SDK 中的库，开发者可以在 Flatpak 中添加该库。

结果不言自明。用户可以从一个叫做 [Flathub][2] 的中央仓库在任何 Linux 发行版上安装数百个软件包。

### 开发者如何使用 Flatpak

Flatpak 被设计成可重复的，所以构建过程很容易被集成到 CI/CD 工作流程中。Flatpak 是在一个 [YAML][3] 或 JSON 清单文件中定义的。你可以按照我的 [介绍性文章][4] 创建你的第一个 Flatpak，你也可以在 [docs.flatpak.org][5] 阅读完整的文档。

### Linux 让它变得简单

在 Linux 上创建软件很容易，为 Linux 打包也很简单，而且可以自动化。如果你是一个程序员，Linux 使你很容易忘记打包这件事，因为它只需要针对一个系统，并可以整合到你的构建过程中。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/linux-packaging

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/brown-package-red-bow.jpg?itok=oxZYQzH- (Package wrapped with brown paper and red bow)
[2]: https://flatpak.org/setup/
[3]: https://www.redhat.com/sysadmin/yaml-beginners
[4]: https://opensource.com/article/19/10/how-build-flatpak-packaging
[5]: https://docs.flatpak.org/en/latest/index.html
[0]: https://img.linux.net.cn/data/attachment/album/202303/29/231331qb9ye8gggeekvce1.jpg
[#]: subject: "Manage CentOS Stream with Foreman"
[#]: via: "https://opensource.com/article/21/9/centos-stream-foreman"
[#]: author: "Melanie Corr https://opensource.com/users/melanie-corr"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13837-1.html"

用 Foreman 管理 CentOS Stream
======

> 这个例子让我们看到了在 Foreman 中管理和配置 CentOS Stream 内容的许多选项。

![](https://img.linux.net.cn/data/attachment/album/202109/30/133541s3e3s31yzmnugl1s.jpg)

2021 年 12 月，CentOS 8 将达到生命终点，被 CentOS Stream 取代。CentOS Stream 和 CentOS 之前的迭代之间的主要变化之一是没有小版本。Centos Stream 采用了一个连续的发布周期。从今年年初开始，Foreman 社区的开发者开始看到 CentOS Stream 由于持续发布而提供的更早的错误检测和补丁的好处。我们不再需要等待下一个版本来利用最新的变化和错误修复。[一位资深的 Linux 社区爱好者][2] 指出，此举也使 RHEL 开发者比以往更接近 FOSS 社区。

然而，如果你是一个拥有数百或数千台服务器的管理员，你可能想控制新的软件包何时被添加到特定的服务器。如果你正在寻找一个免费的开源工具，帮助你确保生产服务器的稳定性，同时允许你安全地从 Centos Stream 中拉入最新的变化用于开发和测试，这就是 Foreman 可以帮助你的地方。有了 Foreman，你可以在生命周期环境的各个阶段管理你的 Centos Stream 内容。

### Foreman 介绍

Foreman 是一个完整的物理和虚拟服务器的生命周期管理工具。有了 Foreman，系统管理员有能力轻松实现重复性任务的自动化，快速部署应用程序，并主动管理内部或云中的服务器。Foreman 为<ruby>配备<rt>provisioning</rt></ruby>管理、配置管理和监控提供了企业级解决方案。由于其插件架构，Foreman 可以以无数种方式进行扩展。使用 Katello 插件，你可以把 Foreman 作为一个完整的<ruby>内容管理<rt>content management</rt></ruby>工具来管理 CentOS Stream，以及其他许多内容类型。

通过 Foreman 和 Katello，你可以准确地定义你希望每个环境包含哪些软件包。例如，生产环境可能使用已被验证为稳定的软件包，而开发环境可能需要最新、最先进的软件包版本。你还可以跨生命周期环境推广<ruby>内容视图<rt>content view</rt></ruby>。让我们来看看 Foreman 是如何完成这个任务的。

我们在这篇文章中使用了网页用户界面，但 Foreman 也有一个强大的 CLI 和 API。Katello 插件为 Pulp 项目提供了一个工作流和网页用户界面，你可以在 [这篇文章][3] 中了解更多。我们在这里也提供了一个简单的工作流程，但是 Foreman 和 Katello 项目提供了许多不同的配置选项来满足你的具体需求。

本文假设 Foreman 和 Katello 已经安装完毕。关于如何安装的更多信息，请参阅 [Katello 安装手册][4]。

### 创建一个产品

第一步是在 Foreman 中创建一个<ruby>产品<rt>product</rt></ruby>。该产品的功能是作为一个内部标签来存储 CentOS Stream 存储库。

  1. 在 Foreman 网页用户界面，导航到“<ruby>内容<rt>Content</rt></ruby> > <ruby>产品<rt>Products</rt></ruby>”，并点击“<ruby>创建产品<rt>Create Product</rt></ruby>”。
  2. 在“<ruby>名称<rt>Name</rt></ruby>”字段中，为产品输入一个名称。Foreman会根据你输入的“<ruby>名称<rt>Name</rt></ruby>”自动完成“<ruby>标签<rt>Label</rt></ruby>”字段，以后不能再更改。

### 将 CentOS Stream 存储库添加到产品中

现在你有了一个产品，你可以使用 AppStream 和 BaseOS 存储库的 URL，并将它们添加到你的新产品中。

  1. 在 Foreman 网页用户界面中，导航到 “<ruby>内容<rt>Content</rt></ruby> > <ruby>产品<rt>Products</rt></ruby>”，选择你要使用的产品，然后点击 “<ruby>新存储库<rt>New Repository</rt></ruby>”。
  2. 在“<ruby>名称<rt>Name</rt></ruby>”字段中，为存储库输入一个名称；例如，“Centos8StreamBaseOS”。Foreman 会根据你输入的“<ruby>名称<rt>Name</rt></ruby>”，自动完成“<ruby>标签<rt>Label</rt></ruby>”字段。
  3. 从“<ruby>类型<rt>Type</rt></ruby>”列表中，选择存储库的类型，然后选择“Yum”。
  4. 在 “URL” 字段中，输入 CentOS Stream Baseos 存储库的 URL，作为源： `http://mirror.centos.org/centos/8-stream/BaseOS/x86_64/os/`。
  5. 选择“<ruby>下载规则<rt>Download Policy</rt></ruby>”列表。默认的是“<ruby>按需<rt>On Demand</rt></ruby>”，这意味着 Katello 将只下载元数据。如果你想下载所有的软件包，请改成“<ruby>即时<rt>Immediate</rt></ruby>”，它可以下载所有的软件包，可能会达到 20-30GB。
  6. 确保“<ruby>与镜像同步<rt>Mirror on Sync</rt></ruby>”复选框被选中。这个选项确保在同步过程中，不再是上游存储库的一部分的内容被删除。
  7. 点击“<ruby>保存<rt>Save</rt></ruby>”。



重复这些步骤，添加 AppStream 存储库及其 URL，例如，`http://mirror.centos.org/centos/8-stream/AppStream/x86_64/os/`。确保你使用最近的官方 CentOS 镜像来代替它。

要执行立即同步，在你的产品窗口，点击“<ruby>立即同步<rt>Sync Now</rt></ruby>”。最初的同步可能需要一些时间。你可以从“<ruby>内容<rt>Content</rt></ruby> > <ruby>同步状态<rt>Sync Status</rt></ruby>”查看同步状态。

同步完成后，你可以在“<ruby>主机<rt> Hosts</rt></ruby> > <ruby>操作系统<rt>Operating System</rt></ruby>”中查看新的 CentOS Stream 操作系统。请随意编辑名称和描述以满足你的要求。

如果你打算使用 Ansible 或 Puppet 等配置管理软件，Foreman 会自动创建一个操作系统报告。你可以在“<ruby>管理<rt>Administe</rt></ruby> > <ruby>设置<rt>Settings</rt></ruby> > <ruby>忽略操作系统状况<rt>Ignore facts for operating system</rt></ruby>”中关闭这个选项。重命名操作系统以匹配配置管理软件中的名称是一个好主意。例如，对于 Puppet，这将是“CentOS 8”。

### 定义你的基础设施的生命周期环境

应用程序生命周期是 Foreman 的内容管理功能的一个核心概念。应用程序的生命周期定义了一个特定的系统和它的软件在特定阶段的状况。例如，一个应用程序的生命周期可能很简单，你可能只有一个“开发”阶段和“生产”阶段。Foreman 提供了一些方法来以可控的方式定制每个应用生命周期阶段，以适应你的规范。

在这一点上，你必须创建你的生命周期环境路径。

  1. 在 Foreman 网页用户界面中，导航到“<ruby>内容<rt>Content</rt></ruby> > <ruby>生命周期环境<rt>Lifecycle Environments</rt></ruby>”。
  2. 点击“<ruby>新环境路径<rt>New Environment Path</rt></ruby>”，开始一个新的应用生命周期。
  3. 在“<ruby>名称<rt>Name</rt></ruby>”字段中，为你的环境输入一个名称。
  4. 在“<ruby>描述<rt>Description</rt></ruby>”字段中，为你的环境输入一个描述。
  5. 点击“<ruby>保存<rt>Save</rt></ruby>”。
  6. 根据你的需要添加尽可能多的环境路径。例如，你可以创建“dev”、“test”、“stage” 和 “production” 环境。要添加这些环境，点击“添加新环境”，完成“<ruby>名称<rt>Name</rt></ruby>”和“<ruby>描述<rt>Description</rt></ruby>”字段，并从“<ruby>优先环境<rt>Prior Environment*</rt></ruby>”列表中选择先前的环境，这样你就可以按照你预期使用的顺序将它们串联起来。



### 创建和发布一个内容视图

在 Foreman 中，“<ruby>内容视图<rt>Content View</rt></ruby>”是你的存储库在某个特定时间点的快照。内容视图提供了隔离软件包版本到你想保留的状态的机制。内容视图有很多可配置的功能，你可以用它来进一步细化。为了本教程的目的，让我们保持简单。

  1. 在 Foreman 网页用户界面中，导航到“<ruby>内容<rt>Content</rt></ruby> > <ruby>内容视图<rt>Content View</rt></ruby>”，并点击“<ruby>创建新视图<rt>Create New View</rt></ruby>”。
  2. 在“<ruby>名称<rt>Name</rt></ruby>”字段中，为视图输入一个名称。Foreman 会根据你输入的名称自动完成“<ruby>标签<rt>Label</rt></ruby>”字段。
  3. 在“<ruby>描述<rt>Description</rt></ruby>”字段中，输入视图的描述。
  4. 单击“<ruby>保存<rt>Save</rt></ruby>”以创建内容视图。
  5. 在新的内容视图中，点击“<ruby>Yum 内容<rt>Yum Contents</rt></ruby> > <ruby>添加存储库<rt>Add Repositories</rt></ruby>”，在“<ruby>存储库选择<rt>Repository Selection</rt></ruby>”区域，点击“<ruby>添加<rt>Add</rt></ruby>”。对于 BaseOS 和 Appstream 存储库，选择你想包括的软件包，然后点击“<ruby>添加存储库<rt>Add Repositories</rt></ruby>”。
  6. 点击“<ruby>发布新版本<rt>Publish New Version</rt></ruby>”，在“<ruby>描述<rt>Description</rt></ruby>”区域，输入关于版本的信息以记录变化。
  7. 单击“<ruby>保存<rt>Save</rt></ruby>”。

当你点击“<ruby>发布新版本<rt>Publish New Version</rt></ruby>”时，你创建了一个你已同步的所有内容的快照。这意味着你订阅此内容视图的每台服务器将只能访问与此生命周期环境相关的内容视图中的软件包版本。

每一个新的内容视图和后续版本都会首先发布到库环境，然后你可以在那里推广到其他环境。

### 跨生命周期环境推广内容

如果你已经测试了新的软件包，并且确信一切都很稳定，你可以把你的内容视图推广到另一个生命周期环境中。

  1. 导航到“<ruby>内容<rt>Content</rt></ruby> > <ruby>内容视图<rt>Content Views</rt></ruby>”，选择你想推广的内容视图。
  2. 点击内容视图的“<ruby>版本<rt>Versions</rt></ruby>”标签。
  3. 选择你想推广的版本，并在“<ruby>操作<rt>Action</rt></ruby>”栏中，点击“<ruby>推广<rt>Promote</rt></ruby>”。
  4. 选择你要推广内容视图的环境，并点击“<ruby>推广版本<rt>Promote Version</rt></ruby>”。
  5. 再次点击“<ruby>推广<rt>Promote</rt></ruby>”按钮。这次选择生命周期环境，例如，“Test”，然后单击“<ruby>推广版本<rt>Promote Version</rt></ruby>”。
  6. 最后，再次点击“<ruby>推广<rt>Promote</rt></ruby>”按钮。例如，选择“Production”环境并点击“<ruby>推广版本<rt>Promote Version</rt></ruby>”。

被分配到该特定环境的服务器现在可以从一套更新的软件包中提取。

### 创建一个激活密钥

为了将 CentOS Stream 服务器注册到你在特定生命周期中定义的内容，你必须创建一个激活密钥。激活密钥是一种与服务器共享凭证的安全方法。这使用了一个叫做“<ruby>订阅管理器<rt>subscription-manager</rt></ruby>的工具来订阅 CentOS Stream 服务器的内容。

当你创建了激活密钥后，将 CentOS Stream 订阅添加到激活密钥中。

  1. 在 Foreman 网页用户界面中，导航到“<ruby>内容<rt>Content</rt></ruby> > <ruby>激活密钥<rt>Activation keys</rt></ruby>”，并点击“<ruby>创建激活密钥<rt>Create Activation Key</rt></ruby>”。
  2. 在“<ruby>名称<rt>Name</rt></ruby>”栏中，输入激活密钥的名称。
  3. 在“<ruby>描述<rt>Description</rt></ruby>”栏中，输入激活密钥的描述。
  4. 从“<ruby>环境<rt>Environment</rt></ruby>”列表中，选择要使用的环境。
  5. 从“<ruby>内容视图<rt>Content View</rt></ruby>”列表中，选择你刚才创建的内容视图。
  6. 点击“<ruby>保存<rt>Save</rt></ruby>”。

###从 Foreman 管理的内容中创建一个 CentOS Stream 主机

现在一切都准备好了。随着你创建的内容包含在内容视图中，并在整个生命周期中推广，你现在可以准确地用你想使用的内容来配置主机，并订阅你想让它们接收的更新。

要在 Foreman 中创建一个主机，请导航到“主机 > 创建主机”。

  1. 在“<ruby>名称<rt>Name</rt></ruby>”字段中，为主机输入一个名称。
  2. 单击“<ruby>组织<rt>Organization</rt></ruby>”和“<ruby>位置<rt>Location</rt></ruby>”选项卡，以确保配置环境自动设置为当前环境。
  3. 从“<ruby>部署在<rt>Deploy On</rt></ruby>”列表中，选择“<ruby>裸金属<rt>Bare Metal</rt></ruby>”。
  4. 单击“<ruby>操作系统<rt>Operating System</rt></ruby>”选项卡。
  5. 从“<ruby>架构<rt>Architectures</rt></ruby>”列表中，选择“x86_64”。
  6. 从“<ruby>操作系统<rt>Operating System</rt></ruby>”列表中，选择“CentOS_Stream 8”。
  7. 勾选“<ruby>构建模式<rt>Build Mode</rt></ruby>”框。
  8. 对于“<ruby>媒体选择<rt>Media Selection</rt></ruby>”，选择“<ruby>同步的内容<rt>Synced Content</rt></ruby>”来使用你之前同步的 CentOS Stream 内容。
  9. 从“<ruby>同步的内容<rt>Synced Content</rt></ruby>”列表中，确保选择 “CentOS Stream”。
  10. 从“<ruby>分区表<rt>Partition Table</rt></ruby>”列表中，对于这个演示，选择默认的 “Kickstart”，但有许多可用的选项。
  11. 在“<ruby>Root 密码<rt>Root Password</rt></ruby>”栏中，为你的新主机输入一个 root 密码。
  12. 点击“<ruby>接口<rt>Interface</rt></ruby>”标签，并点击“<ruby>编辑<rt>Edit</rt></ruby>”，并添加一个 “<ruby>Mac 地址<rt>Mac address</rt></ruby>”。
  13. 点击“<ruby>参数<rt>Parameters</rt></ruby>”标签，并确保存在一个提供激活密钥的参数。如果没有，添加一个激活密钥。
  14. 点击“<ruby>提交<rt>Submit</rt></ruby>”以保存主机条目。



现在，新的主机处于构建模式，这意味着当你打开它时，它将开始安装操作系统。

如果你导航到“<ruby>主机<rt>Hosts</rt></ruby> > <ruby>内容主机<rt>Content Hosts</rt></ruby>”，你可以看到你的主机所订阅的订阅、生命周期环境和内容视图的全部细节。

这个例子只是对你在 Foreman 中管理和配置 CentOS Stream 内容的众多选项的一个小窥视。如果你想了解更多关于如何管理 CentOS Stream 版本，控制你的服务器可以访问的内容，以及控制和保护你的基础设施的稳定性的详细信息，请查看 [Foreman 内容管理][5] 文档。当所有 CentOS Stream 内容在你的控制之下时，你可以创建和注册 Centos Stream，只使用你指定的内容。有关配备的更多详细信息，请参见 [Foreman 配备][6] 文档。如果你有任何问题、反馈或建议，你可以在 <https://community.theforeman.org/> 找到 Foreman 社区。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/centos-stream-foreman

作者：[Melanie Corr][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/melanie-corr
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/puzzle_computer_solve_fix_tool.png?itok=U0pH1uwj (Puzzle pieces coming together to form a computer screen)
[2]: https://twitter.com/Det_Conan_Kudo/status/1337366036023218177?s=20
[3]: https://opensource.com/article/20/8/manage-repositories-pulp
[4]: https://docs.theforeman.org/3.0/Installing_Server_on_Red_Hat/index-katello.html
[5]: https://docs.theforeman.org/master/Content_Management_Guide/index-foreman.html
[6]: https://docs.theforeman.org/master/Provisioning_Guide/index-foreman.html

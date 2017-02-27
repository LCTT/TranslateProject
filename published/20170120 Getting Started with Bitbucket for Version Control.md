Bitbucket 版本控制入门指南
============================================================

 ![](https://www.blogmint.com/frontendUtil/openPage?page=blog-post-read&oId=c41aba944ad4408095c09ccabc1921ec&uId=1a715d24df2f49c0be2acf7d7409ffbb&count=1&image=one-pixel.png) 

在互联网成为一个巨大的、世界性的现象之前，开发团队常常被限制在一个小的物理空间内。如果公司没有资金支持的话，与世界另一方的人合作是一个非常昂贵或几乎不可能的梦想。

幸运的是，情况不再是这样了。互联网诞生了基于网络的解决方案，允许公司组成合作团体，包括彼此相距数千英里的人。

自从 2008 年首次推出以来，[Bitbucket][1] 已成为使用 **Mercurial** 或 **Git** 版本控制系统（**VCS**）的开发人员团队中越来越受欢迎的选择。

它既提供免费帐户，带有不限数量的私人存储库（每个账户最多 5 个用户），也提供多种付费计划，允许每个帐户有更多用户。此外，标记为“公开”的仓库对可以编辑或读取其内容的人数没有限制。

### 注册 Bitbucket

要使用 **Bitbucket**，你需要建立一个免费帐户。要这样做，请进入 [https://bitbucket.org/][2]， 然后单击<ruby>免费开始<rt>Get started for free</rt></ruby>按钮。

首先，你需要输入有效的电子邮件地址，然后点击**继续**。 你的电子邮件帐户将被验证，如果一切正常，你将被提示输入所需的密码。完成后，再次点击 **继续**，然后检查你的电子邮件**收件箱**，以确认你的帐户是否已创建：

[
 ![Bitbucket Singup](http://www.tecmint.com/wp-content/uploads/2017/01/Bitbucket-Singup.png) 
][3]

*Bitbucket 注册*

验证电子邮件地址后，系统会要求你确定**用户名**。 然后将创建你的帐户，你将会进入 **Bitbucket** 面板，在那里开始创建团队、项目和仓库：

[
 ![Bitbucket Dashboard](http://www.tecmint.com/wp-content/uploads/2017/01/Bitbucket-Dashboard.png) 
][4]

*Bitbucket 面板*

如你所见，你可以在几分钟内注册 **Bitbucket**。**Atlassian** 的人简化了这个过程，以便你可以把你的时间真正用在 **Bitbucket** 上 - 我们下面会进一步讲。

### 使用 Bitbucket

让我们浏览下注册 **Bitbucket** 之后必须要做的事情。它们都在顶部菜单中：

[
 ![Explore Bitbucket Features](http://www.tecmint.com/wp-content/uploads/2017/01/Explore-Bitbucket-Features.png) 
][5]

*探索 Bitbucket 功能*

#### 1). 创建一个团队，通过允许多个 Bitbucket 用户共享一个账号计划的方式鼓励协作。

这将允许他们轻松管理团队拥有的仓库。要创建团队，请输入**团队名称**，并确保团队标识不存在。接下来，输入你要添加到群组的人员的电子邮件地址，并指明是否要将其设为**管理员**。最后，单击**创建**：

[
 ![Bitbucket - Create a Team](http://www.tecmint.com/wp-content/uploads/2017/01/Bitbucket-Create-a-Team.png) 
][6]

*Bitbucket – 创建一个团队*

#### 2) 创建或导入一个仓库

如果你已经使用基于 Git 的解决方案，你可以轻松地将你的仓库导入 **Bitbucket**。否则，你可以从头创建一个。让我们看看在每种情况下你需要做什么。

要创建新的仓库，请单击<ruby>仓库<rt>Repositories</rt></ruby>菜单中的<ruby>创建仓库<rt>Create repository</rt></ruby>选项。为新仓库和要分组到的项目选择一个名称。接下来，指明是否要将其设置为 private 并指定类型（Git 或 Mercurial）。最后，单击**创建仓库**：

[
 ![Bitbucket - Create a New Repository](http://www.tecmint.com/wp-content/uploads/2017/01/Bitbucket-Create-a-New-Repository.png) 
][7]

*Bitbucket – 创建一个新仓库*

要导入已有仓库，请从**仓库**下拉菜单中选择**<ruby>导入<rt>Import</rt></ruby>**仓库。要开始导入，请指定源，输入 URL 和所需的登录凭据（如果需要）。

最后，选择新的仓库设置，然后单击**导入**仓库。忽略有关在指定 **URL** 处找不到仓库的警告，因为它是虚拟的，仅用于演示目的：

[
 ![Bitbucket - Import Existing Code](http://www.tecmint.com/wp-content/uploads/2017/01/Bitbucket-Import-Existing-Code.png) 
][8]

*Bitbucket – 导入已有代码*

就是这样，很简单吧。

### 在 Bitbucket 中使用仓库

创建一个新仓库或者导入一个仓库后，它会在面板上展示出来。这时就能执行一些常规操作，如克隆、创建分支、pull request、提交修改、添加 **README** 文件等等：

[
 ![Bitbucket - Repository Overview](http://www.tecmint.com/wp-content/uploads/2017/01/Bitbucket-Repository-Overview.png) 
][9]

*Bitbucket – 仓库概览*

如果想了解如何用仓库工作，或者想要提升你的 git 技能，可以参考 [Bitbucket 官方文档][10]。

##### 总结

如你所见，不管你是版本管理的新手还是老手，**Bitbucket** 都能使管理变得更简单。如果你对本文有任何疑问或评论，请不要犹豫让我们知道。我们期待听到你的声音！

--------------------------------------------------------------------------------

作者简介：

![](http://1.gravatar.com/avatar/7badddbc53297b2e8ed7011cf45df0c0?s=256&d=blank&r=g)

我是 Ravi Saive，TecMint 的原创作者。一个喜爱在互联网上分享技巧和提示的计算机 geek 和 Linux 老手。我的大多数服务运行在 Linux 开源平台上。请在 Twitter、Facebook、Google+ 上关注我。

--------------------------------------------------------------------------------


via: http://www.tecmint.com/bitbucket-for-version-control/

作者：[Ravi Saive][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/
[1]:http://bit.ly/2ieExnS
[2]:http://bit.ly/2ioJISt
[3]:http://www.tecmint.com/wp-content/uploads/2017/01/Bitbucket-Singup.png
[4]:http://www.tecmint.com/wp-content/uploads/2017/01/Bitbucket-Dashboard.png
[5]:http://www.tecmint.com/wp-content/uploads/2017/01/Explore-Bitbucket-Features.png
[6]:http://www.tecmint.com/wp-content/uploads/2017/01/Bitbucket-Create-a-Team.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/01/Bitbucket-Create-a-New-Repository.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/01/Bitbucket-Import-Existing-Code.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/01/Bitbucket-Repository-Overview.png
[10]:https://confluence.atlassian.com/bitbucket/bitbucket-cloud-documentation-home-221448814.html

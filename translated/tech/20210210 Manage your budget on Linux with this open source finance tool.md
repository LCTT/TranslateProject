[#]: collector: (lujun9972)
[#]: translator: (hanszhao80)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Manage your budget on Linux with this open source finance tool)
[#]: via: (https://opensource.com/article/21/2/linux-skrooge)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

使用这款 Linux 开源财务工具管理你的预算
======
使用开源预算工具 Skrooge 让你的财务管理更加轻松。

![2 cents penny money currency][1]

2021 年，人们喜欢 Linux 的理由比以往任何时候都多。在本系列中，我将分享使用 Linux 的 21 个不同理由。本篇介绍的是个人财务管理。

个人财务可能很难管理。当你没有足够的钱在没有经济援助的情况下度日时，这可能是令人沮丧甚至不安的，而当你确实有所需的钱却又不清楚每个月的去向时，这可能会令人惊讶地难以接受。更糟糕的是，我们经常被告知要“制定预算”，好像申报你每个月的花销就能在某种程度上证明你需要多少钱。底线是：制定预算是困难的，不满足你的财务目标是令人沮丧的。但这仍然很重要，Linux 有几个工具可以帮助使任务变得可管理。

### 理财

就像生活中的其他事情一样，我们都有自己的方法来跟踪我们的财务。我过去常常采取一种简单而直接的方法：我的薪水支票被存入一个账户，然后我会提取一定比例的现金。一旦我钱包里的钱没了，我就得等到下一个发薪日才能花钱。我只错过了一天的午餐，就明白了我必须认真对待我的目标，并相应地调整了我的消费行为。对于当时我的简单的生活方式来说，这是一种让我对自己的收入保持诚实的有效手段，但它并没有很好地转化为在线商业交易、长期公用事业合同、投资等等。

随着我不断完善我的财务跟踪方式，我了解到个人会计始终是一个不断发展的过程。我们每个人都有独特的财务状况，这告诉我们可以或应该使用什么样的解决方案来跟踪我们的收入和债务。如果你失业了，那么你的预算目标可能是尽可能少花钱。如果你在工作，但在还学生贷款，那么你的目标可能是向银行汇款。如果你在工作，但计划退休，那么你可能会尽可能多地存钱。

关于预算，要记住的一点是，它意味着将你的财务现实与你的财务 _目标_ 进行比较。你无法避免一些费用，但在这些之后，你可以设定自己的优先事项。如果你没有达到你的目标，你可以调整自己的行为或改写你的目标，使其更好地反映现实。调整你的财务计划并不意味着你失败了。这只是意味着你最初的预测并不准确。在困难时期，你可能无法达到任何预算目标，但如果你坚持你的预算，你会学到很多关于维持你目前的生活方式（无论它可能是什么）所需要的财务手段。随着时间的推移，你可以学习调整你可能从未意识到的设置。例如，由于远程工作已成为一种被广泛接受的选择，人们正在搬到农村城镇以降低生活成本。看到这种生活方式的转变如何改变你的预算报告，真是令人震惊。

重点是，预算是一项经常被低估的活动，这在很大程度上是因为它令人生畏。重要的是要认识到，无论你的专业水平或对财务的兴趣如何，你都可以进行预算。无论你 [只使用 LibreOffice 电子表格][2]，还是尝试专用的财务应用程序，你都可以设定目标，跟踪自己的行为，并学到许多宝贵的经验教训，这些经验教训最终可能会带来回报。

### 开源会计

有几个专用于 [Linux 的个人理财应用程序][3]，包括 [HomeBank][4], [Money Manager EX][5], [GNUCash][6], [KMyMoney][7], 和 [Skrooge][8]。所有这些应用程序本质上都是分类帐，你可以在每个月底（或每当你查看帐户时）退回到一个地方，从你的银行导入数据，并审查你的支出如何与你为自己设定的预算保持一致。

![显示财务数据的 Skrooge 界面][9]

Skrooge

我使用 Skrooge 作为我的个人预算跟踪器。即便面对多个银行账户，它也能轻松自如的设置。与大多数开源金融应用程序一样，Skrooge 可以导入多种文件格式，因此我的工作流程大致如下：

  1. 登录我的银行。
  2. 将当月的银行对账单导出为 QIF 文件。
  3. 打开 Skrooge。
  4. 导入 QIF 文件。每个文件都会自动分配到相应的帐户。
  5. 对照我为自己设定的预算目标检查我的支出。如果我已经超过了，那么我会停靠在下个月的目标（这样我就会理性地少花钱来弥补差额）。如果我尚未超出我的目标预算，那么我会把多余的部分移到 12 月的预算中（这样我在年底就会有更多的支出份额）。



在 Skrooge 里我只跟踪了家庭预算的一部分。Skrooge 通过一个动态数据库简化了这一过程，该数据库允许我使用自定义标签一次对多个事务进行分类。这使我可以轻松地从一般家庭和公用事业支出中提取我的个人支出，并且我可以在查看 Skrooge 提供的自动生成的报告时利用这些类别。

![Skrooge 预算饼图][10]

Skrooge 预算饼图

最重要的是，流行的 Linux 财务应用程序使我能够以最适合我的方式管理我的预算。例如，我的合作伙伴更喜欢使用 LibreOffice 电子表格，但我毫不费力地从家庭预算中提取 CSV 文件，将其导入到 Skrooge，并使用一组更新的数据集。不存在锁定和不兼容。该系统灵活敏捷，使我们能够在更多地了解有效预算和生活中的情况时调整我们的预算和跟踪支出的方法。

### 开放选择

世界各地的货币市场各不相同，我们每个人与之互动的方式也决定了我们可以使用哪些工具。归根结底，你对财务类软件的选择必须基于自己的需求。开源做得特别好的一件事是为用户提供了选择的自由。

在设定自己的财务目标时，我很欣赏我可以使用最适合我个人计算风格的任何应用程序。我可以控制我在生活中如何处理数据，即使是我不一定喜欢处理的数据。Linux 及其令人惊叹的应用程序集使它不再是一件苦差事。

在 Linux 上尝试一些财务应用程序，看看你是否可以激励自己设定一些目标并省钱吧！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/linux-skrooge

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[hanszhao80](https://github.com/hanszhao80)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/Medical%20Costs%20Transparency_1.jpg?itok=CkZ_J88m (2 cents penny money currency)
[2]: https://opensource.com/article/20/3/libreoffice-templates
[3]: https://opensource.com/life/17/10/personal-finance-tools-linux
[4]: http://homebank.free.fr/en/index.php
[5]: https://www.moneymanagerex.org/download
[6]: https://opensource.com/article/20/2/gnucash
[7]: https://kmymoney.org/download.html
[8]: https://apps.kde.org/en/skrooge
[9]: https://opensource.com/sites/default/files/skrooge.jpg
[10]: https://opensource.com/sites/default/files/skrooge-pie_0.jpg

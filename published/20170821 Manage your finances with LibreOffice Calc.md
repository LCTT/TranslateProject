使用 LibreOffice Calc 管理你的财务
============================================================

> 你想知道你的钱花在哪里？这个精心设计的电子表格可以一目了然地回答这个问题。

![Get control of your finances with LibreOffice Calc](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BIZ_WorkInPublic.png?itok=7nAi_Db_ "Get control of your finances with LibreOffice Calc")


如果你像大多数人一样，没有一个无底般的银行帐户。你可能需要仔细观察你的每月支出。

有很多方法可以做到这一点，但是最快最简单的方法是使用电子表格。许多人创建一个非常基本的电子表格来完成这项工作，它由两长列组成，总计位于底部。这是可行的，但这有点傻。

我将通过使用 LibreOffice Calc 创建一个更便于细查的（我认为）以及更具视觉吸引力的个人消费电子表格。

你说不用 LibreOffice？没关系。你可以使用 [Gnumeric][7]、[Calligra Sheets][8] 或 [EtherCalc][9] 等电子表格工具使用本文中的信息。

### 首先列出你的费用

先别费心 LibreOffice 了。坐下来用笔和纸，列出你的每月日常开支。花时间，翻遍你的记录，记下所有的事情，无论它多么渺小。不要担心你花了多少钱。重点放在你把钱花在哪里。

完成之后，将你的费用分组到最有意义的标题下。例如，将你的燃气、电气和水费放在“水电费”下。你也可能想要为我们每个月都会遇到的意外费用，使用一组名为“种种”。

### 创建电子表格

启动 LibreOffice Calc 并创建一个空的电子表格。在电子表格的顶部留下三个空白行。之后我们会回来。

你把你的费用归类是有原因的：这些组将成为电子表格上的块。我们首先将最重要的花费组（例如 “家庭”）放在电子表格的顶部。

在工作表顶部第四行的第一个单元格中输入该花费组的名称。将它放大（可以是 12 号字体）、加粗使得它显眼。

在该标题下方的行中，添加以下三列：

*   花费
*   日期
*   金额

在“花费”列下的单元格中输入该组内花费的名称。

接下来，选择日期标题下的单元格。单击 **Format** 菜单，然后选择 **Number Format > Date**。对“金额”标题下的单元格重复此操作，然后选择 **Number Format > Currency**。

你会看到这样：

![A group of expenses](https://opensource.com/sites/default/files/u128651/spreadsheet-expense-block.png "A group of expenses")

这是一组开支的方式。不要为每个花费组创建新块, 而是复制你创建的内容并将其粘贴到第一个块旁边。我建议一行放三块, 在它们之间有一个空列。

你会看到这样：

![A row of expenses](https://opensource.com/sites/default/files/u128651/spreadsheet-expense-rows.png "A row of expenses")

对所有你的花费组做重复操作。

### 总计所有

查看所有个人费用是一回事，但你也可以一起查看每组费用的总额和所有费用。

我们首先总计每个费用组的金额。你可以让 LibreOffice Calc 自动做这些。高亮显示“金额”列底部的单元格，然后单击 “Formula” 工具栏上的 “Sum” 按钮。

![The Sum button](https://opensource.com/sites/default/files/u128651/spreadsheet-sum-button.png "The Sum button")

单击金额列中的第一个单元格，然后将光标拖动到列中的最后一个单元格。然后按下 Enter。

![An expense block with a total](https://opensource.com/sites/default/files/u128651/spreadsheet-totaled-expenses.png "An expense block with a total")

现在让我们用你顶部留下的两三行空白行做一些事。这就是你所有费用的总和。我建议把它放在那里，这样无论何时你打开文件时它都是可见的。

在表格左上角的其中一个单元格中，输入类似“月总计”。然后，在它旁边的单元格中，输入 `=SUM()`。这是 LibreOffice Calc 函数，它可以在电子表格中添加特定单元格的值。

不要手动输入要添加的单元格的名称，请按住键盘上的 Ctrl。然后在电子表格上单击你在每组费用中总计的单元格。

### 完成

你有一张追踪一个月花费的表。拥有单个月花费的电子表格有点浪费。为什么不用它跟踪全年的每月支出呢？

右键单击电子表格底部的选项卡，然后选择 **Move or Copy Sheet**。在弹出的窗口中，单击 **-move to end position-**，然后按下 Enter 键。一直重复到你有 12 张表 - 每月一张。以月份重命名表格，然后使用像 _Monthly Expenses 2017.ods_ 这样的描述性名称保存电子表格。

现在设置完成了，你可以使用电子表格了。使用电子表格跟踪你的花费本身不会坚实你的财务基础，但它可以帮助你控制每个月的花费。

（题图： opensource.com）

--------------------------------------------------------------------------------
作者简介：

Scott Nesbitt - 我是一名长期使用自由/开源软件的用户，并为了乐趣和收益写了各种软件。我不会太严肃。你可以在网上这些地方找到我：Twitter、Mastodon、GitHub。

----------------

via: https://opensource.com/article/17/8/budget-libreoffice-calc

作者：[Scott Nesbitt][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/scottnesbitt
[1]:https://opensource.com/file/366811
[2]:https://opensource.com/file/366831
[3]:https://opensource.com/file/366821
[4]:https://opensource.com/file/366826
[5]:https://opensource.com/article/17/8/budget-libreoffice-calc?rate=C87fXAfGoIpA1OuF-Zx1nv-98UN9GgbFUz4tl_bKug4
[6]:https://opensource.com/user/14925/feed
[7]:http://www.gnumeric.org/
[8]:https://www.calligra.org/sheets/
[9]:https://ethercalc.net/
[10]:https://opensource.com/users/scottnesbitt
[11]:https://opensource.com/users/scottnesbitt
[12]:https://opensource.com/article/17/8/budget-libreoffice-calc#comments

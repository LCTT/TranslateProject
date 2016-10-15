Building a data science portfolio: Machine learning project
===========================================================

>这是这个系列的第三次发布关于如何建立科学的投资数据. 如果你喜欢这个系列并且想继续关注, 你可以在订阅页面的底部找到链接[subscribe at the bottom of the page][1].

数据科学公司越来越关注投资组合问题. 这其中的一个原因是，投资组合是最好的判断人们生活技能的方法. 好消息是投资组合是完全在你的控制之下的. 只要你做些投资方面的工作，就可以做出很棒的投资组合.

高质量投资组合的第一步就是知道需要什么技能. 客户想要将这些初级技能应用到数据科学, 因此这些投资技能显示如下:

- 沟通能力
- 协作能力
- 技术能力
- 数据推理能力
- 主动性

任何好的投资组合都由多个能力组成，其中必然包含以上一到两点. 这里我们主要讲第三点如何做好科学的数据投资组合. 在这一节, 我们主要讲第二项以及如何创建一个端对端的机器学习项目. 在最后, 在最后我们将拥有一个项目它将显示你的能力和技术水平. [Here’s][2]如果你想看一下这里有一个完整的例子.

### 一个端到端的项目

作为一个数据科学家, 有时候你会拿到一个数据集并被问到是 [如何产生的][3]. 在这个时候, 交流是非常重要的, 走一遍流程. 用用Jupyter notebook, 看一看以前的例子，这对你非常有帮助. 在这里你能找到一些可以用的报告或者文档.

不管怎样, 有时候你会被要求创建一个具有操作价值的项目. 一个直接影响公司业务的项目, 不止一次的, 许多人用的项目. 这个任务可能像这样 “创建一个算法来预测波动率”或者 “创建一个模型来自动标签我们的文章”. 在这种情况下, 技术能力比说评书更重要. 你必须能够创建一个数据集, 并且理解它, 然后创建脚本处理该数据. 还有很重要的脚本要运行的很快, 占用系统资源很小. 它可能要运行很多次, 脚本的可使用性也很重要，并不仅仅是一个演示版. 可使用性是指整合操作流程, 因为他很有可能是面向用户的.

端对端项目的主要组成部分:

- 理解背景
- 浏览数据并找出细微差别
- 创建结构化项目, 那样比较容易整合操作流程
- 运行速度快占用系统资源小的代码
- 写好文档以便其他人用

为类有效的创建这种类型的项目, 我们可能需要处理多个文件. 强烈推荐使用 [Atom][4]或者[PyCharm][5] . 这些工具允许你在文件间跳转, 编辑不同类型的文件, 例如 markdown 文件, Python 文件, 和csv 文件. 结构化你的项目还利于版本控制 [Github][6] 也很有用.

![](https://www.dataquest.io/blog/images/end_to_end/github.png)
>Github上的这个项目.

在这一节中我们将使用  [Pandas][7] 和 [scikit-learn][8]扩展包 . 我们还将用到Pandas [DataFrames][9], 它使得python读取和处理表格数据更加方便.

### 找到好的数据集

找到一个好的端到端投资项目数据集很难. [The dataset][10]数据集需要足够大但是内存和性能限制了它. 它还需要实际有用的. 例如, 这个数据集, 它包含有美国院校的录取标准, 毕业率以及毕业以后的收入是个很好的数据集了. 不管怎样, 不管你如何想这个数据, 很显然它不适合创建端到端的项目. 比如, 你能告诉人们他们去了这些大学以后的未来收益, 但是却没有足够的细微差别. 你还能找出院校招生标准收入更高, 但是却没有告诉你如何实际操作.

这里还有内存和性能约束的问题比如你有几千兆的数据或者有一些细微差别需要你去预测或者运行什么样的算法数据集等.

一个好的数据集包括你可以动态的转换数组, 并且回答动态的问题. 一个很好的例子是股票价格数据集. 你可以预测明天的价格, 持续的添加数据在算法中. 它将有助于你预测利润. 这不是讲故事这是真实的.

一些找到数据集的好地方:

- [/r/datasets][11] – subreddit（Reddit是国外一个社交新闻站点,subreddit指该论坛下的各不同板块）.
- [Google Public Datasets][12] – 通过Google BigQuery发布的可用数据集.
- [Awesome datasets][13] – Github上的数据集.

当你查看这些数据集, 想一下人们想要在这些数据集中得到什么答案, 哪怕这些问题只想过一次 (“放假是如何S&P 500关联的?”), 或者更进一步(“你能预测股市吗?”). 这里的关键是更进一步找出问题, 并且多次运行不同的数据相同的代码.

为了这个目标, 我们来看一下[Fannie Mae 贷款数据][14]. Fannie Mae 是一家政府赞助的企业抵押贷款公司它从其他银行购买按揭贷款. 然后捆绑这些贷款为抵押贷款来倒卖证券. 这使得贷款机构可以提供更多的抵押贷款, 在市场上创造更多的流动性. 这在理论上会导致更多的住房和更好的贷款条件. 从借款人的角度来说,他们大体上差不多, 话虽这样说.

Fannie Mae 发布了两种类型的数据 – 它获得的贷款, 随着时间的推移这些贷款是否被偿还.在理想的情况下, 有人向贷款人借钱, 然后还清贷款. 不管怎样, 有些人没还的起钱, 丧失了抵押品赎回权. Foreclosure 是说没钱还了被银行把房子给回收了. Fannie Mae 追踪谁没还钱, 并且需要收回房屋抵押权. 每个季度会发布此数据, 并滞后一年. 当前可用是2015年第一季度数据.

采集数据是由Fannie Mae发布的贷款数据, 它包含借款人的信息, 信用评分, 和他们的家庭贷款信息. 性能数据, 贷款回收后的每一个季度公布, 包含借贷人所支付款项信息和丧失抵押品赎回状态, 收回贷款的性能数据可能有十几行.一个很好的思路是这样的采集数据告诉你Fannie Mae所控制的贷款, 性能数据包含几个属性来更新贷款. 其中一个属性告诉我们每个季度的贷款赎回权.

![](https://www.dataquest.io/blog/images/end_to_end/foreclosure.jpg)
>一个没有及时还贷的房子就这样的被卖了.

### 选择一个角度

这里有几个方向我们可以去分析 Fannie Mae 数据集. 我们可以:

- 预测房屋的销售价格.
- 预测借款人还款历史.
- 在收购时为每一笔贷款打分.

最重要的事情是坚持单一的角度. 关注太多的事情很难做出效果. 选择一个有着足够细节的角度也很重要. 下面的理解就没有太多差别:

- 找出哪些银行将贷款出售给Fannie Mae.
- 计算贷款人的信用评分趋势.
- 搜索哪些类型的家庭没有偿还贷款的能力.
- 搜索贷款金额和抵押品价格之间的关系

上面的想法非常有趣, 它会告诉我们很多有意思的事情, 但是不是一个很适合操作的项目。

在Fannie Mae数据集中, 我们将预测贷款是否能被偿还. 实际上, 我们将建立一个抵押贷款的分数来告诉 Fannie Mae买还是不买. 这将给我提供很好的基础.

------------

### 理解数据
我们来简单看一下原始数据文件。下面是2012年1季度前几行的采集数据。
```
100000853384|R|OTHER|4.625|280000|360|02/2012|04/2012|31|31|1|23|801|N|C|SF|1|I|CA|945||FRM|
100003735682|R|SUNTRUST MORTGAGE INC.|3.99|466000|360|01/2012|03/2012|80|80|2|30|794|N|P|SF|1|P|MD|208||FRM|788
100006367485|C|PHH MORTGAGE CORPORATION|4|229000|360|02/2012|04/2012|67|67|2|36|802|N|R|SF|1|P|CA|959||FRM|794
```

下面是2012年1季度的前几行执行数据
```
100000853384|03/01/2012|OTHER|4.625||0|360|359|03/2042|41860|0|N||||||||||||||||
100000853384|04/01/2012||4.625||1|359|358|03/2042|41860|0|N||||||||||||||||
100000853384|05/01/2012||4.625||2|358|357|03/2042|41860|0|N||||||||||||||||
```
在开始编码之前，花些时间真正理解数据是值得的。这对于操作项目优为重要，因为我们没有交互式探索数据，将很难察觉到细微的差别除非我们在前期发现他们。在这种情况下，第一个步骤是阅读房利美站点的资料：
- [概述][15]
- [有用的术语表][16]
- [问答][17]
- [采集和执行文件中的列][18]
- [采集数据文件样本][19]
- [执行数据文件样本][20]

在看完这些文件后后，我们了解到一些能帮助我们的关键点：
- 从2000年到现在，每季度都有一个采集和执行文件，因数据是滞后一年的，所以到目前为止最新数据是2015年的。
- 这些文件是文本格式的，采用管道符号“|”进行分割。
- 这些文件是没有表头的，但我们有文件列明各列的名称。
- 所有一起，文件包含2200万个贷款的数据。
由于执行文件包含过去几年获得的贷款的信息，在早些年获得的贷款将有更多的执行数据（即在2014获得的贷款没有多少历史执行数据）。
这些小小的信息将会为我们节省很多时间，因为我们知道如何构造我们的项目和利用这些数据。

### 构造项目
在我们开始下载和探索数据之前，先想一想将如何构造项目是很重要的。当建立端到端项目时，我们的主要目标是：
- 创建一个可行解决方案
- 有一个快速运行且占用最小资源的解决方案
- 容易可扩展
- 写容易理解的代码
- 写尽量少的代码

为了实现这些目标，需要对我们的项目进行良好的构造。一个结构良好的项目遵循几个原则：
- 分离数据文件和代码文件
- 从原始数据中分离生成的数据。
- 有一个README.md文件帮助人们安装和使用该项目。
- 有一个requirements.txt文件列明项目运行所需的所有包。
- 有一个单独的settings.py 文件列明其它文件中使用的所有的设置
    - 例如，如果从多个Python脚本读取相同的文件，把它们全部import设置和从一个集中的地方获得文件名是有用的。
- 有一个.gitignore文件，防止大的或秘密文件被提交。
- 分解任务中每一步可以单独执行的步骤到单独的文件中。
    - 例如，我们将有一个文件用于读取数据，一个用于创建特征，一个用于做出预测。
- 保存中间结果，例如，一个脚本可输出下一个脚本可读取的文件。

    - 这使我们无需重新计算就可以在数据处理流程中进行更改。
    

我们的文件结构大体如下：

```
loan-prediction
├── data
├── processed
├── .gitignore
├── README.md
├── requirements.txt
├── settings.py
```

### 创建初始文件
首先，我们需要创建一个loan-prediction文件夹，在此文件夹下面，再创建一个data文件夹和一个processed文件夹。data文件夹存放原始数据，processed文件夹存放所有的中间计算结果。
其次，创建.gitignore文件，.gitignore文件将保证某些文件被git忽略而不会被推送至github。关于这个文件的一个好的例子是由OSX在每一个文件夹都会创建的.DS_Store文件，.gitignore文件一个很好的起点就是在这了。我们还想忽略数据文件因为他们实在是太大了，同时房利美的条文禁止我们重新分发该数据文件，所以我们应该在我们的文件后面添加以下2行：
```
data
processed
```

这是该项目的一个关于.gitignore文件的例子。
再次，我们需要创建README.md文件，它将帮助人们理解该项目。后缀.md表示这个文件采用markdown格式。Markdown使你能够写纯文本文件，同时还可以添加你想要的梦幻格式。这是关于markdown的导引。如果你上传一个叫README.md的文件至Github，Github会自动处理该markdown，同时展示给浏览该项目的人。
至此，我们仅需在README.md文件中添加简单的描述：
```
Loan Prediction
-----------------------

Predict whether or not loans acquired by Fannie Mae will go into foreclosure.  Fannie Mae acquires loans from other lenders as a way of inducing them to lend more.  Fannie Mae releases data on the loans it has acquired and their performance afterwards [here](http://www.fanniemae.com/portal/funding-the-market/data/loan-performance-data.html).
```

现在，我们可以创建requirements.txt文件了。这会唯其它人可以很方便地安装我们的项目。我们还不知道我们将会具体用到哪些库，但是以下几个库是一个很好的开始：
```
pandas
matplotlib
scikit-learn
numpy
ipython
scipy
```

以上几个是在python数据分析任务中最常用到的库。可以认为我们将会用到大部分这些库。这里是【24】该项目requirements文件的一个例子。
 创建requirements.txt文件之后，你应该安装包了。我们将会使用python3.如果你没有安装python，你应该考虑使用 [Anaconda][25]，一个python安装程序，同时安装了上面列出的所有包。
最后，我们可以建立一个空白的settings.py文件，因为我们的项目还没有任何设置。


----------------

### 获取数据

一旦我们拥有项目的基本架构，我们就可以去获得原始数据

Fannie Mae 对获取数据有一些限制，所有你需要去注册一个账户。在创建完账户之后，你可以找到下载页面[在这里][26]，你可以按照你所需要的下载非常少量或者很多的借款数据文件。文件格式是zip，在解压后当然是非常大的。

为了达到我们这个博客文章的目的，我们将要下载从2012年1季度到2015
年1季度的所有数据。接着我们需要解压所有的文件。解压过后，删掉原来的.zip格式的文件。最后，借款预测文件夹看起来应该像下面的一样：
```
loan-prediction
├── data
│   ├── Acquisition_2012Q1.txt
│   ├── Acquisition_2012Q2.txt
│   ├── Performance_2012Q1.txt
│   ├── Performance_2012Q2.txt
│   └── ...
├── processed
├── .gitignore
├── README.md
├── requirements.txt
├── settings.py
```

在下载完数据后，你可以在shell命令行中使用head和tail命令去查看文件中的行数据，你看到任何的不需要的列数据了吗？在做这件事的同时查阅[列名称的pdf文件][27]可能是有用的事情。
### 读入数据

有两个问题让我们的数据难以现在就使用：
- 收购数据和业绩数据被分割在多个文件中
- 每个文件都缺少标题

在我们开始使用数据之前，我们需要首先明白我们要在哪里去存一个收购数据的文件，同时到哪里去存储一个业绩数据的文件。每个文件仅仅需要包括我们关注的那些数据列，同时拥有正确的标题。这里有一个小问题是业绩数据非常大，因此我们需要尝试去修剪一些数据列。

第一步是向settings.py文件中增加一些变量，这个文件中同时也包括了我们原始数据的存放路径和处理出的数据存放路径。我们同时也将添加其他一些可能在接下来会用到的设置数据：
```
DATA_DIR = "data"
PROCESSED_DIR = "processed"
MINIMUM_TRACKING_QUARTERS = 4
TARGET = "foreclosure_status"
NON_PREDICTORS = [TARGET, "id"]
CV_FOLDS = 3
```

把路径设置在settings.py中将使它们放在一个集中的地方，同时使其修改更加的容易。当提到在多个文件中的相同的变量时，你想改变它的话，把他们放在一个地方比分散放在每一个文件时更加容易。[这里的][28]是一个这个工程的示例settings.py文件

第二步是创建一个文件名为assemble.py，它将所有的数据分为2个文件。当我们运行Python assemble.py，我们在处理数据文件的目录会获得2个数据文件。

接下来我们开始写assemble.py文件中的代码。首先我们需要为每个文件定义相应的标题，因此我们需要查看[列名称的pdf文件][29]同时创建在每一个收购数据和业绩数据的文件的列数据的列表：
```
HEADERS = {
    "Acquisition": [
        "id",
        "channel",
        "seller",
        "interest_rate",
        "balance",
        "loan_term",
        "origination_date",
        "first_payment_date",
        "ltv",
        "cltv",
        "borrower_count",
        "dti",
        "borrower_credit_score",
        "first_time_homebuyer",
        "loan_purpose",
        "property_type",
        "unit_count",
        "occupancy_status",
        "property_state",
        "zip",
        "insurance_percentage",
        "product_type",
        "co_borrower_credit_score"
    ],
    "Performance": [
        "id",
        "reporting_period",
        "servicer_name",
        "interest_rate",
        "balance",
        "loan_age",
        "months_to_maturity",
        "maturity_date",
        "msa",
        "delinquency_status",
        "modification_flag",
        "zero_balance_code",
        "zero_balance_date",
        "last_paid_installment_date",
        "foreclosure_date",
        "disposition_date",
        "foreclosure_costs",
        "property_repair_costs",
        "recovery_costs",
        "misc_costs",
        "tax_costs",
        "sale_proceeds",
        "credit_enhancement_proceeds",
        "repurchase_proceeds",
        "other_foreclosure_proceeds",
        "non_interest_bearing_balance",
        "principal_forgiveness_balance"
    ]
}
```


接下来一步是定义我们想要保持的数据列。我们将需要保留收购数据中的所有列数据，丢弃列数据将会使我们节省下内存和硬盘空间，同时也会加速我们的代码。
```
SELECT = {
    "Acquisition": HEADERS["Acquisition"],
    "Performance": [
        "id",
        "foreclosure_date"
    ]
}
```

下一步，我们将编写一个函数来连接数据集。下面的代码将：
- 引用一些需要的库，包括设置。
- 定义一个函数concatenate, 目的是:
    - 获取到所有数据目录中的文件名.
    - 在每个文件中循环.
        - 如果文件不是正确的格式 (不是以我们需要的格式作为开头), 我们将忽略它.
        - 把文件读入一个[数据帧][30] 伴随着正确的设置通过使用Pandas [读取csv][31]函数.
            - 在｜处设置分隔符以便所有的字段能被正确读出.
            - 数据没有标题行，因此设置标题为None来进行标示.
            - 从HEADERS字典中设置正确的标题名称 – 这将会是我们数据帧中的数据列名称.
            - 通过SELECT来选择我们加入数据的数据帧中的列.
- 把所有的数据帧共同连接在一起.
- 把已经连接好的数据帧写回一个文件.

```
import os
import settings
import pandas as pd

def concatenate(prefix="Acquisition"):
    files = os.listdir(settings.DATA_DIR)
    full = []
    for f in files:
        if not f.startswith(prefix):
            continue

        data = pd.read_csv(os.path.join(settings.DATA_DIR, f), sep="|", header=None, names=HEADERS[prefix], index_col=False)
        data = data[SELECT[prefix]]
        full.append(data)

    full = pd.concat(full, axis=0)

    full.to_csv(os.path.join(settings.PROCESSED_DIR, "{}.txt".format(prefix)), sep="|", header=SELECT[prefix], index=False)
```

我们可以通过调用上面的函数，通过传递的参数收购和业绩两次以将所有收购和业绩文件连接在一起。下面的代码将：
- 仅仅在脚本被在命令行中通过python assemble.py被唤起而执行.
- 将所有的数据连接在一起，并且产生2个文件:
    - `processed/Acquisition.txt`
    - `processed/Performance.txt`

```
if __name__ == "__main__":
    concatenate("Acquisition")
    concatenate("Performance")
```

我们现在拥有了一个漂亮的，划分过的assemble.py文件，它很容易执行，也容易被建立。通过像这样把问题分解为一块一块的，我们构建工程就会变的容易许多。不用一个可以做所有的凌乱的脚本，我们定义的数据将会在多个脚本间传递，同时使脚本间完全的0耦合。当你正在一个大的项目中工作，这样做是一个好的想法，因为这样可以更佳容易的修改其中的某一部分而不会引起其他项目中不关联部分产生超出预期的结果。

一旦我们完成assemble.py脚本文件, 我们可以运行python assemble.py命令. 你可以查看完整的assemble.py文件[在这里][32].

这将会在处理结果目录下产生2个文件:

```
loan-prediction
├── data
│   ├── Acquisition_2012Q1.txt
│   ├── Acquisition_2012Q2.txt
│   ├── Performance_2012Q1.txt
│   ├── Performance_2012Q2.txt
│   └── ...
├── processed
│   ├── Acquisition.txt
│   ├── Performance.txt
├── .gitignore
├── assemble.py
├── README.md
├── requirements.txt
├── settings.py
```


--------------


### 计算运用数据中的值

接下来我们会计算过程数据或运用数据中的值。我们要做的就是推测这些数据代表的贷款是否被收回。如果能够计算出来，我们只要看一下包含贷款的运用数据的参数 foreclosure_date 就可以了。如果这个参数的值是 None　，那么这些贷款肯定没有收回。为了避免我们的样例中存在少量的运用数据，我们会计算出运用数据中有贷款数据的行的行数。这样我们就能够从我们的训练数据中筛选出贷款数据，排除了一些运用数据。

下面是一种区分贷款数据和运用数据的方法：

![](https://github.com/LCTT/wiki-images/blob/master/TranslateProject/ref_img/001.png)


在上面的表格中，采集数据中的每一行数据都与运用数据中的多行数据有联系。在运用数据中，在收回贷款的时候 foreclosure_date 就会以季度的的形式显示出收回时间，而且它会在该行数据的最前面显示一个空格。一些贷款没有收回，所以与运用数据中的贷款数据有关的行都会在前面出现一个表示 foreclosure_date 的空格。

我们需要计算 foreclosure_status 的值，它的值是布尔类型，可以表示一个特殊的贷款数据 id 是否被收回过，还有一个参数 performance_count ，它记录了运用数据中每个贷款 id 出现的行数。　

计算这些行数有多种不同的方法：

- 我们能够读取所有的运用数据，然后我们用 Pandas 的 groupby 方法在数据框中计算出与每个贷款 id 有关的行的行数，然后就可以查看贷款 id 的 foreclosure_date 值是否为 None 。
　　　 - 这种方法的优点是从语法上来说容易执行。
　　　　- 它的缺点需要读取所有的 129236094 行数据，这样就会占用大量内存，并且运行起来极慢。
- 我们可以读取所有的运用数据，然后使用采集到的数据框去计算每个贷款 id　出现的次数。
　　　　- 这种方法的优点是容易理解。
　　　　- 缺点是需要读取所有的 129236094 行数据。这样会占用大量内存，并且运行起来极慢。
- 我们可以在迭代访问运用数据中的每一行数据，而且会建立一个区分开的计数字典。
    - 这种方法的优点是数据不需要被加载到内存中，所以运行起来会很快且不需要占用内存。
　　　　- 缺点是这样的话理解和执行上可能有点耗费时间，我们需要对每一行数据进行语法分析。

加载所有的数据会非常耗费内存，所以我们采用第三种方法。我们要做的就是迭代运用数据中的每一行数据，然后为每一个贷款 id 生成一个字典值。在这个字典中，我们会计算出贷款 id 在运用数据中出现的次数，而且如果 foreclosure_date 不是 Nnoe 。我们可以查看 foreclosure_status 和 performance_count 的值 。

我们会新建一个 annotate.py 文件，文件中的代码可以计算这些值。我们会使用下面的代码：

- 导入需要的库
- 定义一个函数 count_performance_rows 。
    - 打开 processed/Performance.txt 文件。这不是在内存中读取文件而是打开了一个文件标识符，这个标识符可以用来以行为单位读取文件。　
    - 迭代文件的每一行数据。
    - 使用分隔符(|)分开每行的不同数据。
    - 检查 loan_id 是否在计数字典中。
        - 如果不存在，进行一次计数。
    - loan_id 的 performance_count 参数自增 1 次，因为我们这次迭代也包含其中。
    - 如果日期是 None ，我们就会知道贷款被收回了，然后为foreclosure_status 设置合适的值。

```
import os
import settings
import pandas as pd

def count_performance_rows():
    counts = {}
    with open(os.path.join(settings.PROCESSED_DIR, "Performance.txt"), 'r') as f:
        for i, line in enumerate(f):
            if i == 0:
                # Skip header row
                continue
            loan_id, date = line.split("|")
            loan_id = int(loan_id)
            if loan_id not in counts:
                counts[loan_id] = {
                    "foreclosure_status": False,
                    "performance_count": 0
                }
            counts[loan_id]["performance_count"] += 1
            if len(date.strip()) > 0:
                counts[loan_id]["foreclosure_status"] = True
    return counts
```

### 获取值

只要我们创建了计数字典，我们就可以使用一个函数通过一个 loan_id 和一个 key 从字典中提取到需要的参数的值：

```
def get_performance_summary_value(loan_id, key, counts):
    value = counts.get(loan_id, {
        "foreclosure_status": False,
        "performance_count": 0
    })
    return value[key]
```


上面的函数会从计数字典中返回合适的值，我们也能够为采集数据中的每一行赋一个 foreclosure_status 值和一个 performance_count 值。如果键不存在，字典的 [get][33] 方法会返回一个默认值，所以在字典中不存在键的时候我们就可以得到一个可知的默认值。



------------------


### 注解数据

我们已经在annotate.py中添加了一些功能, 现在我们来看一看数据文件. 我们需要将采集到的数据转换到训练数据表来进行机器学习的训练. 这涉及到以下几件事情:

- 转换所以列数字.
- 填充缺失值.
- 分配 performance_count 和 foreclosure_status.
- 移除出现次数很少的行(performance_count 计数低).

我们有几个列是文本类型的, 看起来对于机器学习算法来说并不是很有用. 然而, 他们实际上是分类变量, 其中有很多不同的类别代码, 例如R,S等等. 我们可以把这些类别标签转换为数值:

![](https://github.com/LCTT/wiki-images/blob/master/TranslateProject/ref_img/002.png)

通过这种方法转换的列我们可以应用到机器学习算法中.

还有一些包含日期的列 (first_payment_date 和 origination_date). 我们可以将这些日期放到两个列中:

![](https://github.com/LCTT/wiki-images/blob/master/TranslateProject/ref_img/003.png)
在下面的代码中, 我们将转换采集到的数据. 我们将定义一个函数如下:

- 在采集到的数据中创建foreclosure_status列 .
- 在采集到的数据中创建performance_count列.
- 将下面的string列转换为integer列:
    - channel
    - seller
    - first_time_homebuyer
    - loan_purpose
    - property_type
    - occupancy_status
    - property_state
    - product_type
- 转换first_payment_date 和 origination_date 为两列:
    - 通过斜杠分离列.
    - 将第一部分分离成月清单.
    - 将第二部分分离成年清单.
    - 删除这一列.
    - 最后, 我们得到 first_payment_month, first_payment_year, origination_month, and origination_year.
- 所有缺失值填充为-1.

```
def annotate(acquisition, counts):
    acquisition["foreclosure_status"] = acquisition["id"].apply(lambda x: get_performance_summary_value(x, "foreclosure_status", counts))
    acquisition["performance_count"] = acquisition["id"].apply(lambda x: get_performance_summary_value(x, "performance_count", counts))
    for column in [
        "channel",
        "seller",
        "first_time_homebuyer",
        "loan_purpose",
        "property_type",
        "occupancy_status",
        "property_state",
        "product_type"
    ]:
        acquisition[column] = acquisition[column].astype('category').cat.codes

    for start in ["first_payment", "origination"]:
        column = "{}_date".format(start)
        acquisition["{}_year".format(start)] = pd.to_numeric(acquisition[column].str.split('/').str.get(1))
        acquisition["{}_month".format(start)] = pd.to_numeric(acquisition[column].str.split('/').str.get(0))
        del acquisition[column]

    acquisition = acquisition.fillna(-1)
    acquisition = acquisition[acquisition["performance_count"] > settings.MINIMUM_TRACKING_QUARTERS]
    return acquisition
```

### 聚合到一起

我们差不多准备就绪了, 我们只需要再在annotate.py添加一点点代码. 在下面代码中, 我们将:

- 定义一个函数来读取采集的数据.
- 定义一个函数来写入数据到/train.csv
- 如果我们在命令行运行annotate.py来读取更新过的数据文件，它将做如下事情:
    - 读取采集到的数据.
    - 计算数据性能.
    - 注解数据.
    - 将注解数据写入到train.csv.

```
def read():
    acquisition = pd.read_csv(os.path.join(settings.PROCESSED_DIR, "Acquisition.txt"), sep="|")
    return acquisition
    
def write(acquisition):
    acquisition.to_csv(os.path.join(settings.PROCESSED_DIR, "train.csv"), index=False)

if __name__ == "__main__":
    acquisition = read()
    counts = count_performance_rows()
    acquisition = annotate(acquisition, counts)
    write(acquisition)
```

修改完成以后为了确保annotate.py能够生成train.csv文件. 你可以在这里找到完整的 annotate.py file [here][34].

文件夹结果应该像这样:

```
loan-prediction
├── data
│   ├── Acquisition_2012Q1.txt
│   ├── Acquisition_2012Q2.txt
│   ├── Performance_2012Q1.txt
│   ├── Performance_2012Q2.txt
│   └── ...
├── processed
│   ├── Acquisition.txt
│   ├── Performance.txt
│   ├── train.csv
├── .gitignore
├── annotate.py
├── assemble.py
├── README.md
├── requirements.txt
├── settings.py
```

### 找到标准

我们已经完成了训练数据表的生成, 现在我们需要最后一步, 生成预测. 我们需要找到错误的标准, 以及该如何评估我们的数据. 在这种情况下, 因为有很多的贷款没有收回, 所以根本不可能做到精确的计算.

我们需要读取数据, 并且计算foreclosure_status列, 我们将得到如下信息:

```
import pandas as pd
import settings

train = pd.read_csv(os.path.join(settings.PROCESSED_DIR, "train.csv"))
train["foreclosure_status"].value_counts()
```

```
False    4635982
True        1585
Name: foreclosure_status, dtype: int64
```

因为只有一点点贷款收回, 通过百分比标签来建立的机器学习模型会把每行都设置为Fasle, 所以我们在这里要考虑每个样本的不平衡性,确保我们做出的预测是准确的. 我们不想要这么多假的false, 我们将预计贷款收回但是它并没有收回, 我们预计贷款不会回收但是却回收了. 通过以上两点, Fannie Mae的false太多了, 因此显示他们可能无法收回投资.

所以我们将定义一个百分比，就是模型预测没有收回但是实际上收回了, 这个数除以总的负债回收总数. 这个负债回收百分比模型实际上是“没有的”. 下面看这个图表:

![](https://github.com/LCTT/wiki-images/blob/master/TranslateProject/ref_img/004.png)

通过上面的图表, 1个负债预计不会回收, 也确实没有回收. 如果我们将这个数除以总数, 2, 我们将得到false的概率为50%. 我们将使用这个标准, 因此我们可以评估一下模型的性能.

### 设置机器学习分类器

我们使用交叉验证预测. 通过交叉验证法, 我们将数据分为3组. 按照下面的方法来做:

- Train a model on groups 1 and 2, and use the model to make predictions for group 3.
- Train a model on groups 1 and 3, and use the model to make predictions for group 2.
- Train a model on groups 2 and 3, and use the model to make predictions for group 1.

将它们分割到不同的组 ,这意味着我们永远不会用相同的数据来为预测训练模型. 这样就避免了overfitting(过拟合). 如果我们overfit(过拟合), 我们将得到很低的false概率, 这使得我们难以改进算法或者应用到现实生活中.

[Scikit-learn][35] 有一个叫做 [cross_val_predict][36] 他可以帮助我们理解交叉算法.

我们还需要一种算法来帮我们预测. 我们还需要一个分类器 [binary classification][37]（二元分类）. 目标变量foreclosure_status 只有两个值, True 和 False.

我们用[logistic regression][38]（回归算法）, 因为它能很好的进行binary classification（二元分类）, 并且运行很快, 占用内存很小. 我们来说一下它是如何工作的 – 取代许多树状结构, 更像随机森林, 进行转换, 更像一个向量机, 逻辑回归涉及更少的步骤和更少的矩阵.

我们可以使用[logistic regression classifier][39]（逻辑回归分类器）算法 来实现scikit-learn. 我们唯一需要注意的是每个类的标准. 如果我们使用同样标准的类, 算法将会预测每行都为false, 因为它总是试图最小化误差.不管怎样, 我们关注有多少贷款能够回收而不是有多少不能回收. 因此, 我们通过 [LogisticRegression][40]（逻辑回归）来平衡标准参数, 并计算回收贷款的标准. 这将使我们的算法不会认为每一行都为false.


----------------------

### 做出预测

既然完成了前期准备，我们可以开始准备做出预测了。我将创建一个名为 predict.py 的新文件，它会使用我们在最后一步创建的 train.csv 文件。下面的代码：

- 导入所需的库
- 创建一个名为 `cross_validate` 的函数：
    - 使用正确的关键词参数创建逻辑回归分类器（logistic regression classifier）
    - 创建移除了 `id` 和 `foreclosure_status` 属性的用于训练模型的列
    - 跨 `train` 数据帧使用交叉验证
    - 返回预测结果

```python
import os
import settings
import pandas as pd
from sklearn import cross_validation
from sklearn.linear_model import LogisticRegression
from sklearn import metrics

def cross_validate(train):
    clf = LogisticRegression(random_state=1, class_weight="balanced")

    predictors = train.columns.tolist()
    predictors = [p for p in predictors if p not in settings.NON_PREDICTORS]

    predictions = cross_validation.cross_val_predict(clf, train[predictors], train[settings.TARGET], cv=settings.CV_FOLDS)
    return predictions
```

### 预测误差

现在，我们仅仅需要写一些函数来计算误差。下面的代码：

- 创建函数 `compute_error`：
    - 使用 scikit-learn 计算一个简单的精确分数（与实际 `foreclosure_status` 值匹配的预测百分比）
- 创建函数 `compute_false_negatives`：
    - 为了方便，将目标和预测结果合并到一个数据帧
    - 查找漏报率
        - 找到原本应被预测模型取消但没有取消的贷款数目
        - 除以没被取消的贷款总数目

```python
def compute_error(target, predictions):
    return metrics.accuracy_score(target, predictions)

def compute_false_negatives(target, predictions):
    df = pd.DataFrame({"target": target, "predictions": predictions})
    return df[(df["target"] == 1) & (df["predictions"] == 0)].shape[0] / (df[(df["target"] == 1)].shape[0] + 1)

def compute_false_positives(target, predictions):
    df = pd.DataFrame({"target": target, "predictions": predictions})
    return df[(df["target"] == 0) & (df["predictions"] == 1)].shape[0] / (df[(df["target"] == 0)].shape[0] + 1)
```

### 聚合到一起

现在，我们可以把函数都放在 `predict.py`。下面的代码：

- 读取数据集
- 计算交叉验证预测
- 计算上面的 3 个误差
- 打印误差

```python
def read():
    train = pd.read_csv(os.path.join(settings.PROCESSED_DIR, "train.csv"))
    return train

if __name__ == "__main__":
    train = read()
    predictions = cross_validate(train)
    error = compute_error(train[settings.TARGET], predictions)
    fn = compute_false_negatives(train[settings.TARGET], predictions)
    fp = compute_false_positives(train[settings.TARGET], predictions)
    print("Accuracy Score: {}".format(error))
    print("False Negatives: {}".format(fn))
    print("False Positives: {}".format(fp))
```

一旦你添加完代码，你可以运行 `python predict.py` 来产生预测结果。运行结果向我们展示漏报率为 `.26`，这意味着我们没能预测 `26%` 的取消贷款。这是一个好的开始，但仍有很多改善的地方！

你可以在[这里][41]找到完整的 `predict.py` 文件

你的文件树现在看起来像下面这样：

```
loan-prediction
├── data
│   ├── Acquisition_2012Q1.txt
│   ├── Acquisition_2012Q2.txt
│   ├── Performance_2012Q1.txt
│   ├── Performance_2012Q2.txt
│   └── ...
├── processed
│   ├── Acquisition.txt
│   ├── Performance.txt
│   ├── train.csv
├── .gitignore
├── annotate.py
├── assemble.py
├── predict.py
├── README.md
├── requirements.txt
├── settings.py
```

### 撰写 README

既然我们完成了端到端的项目，那么我们可以撰写 README.md 文件了，这样其他人便可以知道我们做的事，以及如何复制它。一个项目典型的 README.md 应该包括这些部分：

- 一个高水准的项目概览，并介绍项目目的
- 任何必需的数据和材料的下载地址
- 安装命令
    - 如何安装要求依赖
- 使用命令
    - 如何运行项目
    - 每一步之后会看到的结果
- 如何为这个项目作贡献
    - 扩展项目的下一步计划

[这里][42] 是这个项目的一个 README.md 样例。

### 下一步

恭喜你完成了端到端的机器学习项目！你可以在[这里][43]找到一个完整的示例项目。一旦你完成了项目，把它上传到 [Github][44] 是一个不错的主意，这样其他人也可以看到你的文件夹的部分项目。

这里仍有一些留待探索数据的角度。总的来说，我们可以把它们分割为 3 类 - 扩展这个项目并使它更加精确，发现预测其他列并探索数据。这是其中一些想法：

- 在 `annotate.py` 中生成更多的特性
- 切换 `predict.py` 中的算法
- 尝试使用比我们发表在这里的更多的来自 `Fannie Mae` 的数据
- 添加对未来数据进行预测的方法。如果我们添加更多数据，我们所写的代码仍然可以起作用，这样我们可以添加更多过去和未来的数据。
- 尝试看看是否你能预测一个银行是否应该发放贷款（相对地，`Fannie Mae` 是否应该获得贷款）
    - 移除 train 中银行不知道发放贷款的时间的任何列
        - 当 Fannie Mae 购买贷款时，一些列是已知的，但不是之前
    - 做出预测
- 探索是否你可以预测除了 foreclosure_status 的其他列
    - 你可以预测在销售时财产值多少？
- 探索探索性能更新之间的细微差别
    - 你能否预测借款人会逾期还款多少次?
    - 你能否标出的典型贷款周期?
- 标出一个州到州或邮政编码到邮政级水平的数据
    - 你看到一些有趣的模式了吗?

如果你建立了任何有趣的东西,请在评论中让我们知道!

如果你喜欢这个,你可能会喜欢阅读 ‘Build a Data Science Porfolio’ 系列的其他文章:

- [Storytelling with data][45].
- [How to setup up a data science blog][46].


--------------------------------------------------------------------------------

via: https://www.dataquest.io/blog/data-science-portfolio-machine-learning/

作者：[Vik Paruchuri][a]
译者：[kokialoves](https://github.com/译者ID),[zky001](https://github.com/译者ID),[vim-kakali](https://github.com/译者ID),[cposture](https://github.com/译者ID),[ideas4u](https://github.com/译者ID)
校对：[校对ID](https://github.com/校对ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.dataquest.io/blog
[1]: https://www.dataquest.io/blog/data-science-portfolio-machine-learning/#email-signup
[2]: https://github.com/dataquestio/loan-prediction
[3]: https://www.dataquest.io/blog/data-science-portfolio-project/
[4]: https://atom.io/
[5]: https://www.jetbrains.com/pycharm/
[6]: https://github.com/
[7]: http://pandas.pydata.org/
[8]: http://scikit-learn.org/
[9]: http://pandas.pydata.org/pandas-docs/stable/generated/pandas.DataFrame.html
[10]: https://collegescorecard.ed.gov/data/
[11]: https://reddit.com/r/datasets
[12]: https://cloud.google.com/bigquery/public-data/#usa-names
[13]: https://github.com/caesar0301/awesome-public-datasets
[14]: http://www.fanniemae.com/portal/funding-the-market/data/loan-performance-data.html
[15]: http://www.fanniemae.com/portal/funding-the-market/data/loan-performance-data.html
[16]: https://loanperformancedata.fanniemae.com/lppub-docs/lppub_glossary.pdf
[17]: https://loanperformancedata.fanniemae.com/lppub-docs/lppub_faq.pdf
[18]: https://loanperformancedata.fanniemae.com/lppub-docs/lppub_file_layout.pdf
[19]: https://loanperformancedata.fanniemae.com/lppub-docs/acquisition-sample-file.txt
[20]: https://loanperformancedata.fanniemae.com/lppub-docs/performance-sample-file.txt
[21]: https://github.com/dataquestio/loan-prediction/blob/master/.gitignore
[22]: https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet
[23]: https://github.com/dataquestio/loan-prediction
[24]: https://github.com/dataquestio/loan-prediction/blob/master/requirements.txt
[25]: https://www.continuum.io/downloads
[26]: https://loanperformancedata.fanniemae.com/lppub/index.html
[27]: https://loanperformancedata.fanniemae.com/lppub-docs/lppub_file_layout.pdf
[28]: https://github.com/dataquestio/loan-prediction/blob/master/settings.py
[29]: https://loanperformancedata.fanniemae.com/lppub-docs/lppub_file_layout.pdf
[30]: http://pandas.pydata.org/pandas-docs/stable/generated/pandas.DataFrame.html
[31]: http://pandas.pydata.org/pandas-docs/stable/generated/pandas.read_csv.html
[32]: https://github.com/dataquestio/loan-prediction/blob/master/assemble.py
[33]: https://docs.python.org/3/library/stdtypes.html#dict.get
[34]: https://github.com/dataquestio/loan-prediction/blob/master/annotate.py
[35]: http://scikit-learn.org/
[36]: http://scikit-learn.org/stable/modules/generated/sklearn.cross_validation.cross_val_predict.html
[37]: https://en.wikipedia.org/wiki/Binary_classification
[38]: https://en.wikipedia.org/wiki/Logistic_regression
[39]: http://scikit-learn.org/stable/modules/generated/sklearn.linear_model.LogisticRegression.html
[40]: http://scikit-learn.org/stable/modules/generated/sklearn.linear_model.LogisticRegression.html
[41]: https://github.com/dataquestio/loan-prediction/blob/master/predict.py
[42]: https://github.com/dataquestio/loan-prediction/blob/master/README.md
[43]: https://github.com/dataquestio/loan-prediction
[44]: https://www.github.com/
[45]: https://www.dataquest.io/blog/data-science-portfolio-project/
[46]: https://www.dataquest.io/blog/how-to-setup-a-data-science-blog/

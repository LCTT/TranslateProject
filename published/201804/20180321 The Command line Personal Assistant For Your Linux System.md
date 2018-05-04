Yoda：您的 Linux 系统命令行个人助理
===========

![](https://www.ostechnix.com/wp-content/uploads/2018/03/Yoda-720x340.png)

不久前，我们介绍了一个名为 [“Betty”][1] 的命令行虚拟助手。今天，我偶然发现了一个类似的实用程序，叫做  “Yoda”。Yoda 是一个命令行个人助理，可以帮助您在 Linux 中完成一些琐碎的任务。它是用 Python 编写的一个自由开源应用程序。在本指南中，我们将了解如何在 GNU/Linux 中安装和使用 Yoda。

### 安装 Yoda，命令行私人助理。

Yoda 需要 Python 2 和 PIP 。如果在您的 Linux 中没有安装 PIP，请参考下面的指南来安装它。只要确保已经安装了 python2-pip 。Yoda 可能不支持 Python 3。

- [如何使用 pip 管理 Python 包](https://www.ostechnix.com/manage-python-packages-using-pip/)

注意：我建议你在 Python 虚拟环境下试用 Yoda。 不仅仅是 Yoda，应该总在虚拟环境中尝试任何 Python 应用程序，让它们不会干扰全局安装的软件包。 您可以按照上文链接中标题为“创建虚拟环境”一节中所述设置虚拟环境。

在您的系统上安装了 `pip` 之后，使用下面的命令克隆 Yoda 库。

```
$ git clone https://github.com/yoda-pa/yoda
```

上面的命令将在当前工作目录中创建一个名为 `yoda` 的目录，并在其中克隆所有内容。转到 `yoda` 目录：

```
$ cd yoda/
```

运行以下命令安装 Yoda 应用程序。

```
$ pip install .
```

请注意最后的点（`.`）。 现在，所有必需的软件包将被下载并安装。

### 配置 Yoda

首先，设置配置以将您的信息保存在本地系统上。

运行下面的命令：

```
$ yoda setup new
```

填写下列的问题：

```
Enter your name:
Senthil Kumar
What's your email id?
[email protected]
What's your github username?
sk
Enter your github password:
Password:
Where shall your config be stored? (Default: ~/.yoda/)

A configuration file already exists. Are you sure you want to overwrite it? (y/n)
y
```

你的密码在加密后保存在配置文件中，所以不用担心。

要检查当前配置，请运行：

```
$ yoda setup check
```

你会看到如下的输出。

```
Name: Senthil Kumar
Email: sk@senthilkumar.com
Github username: sk
```

默认情况下，您的信息存储在  `~/.yoda` 目录中。

要删除现有配置，请执行以下操作：

```
$ yoda setup delete
```

### 用法

Yoda 包含一个简单的聊天机器人。您可以使用下面的聊天命令与它交互。

```
$ yoda chat who are you
```

样例输出:

```
Yoda speaks:
I'm a virtual agent

$ yoda chat how are you
Yoda speaks:
I'm doing very well. Thanks!
```

以下是我们可以用 Yoda 做的事情：

#### 测试网络速度

让我们问一下 Yoda 关于互联网速度的问题。运行：

```
$ yoda speedtest
Speed test results:
Ping: 108.45 ms
Download: 0.75 Mb/s
Upload: 1.95 Mb/s
```

#### 缩短和展开网址

Yoda 还有助于缩短任何网址：

```
$ yoda url shorten https://www.ostechnix.com/
Here's your shortened URL:
https://goo.gl/hVW6U0
```

要展开缩短的网址：

```
$ yoda url expand https://goo.gl/hVW6U0
Here's your original URL:
https://www.ostechnix.com/
```

#### 阅读 Hacker News

我是 Hacker News 网站的常客。 如果你像我一样，你可以使用 Yoda 从下面的 Hacker News 网站阅读新闻。

```
$ yoda hackernews
News-- 1/513

Title-- Show HN: a Yelp for iOS developers
Description-- I came up with this idea "a Yelp for developers" when talking with my colleagues. My hypothesis is that, it would be very helpful if we know more about a library before choosing to use it. It's similar to that we want to know more about a restaurant by checki…
url-- https://news.ycombinator.com/item?id=16636071

Continue? [press-"y"]
```

Yoda 将一次显示一个项目。 要阅读下一条新闻，只需输入 `y` 并按下回车。

#### 管理个人日记

我们也可以保留个人日记以记录重要事件。

使用命令创建一个新的日记：

```
$ yoda diary nn
Input your entry for note:
Today I learned about Yoda
```

要创建新笔记，请再次运行上述命令。

查看所有笔记：

```
$ yoda diary notes
Today's notes:
----------------
 Time | Note
--------|-----
16:41:41| Today I learned about Yoda
```

不仅仅是笔记，Yoda 还可以帮助你创建任务。

要创建新任务，请运行：

```
$ yoda diary nt
Input your entry for task:
Write an article about Yoda and publish it on OSTechNix
```

要查看任务列表，请运行：

```
$ yoda diary tasks
Today's agenda:
----------------
Status | Time | Text
-------|---------|-----
 O | 16:44:03: Write an article about Yoda and publish it on OSTechNix
----------------

Summary:
----------------
Incomplete tasks: 1
Completed tasks: 0
```

正如你在上面看到的，我有一个未完成的任务。 要将其标记为已完成，请运行以下命令并输入已完成的任务序列号并按下回车键：

```
$ yoda diary ct
Today's agenda:
----------------
Number | Time | Task
-------|---------|-----
 1 | 16:44:03: Write an article about Yoda and publish it on OSTechNix
Enter the task number that you would like to set as completed
1
```

您可以随时使用命令分析当前月份的任务：

```
$ yoda diary analyze
Percentage of incomplete task : 0
Percentage of complete task : 100
Frequency of adding task (Task/Day) : 3
```

有时候，你可能想要记录一个关于你爱的或者敬佩的人的个人资料。

#### 记录关于爱人的笔记

首先，您需要设置配置来存储朋友的详细信息。 请运行：

```
$ yoda love setup
```

输入你的朋友的详细信息：

```
Enter their name:
Abdul Kalam
Enter sex(M/F):
M
Where do they live?
Rameswaram
```

要查看此人的详细信息，请运行：

```
$ yoda love status
{'place': 'Rameswaram', 'name': 'Abdul Kalam', 'sex': 'M'}
```

要添加你的爱人的生日：

```
$ yoda love addbirth
Enter birthday
15-10-1931
```

查看生日：

```
$ yoda love showbirth
Birthday is 15-10-1931
```

你甚至可以添加关于该人的笔记：

```
$ yoda love note
Avul Pakir Jainulabdeen Abdul Kalam better known as A. P. J. Abdul Kalam, was the 11th President of India from 2002 to 2007.
```

您可以使用命令查看笔记：

```
$ yoda love notes
Notes:
1: Avul Pakir Jainulabdeen Abdul Kalam better known as A. P. J. Abdul Kalam, was the 11th President of India from 2002 to 2007.
```

你也可以写下这个人喜欢的东西：

```
$ yoda love like
Add things they like
Physics, Aerospace
Want to add more things they like? [y/n]
n
```

要查看他们喜欢的东西，请运行：

```
$ yoda love likes
Likes:
1: Physics, Aerospace
```

#### 跟踪资金费用

您不需要单独的工具来维护您的财务支出。 Yoda 会替您处理好。

首先，使用命令设置您的金钱支出配置：

```
$ yoda money setup
```

输入您的货币代码和初始金额：

```
Enter default currency code:
INR
{u'USD': 0.015338, u'IDR': 211.06, u'BGN': 0.024436, u'ISK': 1.5305, u'ILS': 0.053402, u'GBP': 0.010959, u'DKK': 0.093063, u'CAD': 0.020041, u'MXN': 0.28748, u'HUF': 3.8873, u'RON': 0.058302, u'MYR': 0.060086, u'SEK': 0.12564, u'SGD': 0.020208, u'HKD': 0.12031, u'AUD': 0.019908, u'CHF': 0.014644, u'KRW': 16.429, u'CNY': 0.097135, u'TRY': 0.06027, u'HRK': 0.092986, u'NZD': 0.021289, u'THB': 0.47854, u'EUR': 0.012494, u'NOK': 0.11852, u'RUB': 0.88518, u'JPY': 1.6332, u'CZK': 0.31764, u'BRL': 0.050489, u'PLN': 0.052822, u'PHP': 0.79871, u'ZAR': 0.1834}
₹
Indian rupee
Enter initial amount:
10000

```

要查看金钱配置，只需运行：

```
$ yoda money status
{'initial_money': 10000, 'currency_code': 'INR'}
```

让我们假设你买了一本价值 250 卢比的书。 要添加此费用，请运行：

```
$ yoda money exp
Spend 250 INR on books
output:
```

要查看花费，请运行：

```
$ yoda money exps
2018-03-21 17:12:31 INR 250 books
```

#### 创建想法列表

创建一个新的想法：

```
$ yoda ideas add --task <task_name> --inside <project_name>
```

列出想法：

```
$ yoda ideas show
```

从任务中移除一个想法：

```
$ yoda ideas remove --task <task_name> --inside <project_name>
```

要完全删除这个想法，请运行：

```
$ yoda ideas remove --project <project_name>
```

#### 学习英语词汇

Yoda 帮助你学习随机英语单词并追踪你的学习进度。

要学习一个新单词，请输入：

```
$ yoda vocabulary word
```

它会随机显示一个单词。 按回车键显示单词的含义。 再一次，Yoda 问你是否已经知道这个词的意思。 如果您已经知道，请输入“是”。 如果您不知道，请输入“否”。 这可以帮助你跟踪你的进度。 使用以下命令来了解您的进度。

```
$ yoda vocabulary accuracy
```

此外，Yoda 可以帮助您做其他一些事情，比如找到单词的定义和创建插卡以轻松学习任何内容。 有关更多详细信息和可用选项列表，请参阅帮助部分。

```
$ yoda --help
```

更多好的东西来了。请继续关注!

干杯!

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/yoda-the-command-line-personal-assistant-for-your-linux-system/

作者：[SK][a]
译者：[amwps290](https://github.com/amwps290)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/betty-siri-like-commandline-virtual-assistant-linux/

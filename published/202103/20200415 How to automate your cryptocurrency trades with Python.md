[#]: collector: (lujun9972)
[#]: translator: (wyxplus)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13242-1.html)
[#]: subject: (How to automate your cryptocurrency trades with Python)
[#]: via: (https://opensource.com/article/20/4/python-crypto-trading-bot)
[#]: author: (Stephan Avenwedde https://opensource.com/users/hansic99)


如何使用 Python 来自动交易加密货币
======

> 在本教程中，教你如何设置和使用 Pythonic 来编程。它是一个图形化编程工具，用户可以很容易地使用现成的函数模块创建 Python 程序。

![](https://img.linux.net.cn/data/attachment/album/202103/28/093858qu0bh3w2sd3rh20s.jpg)

然而，不像纽约证券交易所这样的传统证券交易所一样，有一段固定的交易时间。对于加密货币而言，则是 7×24 小时交易，这使得任何人都无法独自盯着市场。

在以前，我经常思考与加密货币交易相关的问题：

- 一夜之间发生了什么？
- 为什么没有日志记录？
- 为什么下单？
- 为什么不下单？

通常的解决手段是使用加密交易机器人，当在你做其他事情时，例如睡觉、与家人在一起或享受空闲时光，代替你下单。虽然有很多商业解决方案可用，但是我选择开源的解决方案，因此我编写了加密交易机器人 [Pythonic][2]。 正如去年 [我写过的文章][3] 一样，“Pythonic 是一种图形化编程工具，它让用户可以轻松使用现成的函数模块来创建 Python 应用程序。” 最初它是作为加密货币机器人使用，并具有可扩展的日志记录引擎以及经过精心测试的可重用部件，例如调度器和计时器。

### 开始

本教程将教你如何开始使用 Pythonic 进行自动交易。我选择 <ruby>[币安][6]<rt>Binance</rt></ruby> 交易所的 <ruby>[波场][4]<rt>Tron</rt></ruby> 与 <ruby>[比特币][3]<rt>Bitcoin</rt></ruby> 交易对为例。我之所以选择这个加密货币对，是因为它们彼此之间的波动性大，而不是出于个人喜好。

机器人将根据 <ruby>[指数移动平均][7]<rt>exponential moving averages</rt></ruby> （EMA）来做出决策。

![TRX/BTC 1-hour candle chart][8]

*TRX/BTC 1 小时 K 线图*

EMA 指标通常是一个加权的移动平均线，可以对近期价格数据赋予更多权重。尽管移动平均线可能只是一个简单的指标，但我对它很有经验。

上图中的紫色线显示了 EMA-25 指标（这表示要考虑最近的 25 个值）。

机器人监视当前的 EMA-25 值（t0）和前一个 EMA-25 值（t-1）之间的差距。如果差值超过某个值，则表示价格上涨，机器人将下达购买订单。如果差值低于某个值，则机器人将下达卖单。

差值将是做出交易决策的主要指标。在本教程中，它称为交易参数。

### 工具链

将在本教程使用如下工具：

- 币安专业交易视图（已经有其他人做了数据可视化，所以不需要重复造轮子）
- Jupyter 笔记本：用于数据科学任务
- Pythonic：作为整体框架
- PythonicDaemon ：作为终端运行（仅适用于控制台和 Linux）

### 数据挖掘

为了使加密货币交易机器人尽可能做出正确的决定，以可靠的方式获取资产的<ruby>美国线<rt>open-high-low-close chart</rt></ruby>（[OHLC][9]）数据是至关重要。你可以使用 Pythonic 的内置元素，还可以根据自己逻辑来对其进行扩展。

一般的工作流程：

1. 与币安时间同步
2. 下载 OHLC 数据
3. 从文件中把 OHLC 数据加载到内存
4. 比较数据集并扩展更新数据集

这个工作流程可能有点夸张，但是它能使得程序更加健壮，甚至在停机和断开连接时，也能平稳运行。

一开始，你需要 <ruby>**币安 OHLC 查询**<rt>Binance OHLC Query</rt></ruby> 元素和一个 <ruby>**基础操作**<rt>Basic Operation</rt></ruby> 元素来执行你的代码。

![Data-mining workflow][10]

*数据挖掘工作流程*

OHLC 查询设置为每隔一小时查询一次 **TRXBTC** 资产对（波场/比特币）。

![Configuration of the OHLC query element][11]

*配置 OHLC 查询元素*

其中输出的元素是 [Pandas DataFrame][12]。你可以在 **基础操作** 元素中使用 <ruby>**输入**<rt>input</rt></ruby> 变量来访问 DataFrame。其中，将 Vim 设置为 **基础操作** 元素的默认代码编辑器。

![Basic Operation element set up to use Vim][13]

*使用 Vim 编辑基础操作元素*

具体代码如下：

```
import pickle, pathlib, os
import pandas as pd

outout = None

if isinstance(input, pd.DataFrame):
    file_name = 'TRXBTC_1h.bin'
    home_path = str(pathlib.Path.home())
    data_path = os.path.join(home_path, file_name)

    try:
        df = pickle.load(open(data_path, 'rb'))
        n_row_cnt = df.shape[0]
        df = pd.concat([df,input], ignore_index=True).drop_duplicates(['close_time'])
        df.reset_index(drop=True, inplace=True)
        n_new_rows = df.shape[0] - n_row_cnt
        log_txt = '{}: {} new rows written'.format(file_name, n_new_rows)
    except:
        log_txt = 'File error - writing new one: {}'.format(e)
        df = input

    pickle.dump(df, open(data_path, "wb" ))
    output = df
```

首先，检查输入是否为 DataFrame 元素。然后在用户的家目录（`~/`）中查找名为 `TRXBTC_1h.bin` 的文件。如果存在，则将其打开，执行新代码段（`try` 部分中的代码），并删除重复项。如果文件不存在，则触发异常并执行 `except` 部分中的代码，创建一个新文件。

只要启用了复选框 <ruby>**日志输出**<rt>log output</rt></ruby>，你就可以使用命令行工具 `tail` 查看日志记录：


```
$ tail -f ~/Pythonic_2020/Feb/log_2020_02_19.txt
```

出于开发目的，现在跳过与币安时间的同步和计划执行，这将在下面实现。

### 准备数据

下一步是在单独的 <ruby>网格<rt>Grid</rt></ruby> 中处理评估逻辑。因此，你必须借助<ruby>**返回元素**<rt>Return element</rt></ruby> 将 DataFrame 从网格 1 传递到网格 2 的第一个元素。

在网格 2 中，通过使 DataFrame 通过 <ruby>**基础技术分析**<rt>Basic Technical Analysis</rt></ruby> 元素，将 DataFrame 扩展包含 EMA 值的一列。

![Technical analysis workflow in Grid 2][14]

*在网格 2 中技术分析工作流程*

配置技术分析元素以计算 25 个值的 EMA。

![Configuration of the technical analysis element][15]

*配置技术分析元素*

当你运行整个程序并开启 <ruby>**技术分析**<rt>Technical Analysis</rt></ruby> 元素的调试输出时，你将发现 EMA-25 列的值似乎都相同。

![Missing decimal places in output][16]

*输出中精度不够*

这是因为调试输出中的 EMA-25 值仅包含六位小数，即使输出保留了 8 个字节完整精度的浮点值。

为了能进行进一步处理，请添加 **基础操作** 元素：

![Workflow in Grid 2][17]

*网格 2 中的工作流程*

使用 **基础操作** 元素，将 DataFrame 与添加的 EMA-25 列一起转储，以便可以将其加载到 Jupyter 笔记本中；

![Dump extended DataFrame to file][18]

*将扩展后的 DataFrame 存储到文件中*

### 评估策略

在 Juypter 笔记本中开发评估策略，让你可以更直接地访问代码。要加载 DataFrame，你需要使用如下代码：

![Representation with all decimal places][19]

*用全部小数位表示*

你可以使用 [iloc][20] 和列名来访问最新的 EMA-25 值，并且会保留所有小数位。

你已经知道如何来获得最新的数据。上面示例的最后一行仅显示该值。为了能将该值拷贝到不同的变量中，你必须使用如下图所示的 `.at` 方法方能成功。

你也可以直接计算出你下一步所需的交易参数。

![Buy/sell decision][21]

*买卖决策*

### 确定交易参数

如上面代码所示，我选择 0.009 作为交易参数。但是我怎么知道 0.009 是决定交易的一个好参数呢？ 实际上，这个参数确实很糟糕，因此，你可以直接计算出表现最佳的交易参数。

假设你将根据收盘价进行买卖。

![Validation function][22]

*回测功能*

在此示例中，`buy_factor` 和 `sell_factor` 是预先定义好的。因此，发散思维用直接计算出表现最佳的参数。

![Nested for loops for determining the buy and sell factor][23]

*嵌套的 for 循环，用于确定购买和出售的参数*

这要跑 81 个循环（9x9），在我的机器（Core i7 267QM）上花费了几分钟。

![System utilization while brute forcing][24]

*在暴力运算时系统的利用率*

在每个循环之后，它将 `buy_factor`、`sell_factor` 元组和生成的 `profit` 元组追加到 `trading_factors` 列表中。按利润降序对列表进行排序。

![Sort profit with related trading factors in descending order][25]

*将利润与相关的交易参数按降序排序*

当你打印出列表时，你会看到 0.002 是最好的参数。

![Sorted list of trading factors and profit][26]

*交易要素和收益的有序列表*

当我在 2020 年 3 月写下这篇文章时，价格的波动还不足以呈现出更理想的结果。我在 2 月份得到了更好的结果，但即使在那个时候，表现最好的交易参数也在 0.002 左右。

### 分割执行路径

现在开始新建一个网格以保持逻辑清晰。使用 **返回** 元素将带有 EMA-25 列的 DataFrame 从网格 2 传递到网格 3 的 0A 元素。

在网格 3 中，添加 **基础操作** 元素以执行评估逻辑。这是该元素中的代码：

![Implemented evaluation logic][27]

*实现评估策略*

如果输出 `1` 表示你应该购买，如果输出 `2` 则表示你应该卖出。 输出 `0` 表示现在无需操作。使用 <ruby>**分支**<rt>Branch</rt></ruby> 元素来控制执行路径。

![Branch element: Grid 3 Position 2A][28]

*分支元素：网格 3，2A 位置*

因为 `0` 和 `-1` 的处理流程一样，所以你需要在最右边添加一个分支元素来判断你是否应该卖出。

![Branch element: Grid 3 Position 3B][29]

*分支元素：网格 3，3B 位置*

网格 3 应该现在如下图所示：

![Workflow on Grid 3][30]

*网格 3 的工作流程*

### 下单

由于无需在一个周期中购买两次，因此必须在周期之间保留一个持久变量，以指示你是否已经购买。

你可以利用 <ruby>**栈**<rt>Stack</rt></ruby> 元素来实现。顾名思义，栈元素表示可以用任何 Python 数据类型来放入的基于文件的栈。

你需要定义栈仅包含一个布尔类型，该布尔类型决定是否购买了（`True`）或（`False`）。因此，你必须使用 `False` 来初始化栈。例如，你可以在网格 4 中简单地通过将 `False` 传递给栈来进行设置。

![Forward a False-variable to the subsequent Stack element][31]

*将 False 变量传输到后续的栈元素中*

在分支树后的栈实例可以进行如下配置：

![Configuration of the Stack element][32]

*设置栈元素*

在栈元素设置中，将 <ruby>对输入的操作<rt>Do this with input</rt></ruby> 设置成 <ruby>无<rt>Nothing</rt></ruby>。否则，布尔值将被 `1` 或 `0` 覆盖。

该设置确保仅将一个值保存于栈中（`True` 或 `False`），并且只能读取一个值（为了清楚起见）。

在栈元素之后，你需要另外一个 **分支** 元素来判断栈的值，然后再放置 <ruby>币安订单<rt>Binance Order</rt></ruby> 元素。

![Evaluate the variable from the stack][33]

*判断栈中的变量*

将币安订单元素添加到分支元素的 `True` 路径。网格 3 上的工作流现在应如下所示：

![Workflow on Grid 3][34]

*网格 3 的工作流程*

币安订单元素应如下配置：

![Configuration of the Binance Order element][35]

*编辑币安订单元素*

你可以在币安网站上的帐户设置中生成 API 和密钥。

![Creating an API key in Binance][36]

*在币安账户设置中创建一个 API 密钥*

在本文中，每笔交易都是作为市价交易执行的，交易量为 10,000 TRX（2020 年 3 月约为 150 美元）（出于教学的目的，我通过使用市价下单来演示整个过程。因此，我建议至少使用限价下单。）

如果未正确执行下单（例如，网络问题、资金不足或货币对不正确），则不会触发后续元素。因此，你可以假定如果触发了后续元素，则表示该订单已下达。

这是一个成功的 XMRBTC 卖单的输出示例：

![Output of a successfully placed sell order][37]

*成功卖单的输出*

该行为使后续步骤更加简单：你可以始终假设只要成功输出，就表示订单成功。因此，你可以添加一个 **基础操作** 元素，该元素将简单地输出 **True** 并将此值放入栈中以表示是否下单。

如果出现错误的话，你可以在日志信息中查看具体细节（如果启用日志功能）。

![Logging output of Binance Order element][38]

*币安订单元素中的输出日志信息*

### 调度和同步

对于日程调度和同步，请在网格 1 中将整个工作流程置于 <ruby>币安调度器<rt>Binance Scheduler</rt></ruby> 元素的前面。

![Binance Scheduler at Grid 1, Position 1A][39]

*在网格 1，1A 位置的币安调度器*

由于币安调度器元素只执行一次，因此请在网格 1 的末尾拆分执行路径，并通过将输出传递回币安调度器来强制让其重新同步。

![Grid 1: Split execution path][40]

*网格 1：拆分执行路径*

5A 元素指向 网格 2 的 1A 元素，并且 5B 元素指向网格 1 的 1A 元素（币安调度器）。

### 部署

你可以在本地计算机上全天候 7×24 小时运行整个程序，也可以将其完全托管在廉价的云系统上。例如，你可以使用 Linux/FreeBSD 云系统，每月约 5 美元，但通常不提供图形化界面。如果你想利用这些低成本的云，可以使用 PythonicDaemon，它能在终端中完全运行。

![PythonicDaemon console interface][41]

*PythonicDaemon 控制台*

PythonicDaemon 是基础程序的一部分。要使用它，请保存完整的工作流程，将其传输到远程运行的系统中（例如，通过<ruby>安全拷贝协议<rt>Secure Copy</rt></ruby> SCP），然后把工作流程文件作为参数来启动 PythonicDaemon：

```
$ PythonicDaemon trading_bot_one
```

为了能在系统启动时自启 PythonicDaemon，可以将一个条目添加到 crontab 中：

```
# crontab -e
```

![Crontab on Ubuntu Server][42]

*在 Ubuntu 服务器上的 Crontab*

### 下一步

正如我在一开始时所说的，本教程只是自动交易的入门。对交易机器人进行编程大约需要 10％ 的编程和 90％ 的测试。当涉及到让你的机器人用金钱交易时，你肯定会对编写的代码再三思考。因此，我建议你编码时要尽可能简单和易于理解。

如果你想自己继续开发交易机器人，接下来所需要做的事：

- 收益自动计算（希望你有正收益！）
- 计算你想买的价格
- 比较你的预订单（例如，订单是否填写完整？）

你可以从 [GitHub][2] 上获取完整代码。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/python-crypto-trading-bot

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[wyxplus](https://github.com/wyxplus)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hansic99
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/calculator_money_currency_financial_tool.jpg?itok=2QMa1y8c "scientific calculator"
[2]: https://github.com/hANSIc99/Pythonic
[3]: https://opensource.com/article/19/5/graphically-programming-pythonic
[4]: https://tron.network/
[5]: https://bitcoin.org/en/
[6]: https://www.binance.com/
[7]: https://www.investopedia.com/terms/e/ema.asp
[8]: https://opensource.com/sites/default/files/uploads/1_ema-25.png "TRX/BTC 1-hour candle chart"
[9]: https://en.wikipedia.org/wiki/Open-high-low-close_chart
[10]: https://opensource.com/sites/default/files/uploads/2_data-mining-workflow.png "Data-mining workflow"
[11]: https://opensource.com/sites/default/files/uploads/3_ohlc-query.png "Configuration of the OHLC query element"
[12]: https://pandas.pydata.org/pandas-docs/stable/getting_started/dsintro.html#dataframe
[13]: https://opensource.com/sites/default/files/uploads/4_edit-basic-operation.png "Basic Operation element set up to use Vim"
[14]: https://opensource.com/sites/default/files/uploads/6_grid2-workflow.png "Technical analysis workflow in Grid 2"
[15]: https://opensource.com/sites/default/files/uploads/7_technical-analysis-config.png "Configuration of the technical analysis element"
[16]: https://opensource.com/sites/default/files/uploads/8_missing-decimals.png "Missing decimal places in output"
[17]: https://opensource.com/sites/default/files/uploads/9_basic-operation-element.png "Workflow in Grid 2"
[18]: https://opensource.com/sites/default/files/uploads/10_dump-extended-dataframe.png "Dump extended DataFrame to file"
[19]: https://opensource.com/sites/default/files/uploads/11_load-dataframe-decimals.png "Representation with all decimal places"
[20]: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.iloc.html
[21]: https://opensource.com/sites/default/files/uploads/12_trade-factor-decision.png "Buy/sell decision"
[22]: https://opensource.com/sites/default/files/uploads/13_validation-function.png "Validation function"
[23]: https://opensource.com/sites/default/files/uploads/14_brute-force-tf.png "Nested for loops for determining the buy and sell factor"
[24]: https://opensource.com/sites/default/files/uploads/15_system-utilization.png "System utilization while brute forcing"
[25]: https://opensource.com/sites/default/files/uploads/16_sort-profit.png "Sort profit with related trading factors in descending order"
[26]: https://opensource.com/sites/default/files/uploads/17_sorted-trading-factors.png "Sorted list of trading factors and profit"
[27]: https://opensource.com/sites/default/files/uploads/18_implemented-evaluation-logic.png "Implemented evaluation logic"
[28]: https://opensource.com/sites/default/files/uploads/19_output.png "Branch element: Grid 3 Position 2A"
[29]: https://opensource.com/sites/default/files/uploads/20_editbranch.png "Branch element: Grid 3 Position 3B"
[30]: https://opensource.com/sites/default/files/uploads/21_grid3-workflow.png "Workflow on Grid 3"
[31]: https://opensource.com/sites/default/files/uploads/22_pass-false-to-stack.png "Forward a False-variable to the subsequent Stack element"
[32]: https://opensource.com/sites/default/files/uploads/23_stack-config.png "Configuration of the Stack element"
[33]: https://opensource.com/sites/default/files/uploads/24_evaluate-stack-value.png "Evaluate the variable from the stack"
[34]: https://opensource.com/sites/default/files/uploads/25_grid3-workflow.png "Workflow on Grid 3"
[35]: https://opensource.com/sites/default/files/uploads/26_binance-order.png "Configuration of the Binance Order element"
[36]: https://opensource.com/sites/default/files/uploads/27_api-key-binance.png "Creating an API key in Binance"
[37]: https://opensource.com/sites/default/files/uploads/28_sell-order.png "Output of a successfully placed sell order"
[38]: https://opensource.com/sites/default/files/uploads/29_binance-order-output.png "Logging output of Binance Order element"
[39]: https://opensource.com/sites/default/files/uploads/30_binance-scheduler.png "Binance Scheduler at Grid 1, Position 1A"
[40]: https://opensource.com/sites/default/files/uploads/31_split-execution-path.png "Grid 1: Split execution path"
[41]: https://opensource.com/sites/default/files/uploads/32_pythonic-daemon.png "PythonicDaemon console interface"
[42]: https://opensource.com/sites/default/files/uploads/33_crontab.png "Crontab on Ubuntu Server"

[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12333-1.html)
[#]: subject: (Using pandas to plot data in Python)
[#]: via: (https://opensource.com/article/20/6/pandas-python)
[#]: author: (Shaun Taylor-Morgan https://opensource.com/users/shaun-taylor-morgan)

使用 Pandas 在 Python 中绘制数据
======

> Pandas 是一个非常流行的 Python 数据操作库。学习怎样使用它的 API 绘制数据。

![](https://img.linux.net.cn/data/attachment/album/202006/19/231720ed0jd9s99h9cute7.jpg)

在有关基于 Python 的绘图库的系列文章中，我们将对使用 Pandas 这个非常流行的 Python 数据操作库进行绘图进行概念性的研究。Pandas 是 Python 中的标准工具，用于对进行数据可扩展的转换，它也已成为[从 CSV 和 Excel 格式导入和导出数据][2]的流行方法。

除此之外，它还包含一个非常好的绘图 API。这非常方便，你已将数据存储在 Pandas DataFrame 中，那么为什么不使用相同的库进行绘制呢？

在本系列中，我们将在每个库中制作相同的多条形柱状图，以便我们可以比较它们的工作方式。我们使用的数据是 1966 年至 2020 年的英国大选结果：

![Matplotlib UK election results][3]

### 自行绘制的数据

在继续之前，请注意你可能需要调整 Python 环境来运行此代码，包括：

* 运行最新版本的 Python（用于 [Linux][4]、[Mac][5] 和 [Windows][6] 的说明）
* 确认你运行的是与这些库兼容的 Python 版本

数据可在线获得，并可使用 Pandas 导入：

```
import pandas as pd
df = pd.read_csv('https://anvil.works/blog/img/plotting-in-python/uk-election-results.csv')
```

现在我们已经准备好了。在本系列文章中，我们已经看到了一些令人印象深刻的简单 API，但是 Pandas 一定能夺冠。

要在 x 轴上绘制按年份和每个党派分组的柱状图，我只需要这样做：

```
import matplotlib.pyplot as plt
ax = df.plot.bar(x='year')
plt.show()
```

只有四行，这绝对是我们在本系列中创建的最棒的多条形柱状图。

我以[宽格式][7]使用数据，这意味着每个党派都有一列：

```
        year  conservative  labour  liberal  others
0       1966           253     364       12       1
1       1970           330     287        6       7
2   Feb 1974           297     301       14      18
..       ...           ...     ...      ...     ...
12      2015           330     232        8      80
13      2017           317     262       12      59
14      2019           365     202       11      72
```

这意味着 Pandas 会自动知道我希望如何分组，如果我希望进行不同的分组，Pandas 可以很容易地[重组 DataFrame][8]。

与 [Seaborn][9] 一样，Pandas 的绘图功能是 Matplotlib 之上的抽象，这就是为什么要调用 Matplotlib 的 `plt.show()` 函数来实际生成绘图的原因。

看起来是这样的：

![pandas unstyled data plot][10]

看起来很棒，特别是它又这么简单！让我们对它进行样式设置，使其看起来像 [Matplotlib][11] 的例子。

#### 调整样式

我们可以通过访问底层的 Matplotlib 方法轻松地调整样式。

首先，我们可以通过将 Matplotlib 颜色表传递到绘图函数来为柱状图着色：

```
from matplotlib.colors import ListedColormap
cmap = ListedColormap(['#0343df', '#e50000', '#ffff14', '#929591'])
ax = df.plot.bar(x='year', colormap=cmap)
```

我们可以使用绘图函数的返回值设置坐标轴标签和标题，它只是一个 [Matplotlib 的 Axis 对象][12]。

```
ax.set_xlabel(None)
ax.set_ylabel('Seats')
ax.set_title('UK election results')
```

这是现在的样子：

![pandas styled plot][13]

这与上面的 Matplotlib 版本几乎相同，但是只用了 8 行代码而不是 16 行！我内心的[代码高手][14]非常高兴。

### 抽象必须是可转义的

与 Seaborn 一样，向下访问 Matplotlib API 进行细节调整的能力确实很有帮助。这是给出抽象[紧急出口][15]使其既强大又简单的一个很好的例子。


--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/pandas-python

作者：[Shaun Taylor-Morgan][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/shaun-taylor-morgan
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/panda.png?itok=0lJlct7O (Two pandas sitting in bamboo)
[2]: https://anvil.works/docs/data-tables/csv-and-excel
[3]: https://opensource.com/sites/default/files/uploads/matplotlib_2.png (Matplotlib UK election results)
[4]: https://opensource.com/article/20/4/install-python-linux
[5]: https://opensource.com/article/19/5/python-3-default-mac
[6]: https://opensource.com/article/19/8/how-install-python-windows
[7]: https://anvil.works/blog/tidy-data
[8]: https://anvil.works/blog/tidy-data#converting-between-long-and-wide-data-in-pandas
[9]: https://anvil.works/blog/plotting-in-seaborn
[10]: https://opensource.com/sites/default/files/uploads/pandas-unstyled.png (pandas unstyled data plot)
[11]: https://opensource.com/article/20/5/matplotlib-python
[12]: https://matplotlib.org/api/axis_api.html#axis-objects
[13]: https://opensource.com/sites/default/files/uploads/pandas_3.png (pandas styled plot)
[14]: https://en.wikipedia.org/wiki/Code_golf
[15]: https://anvil.works/blog/escape-hatches-and-ejector-seats
[16]: https://anvil.works/blog/plotting-in-pandas
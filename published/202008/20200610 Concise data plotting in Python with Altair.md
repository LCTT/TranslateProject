[#]: collector: (lujun9972)
[#]: translator: (silentdawn-zz)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12493-1.html)
[#]: subject: (Concise data plotting in Python with Altair)
[#]: via: (https://opensource.com/article/20/6/altair-python)
[#]: author: (Shaun Taylor-Morgan https://opensource.com/users/shaun-taylor-morgan)

Python 下使用 Altair 数据制图
======

> Altair 作为一个 Python 数据制图库，提供了优雅的接口及自有的绘图语言。

![](https://img.linux.net.cn/data/attachment/album/202008/06/110441imrz9ajtpshtfq1i.jpg)

Python 中的 [绘图库][2] 提供了呈现数据的多种方式，可以满足你不同的偏好，如灵活性、布局、易用性，或者特殊的风格。

和其它方式相比，我发现，Altair 提供的是一种不同的解决方案，且总体而言使用起来更为简单。得益于声明式的绘图语言 [Vega][3]，Altair 拥有一套优雅的接口，可以直接定义要绘的图应该是什么样子，而不是通过写一大堆循环和条件判断去一步步构建。

### 绘图流程

我通过绘制同一个多柱状图比较了多个 Python 绘图库的差异。正式开始之前，你需要将你的 Python 环境调整到能运行下面代码的状态。具体就是：

* 安装最新版的 Python（ [Linux][4]、[Mac][5] 和 [Windows][6] 系统下的安装方法）
* 确认该版本 Python 可以运行本教程所使用的库

演示用数据可从网络下载，并且可以用 pandas 直接导入：

```
import pandas as pd
df = pd.read_csv('https://anvil.works/blog/img/plotting-in-python/uk-election-results.csv')
```

准备开始吧。为了做个比较，先看下面这个用 [Matplotlib][7] 做的图：

![Matplotlib UK election results][8]

使用 Matplotlib 需要 16 行代码，图柱的位置需要自己计算。

使用 Altair 绘制相似的图，代码如下：

```
    import altair as alt

    chart = alt.Chart(df).mark_bar().encode(
        x='party',
        y='seats',
        column='year',
        color='party',
    )

    chart.save('altair-elections.html')
```

真是简洁多了！与 [Seaborn][9] 类似，Altair 所用数据的组织形式是每个变量一列（即 [数据列][10] ）。这种方式下可以将每个变量映射到图的一个属性上 —— Altair 称之为“通道”。在上例中，我们期望每个 “党派” 在 `x` 轴上显示为一组图柱， 其 “席位” 显示在 `y` 轴，且将图柱按照 “年份” 分开为 “列”。我们还想根据 “党派” 给图柱使用不同的 “颜色”。用语言表述需求的话就是上面这个样子，而这也正是代码所要表述的！

现在把图画出来：

![Altair plot with default styling][11]

### 调整样式

这和我们期待的效果有点接近了。与 Matplotlib 方案相比，主要区别在于 Altair 方案中，每个 `year` 组显示的时候，内部之间都有个小空白 —— 这不是问题，这只是 Altair 多柱状图显示的一个特性。

所以说呢，还需要对显示样式再做一些改进。

#### 非整形数据

两个不是整数的年份名称（`Feb 1974` 和 `Oct 1974`）显示为 `NaN` 了。这可以通过将年份数值 `year` 转换为字符串来解决：


```
    df['year'] = df['year'].astype(str)
```

#### 指定数据排序方法

还需要让 Altair 知道如何对数据进行排序。Altair 允许通过传给它一个 `Column` 对象，来设定 `Column` 通道的更多细节。现在让 Altair 按照数据在数据集中出现的顺序排列：

```
    chart = alt.Chart(df).mark_bar().encode(
        # ...
        column=alt.Column('year', sort=list(df['year']), title=None),
        # ...
    )
```

#### 移除坐标轴标签

我们通过设置 `title=None` 移除了图顶的 "year" 标签。下面再一处每列数据的 "party" 标签：


```
    chart = alt.Chart(df).mark_bar().encode(
        x=alt.X('party', title=None),
        # ...
    )
```

#### 指定颜色图

最后，我们还想自己指定图柱的颜色。Altair 允许建立 `domain` 中数值与 `range` 中颜色的映射来实现所需功能，太贴心了：

```
    cmap = {
        'Conservative': '#0343df',
        'Labour': '#e50000',
        'Liberal': '#ffff14',
        'Others': '#929591',
    }

    chart = alt.Chart(df).mark_bar().encode(
        # ...
        color=alt.Color('party', scale=alt.Scale(domain=list(cmap.keys()), range=list(cmap.values())))
    )
```

#### 样式调整后的最终代码

应用上述样式调整之后，代码看起来不那么悦目了，但我们仍然是用声明的方式实现的，这正是 Altair 如此有弹性的原因所在。实现过程中，仍然是使用的异于显示数据的独立变量来分离图中不同属性的，而不是像在 Matplotlib 中那样直接对显示数据做复杂的操作。唯一的不同是，我们的变量名字封装在类似 `alt.X()` 的对象中，从而实现对显示效果的控制：

```
    import altair as alt
    from votes import long as df

    cmap = {
        'Conservative': '#0343df',
        'Labour': '#e50000',
        'Liberal': '#ffff14',
        'Others': '#929591',
    }

    df['year'] = df['year'].astype(str)

    # We're still assigning, e.g. 'party' to x, but now we've wrapped it
    # in alt.X in order to specify its styling
    chart = alt.Chart(df).mark_bar().encode(
        x=alt.X('party', title=None),
        y='seats',
        column=alt.Column('year', sort=list(df['year']), title=None),
        color=alt.Color('party', scale=alt.Scale(domain=list(cmap.keys()), range=list(cmap.values())))
    )

    chart.save('altair-elections.html')
```

现在与 Matplotlib 方案扯平了，代码数量达到了 16 行！

下图是使用我们的样式调整方案之后的 Altair 效果图：

![The Altair plot with our custom styling][12]

### 结论

尽管在代码数量上，使用 Altair 绘图没有表现出优势，但它的声明式绘图语言使得对图层的操控更为精密，这是我比较欣赏的。Altair 还提供了清晰而独立的方式来调校显示样式，这使得 相关代码与绘图的代码块分离开来。Altair 确实是使用 Python 绘图时又一个很棒的工具库。

本文首次发布于 [这里][13]，蒙允编辑后再次发布。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/altair-python

作者：[Shaun Taylor-Morgan][a]
选题：[lujun9972][b]
译者：[silentdawn-zz](https://github.com/silentdawn-zz)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/shaun-taylor-morgan
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_data_dashboard_system_computer_analytics.png?itok=oxAeIEI- (metrics and data shown on a computer screen)
[2]: https://linux.cn/article-12327-1.html
[3]: https://vega.github.io/vega/
[4]: https://opensource.com/article/20/4/install-python-linux
[5]: https://opensource.com/article/19/5/python-3-default-mac
[6]: https://opensource.com/article/19/8/how-install-python-windows
[7]: https://opensource.com/article/20/5/matplotlib-python
[8]: https://opensource.com/sites/default/files/uploads/matplotlib_1_1.png (Matplotlib UK election results)
[9]: https://anvil.works/blog/plotting-in-seaborn
[10]: https://anvil.works/blog/tidy-data
[11]: https://opensource.com/sites/default/files/uploads/altair-first-try.png (Altair plot with default styling)
[12]: https://opensource.com/sites/default/files/uploads/altair_3.png (The Altair plot with our custom styling.)
[13]: https://anvil.works/blog/plotting-in-altair

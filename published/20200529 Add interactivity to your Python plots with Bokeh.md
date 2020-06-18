[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12329-1.html)
[#]: subject: (Add interactivity to your Python plots with Bokeh)
[#]: via: (https://opensource.com/article/20/5/bokeh-python)
[#]: author: (Shaun Taylor-Morgan https://opensource.com/users/shaun-taylor-morgan)

使用 Bokeh 为你的 Python 绘图添加交互性
======

> 在 Bokeh 中绘图比其他一些绘图库要复杂一些，但付出额外的努力是有回报的。

![](https://img.linux.net.cn/data/attachment/album/202006/18/164708zz7tjxz7m7ax5lt3.jpg)

在这一系列文章中，我通过在每个 Python 绘图库中制作相同的多条形绘图，来研究不同 Python 绘图库的特性。这次我重点介绍的是 [Bokeh][2]（读作 “BOE-kay”）。

Bokeh 中的绘图比[其它一些绘图库][3]要复杂一些，但付出的额外努力是有回报的。Bokeh 的设计既允许你在 Web 上创建自己的交互式绘图，又能让你详细控制交互性如何工作。我将通过给我在这个系列中一直使用的多条形图添加工具提示来展示这一点。它绘制了 1966 年到 2020 年之间英国选举结果的数据。

![][4]

*绘图的放大视图（©2019 年 [Anvil][5]）*

### 制作多条形图

在我们继续之前，请注意你可能需要调整你的 Python 环境来让这段代码运行，包括以下：

- 运行最新版本的 Python （在 [Linux][11]、[Mac][12] 和 [Windows][13] 上的说明）
- 确认你运行的 Python 版本能与这些库一起工作。

数据可在线获得，可以用 Pandas 导入。

```
import pandas as pd
df = pd.read_csv('https://anvil.works/blog/img/plotting-in-python/uk-election-results.csv')
```

现在我们可以继续进行了。

为了做出多条形图，你需要对你的数据进行一下调整。

原始数据是这样的：

```
>> print(long)
        year         party  seats
0       1966  Conservative    253
1       1970  Conservative    330
2   Feb 1974  Conservative    297
3   Oct 1974  Conservative    277
4       1979  Conservative    339
..       ...           ...    ...
103     2005        Others     30
104     2010        Others     29
105     2015        Others     80
106     2017        Others     59
107     2019        Others     72

[60 rows x 3 columns]
```

你可以把数据看成是每一个可能的 `(year, party)` 组合的一系列 `seats` 值。这正是 Bokeh 处理的方式。你需要做一个 `(year, party)` 元组的列表：

```
# 得到每种可能的 (year, party) 组合的元组
x = [(str(r[1]['year']), r[1]['party']) for r in df.iterrows()]
   
# This comes out as [('1922', 'Conservative'), ('1923', 'Conservative'), ... ('2019', 'Others')]
```

这些将是 `x` 值。`y` 值就是席位（`seats`）。

```
y = df['seats']
```

现在你的数据看起来应该像这样：

```
x                               y
('1966', 'Conservative')        253
('1970', 'Conservative')        330
('Feb 1974', 'Conservative')    297
('Oct 1974', 'Conservative')    277
('1979', 'Conservative')        339
 ...      ...                   ...
('2005', 'Others')              30
('2010', 'Others')              29
('2015', 'Others')              80
('2017', 'Others')              59
('2019', 'Others')              72
```

Bokeh 需要你将数据封装在它提供的一些对象中，这样它就能给你提供交互功能。将你的 `x` 和 `y` 数据结构封装在一个 `ColumnDataSource` 对象中。

```
    from bokeh.models import ColumnDataSource

    source = ColumnDataSource(data={'x': x, 'y': y})
```

然后构造一个 `Figure` 对象，并传入你用 `FactorRange` 对象封装的 `x` 数据。

```
    from bokeh.plotting import figure
    from bokeh.models import FactorRange
   
    p = figure(x_range=FactorRange(*x), width=2000, title="Election results")
```

你需要让 Bokeh 创建一个颜色表，这是一个特殊的 `DataSpec` 字典，它根据你给它的颜色映射生成。在这种情况下，颜色表是一个简单的党派名称和一个十六进制值之间的映射。

```
    from bokeh.transform import factor_cmap

    cmap = {
        'Conservative': '#0343df',
        'Labour': '#e50000',
        'Liberal': '#ffff14',
        'Others': '#929591',
    }
    fill_color = factor_cmap('x', palette=list(cmap.values()), factors=list(cmap.keys()), start=1, end=2)
```

现在你可以创建条形图了：

```
    p.vbar(x='x', top='y', width=0.9, source=source, fill_color=fill_color, line_color=fill_color)
```

Bokeh 图表上数据的可视化形式被称为“<ruby>字形<rt>glyphs</rt></ruby>”，因此你已经创建了一组条形字形。

调整图表的细节，让它看起来像你想要的样子。

```
    p.y_range.start = 0
    p.x_range.range_padding = 0.1
    p.yaxis.axis_label = 'Seats'
    p.xaxis.major_label_orientation = 1
    p.xgrid.grid_line_color = None
```

最后，告诉 Bokeh 你现在想看你的绘图：

```
   from bokeh.io import show

   show(p)
```

这将绘图写入一个 HTML 文件，并在默认的 Web 浏览器中打开它。如下结果：

![][6]

*Bokeh 中的多条形绘图（©2019年[Anvil][5]）*

它已经有了一些互动功能，比如盒子缩放。

![][7] 。

*Bokeh 内置的盒子缩放（©2019[Anvil][5]）*

但 Bokeh 的厉害之处在于你可以添加自己的交互性。在下一节中，我们通过在条形图中添加工具提示来探索这个问题。

### 给条形图添加工具提示

要在条形图上添加工具提示，你只需要创建一个 `HoverTool` 对象并将其添加到你的绘图中。

```
    h = HoverTool(tooltips=[
        ('Seats', '@y'),
        ('(Year, Party)', '(@x)')
    ])
    p.add_tools(h)
```

参数定义了哪些数据会显示在工具提示上。变量 `@y` 和 `@x` 是指你传入 `ColumnDataSource` 的变量。你还可以使用一些其他的值。例如，光标在图上的位置由 `$x` 和 `$y` 给出（与 `@x` 和 `@y` 没有关系）。

下面是结果：

![][8]

*选举图，现在带有工具提示（© 2019 [Anvil][5]）*

借助 Bokeh 的 HTML 输出，将绘图嵌入到 Web 应用中时，你可以获得完整的交互体验。你可以在[这里][9]把这个例子复制为 Anvil 应用（注：Anvil 需要注册才能使用）。

现在，你可以看到付出额外努力在 Bokeh 中将所有数据封装在 `ColumnDataSource` 等对象的原因了。作为回报，你可以相对轻松地添加交互性。

### 回归简单：Altair

Bokeh 是四大最流行的绘图库之一，本系列将研究[它们各自的特别之处][3]。

我也在研究几个因其有趣的方法而脱颖而出的库。接下来，我将看看 [Altair][10]，它的声明式 API 意味着它可以做出非常复杂的绘图，而不会让你头疼。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/bokeh-python

作者：[Shaun Taylor-Morgan][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/shaun-taylor-morgan
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/python-programming-code-keyboard.png?itok=fxiSpmnd (Hands on a keyboard with a Python book )
[2]: https://bokeh.org/
[3]: https://linux.cn/article-12327-1.html
[4]: https://opensource.com/sites/default/files/uploads/bokeh-closeup.png (A zoomed-in view on the plot)
[5]: https://anvil.works/blog/plotting-in-bokeh
[6]: https://opensource.com/sites/default/files/uploads/bokeh_0.png (A multi-bar plot in Bokeh)
[7]: https://opensource.com/sites/default/files/uploads/bokeh-box-zoom.gif (Bokeh's built-in box zoom)
[8]: https://opensource.com/sites/default/files/uploads/bokeh-tooltips.gif (The election graph, now with tooltips)
[9]: https://anvil.works/build#clone:CFRUWSM6PQ6JUUXH%3dSX4SACDSXBB4UOIVEVPWXH55%7cMYTOLCU2HM5WKJYM%3d6VJKGRSF74TCCVDG5CTVDOCS
[10]: https://altair-viz.github.io/
[11]: https://opensource.com/article/20/4/install-python-linux
[12]: https://opensource.com/article/19/5/python-3-default-mac
[13]: https://opensource.com/article/19/8/how-install-python-windows
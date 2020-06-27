[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12356-1.html)
[#]: subject: (Simplify data visualization in Python with Plotly)
[#]: via: (https://opensource.com/article/20/5/plotly-python)
[#]: author: (Shaun Taylor-Morgan https://opensource.com/users/shaun-taylor-morgan)

使用 Plotly 来简化 Python 中的数据可视化
======

> Plotly 是一个数据绘图库，具有整洁的接口，它旨在允许你构建自己的 API。

![](https://img.linux.net.cn/data/attachment/album/202006/27/215314y0rkrz0e9zw7wd2o.jpg)

Plotly 是一个绘图生态系统，可以让你在 [Python][2] 以及 JavaScript 和 R 中进行绘图。在本文中，我将重点介绍[使用 Python 库进行绘图][3]。

Plotly 有三种不同的 Python API，你可以选择不同的方法来使用它：

  * 类似于 Matplotlib 的面向对象的 API
  * 数据驱动的 API，通过构造类似 JSON 的数据结构来定义绘图
  * 类似于 Seaborn 的高级绘图接口，称为 “Plotly Express” API

我将通过使用每个 API 来绘制相同的图来探索它们：英国大选结果的分组柱状图。

在我们进一步探讨之前，请注意，你可能需要调整你的 Python 环境来让这段代码运行，包括以下内容：

- 运行最新版本的Python（[Linux][4]、[Mac][5] 和 [Windows][6] 的说明）
- 确认你运行的 Python 版本能与这些库一起工作

数据可在线获得，可以用 Pandas 导入。

```
import pandas as pd
df = pd.read_csv('https://anvil.works/blog/img/plotting-in-python/uk-election-results.csv')
```

现在我们可以继续进行了。

### 使用图对象来绘制图

Plotly 面向对象的 API 被称为 `graph_objects`，它有点类似于 [Matplotlib 的面向对象 API][7]。

要创建一个柱状图，你可以构造一个包含四个柱状图的对象：

```
# 导入 Plotly 和数据
import plotly.graph_objects as go
from votes import wide as df

# 得到 x 列表
years = df['year']
x = list(range(len(years)))

# 定义绘图
bar_plots = [
  go.Bar(x=x, y=df['conservative'], name='Conservative', marker=go.bar.Marker(color='#0343df')),
  go.Bar(x=x, y=df['labour'], name='Labour', marker=go.bar.Marker(color='#e50000')),
  go.Bar(x=x, y=df['liberal'], name='Liberal', marker=go.bar.Marker(color='#ffff14')),
  go.Bar(x=x, y=df['others'], name='Others', marker=go.bar.Marker(color='#929591')),
]

# 指定样式
layout = go.Layout(
  title=go.layout.Title(text="Election results", x=0.5),
  yaxis_title="Seats",
  xaxis_tickmode="array",
  xaxis_tickvals=list(range(27)),
  xaxis_ticktext=tuple(df['year'].values),
)
   
# 绘制柱状图
fig = go.Figure(data=bar_plots, layout=layout)

# 告诉 Plotly 去渲染
fig.show()
```

与 Matplotlib 不同的是，你无需手动计算柱状图的 `x` 轴位置，Plotly 会帮你适配。

最终结果图：

![A multi-bar plot made using Graph Objects][8]

*A multi-bar plot made using Graph Objects (© 2019 [Anvil][9])*

### 使用 Python 数据结构来绘图

你还可以使用 Python 基本数据结构来定义绘图，它与面对对象 API 具有相同的结构。这直接对应于 Plotly 的 JavaScript 实现的 JSON API。

```
# 定义绘图数据
fig = {
    'data': [
        {'type': 'bar', 'x': x, 'y': df['conservative'], 'name': 'Conservative', 'marker': {'color': '#0343df'}},
        {'type': 'bar', 'x': x, 'y': df['labour'], 'name': 'Labour', 'marker': {'color': '#e50000'}},
        {'type': 'bar', 'x': x, 'y': df['liberal'], 'name': 'Liberal', 'marker': {'color': '#ffff14'}},
        {'type': 'bar', 'x': x, 'y': df['others'], 'name': 'Others', 'marker': {'color': '#929591'}},
    ],
    'layout': {
        'title': {'text': 'Election results', 'x': 0.5},
        'yaxis': {'title': 'Seats'},
        'xaxis': {
            'tickmode': 'array',
            'tickvals': list(range(27)),
            'ticktext': tuple(df['year'].values),
        }
    }
}

# 告诉 Plotly 去渲染它
pio.show(fig)
```

最终结果与上次完全相同：

![A multi-bar plot made using JSON-like data structures][10]

*A multi-bar plot made using JSON-like data structures (© 2019 [Anvil][9])*

#### 使用 Plotly Express 进行绘图

[Plotly Express][11] 是对图对象进行封装的高级 API。

你可以使用一行代码来绘制柱状图：

```
# 导入 Plotly 和数据
import plotly.express as px
from votes import long as df

# 定义颜色字典获得自定义栏颜色
cmap = {
    'Conservative': '#0343df',
    'Labour': '#e50000',
    'Liberal': '#ffff14',
    'Others': '#929591',
}

# 生成图
fig = px.bar(df, x="year", y="seats", color="party", barmode="group", color_discrete_map=cmap)
```

这里使用了<ruby>[长表][12]<rt>Long Form</rt></ruby> 数据，也称为“整洁数据”。这些列代表年份、政党和席位，而不是按政党划分。这与在 [Seaborn][13] 中制作柱状图非常相似。

```
>> print(long)
     year         party  seats
0    1922  Conservative    344
1    1923  Conservative    258
2    1924  Conservative    412
3    1929  Conservative    260
4    1931  Conservative    470
..    ...           ...    ...
103  2005        Others     30
104  2010        Others     29
105  2015        Others     80
106  2017        Others     59
107  2019        Others     72

[108 rows x 3 columns]
```

你可以访问底层的图对象 API 进行详细调整。如添加标题和 `y` 轴标签：

```
# 使用图对象 API 来调整绘图
import plotly.graph_objects as go
fig.layout = go.Layout(
    title=go.layout.Title(text="Election results", x=0.5),
    yaxis_title="Seats",
)
```

最后，让 Plotly 渲染：

```
fig.show()
```

这将在未使用的端口上运行一个临时 Web 服务器，并打开默认的 Web 浏览器来查看图像（Web 服务器将会马上被关闭）。

不幸的是，结果并不完美。`x` 轴被视为整数，因此两组之间的距离很远且很小，这使得我们很难看到趋势。

![使用 Plotly Express 制作的柱状图][14]

*A multi-bar plot made using Plotly Express (© 2019 [Anvil][9])*

你可能会尝试通过将 `x` 值转换为字符串来使 Plotly Express 将其视为字符串，这样它就会以均匀的间隔和词法顺序来绘制。不幸的是，它们的间隔还是很大，像在 `graph_objects`中那样设置 `xaxis_tickvals` 也不行。

与 [Seaborn][13] 中的类似示例不同，在这种情况下，抽象似乎没有提供足够的[应急方案][15]来提供你想要的东西，但是也许你可以编写*自己*的 API？

### 构建自己的 Plotly API

对 Plotly 的操作方式不满意？那就构建自己的 Plotly API！

Plotly 的核心是一个 JavaScript 库，它使用 [D3][16] 和  [stack.gl][17] 进行绘图。JavaScript 库的接口使用指定的 JSON 结构来绘图。因此，你只需要输出 JavaScript 库喜欢使用的 JSON 结构就好了。

Anvil 这样做是为了创建一个完全在浏览器中工作的 Python Plotly API。

![Ployly 使用 JavaScript 库创建图形，由其它语言库通过 JSON 使用][18]

*Plotly uses a JavaScript library to create plots, driven by libraries in other languages via JSON (© 2019 [Anvil][9])*

在 Anvil 版本中，你可以同时使用图对象 API 和上面介绍的 Python 数据结构方法。运行完全相同的命令，将数据和布局分配给 Anvil 应用程序中的 [Plot 组件][19]。

这是用 Anvil 的客户端 Python API 绘制的多列柱状图：

```
# 导入 Anvil 库
from ._anvil_designer import EntrypointTemplate
from anvil import *
import anvil.server

# 导入客户端 Plotly
import plotly.graph_objs as go

# 这是一个 Anvil 表单
class Entrypoint(EntrypointTemplate):
  def __init__(self, **properties):
    # Set Form properties and Data Bindings.
    self.init_components(**properties)

    # 从服务器获取数据
    data = anvil.server.call('get_election_data')
   
    # 获取一个方便的 x 值列表
    years = data['year']
    x = list(range(len(years)))

    # 定义绘图
    bar_plots = [
      go.Bar(x=x, y=data['conservative'], name='Conservative', marker=go.Marker(color='#0343df')),
      go.Bar(x=x, y=data['labour'], name='Labour', marker=go.Marker(color='#e50000')),
      go.Bar(x=x, y=data['liberal'], name='Liberal', marker=go.Marker(color='#ffff14')),
      go.Bar(x=x, y=data['others'], name='Others', marker=go.Marker(color='#929591')),
    ]
    # 规定布局
    layout = {
      'title': 'Election results',
      'yaxis': {'title': 'Seats'},
      'xaxis': {
        'tickmode': 'array',
        'tickvals': list(range(27)),
        'ticktext': data['year'],
      },
    }

    # 生成多列柱状图
    self.plot_1.data = bar_plots
    self.plot_1.layout = layout
```

绘图逻辑与上面相同，但是它完全在 Web 浏览器中运行，绘图是由用户计算机上的 Plotly JavaScript 库完成的！与本系列的所有其它 [Python 绘图库][3]相比，这是一个很大的优势。因为其它 Python 库都需要在服务器上运行。

这是在 Anvil 应用中运行的交互式 Plotly 图：

![The election plot on the web using Anvil's client-side-Python Plotly library][20]

*The election plot on the web using Anvil's [client-side-Python][21] Plotly library (© 2019 [Anvil][9])*

你可以[复制此示例][22]作为一个 Anvil 应用程序（注意：Anvil 需要注册才能使用）。

在前端运行 Plotly 还有另一个优势：它为自定义交互行为提供了更多选项。

### 在 Plotly 中自定义交互

Plotly 绘图不仅是动态的，你可以自定义它们的互动行为。例如，你可以在每个柱状图中使用 `hovertemplate` 自定义工具提示的格式：

```
    go.Bar(
      x=x,
      y=df['others'],
      name='others',
      marker=go.bar.Marker(color='#929591'),
      hovertemplate='Seats: <b>%{y}</b>',
    ),
```

当你把这个应用到每个柱状图时，你会看到以下结果：

![A multi-bar plot with custom tool-tips][23]

*A multi-bar plot with custom tool-tips (© 2019 [Anvil][9])*

这很有用，当你想要在某些事件发生时执行任何你想要的代码就更好了（例如，当用户将鼠标悬停在栏上，你想要显示一个相关选举的信息框）。在 Anvil 的 Plotly 库中，你可以将事件处理程序绑定到诸如悬停之类的事件，这使得复杂的交互成为可能。

![A multi-bar plot with a hover event handler][24]

*A multi-bar plot with a hover event handler (© 2019 [Anvil][9])*

你可以通过将方法绑定到绘图的悬停事件来实现：

```
  def plot_1_hover(self, points, **event_args):
    """This method is called when a data point is hovered."""
    i = points[0]['point_number']
    self.label_year.text = self.data['year'][i]
    self.label_con.text = self.data['conservative'][i]
    self.label_lab.text = self.data['labour'][i]
    self.label_lib.text = self.data['liberal'][i]
    self.label_oth.text = self.data['others'][i]
    url = f"https://en.wikipedia.org/wiki/{self.data['year'][i]}_United_Kingdom_general_election"
    self.link_more_info.text = url
    self.link_more_info.url = url
```

这是一种相当极端的交互性，从开发人员的角度来看，也是一种极端的可定制性。这都要归功于 Plotly 的架构 —— 它有一个简洁的接口，明确的设计是为了让你建立自己的API。如果到处都能看到这种伟大的设计，那将会很有帮助！

### 使用 Bokeh 进行自定义交互

现在你已经了解了 Plotly 如何使用 JavaScript 来创建动态图，并且可以使用 Anvil 的客户端编写 Python 代码在浏览器中实时编辑它们。

Bokeh 是另一个 Python 绘图库，它可以输出可嵌入 Web 应用程序的 HTML 文档，并获得与 Plotly 提供的功能类似的动态功能（如果你想知道如何发音，那就是 “BOE-kay”）。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/plotly-python

作者：[Shaun Taylor-Morgan][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/shaun-taylor-morgan
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/colorful_sound_wave.png?itok=jlUJG0bM (Colorful sound wave graph)
[2]: https://opensource.com/resources/python
[3]: https://linux.cn/article-12327-1.html
[4]: https://opensource.com/article/20/4/install-python-linux
[5]: thttps://opensource.com/article/19/5/python-3-default-mac
[6]: https://opensource.com/article/19/8/how-install-python-windows
[7]: https://opensource.com/article/20/5/matplotlib-python
[8]: https://opensource.com/sites/default/files/uploads/plotly.png (A multi-bar plot made using Graph Objects)
[9]: https://anvil.works/blog/plotting-in-plotly
[10]: https://opensource.com/sites/default/files/uploads/plotly-pio.png (A multi-bar plot made using JSON-like data structures)
[11]: https://plot.ly/python/plotly-express/
[12]: https://anvil.works/blog/tidy-data
[13]: https://opensource.com/article/20/5/seaborn-visualization-python
[14]: https://opensource.com/sites/default/files/uploads/plotly-express.png (A multi-bar plot made using Plotly Express)
[15]: https://anvil.works/blog/escape-hatches-and-ejector-seats
[16]: https://d3js.org/
[17]: http://stack.gl/
[18]: https://opensource.com/sites/default/files/uploads/plotly-arch.png (Plotly uses a JavaScript library to create plots, driven by libraries in other languages via JSON)
[19]: https://anvil.works/docs/client/components/plots
[20]: https://opensource.com/sites/default/files/uploads/plotting-in-anvil.gif (The election plot on the web using Anvil's client-side-Python Plotly library)
[21]: https://anvil.works/docs/client/python
[22]: https://anvil.works/login?app-name=Plotting%20in%20Plotly&app-author=shaun%40anvil.works
[23]: https://opensource.com/sites/default/files/uploads/plotly-tooltips.png (A multi-bar plot with custom tool-tips)
[24]: https://opensource.com/sites/default/files/uploads/plotly-event-handling.gif (A multi-bar plot with a hover event handler)

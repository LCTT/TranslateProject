[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12364-1.html)
[#]: subject: (Style your data plots in Python with Pygal)
[#]: via: (https://opensource.com/article/20/6/pygal-python)
[#]: author: (Shaun Taylor-Morgan https://opensource.com/users/shaun-taylor-morgan)

使用 Pygal 在 Python 中设置数据图的样式
======

> 介绍一种更时尚的 Python 绘图库。

![](https://img.linux.net.cn/data/attachment/album/202006/30/120650hlf8lm0em3l1m8zd.jpg)

[Python][2] 有很多可以将数据可视化的库。其中一个互动性较强的库是 Pygal，我认为这个库适合喜欢漂亮事物的人。它可以生成用户可以与之交互的漂亮的 SVG（可缩放矢量图形）文件。SVG 是交互式图形的标准格式，仅使用几行 Python 就可以带来丰富的用户体验。

### 使用 Pygal 进行时尚的 Python 绘图

在本文中，我们要重新创建多柱状图，用来表示 1966 年至 2020 年英国大选的结果：

![Pygal plot][3]

在继续之前，请注意你可能需要调整 Python 环境以使此代码运行，包括：

  * 运行最新版本的 Python（[Linux][4]、[Mac][5] 和 [Windows][6] 的说明）
  * 确认你运行的是与这些库兼容的 Python 版本

数据可在线获得，并可使用 pandas 导入：

```
import pandas as pd
df = pd.read_csv('https://anvil.works/blog/img/plotting-in-python/uk-election-results.csv')
```

现在我们可以继续进行了。。数据如下所示：

```
        year  conservative  labour  liberal  others
0       1966           253     364       12       1
1       1970           330     287        6       7
2   Feb 1974           297     301       14      18
..       ...           ...     ...      ...     ...
12      2015           330     232        8      80
13      2017           317     262       12      59
14      2019           365     202       11      72
```

在 Pygal 中进行绘制会以一种易于阅读的方式显示。首先，我们以一种简化柱状图定义的方式定义样式对象。然后我们将自定义样式以及其他元数据传递给 `Bar`  对象：

```
import pygal
from pygal.style import Style

custom_style = Style(
    colors=('#0343df', '#e50000', '#ffff14', '#929591'),
    font_family='Roboto,Helvetica,Arial,sans-serif',
    background='transparent',
    label_font_size=14,
)

c = pygal.Bar(
    title="UK Election Results",
    style=custom_style,
    y_title='Seats',
    width=1200,
    x_label_rotation=270,
)
```

然后，我们将数据添加到 `Bar` 对象中：

```
c.add('Conservative', df['conservative'])
c.add('Labour', df['labour'])
c.add('Liberal', df['liberal'])
c.add('Others', df['others'])

c.x_labels = df['year']
```

最后，我们将图另存为 SVG 文件：

```
c.render_to_file('pygal.svg')
```

结果是一个交互式 SVG 图，你可以在此 gif 中看到：

![The Python pygal library can generate rich SVG files as seen here][7]

精美简单，并且效果漂亮。

### 总结

Python 中的某些绘图工具需要非常详细地构建每个对象，而 Pygal 从一开始就为你提供这些。如果你手边有数据并且想做一个干净、漂亮、简单的交互式图表，请尝试一下 Pygal。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/pygal-python

作者：[Shaun Taylor-Morgan][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/shaun-taylor-morgan
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_python.jpg?itok=G04cSvp_ (Python in a coffee cup.)
[2]: https://opensource.com/article/20/4/plot-data-python
[3]: https://opensource.com/sites/default/files/uploads/pygal_1.png (Pygal plot)
[4]: https://opensource.com/article/20/4/install-python-linux
[5]: https://opensource.com/article/19/5/python-3-default-mac
[6]: https://opensource.com/article/19/8/how-install-python-windows
[7]: https://opensource.com/sites/default/files/uploads/pygal-interactive_3.gif (The Python pygal library can generate rich SVG files as seen here)
[8]: https://anvil.works/blog/plotting-in-pygal

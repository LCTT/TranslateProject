[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12172-1.html)
[#]: subject: (Using Python to visualize COVID-19 projections)
[#]: via: (https://opensource.com/article/20/4/python-data-covid-19)
[#]: author: (AnuragGupta https://opensource.com/users/999anuraggupta)

使用 Python 来可视化 COVID-19 预测
======

> 我将演示如何利用提供的全球病毒传播的开放数据，使用开源库来创建两个可视效果。

![](https://img.linux.net.cn/data/attachment/album/202005/01/193624a2p2osojyf0yg4go.jpg)

使用 [Python][2] 和一些图形库，你可以预测 COVID-19 确诊病例总数，也可以显示一个国家（本文以印度为例）在给定日期的死亡总数。人们有时需要帮助解释和处理数据的意义，所以本文还演示了如何为五个国家创建一个动画横条形图，以显示按日期显示病例的变化。

### 印度的确诊病例和死亡人数预测

这要分三步来完成。

#### 1、下载数据

科学数据并不总是开放的，但幸运的是，许多现代科学和医疗机构都乐于相互之间及与公众共享信息。关于 COVID-19 病例的数据可以在网上查到，并且经常更新。

要解析这些数据，首先必须先下载。 <https://raw.githubusercontent.com/datasets/covid-19/master/data/countries-aggregated.csv>。

直接将数据加载到 Pandas `DataFrame` 中。Pandas 提供了一个函数 `read_csv()`，它可以获取一个 URL 并返回一个 `DataFrame` 对象，如下所示。

```
import pycountry
import plotly.express as px
import pandas as pd
URL_DATASET = r'https://raw.githubusercontent.com/datasets/covid-19/master/data/countries-aggregated.csv'
df1 = pd.read_csv(URL_DATASET)
print(df1.head(3))  # 获取数据帧中的前 3 项
print(df1.tail(3))  # 获取数据帧中的后 3 项
```

数据集的顶行包含列名。

1. `Date`
2. `Country`
3. `Confirmed`
4. `Recovered`
5. `Deaths`

`head` 查询的输出包括一个唯一的标识符（不作为列列出）和每个列的条目。

```
0 2020-01-22 Afghanistan 0 0 0
1 2020-01-22 Albania 0 0 0
1 2020-01-22 Algeria 0 0 0
```

`tail` 查询的输出类似，但包含数据集的尾端。

```
12597 2020-03-31 West Bank and Gaza 119 18 1
12598 2020-03-31 Zambia 35 0 0
12599 2020-03-31 Zimbabwe 8 0 1
```

从输出中，可以看到 DataFrame（`df1`）有以下几个列：

1. 日期
2. 国家
3. 确诊
4. 康复
5. 死亡

此外，你可以看到 `Date` 栏中的条目从 1 月 22 日开始到 3 月 31 日。这个数据库每天都会更新，所以你会有当前的值。

#### 2、选择印度的数据

在这一步中，我们将只选择 DataFrame 中包含印度的那些行。这在下面的脚本中可以看到。

```
#### ----- Step 2 (Select data for India)----
df_india = df1[df1['Country'] == 'India']
print(df_india.head(3))
```

#### 3、数据绘图

在这里，我们创建一个条形图。我们将把日期放在 X 轴上，把确诊的病例数和死亡人数放在 Y 轴上。这一部分的脚本有以下几个值得注意的地方。

  * `plt.rcParams["figure.figsize"]=20,20` 这一行代码只适用于 Jupyter。所以如果你使用其他 IDE，请删除它。
  * 注意这行代码：`ax1 = plt.gca()`。为了确保两个图，即确诊病例和死亡病例的图都被绘制在同一个图上，我们需要给第二个图的 `ax` 对象。所以我们使用 `gca()` 来完成这个任务。（顺便说一下，`gca` 代表 “<ruby>获取当前坐标轴<rt>get current axis</rt></ruby>”）

完整的脚本如下所示。

```
#  Author:- Anurag Gupta # email:- 999.anuraggupta@gmail.com
%matplotlib inline
import matplotlib.pyplot as plt
import pandas as pd

#### ----- Step 1 (Download data)----
URL_DATASET = r'https://raw.githubusercontent.com/datasets/covid-19/master/data/countries-aggregated.csv'
df1 = pd.read_csv(URL_DATASET)
# print(df1.head(3))  # Uncomment to see the dataframe

#### ----- Step 2 (Select data for India)----
df_india = df1[df1['Country'] == 'India']
print(df_india.head(3))

#### ----- Step 3 (Plot data)----
# Increase size of plot
plt.rcParams["figure.figsize"]=20,20  # Remove if not on Jupyter
# Plot column 'Confirmed'
df_india.plot(kind = 'bar', x = 'Date', y = 'Confirmed', color = 'blue')

ax1 = plt.gca()
df_india.plot(kind = 'bar', x = 'Date', y = 'Deaths', color = 'red', ax = ax1)
plt.show()
```

整个脚本[可在 GitHub 上找到][4]。

### 为五个国家创建一个动画水平条形图

关于 Jupyter 的注意事项：要在 Jupyter 中以动态动画的形式运行，而不是静态 png 的形式，你需要在单元格的开头添加一个神奇的命令，即: `%matplotlib notebook`。这将使图形保持动态，而不是显示为静态的 png 文件，因此也可以显示动画。如果你在其他 IDE 上，请删除这一行。

#### 1、下载数据

这一步和前面的脚本完全一样，所以不需要重复。

#### 2、创建一个所有日期的列表

如果你检查你下载的数据，你会发现它有一列 `Date`。现在，这一列对每个国家都有一个日期值。因此，同一个日期会出现多次。我们需要创建一个只具有唯一值的日期列表。这会用在我们条形图的 X 轴上。我们有一行代码，如 `list_dates = df[‘Date’].unique()`。`unique()` 方法将只提取每个日期的唯一值。

#### 3、挑选五个国家并创建一个 `ax` 对象。

做一个五个国家的名单。（你可以选择你喜欢的国家，也可以增加或减少国家的数量。）我也做了一个五个颜色的列表，每个国家的条形图的颜色对应一种。（如果你喜欢的话，也可以改一下。）这里有一行重要的代码是：`fig, ax = plt.subplots(figsize=(15, 8))`。这是创建一个 `ax` 对象所需要的。

#### 4、编写回调函数

如果你想在 Matplotlib 中做动画，你需要创建一个名为 `matplotlib.animation.FuncAnimation` 的类的对象。这个类的签名可以在网上查到。这个类的构造函数，除了其他参数外，还需要一个叫 `func` 的参数，你必须给这个参数一个回调函数。所以在这一步中，我们会写个回调函数，这个回调函数会被反复调用，以渲染动画。

#### 5、创建 `FuncAnimation` 对象

这一步在上一步中已经部分说明了。

我们创建这个类的对象的代码是：

```
my_anim = animation.FuncAnimation(fig = fig, func = plot_bar,
                    frames = list_dates, blit = True,
                    interval=20)
```

要给出的三个重要参数是：

* `fig`，必须给出一个 fig 对象，也就是我们之前创建的 fig 对象。
* `func`，必须是回调函数。
* `frames`，必须包含要做动画的变量。在我们这里，它是我们之前创建的日期列表。

#### 6、将动画保存为 mp4 文件

你可以将创建的动画保存为 mp4 文件。但是，你需要 `ffmpeg`。你可以用 `pip` 下载：`pip install ffmpeg-python`，或者用 conda（在 Jupyter 上）：`install -c conda-forge ffmpeg`。

最后，你可以使用 `plt.show()` 运行动画。请注意，在许多平台上，`ffmpeg` 可能无法正常工作，可能需要进一步“调整”。

```
%matplotlib notebook
#  Author:- Anurag Gupta # email:- 999.anuraggupta@gmail.com
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from time import sleep

#### ---- Step 1:- Download data
URL_DATASET = r'https://raw.githubusercontent.com/datasets/covid-19/master/data/countries-aggregated.csv'
df = pd.read_csv(URL_DATASET, usecols = ['Date', 'Country', 'Confirmed'])
# print(df.head(3)) # uncomment this to see output

#### ---- Step 2:- Create list of all dates
list_dates = df['Date'].unique()
# print(list_dates) # Uncomment to see the dates

#### --- Step 3:- Pick 5 countries. Also create ax object
fig, ax = plt.subplots(figsize=(15, 8))
# We will animate for these 5 countries only
list_countries = ['India', 'China', 'US', 'Italy', 'Spain']
# colors for the 5 horizontal bars
list_colors = ['black', 'red', 'green', 'blue', 'yellow']

### --- Step 4:- Write the call back function
# plot_bar() is the call back function used in FuncAnimation class object
def plot_bar(some_date):
    df2 = df[df['Date'].eq(some_date)]
    ax.clear()
    # Only take Confirmed column in descending order
    df3 = df2.sort_values(by = 'Confirmed', ascending = False)
    # Select the top 5 Confirmed countries
    df4 = df3[df3['Country'].isin(list_countries)]
    # print(df4)  # Uncomment to see that dat is only for 5 countries
    sleep(0.2)  # To slow down the animation
    # ax.barh() makes a horizontal bar plot.
    return ax.barh(df4['Country'], df4['Confirmed'], color= list_colors)

###----Step 5:- Create FuncAnimation object---------
my_anim = animation.FuncAnimation(fig = fig, func = plot_bar,
                    frames= list_dates, blit=True,
                    interval=20)

### --- Step 6:- Save the animation to an mp4
# Place where to save the mp4. Give your file path instead
path_mp4 = r'C:\Python-articles\population_covid2.mp4'  
# my_anim.save(path_mp4, fps=30, extra_args=['-vcodec', 'libx264'])
my_anim.save(filename = path_mp4, writer = 'ffmpeg',
             fps=30,
             extra_args= ['-vcodec', 'libx264', '-pix_fmt', 'yuv420p'])
plt.show()
```

完整的脚本[可以在 GitHub 上找到][5]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/python-data-covid-19

作者：[AnuragGupta][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/999anuraggupta
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/colorful_sound_wave.png?itok=jlUJG0bM (Colorful sound wave graph)
[2]: https://opensource.com/resources/python
[3]: mailto:999.anuraggupta@gmail.com
[4]: https://raw.githubusercontent.com/ag999git/jupyter_notebooks/master/corona_bar_india
[5]: https://raw.githubusercontent.com/ag999git/jupyter_notebooks/master/corona_bar_animated

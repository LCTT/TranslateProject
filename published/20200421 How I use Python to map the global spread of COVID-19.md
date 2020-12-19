[#]: collector: (lujun9972)
[#]: translator: (zxp93)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12935-1.html)
[#]: subject: (How I use Python to map the global spread of COVID-19)
[#]: via: (https://opensource.com/article/20/4/python-map-covid-19)
[#]: author: (AnuragGupta https://opensource.com/users/999anuraggupta)

如何使用 Python 绘制 COVID-19 的全球扩散图
======

> 使用这些开源框架创建一个彩色地图，显示病毒的可能的传播路径。
 
![](https://img.linux.net.cn/data/attachment/album/202012/20/005146t8voetski8ocm5c2.jpg)

对于一个全球旅行司空见惯的世界来说，疾病的传播是一个真正令人担忧的问题。一些组织会跟踪重大的流行病（还有所有普遍的流行病），并将他们的跟踪工作获得的数据公开出来。不过，这些原始的数据对人来说可能很难处理，这就是为什么数据科学如此重要的原因。比如，用 Python 和 Pandas 可视化 COVID-19 在全球范围内的传播路径可能对这些数据的分析有所帮助。

最开始，当面对如此大数量的原始数据时可能难以下手。但当你开始处理数据之后，慢慢地就会发现一些处理数据的方式。下面是用于处理 COVID-19 数据的一些常见的情况：

  1. 从 GitHub 上下载 COVID-19 的国家每日传播数据，保存为一个 Pandas 中的 DataFrame 对象。这时你需要使用 Python 中的 Pandas 库。
  2. 处理并清理下载好的数据，使其满足可视化数据的输入格式。所下载的数据的情况很好（数据规整）。这个数据有一个问题是它用国家的名字来标识国家，但最好是使用三位数的 ISO 3 码（国家代码表）来标识国家。为了生成 ISO 3 码，可是使用 `pycountry` 这个 Python 库。生成了这些代码之后，可以在原有的 DataFrame 上增加一列，然后用这些代码填充进去。
  3. 最后为了实现可视化，使用 Plotly 库中的 `express` 模块。这篇文章是使用名为choropleth 的地图（可在 Plotly 库中获得）来可视化该疾病在全球的传播。

### 第一步：Corona 数据

从下面这个网站上下载最新的 corona 数据（LCTT 译注：2020-12-14 仍可访问，有墙）：

  - <https://raw.githubusercontent.com/datasets/covid-19/master/data/countries-aggregated.csv>

我们之间将这个下载好的数据载入为 Pandas 的 DataFrame。Pandas 提供了一个函数， `read_csv()`，可以直接使用 URL 读取数据，并返回一个 DataFrame 对象，具体如下所示：

```
import pycountry
import plotly.express as px
import pandas as pd
URL_DATASET = r'https://raw.githubusercontent.com/datasets/covid-19/master/data/countries-aggregated.csv'
df1 = pd.read_csv(URL_DATASET)
print(df1.head(3))  # Get first 3 entries in the dataframe
print(df1.tail(3))  # Get last 3 entries in the dataframe
```

在 Jupyter 上的输出截图：

![Jupyter screenshot][2]

从这个输出可以看到这个 DataFrame（`df1`）包括以下几列数据：

  1. `Date`
  2. `Country`
  3. `Confirmed`
  4. `Recovered`
  5. `Dead`
  
之后还可以看到 `Date` 这一列包含了从 1 月 22 日到 3 月 31 日的条目信息。这个数据是每天更新的，所以你会得到你当天的值。

### 第二步：清理和修改 DataFrame

我们要往这个 DataFrame 中增加一列数据，就是那个包含了 ISO 3 编码。可以通过以下三步完成这个任务：

  1. 创建一个包含所有国家的列表。因为在 `df1` 的 `Country` 列中，国家都是每个日期就重复一次。所以实际上 `Country` 列中对每个国家就会有多个条目。我使用 `unique().tolist()` 函数完成这个任务。
  2. 我使用 `d_country_code` 字典对象（初始为空），然后将其键设置为国家的名称，然后它的值设置为其对应的 ISO 3 编码。
  3. 我使用 `pycountry.countries.search_fuzzy(country)` 为每个国家生成 ISO 3 编码。你需要明白的是这个函数的返回值是一个 `Country` 对象的列表。我将这个函数的返回值赋给 `country_data` 对象。以这个对象的第一个元素（序号 `0`）为例。这个 `\` 对象有一个 `alpha_3` 属性。所以我使用 `country_data[0].alpha_3` 就能“获得”第一个元素的 ISO 3 编码。然而，在这个 DataFrame 中有些国家的名称可能没有对应的 ISO 3 编码（比如有争议的领土）。那么对这些“国家/地区”，我就用一个空白字符串来替代 ISO 3 编码。你也可以用一个 `try-except` 代码来替换这部分。`except` 中的语句可以写：`print(‘could not add ISO 3 code for ->', country)`。这样就能在找不到这些“国家/地区”对应的 ISO 3 编码时给出一个输出提示。实际上，你会发现这些“国家/地区”会在最后的输出中用白色来表示。
  4. 在获得了每个国家的 ISO 3 编码（有些是空白字符串）之后，我把这些国家的名称（作为键）还有国家对应的 ISO 3 编码（作为值）添加到之前的字典 `d_country_code` 中。可以使用 Python 中字典对象的 `update()` 方法来完成这个任务。
  5. 在创建好了一个包含国家名称和对应 ISO 3 编码的字典之后，我使用一个简单的循环将他们加入到 DataFrame 中。

### 第三步：使用 Plotly 可视化传播路径

choropleth 地图是一个由彩色多边形组成的地图。它常常用来表示一个变量在空间中的变化。我们使用 Plotly 中的 `px` 模块来创建 choropleth 图，具体函数为：`px.choropleth`。

这个函数的所包含的参数如下：

```
plotly.express.choropleth(data_frame=None, lat=None, lon=None, locations=None, locationmode=None, geojson=None, featureidkey=None, color=None, hover_name=None, hover_data=None, custom_data=None, animation_frame=None, animation_group=None, category_orders={}, labels={}, color_discrete_sequence=None, color_discrete_map={}, color_continuous_scale=None, range_color=None, color_continuous_midpoint=None, projection=None, scope=None, center=None, title=None, template=None, width=None, height=None)
```

`choropleth()` 这个函数还有几点需要注意：

  1. `geojson` 是一个 `geometry` 对象（上面函数第六个参数）。这个对象有点让人困扰，因为在函数文档中没有明确地提到这个对象。你可以提供，也可以不提供 `geojson` 对象。如果你提供了 `geojson` 对象，那么这个对象就会被用来绘制地球特征，如果不提供 `geojson` 对象，那这个函数默认就会使用一个内建的 `geometry` 对象。（在我们的实验中，我们使用内建的 `geometry` 对象，因此我们不会为 `geojson` 参数提供值）
  2. DataFrame 对象有一个 `data_frame` 属性，在这里我们先前就提供了一个我们创建好的`df1`。
  3. 我们用 `Confirmed`（确诊数）来决定每个国家多边形的颜色。
  4. 最后，我们 `Date` 列创建一个 `animation_frame`。这样我们就能通过日期来划分数据，国家的颜色会随着 `Confirmed` 的变化而变化。

最后完整的代码如下：

```
import pycountry
import plotly.express as px
import pandas as pd
# ----------- Step 1 ------------
URL_DATASET = r'https://raw.githubusercontent.com/datasets/covid-19/master/data/countries-aggregated.csv'
df1 = pd.read_csv(URL_DATASET)
# print(df1.head) # Uncomment to see what the dataframe is like
# ----------- Step 2 ------------
list_countries = df1['Country'].unique().tolist()
# print(list_countries) # Uncomment to see list of countries
d_country_code = {}  # To hold the country names and their ISO
for country in list_countries:
    try:
        country_data = pycountry.countries.search_fuzzy(country)
        # country_data is a list of objects of class pycountry.db.Country
        # The first item  ie at index 0 of list is best fit
        # object of class Country have an alpha_3 attribute
        country_code = country_data[0].alpha_3
        d_country_code.update({country: country_code})
    except:
        print('could not add ISO 3 code for ->', country)
        # If could not find country, make ISO code ' '
        d_country_code.update({country: ' '})

# print(d_country_code) # Uncomment to check dictionary  

# create a new column iso_alpha in the df
# and fill it with appropriate iso 3 code
for k, v in d_country_code.items():
    df1.loc[(df1.Country == k), 'iso_alpha'] = v

# print(df1.head)  # Uncomment to confirm that ISO codes added
# ----------- Step 3 ------------
fig = px.choropleth(data_frame = df1,
                    locations= "iso_alpha",
                    color= "Confirmed",  # value in column 'Confirmed' determines color
                    hover_name= "Country",
                    color_continuous_scale= 'RdYlGn',  #  color scale red, yellow green
                    animation_frame= "Date")

fig.show()
```

这段代码的输出就是下面这个图的内容：

![Map][3]

你可以从这里下载并运行[完整代码][4]。

最后，这里还有一些关于 Plotly 绘制 choropleth 图的不错的资源。

  * <https://github.com/plotly/plotly.py/blob/master/doc/python/choropleth-maps.md>
  * <https://plotly.com/python/reference/#choropleth>

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/python-map-covid-19

作者：[AnuragGupta][a]
选题：[lujun9972][b]
译者：[zhangxiangping](https://github.com/zxp93)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/999anuraggupta
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cloud-globe.png?itok=_drXt4Tn (Globe up in the clouds)
[2]: https://opensource.com/sites/default/files/uploads/jupyter_screenshot.png (Jupyter screenshot)
[3]: https://opensource.com/sites/default/files/uploads/map_2.png (Map)
[4]: https://github.com/ag999git/jupyter_notebooks/blob/master/corona_spread_visualization
[5]: tmp.azs72dmHFd#choropleth

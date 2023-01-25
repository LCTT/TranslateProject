[#]: subject: "Pandas: The Popular Python Library for Data Analysis and Data Science"
[#]: via: "https://www.opensourceforu.com/2022/08/pandas-the-popular-python-library-for-data-analysis-and-data-science/"
[#]: author: "Phani Kiran https://www.opensourceforu.com/author/phani-kiran/"
[#]: collector: "lkxed"
[#]: translator: "chai001125"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Pandas：用于数据分析和数据科学的最热门 Python 库
======

>Pandas 是一个十分流行的 Python 第三方库。本文介绍了 Pandas 库中的一些特性和函数，并且我们鼓励读者亲手使用 Pandas 库，来解决实际的业务问题。

Pandas 为 Python 中数据分析提供了基础和高级的构建块。Pandas 库是用于数据分析与数据操作的最强大和最灵活的开源**分析工具**之一，并且它还提供了用于建模和操作表格数据（行和列中的数据）的**数据结构**。

Pandas 库有两个主要的数据结构：第一个是“**Series**”，该数据结构能够很方便地从 Python 数组或字典中**按位置或指定索引名称**来检索数据；第二个是“**DataFrames**”，该数据结构将数据存储在行和列中。列可以通过列名访问，行通过索引访问。列可以有不同类型的数据，包括列表、字典、Series、DataFrames、NumPy 数组等。

### Pandas 库可以处理各种文件格式

有各种各样的文件格式。用于数据分析的工具必须能够提供处理各种文件格式的方法。

Pandas 可以读取各种文件格式，例如 CSV 文件、JSON 文件、XML 文件、Parquet 文件、SQL 文件，详见下表。

|  | 写入 | 读取 | 
| :- | :- | :- |
| CSV 文件 | to_csv 函数 | read_csv 函数 | 
| JSON 文件 | to_json 函数 | read_json 函数 | 
| Parquet 文件 | to_parquet 函数 | read_parquet 函数 | 
| SQL 文件 | to_sql 函数 | read_sql 函数，read_sql_query 函数，read_sql_table 函数 | 
| XML 文件 | to_xml 函数 | read_xml 函数 |

### 使用 Pandas 进行数据清理

在现实场景中，很多数据集存在数据缺失、数据格式错误、错误数据或重复数据的情况，如果要对使数据分析更加准确，就需要对这些没有用的数据进行处理。此外，数据还会有需要 <ruby>屏蔽<rt>mask</rt></ruby> 的敏感和机密信息。接下来，Pandas 提供了清理、丢弃、替换、屏蔽等方法，来处理这些坏数据。

#### Pandas 清洗空值：

a. 使用 *df.dropna(inplace=True)* 方法来删除包含空字段的行。

b. 使用 *df.fillna(<value>, inplace=True)* 方法来替换空字段。还可以指定某一个列来替换该列的空数据。

#### Pandas 屏蔽数据：

c. 要屏蔽所有不满足条件 *my_list.where(my_list < 5)* 的敏感数据的值，可以使用 *my_list.mask(my_list < 5)*。

#### Pandas 清洗重复数据：

d. 要删除重复数据，可以使用 drop_duplicates() 方法：

```
df.drop_duplicates(‘<column>’, keep = False)
df.drop_duplicates(‘<column>’, keep = ‘first’)
df.drop_duplicates(‘<column>’, keep = ‘last’)
```

### 使用 Pandas 进行数据分析

下面的表格列出了 Pandas 中进行数据分析的各种函数，以及其语法。（请注意：df 代表一个 DataFrame 数据结构的实例。）

| 语法 | 描述 |
| :- | :- |
| df.head(x) | Head() 函数用于读取前面的 x 行，如果不填参数 x，默认返回 5 行 | 
| df.tail(x) | tail() 函数用于读取尾部的 x 行，如果不填参数 x ，默认返回最后 5 行，空行各个字段的值返回 NaN | 
| loc(x:y) | Loc 函数返回指定行的数据，也可以对数据进行切片 | 
| groupby(‘<column>’) | 对指定列的数据进行分组 | 
| df[‘column’].sum() | 计算指定列数据的总和 | 
| df[‘column’]. mean() | 计算指定列数据的算术平均值 |
| df[‘column’].min() | 计算指定列数据的最小值 | 
| df[‘column’].max() | 计算指定列数据的最大值 | 
| df.sort_values([‘column’]) | 在指定轴上根据数值进行排序，默认升序 | 
| df.size | 返回元素的个数，即为 Rows（行数）* columns（列数） | 
| df.describe | 返回对各列的统计汇总 | 
| pd.crosstab(df[‘column1’], df[‘column2’], margins = True) | 创建 `column1` 和 `column2` 的交叉表 | 
| df.duplicated([column1, ‘column2’]) | 根据 `column1` 和 `column2` 中的重复值，返回 True 或 False |

### Pandas 的优点

* 支持多索引（层次索引），方便分析多维数据。
* 支持数据透视表的创建，堆栈和取消堆栈操作。
* 可以使用 Pandas 处理有限值的分类数据。
* 支持分组和聚合运算。
* 可以禁用排序。
* 支持行级过滤（获取满足过滤条件的行）和列级过滤（只选择需要的列）。
* 有助于重塑数据集（数组的维度变换）。还可以转置数组的值，并转换为列表。当你使用 Python 处理数据时，可以将 Pandas DataFrame 转换为多维 NumPy 数组。
* 支持面向标签的数据切片。

### Pandas 的不足

Pandas 的代码和语法与 Python 不同，所以人们需要额外再学习 Pandas。此外，相较于 Pandas，像三维数据这样的高维数据会在 NumPy 等其他库有更好的处理。

### 总结

Pandas 能够大幅提升数据分析的效率。它与其他库的兼容性使它在其他 Python 库中都能有效地使用。

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/08/pandas-the-popular-python-library-for-data-analysis-and-data-science/

作者：[Phani Kiran][a]
选题：[lkxed][b]
译者：[chai001125](https://github.com/chai001125)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/phani-kiran/
[b]: https://github.com/lkxed

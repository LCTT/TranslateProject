
### 计算运用数据中的值

接下来我们会计算过程数据或运用数据中的值。我们要做的就是推测这些数据代表的贷款是否被收回。如果能够计算出来，我们只要看一下包含贷款的运用数据的参数 foreclosure_date 就可以了。如果这个参数的值是 None　，那么这些贷款肯定没有收回。为了避免我们的样例中存在少量的运用数据，我们会计算出运用数据中有贷款数据的行的行数。这样我们就能够从我们的训练数据中筛选出贷款数据，排除了一些运用数据。

下面是一种区分贷款数据和运用数据的方法：

![](https://github.com/LCTT/wiki-images/blob/master/TranslateProject/ref_img/001.png)


在上面的表格中，采集数据中的每一行数据都与运用数据中的多行数据有联系。在运用数据中，在收回贷款的时候 foreclosure_date 就会以季度的的形式显示出收回时间，而且它会在该行数据的最前面显示一个空格。一些贷款没有收回，所以与运用数据中的贷款数据有关的行都会在前面出现一个表示 foreclosure_date 的空格。

我们需要计算 foreclosure_status 的值，它的值是布尔类型，可以表示一个特殊的贷款数据 id 是否被收回过，还有一个参数 performance_count ，它记录了运用数据中每个贷款 id 出现的行数。　

计算这些行数有多种不同的方法：

- 我们能够读取所有的运用数据，然后我们用 Pandas 的 groupby 方法在数据框中计算出与每个贷款 id 有关的行的行数，然后就可以查看贷款 id 的 foreclosure_date 值是否为 None 。
　　　 - 这种方法的优点是从语法上来说容易执行。
　　　　- 它的缺点需要读取所有的 129236094 行数据，这样就会占用大量内存，并且运行起来极慢。
- 我们可以读取所有的运用数据，然后使用采集到的数据框去计算每个贷款 id　出现的次数。
　　　　- 这种方法的优点是容易理解。
　　　　- 缺点是需要读取所有的 129236094 行数据。这样会占用大量内存，并且运行起来极慢。
- 我们可以在迭代访问运用数据中的每一行数据，而且会建立一个区分开的计数字典。
    - 这种方法的优点是数据不需要被加载到内存中，所以运行起来会很快且不需要占用内存。
　　　　- 缺点是这样的话理解和执行上可能有点耗费时间，我们需要对每一行数据进行语法分析。

加载所有的数据会非常耗费内存，所以我们采用第三种方法。我们要做的就是迭代运用数据中的每一行数据，然后为每一个贷款 id 生成一个字典值。在这个字典中，我们会计算出贷款 id 在运用数据中出现的次数，而且如果 foreclosure_date 不是 Nnoe 。我们可以查看 foreclosure_status 和 performance_count 的值 。

我们会新建一个 annotate.py 文件，文件中的代码可以计算这些值。我们会使用下面的代码：

- 导入需要的库
- 定义一个函数 count_performance_rows 。
    - 打开 processed/Performance.txt 文件。这不是在内存中读取文件而是打开了一个文件标识符，这个标识符可以用来以行为单位读取文件。　
    - 迭代文件的每一行数据。
    - 使用分隔符(|)分开每行的不同数据。
    - 检查 loan_id 是否在计数字典中。
        - 如果不存在，进行一次计数。
    - loan_id 的 performance_count 参数自增 1 次，因为我们这次迭代也包含其中。
    - 如果日期是 None ，我们就会知道贷款被收回了，然后为foreclosure_status 设置合适的值。

```
import os
import settings
import pandas as pd

def count_performance_rows():
    counts = {}
    with open(os.path.join(settings.PROCESSED_DIR, "Performance.txt"), 'r') as f:
        for i, line in enumerate(f):
            if i == 0:
                # Skip header row
                continue
            loan_id, date = line.split("|")
            loan_id = int(loan_id)
            if loan_id not in counts:
                counts[loan_id] = {
                    "foreclosure_status": False,
                    "performance_count": 0
                }
            counts[loan_id]["performance_count"] += 1
            if len(date.strip()) > 0:
                counts[loan_id]["foreclosure_status"] = True
    return counts
```

### 获取值

只要我们创建了计数字典，我们就可以使用一个函数通过一个 loan_id 和一个 key 从字典中提取到需要的参数的值：

```
def get_performance_summary_value(loan_id, key, counts):
    value = counts.get(loan_id, {
        "foreclosure_status": False,
        "performance_count": 0
    })
    return value[key]
```


上面的函数会从计数字典中返回合适的值，我们也能够为采集数据中的每一行赋一个 foreclosure_status 值和一个 performance_count 值。如果键不存在，字典的 [get][33] 方法会返回一个默认值，所以在字典中不存在键的时候我们就可以得到一个可知的默认值。



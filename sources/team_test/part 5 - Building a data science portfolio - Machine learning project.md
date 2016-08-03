
### 注解数据

我们已经在annotate.py中添加了一些功能, 现在我们来看一看数据文件. 我们需要将采集到的数据转换到训练数据表来进行机器学习的训练. 这涉及到以下几件事情:

- 转换所以列数字.
- 填充缺失值.
- 分配 performance_count 和 foreclosure_status.
- 移除出现次数很少的行(performance_count 计数低).

我们有几个列是文本类型的, 看起来对于机器学习算法来说并不是很有用. 然而, 他们实际上是分类变量, 其中有很多不同的类别代码, 例如R,S等等. 我们可以把这些类别标签转换为数值:

![](https://github.com/LCTT/wiki-images/blob/master/TranslateProject/ref_img/002.png)

通过这种方法转换的列我们可以应用到机器学习算法中.

还有一些包含日期的列 (first_payment_date 和 origination_date). 我们可以将这些日期放到两个列中:

![](https://github.com/LCTT/wiki-images/blob/master/TranslateProject/ref_img/003.png)
在下面的代码中, 我们将转换采集到的数据. 我们将定义一个函数如下:

- 在采集到的数据中创建foreclosure_status列 .
- 在采集到的数据中创建performance_count列.
- 将下面的string列转换为integer列:
    - channel
    - seller
    - first_time_homebuyer
    - loan_purpose
    - property_type
    - occupancy_status
    - property_state
    - product_type
- 转换first_payment_date 和 origination_date 为两列:
    - 通过斜杠分离列.
    - 将第一部分分离成月清单.
    - 将第二部分分离成年清单.
    - 删除这一列.
    - 最后, 我们得到 first_payment_month, first_payment_year, origination_month, and origination_year.
- 所有缺失值填充为-1.

```
def annotate(acquisition, counts):
    acquisition["foreclosure_status"] = acquisition["id"].apply(lambda x: get_performance_summary_value(x, "foreclosure_status", counts))
    acquisition["performance_count"] = acquisition["id"].apply(lambda x: get_performance_summary_value(x, "performance_count", counts))
    for column in [
        "channel",
        "seller",
        "first_time_homebuyer",
        "loan_purpose",
        "property_type",
        "occupancy_status",
        "property_state",
        "product_type"
    ]:
        acquisition[column] = acquisition[column].astype('category').cat.codes

    for start in ["first_payment", "origination"]:
        column = "{}_date".format(start)
        acquisition["{}_year".format(start)] = pd.to_numeric(acquisition[column].str.split('/').str.get(1))
        acquisition["{}_month".format(start)] = pd.to_numeric(acquisition[column].str.split('/').str.get(0))
        del acquisition[column]

    acquisition = acquisition.fillna(-1)
    acquisition = acquisition[acquisition["performance_count"] > settings.MINIMUM_TRACKING_QUARTERS]
    return acquisition
```

### 聚合到一起

我们差不多准备就绪了, 我们只需要再在annotate.py添加一点点代码. 在下面代码中, 我们将:

- 定义一个函数来读取采集的数据.
- 定义一个函数来写入数据到/train.csv
- 如果我们在命令行运行annotate.py来读取更新过的数据文件，它将做如下事情:
    - 读取采集到的数据.
    - 计算数据性能.
    - 注解数据.
    - 将注解数据写入到train.csv.

```
def read():
    acquisition = pd.read_csv(os.path.join(settings.PROCESSED_DIR, "Acquisition.txt"), sep="|")
    return acquisition
    
def write(acquisition):
    acquisition.to_csv(os.path.join(settings.PROCESSED_DIR, "train.csv"), index=False)

if __name__ == "__main__":
    acquisition = read()
    counts = count_performance_rows()
    acquisition = annotate(acquisition, counts)
    write(acquisition)
```

修改完成以后为了确保annotate.py能够生成train.csv文件. 你可以在这里找到完整的 annotate.py file [here][34].

文件夹结果应该像这样:

```
loan-prediction
├── data
│   ├── Acquisition_2012Q1.txt
│   ├── Acquisition_2012Q2.txt
│   ├── Performance_2012Q1.txt
│   ├── Performance_2012Q2.txt
│   └── ...
├── processed
│   ├── Acquisition.txt
│   ├── Performance.txt
│   ├── train.csv
├── .gitignore
├── annotate.py
├── assemble.py
├── README.md
├── requirements.txt
├── settings.py
```

### 找到标准

我们已经完成了训练数据表的生成, 现在我们需要最后一步, 生成预测. 我们需要找到错误的标准, 以及该如何评估我们的数据. 在这种情况下, 因为有很多的贷款没有收回, 所以根本不可能做到精确的计算.

我们需要读取数据, 并且计算foreclosure_status列, 我们将得到如下信息:

```
import pandas as pd
import settings

train = pd.read_csv(os.path.join(settings.PROCESSED_DIR, "train.csv"))
train["foreclosure_status"].value_counts()
```

```
False    4635982
True        1585
Name: foreclosure_status, dtype: int64
```

因为只有一点点贷款收回, 通过百分比标签来建立的机器学习模型会把每行都设置为Fasle, 所以我们在这里要考虑每个样本的不平衡性,确保我们做出的预测是准确的. 我们不想要这么多假的false, 我们将预计贷款收回但是它并没有收回, 我们预计贷款不会回收但是却回收了. 通过以上两点, Fannie Mae的false太多了, 因此显示他们可能无法收回投资.

所以我们将定义一个百分比，就是模型预测没有收回但是实际上收回了, 这个数除以总的负债回收总数. 这个负债回收百分比模型实际上是“没有的”. 下面看这个图表:

![](https://github.com/LCTT/wiki-images/blob/master/TranslateProject/ref_img/004.png)

通过上面的图表, 1个负债预计不会回收, 也确实没有回收. 如果我们将这个数除以总数, 2, 我们将得到false的概率为50%. 我们将使用这个标准, 因此我们可以评估一下模型的性能.

### 设置机器学习分类器

我们使用交叉验证预测. 通过交叉验证法, 我们将数据分为3组. 按照下面的方法来做:

- Train a model on groups 1 and 2, and use the model to make predictions for group 3.
- Train a model on groups 1 and 3, and use the model to make predictions for group 2.
- Train a model on groups 2 and 3, and use the model to make predictions for group 1.

将它们分割到不同的组 ,这意味着我们永远不会用相同的数据来为预测训练模型. 这样就避免了overfitting(过拟合). 如果我们overfit(过拟合), 我们将得到很低的false概率, 这使得我们难以改进算法或者应用到现实生活中.

[Scikit-learn][35] 有一个叫做 [cross_val_predict][36] 他可以帮助我们理解交叉算法.

我们还需要一种算法来帮我们预测. 我们还需要一个分类器 [binary classification][37]（二元分类）. 目标变量foreclosure_status 只有两个值, True 和 False.

我们用[logistic regression][38]（回归算法）, 因为它能很好的进行binary classification（二元分类）, 并且运行很快, 占用内存很小. 我们来说一下它是如何工作的 – 取代许多树状结构, 更像随机森林, 进行转换, 更像一个向量机, 逻辑回归涉及更少的步骤和更少的矩阵.

我们可以使用[logistic regression classifier][39]（逻辑回归分类器）算法 来实现scikit-learn. 我们唯一需要注意的是每个类的标准. 如果我们使用同样标准的类, 算法将会预测每行都为false, 因为它总是试图最小化误差.不管怎样, 我们关注有多少贷款能够回收而不是有多少不能回收. 因此, 我们通过 [LogisticRegression][40]（逻辑回归）来平衡标准参数, 并计算回收贷款的标准. 这将使我们的算法不会认为每一行都为false.

### 做出预测

既然完成了前期准备，我们可以开始准备做出预测了。我将创建一个名为 predict.py 的新文件，它会使用我们在最后一步创建的 train.csv 文件。下面的代码：

- 导入所需的库
- 创建一个名为 `cross_validate` 的函数：
    - 使用正确的关键词参数创建逻辑回归分类器（logistic regression classifier）
    - 创建移除了 `id` 和 `foreclosure_status` 属性的用于训练模型的列
    - 跨 `train` 数据帧使用交叉验证
    - 返回预测结果

```python
import os
import settings
import pandas as pd
from sklearn import cross_validation
from sklearn.linear_model import LogisticRegression
from sklearn import metrics

def cross_validate(train):
    clf = LogisticRegression(random_state=1, class_weight="balanced")

    predictors = train.columns.tolist()
    predictors = [p for p in predictors if p not in settings.NON_PREDICTORS]

    predictions = cross_validation.cross_val_predict(clf, train[predictors], train[settings.TARGET], cv=settings.CV_FOLDS)
    return predictions
```

### 预测误差

现在，我们仅仅需要写一些函数来计算误差。下面的代码：

- 创建函数 `compute_error`：
    - 使用 scikit-learn 计算一个简单的精确分数（与实际 `foreclosure_status` 值匹配的预测百分比）
- 创建函数 `compute_false_negatives`：
    - 为了方便，将目标和预测结果合并到一个数据帧
    - 查找漏报率
        - 找到原本应被预测模型取消但没有取消的贷款数目
        - 除以没被取消的贷款总数目

```python
def compute_error(target, predictions):
    return metrics.accuracy_score(target, predictions)

def compute_false_negatives(target, predictions):
    df = pd.DataFrame({"target": target, "predictions": predictions})
    return df[(df["target"] == 1) & (df["predictions"] == 0)].shape[0] / (df[(df["target"] == 1)].shape[0] + 1)

def compute_false_positives(target, predictions):
    df = pd.DataFrame({"target": target, "predictions": predictions})
    return df[(df["target"] == 0) & (df["predictions"] == 1)].shape[0] / (df[(df["target"] == 0)].shape[0] + 1)
```

### 聚合到一起

现在，我们可以把函数都放在 `predict.py`。下面的代码：

- 读取数据集
- 计算交叉验证预测
- 计算上面的 3 个误差
- 打印误差

```python
def read():
    train = pd.read_csv(os.path.join(settings.PROCESSED_DIR, "train.csv"))
    return train

if __name__ == "__main__":
    train = read()
    predictions = cross_validate(train)
    error = compute_error(train[settings.TARGET], predictions)
    fn = compute_false_negatives(train[settings.TARGET], predictions)
    fp = compute_false_positives(train[settings.TARGET], predictions)
    print("Accuracy Score: {}".format(error))
    print("False Negatives: {}".format(fn))
    print("False Positives: {}".format(fp))
```

一旦你添加完代码，你可以运行 `python predict.py` 来产生预测结果。运行结果向我们展示漏报率为 `.26`，这意味着我们没能预测 `26%` 的取消贷款。这是一个好的开始，但仍有很多改善的地方！

你可以在[这里][41]找到完整的 `predict.py` 文件

你的文件树现在看起来像下面这样：

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
├── predict.py
├── README.md
├── requirements.txt
├── settings.py
```

### 撰写 README

既然我们完成了端到端的项目，那么我们可以撰写 README.md 文件了，这样其他人便可以知道我们做的事，以及如何复制它。一个项目典型的 README.md 应该包括这些部分：

- 一个高水准的项目概览，并介绍项目目的
- 任何必需的数据和材料的下载地址
- 安装命令
    - 如何安装要求依赖
- 使用命令
    - 如何运行项目
    - 每一步之后会看到的结果
- 如何为这个项目作贡献
    - 扩展项目的下一步计划

[这里][42] 是这个项目的一个 README.md 样例。

### 下一步

恭喜你完成了端到端的机器学习项目！你可以在[这里][43]找到一个完整的示例项目。一旦你完成了项目，把它上传到 [Github][44] 是一个不错的主意，这样其他人也可以看到你的文件夹的部分项目。

这里仍有一些留待探索数据的角度。总的来说，我们可以把它们分割为 3 类 - 扩展这个项目并使它更加精确，发现预测其他列并探索数据。这是其中一些想法：

- 在 `annotate.py` 中生成更多的特性
- 切换 `predict.py` 中的算法
- 尝试使用比我们发表在这里的更多的来自 `Fannie Mae` 的数据
- 添加对未来数据进行预测的方法。如果我们添加更多数据，我们所写的代码仍然可以起作用，这样我们可以添加更多过去和未来的数据。
- 尝试看看是否你能预测一个银行是否应该发放贷款（相对地，`Fannie Mae` 是否应该获得贷款）
    - 移除 train 中银行不知道发放贷款的时间的任何列
        - 当 Fannie Mae 购买贷款时，一些列是已知的，但不是之前
    - 做出预测
- 探索是否你可以预测除了 foreclosure_status 的其他列
    - 你可以预测在销售时财产值多少？
- 探索探索性能更新之间的细微差别
    - 你能否预测借款人会逾期还款多少次?
    - 你能否标出的典型贷款周期?
- 标出一个州到州或邮政编码到邮政级水平的数据
    - 你看到一些有趣的模式了吗?

如果你建立了任何有趣的东西,请在评论中让我们知道!

如果你喜欢这个,你可能会喜欢阅读 ‘Build a Data Science Porfolio’ 系列的其他文章:

- [Storytelling with data][45].
- [How to setup up a data science blog][46].

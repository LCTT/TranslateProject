[#]: subject: "Using a Machine Learning Model to Make Predictions"
[#]: via: "https://www.opensourceforu.com/2022/05/using-a-machine-learning-model-to-make-predictions/"
[#]: author: "Jishnu Saurav Mittapalli https://www.opensourceforu.com/author/jishnu-saurav-mittapalli/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14689-1.html"

机器学习：使用 Python 进行预测
======

> 机器学习基本上是人工智能的一个子集，它使用以前存在的数据对新数据进行预测。
 
当然，现在我们所有人都知道这个道理了！这篇文章展示了如何将 Python 中开发的机器学习模型作为 Java 代码的一部分来进行预测。

![Machine-learning][1]

本文假设你熟悉基本的开发技巧并理解机器学习。我们将从训练我们的模型开始，然后在 Python 中制作一个机器学习模型。

我以一个洪水预测模型为例。首先，导入以下库：

```
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
```

当我们成功地导入了这些库，我们就需要输入数据集，如下面的代码所示。为了预测洪水，我使用的是河流水位数据集。

```
from google.colab import files
uploaded = files.upload()
for fn in uploaded.keys(): 
    print('User uploaded file "{name}" with length {length} bytes'.format(name=fn, length=len(uploaded[fn])))
```

如果没有选择文件的话，选择上传的文件。

只有在当前浏览器会话中执行了该单元格时，上传部件才可用。请重新运行此单元，上传文件 `Hoppers Crossing-Hourly-River-Level.csv`，大小 2207036 字节。

完成后，我们就可以使用 `sklearn` 库来训练我们的模型。为此，我们首先需要导入该库和算法模型，如图 1 所示。

![Figure 1: Training the model][2]

```
from sklearn.linear_model import LinearRegression
regressor = LinearRegression()
regressor.fit(X_train, y_train)
```

完成后，我们就训练好了我们的模型，现在可以进行预测了，如图 2 所示。

![Figure 2: Making predictions][3]

### 在 Java 中使用 ML 模型

我们现在需要做的是把 ML 模型转换成一个可以被 Java 程序使用的模型。有一个叫做 `sklearn2pmml` 的库可以帮助我们做到这一点：

```
# Install the library
pip install sklearn2pmml
```

库安装完毕后，我们就可以转换我们已经训练好的模型，如下图所示：

```
sklearn2pmml(pipeline, ‘model.pmml’, with_repr = True)
```

这就完成了！我们现在可以在我们的 Java 代码中使用生成的 `model.pmml` 文件来进行预测。请试一试吧！

（LCTT 译注：Java 中有第三方库 [jpmml/jpmml-evaluator][4]，它能帮助你使用生成的 `model.pmml` 进行预测。）

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/05/using-a-machine-learning-model-to-make-predictions/

作者：[Jishnu Saurav Mittapalli][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/jishnu-saurav-mittapalli/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/05/Machine-learning.jpg
[2]: https://www.opensourceforu.com/wp-content/uploads/2022/05/Figure-1Training-the-model.jpg
[3]: https://www.opensourceforu.com/wp-content/uploads/2022/05/Figure-2-Making-predictions.jpg
[4]: https://github.com/jpmml/jpmml-evaluator

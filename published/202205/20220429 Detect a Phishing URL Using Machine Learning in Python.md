[#]: subject: "Detect a Phishing URL Using Machine Learning in Python"
[#]: via: "https://www.opensourceforu.com/2022/04/detect-a-phishing-url-using-machine-learning-in-python/"
[#]: author: "Jishnu Saurav Mittapalli https://www.opensourceforu.com/author/jishnu-saurav-mittapalli/"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14535-1.html"

在 Python 中使用机器学习来检测钓鱼链接
======

在网络钓鱼攻击中，用户会收到一封带有误导性链接的邮件或信息，攻击者可以利用它来收集重要数据，比如你的银行卡密码。本文将会给出一个简短的教程，旨在介绍如何检测这种网络钓鱼的企图。

![](https://img.linux.net.cn/data/attachment/album/202205/02/180603k231bbvubv3b23u6.jpg)

通过网络钓鱼攻击，攻击者能够获得一些重要凭证，这些凭证可以用来进入你的银行或其他金融账户。攻击者发送的 URL 看起来与我们日常使用的原始应用程序完全相同。这也是人们经常相信它，并在其中输入个人信息的原因。钓鱼网址可以打开一个网页，它看起来与你的银行的原始登录页面相似。最近，这样的网络钓鱼攻击正变得相当普遍，所以，检测钓鱼链接变得非常重要。因此，我将介绍如何在 Python 中使用机器学习来检查一个链接是误导性的还是真实的，因为它可以帮助我们看到网页代码及其输出。注意，本文将使用 Jupyter Notebook。当然，你也可以使用 Google Colab 或 Amazon Sagemaker，如果你对这些更熟悉的话。

### 下载数据集

第一步，我们需要用于训练数据集。你可以从下面的链接中下载数据集。

* 真实的链接：https://github.com/jishnusaurav/Phishing-attack-PCAP-analysis-using-scapy/blob/master/Phishing-Website-Detection/datasets/legitimate-urls.csv
* 钓鱼链接：https://github.com/jishnusaurav/Phishing-attack-PCAP-analysis-using-scapy/blob/master/Phishing-Website-Detection/datasets/phishing-urls.csv

### 训练机器进行预测

当数据集下载完成，我们需要使用以下几行代码来导入所需的库：

```
import pandas as pd
from sklearn.ensemble import RandomForestClassifier
```

如果你没有这些库，你可以使用 `pip` 工具来安装这些库，如下图所示：

![使用 pip 工具安装依赖库][2]

当依赖安装完成，你就可以导入数据集，并将其转换为 `pandas` 数据框架，使用以下几行代码进一步处理：

```
legitimate_urls = pd.read_csv(“/home/jishnusaurav/jupyter/Phishing-Website-Detection/datasets/legitimate-urls.csv”)
phishing_urls = pd.read_csv(“/home/jishnusaurav/jupyter/Phishing-Website-Detection/datasets/phishing-urls.csv”)
```

在成功导入后，我们需要把这两个数据集合并，以便形成一个数据集。合并后的数据集的前几行如下图所示：

![合并后的数据集的前几行][3]

然后去掉那些我们不需要的列，如路径（`path`）、协议（`protocol`）等，以达到预测的目的：

```
urls = urls.drop(urls.columns[[0,3,5]],axis=1)
```

在这之后，我们需要使用以下代码将数据集分成测试和训练两部分：

```
data_train, data_test, labels_train, labels_test = train_test_split(urls_without_labels, labels, test_size=0.30, random_state=110)
```

接着，我们使用 `sklearn` 的随机森林分类器建立一个模型，然后使用 `fit` 函数来训练这个模型。

```
random_forest_classifier = RandomForestClassifier()
random_forest_classifier.fit(data_train,labels_train)
```

完成这些后，我们就可以使用 `predict` 函数来最终预测哪些链接是钓鱼链接。下面这行可用于预测：

```
prediction_label = random_forest_classifier.predict(test_data)
```

就是这样啦！你已经建立了一个机器学习模型，它可以预测一个链接是否是钓鱼链接。试一下吧，我相信你会满意的！

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/04/detect-a-phishing-url-using-machine-learning-in-python/

作者：[Jishnu Saurav Mittapalli][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/jishnu-saurav-mittapalli/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/03/phishing-attack-696x477.jpg
[2]: https://www.opensourceforu.com/wp-content/uploads/2022/03/Figure-1-First-few-lines-of-the-data-set.jpg
[3]: https://www.opensourceforu.com/wp-content/uploads/2022/03/Figure-2-Installing-libraries.jpg

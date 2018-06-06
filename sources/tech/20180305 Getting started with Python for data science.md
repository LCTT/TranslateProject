Python用在数据科技领域的快速入门
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/GOV_open_data_520x292.jpg?itok=R8rBrlk7)

不管您是数学或计算机科学背景的初级科学爱好者，还是其他领域的专家，数字科学相关的工作机会都近在咫尺，你并不需要昂贵、高度专业化的企业软件本文所提到的开源软件工具能帮助你很容易的入门和开始学习数字科学。

与[Python][1]相配套的机器学习和数字科学相关的库，像[pandas][2]、[Keras][3]、[TensorFlow][4]、[scikit-learn][5]、[SciPy][6]、[NumPy][7]等等，以及相关扩展的可视化库，像[Matplotlib][8]、[pyplot][9]、[Plotly][10]等等，都是适合初学者和科研专家的非常好用的免费开源软件工具（FOSS，free open source software），不仅易于上手，且现在非常流行，很容易找到社区支持，此外这些开源工具还配备了专为数据科学开发的最新技术和算法模块，他们组成了您刚上手学习时最好的工具包之一。

以上提到的这些Python库中很多都是建立在彼此之上的（称之为依赖关系），其中最基础的库是[NumPy][7]。[NumPy][7]通常用于存储其ndarrary类型中数据集的相关部分，ndarrary这种数据类型在存储记录诸如`cvs`文件或其他格式的关系型数据表时十分方便，此外scikit函数在应用于多维数组时也特别方便。SQL非常适合查询数据库，但是为了执行复杂的资源密集型数据科学操作，在ndarrary数组中存储数据可以提高效率和速度（只要确保在处理大数据集的时候有足够的内存）。当您使用pandas进行知识提取和分析时，pandas中的DataFrame数据类型和NumPy中的ndarrary数据类型之间的几乎无缝转换，很大的方便了进行抽取和计算密集型的操作。


现在进行快速的演示，我们启动Python的shell并加载一个Baltimore的犯罪统计开源数据集到pandas的DataFrame变量中，并且查看一部分加载的数据：

```
>>>  import pandas as pd

>>>  crime_stats = pd.read_csv('BPD_Arrests.csv')

>>>  crime_stats.head()

```

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/crime_stats_chart.jpg?itok=_rPXJYHz)

现在我们就可以在这个DataFrame数据的基础之上进行像SQL查询数据库那样的操作。比如，获取"Description"对象所有的唯一值，可以用以下SQL语句进行查询：

```
$  SELECT  unique(“Description”)   from   crime_stats;

```

用pandas DataFrame实现同样的查询可以这样做：

```
>>>  crime_stats['Description'].unique()

['COMMON   ASSAULT'   'LARCENY'   'ROBBERY   - STREET'   'AGG.   ASSAULT'

'LARCENY   FROM   AUTO'   'HOMICIDE'   'BURGLARY'   'AUTO   THEFT'

'ROBBERY   - RESIDENCE'   'ROBBERY   - COMMERCIAL'   'ROBBERY   - CARJACKING'

'ASSAULT   BY  THREAT'   'SHOOTING'   'RAPE'   'ARSON']

```

结果会返回 NumPy 的数组 (ndarray类型的数组):
```
>>>  type(crime_stats['Description'].unique())

<class   'numpy.ndarray'>

```

接下来我们将这些数据输入到一个神经网络中，看看用它能够达到怎样的预测准确度，输出包括发生犯罪的时间，犯罪的类型和地点等相关数据。

```
>>>  from   sklearn.neural_network   import   MLPClassifier

>>>  import   numpy   as np

>>>

>>>  prediction   =  crime_stats[[‘Weapon’]]

>>>  predictors   =  crime_stats['CrimeTime',   ‘CrimeCode’,   ‘Neighborhood’]

>>>

>>>  nn_model   =  MLPClassifier(solver='lbfgs',   alpha=1e-5,   hidden_layer_sizes=(5,

2),   random_state=1)

>>>

>>>predict_weapon   =  nn_model.fit(prediction,   predictors)

```

现在模型已经准备好了，我们可以通过一些测试来验证它的效率和可靠性。首先，准备一个训练用的数据集（这个数据集是模型训练过程中使用的，并不属于创建模型的组成部分）。

```
>>>  predict_weapon.predict(training_set_weapons)

array([4,   4,   4,   ..., 0,   4,   4])

```

就像你看到的，它返回一个列表，其中每个数字用来预测训练集中记录的每一个武器。我们看到的都是数字而不是武器名称，这是因为大部分分类算法都需要通过数字化进行优化。对于数据分类，现在已经有很多可靠的转换方法来实现数字化表示。在这种情况下，使用的是标签编码技术，使用sklearn预处理库中的LabelEncoder函数：`preprocessing.LabelEncoder()`.它具有转换、逆变换数据和数字化表示的功能。在这个例子中，我们可以用`inverse_transform`函数LabelEncoder()来查看0和4分别代表的武器名称是什么。

```
>>>  preprocessing.LabelEncoder().inverse_transform(encoded_weapons)

array(['HANDS',   'FIREARM',   'HANDS',   ..., 'FIREARM',   'FIREARM',   'FIREARM']

```

这样很方便查看，但要了解这个模型的准确性，让我们以百分比的方式计算一下准确率：

```
>>>  nn_model.score(X,   y)

0.81999999999999995

```

上面的结果显示我们建立的神经网络模型精度达到82%，这个结果看起来挺不错，但是这样还不够，我们还需要在不同的犯罪数据集上验证算法的有效性。为了做到这点，可以进行相关性测试、混淆测试、矩阵测试等等。虽然我们建立的模型看起来准确性很高，但对于一般的犯罪数据集并不是非常有用，因为这个特别的数据集很多行都列出了'FIREARM'作为使用的武器。除非重新训练，不然我们的分类器很大可能性预测结果会是'FIREARM'，即便输入具有不同的分布的数据集。


在对数据进行分类之前，清理数据并去除异常值和偏差值也非常重要。预处理越好，我们观测到的准确性越高。但是，通过给模型或分类器过多的训练数据来获得高准确率（通常超过90%）反而会带来不好的结果，因为这样看起来准确率提高了，但是却会因为[过拟合][11]而导致缺不实用。

[Jupyter notebooks][12]是一个很棒的交互式命令行工具。虽然很多工具都支持命令行，但是Jupyter在你想要运行单个代码片段并且产生可视化效果时十分好用。此外，它还能比命令行终端更好的格式化数据。

[这篇文章][13]列举出了一些非常好并且免费的关于机器学习相关的资源，包括有大量的指导教程。根据你自己的兴趣爱好，还可以找到许多的开源数据集。可以首先看看一直在被[Kaggle][14]维护着的数据集，可以从他的官网上找到很多非常不错的资源。

其他python相关的资源：
--------------------------------------------------------------------------------
> * 什么是python?

via: https://opensource.com/article/18/3/getting-started-data-science

作者：[Payal Singh][a]
译者：[译者ID](https://github.com/zhouzhuowei)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/payalsingh
[1]:https://www.python.org/
[2]:https://pandas.pydata.org/
[3]:https://keras.io/
[4]:https://www.tensorflow.org/
[5]:http://scikit-learn.org/stable/
[6]:https://www.scipy.org/
[7]:http://www.numpy.org/
[8]:https://matplotlib.org/
[9]:https://matplotlib.org/api/pyplot_api.html
[10]:https://plot.ly/
[11]:https://www.kdnuggets.com/2014/06/cardinal-sin-data-mining-data-science.html
[12]:http://jupyter.org/
[13]:https://machinelearningmastery.com/best-machine-learning-resources-for-getting-started/
[14]:https://www.kaggle.com/
[15]:https://register.socallinuxexpo.org/reg6/

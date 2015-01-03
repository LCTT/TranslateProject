+在Linux中使用matplotlib进行科学画图
+================================================================================
+
+如果你想要在Linxu中获得一个高效、自动化、高质量的科学画图的解决方案，那就要考虑一下使用matplotlib库了。Matplotlib是基于python的开源科学测绘包，版权基于python软件基金许可证。大量的文档和例子，整合在Python和Numpy科学计处包中，其自动化性能是少数几个为什么这个包是在Linux环境中进行科学画图的可靠选择。这个教程将提供几个用matplotlib画图的例子。
+
+###特性###
+- 
+-众多的画图类型，如：bar,box,contour,histogram,scatter,line plots....
+-基于python的语法
+-集成Numpy科学计算包
+-可定制的画图格式（axes scales,tick positions, tick labels...)
+-可定制文本（字体，大小，位置...)
+-TeX 格式化（等式，符号，希腊字体...)
+-与IPython相兼容
+-自动化 -用Python 的循环迭代生成图片
+-保存所绘图片格式为图片文件，如：png,pdf,ps,eps,svg等
+
+
+基于Python语法的matplotlib通过许多自身特性和高效工作流基础进行表现。
+世面上有许多用于绘制高质量图的科学绘图包，但是这些包允许你直接在你的Python代码中去使用吗？
+除那以外，这些包允许你创建可以保存为图片文件的图片吗？
+Matplotlib允许你完成所有的这些任务。
+你可以期望着节省你的时间，从于使用你能够花更多的时间在如何创建更多的图片。
+
+###安装###
+ 安装Python和Numpy包是使用Matplotlib的前提，安装Numpy的指引请见该链接。[here][1].
+
+
+可以通过如下命令在Debian或Ubuntu中安装Matplotlib：
+
+    $ sudo apt-get install python-matplotlib 
+
+
+在Fedora或CentOS/RHEL环境则可用如下命令：
+    $ sudo yum install python-matplotlib 
+
+
+###Matplotlib 例子###
+
+该教程会提供几个绘图例子演示如何使用matplotlib:
+-离散和线性画图
+-柱状图画图
+-饼状图
+
+在这些例子中我们将用Python脚本来执行Mapplotlib命令。注意numpy和matplotlib模块需要通过import命令在脚本中进行导入。
+在命令空间中，np指定为nuupy模块的引用，plt指定为matplotlib.pyplot的引用：
+    import numpy as np
+    import matplotlib.pyplot as plt
+
+
+###例1：离散和线性图###
+
+第一个脚本，script1.py 完成如下任务:
+
+-创建3个数据集（xData,yData1和yData2)
+-创建一个宽8英寸、高6英寸的图(赋值1）
+-设置图画的标题、x轴标签、y轴标签（字号均为14）
+-绘制第一个数据集：yData1为xData数据集的函数，用圆点标识的离散蓝线，标识为"y1 data"
+-绘制第二个数据集：yData2为xData数据集的函数，采用红实线，标识为"y2 data"
+-把图例放置在图的左上角
+-保存图片为PNG格式文件
+
+script1.py的内容如下：
+    import numpy as np
+    import matplotlib.pyplot as plt
+     
+    xData = np.arange(0, 10, 1)
+    yData1 = xData.__pow__(2.0)
+    yData2 = np.arange(15, 61, 5)
+    plt.figure(num=1, figsize=(8, 6))
+    plt.title('Plot 1', size=14)
+    plt.xlabel('x-axis', size=14)
+    plt.ylabel('y-axis', size=14)
+    plt.plot(xData, yData1, color='b', linestyle='--', marker='o', label='y1 data')
+    plt.plot(xData, yData2, color='r', linestyle='-', label='y2 data')
+    plt.legend(loc='upper left')
+    plt.savefig('images/plot1.png', format='png')
+
+
+所画之图如下：
+![](https://farm8.staticflickr.com/7529/15927002365_f5ae11cf02_z.jpg)
+
+
+###例2：柱状图###
+
+第二个脚本，script2.py 完成如下任务：
+
+-创建一个包含1000个随机样本的正态分布数据集。
+-创建一个宽8英寸、高6英寸的图(赋值1）
+-设置图的标题、x轴标签、y轴标签（字号均为14）
+-用samples这个数据集画一个40个柱状，边从-10到10的柱状图
+-添加文本,用TeX格式显示希腊字母mu和sigma(字号为16）
+-保存图片为PNG格式。
+
+script2.py代码如下：
+    import numpy as np
+    import matplotlib.pyplot as plt
+     
+    mu = 0.0
+    sigma = 2.0
+    samples = np.random.normal(loc=mu, scale=sigma, size=1000)
+    plt.figure(num=1, figsize=(8, 6))
+    plt.title('Plot 2', size=14)
+    plt.xlabel('value', size=14)
+    plt.ylabel('counts', size=14)
+    plt.hist(samples, bins=40, range=(-10, 10))
+    plt.text(-9, 100, r'$\mu$ = 0.0, $\sigma$ = 2.0', size=16)
+    plt.savefig('images/plot2.png', format='png')
+
+
+结果见如下链接：
+![](https://farm8.staticflickr.com/7531/15304765024_1cc271b6e0_z.jpg)
+
+
+###例3：饼状图###
+
+第三个脚本，script3.py 完成如下任务：
+
+-创建一个包含5个整数的列表
+-创建一个宽6英寸、高6英寸的图(赋值1）
+-添加一个长宽比为1的轴图
+-设置图的标题（字号为14）
+-用data列表画一个包含标签的饼状图
+-保存图为PNG格式
+
+脚本script3.py的代码如下：
+    import numpy as np
+    import matplotlib.pyplot as plt
+     
+    data = [33, 25, 20, 12, 10]
+    plt.figure(num=1, figsize=(6, 6))
+    plt.axes(aspect=1)
+    plt.title('Plot 3', size=14)
+    plt.pie(data, labels=('Group 1', 'Group 2', 'Group 3', 'Group 4', 'Group 5'))
+    plt.savefig('images/plot3.png', format='png')
+
+
+结果如下链接所示：
+![](https://farm8.staticflickr.com/7504/15926356092_7c3e5217aa_z.jpg)
+
+
+###总结###
+ 这个教程提供了几个用matplotlib科学画图包进行画图的例子，Matplotlib是在Linux环境中用于解决科学画图的绝佳方案，表现在其无缝地和Python、Numpy连接,自动化能力，和提供多种自定义的高质量的画图产品。[here][2].
+
+matplotlib包的文档和例子详见：
+--------------------------------------------------------------------------------
+
+via: http://xmodulo.com/matplotlib-scientific-plotting-linux.html
+
+作者：[Joshua Reed][a]
+译者：[ideas4u](https://github.com/ideas4u)
+校对：[校对者ID](https://github.com/校对者ID)
+
+本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
+
+[a]:http://xmodulo.com/author/joshua
+[1]:http://xmodulo.com/numpy-scientific-computing-linux.html
+[2]:http://matplotlib.org/

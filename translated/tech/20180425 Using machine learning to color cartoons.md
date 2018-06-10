
使用机器学习来进行卡通上色
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/art-yearbook-paint-draw-create-creative.png?itok=t9fOdlyJ)
监督式机器学习的一个大问题是需要大量的标签数据，特别是如果你没有这些数据时——即使这是一个充斥着大数据的世界，我们大多数人依然没有大数据——这就真的是一个大问题了。

尽管少数公司可以访问某些类型的大量标签数据，但对于大多数的组织和应用来说，创造足够的正确类型的标签数据，花费还是太高了，以至于近乎不可能。在某些时候，这个领域还是一个没有太多数据的领域（比如说，当我们诊断一种稀有的疾病，或者判断一个标签是否匹配我们已知的那一点点样本时）。其他时候，通过 Amazon Turkers 或者暑假工这些人工方式来给我们需要的数据打标签，这样做的花费太高了。对于一部电影长度的视频，因为要对每一帧做标签，所以成本上涨得很快，即使是一帧一美分。

### 大数据需求的一个大问题

我们团队目前打算解决一个问题是：我们能不能在没有手绘的数百或者数千训练数据的情况下，训练出一个模型，来自动化地为黑白像素图片提供简单的配色方案。

  * 对小数据集的快速增长使用基于规则的的策略。
  * 模仿 tensorflow 图像转换的模型，Pix2Pix 框架，从而在训练数据有限的情况下实现自动化卡通渲染。
  


在这个实验中（我们称这个实验为龙画），面对深度学习庞大的对标签数据的需求，我们使用以下这种方法：

我曾见过 Pix2Pix 框架，在一篇论文（由 Isola 等人撰写的“Image-to-Image Translation with Conditional Adversarial Networks”）中描述的机器学习图像转换模型，现在设 A 图片是 B 的灰色版，在对 AB 对进行训练后，再给风景图片进行上色。我的问题和这是类似的，唯一的问题就是训练数据。

我需要的训练数据非常有限，因为我不想为了训练这个模型，一辈子画画和上色来为它提供彩色图片，深度学习模型需要成千上万（或者成百上千）的训练数据。

基于 Pix2Pix 的案例，我们需要至少 400 到 1000 的黑白、彩色成对的数据。你问我愿意画多少？可能就只有 30。我画了一小部分卡通花和卡通龙，然后去确认我是否可以把他们放进数据集中。

### 80% 的解决方案：按组件上色


![Characters colored by component rules][4]

按组件规则对黑白像素进行上色

当面对训练数据的短缺时，要问的第一个问题就是，是否有一个好的非机器学习的方法来解决我们的问题，如果没有一个完整的解决方案，那是否有一个部分的解决方案，这个部分解决方案对我们是否有好处？我们真的需要机器学习的方法来为花和龙上色吗？或者我们能为上色指定几何规则吗？


![How to color by components][6]

如何按组件进行上色

现在有一种非机器学习的方法来解决我的问题。我可以告诉一个孩子，我想怎么给我的画上色：把花的中心画成橙色，把花瓣画成黄色，把龙的身体画成橙色，把龙的尖刺画成黄色。

开始的时候，这似乎没有什么帮助，因为我们的电脑不知道什么是中心，什么是花瓣，什么是身体，什么是尖刺。但事实证明，我们可以依据连接组件来定义花和龙的部分，然后得到一个几何解决方案为我们 80% 的画来上色，虽然 80% 还不够，我们可以使用战略性违规转换、参数和机器学习来引导基于部分规则的解决方案达到 100%。

连接的组件使用的是 Windows 画图（或者类似的应用）上的色，例如，当我们对一个二进制黑白图像上色时，如果你单击一个白色像素，这个白色像素会在不穿过黑色的情况下变成一种新的颜色。在一个规则相同的卡通龙或者花的素描中，最大的白色组件就是背景，下一个最大的组件就是身体（加上手臂和腿）或者花的中心，其余的部分就是尖刺和花瓣，除了龙眼睛，它可以通过和背景的距离来做区分。

### 使用战略规则和 Pix2Pix 来达到 100%


我的一部分素描不符合规则，一条粗心画下的线可能会留下一个缺口，一条后肢可能会上成尖刺的颜色，一个小的，居中的雏菊会交换花瓣和中心的上色规则。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/dragonpaint4.png?itok=MOiaVxMS)

对于那 20% 我们不能用几何规则进行上色的部分，我们需要其他的方法来对它进行处理，我们转向 Pix2Pix 模型，它至少需要 400 到 1000 的素描/彩色对作为数据集（在 Pix2Pix 论文里的最小的数据集），里面包括违反规则的例子。

所以，对于每个违反规则的例子，我们最后都会通过手工的方式进行上色（比如后肢）或者选取一些符合规则的素描 / 彩色对来打破规则。我们在 A 中删除一些线，或者我们多转换一些，居中的花朵 A 和 B 使用相同的函数 (f) 来创造新的一对，f(A) 和 f(B)，一个小而居中的花朵，这可以加入到数据集。

### 使用高斯滤波器和同胚增大到最大

在计算机视觉中使用几何转换增强数据集是很常见的做法。例如循环，平移，和缩放。

但是如果我们需要把向日葵转换为雏菊或者把龙的鼻子变成球型和尖刺型呢？

或者如果说我们只需要大量增加数据量而不管过拟合？那我们需要比我们一开始使用的数据集大 10 到 30 倍的数据集。

![Sunflower turned into a daisy with r -> r cubed][9]

向日葵通过 r -> r 立方体方式变成一个雏菊

![Gaussian filter augmentations][11]

高斯滤波器增强

单位盘的某些同胚可以形成很好的雏菊（比如 r -> r 立方体，高斯滤波器可以改变龙的鼻子。这两者对于数据集的快速增长是非常有用的，并且产生的大量数据都是我们需要的。但是他们也会开始用一种不能仿射转换的方式来改变画的风格。

之前我们考虑的是如何自动化地设计一个简单的上色方案，上述内容激发了一个在这之外的问题：什么东西定义了艺术家的风格，不管是外部的观察者还是艺术家自己？他们什么时候确定了自己的的绘画风格呢？他们不可能没有自己画画的算法？工具、助手和合作者之间的区别是什么？

### 我们可以走多远？

我们画画的投入可以有多低？保持在一个主题之内并且风格可以辨认出为某个艺术家的作品，在这个范围内我们可以创造出多少的变化和复杂性？我们需要做什么才能完成一个有无限的长颈鹿、龙、花的游行画卷？如果我们有了这样一幅，我们可以用它来做什么？

这些都是我们会继续在后面的工作中进行探索的问题。

但是现在，规则、增强和 Pix2Pix 模型起作用了。我们可以很好地为花上色了，给龙上色也不错。


![Results: flowers colored by model trained on flowers][14]

结果：通过花这方面的模型训练来给花上色。


![Results: dragons trained on model trained on dragons][16]

结果：龙的模型训练的训练结果。

想了解更多，参与 Gretchen Greene's talk, DragonPaint – bootstrapping small data to color cartoons, 在 PyCon Cleveland 2018.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/dragonpaint-bootstrapping

作者：[K. Gretchen Greene][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[hopefully2333](https://github.com/hopefully2333)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/kggreene
[1]:https://www.mturk.com/
[2]:https://phillipi.github.io/pix2pix/
[3]:/file/393246
[4]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/dragonpaint2.png?itok=qw_q72A5 (Characters colored by component rules)
[5]:/file/393251
[6]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/dragonpaint3.png?itok=JK3TPcvp (How to color by components)
[7]:https://arxiv.org/abs/1611.07004
[8]:/file/393261
[9]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/dragonpaint5.png?itok=GvipU8l8 (Sunflower turned into a daisy with r -> r cubed)
[10]:/file/393266
[11]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/dragonpaint6.png?itok=r14I2Fyz (Gaussian filter augmentations)
[12]:https://en.wikipedia.org/wiki/Affine_transformation
[13]:/file/393271
[14]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/dragonpaint7.png?itok=xKWvyi_T (Results: flowers colored by model trained on flowers)
[15]:/file/393276
[16]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/dragonpaint8.png?itok=fSM5ovBT (Results: dragons trained on model trained on dragons)
[17]:https://us.pycon.org/2018/schedule/presentation/113/
[18]:https://us.pycon.org/2018/

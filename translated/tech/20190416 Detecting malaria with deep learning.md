[#]: collector: (lujun9972)
[#]: translator: (warmfrog)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Detecting malaria with deep learning)
[#]: via: (https://opensource.com/article/19/4/detecting-malaria-deep-learning)
[#]: author: (Dipanjan  Sarkar  https://opensource.com/users/djsarkar)

使用深度学习检测疟疾
==================
人工智能结合开源硬件工具能够提升严重传染病疟疾的诊断。
![][1]

人工智能（AI）和开源工具，技术，和框架是促进社会进步的强有力的结合。_“健康就是财富”_可能有点陈词滥调，但它却是非常准确的！在本篇文章，我们将测试 AI 是如何与低花费，有效，精确的开源深度学习方法一起被利用来检测致死的传染病疟疾。

我既不是一个医生，也不是一个医疗保健研究者，我也绝不像他们那样合格，我只是对将 AI 应用到医疗保健研究感兴趣。在这片文章中我的想法是展示 AI 和开源解决方案如何帮助疟疾检测和减少人工劳动的方法。

![Python and TensorFlow][2]

Python and TensorFlow: 一个构建开源深度学习方法的很棒的结合

感谢 Python 的强大 和像 TensorFlow 这样的深度学习框架，我们能够构建鲁棒的，大规模的，有效的深度学习方法。因为这些工具是自由和开源的，我们能够构建低成本的能够轻易被任何人采纳和使用的解决方案。让我们开始吧！

### 项目动机

疟疾是由_疟原虫_造成的致死的，有传染性的，蚊子传播的疾病，主要通过受感染的雌性按蚊叮咬传播。共有五种寄生虫能够造成疟疾，但是样例中的大多数是这两种类型- _恶性疟原虫_ 和 _间日疟原虫_ 造成的。

![疟疾热图][3]

这个地图显示了疟疾在全球传播分布形势，尤其在热带地区，但疾病的性质和致命性是该项目的主要动机。

如果一个雌性蚊子咬了你，蚊子携带的寄生虫进入你的血液并且开始破坏携带氧气的红细胞（RBC）。通常，疟疾的最初症状类似于流感病毒，在蚊子叮咬后，他们通常在几天或几周内发作。然而，这些致死的寄生虫可以在你的身体里生存长达一年并且不会造成任何症状，延迟治疗可能造成并发症甚至死亡。因此，早期的检查能够挽救生命。

世界健康组织（WHO）的[疟疾事件][4]暗示世界近乎一半的人口面临疟疾的风险，有超过 2 亿 的疟疾病例，每年由于疟疾造成的死亡近乎 40 万。这是使疟疾检测和诊断快速，简单和有效的一个动机。

### 检测疟疾的方法

有几种方法能够用来检测和诊断疟疾。该文中的项目就是基于 Rajaraman，et al. 的论文：“[预先训练的卷积神经网络作为特征提取器，用于改善薄血涂片图像中的疟疾寄生虫检测][5]”，介绍了一些方法，包含聚合酶链反应（PCR）和快速诊断测试（RDT）。这两种测试通常在高质量的显微镜下使用，但这样的设备不是轻易能够获得的。

标准的疟疾诊断通常使基于血液涂片工作流的，根据 Carlos Ariza 的文章“[Malaria Hero: 一个更快诊断疟原虫的网络应用][6]”，我从中了解到 Adrian Rosebrock 的“[使用 Keras 的深度学习和医学图像分析][7]”。我感激这些优秀的资源的作者，让我在疟原虫预防，诊断和治疗方面有了更多的想法。

![疟原虫检测的血涂片工作流程][8]

一个疟原虫检测的血涂片工作流程

根据 WHO 草案，诊断通常包括对放大 100 倍的血涂片的集中检测。训练人们人工计数在 5000 个细胞中有多少红细胞中包含疟原虫。正如上述解释中引用的 Rajaraman， et al. 的论文：

> 薄血涂片帮助检测疟原虫的存在性并且帮助识别造成传染（疾病控制和抑制中心，2012）的物种。诊断准确性在很大程度上取决于人类的专业知识，并且可能受到观察者间差异和疾病流行/资源受限区域大规模诊断所造成的不利影响（Mitiku， Mengistu， and Gelaw， 2003）。可替代的技术是使用聚合酶链反应（PCR）和快速诊断测试（RDT）；然而，PCR 分析受限于它的性能（Hommelsheim， et al.， 2014），RDT 在疾病流行的地区成本效益低(Hawkes，Katsuva， and Masumbuko， 2009)。

因此，疟疾检测可能受益于使用机器学习的自动化。

### 疟原虫检测的深度学习

人工诊断血涂片是一个加强的人工过程，需要专业知识来分类和计数被寄生虫感染的和未感染的细胞。这个过程可能不能很好的规模化，尤其在那些专业人士不足的地区。在利用最先进的图像处理和分析技术提取人工选取特征和构建基于机器学习的分类模型方面取得了一些进展。然而，这些模型不能大规模推广，因为没有更多的数据用来训练，并且人工选取特征需要花费很长时间。

深度学习模型，或者更具体地讲，卷积神经网络（CNNs），已经被证明在各种计算机视觉任务中非常有效。（如果你想有额外的关于 CNNs 的背景知识，我推荐你阅读[视觉识别的 CS2331n 卷积神经网络][9]。）简单地讲，CNN 模型的关键层包含卷积和池化层，正如下面图像显示。

![A typical CNN architecture][10]

一个典型的 CNN 架构

卷积层从数据中学习空间层级模式，它是平移不变的，因此它们能够学习不同方面的图像。例如，第一个卷积层将学习小的和本地图案，例如边缘和角落，第二个卷积层学习基于第一层的特征的更大的图案，等等。这允许 CNNs 自动化提取特征并且学习对于新数据点通用的有效的特征。池化层帮助下采样和降维。

因此，CNNs 帮助自动化和规模化的特征工程。同样，在模型末尾加上密集层允许我们执行像图像分类这样的任务。使用像 CNNs 者的深度学习模型自动的疟疾检测可能非常有效，便宜和具有规模性，尤其是迁移学习和预训练模型效果非常好，甚至在少量数据的约束下。

Rajaraman， et al. 的论文在一个数据集上利用六个预训练模型在检测疟疾 vs 无感染样本获取到令人吃惊的 95.9% 的准确率。我们的关注点是从头开始尝试一些简单的 CNN 模型和用一个预训练的训练模型使用迁移学习来查看我们能够从相同的数据集中得到什么。我们将使用开源工具和框架，包括 Python 和 TensorFlow，来构建我们的模型。

### 数据集

我们分析的数据来自 Lister Hill 国家生物医学交流中心（LHNCBC），国家医学图书馆（NLM）的一部分，他们细心收集和标记了健康和受感染的血涂片图像的[公众可获得的数据集][11]。这些研究者已经开发了一个运行在 Android 智能手机的移动[疟疾检测应用][12]，连接到一个传统的光学显微镜。它们使用 吉姆萨染液 将 150 个受恶性疟原虫感染的和 50 个健康病人的薄血涂片染色，这些薄血涂片是在孟加拉的吉大港医学院附属医院收集和照相的。使用智能手机的内置相机获取每个显微镜视窗内的图像。这些图片由在泰国曼谷的马希多-牛津热带医学研究所的一个专家使用幻灯片阅读器标记的。

让我们简洁的查看数据集的结构。首先，我将安装一些基础的依赖（基于使用的操作系统）。

![Installing dependencies][13]

我使用的是云上的带有一个 GPU 的基于 Debian 的操作系统，这样我能更快的运行我的模型。为了查看目录结构，我们必须安装 tree 依赖（如果我们没有安装的话）使用 **sudo apt install tree**。

![Installing the tree dependency][14]

我们有两个文件夹包含血细胞的图像，包括受感染的和健康的。我们可以获取关于图像总数更多的细节通过输入：


```
import os
import glob

base_dir = os.path.join('./cell_images')
infected_dir = os.path.join(base_dir,'Parasitized')
healthy_dir = os.path.join(base_dir,'Uninfected')

infected_files = glob.glob(infected_dir+'/*.png')
healthy_files = glob.glob(healthy_dir+'/*.png')
len(infected_files), len(healthy_files)

# Output
(13779, 13779)
```

看起来我们有一个平衡的 13,779 张疟疾的 和 13,779 张非疟疾的（健康的）血细胞图像。让我们根据这些构建数据帧，我们将用这些数据帧来构建我们的数据集。


```
import numpy as np
import pandas as pd

np.random.seed(42)

files_df = pd.DataFrame({
'filename': infected_files + healthy_files,
'label': ['malaria'] * len(infected_files) + ['healthy'] * len(healthy_files)
}).sample(frac=1, random_state=42).reset_index(drop=True)

files_df.head()
```

![Datasets][15]

### 构建和参所图像数据集

为了构建深度学习模型，我们需要训练数据，但是我们还需要使用不可见的数据测试模型的性能。相应的，我们将使用 60：10：30 的划分用于训练，验证和测试数据集。我们将在训练期间应用训练和验证数据集并用测试数据集来检查模型的性能。


```
from sklearn.model_selection import train_test_split
from collections import Counter

train_files, test_files, train_labels, test_labels = train_test_split(files_df['filename'].values,
files_df['label'].values,
test_size=0.3, random_state=42)
train_files, val_files, train_labels, val_labels = train_test_split(train_files,
train_labels,
test_size=0.1, random_state=42)

print(train_files.shape, val_files.shape, test_files.shape)
print('Train:', Counter(train_labels), '\nVal:', Counter(val_labels), '\nTest:', Counter(test_labels))

# Output
(17361,) (1929,) (8268,)
Train: Counter({'healthy': 8734, 'malaria': 8627})
Val: Counter({'healthy': 970, 'malaria': 959})
Test: Counter({'malaria': 4193, 'healthy': 4075})
```

这些图片维度并不相同，因此血涂片和细胞图像是基于人类，测试方法，图片的朝向。让我们总结我们的训练数据集的统计信息来决定最佳的图像维度（牢记，我们根本不会碰测试数据集）。


```
import cv2
from concurrent import futures
import threading

def get_img_shape_parallel(idx, img, total_imgs):
if idx % 5000 == 0 or idx == (total_imgs - 1):
print('{}: working on img num: {}'.format(threading.current_thread().name,
idx))
return cv2.imread(img).shape

ex = futures.ThreadPoolExecutor(max_workers=None)
data_inp = [(idx, img, len(train_files)) for idx, img in enumerate(train_files)]
print('Starting Img shape computation:')
train_img_dims_map = ex.map(get_img_shape_parallel,
[record[0] for record in data_inp],
[record[1] for record in data_inp],
[record[2] for record in data_inp])
train_img_dims = list(train_img_dims_map)
print('Min Dimensions:', np.min(train_img_dims, axis=0))
print('Avg Dimensions:', np.mean(train_img_dims, axis=0))
print('Median Dimensions:', np.median(train_img_dims, axis=0))
print('Max Dimensions:', np.max(train_img_dims, axis=0))

# Output
Starting Img shape computation:
ThreadPoolExecutor-0_0: working on img num: 0
ThreadPoolExecutor-0_17: working on img num: 5000
ThreadPoolExecutor-0_15: working on img num: 10000
ThreadPoolExecutor-0_1: working on img num: 15000
ThreadPoolExecutor-0_7: working on img num: 17360
Min Dimensions: [46 46 3]
Avg Dimensions: [132.77311215 132.45757733 3.]
Median Dimensions: [130. 130. 3.]
Max Dimensions: [385 394 3]
```

我们应用并行处理来加速图像读取，并且在总结统计时，我们将重新调整每幅图片到 125x125 像素。让我们载入我们所有的图像并重新调整它们为这些固定的大小。


```
IMG_DIMS = (125, 125)

def get_img_data_parallel(idx, img, total_imgs):
if idx % 5000 == 0 or idx == (total_imgs - 1):
print('{}: working on img num: {}'.format(threading.current_thread().name,
idx))
img = cv2.imread(img)
img = cv2.resize(img, dsize=IMG_DIMS,
interpolation=cv2.INTER_CUBIC)
img = np.array(img, dtype=np.float32)
return img

ex = futures.ThreadPoolExecutor(max_workers=None)
train_data_inp = [(idx, img, len(train_files)) for idx, img in enumerate(train_files)]
val_data_inp = [(idx, img, len(val_files)) for idx, img in enumerate(val_files)]
test_data_inp = [(idx, img, len(test_files)) for idx, img in enumerate(test_files)]

print('Loading Train Images:')
train_data_map = ex.map(get_img_data_parallel,
[record[0] for record in train_data_inp],
[record[1] for record in train_data_inp],
[record[2] for record in train_data_inp])
train_data = np.array(list(train_data_map))

print('\nLoading Validation Images:')
val_data_map = ex.map(get_img_data_parallel,
[record[0] for record in val_data_inp],
[record[1] for record in val_data_inp],
[record[2] for record in val_data_inp])
val_data = np.array(list(val_data_map))

print('\nLoading Test Images:')
test_data_map = ex.map(get_img_data_parallel,
[record[0] for record in test_data_inp],
[record[1] for record in test_data_inp],
[record[2] for record in test_data_inp])
test_data = np.array(list(test_data_map))

train_data.shape, val_data.shape, test_data.shape

# Output
Loading Train Images:
ThreadPoolExecutor-1_0: working on img num: 0
ThreadPoolExecutor-1_12: working on img num: 5000
ThreadPoolExecutor-1_6: working on img num: 10000
ThreadPoolExecutor-1_10: working on img num: 15000
ThreadPoolExecutor-1_3: working on img num: 17360

Loading Validation Images:
ThreadPoolExecutor-1_13: working on img num: 0
ThreadPoolExecutor-1_18: working on img num: 1928

Loading Test Images:
ThreadPoolExecutor-1_5: working on img num: 0
ThreadPoolExecutor-1_19: working on img num: 5000
ThreadPoolExecutor-1_8: working on img num: 8267
((17361, 125, 125, 3), (1929, 125, 125, 3), (8268, 125, 125, 3))
```

我们再次应用并行处理来加速有关图像载入和重新调整大小。最终，我们获得了想要的维度的图片张量，正如之前描述的。我们现在查看一些血细胞图像样本来对我们的数据什么样有个印象。


```
import matplotlib.pyplot as plt
%matplotlib inline

plt.figure(1 , figsize = (8 , 8))
n = 0
for i in range(16):
n += 1
r = np.random.randint(0 , train_data.shape[0] , 1)
plt.subplot(4 , 4 , n)
plt.subplots_adjust(hspace = 0.5 , wspace = 0.5)
plt.imshow(train_data[r[0]]/255.)
plt.title('{}'.format(train_labels[r[0]]))
plt.xticks([]) , plt.yticks([])
```

![Malaria cell samples][16]

基于这些样本图像，我们看到一些疟疾和健康细胞图像的细微不同。我们将使我们的深度学习模型试图在模型训练中学习这些模式。

开始我们的模型训练前，我们必须建立一些基础的配置设置。


```
BATCH_SIZE = 64
NUM_CLASSES = 2
EPOCHS = 25
INPUT_SHAPE = (125, 125, 3)

train_imgs_scaled = train_data / 255.
val_imgs_scaled = val_data / 255.

# encode text category labels
from sklearn.preprocessing import LabelEncoder

le = LabelEncoder()
le.fit(train_labels)
train_labels_enc = le.transform(train_labels)
val_labels_enc = le.transform(val_labels)

print(train_labels[:6], train_labels_enc[:6])

# Output
['malaria' 'malaria' 'malaria' 'healthy' 'healthy' 'malaria'] [1 1 1 0 0 1]
```

我们修复我们的图像维度，批大小，和历元并编码我们的分类类标签。TensorFlow 2.0 于 2019 年三月发布，这个练习是非常好的借口来试用它。


```
import tensorflow as tf

# Load the TensorBoard notebook extension (optional)
%load_ext tensorboard.notebook

tf.random.set_seed(42)
tf.__version__

# Output
'2.0.0-alpha0'
```

### 深度学习训练

在模型训练阶段，我们将构建三个深度训练模型，使用我们的训练集训练，使用验证数据比较它们的性能。我们然后保存这些模型并在之后的模型评估阶段使用它们。

#### 模型 1：从头开始的 CNN

我们的第一个疟疾检测模型将从头开始构建和训练一个基础的 CNN。首先，让我们定义我们的模型架构，


```
inp = tf.keras.layers.Input(shape=INPUT_SHAPE)

conv1 = tf.keras.layers.Conv2D(32, kernel_size=(3, 3),
activation='relu', padding='same')(inp)
pool1 = tf.keras.layers.MaxPooling2D(pool_size=(2, 2))(conv1)
conv2 = tf.keras.layers.Conv2D(64, kernel_size=(3, 3),
activation='relu', padding='same')(pool1)
pool2 = tf.keras.layers.MaxPooling2D(pool_size=(2, 2))(conv2)
conv3 = tf.keras.layers.Conv2D(128, kernel_size=(3, 3),
activation='relu', padding='same')(pool2)
pool3 = tf.keras.layers.MaxPooling2D(pool_size=(2, 2))(conv3)

flat = tf.keras.layers.Flatten()(pool3)

hidden1 = tf.keras.layers.Dense(512, activation='relu')(flat)
drop1 = tf.keras.layers.Dropout(rate=0.3)(hidden1)
hidden2 = tf.keras.layers.Dense(512, activation='relu')(drop1)
drop2 = tf.keras.layers.Dropout(rate=0.3)(hidden2)

out = tf.keras.layers.Dense(1, activation='sigmoid')(drop2)

model = tf.keras.Model(inputs=inp, outputs=out)
model.compile(optimizer='adam',
loss='binary_crossentropy',
metrics=['accuracy'])
model.summary()

# Output
Model: "model"
_________________________________________________________________
Layer (type) Output Shape Param #
=================================================================
input_1 (InputLayer) [(None, 125, 125, 3)] 0
_________________________________________________________________
conv2d (Conv2D) (None, 125, 125, 32) 896
_________________________________________________________________
max_pooling2d (MaxPooling2D) (None, 62, 62, 32) 0
_________________________________________________________________
conv2d_1 (Conv2D) (None, 62, 62, 64) 18496
_________________________________________________________________
...
...
_________________________________________________________________
dense_1 (Dense) (None, 512) 262656
_________________________________________________________________
dropout_1 (Dropout) (None, 512) 0
_________________________________________________________________
dense_2 (Dense) (None, 1) 513
=================================================================
Total params: 15,102,529
Trainable params: 15,102,529
Non-trainable params: 0
_________________________________________________________________
```

基于这些代码的架构，我们的 CNN 模型有三个卷积和一个池化层，跟随两个致密层，以及用于正则化的丢失。让我们训练我们的模型。


```
import datetime

logdir = os.path.join('/home/dipanzan_sarkar/projects/tensorboard_logs',
datetime.datetime.now().strftime("%Y%m%d-%H%M%S"))
tensorboard_callback = tf.keras.callbacks.TensorBoard(logdir, histogram_freq=1)
reduce_lr = tf.keras.callbacks.ReduceLROnPlateau(monitor='val_loss', factor=0.5,
patience=2, min_lr=0.000001)
callbacks = [reduce_lr, tensorboard_callback]

history = model.fit(x=train_imgs_scaled, y=train_labels_enc,
batch_size=BATCH_SIZE,
epochs=EPOCHS,
validation_data=(val_imgs_scaled, val_labels_enc),
callbacks=callbacks,
verbose=1)


# Output
Train on 17361 samples, validate on 1929 samples
Epoch 1/25
17361/17361 [====] - 32s 2ms/sample - loss: 0.4373 - accuracy: 0.7814 - val_loss: 0.1834 - val_accuracy: 0.9393
Epoch 2/25
17361/17361 [====] - 30s 2ms/sample - loss: 0.1725 - accuracy: 0.9434 - val_loss: 0.1567 - val_accuracy: 0.9513
...
...
Epoch 24/25
17361/17361 [====] - 30s 2ms/sample - loss: 0.0036 - accuracy: 0.9993 - val_loss: 0.3693 - val_accuracy: 0.9565
Epoch 25/25
17361/17361 [====] - 30s 2ms/sample - loss: 0.0034 - accuracy: 0.9994 - val_loss: 0.3699 - val_accuracy: 0.9559
```

我们获得了 95.6% 的验证精确率，这很好，尽管我们的模型看起来有些过拟合（通过查看我们的训练精确度，是 99.9%）。通过绘制训练和验证的精度和损失曲线，我们可以清楚地看到这一点。


```
f, (ax1, ax2) = plt.subplots(1, 2, figsize=(12, 4))
t = f.suptitle('Basic CNN Performance', fontsize=12)
f.subplots_adjust(top=0.85, wspace=0.3)

max_epoch = len(history.history['accuracy'])+1
epoch_list = list(range(1,max_epoch))
ax1.plot(epoch_list, history.history['accuracy'], label='Train Accuracy')
ax1.plot(epoch_list, history.history['val_accuracy'], label='Validation Accuracy')
ax1.set_xticks(np.arange(1, max_epoch, 5))
ax1.set_ylabel('Accuracy Value')
ax1.set_xlabel('Epoch')
ax1.set_title('Accuracy')
l1 = ax1.legend(loc="best")

ax2.plot(epoch_list, history.history['loss'], label='Train Loss')
ax2.plot(epoch_list, history.history['val_loss'], label='Validation Loss')
ax2.set_xticks(np.arange(1, max_epoch, 5))
ax2.set_ylabel('Loss Value')
ax2.set_xlabel('Epoch')
ax2.set_title('Loss')
l2 = ax2.legend(loc="best")
```

![Learning curves for basic CNN][17]

基础 CNN 学习曲线

我们可以看在在第五个历元，情况并没有改善很多。让我们保存这个模型用于将来的评估。


```
`model.save('basic_cnn.h5')`
```

#### 深度迁移学习

就像人类有与生俱来的能力在不同任务间传输知识，迁移学习允许我们利用从以前任务学到的知识用到新的任务，相关的任务，甚至在机器学习或深度学习的上下文中。如果想深入探究迁移学习，你应该看我的文章“[一个易于理解与现实应用一起学习深度学习中的迁移学习的指导实践][18]”和我的书[ Python 迁移学习实践][19]。

![深度迁移学习的想法][20]

在这篇实践中我们想要探索的想法是：

> 在我们的问题上下文中，我们能够利用一个预训练深度学习模型（在大数据集上训练的，像 ImageNet）通过应用和迁移知识来解决疟疾检测的问题吗？

我们将应用两个深度迁移学习的最流行的策略。

  * 预训练模型作为特征提取器
  * 微调的预训练模型



我们将使用预训练的 VGG-19 深度训练模型，由剑桥大学的视觉几何组（VGG）开发，作为我们的实验。一个像 VGG-19 的预训练模型在一个大的数据集上使用了很多不同的图像分类训练（[Imagenet][21]）。因此，这个模型应该已经学习到了鲁棒的特征层级结构，相对于你的 CNN 模型学到的特征，是空间不变的，转动不变的，平移不变的。因此，这个模型，已经从百万幅图片中学习到了一个好的特征显示，对于像疟疾检测这样的计算机视觉问题，可以作为一个好的合适新图像的特征提取器。在我们的问题中释放迁移学习的能力之前，让我们先讨论 VGG-19 模型。

##### 理解 VGG-19 模型

VGG-19 模型是一个构建在 ImageNet 数据库之上的 19 层（卷积和全连接的）的深度学习网络，该数据库为了图像识别和分类的目的而开发。该模型由 Karen Simonyan 和 Andrew Zisserman 构建，在它们的论文”[大规模图像识别的非常深的卷积网络][22]“中描述。VGG-19 的架构模型是：

![VGG-19 模型架构][23]

你可以看到我们总共有 16 个使用 3x3 卷积过滤器的卷积层，与最大的池化层来下采样，和由 4096 个单元组成的两个全连接的隐藏层，每个隐藏层之后跟随一个由 1000 个单元组成的致密层，每个单元代表 ImageNet 数据库中的一个分类。我们不需要最后三层，因为我们将使用我们自己的全连接致密层来预测疟疾。我们更关心前五块，因此我们可以利用 VGG 模型作为一个有效的特征提取器。

我们将使用模型之一作为一个简单的特征提取器通过冻结五个卷积块的方式来确保它们的位权在每个时期后不会更新。对于最后一个模型，我们会应用微调到 VGG 模型，我们会解冻最后两个块（第 4 和第 5）因此当我们训练我们的模型时，它们的位权在每个时期（每批数据）被更新。

#### 模型 2：预训练的模型作为一个特征提取器

为了构建这个模型，我们将利用 TensorFlow 载入 VGG-19 模型并且冻结卷积块因此我们用够将他们用作特征提取器。我们插入我们自己的致密层在末尾来执行分类任务。


```
vgg = tf.keras.applications.vgg19.VGG19(include_top=False, weights='imagenet',
input_shape=INPUT_SHAPE)
vgg.trainable = False
# Freeze the layers
for layer in vgg.layers:
layer.trainable = False

base_vgg = vgg
base_out = base_vgg.output
pool_out = tf.keras.layers.Flatten()(base_out)
hidden1 = tf.keras.layers.Dense(512, activation='relu')(pool_out)
drop1 = tf.keras.layers.Dropout(rate=0.3)(hidden1)
hidden2 = tf.keras.layers.Dense(512, activation='relu')(drop1)
drop2 = tf.keras.layers.Dropout(rate=0.3)(hidden2)

out = tf.keras.layers.Dense(1, activation='sigmoid')(drop2)

model = tf.keras.Model(inputs=base_vgg.input, outputs=out)
model.compile(optimizer=tf.keras.optimizers.RMSprop(lr=1e-4),
loss='binary_crossentropy',
metrics=['accuracy'])
model.summary()

# Output
Model: "model_1"
_________________________________________________________________
Layer (type) Output Shape Param #
=================================================================
input_2 (InputLayer) [(None, 125, 125, 3)] 0
_________________________________________________________________
block1_conv1 (Conv2D) (None, 125, 125, 64) 1792
_________________________________________________________________
block1_conv2 (Conv2D) (None, 125, 125, 64) 36928
_________________________________________________________________
...
...
_________________________________________________________________
block5_pool (MaxPooling2D) (None, 3, 3, 512) 0
_________________________________________________________________
flatten_1 (Flatten) (None, 4608) 0
_________________________________________________________________
dense_3 (Dense) (None, 512) 2359808
_________________________________________________________________
dropout_2 (Dropout) (None, 512) 0
_________________________________________________________________
dense_4 (Dense) (None, 512) 262656
_________________________________________________________________
dropout_3 (Dropout) (None, 512) 0
_________________________________________________________________
dense_5 (Dense) (None, 1) 513
=================================================================
Total params: 22,647,361
Trainable params: 2,622,977
Non-trainable params: 20,024,384
_________________________________________________________________
```

输出是很明白的，在我们的模型中我们有了很多层，我们将只利用 VGG-19 模型的冻结层作为特征提取器。你可以使用下列代码来验证我们的模型有多少层是实际训练的，我们的网络中总共存在多少层。


```
print("Total Layers:", len(model.layers))
print("Total trainable layers:",
sum([1 for l in model.layers if l.trainable]))

# Output
Total Layers: 28
Total trainable layers: 6
```

我们将使用和我们之前的模型相似的配置和回调来训练我们的模型。参考 [我的 GitHub 仓库][24] 获取训练模型的完整代码。我们观察下列显示模型精确度和损失曲线。

![Learning curves for frozen pre-trained CNN][25]

冻结的预训练的 CNN 的学习曲线

这显示了我们的模型没有像我们的基础 CNN 模型那样过拟合，但是性能有点不如我们的基础的 CNN 模型。让我们保存这个模型用户将来的评估。


```
`model.save('vgg_frozen.h5')`
```

#### 模型 3：使用图像增强来微调预训练的模型

在我们的最后一个模型中，我们微调预定义好的 VGG-19 模型的最后两个块中层的位权。我们同样引入图像增强的概念。图像增强背后的想法和名字一样。我们从训练数据集中载入已存在的图像，并且应用转换操作，例如旋转，裁剪，转换，放大缩小，等等，来产生新的，改变的版本。由于这些随机的转换，我们每次获取到的图像不一样。我们将应用一个在 **tf.keras**  的优秀的工具叫做 **ImageDataGenerator** 来帮助构建图像增强器。


```
train_datagen = tf.keras.preprocessing.image.ImageDataGenerator(rescale=1./255,
zoom_range=0.05,
rotation_range=25,
width_shift_range=0.05,
height_shift_range=0.05,
shear_range=0.05, horizontal_flip=True,
fill_mode='nearest')

val_datagen = tf.keras.preprocessing.image.ImageDataGenerator(rescale=1./255)

# build image augmentation generators
train_generator = train_datagen.flow(train_data, train_labels_enc, batch_size=BATCH_SIZE, shuffle=True)
val_generator = val_datagen.flow(val_data, val_labels_enc, batch_size=BATCH_SIZE, shuffle=False)
```

我们不会应用任何转换在我们的验证数据集上（除非是调整大小，它是强制性适应的）因为我们将在每个时期来评估我们的模型性能。对于在传输学习上下文中的图像增强的详细解释，请自由查看我们上述引用的[文章][18]。让我们从一批图像增强转换中查看一些样本结果。


```
img_id = 0
sample_generator = train_datagen.flow(train_data[img_id:img_id+1], train_labels[img_id:img_id+1],
batch_size=1)
sample = [next(sample_generator) for i in range(0,5)]
fig, ax = plt.subplots(1,5, figsize=(16, 6))
print('Labels:', [item[1][0] for item in sample])
l = [ax[i].imshow(sample[i][0][0]) for i in range(0,5)]
```

![Sample augmented images][26]

你可以清晰的看到与之前的输出中我们图像的轻微变化。我们现在构建我们的学习模型，确保 VGG-19 模型的最后两块是可以训练的。


```
vgg = tf.keras.applications.vgg19.VGG19(include_top=False, weights='imagenet',
input_shape=INPUT_SHAPE)
# Freeze the layers
vgg.trainable = True

set_trainable = False
for layer in vgg.layers:
if layer.name in ['block5_conv1', 'block4_conv1']:
set_trainable = True
if set_trainable:
layer.trainable = True
else:
layer.trainable = False

base_vgg = vgg
base_out = base_vgg.output
pool_out = tf.keras.layers.Flatten()(base_out)
hidden1 = tf.keras.layers.Dense(512, activation='relu')(pool_out)
drop1 = tf.keras.layers.Dropout(rate=0.3)(hidden1)
hidden2 = tf.keras.layers.Dense(512, activation='relu')(drop1)
drop2 = tf.keras.layers.Dropout(rate=0.3)(hidden2)

out = tf.keras.layers.Dense(1, activation='sigmoid')(drop2)

model = tf.keras.Model(inputs=base_vgg.input, outputs=out)
model.compile(optimizer=tf.keras.optimizers.RMSprop(lr=1e-5),
loss='binary_crossentropy',
metrics=['accuracy'])

print("Total Layers:", len(model.layers))
print("Total trainable layers:", sum([1 for l in model.layers if l.trainable]))

# Output
Total Layers: 28
Total trainable layers: 16
```

在我们的模型中我们降低了学习率，因为我们微调的时候不想在预训练的数据集上做大的位权更新。模型的训练过程可能有轻微的不同，因为我们使用了数据生成器，因此我们应用了 **fit_generator(...)** 函数。


```
tensorboard_callback = tf.keras.callbacks.TensorBoard(logdir, histogram_freq=1)
reduce_lr = tf.keras.callbacks.ReduceLROnPlateau(monitor='val_loss', factor=0.5,
patience=2, min_lr=0.000001)

callbacks = [reduce_lr, tensorboard_callback]
train_steps_per_epoch = train_generator.n // train_generator.batch_size
val_steps_per_epoch = val_generator.n // val_generator.batch_size
history = model.fit_generator(train_generator, steps_per_epoch=train_steps_per_epoch, epochs=EPOCHS,
validation_data=val_generator, validation_steps=val_steps_per_epoch,
verbose=1)

# Output
Epoch 1/25
271/271 [====] - 133s 489ms/step - loss: 0.2267 - accuracy: 0.9117 - val_loss: 0.1414 - val_accuracy: 0.9531
Epoch 2/25
271/271 [====] - 129s 475ms/step - loss: 0.1399 - accuracy: 0.9552 - val_loss: 0.1292 - val_accuracy: 0.9589
...
...
Epoch 24/25
271/271 [====] - 128s 473ms/step - loss: 0.0815 - accuracy: 0.9727 - val_loss: 0.1466 - val_accuracy: 0.9682
Epoch 25/25
271/271 [====] - 128s 473ms/step - loss: 0.0792 - accuracy: 0.9729 - val_loss: 0.1127 - val_accuracy: 0.9641
```

这看起来是我们的最好的模型。它给了我们近乎 96.5% 的验证精确率，基于训练精度，它看起来不像我们的第一个模型那样过拟合。这可以通过下列的学习曲线验证。

![Learning curves for fine-tuned pre-trained CNN][27]

微调预训练的 CNN 的学习曲线

让我们保存这个模型，因此我们能够在测试集上使用。


```
`model.save('vgg_finetuned.h5')`
```

这完成了我们的模型训练阶段。我们准备好在测试集上测试我们模型的性能。

### 深度学习模型性能评估

我们将评估我们在训练阶段构建的三个模型，通过在我们的测试集上做预测，因为仅仅验证是不够的！我们同样构建了一个检测工具模块叫做 **model_evaluation_utils**，我们可以使用相关分类指标用来评估使用我们深度学习模型的性能。第一步是测量我们的数据集。


```
test_imgs_scaled = test_data / 255.
test_imgs_scaled.shape, test_labels.shape

# Output
((8268, 125, 125, 3), (8268,))
```

下一步包括载入我们保存的深度学习模型，在测试集上预测。


```
# Load Saved Deep Learning Models
basic_cnn = tf.keras.models.load_model('./basic_cnn.h5')
vgg_frz = tf.keras.models.load_model('./vgg_frozen.h5')
vgg_ft = tf.keras.models.load_model('./vgg_finetuned.h5')

# Make Predictions on Test Data
basic_cnn_preds = basic_cnn.predict(test_imgs_scaled, batch_size=512)
vgg_frz_preds = vgg_frz.predict(test_imgs_scaled, batch_size=512)
vgg_ft_preds = vgg_ft.predict(test_imgs_scaled, batch_size=512)

basic_cnn_pred_labels = le.inverse_transform([1 if pred > 0.5 else 0
for pred in basic_cnn_preds.ravel()])
vgg_frz_pred_labels = le.inverse_transform([1 if pred > 0.5 else 0
for pred in vgg_frz_preds.ravel()])
vgg_ft_pred_labels = le.inverse_transform([1 if pred > 0.5 else 0
for pred in vgg_ft_preds.ravel()])
```

下一步是应用我们的 **model_evaluation_utils** 模块根据相应分类指标来检查每个模块的性能。


```
import model_evaluation_utils as meu
import pandas as pd

basic_cnn_metrics = meu.get_metrics(true_labels=test_labels, predicted_labels=basic_cnn_pred_labels)
vgg_frz_metrics = meu.get_metrics(true_labels=test_labels, predicted_labels=vgg_frz_pred_labels)
vgg_ft_metrics = meu.get_metrics(true_labels=test_labels, predicted_labels=vgg_ft_pred_labels)

pd.DataFrame([basic_cnn_metrics, vgg_frz_metrics, vgg_ft_metrics],
index=['Basic CNN', 'VGG-19 Frozen', 'VGG-19 Fine-tuned'])
```

![Model accuracy][28]

看起来我们的第三个模型在我们的测试集上执行的最好，给出了一个模型精确性为 96% 的 F1得分，比起上述我们早期引用的研究论文和文章中提及的复杂的模型是相当好的。

### 总结

疟疾检测不是一个简单的程序，全球的合格的人员的可获得性在样例诊断和治疗当中是一个严重的问题。我们看到一个关于疟疾的有趣的真实世界的医学影像案例。易于构建的，开源的技术利用 AI 在检测疟疾方面可以给我们最先进的精确性，因此允许 AI 对社会是有益的。

我鼓励你检查这片文章中提到的文章和研究论文，没有它们，我就不能形成概念并写出来。如果你对运行和采纳这些技术感兴趣，本篇文章所有的代码都可以在[我的 GitHub 仓库][24]获得。记得从[官方网站][11]下载数据。

让我们希望在健康医疗方面更多的采纳开源的 AI 能力，使它在世界范围内变得便宜些，易用些。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/detecting-malaria-deep-learning

作者：[Dipanjan (DJ) Sarkar (Red Hat)][a]
选题：[lujun9972][b]
译者：[warmfrog](https://github.com/warmfrog)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/djsarkar
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_520x292_opensourcedoctor.png?itok=fk79NwpC
[2]: https://opensource.com/sites/default/files/uploads/malaria1_python-tensorflow.png (Python and TensorFlow)
[3]: https://opensource.com/sites/default/files/uploads/malaria2_malaria-heat-map.png (Malaria heat map)
[4]: https://www.who.int/features/factfiles/malaria/en/
[5]: https://peerj.com/articles/4568/
[6]: https://blog.insightdatascience.com/https-blog-insightdatascience-com-malaria-hero-a47d3d5fc4bb
[7]: https://www.pyimagesearch.com/2018/12/03/deep-learning-and-medical-image-analysis-with-keras/
[8]: https://opensource.com/sites/default/files/uploads/malaria3_blood-smear.png (Blood smear workflow for Malaria detection)
[9]: http://cs231n.github.io/convolutional-networks/
[10]: https://opensource.com/sites/default/files/uploads/malaria4_cnn-architecture.png (A typical CNN architecture)
[11]: https://ceb.nlm.nih.gov/repositories/malaria-datasets/
[12]: https://www.ncbi.nlm.nih.gov/pubmed/29360430
[13]: https://opensource.com/sites/default/files/uploads/malaria5_dependencies.png (Installing dependencies)
[14]: https://opensource.com/sites/default/files/uploads/malaria6_tree-dependency.png (Installing the tree dependency)
[15]: https://opensource.com/sites/default/files/uploads/malaria7_dataset.png (Datasets)
[16]: https://opensource.com/sites/default/files/uploads/malaria8_cell-samples.png (Malaria cell samples)
[17]: https://opensource.com/sites/default/files/uploads/malaria9_learningcurves.png (Learning curves for basic CNN)
[18]: https://towardsdatascience.com/a-comprehensive-hands-on-guide-to-transfer-learning-with-real-world-applications-in-deep-learning-212bf3b2f27a
[19]: https://github.com/dipanjanS/hands-on-transfer-learning-with-python
[20]: https://opensource.com/sites/default/files/uploads/malaria10_transferideas.png (Ideas for deep transfer learning)
[21]: http://image-net.org/index
[22]: https://arxiv.org/pdf/1409.1556.pdf
[23]: https://opensource.com/sites/default/files/uploads/malaria11_vgg-19-model-architecture.png (VGG-19 Model Architecture)
[24]: https://nbviewer.jupyter.org/github/dipanjanS/data_science_for_all/tree/master/os_malaria_detection/
[25]: https://opensource.com/sites/default/files/uploads/malaria12_learningcurves.png (Learning curves for frozen pre-trained CNN)
[26]: https://opensource.com/sites/default/files/uploads/malaria13_sampleimages.png (Sample augmented images)
[27]: https://opensource.com/sites/default/files/uploads/malaria14_learningcurves.png (Learning curves for fine-tuned pre-trained CNN)
[28]: https://opensource.com/sites/default/files/uploads/malaria15_modelaccuracy.png (Model accuracy)

如何使用 Android Things 和 TensorFlow 在物联网上应用机器学习
=============================

![](https://www.survivingwithandroid.com/wp-content/uploads/2018/03/Apply_Machine_Learning_to_IoT.png)

> 探索如何将 Android Things 与 Tensorflow 集成起来，以及如何应用机器学习到物联网系统上。学习如何在装有 Android Things 的树莓派上使用 Tensorflow 进行图片分类。

这个项目探索了如何将机器学习应用到物联网上。具体来说，物联网平台我们将使用 **Android Things**，而机器学习引擎我们将使用 **Google TensorFlow**。

现如今，Android Things 处于名为 Android Things 1.0 的稳定版本，已经可以用在生产系统中了。如你可能已经知道的，树莓派是一个可以支持 Android Things 1.0 做开发和原型设计的平台。本教程将使用 Android Things 1.0 和树莓派，当然，你可以无需修改代码就能换到其它所支持的平台上。这个教程是关于如何将机器学习应用到物联网的，这个物联网平台就是 Android Things Raspberry Pi。

物联网上的机器学习是最热门的话题之一。要给机器学习一个最简单的定义，可能就是 [维基百科上的定义][13]：

> 机器学习是计算机科学中，让计算机不需要显式编程就能去“学习”（即，逐步提升在特定任务上的性能）使用数据的一个领域。

换句话说就是，经过训练之后，那怕是它没有针对它们进行特定的编程，这个系统也能够预测结果。另一方面，我们都知道物联网和联网设备的概念。其中前景最看好的领域之一就是如何在物联网上应用机器学习，构建专家系统，这样就能够去开发一个能够“学习”的系统。此外，还可以使用这些知识去控制和管理物理对象。在深入了解 Android Things 的细节之前，你应该先将其安装在你的设备上。如果你是第一次使用 Android Things，你可以阅读一下这篇[如何在你的设备上安装 Android Things][14] 的教程。

这里有几个应用机器学习和物联网产生重要价值的领域，以下仅提到了几个有趣的领域，它们是：

*   在工业物联网（IIoT）中的预见性维护
*   消费物联网中，机器学习可以让设备更智能，它通过调整使设备更适应我们的习惯

在本教程中，我们希望去探索如何使用 Android Things 和 TensorFlow 在物联网上应用机器学习。这个 Adnroid Things 物联网项目的基本想法是，探索如何去*构建一个能够识别前方道路上基本形状（比如箭头）并控制其道路方向的无人驾驶汽车*。我们已经介绍了 [如何使用 Android Things 去构建一个无人驾驶汽车][5]，因此，在开始这个项目之前，我们建议你去阅读那个教程。

这个机器学习和物联网项目包含如下的主题：

*   如何使用 Docker 配置 TensorFlow 环境
*   如何训练 TensorFlow 系统
*   如何使用 Android Things 去集成 TensorFlow
*   如何使用 TensorFlow 的成果去控制无人驾驶汽车

这个项目起源于 [Android Things TensorFlow 图像分类器][6]。

我们开始吧！

### 如何使用 Tensorflow 图像识别

在开始之前，需要安装和配置 TensorFlow 环境。我不是机器学习方面的专家，因此，我需要找到一些快速而能用的东西，以便我们可以构建 TensorFlow 图像识别器。为此，我们使用 Docker 去运行一个 TensorFlow 镜像。以下是操作步骤：

1、  克隆 TensorFlow 仓库：

```
git clone https://github.com/tensorflow/tensorflow.git
cd /tensorflow
git checkout v1.5.0
```

2、  创建一个目录（`/tf-data`），它将用于保存这个项目中使用的所有文件。

3、  运行 Docker：

```
docker run -it \
--volume /tf-data:/tf-data \
--volume /tensorflow:/tensorflow \
--workdir /tensorflow tensorflow/tensorflow:1.5.0 bash
```

使用这个命令，我们运行一个交互式 TensorFlow 环境，可以挂载一些在使用项目期间使用的目录。

### 如何训练 TensorFlow 去识别图像

在 Android Things 系统能够识别图像之前，我们需要去训练 TensorFlow 引擎，以使它能够构建它的模型。为此，我们需要去收集一些图像。正如前面所言，我们需要使用箭头来控制 Android Things 无人驾驶汽车，因此，我们至少要收集四种类型的箭头：

*   向上的箭头
*   向下的箭头
*   向左的箭头
*   向右的箭头

为训练这个系统，需要使用这四类不同的图像去创建一个“知识库”。在 `/tf-data` 目录下创建一个名为 `images` 的目录，然后在它下面创建如下名字的四个子目录：

*   `up-arrow`
*   `down-arrow`
*   `left-arrow`
*   `right-arrow`

现在，我们去找图片。我使用的是 Google 图片搜索，你也可以使用其它的方法。为了简化图片下载过程，你可以安装一个 Chrome 下载插件，这样你只需要点击就可以下载选定的图片。别忘了多下载一些图片，这样训练效果更好，当然，这样创建模型的时间也会相应增加。

**扩展阅读**

- [如何使用 API 去集成 Android Things][2]
- [如何与 Firebase 一起使用 Android Things][3]

打开浏览器，开始去查找四种箭头的图片：

![TensorFlow image classifier](https://www.survivingwithandroid.com/wp-content/uploads/2018/03/TensorFlow-image-classifier.png)

每个类别我下载了 80 张图片。不用管图片文件的扩展名。

为所有类别的图片做一次如下的操作（在 Docker 界面下）：

```
python /tensorflow/examples/image_retraining/retrain.py \ 
--bottleneck_dir=tf_files/bottlenecks \
--how_many_training_steps=4000 \
--output_graph=/tf-data/retrained_graph.pb \
--output_labels=/tf-data/retrained_labels.txt \
--image_dir=/tf-data/images
```

这个过程你需要耐心等待，它需要花费很长时间。结束之后，你将在 `/tf-data` 目录下发现如下的两个文件：

1.  `retrained_graph.pb`
2.  `retrained_labels.txt`

第一个文件包含了 TensorFlow 训练过程产生的结果模型，而第二个文件包含了我们的四个图片类相关的标签。

### 如何测试 Tensorflow 模型

如果你想去测试这个模型，去验证它是否能按预期工作，你可以使用如下的命令：

```
python scripts.label_image \
--graph=/tf-data/retrained-graph.pb \
--image=/tf-data/images/[category]/[image_name.jpg]
```

### 优化模型

在 Android Things 项目中使用我们的 TensorFlow 模型之前，需要去优化它：

```
python /tensorflow/python/tools/optimize_for_inference.py \
--input=/tf-data/retrained_graph.pb \
--output=/tf-data/opt_graph.pb \
--input_names="Mul" \
--output_names="final_result"
```

那个就是我们全部的模型。我们将使用这个模型，把 TensorFlow 与 Android Things 集成到一起，在物联网或者更多任务上应用机器学习。目标是使用 Android Things 应用程序智能识别箭头图片，并反应到接下来的无人驾驶汽车的方向控制上。

如果你想去了解关于 TensorFlow 以及如何生成模型的更多细节，请查看官方文档以及这篇 [教程][8]。

### 如何使用 Android Things 和 TensorFlow 在物联网上应用机器学习

TensorFlow 的数据模型准备就绪之后，我们继续下一步：如何将 Android Things 与 TensorFlow 集成到一起。为此，我们将这个任务分为两步来完成：

1.  硬件部分，我们将把电机和其它部件连接到 Android Things 开发板上
2.  实现这个应用程序

### Android Things 示意图

在深入到如何连接外围部件之前，先列出在这个 Android Things 项目中使用到的组件清单：

1.  Android Things 开发板（树莓派 3）
2.  树莓派摄像头
3.  一个 LED 灯
4.  LN298N 双 H 桥电机驱动模块（连接控制电机）
5.  一个带两个轮子的无人驾驶汽车底盘

我不再重复 [如何使用 Android Things 去控制电机][9] 了，因为在以前的文章中已经讲过了。

下面是示意图：

![Integrating Android Things with IoT](https://www.survivingwithandroid.com/wp-content/uploads/2018/03/tensor_bb.png)

上图中没有展示摄像头。最终成果如下图：

![Integrating Android Things with TensorFlow](https://www.survivingwithandroid.com/wp-content/uploads/2018/03/android_things_with_tensorflow-min.jpg)

### 使用 TensorFlow 实现 Android Things 应用程序

最后一步是实现 Android Things 应用程序。为此，我们可以复用 Github 上名为 [TensorFlow 图片分类器示例][12] 的示例代码。开始之前，先克隆 Github 仓库，这样你就可以修改源代码。

这个 Android Things 应用程序与原始的应用程序是不一样的，因为：

1.  它不使用按钮去开启摄像头图像捕获
2.  它使用了不同的模型
3.  它使用一个闪烁的 LED 灯来提示，摄像头将在 LED 停止闪烁后拍照
4.  当 TensorFlow 检测到图像时（箭头）它将控制电机。此外，在第 3 步的循环开始之前，它将打开电机 5 秒钟。

为了让 LED 闪烁，使用如下的代码：

```
private Handler blinkingHandler = new Handler();
private Runnable blinkingLED = new Runnable() {
  @Override
  public void run() {
    try {
     // If the motor is running the app does not start the cam
     if (mc.getStatus())
       return ;

     Log.d(TAG, "Blinking..");
     mReadyLED.setValue(!mReadyLED.getValue());
     if (currentValue <= NUM_OF_TIMES) {
       currentValue++;
       blinkingHandler.postDelayed(blinkingLED, 
                       BLINKING_INTERVAL_MS);
     }
     else {
      mReadyLED.setValue(false);
      currentValue = 0;
      mBackgroundHandler.post(mBackgroundClickHandler);
     }
   } catch (IOException e) {
     e.printStackTrace();
   }
  }
};
```

当 LED 停止闪烁后，应用程序将捕获图片。

现在需要去关心如何根据检测到的图片去控制电机。修改这个方法：

```
@Override
public void onImageAvailable(ImageReader reader) {
  final Bitmap bitmap;
   try (Image image = reader.acquireNextImage()) {
     bitmap = mImagePreprocessor.preprocessImage(image);
   }

   final List<Classifier.Recognition> results = 
      mTensorFlowClassifier.doRecognize(bitmap);

   Log.d(TAG, 
    "Got the following results from Tensorflow: " + results);

   // Check the result
   if (results == null || results.size() == 0) {
     Log.d(TAG, "No command..");
     blinkingHandler.post(blinkingLED);
     return ;
    }

    Classifier.Recognition rec = results.get(0);
    Float confidence = rec.getConfidence();
    Log.d(TAG, "Confidence " + confidence.floatValue());

    if (confidence.floatValue() &lt; 0.55) {
     Log.d(TAG, "Confidence too low..");
     blinkingHandler.post(blinkingLED);
     return ;
    }

    String command = rec.getTitle();
    Log.d(TAG, "Command: " + rec.getTitle());

    if (command.indexOf("down") != -1)
       mc.backward();
    else if (command.indexOf("up") != -1)
       mc.forward();
    else if (command.indexOf("left") != -1)
       mc.turnLeft();
    else if (command.indexOf("right") != -1)
       mc.turnRight();
}
```

在这个方法中，当 TensorFlow 返回捕获的图片匹配到的可能的标签之后，应用程序将比较这个结果与可能的方向，并因此来控制电机。

最后，将去使用前面创建的模型了。拷贝 `assets` 文件夹下的 `opt_graph.pb` 和 `reatrained_labels.txt` 去替换现在的文件。

打开 `Helper.java` 并修改如下的行：

```
public static final int IMAGE_SIZE = 299;
private static final int IMAGE_MEAN = 128;
private static final float IMAGE_STD = 128;
private static final String LABELS_FILE = "retrained_labels.txt";
public static final String MODEL_FILE = "file:///android_asset/opt_graph.pb";
public static final String INPUT_NAME = "Mul";
public static final String OUTPUT_OPERATION = "output";
public static final String OUTPUT_NAME = "final_result";
```

运行这个应用程序，并给摄像头展示几种箭头，以检查它的反应。无人驾驶汽车将根据展示的箭头进行移动。

### 总结

教程到此结束，我们讲解了如何使用 Android Things 和 TensorFlow 在物联网上应用机器学习。我们使用图片去控制无人驾驶汽车的移动。

--------------------------------------------------------------------------------

via: https://www.survivingwithandroid.com/2018/03/apply-machine-learning-iot-using-android-things-tensorflow.html

作者：[Francesco Azzola][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.survivingwithandroid.com/author/francesco-azzolagmail-com
[1]:https://www.survivingwithandroid.com/author/francesco-azzolagmail-com
[2]:https://www.survivingwithandroid.com/2017/11/building-a-restful-api-interface-using-android-things.html
[3]:https://www.survivingwithandroid.com/2017/10/synchronize-android-things-with-firebase-real-time-control-firebase-iot.html
[4]:http://pinterest.com/pin/create/bookmarklet/?media=data:image/gif;base64,R0lGODdhAQABAPAAAP///wAAACwAAAAAAQABAEACAkQBADs=&amp;url=https://www.survivingwithandroid.com/2018/03/apply-machine-learning-iot-using-android-things-tensorflow.html&amp;is_video=false&amp;description=Machine%20Learning%20with%20Android%20Things
[5]:https://www.survivingwithandroid.com/2017/12/building-a-remote-controlled-car-using-android-things-gpio.html
[6]:https://github.com/androidthings/sample-tensorflow-imageclassifier
[7]:http://pinterest.com/pin/create/bookmarklet/?media=data:image/gif;base64,R0lGODdhAQABAPAAAP///wAAACwAAAAAAQABAEACAkQBADs=&amp;url=https://www.survivingwithandroid.com/2018/03/apply-machine-learning-iot-using-android-things-tensorflow.html&amp;is_video=false&amp;description=TensorFlow%20image%20classifier
[8]:https://codelabs.developers.google.com/codelabs/tensorflow-for-poets/#0
[9]:https://www.survivingwithandroid.com/2017/12/building-a-remote-controlled-car-using-android-things-gpio.html
[10]:http://pinterest.com/pin/create/bookmarklet/?media=data:image/gif;base64,R0lGODdhAQABAPAAAP///wAAACwAAAAAAQABAEACAkQBADs=&amp;url=https://www.survivingwithandroid.com/2018/03/apply-machine-learning-iot-using-android-things-tensorflow.html&amp;is_video=false&amp;description=Integrating%20Android%20Things%20with%20IoT
[11]:http://pinterest.com/pin/create/bookmarklet/?media=data:image/gif;base64,R0lGODdhAQABAPAAAP///wAAACwAAAAAAQABAEACAkQBADs=&amp;url=https://www.survivingwithandroid.com/2018/03/apply-machine-learning-iot-using-android-things-tensorflow.html&amp;is_video=false&amp;description=Integrating%20Android%20Things%20with%20TensorFlow
[12]:https://github.com/androidthings/sample-tensorflow-imageclassifier
[13]:https://en.wikipedia.org/wiki/Machine_learning
[14]:https://www.survivingwithandroid.com/2017/01/android-things-android-internet-of-things.html
在 Ubuntu 16.04 中安装支持 CPU 和 GPU 的 Google TensorFlow 神经网络软件
============================================================
 
TensorFlow 是用于机器学习任务的开源软件。它的创建者 Google 希望提供一个强大的工具以帮助开发者探索和建立基于机器学习的应用，所以他们在去年作为开源项目发布了它。TensorFlow 是一个非常强大的工具，专注于一种称为<ruby>深层神经网络<rt>deep neural network</rt></ruby>（DNN）的神经网络。

深层神经网络被用来执行复杂的机器学习任务，例如图像识别、手写识别、自然语言处理、聊天机器人等等。这些神经网络被训练学习其所要执行的任务。由于训练所需的计算是非常巨大的，在大多数情况下需要 GPU 支持，这时 TensorFlow 就派上用场了。启用了 GPU 并安装了支持 GPU 的软件，那么训练所需的时间就可以大大减少。

本教程可以帮助你安装只支持 CPU 的和同时支持 GPU 的 TensorFlow。要使用带有 GPU 支持的 TensorFLow，你必须要有一块支持 CUDA 的 Nvidia GPU。CUDA 和 CuDNN（Nvidia 的计算库）的安装有点棘手，本指南会提供在实际安装 TensorFlow 之前一步步安装它们的方法。

Nvidia CUDA 是一个 GPU 加速库，它已经为标准神经网络中用到的标准例程调优过。CuDNN 是一个用于 GPU 的调优库，它负责 GPU 性能的自动调整。TensorFlow 同时依赖这两者用于训练并运行深层神经网络，因此它们必须在 TensorFlow 之前安装。

需要指出的是，那些不希望安装支持 GPU 的 TensorFlow 的人，你可以跳过以下所有的步骤并直接跳到：“步骤 5：安装只支持 CPU 的 TensorFlow”。

关于 TensorFlow 的介绍可以在[这里][10]找到。

### 1、 安装 CUDA

首先，在[这里][11]下载用于 Ubuntu 16.04 的 CUDA 库。此文件非常大（2GB），因此也许会花费一些时间下载。

下载的文件是 “.deb” 包。要安装它，运行下面的命令：

```
sudo dpkg -i cuda-repo-ubuntu1604-8-0-local_8.0.44-1_amd64.deb
```

[
 ![Install CUDA](https://www.howtoforge.com/images/installing_tensorflow_machine_learning_software_for_cpu_and_gpu_on_ubuntu_1604/image1.png) 
][12]

下面的的命令会安装所有的依赖，并最后安装 cuda 工具包：

```
sudo apt install -f
sudo apt update
sudo apt install cuda
```

如果成功安装，你会看到一条消息说：“successfully installed”。如果已经安装了，接着你可以看到类似下面的输出：

[
 ![Install CUDA with apt](https://www.howtoforge.com/images/installing_tensorflow_machine_learning_software_for_cpu_and_gpu_on_ubuntu_1604/image2.png) 
][13]

### 2、安装 CuDNN 库

CuDNN 下载需要花费一些功夫。Nvidia 没有直接提供下载文件（虽然它是免费的）。通过下面的步骤获取 CuDNN。

1. 点击[此处][8]进入 Nvidia 的注册页面并创建一个帐户。第一页要求你输入你的个人资料，第二页会要求你回答几个调查问题。如果你不知道所有答案也没问题，你可以随便选择一个选项。
2. 通过前面的步骤，Nvidia 会向你的邮箱发送一个激活链接。在你激活之后，直接进入[这里][9]的 CuDNN 下载链接。
3. 登录之后，你需要填写另外一份类似的调查。随机勾选复选框，然后点击调查底部的 “proceed to Download”，在下一页我们点击同意使用条款。
4. 最后，在下拉中点击 “Download cuDNN v5.1 (Jan 20, 2017), for CUDA 8.0”，最后，你需要下载这两个文件：
    *   [cuDNN v5.1 Runtime Library for Ubuntu14.04 (Deb)][6]
    *   [cuDNN v5.1 Developer Library for Ubuntu14.04 (Deb)][7]

注意：即使上面说的是用于 Ubuntu 14.04 的库。它也适用于 16.04。

现在你已经同时有 CuDNN 的两个文件了，是时候安装它们了！在包含这些文件的文件夹内运行下面的命令：

```
sudo dpkg -i libcudnn5_5.1.5-1+cuda8.0_amd64.deb
sudo dpkg -i libcudnn5-dev_5.1.5-1+cuda8.0_amd64.deb
```

下面的图片展示了这些命令的输出：

[
 ![Install the CuDNN library](https://www.howtoforge.com/images/installing_tensorflow_machine_learning_software_for_cpu_and_gpu_on_ubuntu_1604/image3.png) 
][14]

### 3、 在 bashrc 中添加安装位置

安装位置应该被添加到 bashrc 文件中，以便系统下一次知道如何找到这些用于 CUDA 的文件。使用下面的命令打开 bashrc 文件：

```
sudo gedit ~/.bashrc
```

文件打开后，添加下面两行到文件的末尾：

```
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64"
export CUDA_HOME=/usr/local/cuda
```

### 4、 安装带有 GPU 支持的 TensorFlow

这步我们将安装带有 GPU 支持的 TensorFlow。如果你使用的是 Python 2.7，运行下面的命令：

```
pip install TensorFlow-gpu
```

如果安装了 Python 3.x，使用下面的命令：

```
pip3 install TensorFlow-gpu
```

安装完后，你会看到一条 “successfully installed” 的消息。现在，剩下要测试的是是否已经正确安装。打开终端并输入下面的命令测试：

```
python
import TensorFlow as tf
```

你应该会看到类似下面图片的输出。在图片中你可以观察到 CUDA 库已经成功打开了。如果有任何错误，消息会提示说无法打开 CUDA 甚至无法找到模块。为防你或许遗漏了上面的某步，仔细重做教程的每一步就行了。

[
 ![Install TensorFlow with GPU support](https://www.howtoforge.com/images/installing_tensorflow_machine_learning_software_for_cpu_and_gpu_on_ubuntu_1604/image4.png) 
][15]

### 5、 安装只支持 CPU 的 TensorFlow

注意：这步是对那些没有 GPU 或者没有 Nvidia GPU 的人而言的。其他人请忽略这步！！

安装只支持 CPU 的 TensorFlow 非常简单。使用下面两个命令：

```
pip install TensorFlow
```

如果你有 python 3.x，使用下面的命令：

```
pip3 install TensorFlow
```

是的，就是这么简单！

安装指南至此结束，你现在可以开始构建深度学习应用了。如果你刚刚起步，你可以在[这里][16]看下适合初学者的官方教程。如果你正在寻找更多的高级教程，你可以在[这里][17]学习了解如何设置可以高精度识别上千个物体的图片识别系统/工具。

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/installing-tensorflow-neural-network-software-for-cpu-and-gpu-on-ubuntu-16-04/

作者：[Akshay Pai][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/installing-tensorflow-neural-network-software-for-cpu-and-gpu-on-ubuntu-16-04/
[1]:https://www.howtoforge.com/tutorial/installing-tensorflow-neural-network-software-for-cpu-and-gpu-on-ubuntu-16-04/#-install-cuda
[2]:https://www.howtoforge.com/tutorial/installing-tensorflow-neural-network-software-for-cpu-and-gpu-on-ubuntu-16-04/#-install-the-cudnn-library
[3]:https://www.howtoforge.com/tutorial/installing-tensorflow-neural-network-software-for-cpu-and-gpu-on-ubuntu-16-04/#-add-the-installation-location-to-bashrc-file
[4]:https://www.howtoforge.com/tutorial/installing-tensorflow-neural-network-software-for-cpu-and-gpu-on-ubuntu-16-04/#-install-tensorflow-with-gpu-support
[5]:https://www.howtoforge.com/tutorial/installing-tensorflow-neural-network-software-for-cpu-and-gpu-on-ubuntu-16-04/#-install-tensorflow-with-only-cpu-support
[6]:https://developer.nvidia.com/compute/machine-learning/cudnn/secure/v5.1/prod_20161129/8.0/libcudnn5_5.1.10-1+cuda8.0_amd64-deb
[7]:https://developer.nvidia.com/compute/machine-learning/cudnn/secure/v5.1/prod_20161129/8.0/libcudnn5-dev_5.1.10-1+cuda8.0_amd64-deb
[8]:https://developer.nvidia.com/group/node/873374/subscribe/og_user_node
[9]:https://developer.nvidia.com/rdp/form/cudnn-download-survey
[10]:http://sourcedexter.com/what-is-tensorflow/
[11]:https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64-deb
[12]:https://www.howtoforge.com/images/installing_tensorflow_machine_learning_software_for_cpu_and_gpu_on_ubuntu_1604/big/image1.png
[13]:https://www.howtoforge.com/images/installing_tensorflow_machine_learning_software_for_cpu_and_gpu_on_ubuntu_1604/big/image2.png
[14]:https://www.howtoforge.com/images/installing_tensorflow_machine_learning_software_for_cpu_and_gpu_on_ubuntu_1604/big/image3.png
[15]:https://www.howtoforge.com/images/installing_tensorflow_machine_learning_software_for_cpu_and_gpu_on_ubuntu_1604/big/image4.png
[16]:https://www.tensorflow.org/get_started/mnist/beginners
[17]:https://www.tensorflow.org/tutorials/image_recognition

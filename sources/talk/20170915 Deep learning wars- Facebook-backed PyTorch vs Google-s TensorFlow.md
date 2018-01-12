Deep learning wars: Facebook-backed PyTorch vs Google's TensorFlow
======
The rapid rise of tools and techniques in Artificial Intelligence and Machine learning of late has been astounding. Deep Learning, or "Machine learning on steroids" as some say, is one area where data scientists and machine learning experts are spoilt for choice in terms of the libraries and frameworks available. A lot of these frameworks are Python-based, as Python is a more general-purpose and a relatively easier language to work with. [Theano][1], [Keras][2] [TensorFlow][3] are a few of the popular deep learning libraries built on Python, developed with an aim to make the life of machine learning experts easier.

Google's TensorFlow is a widely used machine learning and deep learning framework. Open sourced in 2015 and backed by a huge community of machine learning experts, TensorFlow has quickly grown to be THE framework of choice by many organizations for their machine learning and deep learning needs. PyTorch, on the other hand, a recently developed Python package by Facebook for training neural networks is adapted from the Lua-based deep learning library Torch. PyTorch is one of the few available DL frameworks that uses tape-based autograd system to allow building dynamic neural networks in a fast and flexible manner.

In this article, we pit PyTorch against TensorFlow and compare different aspects where one edges the other out.

Let's get started!

### What programming languages support PyTorch and TensorFlow?

Although primarily written in C++ and CUDA, Tensorflow contains a Python API sitting over the core engine, making it easier for Pythonistas to use. Additional APIs for C++, Haskell, Java, Go, and Rust are also included which means developers can code in their preferred language.

Although PyTorch is a Python package, there's provision for you to code using the basic C/ C++ languages using the APIs provided. If you are comfortable using Lua programming language, you can code neural network models in PyTorch using the Torch API.

### How easy are PyTorch and TensorFlow to use?

TensorFlow can be a bit complex to use if used as a standalone framework, and can pose some difficulty in training Deep Learning models. To reduce this complexity, one can use the Keras wrapper which sits on top of TensorFlow's complex engine and simplifies the development and training of deep learning models. TensorFlow also supports [Distributed training][4], which PyTorch currently doesn't. Due to the inclusion of Python API, TensorFlow is also production-ready i.e., it can be used to train and deploy enterprise-level deep learning models.

PyTorch was rewritten in Python due to the complexities of Torch. This makes PyTorch more native to developers. It has an easy to use framework that provides maximum flexibility and speed. It also allows quick changes within the code during training without hampering its performance. If you already have some experience with deep learning and have used Torch before, you will like PyTorch even more, because of its speed, efficiency, and ease of use. PyTorch includes custom-made GPU allocator, which makes deep learning models highly memory efficient. Due to this, training large deep learning models becomes easier. Hence, large organizations such as Facebook, Twitter, Salesforce, and many more are embracing Pytorch.

### Training Deep Learning models with PyTorch and TensorFlow

Both TensorFlow and PyTorch are used to build and train Neural Network models.

TensorFlow works on SCG (Static Computational Graph) that includes defining the graph statically before the model starts execution. However, once the execution starts the only way to tweak changes within the model is using [tf.session and tf.placeholder tensors][5].

PyTorch is well suited to train RNNs( Recursive Neural Networks) as they run faster in [PyTorch ][6]than in TensorFlow. It works on DCG (Dynamic Computational Graph) and one can define and make changes within the model on the go. In a DCG, each block can be debugged separately, which makes training of neural networks easier.

TensorFlow has recently come up with TensorFlow Fold, a library designed to create TensorFlow models that works on structured data. Like PyTorch, it implements the DCGs and gives massive computational speeds of up to 10x on CPU and more than 100x on GPU! With the help of [Dynamic Batching][7], you can now implement deep learning models which vary in size as well as structure.

### Comparing GPU and CPU optimizations

TensorFlow has faster compile times than PyTorch and provides flexibility for building real-world applications. It can run on literally any kind of processor from a CPU, GPU, TPU, mobile devices, to a Raspberry Pi (IoT Devices).

PyTorch, on the other hand, includes Tensor computations which can speed up deep neural network models upto [50x or more][8] using GPUs. These tensors can dwell on CPU or GPU. Both CPU and GPU are written as independent libraries; making PyTorch efficient to use, irrespective of the Neural Network size.

### Community Support

TensorFlow is one of the most popular Deep Learning frameworks today, and with this comes a huge community support. It has great documentation, and an eloquent set of online tutorials. TensorFlow also includes numerous pre-trained models which are hosted and available on [github][9]. These models aid developers and researchers who are keen to work with TensorFlow with some ready-made material to save their time and efforts.

PyTorch, on the other hand, has a relatively smaller community since it has been developed fairly recently. As compared to TensorFlow, the documentation isn't that great, and codes are not readily available. However, PyTorch does allow individuals to share their pre-trained models with others.

### PyTorch and TensorFlow - A David & Goliath story

As it stands, Tensorflow is clearly favoured and used more than PyTorch for a variety of reasons.

Tensorflow is vast, experienced, and best suited for practical purposes. It is easily the obvious choice of most of the machine learning and deep learning experts because of the vast array of features it offers, and most importantly, its maturity in the market. It has a better community support along with multiple language APIs available. It has a good documentation and is production-ready due to the availability of ready-to-use code. Hence, it is better suited for someone who wants to get started with Deep Learning, or for organizations wanting to productize their Deep Learning models.

Although PyTorch is relatively newer and has a smaller community, it is fast and efficient. In short, it gives you all the power of Torch wrapped in the usefulness and ease of Python. Because of its efficiency and speed, it is a good option to have for small, research based projects. As mentioned earlier, companies such as Facebook, Twitter, and many others are using Pytorch to train deep learning models. However, its adoption is yet to go mainstream. The potential is evident, PyTorch is just not ready yet to challenge the beast that is TensorFlow. However considering its growth, the day is not far when PyTorch is further optimized and offers more functionalities - to the point that it becomes the David to TensorFlow's Goliath.

### Savia Lobo
A Data science fanatic. Loves to be updated with the tech happenings around the globe. Loves singing and composing songs. Believes in putting the art in smart. 


--------------------------------------------------------------------------------

via: https://datahub.packtpub.com/deep-learning/dl-wars-pytorch-vs-tensorflow/

作者：[Savia Lobo][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://datahub.packtpub.com/author/savial/
[1]:https://www.packtpub.com/web-development/deep-learning-theano
[2]:https://www.packtpub.com/big-data-and-business-intelligence/deep-learning-keras
[3]:https://www.packtpub.com/big-data-and-business-intelligence/deep-learning-tensorflow
[4]:https://www.tensorflow.org/deploy/distributed
[5]:https://www.tensorflow.org/versions/r0.12/get_started/basic_usage
[6]:https://www.reddit.com/r/MachineLearning/comments/66rriz/d_rnns_are_much_faster_in_pytorch_than_tensorflow/
[7]:https://arxiv.org/abs/1702.02181
[8]:https://github.com/jcjohnson/pytorch-examples#pytorch-tensors
[9]:https://github.com/tensorflow/models

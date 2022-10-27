[#]: subject: "What is Federated Learning?"
[#]: via: "https://www.opensourceforu.com/2022/06/what-is-federated-learning/"
[#]: author: "Aanchal Narendran https://www.opensourceforu.com/author/aanchal-narendran/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

What is Federated Learning?
======
Federated learning is a distributed machine learning approach for developing and training models on a global scale. This article introduces a few open source frameworks that help to explore it, which every newbie must know of.

![Federated-Learning][1]

Federated learning helps to develop and train models for distributed machine learning. Loosely translated, federation means a group of objects working towards the same common goal. In federated learning, the model is developed with the help of updates from a large group of devices, usually phones. Prior to the advent of federated learning, devices leveraging various artificial intelligence solutions sent repeated messages embedded with the data stored on the device. This led to two major bottlenecks:

* Communication: Not all devices in question had constant Internet access. Moreover, the bandwidth was very often insufficient for such a transfer.
* Privacy: Any third party actor with a malicious intent could figure out a way to access the data coming in from a consumer.

To address all of this and much more, Google introduced federated learning. Originally built into the Google keyboard, it quickly piqued the interest of the research community. The benefits of federated learning are:

* Leverages the on-device compute power of modern-day electronics
* Protects the privacy of the customer with zero data transfers
* Can function in a decentralised architecture to handle single-point failures
* Trains over a high number of clients even with slow or low-quality Internet
* Is robust and can handle client dropouts up to a threshold value

Although federated learning was developed and visualised as an enterprise solution, there are quite a few open source frameworks that help you explore it even if you have access to a single desktop. Let’s take a quick look at them.

### TensorFlow Federated

TensorFlow is one of the most popular frameworks used for building machine learning and deep learning models. Its popularity is nestled in the ability to run TensorFlow models reliably on any device — from a custom server to a handheld IoT device — and its ease of integration and extensive support for tooling. TensorFlow Federated is an open source framework built to support research and development of machine learning models using federated learning on decentralised data. It allows developers and researchers to simulate existing model architectures as well as test novel architectures for federated learning. It has two main interfaces.

*Federated Core API:* This is a programming environment for developing distributed computations. It serves as a foundation for the Federated Learning API and is used by systems researchers

*Federated Learning API:* This high-level interface helps machine learning developers and researchers incorporate federated learning without having to look into the low-level details.

Further documentation for this framework is available at *https://www.tensorflow.org/federated.*

### PySyft + PyGrid

PySyft is a Python library that aids in developing federated learning models for the purpose of research. It uses differential privacy and encrypted communications. It works in tandem with existing deep learning frameworks such as TensorFlow and PyTorch. However, PySyft alone isn’t sufficient to work on problems that involve communications over a network. This is where PyGrid comes in, as it helps to implement federated learning on a wide variety of devices and to deploy PySyft at scale.

Further documentation is available at *https://github.com/OpenMined/PySyft.*

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/06/what-is-federated-learning/

作者：[Aanchal Narendran][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/aanchal-narendran/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Federated-Learning.jpg

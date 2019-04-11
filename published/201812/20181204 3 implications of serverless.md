无服务器架构的三个意义
======

> 以及，对于<ruby>无服务器<rt>Serverless</rt></ruby>架构，什么时候该用，什么时候不该用呢？

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_linux11x_cc.png?itok=XMDOouJR)

如果将如今互联网体验中最方便实用的那一部分去掉，那么留下来的基本就是<ruby>客户端-服务端<rt>client-server</rt></ruby>模式了。这一个模式在互联网建立初期就已经在使用了，直到目前都没有太大的变化，也就是说，这个模式仍然在为我们服务。

那么，当人们谈论<ruby>无服务器<rt>Serverless</rt></ruby>架构的时候，到底是指什么呢？其实，无服务器架构并不是说不使用服务器了。恰恰相反，客户端-服务端模式仍然在其中发挥着重要的作用。

无服务器架构实际上指的是能够让开发者在不需要关心服务器上架、为操作系统打补丁、创建容器镜像这些工作的情况下，就能够完成编码、部署和创建应用这一整套流程的架构。

### 无服务器架构的三个重要意义

1. 一些缺乏开发经验的人员现在要参与到开发工作中来了。无服务器架构能够让他们尽量只学习必要的工作内容，把更多的时间放在更具创造性的开发工作中。
2. 开发者不再需要重复造轮子。运行和维护服务器、为操作系统打补丁、创建容器等这一系列工作，都可以由更专业的无服务器架构提供商来完成。
3. 最现实的一点是，如果不使用无服务器架构，那么在服务器管理方面，总需要有一个作最终决策的人。当服务器发生崩溃时，或是需要在服务器上执行某些操作时，总是需要这样一个统领全局的人来作出决策。因此最佳的方案是使用无服务器架构。

### 什么时候该用或者不该用无服务器架构？

听起来无服务器架构是个好东西。但事实上，无服务器架构并不是万能的，在使用之前还需要考虑以下这些因素：

1. 成本
2. 使用范围
3. 时间
4. 控制方式

其中值得注意的是控制方式。现在已经有一些项目为开发者提供了操作和控制无服务器架构计算环境的工具了，[Apache OpenWhisk][1] 就是其中之一。

### 为什么要将无服务器架构开源？

关于这方面的更多内容，可以观看无服务器架构方面的专家 Saron Yitbarek 在 [Command Line Heroes][2] 节目中的访谈。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/serverless-podcast-command-line-heros

作者：[Jen Wike Huger][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/remyd
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/18/11/developing-functions-service-apache-openwhisk
[2]: https://www.redhat.com/en/command-line-heroes


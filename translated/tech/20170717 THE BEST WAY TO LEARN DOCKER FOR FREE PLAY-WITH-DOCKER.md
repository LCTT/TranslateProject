免费学习docker的最佳方法：PLAY-WITH-DOCKER（PWD）
============================================================

去年在柏林的分布式系统峰会上，Docker的负责人[ Marcos Nils][15] 和[ Jonathan Leibiusky][16]宣称已经开始研究浏览器内置docker的方案，帮助人们学习Docker。 几天后，[Play-with-docker][17]（PWD）就诞生了。

PWD像是一个Docker游乐场，用户在几秒钟内就可以运行Docker命令。 还可以在浏览器中安装免费的Alpine Linux虚拟机的，然后在虚拟机里面构建和运行Docker容器，甚至使用[ Docker 集群模式][18]创建集群。 有了Docker-in-Docker（DinD）引擎，甚至可以体验到多个虚拟机/个人电脑的效果。 除了Docker游乐场外，PWD还包括一个培训站点[training.play-with-docker.com][19]，该站点提供大量的难度各异的Docker实验和测验。

如果你错过了峰会，Marcos和Jonathan在最后一个DockerCon Moby Cool Hack会议中提供了PWD。 观看下面的视频，深入了解基础结构和路线图。

在过去几个月里，Docker团队与Marcos，Jonathan，还有Docker社区的其他活跃成员展开了密切合作，为项目添加了新功能，为培训部分增加了Docker实验。

### PWD: 游乐场

以下快速的概括了游乐场的新功能：

##### 1\.     PWD Docker机器驱动和SSH

随着PWD成功的成长，社区开始问他们是否可以使用PWD来运行自己的Docker研讨会和培训。 因此，对项目进行的第一次改进之一就是创建[PWD Docker机器驱动][20]，从而用户可以通过自己喜爱的终端轻松创建管理PWD主机，包括使用ssh相关命令的选项。 下面是它的工作原理：

![Play With Docker](https://i2.wp.com/blog.docker.com/wp-content/uploads/ssh.gif?zoom=1.5625&resize=710%2C446&ssl=1)

##### 2\.     支持文件上传

Marcos和Jonathan还带来了另一个炫酷的功能就是可以在PWD实例中通过拖放文件的方式将Dockerfile直接上传到PWD窗口。

![](https://i0.wp.com/blog.docker.com/wp-content/uploads/pwd_upload-1.gif?zoom=1.5625&resize=710%2C406&ssl=1)

##### 3\.     模板会话

除了文件上传之外，PWD还有一个功能，可以使用预定义的模板在几秒钟内启动5个节点的群集。

##### 
![Play with Docker](https://i1.wp.com/blog.docker.com/wp-content/uploads/templated-session-1.gif?zoom=1.5625&resize=710%2C412&ssl=1)

##### 4\.     一键使用Docker展示你的应用程序

PWD附带的另一个很酷的功能是它的嵌入式按钮，你可以在你的站点中使用它来设置PWD环境，还可以快速部署一个构建好的堆栈，另外还有一个[chrome 扩展][21] ，可以将“Try in PWD”按钮添加DockerHub最流行的镜像中。 以下是扩展程序的一个简短演示：

 ![Play with Docker](https://lh5.googleusercontent.com/FqIHfES8KdNCY7YT9fZb5DbL7WYq6Qwb30RgubXix2x2ImJkaHrsEBZbb4rAxilhxgNmu56cQWZHiAbft3ox_T7UXn5oQRtRuxjrFhqRSiSXwFRJcLq6cWiAyg-pFddiJIVs0rY) 

### PWD: 培训站点

[training.play-with-docker.com][22]站点提供了大量新的实验。有一些值得注意的两点，包括两个来源于Austind DockerCon中的可以动手实践的实验，还有两个在Docker 17.06CE版本中亮眼的新功能

*   [可以动手实践的Docker网络实验][1]

*   [可以动手实践的Docker编排实验][2]

*   [多阶段构建][3]

*   [Docker群组配置文件][4]

总而言之，现在有36个实验，而且一直在增加。 如果你想贡献实验，请查看[GitHub 仓库][23]然后开始。

### PWD: 使用情况

根据网站运行时我们收到的反馈，很可观的说，PWD现在有很大的牵引力。下面是一些最常见的反馈情况：

*   紧跟最新开发版本，尝试新功能。

*   快速建立集群并启动复制服务。

*   了解互动教程： [training.play-with-docker.com][5]。 

*   在会议和集会上做演讲。

*   展开需要复杂配置的高级研讨会，例如 Jérôme’的 [先进的 Docker 编排研讨会][6]。 

*   和社区成员写作诊断问题检测问题。

参与 PWD:

*   通过[向PWD提交PR][7]做贡献

*   向 [PWD 培训站点][8]贡献

--------------------------------------------------------------------------------

作者简介：

Victor是Docker, Inc. 的高级社区营销经理。他喜欢优质的葡萄酒，象棋和足球，三三项爱好部分先后顺序。 Victor 的tweet：@vcoisne推特。



--------------------------------------------------------------------------------

via: https://blog.docker.com/2017/07/best-way-learn-docker-free-play-docker-pwd/

作者：[Victor ][a]
译者：[Flowsnow](https://github.com/Flowsnow)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.docker.com/author/victor_c/
[1]:http://training.play-with-docker.com/docker-networking-hol/
[2]:http://training.play-with-docker.com/orchestration-hol/
[3]:http://training.play-with-docker.com/multi-stage/
[4]:http://training.play-with-docker.com/swarm-config/
[5]:http://training.play-with-docker.com/
[6]:https://github.com/docker/labs/tree/master/Docker-Orchestration
[7]:https://github.com/play-with-docker/
[8]:https://github.com/play-with-docker/training
[9]:https://blog.docker.com/author/victor_c/
[10]:https://blog.docker.com/tag/docker-labs/
[11]:https://blog.docker.com/tag/docker-training/
[12]:https://blog.docker.com/tag/docker-workshops/
[13]:https://blog.docker.com/tag/play-with-docker/
[14]:https://blog.docker.com/tag/pwd/
[15]:https://www.twitter.com/marcosnils
[16]:https://www.twitter.com/xetorthio
[17]:http://play-with-docker.com/
[18]:https://docs.docker.com/engine/swarm/
[19]:http://training.play-with-docker.com/
[20]:https://github.com/play-with-docker/docker-machine-driver-pwd/releases/tag/v0.0.5
[21]:https://chrome.google.com/webstore/detail/play-with-docker/kibbhpioncdhmamhflnnmfonadknnoan
[22]:http://training.play-with-docker.com/
[23]:https://github.com/play-with-docker/play-with-docker.github.io

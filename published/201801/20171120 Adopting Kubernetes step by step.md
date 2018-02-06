一步步采用 Kubernetes
============================================================

### 为什么选择  Docker 和 Kubernetes 呢？

容器允许我们构建、发布和运行分布式应用。它们使应用程序摆脱了机器限制，可以让我们以一定的方式创建一个复杂的应用程序。

使用容器编写应用程序可以使开发、QA 更加接近生产环境（如果你努力这样做的话）。通过这样做，可以更快地发布修改，并且可以更快地测试整个系统。

[Docker][1] 这个容器式平台就是为此为生，可以使软件独立于云提供商。

但是，即使使用容器，移植应用程序到任何一个云提供商（或私有云）所需的工作量也是不可忽视的。应用程序通常需要自动伸缩组、持久远程磁盘、自动发现等。但是每个云提供商都有不同的机制。如果你想使用这些功能，很快你就会变的依赖于云提供商。

这正是 [Kubernetes][2] 登场的时候。它是一个容器<ruby>编排<rt>orchestration</rt></ruby>系统，它允许您以一定的标准管理、缩放和部署应用程序的不同部分，并且成为其中的重要工具。它的可移植抽象层兼容主要云的提供商（Google Cloud，Amazon Web Services 和 Microsoft Azure 都支持 Kubernetes）。

可以这样想象一下应用程序、容器和 Kubernetes。应用程序可以视为一条身边的鲨鱼，它存在于海洋中（在这个例子中，海洋就是您的机器）。海洋中可能还有其他一些宝贵的东西，但是你不希望你的鲨鱼与小丑鱼有什么关系。所以需要把你的鲨鱼（你的应用程序）移动到一个密封的水族馆中（容器）。这很不错，但不是特别的健壮。你的水族馆可能会被打破，或者你想建立一个通道连接到其他鱼类生活的另一个水族馆。也许你想要许多这样的水族馆，以防需要清洁或维护……这正是应用 Kubernetes 集群的作用。

![](https://cdn-images-1.medium.com/max/1600/1*OVt8cnY1WWOqdLFycCgdFg.jpeg)

*进化到 Kubernetes*

主流云提供商对 Kubernetes 提供了支持，从开发环境到生产环境，它使您和您的团队能够更容易地拥有几乎相同的环境。这是因为 Kubernetes 不依赖专有软件、服务或基础设施。

事实上，您可以在您的机器中使用与生产环境相同的部件启动应用程序，从而缩小了开发和生产环境之间的差距。这使得开发人员更了解应用程序是如何构建在一起的，尽管他们可能只负责应用程序的一部分。这也使得在开发流程中的应用程序更容易的快速完成测试。

### 如何使用 Kubernetes 工作？

随着更多的人采用 Kubernetes，新的问题出现了；应该如何针对基于集群环境进行开发？假设有 3 个环境，开发、质量保证和生产， 他们如何适应 Kubernetes？这些环境之间仍然存在着差异，无论是在开发周期（例如：在运行中的应用程序中我的代码的变化上花费时间）还是与数据相关的（例如：我不应该在我的质量保证环境中测试生产数据，因为它里面有敏感信息）。

那么，我是否应该总是在 Kubernetes 集群中编码、构建映像、重新部署服务，在我编写代码时重新创建部署和服务？或者，我是否不应该尽力让我的开发环境也成为一个 Kubernetes 集群（或一组集群）呢？还是，我应该以混合方式工作？

![](https://cdn-images-1.medium.com/max/1600/1*MXokxD8Ktte4_vWvTas9uw.jpeg)

*用本地集群进行开发*

如果继续我们之前的比喻，上图两边的洞表示当使其保持在一个开发集群中的同时修改应用程序的一种方式。这通常通过[卷][4]来实现

### Kubernetes 系列

本 Kubernetes 系列资源是开源的，可以在这里找到： [https://github.com/red-gate/ks][5] 。

我们写这个系列作为以不同的方式构建软件的练习。我们试图约束自己在所有环境中都使用 Kubernetes，以便我们可以探索这些技术对数据和数据库的开发和管理造成影响。

这个系列从使用 Kubernetes 创建基本的 React 应用程序开始，并逐渐演变为能够覆盖我们更多开发需求的系列。最后，我们将覆盖所有应用程序的开发需求，并且理解在数据库生命周期中如何最好地迎合容器和集群。

以下是这个系列的前 5 部分：

1.  ks1：使用 Kubernetes 构建一个 React 应用程序
2.  ks2：使用 minikube 检测 React 代码的更改
3.  ks3：添加一个提供 API 的 Python Web 服务器
4.  ks4：使 minikube 检测 Python 代码的更改
5.  ks5：创建一个测试环境

本系列的第二部分将添加一个数据库，并尝试找出最好的方式来开发我们的应用程序。

通过在各种环境中运行 Kubernetes，我们被迫在解决新问题的同时也尽量保持开发周期。我们不断尝试 Kubernetes，并越来越习惯它。通过这样做，开发团队都可以对生产环境负责，这并不困难，因为所有环境（从开发到生产）都以相同的方式进行管理。

### 下一步是什么？

我们将通过整合数据库和练习来继续这个系列，以找到使用 Kubernetes 获得数据库生命周期的最佳体验方法。

这个 Kubernetes 系列是由 Redgate 研发部门 Foundry 提供。我们正在努力使数据和容器的管理变得更加容易，所以如果您正在处理数据和容器，我们希望听到您的意见，请直接联系我们的开发团队。 [_foundry@red-gate.com_][6] 

* * *

我们正在招聘。您是否有兴趣开发产品、创建[未来技术][7] 并采取类似创业的方法（没有风险）？看看我们的[软件工程师 - 未来技术][8]的角色吧，并阅读更多关于在 [英国剑桥][9]的 Redgate 工作的信息。

--------------------------------------------------------------------------------

via: https://medium.com/ingeniouslysimple/adopting-kubernetes-step-by-step-f93093c13dfe

作者：[santiago arias][a]
译者：[aiwhj](https://github.com/aiwhj)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.com/@santiaago?source=post_header_lockup
[1]:https://www.docker.com/what-docker
[2]:https://kubernetes.io/
[3]:https://www.google.co.uk/search?biw=723&bih=753&tbm=isch&sa=1&ei=p-YCWpbtN8atkwWc8ZyQAQ&q=nemo+fish&oq=nemo+fish&gs_l=psy-ab.3..0i67k1l2j0l2j0i67k1j0l5.5128.9271.0.9566.9.9.0.0.0.0.81.532.9.9.0....0...1.1.64.psy-ab..0.9.526...0i7i30k1j0i7i10i30k1j0i13k1j0i10k1.0.FbAf9xXxTEM
[4]:https://kubernetes.io/docs/concepts/storage/volumes/
[5]:https://github.com/red-gate/ks
[6]:mailto:foundry@red-gate.com
[7]:https://www.red-gate.com/foundry/
[8]:https://www.red-gate.com/our-company/careers/current-opportunities/software-engineer-future-technologies
[9]:https://www.red-gate.com/our-company/careers/living-in-cambridge

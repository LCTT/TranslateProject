[#]: collector: (lujun9972)
[#]: translator: (JonnieWayy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12479-1.html)
[#]: subject: (How failure-driven development makes you successful)
[#]: via: (https://opensource.com/article/20/3/failure-driven-development)
[#]: author: (Jessica Cherry https://opensource.com/users/jrepka)

屡屡失败犯错的我为什么没有被开除
======

> 我是词典里 “失败” 一词旁边的插图，这就是为什么我擅长我的工作的原因。  

![](https://img.linux.net.cn/data/attachment/album/202008/02/212013q5jjc78ihwd72cij.jpg)

我的职称是高级软件工程师，但我最亲近的同事并不这么称呼我。由于我摧毁一切，他们管我叫“樱桃炸弹”（正巧我姓“樱桃”）。我定期会遇到的失败已经可以影响到我们的季度性收益和停机时间。简单的来说，我就是你所听说过的生产灾难：“别动，啥都别做，无论何时何地。” 

我的职业生涯始于支持服务台，在那里我写了一些循环，破坏了高端客户的服务器。我曾在没有警告的情况下将生产应用程序关闭了长达八个小时，并且在试图使得情况好转的过程中摧毁了无数个集群，有几次只是因为我打错了字。

我是我们在 [Kubernetes][2] 中设有灾难恢复（DR）集群的原因。我是个混乱的工程师，我们有一个应用程序，它的故障恢复计划还从未测试过，而我在没有警告的情况下，就教人们如何快速行动和排除故障。我作为可能失败的最好例子而存在，这实际上是有史以来最酷的事情。

### 我和消失的 K8s 集群

我的正式职责之一涉及到我们的应用架构。对于任何形式的架构改动，我都要进行代码的编写与测试，看看有什么可能性。近来，据说这成了我老板史诗级的痛苦，这只是轻描淡写。

我们在 Kubernetes 上运行我们的大多数基础架构，Kubernetes 以其弹性著称。尽管有这样的声誉，我还是使得两个集群，好吧，消失了。你可能会好奇我是怎么做到的，很容易，`terraform destroy`。我们通过 [Terraform][3] 以代码的方式管理我们的基础架构，并且不需要任何软件知识就知道 `destroy` 可做坏事。在你惊慌失措之前，好吧，是开发集群，所以我还活着。  

鉴于此，你们肯定会问我为什么还没丢掉饭碗，以及为什么我要写下这些事情。这很好回答：我仍然有工作，是因为我更新的基础架构代码比起起初的代码工作得更好更快了。我写下这些是因为每个人都会经常性地遭遇失败，这是非常非常正常的。如果你没有时不时遭遇失败，我认为你并没有足够努力地学习。  

### 破坏东西并培训人们

你可能还会认为永远不会有人让我去培训任何人。那是最糟糕的主意，因为（就像我的团队开玩笑说的）你永远都不应该做我所做的事情。但是我的老板却让我定期去训练新人。我甚至为整个团队提供使用我们的基础设施或代码的培训，教人们如何建立自己的基础设施。

原因是这样的：失败是你迈向成功的第一步。失败的教训绝不只是“备份是个绝佳的主意”。不，从失败中，你学会了更快地恢复、更快地排除故障并且在你工作中取得惊人的进步。当你在工作中变得惊人的时候，你就可以培训其他人，教给他们什么事情不要做，并且帮助他们去理解一切是如何工作的。由于你的经验，他们会比你开始时更进一步 —— 而且他们也很可能以新的、惊人的、史诗般的方式失败，每个人都可以从中学到东西。

### 你的成功取决于你的失败

没有人生来就具有软件工程和云基础架构方面的天赋，就像没有人天生就会走路。我们都是从滚动和翻爬开始的。从那时起，我们学会爬行，然后能够站立一会儿。当我们开始走路后，我们会跌倒并且擦伤膝盖，撞到手肘，还有，比如像我哥哥，走着走着撞上桌子的尖角，然后在眉毛中间缝了针。  

凡事都需要时间去学习。一路上阅读手边能获得的一切来帮助你，但这永远只是个开始。完美是无法实现的幻想，你必须通过失败来取得成功。

每走一步，我的失败都教会我如何把事情做得更好。  

最终，你的成功和你累积的失败一样多，这标志着你成功的程度。  

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/failure-driven-development

作者：[Jessica Cherry][a]
选题：[lujun9972][b]
译者：[JonnieWayy](https://github.com/JonnieWayy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jrepka
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/fail_failure_celebrate.png?itok=LbvDAEZF (failure sign at a party, celebrating failure)
[2]: https://www.redhat.com/en/topics/containers/what-is-kubernetes
[3]: https://github.com/hashicorp/terraform

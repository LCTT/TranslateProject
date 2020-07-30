[#]: collector: (lujun9972)
[#]: translator: (JonnieWayy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How failure-driven development makes you successful)
[#]: via: (https://opensource.com/article/20/3/failure-driven-development)
[#]: author: (Jessica Cherry https://opensource.com/users/jrepka)

失败驱动的开发如何使你成功
======
我是词典里 “failure” 一词旁边的插图，这就是为什么我擅长我的工作。  
![failure sign at a party, celebrating failure][1]

我的职称是高级软件工程师，但这不是我最亲近的同事对我的称呼。由于我摧毁的一切，他们管我叫“樱桃炸弹”。我定期会遇到的失败已经可以追溯到我们的季度性收益和停机时间。字面上看，我是你所读到过的生产灾难，里面写道：“无论何时何地，什么事情永远都不要做。”  

我的职业生涯始于服务台，在那里我写了一些损坏高端公司服务器的循环。我将生产应用程序关闭了长达八个小时而没有发出警告，并且在试图使得情况好转的过程中摧毁了无数个集群，其中两个是因为我输错了一些东西。  

我是我们在 [Kubernetes][2] 中设有灾难恢复 （DR）集群的原因。我是个混乱的工程师，当我们有从未经过停机恢复计划测试的应用程序时，我会丝毫不带警告地去教人们如何快速采取行动并进行故障排除。我作为可能失败的最好例子而存在，这实际上是有史以来最酷的事情。  

### Jess 和消失的 K8s 集群

我的官方职责之一涉及到我们的应用架构。对于任何形式的架构改动，我都要进行代码的编写与测试，看看有什么可能性。近来，温和一点说，这成了我老板史诗级的痛苦。  

We run most of our infrastructure on Kubernetes, which is known for its resiliency. Despite that reputation, I managed to make two clusters just, well, disappear. You may be wondering how I could do that; it's pretty easy: **terraform destroy**. We manage our infrastructure as code through [Terraform][3], and it won't take any knowledge of the software to know that **destroy** can do something bad. Before you panic, it was the dev clusters, so life went on.

我们在 Kubernetes 上运行我们的大多数基础架构， Kubernetes 以其弹性著称。尽管有这样的声誉，我还是使得两个集群，好吧，消失了。你可能会好奇我是怎么做到的，很容易，**Terraform 破坏**。我们通过 [Terraform][3] 将我们的基础架构作为代码进行管理，并且不需要任何软件知识就知道**破坏**可做坏事。在你恐慌之前，它是开发人员集群 （dev cluster），所以生活仍在继续。  

考虑到这一点，有理由问我为什么还没丢掉饭碗，以及为什么我要写下关于这些事情的内容。这很好回答：我仍然有工作，因我的基础架构代码比起起初之时更新工作更好更快了。我写下关于这些事情的内容是因为每个人都时常会遭遇失败，这是非常非常正常的。如果你没有定期遭遇失败，我认为你并没有足够尽力地在学习。  

### 破坏东西并训练人们

你可能还会认为永远不会有人让我去训练任何人。那是最糟糕的主意，因为（就像我的团队开玩笑说的）你永远都不应该做我所做的事情。但是我的老板定期让我去训练新人。我甚至会给整个团队提供训练，用我们自己的基础架构或代码去教人们如何构建他们自己的基础架构。  

原因如下：失败是你迈向成功的第一步。失败的教训绝不只是“备份是个绝佳的主意”。不，从失败中，你学会更快地恢复、更快地排除故障并且在你工作中取得惊人的进步。当你对自己的工作感到惊叹时，你就可以训练其他人，教他们关于什么事情不要做，并且帮助他们去理解一切的工作原理。由于你的经验，他们会比你开始的地方更进一步 —— 并且他们也很可能会以每个人都能从中学到东西的新颖、惊人、史诗般的方式失败。  

### 你的成功取决于你的失败

没有人生来就具有软件工程和云基础架构方面的天赋，就像没有人天生就会走路。我们都是从翻滚和碰撞中开始的。从那里开始，我们学会爬行，然后能够站立一会儿。当我们开始走路后，我们会跌倒并且擦伤膝盖，撞到手肘，还有 —— 至少在我哥哥的情况下 —— 走着走着撞上桌子的尖角，然后在眉毛中间缝了针。  

凡事都需要时间去学习。一路上阅读手边能获得的一切来帮助你，但这永远只是个开始。完美是无法实现的幻想，你必须通过失败来取得成功。  

每走一步，我的失败都教会我如何把事情做得更好。  

最终，你的成功正如你失败的总和一样多，因为这标志着你成功的程度。  

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/failure-driven-development

作者：[Jessica Cherry][a]
选题：[lujun9972][b]
译者：[JonnieWayy](https://github.com/JonnieWayy)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jrepka
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/fail_failure_celebrate.png?itok=LbvDAEZF (failure sign at a party, celebrating failure)
[2]: https://www.redhat.com/en/topics/containers/what-is-kubernetes
[3]: https://github.com/hashicorp/terraform

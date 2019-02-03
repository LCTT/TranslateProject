[#]: collector: (lujun9972)
[#]: translator: (beamrolling)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10469-1.html)
[#]: subject: (You (probably) don't need Kubernetes)
[#]: via: (https://arp242.net/weblog/dont-need-k8s.html)
[#]: author: (Martin Tournoij https://arp242.net/)

你（多半）不需要 Kubernetes
======

这也许是一个不太受欢迎的观点，但大多数主流公司最好不要再使用 k8s 了。

你知道那个古老的“以程序员技能写 Hello world ”笑话吗？—— 从一个新手程序员的 `printf("hello, world\n")` 语句开始，最后结束于高级软件架构工程师令人费解的 Java OOP 模式设计。使用 k8s 就有点像这样。

* 新手系统管理员：

    `./binary`
* 有经验的系统管理员：
  
    在 EC2 上的 `./binary` 
* DevOp：
  
    在 EC2 上自部署的 CI 管道运行 `./binary` 
* 高级云编排工程师：
  
    在 EC2 上通过 k8s 编排的自部署 CI 管道运行 `./binary` 

`¯\\_(ツ)_/¯`

这不意味着 Kubernetes 或者任何这样的东西本身都是*坏的*，就像 Java 或者 OOP 设计本身并不是坏的一样，但是，在很多情况下，它们被严重地误用，就像在一个 hello world 的程序中可怕地误用 Java 面向对象设计模式一样。对大多数公司而言，系统运维从根本上来说并不十分复杂，此时在这上面应用 k8s 起效甚微。

复杂性本质上来说创造了工作，我十分怀疑使用 k8s 对大多数使用者来说是省时的这一说法。这就好像花一天时间来写一个脚本，用来自动完成一些你一个月进行一次，每次只花 10 分钟完成的工作。这不是一个好的时间投资（特别是你可能会在未来由于扩展或调试这个脚本而进一步投入的更多时间）。

你的部署大概应该*需要*自动化 – 以免你 [最终像 Knightmare][1] 那样 —— 但 k8s 通常可以被一个简单的 shell 脚本所替代。

在我们公司，系统运维团队用了很多时间来设置 k8s 。他们还不得不用了很大一部分时间来更新到新一点的版本（1.6 ➙ 1.8）。结果是如果没有真正深入理解 k8s ，有些东西就没人会真的明白，甚至连深入理解 k8s 这一点也很难（那些 YAML 文件，哦呦！）

在我能自己调试和修复部署问题之前 —— 现在这更难了，我理解基本概念，但在真正调试实际问题的时候，它们并不是那么有用。我不经常用 k8s 足以证明这点。

---

k8s 真的很难这点并不是什么新看法，这也是为什么现在会有这么多 “k8s 简单用”的解决方案。在 k8s 上再添一层来“让它更简单”的方法让我觉得，呃，不明智。复杂性并没有消失，你只是把它藏起来了。

以前我说过很多次：在确定一样东西是否“简单”时，我最关心的不是写东西的时候有多简单，而是当失败的时候调试起来有多容易。包装 k8s 并不会让调试更加简单，恰恰相反，它让事情更加困难了。

---

Blaise Pascal 有一句名言：

> 几乎所有的痛苦都来自于我们不善于在房间里独处。

k8s —— 略微拓展一下，Docker —— 似乎就是这样的例子。许多人似乎迷失在当下的兴奋中，觉得 “k8s 就是这么回事！”，就像有些人迷失在 Java OOP 刚出来时的兴奋中一样，所以一切都必须从“旧”方法转为“新”方法，即使“旧”方法依然可行。

有时候 IT 产业挺蠢的。

或者用 [一条推特][2] 来总结:

> - 2014 - 我们必须采用 #微服务 来解决独石应用的所有问题
> - 2016 - 我们必须采用 #docker 来解决微服务的所有问题
> - 2018 - 我们必须采用 #kubernetes 来解决 docker 的所有问题

你可以通过 [martin@arp242.net][3] 给我发邮件或者 [创建 GitHub issue][4] 来给我反馈或提出问题等。

--------------------------------------------------------------------------------

via: https://arp242.net/weblog/dont-need-k8s.html

作者：[Martin Tournoij][a]
选题：[lujun9972][b]
译者：[beamrolling](https://github.com/beamrolling)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://arp242.net/
[b]: https://github.com/lujun9972
[1]: https://dougseven.com/2014/04/17/knightmare-a-devops-cautionary-tale/
[2]: https://twitter.com/sahrizv/status/1018184792611827712
[3]: mailto:martin@arp242.net
[4]: https://github.com/Carpetsmoker/arp242.net/issues/new

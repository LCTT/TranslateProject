Docker 在安全组件、实时容器迁移方面的进展
================================================================================
![Docker Container Talk](http://www.eweek.com/imagesvr_ce/1905/290x195DockerMarianna.jpg) 

**这是 Docker 开发者在 Containercon 上的演讲，谈论将来的容器在安全和实时迁移方面的创新**

来自西雅图的消息。当前 IT 界最热的词汇是“容器”，美国有两大研讨会：Linuxcon USA 和 Containercon，后者就是为容器而生的。

Docker 公司是开源 Docker 项目的商业赞助商，本次研讨会这家公司有 3 位高管带来主题演讲，但公司创始人 Solomon Hykes 没上场演讲。

Hykes 曾在 2014 年的 Linuxcon 上进行过一次主题演讲，但今年的 Containeron 他只坐在观众席上。而工程部高级副总裁 Marianna Tessel、Docker 首席安全官 Diogo Monica 和核心维护员 Michael Crosby 为我们演讲 Docker 新增的功能和将来会有的功能。

Tessel 强调 Docker 现在已经被很多世界上大型组织用在生产环境中，包括美国政府。Docker 也被用在小环境中，比如树莓派，一块树莓派上可以跑 2300 个容器。

“Docker 的功能正在变得越来越强大，而部署方法变得越来越简单。”Tessel 在会上说道。

Tessel 把 Docker 形容成一艘游轮，内部由强大而复杂的机器驱动，外部为乘客提供平稳航行的体验。

Docker 试图解决的领域是简化安全配置。Tessel 认为对于大多数用户和组织来说，避免网络漏洞所涉及的安全问题是一个乏味而且复杂的过程。

于是 Docker Content Trust 就出现在 Docker 1.8 release 版本中了。安全项目领导 Diogo Mónica 中加入了 Tessel 的台上讨论，说安全是一个难题，而 Docker Content Trust 就是为解决这个难道而存在的。

Docker Content Trust 提供一种方法来验证一个 Docker 应用是否可信，以及多种方法来限制欺骗和病毒注入。

为了证明他的观点，Monica 做了个现场示范，演示 Content Trust 的效果。在一个实验中，一个网站在更新过程中其 Web App 被人为攻破，而当 Content Trust 启动后，这个黑客行为再也无法得逞。

“不要被这个表面上简单的演示欺骗了，”Tessel 说道，“你们看的是最安全的可行方案。”

Docker 以前没有实现的领域是实时迁移，这个技术在 VMware 虚拟机中叫做 vMotion，而现在，Docker 也实现了这个功能。

Docker 首席维护员 Micheal Crosby 在台上做了个实时迁移的演示，Crosby 把这个过程称为快照和恢复：首先从运行中的容器拿到一个快照，之后将这个快照移到另一个地方恢复。

一个容器也可以克隆到另一个地方，Crosby 将他的克隆容器称为“多利”，就是世界上第一只被克隆出来的羊的名字。

Tessel 也花了点时间聊了下 RunC 组件，这是个正在被 Open Container Initiative 作为多方开发的项目，目的是让它可以从 Linux 扩展到包括 Windows 和 Solaris 在内的多种操作系统。

Tessel 总结说她不知道 Docker 的未来是什么样，但对此抱非常乐观的态度。

“我不确定未来是什么样的，但我很确定 Docker 会在这个世界中脱颖而出”，Tessel 说的。

Sean Michael Kerner 是 eWEEK 和 InternetNews.com 网站的高级编辑，可通过推特 @TechJournalist 关注他。

--------------------------------------------------------------------------------

via: http://www.eweek.com/virtualization/docker-working-on-security-components-live-container-migration.html

作者：[Sean Michael Kerner][a]
译者：[bazz2](https://github.com/bazz2)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.eweek.com/cp/bio/Sean-Michael-Kerner/

不重启不当机！Linux内核热补丁的四种技术
================================================================================
![Credit: Shutterstock](http://images.techhive.com/images/article/2014/10/patch_f-100526950-primary.idge.jpeg)

供图: Shutterstock

有多种技术在竞争成为实现Linux内核热补丁的最优方案。  

没人喜欢重启机器，尤其是涉及到一个内核问题的最新补丁程序。  

为达到不重启的目的，目前有3个项目在朝这方面努力，将为大家提供内核升级时打热补丁的机制，这样就可以做到完全不重启机器。

### Ksplice项目 ###

首先要介绍的项目是Ksplice，它是热补丁技术的创始者，并于2008年建立了与项目同名的公司。Ksplice在替换新内核时，不需要预先修改；只需要一个diff文件，列出内核即将接受的修改即可。Ksplice公司免费提供软件，但技术支持是需要收费的，目前能够支持大部分常用的Linux发行版本。
 
但在2011年[Oracle收购了这家公司][1]后，情况发生了变化。 这项功能被合入到Oracle自己的Linux发行版本中，只对Oralcle自己提供技术更新。 这就导致，其他内核hacker们开始寻找替代Ksplice的方法，以避免缴纳Oracle税。

### Kgraft项目 ###

2014年2月，Suse提供了一个很好的解决方案：[Kgraft][2]，该内核更新技术以GPLv2/GPLv3混合许可证发布，且Suse不会将其作为一个专有发明封闭起来。Kgraft被[提交][3]到Linux内核主线，很有可能被内核主线采用。目前Suse已经把此技术集成到[Suse Linux Enterprise Server 12][4]。
 
Kgraft和Ksplice在工作原理上很相似，都是使用一组diff文件来计算内核中需要修改的部分。但与Ksplice不同的是，Kgraft在做替换时，不需要完全停止内核。 在打补丁时，正在运行的函数可以先使用老版本或新内核中对应的部分，当补丁打完后就可以完全切换新的版本。

### Kpatch项目 ###
 
Red Hat也提出了他们的内核热补丁技术。同样是在2014年初 -- 与Suse在这方面的工作差不多 -- [Kpatch][5]的工作原理也和Kgraft相似。

主要的区别点在于，正如Red Hat的Josh Poimboeuf[总结][6]的那样，Kpatch并不将内核调用重定向到老版本。相反，它会等待所有函数调用都停止时，再切换到新内核。Red Hat的工程师认为这种方法更为安全，且更容易维护，缺点就是在打补丁的过程中会带来更大的延迟。

和Kgraft一样，Kpatch不仅仅可以在Red Hat的发行版本上使用，同时也被提交到了内核主线，作为一个可能的候选。 坏消息是Red Hat还未将此技术集成到产品中。 它只是被合入到了Red Hat Enterprise Linux 7的技术预览版中。

### ...也许 Kgraft + Kpatch更合适? ###

Red Hat的工程师Seth Jennings在2014年11月初，提出了[第四种解决方案][7]。将Kgraft和Kpatch结合起来, 补丁包用这两种方式都可以。在新的方法中，Jennings提出，“热补丁核心为其他内核模块提供了一个热补丁的注册接口”， 通过这种方法，打补丁的过程 -- 更准确的说，如何处理运行时内核调用 --可以被更加有序的组织起来。

这项新建议也意味着两个方案都还需要更长的时间，才能被linux内核正式采纳。尽管Suse步子迈得更快，并把Kgraft应用到了最新的enterprise版本中。让我们也关注一下Red Hat和Canonical近期是否会跟进。


--------------------------------------------------------------------------------

via: http://www.infoworld.com/article/2851028/linux/four-ways-linux-is-headed-for-no-downtime-kernel-patching.html

作者：[Serdar Yegulalp][a]
译者：[coloka](https://github.com/coloka)
校对：[tinyeyeser](https://github.com/tinyeyeser)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.infoworld.com/author/Serdar-Yegulalp/
[1]:http://www.infoworld.com/article/2622437/open-source-software/oracle-buys-ksplice-for-linux--zero-downtime--tech.html
[2]:http://www.infoworld.com/article/2610749/linux/suse-open-sources-live-updater-for-linux-kernel.html
[3]:https://lwn.net/Articles/596854/
[4]:http://www.infoworld.com/article/2838421/linux/suse-linux-enterprise-12-goes-light-on-docker-heavy-on-reliability.html
[5]:https://github.com/dynup/kpatch
[6]:https://lwn.net/Articles/597123/
[7]:http://lkml.iu.edu/hypermail/linux/kernel/1411.0/04020.html

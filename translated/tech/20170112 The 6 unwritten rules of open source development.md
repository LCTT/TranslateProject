六个开源开发的＂潜规则＂
============================================================

你想成为开源项目中得意满满,功成名就的那个人吗,那就要遵守下面的＂潜规则＂

![The 6 unwritten rules of open source development](http://images.techhive.com/images/article/2016/12/09_opensource-100698477-large.jpg) 


Matt Hicks 是 Red Hat软件工程的副主席，也是 Red Hat 开源合作团队的奠基成员之一．他历时十五年，在软件工程中担任多种职务：开发，运行，架构，管理．

正如体育界不成文的规定一样，这些规则基本上不会在官方文档上，正式记录．比如说，在棒球运动中，从井口跑法时不要偷球，到有人第一时候不要放弃全力疾走．对于圈外人来讲，这些东西很难懂，甚至觉得没什么意义．但是对于那些想成为 MVP 的队员来说，这些都是理所应当的．

软件开发，特别是开源软件开发中,也有一套不成文的规定．和其他团队运动一样，这些规定很大程度上决定了开源社区如何看待一名开发者，特别是小白．

运行之前先调试

在与社区互动前，开放源代码，或者其他什么的，你需要做一下基本工作．对于有眼界的开源贡献者，这意味这你需要理解社区的目标，从头学习．人人都想贡献源代码，但是只有少量的人做过准备，并且乐意，有能力完成这项艰苦卓绝的工作：测试补丁，检查代码，写文档，校正错误．所有的这些不受待见的任务在一个健康的社区中都需要有人去完成．

为什么要在优雅地码代码前做这些呢？这是一种信任，更重要的是，不要只关注自己开发的功能，而是要关注整个社区的动向

填坑而不是挖坑

当你在特定的社区中建立起自己的声望，那么很有必要去深入理解项目，和基础代码．不要在任务状态上停留，要去钻研项目本身，理解那些超出你擅长范围之外的知识．不要只把自己的理解局限于开发者．这样你会获得一种洞察力，让你的代码有更大的影响，而不只是你那一亩三分地．

打个比方，你已经完成了一个网络模块的测试版本．你测试了一下，觉得不错．然后你把它开放到社区，想要更多的人测试．结果发现，如果将它运行在特定的管理器中，它有可能损害安全设置，还可能导致主存泄露．这个问题本可以在基础代码阶段就被解决，而不需要单独测试时候才发现．这说明，你要对项目各个部分如何与其他人协作交互有比较深的理解．让你的补丁填坑而不是挖坑．这样你朝成为社区大牛的目标上又前进了一大步．

不要投放代码炸弹

代码提交完毕你的工作还没结束．你还要想一想以后的改变，和常见的问答，测试也没有完成．你要确保你可以准时提交，努力去理解如何在不影响社区其他成员的情况下，运行和修复代码．

助己前先助人
开源社区不是自相残杀的世界，我们更看重项目的价值而非个体的贡献和成功．如果你想给自己加分，让自己成为更厉害的社区成员，那就努力帮助别人．如果你熟悉网络部分，那就审查网络模块，用你的专业技能让整个代码更加优雅．很简单的道理，顶级的审查者经常和顶级的贡献者打交道．你帮助的越多，你就越有价值

作为一个开发者，你很可能需要开源项目中解决一个你十分头痛的技术点．可能你更想运行在一个目前还不支持的系统，你超想改革社区目前使用的安全技术．想要引进新技术，特别是比较有争议的技术，最好的办法就是让人无法拒绝它．你需要透彻地了解底层代码，考虑每一个微小的优势．在不影响已实现功能的前提下增加新功能．不仅要在计划上下功夫，还要在特性的完善上下功夫．

不要放弃

开源社区也有多不靠谱的成员，所以提交中可靠性高的才能被采用．不要只是因为提交被上游拒绝就离开社区．找出原因，修正错误，然后再试一试．当你开发时候，要和基础代码保持一致，确保即使项目进化你的代码仍然可用．不要把你的代码留给别人修复，要自己修复．这样可以在社区形成良好的风气，每个人都自己改．

这些＂潜规则＂看上去很简单，但是还是有许多开源项目的贡献者并没有遵守．成功的开发者不仅可以成功地为自己完成项目，还可以帮助开源社区．

--------------------------------------------------------------------------------

via: http://www.infoworld.com/article/3156776/open-source-tools/the-6-unwritten-rules-of-open-source-development.html

作者：[Matt Hicks][a]
译者：[Taylor1024](https://github.com/Taylor1024)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.infoworld.com/blog/new-tech-forum/
[1]:https://twitter.com/intent/tweet?url=http%3A%2F%2Fwww.infoworld.com%2Farticle%2F3156776%2Fopen-source-tools%2Fthe-6-unwritten-rules-of-open-source-development.html&via=infoworld&text=The+6+unwritten+rules+of+open+source+development
[2]:https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fwww.infoworld.com%2Farticle%2F3156776%2Fopen-source-tools%2Fthe-6-unwritten-rules-of-open-source-development.html
[3]:http://www.linkedin.com/shareArticle?url=http%3A%2F%2Fwww.infoworld.com%2Farticle%2F3156776%2Fopen-source-tools%2Fthe-6-unwritten-rules-of-open-source-development.html&title=The+6+unwritten+rules+of+open+source+development
[4]:https://plus.google.com/share?url=http%3A%2F%2Fwww.infoworld.com%2Farticle%2F3156776%2Fopen-source-tools%2Fthe-6-unwritten-rules-of-open-source-development.html
[5]:http://reddit.com/submit?url=http%3A%2F%2Fwww.infoworld.com%2Farticle%2F3156776%2Fopen-source-tools%2Fthe-6-unwritten-rules-of-open-source-development.html&title=The+6+unwritten+rules+of+open+source+development
[6]:http://www.stumbleupon.com/submit?url=http%3A%2F%2Fwww.infoworld.com%2Farticle%2F3156776%2Fopen-source-tools%2Fthe-6-unwritten-rules-of-open-source-development.html
[7]:http://www.infoworld.com/article/3156776/open-source-tools/the-6-unwritten-rules-of-open-source-development.html#email
[8]:http://www.infoworld.com/article/3152565/linux/5-rock-solid-linux-distros-for-developers.html#tk.ifw-infsb
[9]:http://www.infoworld.com/newsletters/signup.html#tk.ifw-infsb

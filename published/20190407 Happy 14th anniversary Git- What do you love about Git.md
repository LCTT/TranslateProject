[#]: collector: (lujun9972)
[#]: translator: (zhs852)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10702-1.html)
[#]: subject: (Happy 14th anniversary Git: What do you love about Git?)
[#]: via: (https://opensource.com/article/19/4/what-do-you-love-about-git)
[#]: author: (Jen Wike Huger https://opensource.com/users/jen-wike/users/seth)

Git 十四周年：你喜欢 Git 的哪一点？
======

> Git 为软件开发所带来的巨大影响是其它工具难以企及的。

![arrows cycle symbol for failing faster][1]

在 Linus Torvalds 开发 Git 后的十四年间，它为软件开发所带来的影响是其它工具难以企及的：在 [StackOverflow 的 2018 年开发者调查][2] 中，87% 的受访者都表示他们使用 Git 来作为他们项目的版本控制工具。显然，没有其它工具能撼动 Git 版本控制管理工具（SCM）之王的地位。

为了在 4 月 7 日 Git 的十四周年这一天向 Git 表示敬意，我问了一些爱好者他们最喜欢 Git 的哪一点。以下便是他们所告诉我的：

*（为了便于理解，部分回答已经进行了小幅修改）*

“我无法忍受 Git。无论是难以理解的术语还是它的分布式。使用 Gerrit 这样的插件才能使它像 Subversion 或 Perforce 这样的集中式仓库管理器使用的工具的一半好用。不过既然这次的问题是‘你喜欢 Git 的什么？’，我还是希望回答：Git 使得对复杂的源代码树操作成为可能，并且它的回滚功能使得实现一个要 20 次修改才能更正的问题变得简单起来。” — _[Sweet Tea Dorminy][3]_

“我喜欢 Git 是因为它不会强制我执行特定的工作流程，并且开发团队可以自由地以适合自己的方式来进行团队开发，无论是拉取请求、以电子邮件递送差异文件或是给予所有人推送的权限。” — _[Andy Price][4]_

“我从 2006、2007 年的样子就开始使用 Git 了。我喜欢 Git 是因为，它既适用于那种从未离开过我电脑的小项目，也适用于大型的团队合作的分布式项目。Git 使你可以从（几乎）所有的错误提交中回滚到先前版本，这个功能显著地减轻了我在软件版本管理方面的压力。” — _[Jonathan S. Katz][5]_

“我很欣赏 Git 那种 [底层命令和高层命令][6] 的理念。用户可以使用 Git 有效率地分享任何形式的信息，而不需要知道其内部工作原理。而好奇的人可以透过其表层的命令，而发现其为许多代码分享平台提供了支持的可以定位内容的文件系统。” — _[Matthew Broberg][7]_

“我喜欢 Git 是因为浏览、开发、构建、测试和向我的 Git 仓库中提交代码的工作几乎都能用它来完成。它经常会调动起我参与开源项目的积极性。” — _[Daniel Oh][8]_

“Git 是我用过的首个版本控制工具。数年间，它从一个可怕的工具变成了一个友好的工具。我喜欢它使你在修改代码的时候更加自信，因为它能保证你主分支的安全（除非你强制提交了一段考虑不周的代码到主分支）。你可以检出先前的提交来撤销更改，这一点也是很棒的。” — _[Kedar Vijay Kulkarni][9]_

“我之所以喜欢 Git 是因为它淘汰了一些其它的版本控制工具。没人使用 VSS，而 Subversion 可以和 git-svn 一起使用（如果必要），BitKeeper 则和 Monotone 一样只为老一辈所知。当然，我们还有 Mercurial，不过在我几年之前用它来为 Firefox 添加 AArch64 支持时，我觉得它仍是那种还未完善的工具。部分人可能还会提到 Perforce、SourceSafe 或是其它企业级的解决方案，我只想说它们在开源世界里并不流行。” — _[Marcin Juszkiewicz][10]_

“我喜欢内置的 SHA1 化对象模型（commit → tree → blob）的简易性。我也喜欢它的高层命令。同时我也将它作为对 JBoss/Red Hat Fuse 的补丁机制。并且这种机制确实有效。我还喜欢 Git 的 [三棵树的故事][11]。” — _[Grzegorz Grzybek][12]_

“我喜欢 [自动生成的 Git 说明页][13]（这个页面虽然听起来是有关 Git 的，但是事实上这是一个没有实际意义的页面，不过它总是会给人一种像是真的 Git 页面的感觉…），这使得我对 Git 的敬意油然而生。” — _[Marko Myllynen][14]_

“Git 改变了我作为开发者的生活。它使得 SCM 问题从世界上消失得无影无踪。”— _[Joel Takvorian][15]_

* * *

看完这十个爱好者的回答之后，就轮到你了：你最欣赏 Git 的什么？请在评论区分享你的看法！

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/what-do-you-love-about-git

作者：[Jen Wike Huger][a]
选题：[lujun9972][b]
译者：[zhs852](https://github.com/zhs852)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jen-wike/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/fail_progress_cycle_momentum_arrow.png?itok=q-ZFa_Eh (arrows cycle symbol for failing faster)
[2]: https://insights.stackoverflow.com/survey/2018/#work-_-version-control
[3]: https://github.com/sweettea
[4]: https://www.linkedin.com/in/andrew-price-8771796/
[5]: https://opensource.com/users/jkatz05
[6]: https://git-scm.com/book/en/v2/Git-Internals-Plumbing-and-Porcelain
[7]: https://opensource.com/users/mbbroberg
[8]: https://opensource.com/users/daniel-oh
[9]: https://opensource.com/users/kkulkarn
[10]: https://github.com/hrw
[11]: https://speakerdeck.com/schacon/a-tale-of-three-trees
[12]: https://github.com/grgrzybek
[13]: https://git-man-page-generator.lokaltog.net/
[14]: https://github.com/myllynen
[15]: https://github.com/jotak

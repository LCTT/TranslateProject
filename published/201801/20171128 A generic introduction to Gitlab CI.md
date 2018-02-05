Gitlab CI 常规介绍
======

在 [fleetster][1]， 我们搭建了自己的 [Gitlab][2] 实例，而且我们大量使用了 [Gitlab CI][3]。我们的设计师和测试人员也都在用它，也很喜欢用它，它的那些高级功能特别棒。

Gitlab CI 是一个功能非常强大的持续集成系统，有很多不同的功能，而且每次发布都会增加新的功能。它的技术文档也很丰富，但是对那些要在已经配置好的 Gitlab 上使用它的用户来说，它缺乏一个一般性介绍。设计师或者测试人员是无需知道如何通过 Kubernetes 来实现自动伸缩，也无需知道“镜像”和“服务”之间的不同的。

但是，他仍然需要知道什么是“管道”，知道如何查看部署到一个“环境”中的分支。因此，在本文中，我会尽可能覆盖更多的功能，重点放在最终用户应该如何使用它们上；在过去的几个月里，我向我们团队中的某些人包括开发者讲解了这些功能：不是所有人都知道<ruby>持续集成<rt>Continuous Integration</rt></ruby>（CI）是个什么东西，也不是所有人都用过 Gitlab CI。

如果你想了解为什么持续集成那么重要，我建议阅读一下 [这篇文章][4]，至于为什么要选择 Gitlab CI 呢，你可以去看看 [Gitlab.com][3] 上的说明。

### 简介

开发者保存更改代码的动作叫做一次<ruby>提交<rt>commit</rt></ruby>。然后他可以将这次提交<ruby>推送<rt>push</rt></ruby>到 Gitlab 上，这样可以其他开发者就可以<ruby>复查<rt>review</rt></ruby>这些代码了。

Gitlab CI 配置好后，Gitlab 也能对这个提交做出一些处理。该处理的工作由一个<ruby>运行器<rt>runner</rt></ruby>来执行的。所谓运行器基本上就是一台服务器（也可以是其他的东西，比如你的 PC 机，但我们可以简单称其为服务器）。这台服务器执行 `.gitlab-ci.yml` 文件中指令，并将执行结果返回给 Gitlab 本身，然后在 Gitlab 的图形化界面上显示出来。

开发者完成一项新功能的开发或完成一个 bug 的修复后（这些动作通常包含了多次的提交），就可以发起一个<ruby>合并请求<rt>merge request</rt></ruby>，团队其他成员则可以在这个合并请求中对代码及其实现进行<ruby>评论<rt>comment</rt></ruby>。

我们随后会看到，由于 Gitlab CI 提供的两大特性，<ruby>环境<rt>environment</rt></ruby> 与 <ruby>制品<rt>artifact</rt></ruby>，使得设计者和测试人员也能（而且真的需要）参与到这个过程中来，提供反馈以及改进意见。

### <ruby>管道<rt>pipeline</rt></ruby>

每个推送到 Gitlab 的提交都会产生一个与该提交关联的<ruby>管道<rt>pipeline</rt></ruby>。若一次推送包含了多个提交，则管道与最后那个提交相关联。管道就是一个分成不同<ruby>阶段<rt>stage</rt></ruby>的<ruby>作业<rt>job</rt></ruby>的集合。

同一阶段的所有作业会并发执行（在有足够运行器的前提下），而下一阶段则只会在上一阶段所有作业都运行并返回成功后才会开始。

只要有一个作业失败了，整个管道就失败了。不过我们后面会看到，这其中有一个例外：若某个作业被标注成了手工运行，那么即使失败了也不会让整个管道失败。

阶段则只是对批量的作业的一个逻辑上的划分，若前一个阶段执行失败了，则后一个执行也没什么意义了。比如我们可能有一个<ruby>构建<rt>build</rt></ruby>阶段和一个<ruby>部署<rt>deploy</rt></ruby>阶段，在构建阶段运行所有用于构建应用的作业，而在部署阶段，会部署构建出来的应用程序。而部署一个构建失败的东西是没有什么意义的，不是吗？

同一阶段的作业之间不能有依赖关系，但它们可以依赖于前一阶段的作业运行结果。

让我们来看一下 Gitlab 是如何展示阶段与阶段状态的相关信息的。

![pipeline-overview][5]

![pipeline-status][6]

### <ruby>作业<rt>job</rt></ruby>

作业就是运行器要执行的指令集合。你可以实时地看到作业的输出结果，这样开发者就能知道作业为什么失败了。

作业可以是自动执行的，也就是当推送提交后自动开始执行，也可以手工执行。手工作业必须由某个人手工触发。手工作业也有其独特的作用，比如，实现自动化部署，但只有在有人手工授权的情况下才能开始部署。这是限制哪些人可以运行作业的一种方式，这样只有信赖的人才能进行部署，以继续前面的实例。

作业也可以建构出<ruby>制品<rt>artifacts</rt></ruby>来以供用户下载，比如可以构建出一个 APK 让你来下载，然后在你的设备中进行测试; 通过这种方式，设计者和测试人员都可以下载应用并进行测试，而无需开发人员的帮助。

除了生成制品外，作业也可以部署`环境`，通常这个环境可以通过 URL 访问，让用户来测试对应的提交。

做作业状态与阶段状态是一样的：实际上，阶段的状态就是继承自作业的。

![running-job][7]

### <ruby>制品<rt>Artifacts</rt></ruby>

如前所述，作业能够生成制品供用户下载来测试。这个制品可以是任何东西，比如 Windows 上的应用程序，PC 生成的图片，甚至 Android 上的 APK。

那么，假设你是个设计师，被分配了一个合并请求：你需要验证新设计的实现！

要该怎么做呢？

你需要打开该合并请求，下载这个制品，如下图所示。

每个管道从所有作业中搜集所有的制品，而且一个作业中可以有多个制品。当你点击下载按钮时，会有一个下拉框让你选择下载哪个制品。检查之后你就可以评论这个合并请求了。

你也可以从没有合并请求的管道中下载制品 ;-)

我之所以关注合并请求是因为通常这正是测试人员、设计师和相关人员开始工作的地方。

但是这并不意味着合并请求和管道就是绑死在一起的：虽然它们结合的很好，但两者之间并没有什么关系。

![download-artifacts][8]

### <ruby>环境<rt>environment</rt></ruby>

类似的，作业可以将某些东西部署到外部服务器上去，以便你可以通过合并请求本身访问这些内容。

如你所见，<ruby>环境<rt>environment</rt></ruby>有一个名字和一个链接。只需点击链接你就能够转至你的应用的部署版本上去了（当前，前提是配置是正确的）。

Gitlab 还有其他一些很酷的环境相关的特性，比如 <ruby>[监控][9]<rt>monitoring</rt></ruby>，你可以通过点击环境的名字来查看。

![environment][10]

### 总结

这是对 Gitlab CI 中某些功能的一个简单介绍：它非常强大，使用得当的话，可以让整个团队使用一个工具完成从计划到部署的工具。由于每个月都会推出很多新功能，因此请时刻关注 [Gitlab 博客][11]。

若想知道如何对它进行设置或想了解它的高级功能，请参阅它的[文档][12]。

在 fleetster，我们不仅用它来跑测试，而且用它来自动生成各种版本的软件，并自动发布到测试环境中去。我们也自动化了其他工作（构建应用并将之发布到 Play Store 中等其它工作）。

说起来，**你是否想和我以及其他很多超棒的人一起在一个年轻而又富有活力的办公室中工作呢？** 看看 fleetster 的这些[招聘职位][13] 吧！

赞美 Gitlab 团队 (和其他在空闲时间提供帮助的人)，他们的工作太棒了！

若对本文有任何问题或回馈，请给我发邮件：[riccardo@rpadovani.com][14] 或者[发推给我][15]：-) 你可以建议我增加内容，或者以更清晰的方式重写内容(英文不是我的母语)。


那么，再见吧，

R.

P.S：如果你觉得本文有用，而且希望我们写出其他文章的话，请问您是否愿意帮我[买杯啤酒给我][17] 让我进入 [鲍尔默峰值][16]？

--------------------------------------------------------------------------------

via: https://rpadovani.com/introduction-gitlab-ci

作者：[Riccardo][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://rpadovani.com
[1]:https://www.fleetster.net
[2]:https://gitlab.com/
[3]:https://about.gitlab.com/gitlab-ci/
[4]:https://about.gitlab.com/2015/02/03/7-reasons-why-you-should-be-using-ci/
[5]:https://img.rpadovani.com/posts/pipeline-overview.png
[6]:https://img.rpadovani.com/posts/pipeline-status.png
[7]:https://img.rpadovani.com/posts/running-job.png
[8]:https://img.rpadovani.com/posts/download-artifacts.png
[9]:https://gitlab.com/help/ci/environments.md
[10]:https://img.rpadovani.com/posts/environment.png
[11]:https://about.gitlab.com/
[12]:https://docs.gitlab.com/ee/ci/README.html
[13]:https://www.fleetster.net/fleetster-team.html
[14]:mailto:riccardo@rpadovani.com
[15]:https://twitter.com/rpadovani93
[16]:https://www.xkcd.com/323/
[17]:https://rpadovani.com/donations

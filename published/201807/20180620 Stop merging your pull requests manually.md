不要再手动合并你的拉取请求（PR）
======

![](https://julien.danjou.info/content/images/2018/06/github-branching.png)

如果有什么我讨厌的东西，那就是当我知道我可以自动化它们时，但我手动进行了操作。只有我有这种情况么？我觉得不是。

尽管如此，他们每天都有数千名使用 [GitHub][1] 的开发人员一遍又一遍地做同样的事情：他们点击这个按钮：

![Screen-Shot-2018-06-19-at-18.12.39][2]

这没有任何意义。

不要误解我的意思。合并拉取请求是有意义的。只是每次点击这个该死的按钮是没有意义的。

这样做没有意义因为世界上的每个开发团队在合并拉取请求之前都有一个已知的先决条件列表。这些要求几乎总是相同的，而且这些要求也是如此：

  * 是否通过测试？
  * 文档是否更新了？
  * 这是否遵循我们的代码风格指南？
  * 是否有若干位开发人员对此进行审查？

随着此列表变长，合并过程变得更容易出错。 “糟糕，在没有足够的开发人员审查补丁时 John 就点了合并按钮。” 要发出警报么？

在我的团队中，我们就像外面的每一支队伍。我们知道我们将一些代码合并到我们仓库的标准是什么。这就是为什么我们建立一个持续集成系统，每次有人创建一个拉取请求时运行我们的测试。我们还要求代码在获得批准之前由团队的 2 名成员进行审查。

当这些条件全部设定好时，我希望代码被合并。

而不用点击一个按钮。

这正是启动 [Mergify][3] 的原因。

![github-branching-1][4]

[Mergify][3] 是一个为你按下合并按钮的服务。你可以在仓库的 `.mergify.yml` 中定义规则，当规则满足时，Mergify 将合并该请求。

无需按任何按钮。

随机抽取一个请求，就像这样：

![Screen-Shot-2018-06-20-at-17.12.11][5]

这来自一个小型项目，没有很多持续集成服务，只有 Travis。在这个拉取请求中，一切都是绿色的：其中一个所有者审查了代码，并且测试通过。因此，该代码应该被合并：但是它还在那里挂起这，等待某人有一天按下合并按钮。

使用 [Mergify][3] 后，你只需将 `.mergify.yml` 放在仓库的根目录即可：

```
rules:
  default:
    protection:
      required_status_checks:
        contexts:
          - continuous-integration/travis-ci
      required_pull_request_reviews:
        required_approving_review_count: 1
```

通过这样的配置，[Mergify][3] 可以实现所需的限制，即 Travis 通过，并且至少有一个项目成员审阅了代码。只要这些条件是肯定的，拉取请求就会自动合并。

我们将 [Mergify][3] 构建为 **一个对开源项目免费的服务**。[提供服务的引擎][6]也是开源的。

现在去[尝试它][3]，不要让这些拉取请求再挂起哪怕一秒钟。合并它们！

如果你有任何问题，请随时在下面向我们提问或写下评论！并且敬请期待 - 因为 Mergify 还提供了其他一些我迫不及待想要介绍的功能！

--------------------------------------------------------------------------------

via: https://julien.danjou.info/stop-merging-your-pull-request-manually/

作者：[Julien Danjou][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://julien.danjou.info/author/jd/
[1]:https://github.com
[2]:https://julien.danjou.info/content/images/2018/06/Screen-Shot-2018-06-19-at-18.12.39.png
[3]:https://mergify.io
[4]:https://julien.danjou.info/content/images/2018/06/github-branching-1.png
[5]:https://julien.danjou.info/content/images/2018/06/Screen-Shot-2018-06-20-at-17.12.11.png
[6]:https://github.com/mergifyio/mergify-engine

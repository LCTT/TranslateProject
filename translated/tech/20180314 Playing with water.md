尝试 H2o
======
![H2o Flow gradient boosting job][1]

我目前正在参加一个机器学习班，虽然有疯狂的工作量，但我非常喜欢。我最初计划使用 [R][2] 来训练我的数据库，但老师建议我使用一个 FOSS 机器学习框架 [H2o][3]。

起初我有点怀疑，因为我已经对 R 掌握得不错了，但后来我发现你可以简单地将 H2o 作为 R 库导入。H2o 将大多数 R 函数替换为其自己的并行化函数，以减少处理时间（不再需要 `doParallel` 调用），并且使用“外部”服务端来运行，而不是直接调用 R。

![H2o Flow gradient boosting model][4]

直到我真正在实际中开始在 H2o 中使用 R 时，我对这种情况都非常满意。我在使用非常大得数据库时，库变得笨重，我几乎不能做任何有用得事情。大多数时候，我最后只是得到一个很长的 Java 回溯调用。

我相信正确地将 H2o 作为一个库使用将非常强大，但可惜的是，它似乎在我的 R-fu 中无效。

![H2o Flow variable importance weights][5]

我至少有一整天都很生气 - 无法实现我想做的事 - 直到我意识到 H2o 有一个名为 Flow 的 WebUI。我通常不喜欢使用 web 来完成重要的工作，比如编写代码，但是 Flow 简直太不可思议了。

自动绘图功能，运行资源密集模型时集成 ETA（预计剩余时间），每个模型参数的描述（这些参数甚至会根据您熟悉的统计模型分成不同部分），Flow 似乎拥有所有功能。我很快就能够运行 3 种基本的机器学习模型并获得实际可解释的结果。

所以，如果你一直渴望使用最先进的机器学习模型分析非常大的数据库，我会推荐使用 H2o。首先尝试使用 Flow，而不是 Python 或 R 的钩子，来看看它能做什么。

唯一缺点是，H2o 是用 Java 编写的，并依赖 Java 1.7 来运行。并且需要警告：它需要非常强大的处理器和大量的内存。即使有 10 个可用的内核和 10Gb 的 RAM，我可怜的服务器也苦苦挣扎了一段时间。

--------------------------------------------------------------------------------

via: https://veronneau.org/playing-with-water.html

作者：[Louis-Philippe Véronneau][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://veronneau.org/
[1]:https://veronneau.org/media/blog/2018-03-14/h2o_job.png (H2o Flow gradient boosting job)
[2]:https://en.wikipedia.org/wiki/R_(programming_language)
[3]:https://www.h2o.ai
[4]:https://veronneau.org/media/blog/2018-03-14/h2o_model.png (H2o Flow gradient boosting model)
[5]:https://veronneau.org/media/blog/2018-03-14/h2o_var_importance.png (H2o Flow variable importance weights)

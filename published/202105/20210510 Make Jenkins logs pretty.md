[#]: subject: (Make Jenkins logs pretty)
[#]: via: (https://opensource.com/article/21/5/jenkins-logs)
[#]: author: (Evan "Hippy" Slatis https://opensource.com/users/hippyod)
[#]: collector: (lujun9972)
[#]: translator: (DCOLIVERSUN)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13392-1.html)

如何使 Jenkins 日志更可读
======

> Jenkins 的默认日志难以阅读，但日志本不必如此。

![](https://img.linux.net.cn/data/attachment/album/202105/15/093017vd34foo00wpy2yot.jpg)

Jenkins 是一个自由开源的自动化服务器，用于构建、测试和部署代码。它是<ruby>持续集成<rt>Continuous Integration</rt></ruby>（CI）、<ruby>持续交付<rt>Continuous Delivery</rt></ruby>（CD）的基础，可以为开发人员每天节约几小时，并保护他们免受失败的代码上线的影响。一旦代码失效或开发人员需要查看测试输出时，[Jenkins][2] 提供了日志文件以供检查。

默认的 Jenkins <ruby>管道<rt>Pipeline</rt></ruby>日志可能难以阅读。这篇关于 Jenkins 日志的基础知识的总结文章提供了一些技巧（和代码），说明了如何提升它们的可读性。

### 你获得什么

Jenkins 管道分为 [几个阶段][3]。Jenkins 自动记录每个阶段的开始，记录内容如下：

```
[Pipeline] // stage
[Pipeline] stage (hide)
[Pipeline] { (Apply all openshift resources)
[Pipeline] dir
```

上文显示的内容没有太大区分度，重要的内容（如阶段的开始）未突出显示。在多达数百行的管道日志中，要找到一个阶段的起始和另外一个阶段的终止位置可能会很艰巨。当随意浏览日志寻找一个特定的阶段的时候，这种艰巨尤其明显。

Jenkins 管道是由 [Groovy][4] 和 Shell 脚本混合编写的。在 Groovy 代码中，日志记录很少。很多时候，日志是由命令中的不起眼的文本组成，没有详细信息。在 Shell 脚本中，打开了调试模式（`set -x`），所以每条命令都会被完全<ruby>具现化<rt>realized</rt></ruby>（变量被解除引用并打印出数值）并详细记录，输出也是如此。

鉴于日志可能有很多内容，通读日志获取相关信息可能很繁琐。由于在管道中被处理，并跟着一个 Shell 脚本的 Groovy 日志可读性差，它们很多时候缺少上下文：

```
[Pipeline] dir
Running in /home/jenkins/agent/workspace/devop-master/devops-server-pipeline/my-repo-dir/src
[Pipeline] { (hide)
[Pipeline] findFiles
[Pipeline] findFiles
[Pipeline] readYaml
[Pipeline] }
```

我可以知道我正在使用的目录，并且知道我正在使用 Jenkins 的步骤搜索文件、读取 YAML 文件。但是我在寻找什么？我找到并读取的内容是什么？

### 能做什么？

我很高兴你这么问，因为这里有一些简单的做法和一些小的代码片段可以提供帮助。首先，代码如下：

```
def echoBanner(def ... msgs) {
   echo createBanner(msgs)
}

def errorBanner(def ... msgs) {
   error(createBanner(msgs))
}

def createBanner(def ... msgs) {
   return """
       ===========================================

       ${msgFlatten(null, msgs).join("\n        ")}

       ===========================================
   """
}

// flatten function hack included in case Jenkins security
// is set to preclude calling Groovy flatten() static method
// NOTE: works well on all nested collections except a Map
def msgFlatten(def list, def msgs) {
   list = list ?: []
   if (!(msgs instanceof String) && !(msgs instanceof GString)) {
       msgs.each { msg ->
           list = msgFlatten(list, msg)
       }
   }
   else {
       list += msgs
   }

   return  list
}
```

将这段代码添加到每个管道的末尾，也可以 [加载一个 Groovy 文件][5] 或者使其成为 [Jenkins 共享库][6] 的一部分，这样更有效。

在每个阶段起始处（或者在阶段中的特定位置），只需调用 `echoBanner`：

```
echoBanner("MY STAGE", ["DOING SOMETHING 1", "DOING SOMETHING 2"])
```

你的 Jenkins 日志会展示如下：

```
    ===========================================

    MY STAGE
    DOING SOMETHING 1
    DOING SOMETHING 2

    ===========================================
```

这个横幅很容易从日志中分辨出来。当正确使用它们时，它们还有助于界定管道流，并且可以很好的将日志分解开来进行阅读。

我已经在某些地方专业地使用这些代码一些时间了。在帮助管道日志更易读和流程更易理解方面，反馈是非常积极的。

上述的 `errorBanner` 方法以相同的方式工作，但是它会立即使脚本失效。这有助于突显失败的位置与原因。

### 最佳实践

  1. 在你的 Groovy 代码中大量使用 `echo` Jenkins 步骤来通知用户你在做什么。这些也可以帮助记录你的代码。
  2. 使用空的日志语句（Groovy 中空的 echo 步骤、`echo ''` 或 Shell 中的 `echo`）来分割输出，提高可读性。你可能在你的代码中为同样的目的使用空行。
  3. 避免在脚本中使用 `set +x` 的陷阱，因为它隐藏了日志记录已执行的 Shell 语句。它并没有清理你的日志，而是使你的管道成为一个黑盒子，隐藏了管道正在做的行为以及出现的任何错误。确保管道功能尽可能透明。
  4. 如果你的管道创建了<ruby>中间工件<rt>Intermediate Artifacts</rt></ruby>，开发人员和 DevOps 人员可以使用这些工件来帮助调试问题，那么也要记录它的内容。是的，它会加长日志，但这只是文本。在某些时候，这会是有用的信息，而（利用得当的）日志不就是关于发生了什么和为什么发生的大量信息吗？

### Kubernetes 机密信息：无法完全透明的地方

有些事情你不希望出现在日志里暴露出来。如果你在使用 Kubernetes 并引用保存在 Kubernetes <ruby>机密信息<rt>Secrets</rt></ruby>中的数据，那么你绝对不希望在日志中公开该数据，因为这些数据只是被混淆了，而没有被加密。

假如你想获取一些保存在机密信息中的数据，然后将其注入模板化 JSON 文件中。（机密信息和 JSON 模板的完整内容与此例无关。）按照最佳实践，你希望保持透明并记录你的操作，但你不想公开机密信息数据。

将脚本模式从调试（`set -x`）更改为命令记录（`set -v`）。在脚本敏感部分的结尾，将 Shell 重置为调试模式：

```
sh """
   # change script mode from debugging to command logging
   set +x -v

   # capture data from secret in shell variable
   MY_SECRET=\$(kubectl get secret my-secret --no-headers -o 'custom-column=:.data.my-secret-data')

   # replace template placeholder inline
   sed s/%TEMPLATE_PARAM%/${MY_SECRET_DATA}/ my-template-file.json

   # do something with modified template-file.json...

   # reset the shell to debugging mode
   set -x +v
"""
```

这将输出此行到日志：

```
sed s/%TEMPLATE_PARAM%/${MY_SECRET_DATA}/ my-template-file.json
```

与 Shell 调试模式中不同，这不会具现化 Shell 变量 `MY_SECRET_DATA`。显然，如果管道中在这一点出现问题，而你试图找出问题出在哪里，那么这不如调试模式有用。但这是在保持管道执行对开发人员和 DevOps 透明的同时，也保持你的秘密的最佳平衡。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/jenkins-logs

作者：[Evan "Hippy" Slatis][a]
选题：[lujun9972][b]
译者：[DCOLIVERSUN](https://github.com/DCOLIVERSUN)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hippyod
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://www.jenkins.io/
[3]: https://www.jenkins.io/doc/book/pipeline/syntax/#stage
[4]: https://opensource.com/article/20/12/groovy
[5]: https://www.jenkins.io/doc/pipeline/steps/workflow-cps/#load-evaluate-a-groovy-source-file-into-the-pipeline-script
[6]: https://www.jenkins.io/doc/book/pipeline/shared-libraries/

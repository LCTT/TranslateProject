[#]: subject: (Make Jenkins logs pretty)
[#]: via: (https://opensource.com/article/21/5/jenkins-logs)
[#]: author: (Evan "Hippy" Slatis https://opensource.com/users/hippyod)
[#]: collector: (lujun9972)
[#]: translator: (DCOLIVERSUN)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

美化 Jenkins 日志
======
Jenkins 默认日志难以阅读，但日志本身不必如此。
![用笔记本电脑的人][1]

Jenkins 是一个免费的开源自动化服务器，用于构建、测试和部署代码。它是<ruby>持续集成<rt>Continuous Integration, CI</rt></ruby>>、<ruby>持续交付<rt>Continuous Delivery, CD</rt></ruby>的基础，每天可以为开发人员节省时间，防止他们上线错误的代码。一旦代码失效或开发人员需要查看测试输出时，[Jenkins][2] 将提供日志文件以供检查。

默认的 Jenkins <ruby>管道<rt>Pipeline</rt></ruby>日志难以阅读。Jenkins 日志的摘要提供了一些技巧（和代码），可以提升它们的可读性。

### 你获得什么

Jenkins 管道分为[多个阶段][3]。Jenkins 自动在每个阶段初自动记录，记录内容如下：


```
[Pipeline] // stage
[Pipeline] stage (hide)
[Pipeline] { (Apply all openshift resources)
[Pipeline] dir
```

上文显示的内容没有太大区分度，重要的内容（如阶段的开始）未突出显示。在多达数百行的管道日志中，找到阶段的起始、终止位置可能会很艰巨。当随意浏览日志寻找特定阶段的时候，这种艰巨尤其明显。

Jenkins 管道是 [Groovy][4] 和 Shell 脚本混合编写的。在 Groovy 代码中，日志记录很少。很多时候，日志是由命令中的灰色文本组成，没有详细信息。在 Shell 脚本中，打开调试模式（`set -x`），打印每条 Shell 命令与结果，以输出形式详细记录在日志中。

鉴于可能有很多内容，通读日志获取相关信息可能是很繁琐的。在管道中执行、遵循 Shell 脚本的 Groovy 日志可读性差，它们很多时候缺少上下文：


```
[Pipeline] dir
Running in /home/jenkins/agent/workspace/devop-master/devops-server-pipeline/my-repo-dir/src
[Pipeline] { (hide)
[Pipeline] findFiles
[Pipeline] findFiles
[Pipeline] readYaml
[Pipeline] }
```

我可以知道我正在使用的目录，并且知道我正在搜索文件、使用 Jenkins 的步骤读取 YAML 文件。但是我在寻找什么？我读取的内容是什么？

### 能做什么？

我很高兴你被问问倒，因为这里有一些简单的实现和一些小的代码片段可以提供帮助。首先，代码如下：


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

       ${msgFlatten(null, msgs).join("\n        ")}

       ===========================================
   """
}

// flatten function hack included in case Jenkins security
// is set to preclude calling Groovy flatten() static method
// NOTE: works well on all nested collections except a Map
def msgFlatten(def list, def msgs) {
   list = list ?: []
   if (!(msgs instanceof String) &amp;&amp; !(msgs instanceof GString)) {
       msgs.each { msg -&gt;
           list = msgFlatten(list, msg)
       }
   }
   else {
       list += msgs
   }

   return  list
}
```

将这段代码添加到每个管道的末尾，也可以[加载 Groovy 文件][5]或者使其成为 [Jenkins 共享库][6] 的一部分，这样更有效。

在每个阶段起始处（或者在阶段中指定位置），只需调用 `echoBanner`：


```
`echoBanner("MY STAGE", ["DOING SOMETHING 1", "DOING SOMETHING 2"])`
```

你的 Jenkins 日志会如下展示：


```
    ===========================================

    MY STAGE
    DOING SOMETHING 1
    DOING SOMETHING 2

    ===========================================
```

标志很容易从日志中分辨出来。当正确使用它们时，它们还有助于定义管道流，并且可以很好得分解日志进行读取。

我已经在某些地方运行这段代码一些时间了。反馈非常积极，可以提升管道日志可读性，更容易理解管道流。

上述的 `errorBanner` 方法以相同的方式工作，但是它会立即使脚本失效。这有助于突显故障的位置与原因。

### 最佳实践

  1. 在 Groovy 代码中自由地使用 `echo` Jenkins 步骤来通知用户你的行为。这些也可以帮助记录你的代码。
  2. 使用空的日志语句（Groovy 中空 echo 步骤、`echo ''`或着 Shell 中的 `echo`）打断输出，提高可读性。你可以出于相同的目的在代码中使用空行。
  3. 避免在脚本中使用 `set +x` 的陷阱，因为这会影响日志记录已执行的 Shell 语句。它不会过多清理你的日志，因为它使你的管道成为一个黑盒子，该黑盒子会隐藏管道正在做的行为以及出现的任何错误。确保管道功能尽可能透明。
  4. 如果你的管道创建了<ruby>中间组件<rt>Intermediate Artifacts</rt></ruby>，开发人员和 DevOps 人员可以使用这些组件来帮助调试问题，那么也要记录内容。是的，它会加长日志，但这只是文本。在某些时候，这会是有用的信息，如果使用得当的话，除了大量有关发生的事情以及原因的信息之外，日志还有什么？



### Kubernetes Secret：无法完全透明的地方

有些事情你不希望出现在日志里暴露出来。如果你在使用 Kubernetes 并引用保存在 Kubernetes Secret 中的数据，那么你绝对不希望在日志中公开该数据，因为这些数据只会被混淆，而不会被加密。

加入你想获取一些保存在 Secret 中的数据，然后将其注入模板化 JSON 文件中。（此例与 Secret 和 JSON 模板的完整内容无关。）由于这是最佳做法，你希望保持透明并记录你的操作，但你不想公开 Secret 数据。

将脚本模式从调试（`set -x`）更改为命令日志记录(`set -v`)。在脚本易错部分结尾，将 Shell 重置为调试模式：


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
`sed s/%TEMPLATE_PARAM%/${MY_SECRET_DATA}/ my-template-file.json`
```

与 Shell 调试模式中不同，这不会实现 Shell 变量 `MY_SECRET_DATA`。显然，如果管道中在这一点出现问题，你试图找出问题出在哪里，那么这不如调试模式有用。但这是开发人员和 DevOps 人员保持管道透明性和 Secret 数据隐蔽性之间平衡的最佳做法。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/jenkins-logs

作者：[Evan "Hippy" Slatis][a]
选题：[lujun9972][b]
译者：[DCOLIVERSUN](https://github.com/DCOLIVERSUN)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hippyod
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://www.jenkins.io/
[3]: https://www.jenkins.io/doc/book/pipeline/syntax/#stage
[4]: https://opensource.com/article/20/12/groovy
[5]: https://www.jenkins.io/doc/pipeline/steps/workflow-cps/#load-evaluate-a-groovy-source-file-into-the-pipeline-script
[6]: https://www.jenkins.io/doc/book/pipeline/shared-libraries/

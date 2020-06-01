[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12247-1.html)
[#]: subject: (Speed up administration of Kubernetes clusters with k9s)
[#]: via: (https://opensource.com/article/20/5/kubernetes-administration)
[#]: author: (Jessica Cherry https://opensource.com/users/cherrybomb)

k9s：你没看错，这是一个加速 k8s 集群管理的工具
======

> 看看这个很酷的 Kubernetes 管理的终端 UI。

![](https://img.linux.net.cn/data/attachment/album/202005/25/104742pqjmiroc44honcs5.jpg)

通常情况下，我写的关于 Kubernetes 管理的文章中用的都是做集群管理的 `kubectl` 命令。然而最近，有人给我介绍了 [k9s][2] 项目，可以让我快速查看并解决 Kubernetes 中的日常问题。这极大地改善了我的工作流程，我会在这篇教程中告诉你如何上手它。 

它可以安装在 Mac、Windows 和 Linux 中，每种操作系统的说明可以在[这里][2]找到。请先完成安装，以便能够跟上本教程。

我会使用 Linux 和 Minikube，这是一种在个人电脑上运行 Kubernetes 的轻量级方式。按照[此教程][3]或使用[该文档][4]来安装它。

### 设置 k9s 配置文件

安装好 `k9s` 应用后，从帮助命令开始总是很好的起点。

```
$ k9s help
```

正如你在帮助信息所看到的，我们可以用 `k9s` 来配置很多功能。我们唯一需要进行的步骤就是编写配置文件。而 `info` 命令会告诉我们该应用程序要在哪里找它的配置文件。

```
$ k9s info
 ____  __.________
|    |/ _/   __   \______
|      < \____    /  ___/
|    |  \   /    /\___ \
|____|__ \ /____//____  >
        \/            \/

Configuration:   /Users/jess/.k9s/config.yml
Logs:            /var/folders/5l/c1y1gcw97szdywgf9rk1100m0000gn/T/k9s-jess.log
Screen Dumps:    /var/folders/5l/c1y1gcw97szdywgf9rk1100m0000gn/T/k9s-screens-jess
```

如果要添加配置文件，该配置目录不存在的话就创建它，然后添加一个配置文件。

```
$ mkdir -p ~/.k9s/
$ touch ~/.k9s/config.yml
```

在这篇介绍中，我们将使用 `k9s` 版本库中推荐的默认 `config.yml`。维护者请注意，这种格式可能会有变化，可以[在这里查看][5]最新版本。

```
k9s:
  refreshRate: 2
  headless: false
  readOnly: false
  noIcons: false
  logger:
    tail: 200
    buffer: 500
    sinceSeconds: 300
    fullScreenLogs: false
    textWrap: false
    showTime: false
  currentContext: minikube
  currentCluster: minikube
  clusters:
    minikube:
      namespace:
        active: ""
        favorites:
        - all
        - kube-system
        - default
      view:
        active: dp
  thresholds:
    cpu:
      critical: 90
      warn: 70
    memory:
      critical: 90
      warn: 70
```

我们设置了 `k9s` 寻找本地的 minikube 配置，所以我要确认 minikube 已经上线可以使用了。

```
$ minikube status
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured
```

### 运行 k9s 来探索一个 Kubernetes 集群

有了配置文件，并指向我们的本地集群，我们现在可以运行 `k9s` 命令了。

```
$ k9s
```

启动后，会弹出 `k9s` 的基于文本的用户界面。在没有指定命名空间标志的情况下，它会向你显示默认命名空间中的 Pod。

![K9s screenshot][6]

如果你运行在一个有很多 Pod 的环境中，默认视图可能会让人不知所措。或者，我们可以将注意力集中在给定的命名空间上。退出该应用程序，运行 `k9s -n <namespace>`，其中 `<namespace>` 是已存在的命名空间。在下图中，我运行了 `k9s -n minecraft`，它显示了我损坏的 Pod：

![K9s screenshot][7]

所以，一旦你有了 `k9s` 后，有很多事情你可以更快地完成。 

通过快捷键来导航 `k9s`，我们可以随时使用方向键和回车键来选择列出的项目。还有不少其他的通用快捷键可以导航到不同的视图。

* `0`：显示在所有命名空间中的所有 Pod
    ![K9s screenshot][8]
* `d`：描述所选的 Pod
    ![K9s screenshot][9]
* `l`：显示所选的 Pod 的日志
    ![Using k9s to show Kubernetes pod logs][10]

你可能会注意到 `k9s` 设置为使用 [Vim 命令键][11]，包括使用 `J` 和 `K` 键上下移动等。Emacs 用户们，败退吧 :)

### 快速查看不同的 Kubernetes 资源

需要去找一个不在 Pod 里的东西吗？是的，我也需要。当我们输入冒号（`:`）键时，可以使用很多快捷方式。从那里，你可以使用下面的命令来导航。

* `:svc`：跳转到服务视图
    ![K9s screenshot][12]
* `:deploy`：跳转到部署视图
    ![K9s screenshot][13]
* `:rb`：跳转到角色绑定视图，用于 [基于角色的访问控制（RBAC）][14]管理
    ![K9s screenshot][15]
* `:namespace`：跳转到命名空间视图
    ![K9s screenshot][16]
* `:cj`：跳转到 cronjob 视图，查看集群中计划了哪些作业。
    ![K9s screenshot][17]

这个应用最常用的工具是键盘；要在任何页面往上或下翻页，请使用方向键。如果你需要退出，记得使用 Vim 绑定键，键入 `:q`，然后按回车键离开。

### 用 k9s 排除 Kubernetes 的故障示例

当出现故障的时候，`k9s` 怎么帮忙？举个例子，我让几个 Pod 由于配置错误而死亡。下面你可以看到我那个可怜的 “hello” 部署死了。当我们将其高亮显示出来，可以按 `d` 运行 `describe` 命令，看看是什么原因导致了故障。

![K9s screenshot][18]

![K9s screenshot][19]

草草掠过那些事件并不能告诉我们故障原因。接下来，我按了 `esc` 键，然后通过高亮显示 Pod 并输入`shift-l` 来检查日志。

![K9s screenshot][20]

不幸的是，日志也没有提供任何有用的信息（可能是因为部署从未正确配置过），而且 Pod 也没有出现。

然后我使用 `esc` 退了出来，我看看删除 Pod 是否能解决这个问题。要做到这一点，我高亮显示该 Pod，然后使用 `ctrl-d`。幸好 `k9s` 在删除前会提示用户。 

![K9s screenshot][21]

虽然我确实删除了这个 Pod，但部署资源仍然存在，所以新的 Pod 会重新出现。无论什么原因（我们还不知道），它还会继续重启并死掉。

在这里，我会重复查看日志，描述资源，甚至使用 `e` 快捷方式来编辑运行中的 Pod 以排除故障行为。在这个特殊情况下，失败的 Pod 是因为没有配置在这个环境下运行。因此，让我们删除部署来停止崩溃接着重启的循环。

我们可以通过键入 `:deploy` 并点击回车进入部署。从那里我们高亮显示并按 `ctrl-d` 来删除。

![K9s screenshot][22]

![K9s screenshot][23]

这个有问题的部署被干掉了! 只用了几个按键就把这个失败的部署给清理掉了。

### k9s 是极其可定制的

这个应用有很多自定义选项、乃至于 UI 的配色方案。这里有几个可编辑的选项，你可能会感兴趣。

* 调整你放置 `config.yml` 文件的位置（这样你就可以把它存储在[版本控制][24]中）。
* 在 `alias.yml` 文件中添加[自定义别名][25]。
* 在 `hotkey.yml` 文件中创建[自定义热键][26]。
* 探索现有的[插件][27]或编写自己的插件。

整个应用是在 YAML 文件中配置的，所以定制化对于任何 Kubernetes 管理员来说都会觉得很熟悉。

### 用 k9s 简化你的生活

我倾向于以一种非常手动的方式来管理我团队的系统，更多的是为了锻炼脑力，而不是别的。当我第一次听说 `k9s` 的时候，我想，“这只是懒惰的 Kubernetes 而已。”于是我否定了它，然后回到了到处进行人工干预的状态。实际上，当我在处理积压工作时就开始每天使用它，而让我震惊的是它比单独使用 `kubectl` 快得多。现在，我已经皈依了。 

了解你的工具并掌握做事情的“硬道理”很重要。还有一点很重要的是要记住，就管理而言，重要的是要更聪明地工作，而不是更努力。使用 `k9s`，就是我践行这个目标的方法。我想，我们可以把它叫做懒惰的 Kubernetes 管理，也没关系。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/kubernetes-administration

作者：[Jessica Cherry][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cherrybomb
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/game-dogs-chess-play-lead.png?itok=NAuhav4Z (Dogs playing chess)
[2]: https://github.com/derailed/k9s
[3]: https://opensource.com/article/18/10/getting-started-minikube
[4]: https://kubernetes.io/docs/tasks/tools/install-minikube/
[5]: https://github.com/derailed/k9s#k9s-configuration
[6]: https://opensource.com/sites/default/files/uploads/k9s_1.png (K9s screenshot)
[7]: https://opensource.com/sites/default/files/uploads/k9s_2.png (K9s screenshot)
[8]: https://opensource.com/sites/default/files/uploads/k9s_3.png (K9s screenshot)
[9]: https://opensource.com/sites/default/files/uploads/k9s_5_0.png (K9s screenshot)
[10]: https://opensource.com/sites/default/files/uploads/k9s-show-logs-opensourcedotcom.png (Using k9s to show Kubernetes pod logs)
[11]: https://opensource.com/article/19/3/getting-started-vim
[12]: https://opensource.com/sites/default/files/uploads/k9s_5.png (K9s screenshot)
[13]: https://opensource.com/sites/default/files/uploads/k9s_6.png (K9s screenshot)
[14]: https://kubernetes.io/docs/reference/access-authn-authz/rbac/
[15]: https://opensource.com/sites/default/files/uploads/k9s_7.png (K9s screenshot)
[16]: https://opensource.com/sites/default/files/uploads/k9s_8.png (K9s screenshot)
[17]: https://opensource.com/sites/default/files/uploads/k9s_9.png (K9s screenshot)
[18]: https://opensource.com/sites/default/files/uploads/k9s_10.png (K9s screenshot)
[19]: https://opensource.com/sites/default/files/uploads/k9s_11.png (K9s screenshot)
[20]: https://opensource.com/sites/default/files/uploads/k9s_12.png (K9s screenshot)
[21]: https://opensource.com/sites/default/files/uploads/k9s_13.png (K9s screenshot)
[22]: https://opensource.com/sites/default/files/uploads/k9s_14.png (K9s screenshot)
[23]: https://opensource.com/sites/default/files/uploads/k9s_15.png (K9s screenshot)
[24]: https://opensource.com/article/19/3/move-your-dotfiles-version-control
[25]: https://k9scli.io/topics/aliases/
[26]: https://k9scli.io/topics/hotkeys/
[27]: https://github.com/derailed/k9s/tree/master/plugins

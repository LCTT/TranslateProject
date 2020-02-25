[#]: collector: (lujun9972)
[#]: translator: (guevaraya)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11930-1.html)
[#]: subject: (Troubleshoot Kubernetes with the power of tmux and kubectl)
[#]: via: (https://opensource.com/article/20/2/kubernetes-tmux-kubectl)
[#]: author: (Abhishek Tamrakar https://opensource.com/users/tamrakar)

利用 Tmux 和 kubectl 解决 Kubernetes 故障
======

> 一个使用 tmux 的 kubectl 插件可以使 Kubernetes 疑难问题变得更简单。

![](https://img.linux.net.cn/data/attachment/album/202002/25/125435a4v3vpss3s4w3sks.jpg)

[Kubernetes][2] 是一个活跃的开源容器管理平台，它提供了可扩展性、高可用性、健壮性和富有弹性的应用程序管理。它的众多特性之一是支持通过其主要的二进制客户端 [kubectl][3] 运行定制脚本或可执行程序，kubectl 很强大的，允许用户在 Kubernetes 集群上用它直接做很多事情。

### 使用别名进行 Kubernetes 的故障排查

使用 Kubernetes 进行容器编排的人都知道由于设计上原因带来了其功能的复杂性。举例说，迫切需要以更快的速度并且几乎不需要手动干预的方式来简化 Kubernetes 中的故障排除（除过特殊情况）。

在故障排查功能方面，有很多场景需要考虑。在一种场景下，你知道你需要运行什么，但是这个命令的语法（即使作为一个单独的命令运行）过于复杂，或需要一、两次交互才能起作用。

例如，如果你需要经常进入一个系统命名空间中运行的容器，你可能发现自己在重复地键入：

```
kubectl --namespace=kube-system exec -i -t <your-pod-name>
```

为了简化故障排查，你可以用这些指令的命令行别名。比如，你可以增加下面命令到你的隐藏配置文件（`.bashrc` 或 `.zshrc`）：

```
alias ksysex='kubectl --namespace=kube-system exec -i -t'
```

这是来自于 [Kubernetes 常见别名][4]存储库的一个例子，它展示了一种简化 `kubectl` 中的功能的方法。像这种场景下的简单情形，使用别名很有用。

### 切换到 kubectl 插件

更复杂的故障排查场景是需要一个一个的执行很多命令，调查环境，最后得出结论。仅仅用别名方法是不能解决这种情况的；你需要知道你所部署的 Kubernetes 之间逻辑和相关性，你真正需要的是自动化，以在更短的时间内输出你想要的。

考虑到你的集群有 10 ~ 20 或 50 ~ 100 个命名空间来提供不同的微服务。一般在进行故障排查时，什么对你有帮助？

* 你需要能够快速分辨出抛出错误的是哪个 命名空间的哪个 Pod 的东西。
* 你需要一些可监视一个命名空间的所有 Pod 日志的东西。
* 你可能也需要监视特定命名空间的出现错误的某个 Pod 的日志。

涵盖这些要点的解决方案对于定位生产环境的问题有很大的帮助，以及在开发和测试环节中也很有用。

你可以用 [kubectl 插件][5]创建比简单的别名更强大的功能。插件类似于其它用任何语言编写的独立脚本，但被设计为可以扩充 Kubernetes 管理员的主要命令。

创建一个插件，你必须用 `kubectl-<your-plugin-name>` 的正确的语法来拷贝这个脚本到 `$PATH` 中的导出目录之一，并需要为其赋予可执行权限（`chmod +x`）。

创建插件之后将其移动到路径中，你可以立即运行它。例如，我的路径下有一个 `kubectl-krawl` 和 `kubectl-kmux`：

```
$ kubectl plugin list
The following compatible plugins are available:

/usr/local/bin/kubectl-krawl
/usr/local/bin/kubectl-kmux

$ kubectl kmux
```

现在让我们见识下带有 tmux 的 Kubernetes 的有多强大。

### 驾驭强大的 tmux

[Tmux][6] 是一个非常强大的工具，许多管理员和运维团队都依赖它来解决与易操作性相关的问题：通过将窗口分成多个窗格以便在多台计算机上运行并行的调试来监视日志。它的主要的优点是可在命令行或自动化脚本中使用。

我创建[一个 kubectl 插件][7]，使用 tmux 使故障排查更加简单。我将通过注释来解析插件背后的逻辑（插件的完整代码留待给你实现）：

```
# NAMESPACE 是要监控的名字空间
# POD 是 Pod 名称
# Containers 是容器名称

# 初始化一个计数器 n 以计算循环计数的数量，
# 之后 tmux 使用它来拆分窗格。
n=0;

# 在 Pod 和容器列表上开始循环
while IFS=' ' read -r POD CONTAINERS
do
    # tmux 为每个 Pod 创建一个新窗口
    tmux neww $COMMAND -n $POD 2>/dev/null
    # 对运行中的 Pod 中 的所有容器启动循环
    for CONTAINER in ${CONTAINERS//,/ }
    do
        if [ x$POD = x -o x$CONTAINER = x ]; then
            # 如果任何值为 null，则退出。
                     warn "Looks like there is a problem getting pods data."
            break
        fi
           
        # 设置要执行的命令
        COMMAND=”kubectl logs -f $POD -c $CONTAINER -n $NAMESPACE”
        # 检查 tmux 会话
        if tmux has-session -t <会话名> 2>/dev/null;
        then
            <设置会话退出>
        else
            <创建会话>
        fi
        # 在当前窗口为每个容器切分窗格
        tmux selectp -t $n \; \
        splitw $COMMAND \; \
        select-layout tiled \;
        # 终止容器循环
    done
    
    # 用 Pod 名称重命名窗口以识别
    tmux renamew $POD 2>/dev/null
    
    # 增加计数器
    ((n+=1))

# 终止 Pod 循环
done<<(<从 kubernetes  集群获取 Pod 和容器的列表>)

# 最后选择窗口并附加会话
tmux selectw -t <会话名>:1 \; \
attach-session -t <会话名>\;
```

运行插件脚本后，将产生类似于下图的输出。每个 Pod 有一个自己的窗口，每个容器（如果有多个）被分割到其窗口中 Pod 窗格中，并在日志到达时输出。Tmux 之美如下可见；通过正确的配置，你甚至会看到哪个窗口正处于激活运行状态（可看到标签是白色的）。

![kmux 插件的输出][8]

### 总结

别名是在 Kubernetes 环境下常见的也有用的简易故障排查方法。当环境变得复杂，用高级脚本生成的kubectl 插件是一个更强大的方法。至于用哪个编程语言来编写 kubectl 插件是没有限制。唯一的要求是该名字在路径中是可执行的，并且不能与已知的 kubectl 命令重复。

要阅读完整的插件源码，或试试我创建的插件，请查看我的 [kube-plugins-github][7] 存储库。欢迎提交提案和补丁。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/kubernetes-tmux-kubectl

作者：[Abhishek Tamrakar][a]
选题：[lujun9972][b]
译者：[guevaraya](https://github.com/guevaraya)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/tamrakar
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_women_computing_4.png?itok=VGZO8CxT (一个坐在笔记本面前的妇女)
[2]: https://opensource.com/resources/what-is-kubernetes
[3]: https://kubernetes.io/docs/reference/kubectl/overview/
[4]: https://github.com/ahmetb/kubectl-aliases/blob/master/.kubectl_aliases
[5]: https://kubernetes.io/docs/tasks/extend-kubectl/kubectl-plugins/
[6]: https://opensource.com/article/19/6/tmux-terminal-joy
[7]: https://github.com/abhiTamrakar/kube-plugins
[8]: https://raw.githubusercontent.com/abhiTamrakar/kube-plugins/master/kmux/kmux.png

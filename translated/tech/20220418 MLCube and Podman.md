[#]: subject: "MLCube and Podman"
[#]: via: "https://fedoramagazine.org/mlcube-and-podman/"
[#]: author: "Benson Muite https://fedoramagazine.org/author/fed500/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

MLCube 和 Podman
======

![Two sides of a blue cube with the text "Machine" and "Learning" on one face, and "Pod" and "Management" on the other face. The background is comprised of alternating zeroes and ones in green on black.][1]

[MLCube][2] 是一个新的基于容器的开源基础设施规范，被引入到基于 Python 的机器学习工作流程中，以实现可重复性。它可以利用诸如 [Podman][3]、[Singularity][4] 和 [Docker][5] 等工具。也支持在远程平台上的执行。正在开发 MLCube 的 MLCommons 最佳实践工作组的主席之一是来自 Red Hat 的 [Diane Feddema][6]。这篇介绍性文章解释了如何在 Fedora Linux 上使用 Podman 运行 [hello world MLCube 例子][7]。

[Yazan Monshed][8] 写了一篇关于 [Fedora 上的 Podman][9] 的非常有用的介绍，对这里使用的一些步骤给出了更多细节。

首先安装必要的依赖项。

```

    sudo dnf -y update
    sudo dnf -y install podman git virtualenv \
                        policycoreutils-python-utils

```

然后，按照文档的要求，设置一个虚拟环境并获得示例代码。为了确保可重复性，使用一个特定的提交，因为该项目正在积极改进。

```

    virtualenv -p python3 ./env_mlcube
    source ./env_mlcube/bin/activate
    git clone https://github.com/mlcommons/mlcube_examples.git
    cd ./mlcube_examples/hello_world
    git checkout 5fe69bd
    pip install mlcube mlcube-docker
    mlcube describe

```

现在，通过编辑 $HOME/mlcube.yaml 文件，将运行器命令从 _docker_ 改为 _podman_，以便将这一行：

```

    docker: docker

```

改为：

```

    docker: podman

```

如果你使用的是 x86_64 架构的电脑，你可以用以下方式获得容器：

```

    mlcube configure --mlcube=. --platform=docker

```

你会看到一些选项：

```

    ? Please select an image:
      ▸ registry.fedoraproject.org/mlcommons/hello_world:0.0.1
        registry.access.redhat.com/mlcommons/hello_world:0.0.1
        docker.io/mlcommons/hello_world:0.0.1
        quay.io/mlcommons/hello_world:0.0.1

```

选择 docker.io/mlcommons/hello_world:0.0.1 来获取容器。

如果你的电脑不是 x86_64 架构的，你将需要构建容器。改变文件 $HOME/mlcube.yaml，使这一行：

```

    build_strategy: pull

```

变为：

```

    build_strategy: auto

```

然后用以下方法构建容器：

```

    mlcube configure --mlcube=. --platform=docker

```

要运行测试，你可能需要在目录中适当地设置 SELinux 权限。你可以通过输入以下内容来检查 SELinux 是否已经启用：

```

    sudo sestatus

```

应该会有类似的输出：

```

    SELinux status:                 enabled
    ...

```

[Josphat Mutai][10]、[Christopher Smart][11] 和 [Daniel Walsh][12] 解释说，在为容器使用的文件设置适当的 SELinux 策略时，你需要谨慎。在这里，你将允许容器读取和写入 _workspace_ 目录。

```

    sudo semanage fcontext -a -t container_file_t "$PWD/workspace(/.*)?"
    sudo restorecon -Rv $PWD/workspace

```

现在检查目录策略：

```

    ls -Z

```

输出结果类似于：

```

    unconfined_u:object_r:user_home_t:s0 Dockerfile
    unconfined_u:object_r:user_home_t:s0 README.md
    unconfined_u:object_r:user_home_t:s0 mlcube.yaml
    unconfined_u:object_r:user_home_t:s0 requirements.txt
    unconfined_u:object_r:container_file_t:s0 workspace

```

现在运行这个例子：

```

    mlcube run --mlcube=. --task=hello --platform=docker
    mlcube run --mlcube=. --task=bye --platform=docker

```

最后，检查输出：

```

    cat workspace/chats/chat_with_alice.txt

```

有类似于以下的文字：

```

    Hi, Alice! Nice to meet you.
    Bye, Alice! It was great talking to you.

```

你可以按照[这里][13]的描述创建你自己的 MLCube。欢迎对 [MLCube 示例库][14]做出贡献。[Udica][15] 是一个新项目，它承诺为容器提供更精细的 SELinux 策略控制，便于系统管理员应用。这些项目的积极开发正在进行中。对它们进行测试并提供反馈，将有助于使带有 SELinux 的系统上的安全数据管理更容易、更有效。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/mlcube-and-podman/

作者：[Benson Muite][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/fed500/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/04/MLCubePodman-816x345.jpg
[2]: https://mlcommons.org/en/mlcube/
[3]: https://podman.io/
[4]: https://sylabs.io/singularity/
[5]: https://www.docker.com/
[6]: https://www.redhat.com/en/authors/diane-feddema
[7]: https://mlcommons.github.io/mlcube/getting-started/hello-world/
[8]: https://fedoramagazine.org/author/yazanalmonshed/
[9]: https://fedoramagazine.org/getting-started-with-podman-in-fedora/
[10]: https://computingforgeeks.com/set-selinux-context-label-for-podman-graphroot-directory/
[11]: https://blog.christophersmart.com/2021/01/31/podman-volumes-and-selinux/
[12]: https://opensource.com/article/18/2/selinux-labels-container-runtimes
[13]: https://mlcommons.github.io/mlcube/tutorials/create-mlcube/
[14]: https://github.com/mlcommons/mlcube_examples
[15]: https://github.com/containers/udica

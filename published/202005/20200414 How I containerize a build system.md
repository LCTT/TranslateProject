[#]: collector: (lujun9972)
[#]: translator: (LazyWolfLin)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12232-1.html)
[#]: subject: (How I containerize a build system)
[#]: via: (https://opensource.com/article/20/4/how-containerize-build-system)
[#]: author: (Ravi Chandran https://opensource.com/users/ravichandran)

对构建系统进行容器化的指南
======

> 搭建一个通过容器分发应用的可复用系统可能很复杂，但这儿有个好方法。

![](https://img.linux.net.cn/data/attachment/album/202005/19/085248ausakkjfu05akqr2.jpg)

一个用于将源代码转换成可运行的应用的构建系统是由工具和流程共同组成。在转换过程中还涉及到代码的受众从软件开发者转变为最终用户，无论最终用户是运维的同事还是部署的同事。

在使用容器搭建了一些构建系统后，我觉得有一个不错的可复用的方法值得分享。虽然这些构建系统被用于编译机器学习算法和为嵌入式硬件生成可加载的软件镜像，但这个方法足够抽象，可用于任何基于容器的构建系统。

这个方法是以一种易于使用和维护的方式搭建或组织构建系统，但并不涉及处理特定编译器或工具容器化的技巧。它适用于软件开发人员构建软件，并将可维护镜像交给其他技术人员（无论是系统管理员、运维工程师或者其他一些头衔）的常见情况。该构建系统被从终端用户中抽象出来，这样他们就可以专注于软件。

### 为什么要容器化构建系统？

搭建基于容器的可复用构建系统可以为软件团队带来诸多好处：

  * **专注**：我希望专注于应用的开发。当我调用一个工具进行“构建”时，我希望这个工具集能生成一个随时可用的二进制文件。我不想浪费时间在构建系统的查错上。实际上，我宁愿不了解，或者说不关心构建系统。
  * **一致的构建行为**：无论在哪种使用情况下，我都想确保整个团队使用相同版本的工具集并在构建时得到相同的结果。否则，我就得不断地处理“我这咋就是好的”的麻烦。在团队项目中，使用相同版本的工具集并对给定的输入源文件集产生一致的输出是非常重要。
  * **易于部署和升级**：即使向每个人都提供一套详细说明来安装一个项目的工具集，也可能会有人翻车。问题也可能是由于每个人对自己的 Linux 环境的个性化修改导致的。在团队中使用不同的 Linux 发行版（或者其他操作系统），情况可能还会变得更复杂。当需要将工具集升级到下一版本时，问题很快就会变得更糟糕。使用容器和本指南将使得新版本升级非常简单。

对我在项目中使用的构建系统进行容器化的这些经验显然很有价值，因为它可以缓解上述问题。我倾向于使用 Docker 作为容器工具，虽然在相对特殊的环境中安装和网络配置仍可能出现问题，尤其是当你在一个使用复杂代理的企业环境中工作时。但至少现在我需要解决的构建系统问题已经很少了。

### 漫步容器化的构建系统

我创建了一个[教程存储库][2]，随后你可以克隆并检查它，或者按照本文内容进行操作。我将逐个介绍存储库中的文件。这个构建系统非常简单（它运行 `gcc`），从而可以让你专注于这个构建系统结构上。

### 构建系统需求

我认为构建系统中有两个关键点：

  * **标准化构建调用**：我希望能够指定一些形如 `/path/to/workdir` 的工作目录来构建代码。我希望以如下形式调用构建：

        ./build.sh /path/to/workdir

    为了使得示例的结构足够简单（以便说明），我将假定输出也在 `/path/to/workdir` 路径下的某处生成。（否则，将增加容器中显示的卷的数量，虽然这并不困难，但解释起来比较麻烦。）
  * **通过 shell 自定义构建调用**：有时，工具集会以出乎意料的方式被调用。除了标准的工具集调用 `build.sh` 之外，如果需要还可以为 `build.sh` 添加一些选项。但我一直希望能够有一个可以直接调用工具集命令的 shell。在这个简单的示例中，有时我想尝试不同的 `gcc` 优化选项并查看效果。为此，我希望调用：

        ./shell.sh /path/to/workdir

    这将让我得到一个容器内部的 Bash shell，并且可以调用工具集和访问我的工作目录（`workdir`），从而我可以根据需要尝试使用这个工具集。

### 构建系统的架构

为了满足上述基本需求，这是我的构架系统架构：

![Container build system architecture][3]

在底部的 `workdir` 代表软件开发者用于构建的任意软件源码。通常，这个 `workdir` 是一个源代码的存储库。在构建之前，最终用户可以通过任何方式来操纵这个存储库。例如，如果他们使用 `git` 作为版本控制工具的话，可以使用 `git checkout` 切换到他们正在工作的功能分支上并添加或修改文件。这样可以使得构建系统独立于 `workdir` 之外。

顶部的三个模块共同代表了容器化的构建系统。最左边的黄色模块代表最终用户与构建系统交互的脚本（`build.sh` 和 `shell.sh`）。

在中间的红色模块是 Dockerfile 和相关的脚本 `build_docker_image.sh`。开发运营者（在这个例子中指我）通常将执行这个脚本并生成容器镜像（事实上我多次执行它直到一切正常为止，但这是另一回事）。然后我将镜像分发给最终用户，例如通过<ruby>容器信任注册库<rt>container trusted registry</rt></ruby>进行分发。最终用户将需要这个镜像。另外，他们将克隆构建系统的存储库（即一个与[教程存储库][2]等效的存储库）。

当最终用户调用 `build.sh` 或者 `shell.sh` 时，容器内将执行右边的 `run_build.sh` 脚本。接下来我将详细解释这些脚本。这里的关键是最终用户不需要为了使用而去了解任何关于红色或者蓝色模块或者容器工作原理的知识。

### 构建系统细节

把教程存储库的文件结构映射到这个系统结构上。我曾将这个原型结构用于相对复杂构建系统，因此它的简单并不会造成任何限制。下面我列出存储库中相关文件的树结构。文件夹 `dockerize-tutorial` 能用构建系统的其他任何名称代替。在这个文件夹下，我用 `workdir` 的路径作参数调用 `build.sh` 或 `shell.sh`。

```
dockerize-tutorial/
├── build.sh
├── shell.sh
└── swbuilder
    ├── build_docker_image.sh
    ├── install_swbuilder.dockerfile
    └── scripts
        └── run_build.sh
```

请注意，我上面特意没列出 `example_workdir`，但你能在教程存储库中找到它。实际的源码通常存放在单独的存储库中，而不是构建工具库中的一部分；本教程为了不必处理两个存储库，所以我将它包含在这个存储库中。 

如果你只对概念感兴趣，本教程并非必须的，因为我将解释所有文件。但是如果你继续本教程（并且已经安装 Docker），首先使用以下命令来构建容器镜像 `swbuilder:v1`：

```
cd dockerize-tutorial/swbuilder/
./build_docker_image.sh
docker image ls  # resulting image will be swbuilder:v1
```

然后调用 `build.sh`：

```
cd dockerize-tutorial
./build.sh ~/repos/dockerize-tutorial/example_workdir
```

下面是 [build.sh][4] 的代码。这个脚本从容器镜像 `swbuilder:v1` 实例化一个容器。而这个容器实例映射了两个卷：一个将文件夹 `example_workdir` 挂载到容器内部路径 `/workdir` 上，第二个则将容器外的文件夹 `dockerize-tutorial/swbuilder/scripts` 挂载到容器内部路径 `/scripts` 上。

```
docker container run                              \
    --volume $(pwd)/swbuilder/scripts:/scripts    \
    --volume $1:/workdir                          \
    --user $(id -u ${USER}):$(id -g ${USER})      \
    --rm -it --name build_swbuilder swbuilder:v1  \
    build
```

另外，`build.sh` 还会用你的用户名（以及组，本教程假设两者一致）去运行容器，以便在访问构建输出时不出现文件权限问题。

请注意，[shell.sh][5] 和 `build.sh` 大体上是一致的，除了两点不同：`build.sh` 会创建一个名为 `build_swbuilder` 的容器，而 `shell.sh` 则会创建一个名为 `shell_swbuilder` 的容器。这样一来，当其中一个脚本运行时另一个脚本被调用也不会产生冲突。

两个脚本之间的另一处关键不同则在于最后一个参数：`build.sh` 传入参数 `build` 而 `shell.sh` 则传入 `shell`。如果你看了用于构建容器镜像的 [Dockerfile][6]，就会发现最后一行包含了下面的 `ENTRYPOINT` 语句。这意味着上面的 `docker container run` 调用将使用 `build` 或 `shell` 作为唯一的输入参数来执行 `run_build.sh` 脚本。

```
# run bash script and process the input command
ENTRYPOINT [ "/bin/bash", "/scripts/run_build.sh"]
```

[run_build.sh][7] 使用这个输入参数来选择启动 Bash shell 还是调用 `gcc` 来构建 `helloworld.c` 项目。一个真正的构建系统通常会使用 Makefile 而非直接运行 `gcc`。

```
cd /workdir

if [ $1 = "shell" ]; then    
    echo "Starting Bash Shell"
    /bin/bash
elif [ $1 = "build" ]; then
    echo "Performing SW Build"
    gcc helloworld.c -o helloworld -Wall
fi
```

在使用时，如果你需要传入多个参数，当然也是可以的。我处理过的构建系统，构建通常是对给定的项目调用 `make`。如果一个构建系统有非常复杂的构建调用，则你可以让 `run_build.sh` 调用 `workdir` 下最终用户编写的特定脚本。

### 关于 scripts 文件夹的说明

你可能想知道为什么 `scripts` 文件夹位于目录树深处而不是位于存储库的顶层。两种方法都是可行的，但我不想鼓励最终用户到处乱翻并修改里面的脚本。将它放到更深的地方是一个让他们更难乱翻的方法。另外，我也可以添加一个 `.dockerignore` 文件去忽略 `scripts` 文件夹，因为它不是容器必需的部分。但因为它很小，所以我没有这样做。

### 简单而灵活

尽管这一方法很简单，但我在几个相当不同的构建系统中使用过，发现它相当灵活。相对稳定的部分（例如，一年仅修改数次的给定工具集）被固定在容器镜像内。较为灵活的部分则以脚本的形式放在镜像外。这使我能够通过修改脚本并将更改推送到构建系统存储库中，轻松修改调用工具集的方式。用户所需要做的是将更改拉到本地的构建系统存储库中，这通常是非常快的（与更新 Docker 镜像不同）。这种结构使其能够拥有尽可能多的卷和脚本，同时使最终用户摆脱复杂性。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/how-containerize-build-system

作者：[Ravi Chandran][a]
选题：[lujun9972][b]
译者：[LazyWolfLin](https://github.com/LazyWolfLin)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ravichandran
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/containers_2015-3-osdc-lead.png?itok=O6aivM_W (Containers on a ship on the ocean)
[2]: https://github.com/ravi-chandran/dockerize-tutorial
[3]: https://opensource.com/sites/default/files/uploads/build_sys_arch.jpg (Container build system architecture)
[4]: https://github.com/ravi-chandran/dockerize-tutorial/blob/master/build.sh
[5]: https://github.com/ravi-chandran/dockerize-tutorial/blob/master/shell.sh
[6]: https://github.com/ravi-chandran/dockerize-tutorial/blob/master/swbuilder/install_swbuilder.dockerfile
[7]: https://github.com/ravi-chandran/dockerize-tutorial/blob/master/swbuilder/scripts/run_build.sh

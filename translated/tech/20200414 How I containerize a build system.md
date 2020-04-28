[#]: collector: (lujun9972)
[#]: translator: (LazyWolfLin)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How I containerize a build system)
[#]: via: (https://opensource.com/article/20/4/how-containerize-build-system)
[#]: author: (Ravi Chandran https://opensource.com/users/ravichandran)

构建系统容器化指南
======
搭建使用容器分发应用的可复用系统可能很复杂。这里有个好方法。
![Containers on a ship on the ocean][1]

一个构建系统由工具和过程组成，用于将源代码编译成可运行的应用。这个编译过程还涉及到代码的读者从软件开发者转换到最终用户，无论最终用户是运维的同事还是部署的同事。

在使用容器搭建了一些构建系统后，我觉得有一个不错的可复用的搭建方法值得分享。虽然这些构建系统被用于编译机器学习算法和为嵌入式硬件生成可加载的软件镜像，但这个方法足够抽象，可用于任何基于容器的构建系统。

这个方法关于通过易用和可维护的方式搭建或组织构建系统。并不涉及处理特定编译器或工具容器化的技巧。它适用于软件开发人员构建软件并将可维护镜像交给其他技术人员（无论是系统管理员，运维工程师或者其他头衔）的常见情况。由于构建系统的透明化，因此最终用户能够专注于软件。

### Why containerize a build system?

搭建基于容器的可复用构建系统可以为软件团队带来诸多好处：

  * **专注**：我希望专注于编写我的应用。当我调用一个名为“构建”的工具时，我希望这个工具集能提供一个随时可用的二进制文件。我不想浪费时间在构建系统的查错上。事实上，我宁愿不了解也不关心构建系统。
  * **一致的构建行为**：无论哪种使用情况下，我都想确保整个团队使用相同版本的工具集并在构建时获得相同的结果。否则，我就得不断地处理“我这咋就是好的”的情况。在团队项目中，使用相同版本的工具集并对给定的输入源文件集产生一致的输出是非常重要。
  * **易于部署和未来升级**：即使向每个人都提供一套详细说明来为项目安装工具集，也可能有人会翻车。问题可能是由于每个人对自己的 Linux 环境定制导致的。在团队中使用不同的 Linux 发行版（或者其他操作系统），情况还会变得更复杂。当需要将工具集升级到下一版本时，问题很快就会变得更糟糕。使用容器和本指南将使得新版本升级非常简单。

我在项目中容器化构建系统的经验显然很有价值，因为它可以缓解上述问题。我倾向于使用 Docker 作为容器工具，虽然在相对特殊的环境中安装和网络配置仍可能出现问题，尤其是当你在一个使用复杂代理的企业环境中工作时。但至少现在我需要解决的构建系统问题已经很少了。

### 漫步容器化的构建系统

我创建了一个[教程仓库][2]，随后你可以 clone 并检查它，或者按照本文内容进行操作。我将介绍代码库中的所有文件。这个构建系统非常简单（它使用**gcc**）从而可以专注于构建系统结构上。

### 构建系统需求

我认为构建系统中有两个关键点：

  * **标准化构建调用**：我希望能够指定一些形如 **/path/to/workdir** 的工作目录来构建代码。我希望以如下形式调用构建：

        ./build.sh /path/to/workdir

    为了使得示例的结构简单（以便说明），我将假定输出也在 **/path/to/workdir** 路径下的某处生成。（否则，将增加容器中显示的卷的数量，虽然这并不困难，但解释起来比较麻烦。）
  * **通过 shell 自定义构建调用**：有时，工具集会以出乎意料的方式被使用。除了标准的工具集调用 **build.sh** 之外，如果需要还可以添加一些作为 **build.sh** 的选项。但我一直希望能够有一个可以直接调用工具集命令的 shell。在这个简单的示例中，有时我想尝试不同的 **gcc** 优化选项并查看效果。为此，我希望调用：

        ./shell.sh /path/to/workdir

    这将让我能够进入容器内部的 Bash shell，并且可以调用工具集和访问我的**工作目录 workdir**，从而我可以根据需要尝试使用这个工具集。

### 构建系统架构

为了满足上述基本需求，这是我的构架系统架构：

![Container build system architecture][3]

在底部的**工作目录**代表软件开发者用于构建的任意软件源码。通常，这个**工作目录**是一个源码库。在构建之前，最终用户可以通过任何方式来操纵这个源码库。例如，如果他们使用 **git** 作为版本控制工具时，可以使用 **git checkout** 切换到他们正在工作的功能分支上并添加或修改文件。这样可以使得构建系统独立于**工作目录**之外。

顶部的三个模块共同代表了容器化的构建系统。最左边的黄色模块代表最终用户与构建系统交互的脚本（**build.sh** 和 **shell.sh**）。

在中间的红色模块是 Dockerfile 和相关的脚本 **build_docker_image.sh**。开发者（在这个例子中指我）通常将执行这个脚本并生成容器镜像（事实上我多次执行它直到一切正常为止，但这是另一个故事）。然后我将镜像分发给最终用户，例如通过 container trusted registry 进行分发。最终用户将需要这个镜像。另外，他们将 clone 构建系统仓库（即一个与[教程仓库][2]等效的仓库）。

当最终用户调用 **build.sh** 或者 **shell.sh** 时，容器内将执行右边的 **run_build.sh** 脚本。接下来我将详细解释这些脚本。这里的关键是最终用户不需要为了使用而去了解任何关于红色或者蓝色模块或者容器工作原理的知识。

### Build system details

The tutorial repository's file structure maps to this architecture. I've used this prototype structure for relatively complex build systems, so its simplicity is not a limitation in any way. Below, I've listed the tree structure of the relevant files from the repository. The **dockerize-tutorial** folder could be replaced with any other name corresponding to a build system. From within this folder, I invoke either **build.sh** or **shell.sh** with the one argument that is the path to the **workdir**.


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

Note that I've deliberately excluded the **example_workdir** above, which you'll find in the tutorial repository. Actual source code would typically reside in a separate repository and not be part of the build tool repository; I included it in this repository, so I didn't have to deal with two repositories in the tutorial.

Doing the tutorial is not necessary if you're only interested in the concepts, as I'll explain all the files. But if you want to follow along (and have Docker installed), first build the container image **swbuilder:v1** with:


```
cd dockerize-tutorial/swbuilder/
./build_docker_image.sh
docker image ls  # resulting image will be swbuilder:v1
```

Then invoke **build.sh** as:


```
cd dockerize-tutorial
./build.sh ~/repos/dockerize-tutorial/example_workdir
```

The code for [build.sh][4] is below. This script instantiates a container from the container image **swbuilder:v1**. It performs two volume mappings: one from the **example_workdir** folder to a volume inside the container at path **/workdir**, and the second from **dockerize-tutorial/swbuilder/scripts** outside the container to **/scripts** inside the container.


```
docker container run                              \
    --volume $(pwd)/swbuilder/scripts:/scripts    \
    --volume $1:/workdir                          \
    --user $(id -u ${USER}):$(id -g ${USER})      \
    --rm -it --name build_swbuilder swbuilder:v1  \
    build
```

In addition, the **build.sh** also invokes the container to run with your username (and group, which the tutorial assumes to be the same) so that you will not have issues with file permissions when accessing the generated build output.

Note that [**shell.sh**][5] is identical except for two things: **build.sh** creates a container named **build_swbuilder** while **shell.sh** creates one named **shell_swbuilder**. This is so that there are no conflicts if either script is invoked while the other one is running.

The other key difference between the two scripts is the last argument: **build.sh** passes in the argument **build** while **shell.sh** passes in the argument **shell**. If you look at the [Dockerfile][6] that is used to create the container image, the last line contains the following **ENTRYPOINT**. This means that the **docker container run** invocation above will result in executing the **run_build.sh** script with either **build** or **shell** as the sole input argument.


```
# run bash script and process the input command
ENTRYPOINT [ "/bin/bash", "/scripts/run_build.sh"]
```

[**run_build.sh**][7] uses this input argument to either start the Bash shell or invoke **gcc** to perform the build of the trivial **helloworld.c** project. A real build system would typically invoke a Makefile and not run **gcc** directly.


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

You could certainly pass more than one argument if your use case demands it. For the build systems I've dealt with, the build is usually for a given project with a specific **make** invocation. In the case of a build system where the build invocation is complex, you can have **run_build.sh** call a specific script inside **workdir** that the end user has to write.

### A note about the scripts folder

You may be wondering why the **scripts** folder is located deep in the tree structure rather than at the top level of the repository. Either approach would work, but I didn't want to encourage the end user to poke around and change things there. Placing it deeper is a way to make it more difficult to poke around. Also, I could have added a **.dockerignore** file to ignore the **scripts** folder, as it doesn't need to be part of the container context. But since it's tiny, I didn't bother.

### Simple yet flexible

While the approach is simple, I've used it for a few rather different build systems and found it to be quite flexible. The aspects that are going to be relatively stable (e.g., a given toolset that changes only a few times a year) are fixed inside the container image. The aspects that are more fluid are kept outside the container image as scripts. This allows me to easily modify how the toolset is invoked by updating the script and pushing the changes to the build system repository. All the user needs to do is to pull the changes to their local build system repository, which is typically quite fast (unlike updating a Docker image). The structure lends itself to having as many volumes and scripts as are needed while abstracting the complexity away from the end user.

How will you need to modify your application to optimize it for a containerized environment?

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/how-containerize-build-system

作者：[Ravi Chandran][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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

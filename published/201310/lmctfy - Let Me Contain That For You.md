lmctfy（Let Me Contain That For you）：让我用集装箱为你的程式打包
===========================================================

lmctfy (发音是lem-kut-fee)是谷歌[Google][1]开发的容器栈，可以为Linux应用提供容器（container）。这些容器可以让一台机器上的不同应用使用相互隔离的资源，以独占的方式运行在同一台机器上。这些应用也可以拥有容器，因此能够创建和管理属于他们自己的子容器。

这项项目旨在提供一组以用户的意图为原点的高级API，来实现对容器概念的抽象化。这些创建的容器自身也通过继承也可以拥有了自己的容器、也能够被其他的用户程序所管理。

Lmctfy是为某些特定的场景（配置环境）设计、实现的，所以可能不能在所有场景（配置环境）中正常运作。我们的目标是为更多的场景（配置环境）提供更多的支持，所以你可以为这项项目[贡献][2]你的补丁或是在[邮件列表][3]中发送邮件，这样我们可以朝着既定的[路线图][4]前进。

lmctfy 内包含一个C++库和一个CLI（命令行界面程序）

## 最新进展

lmctfy 还是一个在beta阶段的应用，目前仍在主要开发中。最新的版本是`0.1`。她目前只支持CPU和内存资源的隔离。点击查看我们的[路线图][4]来了解各部分的开发情况，点击查看[贡献][2]。

## 从此开始

这一节描述如何编译你的CLI，运行所有的UI测试，和初始化机器的细节。 [CLI][5]这节提供了一些CLI操作的例子，[C++ 库][6]描述了这个库的使用详情。

### 依赖

编译本程序需要使用make和g++4.7。 lmcfy使用了C++11，所以需要支持这项功能的编译器。我们在 **Ubuntu 12.04+** 上测试过编译。如果有为其他环境的编译提供支持的补丁，我们很高兴而且希望这越多越好。

lmctfy 依赖下列几个库，需要这些库存在于你的计算机系统里。

* [Protocol Buffers](https://code.google.com/p/protobuf/)
* [gflags](https://code.google.com/p/gflags/)
* [RE2](https://code.google.com/p/re2/)

### 编译CLI

编译`lmctfy`的CLI：

```bash
make -j <线程数> lmctfy
```
CLI程序会生成在 `bin/lmctfy/cli/lmctfy`

### 编译C++库

编译lmctfy的库：

```bash
make -j <线程数> liblmctfy.a
```
库文件会生成在 `bin/liblmctfy.a`.

### 运行测试

编译和运行所有的UI测试：

```bash
make -j <线程数> check
```

### 初始化

lmctfy已经在 **Ubuntu 12.04+** 上的 **3.3** 和 **3.8** 内核上测试过。 lmctfy在一台机器的所有容器都是运行它的时候运转得最好，所以不建议让她运行在[LXC][7]或者其他container系统上（尽管在某些特殊得配置下这能够跑起来）。

为了运行lmctfy，我们必须首先初始化计算机。这只需要运行一次就可以，而且一般是在计算机第一次启动时候就完成了。当cgroup的hierarchies已经挂载了，接下来通常一个空的配置会可以让lmctfy自动监测到目前的挂载。

```bash
lmctfy init ""
```

如果cgroup的hierarchies没有被挂载，那么必须指明这些资源，这样lmctfy才可以挂载他们。目前版本需要以下cgroup的hierarchies资源`cpu`，`cpuset`，`cpuacct`，`memory`和`freezer`。 `cpu`和`cpuacct` 是目前唯一可以被共享挂载的，其他的必须被单独地挂载。具体配置说明可以查看[lmctfy.proto][8]中的`InitSpec`节。以下的例子是一个挂载了`/dev/cgroup`中的所有hierarachies的配置文件：


```bash
lmctfy init "
  cgroup_mount:{
	mount_path:'/dev/cgroup/cpu'
	hierarchy:CGROUP_CPU hierarchy:CGROUP_CPUACCT
  }
  cgroup_mount:{
	mount_path:'/dev/cgroup/cpuset' hierarchy:CGROUP_CPUSET
  }
  cgroup_mount:{
	mount_path:'/dev/cgroup/freezer' hierarchy:CGROUP_FREEZER
  }
  cgroup_mount:{
	mount_path:'/dev/cgroup/memory' hierarchy:CGROUP_MEMORY
  }"
```

这样，机器就可以被`lmctfy`使用、进行容器的操作。

## 容器的命名

容器的命名系统简化了文件系统的路径，因为以后只需要一系列容器的继承（容器的容器、子容器、子子容器）就可以了♪───Ｏ（≧∇≦）Ｏ──── ♪。

容器名称允许的字符集：

* 英文字母＋阿拉伯数字 (`[a-zA-Z0-9]+`)
* 下划线 (`_`)
* 横县 (`-`)
* 英文句号 (`.`)

绝对路径是从容器（比如是`/sys/subcont`）的根目录(`/`)开始计算的。容器的名字也可以是相对的（比如`subcont`）。一般地（除非特殊情况说明），都是沿用一般的文件路径方式。

### 例子

```
	/ 			: 容器的根目录
	/sys 		: "sys" 容器
	/sys/sub	: "sub" 容器，"sys"容器的子容器
	. 			: 当前的容器
	./ 			: 当前的容器
	.. 			: 当前的容器的父容器
	sub 		: 当前的容器的"sub" 子容器
	./sub 		: 当前的容器的"sub" 子容器
	/sub 		: "sub" 容器
	../sibling	: 当前的父容器的“sibling”子容器
```


## CLI

### 创建

创建一个容器：

```bash
lmctfy create <名称> <参数>
```

更完整的细节参见[lmctfy.proto](/include/lmctfy.proto)

例子(创建一个内存限制在100MB的容器)：

```bash
lmctfy create memory_only "memory:{limit:100000000}"
```

### 销毁

销毁一个容器：

```bash
lmctfy destroy <名称>
```

### 列表

从根目录递归显示当前机器的所有容器：

```bash
lmctfy list containers -r /
```

你也可以只列出当前的子容器：

```bash
lmctfy list containers
```

### 运行

在一台容器中运行命令：

```bash
lmctfy run <名称> <命令行>
```

例子：

```bash
lmctfy run test "echo hello world"
lmctfy run /test/sub bash
lmctfy run -n /test "echo hello from a daemon"
```

### 其他

键入`lmctfy help`查看全部的命令和文档

## C++ Library

此库包含了`::containers::lmctfy::ContainerApi` 用来创建、获取、销毁、监测`::containers::lmctfy::Container`类型的对象，并且被独立的容器相互交流。具体的lmctfy C++库的文档可以查看头文件[lmctfy.h][9]（你是认真的吗(￣▽￣)）。

## 路线图

lmctfy项目通过两个层（CL1、CL2）来实现一个容器栈。CL1围绕着驱动进程，并执行CL2制定的容器策略。CL1会为更高层创建和维护容器的抽象。她应当是唯一直接和内核交流以维护容器的层。 CL2发展和设定容器策略，她使用CL1来执行策略和操控容器。比如，CL2（后台进程）实现了一个策略：所有容器的CPU和内存使用总和不可以超过现提供的CPU和内存资源（以防止对内存资源的过度使用）。为了执行这条策略，她（CL2）会使用CL1（library／CLI）来创建带这条内存限制规则的容器。另一条对应的策略可能包括了允许过度使用X％的机器资源或者对不同资源的多重层次控制。

lmcfty项目现在提供了CL1组件，CL2还没有实现。

### CL1

现在只提供高性能CPU和内存隔离。在我们的路线图中我们还需要实现以下几项：

* *磁盘IO隔离:* 这部分几乎完成了，但是我们还缺少控制器和资源处理器。
* *网络隔离:* 这部分和cgroup实现还在计划中。
* *命名空间支援:* 给所有命名空间支援并且整合到相关的资源中。
* *根文件系统支援:* 识别并建立根文件系统。
* *磁盘镜像:* 可以导入和导出容器的根文件系统的镜像。
* *支持暂停／继续:* 使用继承的freezer。
* *还原点恢复:* 可以建立还原点并恢复到不同机器的容器中。

### CL2

最基础的CL2 应当有一个容器策略来保证在机器不允许超载运行情况下的资源合理分配。我们的目标是CL2最终实现提供不同层次的服务。在这个框架下一些层次可以比其他的获得更多好的服务。

* 监控和统计支持。
* 管理功能和功能检查。
* 服务的质量保证和执行。

## 内核支持

lmctfy 最初的设计和实现是在一个自定义的内核上（一个原生linux内核外加一些列自选的补丁）上。由此，一些特性在这些内核补丁上跑得最理想。但是lmctfy应该在没有他们得情况下正常运行。她应当监测可用得内核支援并且与之适应。我们已经在原生的 **Ubuntu** 的 **3.3** 和 **3.8** 系列内核上测试过。如果你发现在其他版本内核下的问题，请汇报。

一些相关的内核补丁：

* *CPU 延时:* 这个补丁为cpu hierarchy增加了`cpu.lat`的cgroup 文件。她限制了cgroup能预测的CPU唤醒延时时间。
* *CPU 柱状图统计:* 这个补丁为cpuacct hierarchy增加了`cpuacct.histogram` cgroup 文件。她为CPU计划行为提供了多种柱状图方案。
* *OOM 管理:* 一系列的补丁，用于在内存用尽的情况下执行优先权。

## 贡献

对项目感到兴趣了？看看我们的[路线图][4]，看你是不是由很多想贡献的方向呢？ [从此开始][10]，你应该可以运行我们的程序。如果无法运行，请让我们知道，这样我们可以改进这份指南。

## 邮件列表

本项目的邮件列表是<lmctfy@googlegroups.com>。本邮件列表用来发布、讨论、一般性支持。

---

原文: https://github.com/google/lmctfy/

本文由[LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[Chilledheart][] 校对：[wxy][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[Chilledheart]:http://linux.cn/space/Chilledheart
[wxy]:http://linux.cn/space/wxy

[1]:http://www.google.com
[2]:#contributing
[3]:#mailing-list
[4]:#roadmap
[5]:#cli-commands
[6]:#c-library
[7]:http://lxc.sourceforge.net/
[8]:https://github.com/google/lmctfy/blob/master/include/lmctfy.proto
[9]:https://github.com/google/lmctfy/blob/master/include/lmctfy.h
[10]:#getting-started
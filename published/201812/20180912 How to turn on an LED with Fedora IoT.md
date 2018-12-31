如何使用 Fedora IoT 点亮 LED 灯
======

![](https://fedoramagazine.org/wp-content/uploads/2018/08/LED-IoT-816x345.jpg)

如果你喜欢 Fedora、容器，而且有一块树莓派，那么这三者结合操控 LED 会怎么样？本文介绍的是 Fedora IoT，将展示如何在树莓派上安装预览镜像。还将学习如何与 GPIO 交互以点亮 LED。

### 什么是 Fedora IoT?

Fedora IoT 是当前 Fedora 项目的目标之一，计划成为一个完整的 Fedora 版本。Fedora IoT 将是一个在 ARM（目前仅限 aarch64）设备上（例如树莓派），以及 x86_64 架构上运行的系统。

![][1]

Fedora IoT 基于 OSTree 开发，就像 [Fedora Silverblue][2] 和以往的 [Atomic Host][3]。

### 下载和安装 Fedora IoT

官方 Fedora IoT 镜像将和 Fedora 29 一起发布。但是在此期间你可以下载 [基于 Fedora 28 的镜像][4] 来进行这个实验。（LCTT 译注：截止至本译文发布，[Fedora 29 已经发布了][11]，但是 IoT 版本并未随同发布，或许会在 Fedora 30 一同发布？）

你有两种方法来安装这个系统：要么使用 `dd` 命令烧录 SD 卡，或者使用 `fedora-arm-installer` 工具。Fedora 的 Wiki 里面提供了为 IoT [设置物理设备][5] 的更多信息。另外，你可能需要调整第三个分区的大小。

把 SD 卡插入到设备后，你需要创建一个用户来完成安装。这个步骤需要串行连接或一个 HDMI 显示器和键盘来与设备进行交互。

当系统安装完成后，下一步就是要设置网络连接。使用你刚才创建的用户登录系统，可以使用下列方式之一完成网络连接设置：

* 如果你需要手动配置你的网络，可能需要执行类似如下命令，需要保证设置正确的网络地址：

    ```
    $ nmcli connection add con-name cable ipv4.addresses \
    192.168.0.10/24 ipv4.gateway 192.168.0.1 \
    connection.autoconnect true ipv4.dns "8.8.8.8,1.1.1.1" \
    type ethernet ifname eth0 ipv4.method manual
```

* 如果你网络上运行着 DHCP 服务，可能需要类似如下命令：

    ```
    $ nmcli con add type ethernet con-name cable ifname eth0
```

### Fedora 中的 GPIO 接口

许多关于 Linux 上 GPIO 的教程都关注传统的 GPIO sysfis 接口。这个接口已经不推荐使用了，并且上游 Linux 内核社区由于安全和其他问题的缘故打算完全删除它。

Fedora 已经不将这个传统的接口编译到内核了，因此在系统上没有 `/sys/class/gpio` 这个文件。此教程使用一个上游内核提供的一个新的字符设备 `/dev/gpiochipN` 。这是目前和 GPIO 交互的方式。

为了和这个新设备进行交互，你需要使用一个库和一系列命令行界面的工具。常用的命令行工具比如说 `echo` 和 `cat` 在此设备上无法正常工作。

你可以通过安装 libgpiod-utils 包来安装命令行界面工具。python3-libgpiod 包提供了相应的 Python 库。

### 使用 Podman 来创建一个容器

[Podman][6] 是一个容器运行环境，其命令行界面类似于 Docker。Podman 的一大优势是它不会在后台运行任何守护进程。这对于资源有限的设备尤其有用。Podman 还允许您使用 systemd 单元文件启动容器化服务。此外，它还有许多其他功能。

我们使用如下两步来创建一个容器：

1. 创建包含所需包的分层镜像。
2. 使用分层镜像创建一个新容器。

首先创建一个 Dockerfile 文件，内容如下。这些内容告诉 Podman 基于可使用的最新 Fedora 镜像来构建我们的分层镜像。然后就是更新系统和安装一些软件包：

```
FROM fedora:latest
RUN  dnf -y update
RUN  dnf -y install libgpiod-utils python3-libgpiod
```

这样你就完成了镜像的生成前的配置工作，这个镜像基于最新的 Fedora，而且包含了和 GPIO 交互的软件包。

现在你就可以运行如下命令来构建你的基本镜像了：

```
$ sudo podman build --tag fedora:gpiobase -f ./Dockerfile
```

你已经成功创建了你的自定义镜像。这样以后你就可以不用每次都重新搭建环境了，而是基于你创建的镜像来完成工作。

### 使用 Podman 完成工作

为了确认当前的镜像是否就绪，可以运行如下命令：

```
$ sudo podman images
REPOSITORY                 TAG        IMAGE ID       CREATED          SIZE
localhost/fedora           gpiobase   67a2b2b93b4b   10 minutes ago  488MB
docker.io/library/fedora   latest     c18042d7fac6   2 days ago     300MB
```

现在，启动容器并进行一些实际的实验。容器通常是隔离的，无法访问主机系统，包括 GPIO 接口。因此需要在启动容器时将其挂载在容器内。可以使用以下命令中的 `-device` 选项来解决：

```
$ sudo podman run -it --name gpioexperiment --device=/dev/gpiochip0 localhost/fedora:gpiobase /bin/bash
```

运行之后就进入了正在运行的容器中。在继续之前，这里有一些容器命令。输入 `exit` 或者按下 `Ctrl+D` 来退出容器。

显示所有存在的容器可以运行如下命令，这包括当前没有运行的，比如你刚刚创建的那个：

```
$ sudo podman container ls -a
CONTAINER ID   IMAGE             COMMAND     CREATED          STATUS                              PORTS   NAMES
64e661d5d4e8   localhost/fedora:gpiobase   /bin/bash 37 seconds ago Exited (0) Less than a second ago           gpioexperiment
```

使用如下命令创建一个新的容器：

```
$ sudo podman run -it --name newexperiment --device=/dev/gpiochip0 localhost/fedora:gpiobase /bin/bash

```

如果想删除容器可以使用如下命令：

```
$ sudo podman rm newexperiment

```

### 点亮 LED 灯

现在可以使用已创建的容器。如果已经从容器退出，请使用以下命令再次启动它：

```
$ sudo podman start -ia gpioexperiment
```

如前所述，可以使用 Fedora 中 libgpiod-utils 包提供的命令行工具。要列出可用的 GPIO 芯片可以使用如下命令：

```
$ gpiodetect
gpiochip0 [pinctrl-bcm2835] (54 lines)
```

要获取特定芯片的连线列表，请运行：

```
$ gpioinfo gpiochip0
```

请注意，物理引脚数与前一个命令所打印的连线数之间没有相关性。重要的是 BCM 编号，如 [pinout.xyz][7] 所示。建议不要使用没有相应 BCM 编号的连线。

现在，将 LED 连接到物理引脚 40，也就是 BCM 21。请记住：LED 的短腿（负极，称为阴极）必须连接到带有 330 欧姆电阻的树莓派的 GND 引脚， 并且长腿（阳极）到物理引脚 40。

运行以下命令点亮 LED，按下 `Ctrl + C` 关闭：

```
$ gpioset --mode=wait gpiochip0 21=1
```

要点亮一段时间，请添加 `-b`（在后台运行）和 `-s NUM`（多少秒）参数，如下所示。 例如，要点亮 LED 5 秒钟，运行如下命令：

```
$ gpioset -b -s 5 --mode=time gpiochip0 21=1
```

另一个有用的命令是 `gpioget`。 它可以获得引脚的状态（高或低），可用于检测按钮和开关。

![Closeup of LED connection with GPIO][8]

### 总结

你也可以使用 Python 操控 LED —— [这里有一些例子][9]。 也可以在容器内使用 i2c 设备。 此外，Podman 与此 Fedora 版本并不严格相关。你可以在任何现有的 Fedora 版本上安装它，或者在 Fedora 中使用两个基于 OSTree 的新系统进行尝试：[Fedora Silverblue][2] 和 [Fedora CoreOS][10]。

------

via: https://fedoramagazine.org/turnon-led-fedora-iot/

作者：[Alessio Ciregia][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[ScarboroughCoral](https://github.com/ScarboroughCoral)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://alciregi.id.fedoraproject.org/
[1]: https://fedoramagazine.org/wp-content/uploads/2018/08/oled-1024x768.png
[2]: https://teamsilverblue.org/
[3]: https://www.projectatomic.io/
[4]: https://kojipkgs.fedoraproject.org/compose/iot/latest-Fedora-IoT-28/compose/IoT/
[5]: https://fedoraproject.org/wiki/InternetOfThings/GettingStarted#Setting_up_a_Physical_Device
[6]: https://github.com/containers/libpod
[7]: https://pinout.xyz/
[8]: https://fedoramagazine.org/wp-content/uploads/2018/08/breadboard-1024x768.png
[9]: https://github.com/brgl/libgpiod/tree/master/bindings/python/examples
[10]: https://coreos.fedoraproject.org/
[11]: https://fedoramagazine.org/announcing-fedora-29/

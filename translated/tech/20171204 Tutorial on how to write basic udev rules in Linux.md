#教程：在 Linux 中如何写一个基本的 udev 规则

### 目录

*   *   [1. 读者对象][4]

    *   [2. 要求][5]

    *   [3. 难度][6]

    *   [4. 约定][7]

    *   [5. 介绍][8]

    *   [6. 规则如何组织][9]

    *   [7. 规则语法][10]

    *   [8. 一个测试案例][11]

    *   [9. 操作符][12]
        *   *   [9.1.1. == 和 != 操作][1]

            *   [9.1.2. 分配操作符 = 和 :=][2]

            *   [9.1.3. += 和 -= 操作符][3]

    *   [10. 我们使用的键][13]

### 读者对象 

理解 udev 背后的基本概念，学习如何写简单的规则。

### 要求

*   Root 权限

### 难度

中等

### 约定 

*   **#** - 要求给定的命令使用 root 权限或者直接以一个 root 用户或者使用 `sudo` 命令去运行。

*   **$** - 要求给定的命令以一个普通的非特权用户运行。

### 介绍

在一个 GNU/Linux 系统中，虽然设备的低级别支持是在内核级中处理的，但是，它们相关的事件的管理是在用户空间中通过 `udev` 来管理的。确切地说是由 `udevd` 守护进程来完成的。学习如何去写一个规则，并应用到发生的这些事件上，将有助于我们修改系统的行为并使它适合我们的需要。

### 规则如何组织

Udev 规则是定义在一个以 `.rules` 为扩展名的文件中。那些文件主要放在两个位置：`/usr/lib/udev/rules.d`，这个目录用于存放系统安装的规则，`/etc/udev/rules.d/` 这个目录是保留给自定义规则的。

定义那些规则的文件的命名惯例是使用一个数字作为前缀（比如，`50-udev-default.rules`）并且以它们在目录中的词汇顺序进行处理的。在 `/etc/udev/rules.d` 中安装的文件，会覆盖安装在系统默认路径中的同名文件。

### 规则语法

如果你理解了 udev 规则的行为逻辑，它的语法并不复杂。一个规则由两个主要的节构成：“match” 部分，它使用一系列用逗号分隔的键定义了规则应用的条件，而 “action” 部分，是当条件满足时，我们执行一些动作。

### 一个测试案例

讲解可能的选项的最好方法莫过于配置一个真实的案例，因此，我们去定义一个规则作为演示，当鼠标被连接时禁用触摸板。显然，在规则定义中提供的属性将反映我的硬件。

我们将在 `/etc/udev/rules.d/99-togglemouse.rules` 文件中用我们喜欢的文本编辑器来写我们的规则。一个规则定义允许跨多个行，但是，如果是这种情况，必须在一个新行字符之前使用一个反斜线（\）表示这是上一行的后续部分，就和 shell 脚本一样，这是我们的规则：
```
ACTION=="add" \
, ATTRS{idProduct}=="c52f" \
, ATTRS{idVendor}=="046d" \
, ENV{DISPLAY}=":0" \
, ENV{XAUTHORITY}="/run/user/1000/gdm/Xauthority" \
, RUN+="/usr/bin/xinput --disable 16"
```
我们来分析一下这个规则。

### 操作符

首先，对已经使用以及将要使用的操作符解释如下：

#### == 和 != 操作符

`==` 是相等操作符，而 `!=` 是不等于操作符。通过使用它们，我们可以确认规则上应用的键是否匹配各自的值。

#### 分配操作符 = 和 :=

`=` 分配操作符，是用于为一个键分配一个值。当我们去分配一个值，并且想确保它不会被其它规则所覆盖，我们就需要使用 `:=` 操作符来代替，使用这个操作符分配的值，它确实不能被改变。

#### += 和 -= 操作符

`+=` 和 `-=` 操作符各自用于从一个指定的键中定义的值列表中增加或者移除一个值。

### 我们使用的键

现在，来分析一下在这个规则中我们使用的键。首先，我们有一个 `ACTION` 键：通过使用它，当在一个设备上发生了特定的事件，我们将指定我们要应用的规则的具体内容。有效的值有 `add`、`remove ` 以及 `change`。 

然后，我们使用 `ATTRS` 关键字去指定一个属性去匹配。我们可以使用 `udevadm info` 命令去列出一个设备属性，提供它的名字或者 `sysfs` 路径：
```
udevadm info -ap /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.1/0003:046D:C52F.0010/input/input39

Udevadm info starts with the device specified by the devpath and then
walks up the chain of parent devices. It prints for every device
found, all possible attributes in the udev rules key format.
A rule to match, can be composed by the attributes of the device
and the attributes from one single parent device.

  looking at device '/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.1/0003:046D:C52F.0010/input/input39':
    KERNEL=="input39"
    SUBSYSTEM=="input"
    DRIVER==""
    ATTR{name}=="Logitech USB Receiver"
    ATTR{phys}=="usb-0000:00:1d.0-1.2/input1"
    ATTR{properties}=="0"
    ATTR{uniq}==""

  looking at parent device '/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.1/0003:046D:C52F.0010':
    KERNELS=="0003:046D:C52F.0010"
    SUBSYSTEMS=="hid"
    DRIVERS=="hid-generic"
    ATTRS{country}=="00"

  looking at parent device '/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.1':
    KERNELS=="2-1.2:1.1"
    SUBSYSTEMS=="usb"
    DRIVERS=="usbhid"
    ATTRS{authorized}=="1"
    ATTRS{bAlternateSetting}==" 0"
    ATTRS{bInterfaceClass}=="03"
    ATTRS{bInterfaceNumber}=="01"
    ATTRS{bInterfaceProtocol}=="00"
    ATTRS{bInterfaceSubClass}=="00"
    ATTRS{bNumEndpoints}=="01"
    ATTRS{supports_autosuspend}=="1"

  looking at parent device '/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2':
    KERNELS=="2-1.2"
    SUBSYSTEMS=="usb"
    DRIVERS=="usb"
    ATTRS{authorized}=="1"
    ATTRS{avoid_reset_quirk}=="0"
    ATTRS{bConfigurationValue}=="1"
    ATTRS{bDeviceClass}=="00"
    ATTRS{bDeviceProtocol}=="00"
    ATTRS{bDeviceSubClass}=="00"
    ATTRS{bMaxPacketSize0}=="8"
    ATTRS{bMaxPower}=="98mA"
    ATTRS{bNumConfigurations}=="1"
    ATTRS{bNumInterfaces}==" 2"
    ATTRS{bcdDevice}=="3000"
    ATTRS{bmAttributes}=="a0"
    ATTRS{busnum}=="2"
    ATTRS{configuration}=="RQR30.00_B0009"
    ATTRS{devnum}=="12"
    ATTRS{devpath}=="1.2"
    ATTRS{idProduct}=="c52f"
    ATTRS{idVendor}=="046d"
    ATTRS{ltm_capable}=="no"
    ATTRS{manufacturer}=="Logitech"
    ATTRS{maxchild}=="0"
    ATTRS{product}=="USB Receiver"
    ATTRS{quirks}=="0x0"
    ATTRS{removable}=="removable"
    ATTRS{speed}=="12"
    ATTRS{urbnum}=="1401"
    ATTRS{version}==" 2.00"

    [...]
```
上面截取了运行这个命令之后的输出的一部分。正如你从它的输出中看到的那样，`udevadm` 从我们提供的指定路径开始，并且提供了所有父级设备的信息。注意设备的属性都是以单数的形式报告的（比如，`KERNEL`），而它的父级是以复数形式出现的（比如，`KERNELS`）。父级信息可以做为规则的一部分，但是同一时间只能有一个父级可以被引用：不同父级设备的属性混合在一起是不能工作的。在上面我们定义的规则中，我们使用了一个父级设备属性：`idProduct` 和 `idVendor`。 

在我们的规则中接下来做的事情是，去使用 `ENV` 关键字：它既可以用于设置也可以用于去匹配环境变量。我们给 `DISPLAY` 和 `XAUTHORITY` 分配值。当我们使用 X server 程序进行交互时，这些变量是非常必要的，去设置一些需要的信息：使用 `DISPLAY` 变量，我们指定服务器运行的机器是哪个，显示什么，引用的屏幕是什么，使用 `XAUTHORITY` 它提供一个到文件的路径，它包含了 Xorg 认证和授权信息。这个文件一般位于用于的 "home" 目录中。 

最后，我们使用了 `RUN` 字：它用于去运行外部程序。非常重要：这里没有立即运行，但是一旦所有的规则被解析，将运行各种动作。在这个案例中，我们使用 `xinput` 实用程序去改变触摸板的状态。我不想增解释这里的 `xinput` 的语法，它超出了本文的范围，只需要注意这个触摸板的 ID 是 `16`。 

规则设置完成之后，我们可以通过使用 `udevadm test` 命令去调试它。这个命令对调试非常有用，它并不真实去运行 `RUN` 指定的命令：
```
$ udevadm test --action="add" /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.1/0003:046D:C52F.0010/input/input39
```
我们提供给命令的是使用 `--action` 选项，以及设备的 sysfs 路径的模拟动作。如果没有报告错误，说明我们的规则运行的很好。在真实的环境中去使用它，我们需要重新加载规则：
```
# udevadm control --reload
```
这个命令将重新加载规则文件，但是，它只对重新加载之后发生的事件有效果。

我们通过创建一个 udev 规则了解了基本的概念和逻辑，这只是 udev 规则中众多的选项和可能的设置中的一小部分。udev 手册页提供了一个详尽的列表：如果你想深入了解，请参考它。

--------------------------------------------------------------------------------

via: https://linuxconfig.org/tutorial-on-how-to-write-basic-udev-rules-in-linux

作者：[Egidio Docile ][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://disqus.com/by/egidiodocile/
[1]:https://linuxconfig.org/tutorial-on-how-to-write-basic-udev-rules-in-linux#h9-1-1-and-operators
[2]:https://linuxconfig.org/tutorial-on-how-to-write-basic-udev-rules-in-linux#h9-1-2-the-assignment-operators-and
[3]:https://linuxconfig.org/tutorial-on-how-to-write-basic-udev-rules-in-linux#h9-1-3-the-and-operators
[4]:https://linuxconfig.org/tutorial-on-how-to-write-basic-udev-rules-in-linux#h1-objective
[5]:https://linuxconfig.org/tutorial-on-how-to-write-basic-udev-rules-in-linux#h2-requirements
[6]:https://linuxconfig.org/tutorial-on-how-to-write-basic-udev-rules-in-linux#h3-difficulty
[7]:https://linuxconfig.org/tutorial-on-how-to-write-basic-udev-rules-in-linux#h4-conventions
[8]:https://linuxconfig.org/tutorial-on-how-to-write-basic-udev-rules-in-linux#h5-introduction
[9]:https://linuxconfig.org/tutorial-on-how-to-write-basic-udev-rules-in-linux#h6-how-rules-are-organized
[10]:https://linuxconfig.org/tutorial-on-how-to-write-basic-udev-rules-in-linux#h7-the-rules-syntax
[11]:https://linuxconfig.org/tutorial-on-how-to-write-basic-udev-rules-in-linux#h8-a-test-case
[12]:https://linuxconfig.org/tutorial-on-how-to-write-basic-udev-rules-in-linux#h9-operators
[13]:https://linuxconfig.org/tutorial-on-how-to-write-basic-udev-rules-in-linux#h10-the-keys-we-used

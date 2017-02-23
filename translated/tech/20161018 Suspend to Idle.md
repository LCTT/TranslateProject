
# Suspend to Idle

### 简介

Linux内核提供了多种睡眠状态，各个状态通过设置系统中的不同部件进入低耗电模式来节约能源。目前总共有四种状态，分别是：suspend to idle，power-on standby，suspend to ram和suspend to disk。这些状态分别对应ACPI的4种状态：S0,S1，S3和S4。suspend to idle是纯软件实现的，主要用于尽量保持CPU处于睡眠状态。powder-on standby则使设备处于低耗电状态，并且停止non-boot CPU运行。suspend to ram则会更进一步处理关闭部件节约能源，包括停止CPU运行，只保持内存自刷新工作，保证内存中的内容仍然存在。suspend to disk则是尽最大努力关闭部件进行节能，包括关闭内存。然后内存中的内容会被写到硬盘，待唤醒计算机的时候将硬盘中的内容重新恢复到内存中。

这篇博文主要介绍挂起suspend to idle的实现。如上所说，suspend to idle主要通过软件实现。一般平台的挂起过程包括冻结用户空间并将外围设备调至低耗电模式。但是系统并不是直接关闭和拔掉运行中的cpu，而是静静地强制将CPU进入休眠状态。随着外围设备进入了低耗电模式，除了唤醒相关的中断外不会有其他中断产生。唤醒中断包括那些设置用于唤醒系统的计时器（比如RTC，普通计时器等）、或者电源开关、USB和其它外围设备。

在冻结过程中，当系统进入休眠状态时会调用一个特殊的cpu休眠函数。这个enter_freeze()函数可以简单得和调用cpu进入休眠的enter()函数相同，也可以更复杂。复杂的程度由将SoCs置为低耗电模式的条件和方法决定。

### 先决条件

### 平台挂起条件

一般情况，为了支持S2I，系统必须实现platform_suspend_ops并提供最低限度的挂起支持。这意味着至少要实现platform_suspend_ops中的所有必要函数的功能。如果suspend to idle 和suspend to ram都支持，那么至少要实现suspend_valid_only_men。

最近，内核开始支持支持S2I。Sudeep Holla表示无须满足platform_suspend_ops条件也会支持S2I。这个分支已经被接收并将在4.9版本被合并，该分支的路径在[https://lkml.org/lkml/2016/8/19/474][1]

如果定义了suspend_ops。那么可以通过查看/sys/power/state文件得知系统具体支持哪些挂起状态。如下操作：

```
# cat /sys/power/state
```

freeze mem_

这个示例的结果显示该平台支持S0（suspend to idle）和S3（suspend to ram）。随着Sudeep's的发展，只有那些没有实现platform_suspend_ops的平台才会显示freeze的结果。

### 唤醒中断

一旦系统处于某种睡眠状态，系统必须要接收某个唤醒事件才能恢复系统。这些唤醒事件一般由系统的设备产生。因此确保这些设备的驱动实现了唤醒中断，并且在接收这些中断的基础上产生了唤醒事件。如果唤醒设备没有正确配置，那么系统收到中断后只能继续保持睡眠状态而不会恢复。

一旦设备正确实现了唤醒接口的调用，那么该设备就能产生唤醒事件。确保DT正确配置了唤醒源。下面是一个示例唤醒源配置，该文件来自（arch/arm/boot/dst/am335x-evm.dts）:

```
    gpio_keys: volume_keys@0 {__
               compatible = “gpio-keys”;
               #address-cells = <1>;
               #size-cells = <0>;
               autorepeat;

               switch@9 {
                       label = “volume-up”;
                       linux,code = <115>;
                       gpios = <&gpio0 2 GPIO_ACTIVE_LOW>;
                       wakeup-source;
               };

               switch@10 {
                       label = “volume-down”;
                       linux,code = <114>;
                       gpios = <&gpio0 3 GPIO_ACTIVE_LOW>;
                       wakeup-source;
               };
       };
```
如上所示，有两个gpio键被配置为了唤醒源，在系统挂起期间按下其中任何一个键都会产生一个唤醒事件。

相对与DT文件配置的另一个唤醒源配置就是设备驱动配置自身，如果设备驱动在代码里面配置了唤醒支持，那么就会使用该默认唤醒配置。

### 补充

### freeze功能

如果系统希望能够充分使用suspend to idle，那么应该在cpu空闲驱动代码中定义enter_freeze()函数。enter_freeze()与enter()的使用方式完全不同，因此不能给enter和enter_freeze实现相同的enter()功能。如果没有定义enter_freeze()，虽然系统会挂起，但是不会触发那些只有当enter_freeze()定义了才会触发的函数，比如tick_freeze()和stop_critical_timing()都不会发生。虽然这也会导致中断唤醒系统，但不会导致系统恢复，系统处理完中断后会继续睡眠。在该最低限度情况下，系统会直接调用enter()。

在挂起过程中，越少中断产生越好（最好一个也没有）。

下图显示了能耗和时间的对比。图中的两个尖刺分别是挂起和恢复阶段。挂起前后的能耗尖刺是系统退出空闲态正在进行的记录操作，进程调度，计时器处理等。由于潜在的原因系统进入更深层次休眠状态进行的默认操作需要花很多时间。

 ![blog-picture-one](http://www.linaro.org/wp-content/uploads/2016/10/blog-picture-one-1024x767.png) 
Power Usage Time Progression

下面的跟踪时序图显示了4核CPU在系统挂起和恢复操作这段时间内的活动。如图所示，在挂起这段时间没有请求或者中断被处理。

 ![blog-picture-2](http://www.linaro.org/wp-content/uploads/2016/10/blog-picture-2-1024x577.png) 

Ftrace capture of Suspend/Resume

### 空闲状态

你必须确定哪个空闲状态支持冻结，在冻结期间，电源相关代码会决定用哪个空闲状态来实现冻结。这个过程是通过在每个空闲状态中查找谁定义了enter_freeze()来决定的。cpu空闲驱动代码或者SoC挂起相关代码必须实现冻结相关操作，并通过指定冻结功能给所有CPU的可应用空闲状态进行配置。

比如Qualcomm会在平台的挂起功能中的初始化代码处定义enter_freeze函数。这个工作是在cpu空闲驱动已经初始化并且所有数据结构已经定义就位的情况下进行的。

### 挂起/恢复相关驱动支持

你可能会在第一次成功挂起操作后碰到驱动相关的bug。很多驱动开发者没有精力完全测试挂起和恢复相关的代码。由于用户空间已经被冻结，唤醒设备此时已经处于休眠状态并且pm_runtime已经被禁止。你可能会发现挂起操作并没有多少工作可做，因为pm_runtime已经做好了挂起相关的准备。

### 测试相关

测试suspend to idle可以手动进行，也可以用（脚本或程序）自动挂起，使用自动睡眠或者Android中的wakelock来让系统挂起。如果手动测试，下面的操作会直接将系统冻结。

```
/ # echo freeze > /sys/power/state
[  142.580832] PM: Syncing filesystems … done.
[  142.583977] Freezing user space processes … (elapsed 0.001 seconds) done.
[  142.591164] Double checking all user space processes after OOM killer disable… (elapsed 0.000 seconds)
[  142.600444] Freezing remaining freezable tasks … (elapsed 0.001 seconds) done._
_[  142.608073] Suspending console(s) (use no_console_suspend to debug)
[  142.708787] mmc1: Reset 0x1 never completed.
[  142.710608] msm_otg 78d9000.phy: USB in low power mode
[  142.711379] PM: suspend of devices complete after 102.883 msecs
[  142.712162] PM: late suspend of devices complete after 0.773 msecs
[  142.712607] PM: noirq suspend of devices complete after 0.438 msecs
< system suspended >
….
< wake irq triggered >
[  147.700522] PM: noirq resume of devices complete after 0.216 msecs
[  147.701004] PM: early resume of devices complete after 0.353 msecs
[  147.701636] msm_otg 78d9000.phy: USB exited from low power mode
[  147.704492] PM: resume of devices complete after 3.479 msecs
[  147.835599] Restarting tasks … done.
/ #
```

在上面的例子中，需要注意MMC驱动的操作占了102.883ms中的100ms。有些设备驱动在挂起的时候有很多工作要做，比如将数据刷出到硬盘，或者其他耗时的操作等。

如果系统定义了freeze。那么系统将尝试挂起操作，如果没有freeze功能，那么你会看到下面的提示：

```
/ # echo freeze > /sys/power/state 
sh: write error: Invalid argument
/ #
```

### 未来的发展

目前在ARM平台上的suspend to idle有两方面的工作需要做。第一方面是前面提到的需要准备好platform_suspend_ops相关工作，该工作致力于冻结状态的合法化并将并到4.9版本的内核中。另一方面是关于冻结功能方面的支持。

如果你希望设备有更好的响应及表现那么应该继续完善冻结相关功能的实现。然而很多SoCs会使用ARM的cpu空闲驱动，这使得ARM能够完善自己独特的冻结功能。而事实上，ARM正在尝试添加自己特有的支持。如果SoCs供应商希望实现他们自己的cpu空闲驱动或者需要在进入更深层次的冻结休眠状态时提供额外的支持，那么只有实现自己的冻结功能。

--------------------------------------------------------------------------------

via: http://www.linaro.org/blog/suspend-to-idle/

作者：[Andy Gross][a]

译者：[beyondworld](https://github.com/beyondworld)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linaro.org/author/andygross/
[1]:https://lkml.org/lkml/2016/8/19/474

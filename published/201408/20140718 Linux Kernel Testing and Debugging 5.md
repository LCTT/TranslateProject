Linux 内核测试和调试（5）
================================================================================
### 仿真环境下进行 Linux 电源管理子系统测试 ###

Linux 电源管理子系统在仿真环境下提供5种测试方式。这些方式仅仅在内核各层之间运行休眠的代码而不是真正的让系统进入休眠状态。有些平台不能挂起系统，比如说我们需要模拟飞机的飞行环境，这时候使用这种仿真环境就非常有用处了。

freezer - 测试停掉处理器：

    echo freezer > /sys/power/pm_test
    echo platform > /sys/power/disk
    echo disk > /sys/power/state

devices - 测试停掉处理器以及挂起设备：

    echo devices > /sys/power/pm_test
    echo platform > /sys/power/disk
    echo disk > /sys/power/state

platform - 测试停掉处理器、挂起设备以及平台全局控制方法(*)

    echo platform > /sys/power/pm_test
    echo platform > /sys/power/disk
    echo disk > /sys/power/state

processors - 测试停掉处理器、挂起设备和平台全局控制方法(*)，以及关闭未启动的 CPU。

    echo processors > /sys/power/pm_test
    echo platform > /sys/power/disk
    echo disk > /sys/power/state

core - 测试停掉处理器、挂起设备和平台全局控制方法(*)，关闭未启动的 CPU，以及挂起平台或系统的设备。注意：这个测试模式运行在 ACPI 系统。

    echo core > /sys/power/pm_test
    echo platform > /sys/power/disk
    echo disk > /sys/power/state

### Linux 电源管理子系统追踪事件 ###

电源管理子系统在运行过程中支持多种追踪点和追踪事件。我将对如何使用这些追踪时间以及如何找到追踪信息作一个简单的介绍：

在运行时开启电源管理事件：

    cd /sys/kernel/debug/tracing/events/power
    echo 1 > cpu_frequency/enable
    cat /sys/kernel/debug/tracing/set_event
    less /sys/kernel/debug/tracing/trace

为内核启动的命令添加一个参数：

    trace_event=cpu_frequency

更多信息查看 Documentation/power/basic-pm-debugging.txt 以及同目录下其他的文档。

### git bisect 命令 ###

git bisect 是一个非常有用非常强大的工具，用于将 git 上的一个 commit 分离出来。我简单过一遍它的用法。

下面是 git bisect 的用法：

    git bisect start
    git bisect bad	 # 当前版本是坏的
    git bisect good v3.14-rc6	# 上个版本是好的

一旦指定好好的版本和坏的版本，git bisect 就会开始把好坏两个版本之间的所有 commit 对半分，并将其中的一半提交 pull 下来。然后重新编译安装测试内核，并标记这个内核是好是坏。重复这个过程，知道某个你选好的 commit 被标记被好或者坏。我们可能需要测试多个内核版本，测到最后一个版本时，git bisect 会将一个 commit 标记为坏。下面的命令可以在 git bisect 分析过程中起到帮助作用：

查看 bisect 操作的过程：

    git bisect log

重置 git bisect，标记错误时可以用到，保存 git log 的输出，重新操作上一次 bisect 的步骤：

    git bisect reset

重放 git bisect 操作过程：

    git bisect replay git_log_output

如果一个问题很清楚是在某个区域内，git bisect 命令可以定位到一个具体的内核源码树枝干上。举个例子，在调试一个镭龙显卡驱动的问题时，为 git bisect 指定 drivers/drm/radeon 参数，可以让 git bisect 只检索对 drivers/drm/radeon 里面的文件有修改的 commit。

让 git bisect 只检索内核树的某个枝干：

    git bisect start drivers/drm/radeon

--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/linux-kernel-testing-and-debugging?page=0,4

译者：[bazz2](https://github.com/bazz2) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[#]: subject: "Create a timer on Linux"
[#]: via: "https://opensource.com/article/21/10/linux-timers"
[#]: author: "Stephan Avenwedde https://opensource.com/users/hansic99"
[#]: collector: "lujun9972"
[#]: translator: "FigaroCao"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

在Linux中创建计时器
======
这是一个演示如何创建POSIX兼容的间隔计时器的教程

![Team checklist][1]

对开发人员来说，确定某些事件的时间是一项常见任务。 计时器的常见场景是监督任务的循环执行或在特定时间安排事件。 在这篇文章中，我将演示如何使用 [timer_create(...)][2]创建一个POSIX兼容的间隔计时器。

你可以从[GitHub][3]下载下面样例的源代码。

### 准备 Qt Creator

我使用[Qt Creator][4]作为样例的IDE。为了在Qt Creator运行和调试样例代码，克隆[GitHub][3]仓库，打开Qt Creator，在**File -&gt; Open File or Project...** 并选择 **CMakeLists.txt**:

![Qt Creator open project][5]

在Qt Creator中打开项目 (CC-BY-SA 4.0)

选择工具链之后，点击 **Configure Project**。这个项目包括三个独立的样例（我们在这篇文章中将只会用到其中的两个）。使用绿色标记出来的菜单，可以在每个样例的配置之间切换，并为每个样例激活在终端运行**Run in terminal**（用黄色标记）。当前用于构建和调试的活动示例可以通过左下角的**Debug**按钮进行选择(参见下面的橙色标记)。

![Project configuration][6]

项目配置 (CC-BY-SA 4.0)

### 线程计时器

让我们看看_simple_threading_timer.c_样例。这是最简单的一个。它展示了一个调用了超时函数**expired**的间隔计时器是如何被创建的。


```
#include &lt;stdio.h&gt;
#include &lt;stdlib.h&gt;
#include &lt;time.h&gt;
#include &lt;signal.h&gt;
#include &lt;unistd.h&gt;
#include &lt;string.h&gt;
#include &lt;errno.h&gt;

void expired(union sigval timer_data);

pid_t gettid(void);

struct t_eventData{
    int myData;
};

int main()
{
    int res = 0;
    timer_t timerId = 0;

    struct t_eventData eventData = { .myData = 0 };

    /*  sigevent指定了过期时要执行的操作  */
    struct sigevent sev = { 0 };

    /* 指定启动延时时间和间隔时间 
    * it_value和it_interval不能为零 */

    struct itimerspec its = {   .it_value.tv_sec  = 1,
                                .it_value.tv_nsec = 0,
                                .it_interval.tv_sec  = 1,
                                .it_interval.tv_nsec = 0
                            };

    [printf][7]("Simple Threading Timer - thread-id: %d\n", gettid());

    sev.sigev_notify = SIGEV_THREAD;
    sev.sigev_notify_function = &amp;expired;
    sev.sigev_value.sival_ptr = &amp;eventData;

    /* 创建计时器 */
    res = timer_create(CLOCK_REALTIME, &amp;sev, &amp;timerId);

    if (res != 0){
        [fprintf][8](stderr, "Error timer_create: %s\n", [strerror][9](errno));
        [exit][10](-1);
    }

    /* 启动计时器 */
    res = timer_settime(timerId, 0, &amp;its, NULL);

    if (res != 0){
        [fprintf][8](stderr, "Error timer_settime: %s\n", [strerror][9](errno));
        [exit][10](-1);
    }

    [printf][7]("Press ETNER Key to Exit\n");
    while([getchar][11]()!='\n'){}
    return 0;
}

void expired(union sigval timer_data){
    struct t_eventData *data = timer_data.sival_ptr;
    [printf][7]("Timer fired %d - thread-id: %d\n", ++data-&gt;myData, gettid());
}
```

这种方法的优点是在代码和简单的调试方面占用空间小。缺点是由于到期时创建新线程而增加额外的开销和因此导致的不太确定的结果。

### 中断信号计时器

超时计时器通知的另一种可能性是基于[内核信号][12]。 内核不是在每次计时器过期时创建一个新线程，而是向进程发送一个信号，进程被中断，并调用相应的信号处理程序。

由于接收信号时的默认操作是终止进程(参考[信号][13]手册页)，我们必须要提前准备Qt Creator，以便进行正确的调试。

当被调试对象接收到一个信号时，Qt Creator的默认行为是:

  * 中断执行并切换到调试器上下文。
  * 显示一个弹出窗口，通知用户接收到信号。



这两种操作都不需要，因为信号的接收是我们应用程序的一部分。

Qt Creator在后台使用GDB。为了防止GDB在进程接收到信号时停止执行，在“工具”菜单**Tools** -&gt; **Options**，选择 **Debugger**，并导航到**Locals &amp; Expressions**。添加下面的表达式到_Debugging Helper Customization_:


```
`handle SIG34 nostop pass`
```

![Signal no stop with error][14]

Sig 34 发生错误时未停止 (CC-BY-SA 4.0)

你可以在[GDB documentation][15]找到更多关于GDB信号处理的信息。

接下来，当我们在信号处理程序中停止时，我们想要抑制每次接收到信号时通知我们的弹出窗口:

![Signal 34 pop up box][16]

Signal 34 弹出窗口 (CC-BY-SA 4.0)

为此，导航到**GDB**标签并取消勾选标记的复选框:

![Timer signal windows][17]

计时器信号窗口 (CC-BY-SA 4.0)

现在你可以正确的调试_signal_interrupt_timer_。真正的信号计时器的实施会更复杂一些：


```
#include &lt;stdio.h&gt;
#include &lt;stdlib.h&gt;
#include &lt;signal.h&gt;
#include &lt;unistd.h&gt;
#include &lt;signal.h&gt;
#include &lt;time.h&gt;
#include &lt;unistd.h&gt;
#include &lt;errno.h&gt;
#include &lt;string.h&gt;

#define UNUSED(x) (void)(x)

static void handler(int sig, siginfo_t *si, void *uc);
pid_t gettid(void);

struct t_eventData{
    int myData;
};

int main()
{
    int res = 0;
    timer_t timerId = 0;

    struct sigevent sev = { 0 };
    struct t_eventData eventData = { .myData = 0 };

    /* 指定收到信号时的操作 */
    struct sigaction sa = { 0 };

    /* 指定启动延时的时间和间隔时间 */
    struct itimerspec its = {   .it_value.tv_sec  = 1,
                                .it_value.tv_nsec = 0,
                                .it_interval.tv_sec  = 1,
                                .it_interval.tv_nsec = 0
                            };

    [printf][7]("Signal Interrupt Timer - thread-id: %d\n", gettid());

    sev.sigev_notify = SIGEV_SIGNAL; // Linux-specific
    sev.sigev_signo = SIGRTMIN;
    sev.sigev_value.sival_ptr = &amp;eventData;

    /* 创建计时器 */
    res = timer_create(CLOCK_REALTIME, &amp;sev, &amp;timerId);

    if ( res != 0){
        [fprintf][8](stderr, "Error timer_create: %s\n", [strerror][9](errno));
        [exit][10](-1);
    }

    /* 指定信号和处理程序 */
    sa.sa_flags = SA_SIGINFO;
    sa.sa_sigaction = handler;

    /* 初始化信号 */
    sigemptyset(&amp;sa.sa_mask);

    [printf][7]("Establishing handler for signal %d\n", SIGRTMIN);

    /* 注册信号处理程序 */
    if (sigaction(SIGRTMIN, &amp;sa, NULL) == -1){
        [fprintf][8](stderr, "Error sigaction: %s\n", [strerror][9](errno));
        [exit][10](-1);
    }

    /* 启动计时器 */
    res = timer_settime(timerId, 0, &amp;its, NULL);

    if ( res != 0){
        [fprintf][8](stderr, "Error timer_settime: %s\n", [strerror][9](errno));
        [exit][10](-1);
    }

    [printf][7]("Press ENTER to Exit\n");
    while([getchar][11]()!='\n'){}
    return 0;
}

static void
handler(int sig, siginfo_t *si, void *uc)
{
    UNUSED(sig);
    UNUSED(uc);
    struct t_eventData *data = (struct t_eventData *) si-&gt;_sifields._rt.si_sigval.sival_ptr;
    [printf][7]("Timer fired %d - thread-id: %d\n", ++data-&gt;myData, gettid());
}
```

与线程计时器相反，我们必须初始化信号并注册一个信号处理程序。这种方法性能更好，因为它不会导致创建额外的线程。因此，信号处理程序的执行也更加确定。缺点显然是正确调试需要额外的配置工作。

### 总结

本文中描述的两种方法都是计时器的接近内核的实现。即使[timer_create(...)][2]函数是POSIX规范的一部分, 在FreeBSD系统上编译样例代码是不可能的，因为数据结构的差异很小。除了这个缺点之外，这种实现还为通用计时应用程序提供了细粒度控制。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/linux-timers

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[FigaroCao](https://github.com/FigaroCao)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hansic99
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/checklist_todo_clock_time_team.png?itok=1z528Q0y (Team checklist)
[2]: https://linux.die.net/man/2/timer_create
[3]: https://github.com/hANSIc99/posix_timers
[4]: https://www.qt.io/product/development-tools
[5]: https://opensource.com/sites/default/files/posix_timers_open_project_0.png
[6]: https://opensource.com/sites/default/files/posix_timers_project_configuration_2.png
[7]: http://www.opengroup.org/onlinepubs/009695399/functions/printf.html
[8]: http://www.opengroup.org/onlinepubs/009695399/functions/fprintf.html
[9]: http://www.opengroup.org/onlinepubs/009695399/functions/strerror.html
[10]: http://www.opengroup.org/onlinepubs/009695399/functions/exit.html
[11]: http://www.opengroup.org/onlinepubs/009695399/functions/getchar.html
[12]: https://man7.org/linux/man-pages/man3/signal.3p.html
[13]: https://linux.die.net/man/7/signal
[14]: https://opensource.com/sites/default/files/posix_timers_sig34_nostop_pass.png
[15]: https://sourceware.org/gdb/onlinedocs/gdb/Signals.html
[16]: https://opensource.com/sites/default/files/posix_timers_sig34_pop_up_2.png
[17]: https://opensource.com/sites/default/files/posix_timers_signal_windows.png

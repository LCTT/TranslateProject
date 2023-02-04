[#]: subject: "Create a timer on Linux"
[#]: via: "https://opensource.com/article/21/10/linux-timers"
[#]: author: "Stephan Avenwedde https://opensource.com/users/hansic99"
[#]: collector: "lujun9972"
[#]: translator: "FigaroCao"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15427-1.html"

在 Linux 中创建定时器
======

> 这是一个演示如何创建 POSIX 兼容的间隔定时器的教程。

![][0]

对开发人员来说，定时某些事件是一项常见任务。定时器的常见场景是看门狗、任务的循环执行，或在特定时间安排事件。在这篇文章中，我将演示如何使用 [timer_create(...)][2] 创建一个 POSIX 兼容的间隔定时器。

你可以从 [GitHub][3] 下载下面样例的源代码。

### 准备 Qt Creator

我使用 [Qt Creator][4] 作为该样例的 IDE。为了在 Qt Creator 运行和调试样例代码，请克隆 [GitHub][3] 上的仓库，打开 Qt Creator，在 “<ruby>文件<rt>File</rt></ruby> -> <ruby>打开文件或项目……<rt>Open File or Project...</rt></ruby>” 并选择 “CMakeLists.txt”：

![Qt Creator open project][5]

*在 Qt Creator 中打开项目*

选择工具链之后，点击 “<ruby>配置项目<rt>Configure Project</rt></ruby>”。这个项目包括三个独立的样例（我们在这篇文章中将只会用到其中的两个）。使用绿色标记出来的菜单，可以在每个样例的配置之间切换，并为每个样例激活在终端运行 “<ruby>在终端中运行<rt>Run in terminal</rt></ruby>”（用黄色标记）。当前用于构建和调试的活动示例可以通过左下角的“<ruby>调试<rt>Debug</rt></ruby>” 按钮进行选择（参见下面的橙色标记）。

![Project configuration][6]

*项目配置*

### 线程定时器

让我们看看 `simple_threading_timer.c` 样例。这是最简单的一个。它展示了一个调用了超时函数 `expired` 的间隔定时器是如何被创建的。在每次过期时，都会创建一个新的线程，在其中调用函数 `expired`：

```
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <signal.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>

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

    /*  sigevent 指定了过期时要执行的操作  */
    struct sigevent sev = { 0 };

    /* 指定启动延时时间和间隔时间 
    * it_value和it_interval 不能为零 */

    struct itimerspec its = {   .it_value.tv_sec  = 1,
                                .it_value.tv_nsec = 0,
                                .it_interval.tv_sec  = 1,
                                .it_interval.tv_nsec = 0
                            };

    printf("Simple Threading Timer - thread-id: %d\n", gettid());

    sev.sigev_notify = SIGEV_THREAD;
    sev.sigev_notify_function = &amp;expired;
    sev.sigev_value.sival_ptr = &amp;eventData;

    /* 创建定时器 */
    res = timer_create(CLOCK_REALTIME, &amp;sev, &amp;timerId);

    if (res != 0){
        fprintf(stderr, "Error timer_create: %s\n", strerror(errno));
        exit(-1);
    }

    /* 启动定时器 */
    res = timer_settime(timerId, 0, &amp;its, NULL);

    if (res != 0){
        fprintf(stderr, "Error timer_settime: %s\n", strerror(errno));
        exit(-1);
    }

    printf("Press ETNER Key to Exit\n");
    while(getchar()!='\n'){}
    return 0;
}

void expired(union sigval timer_data){
    struct t_eventData *data = timer_data.sival_ptr;
    printf("Timer fired %d - thread-id: %d\n", ++data->myData, gettid());
}
```

这种方法的优点是在代码和简单调试方面用量小。缺点是由于到期时创建新线程而增加额外的开销，因此行为不太确定。

### 中断信号定时器

超时定时器通知的另一种可能性是基于 [内核信号][12]。内核不是在每次定时器过期时创建一个新线程，而是向进程发送一个信号，进程被中断，并调用相应的信号处理程序。

由于接收信号时的默认操作是终止进程（参考 [signal][13] 手册页），我们必须要提前设置好 Qt Creator，以便进行正确的调试。

当被调试对象接收到一个信号时，Qt Creator 的默认行为是：

  * 中断执行并切换到调试器上下文。
  * 显示一个弹出窗口，通知用户接收到信号。

这两种操作都不需要，因为信号的接收是我们应用程序的一部分。

Qt Creator 在后台使用 GDB。为了防止 GDB 在进程接收到信号时停止执行，进入 “<ruby>工具<rt>Tools</rt></ruby> -> <ruby>选项<rt>Options</rt></ruby>” 菜单，选择 “<ruby>调试器<rt>Debugger</rt></ruby>”，并导航到 “<ruby>本地变量和表达式<rt>Locals & Expressions</rt></ruby>”。添加下面的表达式到 “<ruby>定制调试助手<rt>Debugging Helper Customization</rt></ruby>”：

```
handle SIG34 nostop pass
```

![Signal no stop with error][14]

*Sig 34 时不停止*

你可以在 [GDB 文档][15] 中找到更多关于 GDB 信号处理的信息。

接下来，当我们在信号处理程序中停止时，我们要抑制每次接收到信号时通知我们的弹出窗口:

![Signal 34 pop up box][16]

*Signal 34 弹出窗口*

为此，导航到 “GDB” 标签并取消勾选标记的复选框:

![Timer signal windows][17]

*定时器信号窗口*

现在你可以正确的调试 `signal_interrupt_timer`。真正的信号定时器的实施会更复杂一些：

```
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>
#include <signal.h>
#include <time.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>

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

    printf("Signal Interrupt Timer - thread-id: %d\n", gettid());

    sev.sigev_notify = SIGEV_SIGNAL; // Linux-specific
    sev.sigev_signo = SIGRTMIN;
    sev.sigev_value.sival_ptr = &amp;eventData;

    /* 创建定时器 */
    res = timer_create(CLOCK_REALTIME, &amp;sev, &amp;timerId);

    if ( res != 0){
        fprintf(stderr, "Error timer_create: %s\n", strerror(errno));
        exit(-1);
    }

    /* 指定信号和处理程序 */
    sa.sa_flags = SA_SIGINFO;
    sa.sa_sigaction = handler;

    /* 初始化信号 */
    sigemptyset(&amp;sa.sa_mask);

    printf("Establishing handler for signal %d\n", SIGRTMIN);

    /* 注册信号处理程序 */
    if (sigaction(SIGRTMIN, &amp;sa, NULL) == -1){
        fprintf(stderr, "Error sigaction: %s\n", strerror(errno));
        exit(-1);
    }

    /* 启动定时器 */
    res = timer_settime(timerId, 0, &amp;its, NULL);

    if ( res != 0){
        fprintf(stderr, "Error timer_settime: %s\n", strerror(errno));
        exit(-1);
    }

    printf("Press ENTER to Exit\n");
    while(getchar()!='\n'){}
    return 0;
}

static void
handler(int sig, siginfo_t *si, void *uc)
{
    UNUSED(sig);
    UNUSED(uc);
    struct t_eventData *data = (struct t_eventData *) si->_sifields._rt.si_sigval.sival_ptr;
    printf("Timer fired %d - thread-id: %d\n", ++data->myData, gettid());
}
```

与线程定时器相比，我们必须初始化信号并注册一个信号处理程序。这种方法性能更好，因为它不会导致创建额外的线程。因此，信号处理程序的执行也更加确定。缺点显然是正确调试需要额外的配置工作。

### 总结

本文中描述的两种方法都是接近内核的定时器的实现。不过，即使 [timer_create(...)][2] 函数是 POSIX 规范的一部分，由于数据结构的细微差别，也不可能在 FreeBSD 系统上编译样例代码。除了这个缺点之外，这种实现还为通用计时应用程序提供了细粒度控制。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/linux-timers

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[FigaroCao](https://github.com/FigaroCao)
校对：[wxy](https://github.com/wxy)

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
[0]: https://img.linux.net.cn/data/attachment/album/202301/09/150238f1d60cmvssr9d0js.jpg
[#]: subject: "Create a timer on Linux"
[#]: via: "https://opensource.com/article/21/10/linux-timers"
[#]: author: "Stephan Avenwedde https://opensource.com/users/hansic99"
[#]: collector: "lujun9972"
[#]: translator: "FigaroCao"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Create a timer on Linux
======
A tutorial showing how to create a POSIX-compliant interval timer.
![Team checklist][1]

The timing of certain events is a common task for a developer. Common scenarios for timers are watchdogs, cyclic execution of tasks, or scheduling events for a specific time. In this article, I show how to create a POSIX-compliant interval timer using [timer_create(...)][2].

You can download the source code for the following examples from [GitHub][3].

### Prepare Qt Creator

I used [Qt Creator][4] as the IDE for this example. To run and debug the example code in Qt Creator, clone the [GitHub][3] repository, open Qt Creator, and go to **File -&gt; Open File or Project...** and choose the **CMakeLists.txt**:

![Qt Creator open project][5]

Open a project in Qt Creator (CC-BY-SA 4.0)

After selecting the toolchain, click on **Configure Project**. The project contains three independent examples (we will only cover two of them in this article). With the green-marked menu, switch between the configurations for each example and activate **Run in terminal** for each of them (see the yellow mark below). The currently active example for building and debugging can be selected over the **Debug** button on the bottom left corner (see the orange mark below):

![Project configuration][6]

Project configuration (CC-BY-SA 4.0)

### Threading timer

Let's take a look at the _simple_threading_timer.c_ example. This is the simplest one: It shows how an interval timer is created, which calls the function **expired** on expiration. On each expiration, a new thread is created in which the function **expiration** is called.


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

    /*  sigevent specifies behaviour on expiration  */
    struct sigevent sev = { 0 };

    /* specify start delay and interval
     * it_value and it_interval must not be zero */

    struct itimerspec its = {   .it_value.tv_sec  = 1,
                                .it_value.tv_nsec = 0,
                                .it_interval.tv_sec  = 1,
                                .it_interval.tv_nsec = 0
                            };

    [printf][7]("Simple Threading Timer - thread-id: %d\n", gettid());

    sev.sigev_notify = SIGEV_THREAD;
    sev.sigev_notify_function = &amp;expired;
    sev.sigev_value.sival_ptr = &amp;eventData;

    /* create timer */
    res = timer_create(CLOCK_REALTIME, &amp;sev, &amp;timerId);

    if (res != 0){
        [fprintf][8](stderr, "Error timer_create: %s\n", [strerror][9](errno));
        [exit][10](-1);
    }

    /* start timer */
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

The advantage of this approach is its small footprint, in terms of code and simple debugging. The disadvantage is the additional overhead due to the creation of a new thread on expiration and, consequently, the less deterministic behavior.

### Interrupt Signal Timer

Another possibility to be notified by an expired timer is based on a [kernel signal][12]. Instead of creating a new thread each time the timer expires, the kernel sends a signal to the process, the process is interrupted, and the corresponding signal handler is called.

As the default action when receiving a signal is to terminate the process (see [signal][13] man page), we have to prepare Qt Creator in advance so that properly debugging is possible.

The default behavior of Qt Creator when the debuggee receives a signal is:

  * Interrupt execution and switch to the debugger context.
  * Display a pop-up window that notifies the user about the reception of a signal.



Both actions are not wanted as the reception of a signal is part of our application.

Qt Creator uses GDB in the background. In order to prevent GDB from stopping the execution when the process receives a signal, go to **Tools** -&gt; **Options**, select **Debugger**, and navigate to **Locals &amp; Expressions**. Add the following expression to _Debugging Helper Customization_:


```
`handle SIG34 nostop pass`
```

![Signal no stop with error][14]

Sig 34 no stop with error (CC-BY-SA 4.0)

You can find more information about GDB signal handling in the [GDB documentation][15].

Next, we want to suppress the pop-up window that notifies us every time a signal is received when we stop in the signal handler:

![Signal 34 pop up box][16]

Signal 34 pop-up box (CC-BY-SA 4.0)

To do so, navigate to the tab **GDB** and uncheck the marked checkbox:

![Timer signal windows][17]

Timer signal windows (CC-BY-SA 4.0)

Now you can properly debug the _signal_interrupt_timer_. The actual implementation of the signal timer is a bit more complex:


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

    /* specifies the action when receiving a signal */
    struct sigaction sa = { 0 };

    /* specify start delay and interval */
    struct itimerspec its = {   .it_value.tv_sec  = 1,
                                .it_value.tv_nsec = 0,
                                .it_interval.tv_sec  = 1,
                                .it_interval.tv_nsec = 0
                            };

    [printf][7]("Signal Interrupt Timer - thread-id: %d\n", gettid());

    sev.sigev_notify = SIGEV_SIGNAL; // Linux-specific
    sev.sigev_signo = SIGRTMIN;
    sev.sigev_value.sival_ptr = &amp;eventData;

    /* create timer */
    res = timer_create(CLOCK_REALTIME, &amp;sev, &amp;timerId);

    if ( res != 0){
        [fprintf][8](stderr, "Error timer_create: %s\n", [strerror][9](errno));
        [exit][10](-1);
    }

    /* specifz signal and handler */
    sa.sa_flags = SA_SIGINFO;
    sa.sa_sigaction = handler;

    /* Initialize signal */
    sigemptyset(&amp;sa.sa_mask);

    [printf][7]("Establishing handler for signal %d\n", SIGRTMIN);

    /* Register signal handler */
    if (sigaction(SIGRTMIN, &amp;sa, NULL) == -1){
        [fprintf][8](stderr, "Error sigaction: %s\n", [strerror][9](errno));
        [exit][10](-1);
    }

    /* start timer */
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

In contrast to the threading timer, we have to initialize the signal and register a signal handler. This approach is more performant as it won't cause the creation of additional threads. For this reason, the execution of the signal handler is also more deterministic. The drawback is clearly the extra configuration effort to debug this properly.

### Summary

Both methods described in this article are close-to-the-kernel implementations of timers. Even if the [timer_create(...)][2] function is part of the POSIX specification, it is not possible to compile the sample code on a FreeBSD system due to small differences in data structures. Besides this drawback, such an implementation gives you fine-grained control for general-purpose timing applications.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/linux-timers

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
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

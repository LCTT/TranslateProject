Inside Real-Time Linux
============================================================


 ![Jan Altenberg](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/jan-altenberg-elc.png?itok=mgQeKpEK "Jan Altenberg") 
 
Real-time Linux has come a long way in the past decade. Jan Altenberg of Linutronix provides an overview of the topic and offers new RTL performance benchmarks in this video from ELC Europe.[The Linux Foundation][1]

Real-time Linux (RTL), a form of mainline Linux enabled with PREEMPT_RT, has come a long way in the past decade. Some 80 percent of the deterministic [PREEMPT_RT][3] patch is now available in the mainline kernel itself. Yet, backers of the strongest alternative to the single-kernel RTL on Linux -- the dual-kernel Xenomai -- continue to claim a vast superiority in reduced latency. In an [Embedded Linux Conference Europe][4] presentation in October, Jan Altenberg rebutted these claims while offering an overview of the real-time topic.

Altenberg, of German embedded development firm [Linutronix][5], does not deny that dual-kernel approaches such as Xenomai and RTAI offer lower latency. However, he reveals new Linutronix benchmarks that purport to show that the differences are not as great as claimed, especially in real-world scenarios. Less controversially, he argues that RTL is much easier to develop for and maintain.

Before we delve into the eternal Xenomai vs. RTL debate, note that in October 2015, the [Open Source Automation Development Lab][6] (OSADL) [handed control][7] of the RTL project over to The Linux Foundation, which hosts Linux.com. In addition, Linutronix is a key contributor to the RTL project and hosts its x86 maintainer.

The advance of RTL is one of several reasons Linux has [stolen market share][8] from real-time operating systems (RTOSes) over the past decade. RTOSes appear more frequently on microcontrollers than applications processors, and it's easier to do real-time on single-purpose devices that lack advanced userland OSes such as Linux.

Altenberg began his presentation by clearing up some common misconceptions about real-time (or realtime) deterministic kernel schemes. “Real-time is not about fast execution or performance,” Altenberg told his ELCE audience. “It’s basically about determinism and timing guarantees. Real-time gives you a guarantee that something will execute within a given time frame. You don’t want to be as fast as possible, but as fast as specified.”

Developers tend to use real-time when a tardy response to a given execution time leads to a serious error condition, especially when it could lead to people getting hurt. That’s why real-time is still largely driven by the factory automation industry and is increasingly showing up in cars, trains, and planes. It’s not always a life-and-death situation, however -- financial services companies use RTL for high-frequency trading.

Requirements for real-time include deterministic timing behavior, preemption, priority inheritance, and priority ceiling, said Altenberg. “The most important requirement is that a high-priority task always needs to be able to preempt a low-priority task.”

Altenberg strongly recommended against using the term “soft real-time” to describe lightweight real-time solutions. “You can be deterministic or not, but there’s nothing in between.”

### Dual-kernel Real-time

Dual-kernel schemes like Xenomai and RTAI deploy a microkernel running in parallel with a separate Linux kernel, while single kernel schemes like RTL make Linux itself capable of real-time. “With dual-kernel, Linux can get some runtime when priority real-time applications aren’t running on the microkernel,” said Altenberg. “The problem is that someone needs to maintain the microkernel and support it on new hardware. This is a huge effort, and the development communities are not very big. Also, because Linux is not running directly on the hardware, you need a hardware abstraction layer (HAL). With two things to maintain, you’re usually a step behind mainline Linux development.”

The challenge with RTL, and the reason it has taken so long to emerge, is that “to make Linux real-time you have to basically touch every file in the kernel,” said Altenberg. Yet, most of that work is already done and baked into mainline, and developers don’t need to maintain a microkernel or HAL.

Altenberg went on to explain the differences between the RTAI and Xenomai. “With RTAI, you write a kernel module that is scheduled by a microkernel. It’s like kernel development -- really hard to get into it and hard to debug.”

RTAI development can be further complicated because industrial customers often want to include closed source code along with GPL kernel code. “You have to decide which parts you can put into userland and which you put into the kernel with real-time approaches,” said Altenberg.

RTAI also supports fewer hardware platforms than RTL, especially beyond x86\. The dual-kernel Xenomai, which has eclipsed RTAI as the dominant dual-kernel approach, has wider OS support than RTAI. More importantly, it offers “a proper solution for doing real-time in userspace,” said Altenberg. “To do this, they implemented the concept of skins -- an emulation layer for the APIs of different RTOSes, such as POSIX. This lets you reuse a subset of existing code from some RTOSes.”

With Xenomai, however, you still need to maintain a separate microkernel and HAL. Limited development tools are another problem. “As with RTAI, you can’t use the standard C library,” said Altenberg. “You need special tools and libraries. Even for POSIX, you must link to the POSIX skin, which is much more complicated.” With either platform, he added, it’s hard to scale the microkernels beyond 8 to 16 CPUs to the big server clusters used in financial services.

### Sleeping Spinlocks

The dominant single-kernel solution is RTL, based on PREEMPT.RT, which was primarily developed by Thomas Gleixner and Ingo Molnár more than a decade ago. PREEMPT.RT reworks the kernel’s “spinlock” locking primitives to maximize the preemptible sections inside the Linux kernel. (PREEMPT.RT was originally called the Sleeping Spinlocks Patch.)

Instead of running interrupt handlers in hard interrupt context, PREEMPT.RT runs them in kernel threads. “When an interrupt arrives, you don’t run the interrupt handler code,” said Altenberg. “You just wake up the corresponding kernel thread, which runs the handler. This has two advantages: The kernel thread becomes interruptible, and it shows up in the process list with a PID. So you can put a low priority on non-important interrupts and a higher priority on important userland tasks.”

Because about 80 percent of PREEMPT.RT is already in mainline, any Linux developer can take advantage of PREEMPT.RT-originated kernel components such as timers, interrupt handlers, tracing infrastructure, and priority inheritance. “When they made Linux real-time, everything became preemptible, so we found a lot of race conditions and locking problems,” said Altenberg. “We fixed these and pushed them back into mainline to improve the stability of Linux in general.”

Because RTL is primarily mainline Linux, “PREEMPT.RT is widely accepted and has a huge community,” said Altenberg. “If you write a real-time application, you don’t need to know much about PREEMPT.RT. You don’t need any special libraries or APIs, just a standard C library, a Linux driver, and POSIX app.”

You still need to run a patch to use PREEMPT.RT, which is updated in every second Linux version. However, within two years, the remaining 20 percent of PREEMPT.RT should make it into Linux, so you “won’t need a patch.”

Finally, Altenberg revealed the results of his Xenomai vs. RTL latency tests. “There are a lot of papers that claim that Xenomai and RTAI are way faster on latency than PREEMPT.RT,” said Altenberg. “But I figured out that most of the time PREEMPT.RT was poorly configured. So we brought in both a Xenomai expert and a PREEMPT.RT expert, and let them configure their own platforms.”

While Xenomai performed better on most tests, and offered far less jitter, the differences were not as great as the 300 to 400 percent latency superiority claimed by some Xenomai boosters, said Altenberg. When tests were performed on userspace tasks -- which Altenberg says is the most real-world, and therefore the most important, test -- the worst-case reaction was about 90 to 95 microseconds for both Xenomai and RTL/PREEMPT.RT, he claimed.

When they isolated a single CPU in the dual Cortex-A9 system for handling the interrupt in question, which Altenberg says is fairly common, PREEMPT.RT performed slightly better, coming in around 80 microseconds. (For more details, check out the video about 33 minutes in.)

Altenberg acknowledges that his 12-hour test is the bare minimum, compared to OSADL’s two- to three-year tests, and that it is “not a mathematical proof.” In any case, he suggests that RTL deserves a handicap considering its easier development process. “In my opinion, it’s not fair to compare a full-featured Linux system with a microkernel,” he concluded.

--------------------------------------------------------------------------------

via: https://www.linux.com/news/event/open-source-summit-na/2017/2/inside-real-time-linux

作者：[ERIC BROWN][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/ericstephenbrown
[1]:https://www.linux.com/licenses/category/linux-foundation
[2]:https://www.linux.com/files/images/jan-altenberg-elcpng
[3]:https://www.linux.com/blog/intro-real-time-linux-embedded-developers
[4]:http://events.linuxfoundation.org/events/archive/2016/embedded-linux-conference-europe
[5]:https://linutronix.de/
[6]:http://archive.linuxgizmos.com/celebrating-the-open-source-automation-development-labs-first-birthday/
[7]:http://linuxgizmos.com/real-time-linux-shacks-up-with-the-linux-foundation/
[8]:https://www.linux.com/news/embedded-linux-keeps-growing-amid-iot-disruption-says-study

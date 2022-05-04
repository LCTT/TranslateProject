[#]: subject: (A new open source operating system for embedded systems)
[#]: via: (https://opensource.com/article/21/7/rt-thread-smart)
[#]: author: (Zhu Tianlong https://opensource.com/users/zhu-tianlong)
[#]: collector: (lujun9972)
[#]: translator: (tendertime)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

A new open source operating system for embedded systems
======
RT-Thread Smart is working to open source the world of IoT and edge
computing.
![An intersection of pipes.][1]

There's a growing demand for [embedded operating systems][2], and it's best when the one you build upon is open source. The [RT-Thread][3] project's R&amp;D team has spent three years of research and intensive development to arrive at the project's latest offering: RT-Thread Smart. It is a microkernel operating system aimed primarily at midrange to high-end processors such as RISC-V with a memory management unit (MMU) and provides a competitive software platform for all industries in the embedded space.

### Who needs RT-Thread Smart?

RT-Thread Smart is a professional, high-performance, microkernel operating system for real-time applications. It offers an open source foundation for embedded devices in any market, including security (e.g., internet protocol cameras), industrial control, onboard devices, consumer electronics, and anything else using embedded technology (which is increasingly coming to mean "everything"). It's significant because, unlike traditional IoT operating systems, a microkernel operating system can fill the gap between a traditional real-time operating system (RTOS) and a comparatively large operating system like Linux to achieve the best balance between real-time performance, cost, security, startup speed, and more.

### RT-Thread Smart's architecture

RT-Thread Smart separates a system into kernel mode and user mode by taking advantage of the MMU and system call methods. It then divides the address space for each mode (a 32-bit system provides 4G address space).

![RT-Thread Smart architecture][4]

(RT-Thread, [CC BY-SA 4.0)][5]

The RT-Thread Smart kernel includes the platform's basic functionality and supports customizations. RT-Thread Smart's userspace application environment uses [musl libc][6] to provide [POSIX][7] interface calls and C runtime supports. It also inherits the original RT-Thread ecosystem, using [SCons][8] or other build tools such as [Autotools][9], Makefiles, [CMake][10], and so on to support development, as well as RT-Thread's out-of-the-box online software packages (over 342 at the time of this writing). You can even port Linux applications, such as wget/cURL, BusyBox, OpenSSL, and Simple DirectMedia Layer, to your platform.

The compressed RT-Thread Smart kernel is just 217KB, with a root filesystem of 127KB. Typical memory usage is about 2MB.

Including full support for filesystems, network protocol stacks, and multimedia, it takes only three to five seconds for RT-Thread to finish its startup process. Without running any functional components, RT-Thread Smart requires less than 500ms to start and be ready.

With its integrated Persimmon user interface (UI) component, the time it takes from power-on to a running UI is about one second. In other words, this is a seriously tiny and fast system. Of course, "real time" isn't about startup but how the system performs consistently over time. For RT-Thread, real-time performance is a priority, and the interrupt latency is less than 1 μs, which meets most application cases with the strictest real-time requirements.

### RT-Thread Smart vs. RT-Thread

You might be wondering about the differences between RT-Thread Smart and RT-Thread. Simply put, RT-Thread Smart is an RT-Thread RTOS-based operating system, but it integrates the user-state process. The kernel part of RT-Smart is essentially RT-Thread RTOS; it runs on virtual addresses, joins process management, and uses interprocess communication mechanisms, virtual memory/address space management, ELF loaders, and so on, and it makes all of these features components within RT-Thread RTOS. When the IwP components are disabled, RT-Smart falls back onto RT-Thread RTOS.

Here's a comparison:

| RT-Thread | RT-Thread Smart
---|---|---
Supported chips | Cortex-M/R, RISC-V RV32IMAC (and similar), Cortex-A MPU | MPU with MMU, such as Cortex-A
Compiling | The kernel and application are compiled into an image program. | The kernel and application can be separately compiled and executed.
Memory | Runs on a linear address space (even with MMU) and uses virtual addressing with the physical address | Runs on a 32-bit system with the kernel running on more than 1GB, the user-state process has separate address spaces that are isolated from each other. Peripheral drivers must access peripherals with virtual addresses.
Running errors | When an application fails, the overall system collapses. | When an application fails, it does not affect kernel and other process execution.
Running model | Multiprocess model | Multiprocess model (multithread is supported within the process, and kernel threads are supported by the kernel)
User model | Single-user model | Single-user model
API | RT-Thread API, POSIX PSE52 | RT-Thread API (on kernel and userspace), plus a full POSIX API
Real time | Preemptive hard real-time system | Preemptive hard real-time system
Resource utilization | Very small | Relatively small
Debugging | Generally debugged through the emulator | No emulator required according to the way the software debugs

RT-Thread RTOS is very compact. All applications and subsystems are compiled into the image, and multitasking runs and shares the same address space.

RT-Thread Smart is independent. Systems and applications are separately compiled and executed. Applications have a complete address space and are kept isolated from each other. It also inherits all the great real-time features of RT-Thread and features a POSIX environment.

Similarly, they're both compatible with the RT-Thread API, so applications on RT-Thread RTOS can be smoothly ported to RT-Thread Smart.

### Embed open source

RT-Thread Smart is an open source project, with its code available on [GitHub][11]. You can download the code and its documentation, give it a try, submit comments and feedback, and help spread it to more open source advocates. Embedded systems should belong to their users, and there are too many embedded developers out there who don't realize what's available.

If you're a developer, help hack on RT-Thread Smart! As the RT-Thread project continues to advance, we aim to make the exciting worlds of IoT and edge computing open source.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/rt-thread-smart

作者：[Zhu Tianlong][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/zhu-tianlong
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LAW-Internet_construction_9401467_520x292_0512_dc.png?itok=RPkPPtDe (An intersection of pipes.)
[2]: https://opensource.com/article/20/6/open-source-rtos
[3]: https://www.rt-thread.io/
[4]: https://opensource.com/sites/default/files/uploads/rt-thread-smart.png (RT-Thread Smart architecture)
[5]: https://creativecommons.org/licenses/by-sa/4.0/legalcode
[6]: https://musl.libc.org/
[7]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[8]: https://scons.org/
[9]: https://opensource.com/article/19/7/introduction-gnu-autotools
[10]: https://opensource.com/article/21/5/cmake
[11]: https://github.com/RT-Thread/rt-thread/tree/rt-smart

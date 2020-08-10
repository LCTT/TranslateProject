[#]: collector: (lujun9972)
[#]: translator: (silentdawn-zz)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Code your hardware using this open source RTOS)
[#]: via: (https://opensource.com/article/20/6/open-source-rtos)
[#]: author: (Zhu Tianlong https://opensource.com/users/zhu-tianlong)

Code your hardware using this open source RTOS
======
Programming a chip is hard, but RTOS solves many of the major issues on
embedded systems
![Puzzle pieces coming together to form a computer screen][1]

In general computing, an operating system is software that provides a computer's basic functions. It ensures that a computer detects and responds to peripherals (like keyboards, screens, mobile devices, printers, and so on), and it manages memory and drive space.

Even though modern operating systems make it seem that multiple programs are running at the same time, a CPU core can run only a single thread at a time. Each task is executed so quickly and in such rapid succession that the result appears to be massive multi-tasking. This is managed by a subroutine called a _scheduler_.

Operating systems, usually, are for computers. The OS is installed to your hard drive, and manages the computer's tasks.

### Why RTOS is essential for embedded systems

I discovered embedded software in 2008, when I was a student learning about programming on an [MCS-51][2] chip. Because I was majoring in computer science, all the programs I was doing in other courses were executed on a PC. But programming on a chip was a completely different experience. For the first time, I saw my programs running on a bare-metal board, and I can still remember the excitement when my first cycling lamp program ran successfully.

The excitement was relatively short-lived, though. The more bare-metal programs I wrote, the more issues I encountered. I wasn't alone in this frustration. Programming a chip directly is hard, and there are good reasons PCs use an operating system. Unfortunately, computer chips (an embedded system) don't normally have an OS. They're "hard coded" with code with no OS to help manage how the code gets executed.

Here are the problems you might encounter when hard coding a computer chip:

#### Concurrency

You don't have daemons on a chip to manage execution. For bare-metal programs, there is inevitably a huge `while (1)` loop that contains almost all the transaction logic of the whole project. Each transaction invokes one or more delay functions. These are executed serially when the CPU is running a delay function. There's nothing to preempt an unnecessary delay, so the transaction reset has to wait. As a result, much of the CPU time is wasted on empty loops, which is bad for concurrency.

#### Modularity

From the perspective of a software project, the principle of high cohesion and low coupling is always emphasized during the development process. However, modules in bare-metal software usually depend on each other heavily. As mentioned above, most functions are collected in a huge `while (1)` loop, which is hard to divide into modules. It's just not convenient to design software with low coupling, which makes it difficult to develop large projects on bare-metal boards.

Also, developers must be careful to use delay functions when a watchdog timer is involved. If the delay time is too long, then the main function doesn't have an opportunity to reset the watchdog, so the watchdog is triggered during execution. For bare-metal development, there are too many things to consider, even when invoking a delay function. The more complex the project is, the more care you need to take. Imagine trying to decouple this series of delicately timed interactions into modules.

#### Ecosystem

Many advanced software components depend on the implementation of the lower-level operating system. For example, I developed an open source project based on [FreeModbus][3] that I'd planned to transplant to various platforms, even to bare metal. But compared to the convenience of adapting it to different operating systems, some functions are too complex to implement on all bare-metal boards. Worse still, many implementations would have to be designed from scratch on different hardware platforms because of the lack of commonality.

For now, my implementation of the Modbus stack still cannot run on bare-metal boards.

Many WiFi software-development kits provided by big companies such as Realtek, TI, and MediaTek can run only on the operating system. They don't publish their firmware's source code for the user to modify, so you can't use them within a bare-metal environment.

#### Real-time capability

Real-time capability is necessary for some application fields. For some use cases, a critical software step must be triggered at a specific time. For industry control, for instance, mechanical devices must complete actions in a predetermined order and timing. Without ensuring real-time capability, there would be malfunctions that could endanger the lives of workers. On bare-metal platforms, when all the functions are jammed into one big `while (1)` loop, it's impossible to maintain the real-time capabilities.

#### Reusability

Reusability depends on modularity. Nobody wants to do the same job over and over, especially if that job is writing code. Not only is it a waste of time, but it makes code maintenance exponentially more complex. And yet, on various hardware platforms with different chips, the same function has to be adapted to different hardware because the implementation depends on low-level hardware. It's inevitable to reinvent the wheel.

### Advantages of RTOS

Fortunately, there are operating systems written for chips: they're called a real-time operating system (RTOS), and like most operating systems, they have a scheduler to ensure a predictable order of code execution.

I first used an RTOS for bare metal in 2010. The [STM32][4] series of microcontrollers (MCUs) was starting to become popular, and because they were so powerful and rich in features, many people were running operating systems on them. I used the [RT-Thread][5] operating system, which has many available, ready-to-use components built on it. It's available under the Apache 2.0 license, and I feel more comfortable with it compared to other operating systems. I have been developing on it for 10 years.

For bare-metal programming, an RTOS solves most of the biggest problems we face.

#### Modularity

With an operating system, the entire software can be split into several tasks (known as threads). Each thread has its own independent execution space. They're independent of each other, which improves modularity.

#### Concurrency

When a thread invokes the delay function, it automatically yields the CPU to other threads that need to run, which improves the utilization of the entire CPU and, ultimately, the concurrency.

#### Real-time

An RTOS is designed with real-time capabilities. Each thread is assigned a specified priority. More important threads are set to a higher priority, with less important threads set to lower ones. In this way, the real-time performance of the entire software is guaranteed.

#### Development efficiency

The operating system provides a unified layer of abstract interfaces. This facilitates the accumulation of reusable components and improves development efficiency.

The operating system is a product of the wisdom of a group of software geeks. Many common software functions, such as semaphore, event notification, mailbox, ring buffer, one-way chain list, two-way list, and so on, are encapsulated and abstracted to make them ready to use.

Operating systems like Linux and RT-Thread implement a standard set of hardware interfaces for fragmented hardware. This is known as the device-driver framework. Because of this, a software engineer can focus on development with no concern about the underlying hardware or reinventing the wheel.

#### Software ecosystem

The richness of the RT-Thread ecosystem brings the process of quantitative changes to qualitative ones. The improvement in modularity and reusability with an operating system allows programmers to encapsulate RTOS-based, embedded-friendly reusable components. These can be used in projects as well as be shared with other embedded-application developers who need to maximize the value of software.

For example, the LkdGui project is an open source graphics library designed for monochrome displays. You might see it used in industrial settings for simple, beautiful graphical interfaces for control panels. LkdGui provides graphical functions, such as drawing points, lines, rectangles, text display, button widgets, and progress bars.

![LkdGui][6]

The ability to reuse a library as extensive and robust as LkdGui means programmers can build on top of their peers' work. Without an RTOS, this just wouldn't be possible.

### Try RT-Thread

I'm an open source geek, and I have open sourced some embedded software on GitHub. Before creating open source software, I rarely talked with others about my projects because people were inevitably using different chips or hardware platforms, so our code could hardly run on one another's hardware. An RTOS like RT-Thread greatly improves software reusability, so many diverse experts all over the world can communicate with each other about the same project. This is encouraging more and more people to share and talk about their projects. If you're doing bare-metal programming, try RT-Thread on your next project.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/open-source-rtos

作者：[Zhu Tianlong][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/zhu-tianlong
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/puzzle_computer_solve_fix_tool.png?itok=U0pH1uwj (Puzzle pieces coming together to form a computer screen)
[2]: https://en.wikipedia.org/wiki/Intel_MCS-51
[3]: https://www.embedded-solutions.at/files/freemodbus-v1.6-apidoc/
[4]: https://en.wikipedia.org/wiki/STM32
[5]: https://github.com/RT-Thread/rt-thread
[6]: https://opensource.com/sites/default/files/uploads/lkdgui.jpg (LkdGui)

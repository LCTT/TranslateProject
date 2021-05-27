[#]: subject: (Port operating systems to new chip architectures)
[#]: via: (https://opensource.com/article/21/5/port-chip-architectures)
[#]: author: (Alan Smithee https://opensource.com/users/alansmithee)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Port operating systems to new chip architectures
======
What the RT-Thread maintainers learned from porting the embedded systems
operating system to different chip architectures.
![diagram of planning a cloud][1]

I was once asked why computers are called "computers" when they do so much more than compute numbers. A modern PC browses the internet, plays audio and video, generates beautiful graphics for video games and movies, simulates and predicts complex weather patterns and epidemiological risks, brings architectural and engineering blueprints to life, and much more.

The reason computers can do all of this because all these problems can be expressed as numerical equations, and the computer's CPU—its central processing unit—is actually little more than a simple calculator.

To get a CPU to send signals to a hard drive to write data or to a monitor to show an image, it must receive instructions. These instructions come in the form of "code," which is a terse way of saying someone must write a _program_ that "speaks" the same language as the CPU. A CPU understands _machine language_, a mostly incomprehensible array of bits that most humans don't bother writing out manually. Instead, we use programming languages like C, C++, Java, Python, and so on. These languages are parsed and compiled into machine language, which is delivered to the CPU.

If you try to instruct a CPU in a language it doesn't understand, the CPU won't know what to do. You can experience the rather unspectacular results of such an attempt at miscommunication by trying to boot a [Raspberry Pi][2] from an [x86_64 RHEL][3] image. It would be nice if it could work, but it doesn't.

### Porting an OS to a new architecture

The [RT-Thread project][4] offers an open source operating system (OS) for embedded-systems programmers. The embedded space is extremely diverse, with lots of Internet of Things (IoT), custom industrial, and hobbyist devices. RT-Thread's goal is to make embedded programming easy for _everyone_, regardless of what device you're using. Sometimes, that means porting an OS to a new architecture, whether for a chip of the same architecture but with slightly different instruction sets or new architectures altogether.

Approaching this problem can be a little intimidating at first—you may not know where or how to start. This article collects the lessons RT-Thread maintainers learned as we ported [RTOS][5] to new chip architectures.

### What you need to know before beginning

Here's a high-level view of a seemingly insurmountable process. This could differ for your project, but conceptually this is relatively universal, even if some of the specifics are different:

  1. Prepare a C-language execution environment
  2. Confirm that characters can be sent and received over a serial port
  3. Confirm that the context switch code works
  4. Get the hardware timers supported
  5. Confirm that the interrupt routine can receive and parse data over the serial port



### The execution model

For most advanced architectures, the OS and user applications run at different privilege levels. This prevents malfunctioning code from affecting the OS's integration and safety. For example, in the ARMv7-A architecture, the OS usually runs in the System mode, while in ARMv8-A, an OS can run at the EL2 or EL3 privilege level.

Usually, a chip executes bootup code at the highest privilege level when it's powered on. After that, though, the OS switches the privilege level to its target mode.

#### 1\. Execute C code

The key action in this step is to set the [block starting symbol][6] (.bss) section to zero and set up the stack pointers.

In C-language implementations, the uninitialized global variables and static variables are usually stored in the .bss section, which doesn't occupy any space in the storage device. When the program is loaded, the corresponding space is allocated in memory and initialized to zero. When the OS boots up, it has to do this work by itself.

On the other hand, the OS has to initialize the stack space and set up the stack pointer. Since C-language programs save and restore local variables on the stack when entering and exiting a function, the stack pointer must be set before invoking any C functions. RT-Thread has to do this step for each newly created thread.

#### 2\. Use at least one serial drive

RT-Thread outputs information and logs through the serial port, which also helps debug the code during the transplantation process. At this stage, _receiving_ data over serial ports is not required. We knew we were on the right track when we first saw our friendly, familiar RT-Thread logo over the serial port!

#### 3\. Confirm context switching logic

The context of a task is its whole execution environment, which contains generic registers, the program counter, the location of the stack frame, and so on. When a new thread is created, RT-Thread has to allocate and set up its context manually so that the scheduler can switch to the new thread, as it does with others.

There are three things to pay attention to:

  * First, when RT-Thread starts up, interrupts are disabled by default. They are enabled when the task scheduler is enabled for the first time; this process is implemented in assembly language during the context-switch period.
  * Second, the next scheduling will start when a thread exits, which is when the resources owned are reclaimed by the idle thread.
  * Third, the order that data is pushed into the stack must be consistent with the order of popping data out of the stack.



Generally, you want to enter the main function and the msh console normally. However, input control can't be achieved at this stage because serial input interrupts are not implemented. When serial interrupts are implemented, msh inputs can be made.

#### 4\. Set the timer

RT-Thread requires a timer to generate interrupts periodically; this is used to count the ticks that elapse since the system startup. The tick number is used to provide software interrupt functions and instruct the kernel when to start scheduling a task.

Setting the value of a time slice can be a tricky business. It's usually 10ms to 1ms. If you choose a small time slice on a slow CPU, most of the time is spent on task switching—to the detriment of getting anything else done.

#### 5\. Confirm serial port works correctly

In this step, we interacted with RT-Thread msh over the serial port. We sent commands, pressed Enter, and watched as msh executed the command and displayed the results.

This process is usually not difficult to implement. A word of warning, though: Don't forget to clear the interrupt flag on some platforms after the serial port interrupt is handled.

Once the serial port works correctly, the porting process is essentially done!

### Get busy

To port your project to different chip architectures, you need to be very clear about the architecture of the chip you're targeting. Get familiar with the underlying code in the most critical points of your project. By cross-referencing the chip's manual combined with a lot of practical working experience, you'll learn the chip privilege mode, register, and compilation method.

If you don't have a project you need to port to a new chip, please join us; the RT-Thread project can always use help porting RTOS to new chips! As an open source project, RT-Thread is changing the landscape of open source embedded programming. Please introduce yourself and ask for help at [RT-Thread Club][7]!

* * *

_This article is based on [How to Port Operating System to Different Chip Architecture?][8]_ _on the DEV Community and is republished with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/port-chip-architectures

作者：[Alan Smithee][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alansmithee
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BIZ_darwincloud_520x292_0311LL.png?itok=74DLgd8Q (diagram of planning a cloud)
[2]: https://opensource.com/resources/raspberry-pi
[3]: https://www.redhat.com/en/store/red-hat-enterprise-linux-developer-suite
[4]: https://opensource.com/article/20/6/open-source-rtos
[5]: https://www.rt-thread.io/
[6]: https://en.wikipedia.org/wiki/.bss
[7]: https://club.rt-thread.io/
[8]: https://dev.to/abby06/how-to-port-operating-system-to-different-chip-architecture-3od9

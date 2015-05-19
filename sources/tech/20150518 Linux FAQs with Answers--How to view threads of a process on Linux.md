Linux FAQs with Answers--How to view threads of a process on Linux
================================================================================
> **Question**: My program creates and executes multiple threads in it. How can I monitor individual threads of the program once they are created? I would like to see the details (e.g., CPU/memory usage) of individual threads with their names.

Threads are a popular programming abstraction for parallel execution on modern operating systems. When threads are forked inside a program for multiple flows of execution, these threads share certain resources (e.g., memory address space, open files) among themselves to minimize forking overhead and avoid expensive IPC (inter-process communication) channel. These properties make threads an efficient mechanism for concurrent execution.

In Linux, threads (also called Lightweight Processes (LWP)) created within a program will have the same "thread group ID" as the program's PID. Each thread will then have its own thread ID (TID). To the Linux kernel's scheduler, threads are nothing more than standard processes which happen to share certain resources. Classic command-line tools such as ps or top, which display process-level information by default, can be instructed to display thread-level information.

Here are several ways to **show threads for a process on Linux**.

### Method One: PS ###

In ps command, "-T" option enables thread views. The following command list all threads created by a process with <pid>.

    $ ps -T -p <pid>

![](https://farm8.staticflickr.com/7749/17350561110_94cacfc456_c.jpg)

The "SID" column represents thread IDs, and "CMD" column shows thread names.

### Method Two: Top ###

The top command can show a real-time view of individual threads. To enable thread views in the top output, invoke top with "-H" option. This will list all Linux threads. You can also toggle on or off thread view mode while top is running, by pressing 'H' key.

    $ top -H

![](https://farm9.staticflickr.com/8824/17350561070_3dfe447974_c.jpg)

To restrict the top output to a particular process <pid> and check all threads running inside the process:

    $ top -H -p <pid>

![](https://farm8.staticflickr.com/7797/17538002751_c8a3d574d8_c.jpg)

### Method Three: Htop ###

A more user-friendly way to view threads per process is via htop, an ncurses-based interactive process viewer. This program allows you to monitor individual threads in tree views.

To enable thread views in htop, launch htop, and press <F2> to enter htop setup menu. Choose "Display option" under "Setup" column, and toggle on "Three view" and "Show custom thread names" options. Presss <F10> to exit the setup.

![](https://farm6.staticflickr.com/5338/17350364568_59bce22e7b_b.jpg)

Now you will see the follow threaded view of individual processes.

![](https://farm9.staticflickr.com/8885/17350560930_98952d5350_c.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/view-threads-process-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
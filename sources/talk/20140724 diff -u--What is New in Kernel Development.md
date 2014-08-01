[translating by KayGuoWhu]
diff -u: What's New in Kernel Development
================================================================================
Once in a while someone points out a POSIX violation in Linux. Often the answer is to fix the violation, but sometimes Linus Torvalds decides that the POSIX behavior is broken, in which case they keep the Linux behavior, but they might build an additional POSIX compatibility layer, even if that layer is slower and less efficient.

This time, *Michael Kerrisk* reported a POSIX violation that affected file operations. Apparently, reading and writing to files during multithreaded operations could hit race conditions and overwrite each other's changes.

There was some discussion over whether this was really a violation of POSIX, but ultimately, who cares? Data clobbering is bad. After Michael posted some code to reproduce the problem, the conversation focused on what to do to fix it. But Michael did make an argument that "Linux isn't consistent with UNIX since early times. (E.g., page 191 of the 1992 edition of Stevens APUE discusses the sharing of the file offset between the parent and child after fork(). Although Stevens didn't explicitly spell out the atomicity guarantee, the discussion there would be a bit nonsensical without the presumption of that guarantee.)"

Al Viro joined Linus in trying to come up with a fix. Linus tried introducing a simple mutex to lock files so that write operations couldn't clobber each other, and Al offered his own refinements that improved on Linus' patch.

At one point, Linus explained the history of the bug itself. Apparently, once upon a time the file pointer, which told the system where to write into the file, had been locked in a semaphore so only one process could do anything to it at a time. But, they took it out of the semaphore in order to accommodate device files and other non-regular files that ran into race conditions when users were barred from writing to them whenever they pleased.

That was what introduced the bug. At the time, it slipped through undetected, because that actual reading and writing to regular files was still handled atomically by the kernel. It was only the file pointer itself that could get out of sync. And, because high-speed threaded file operations are a pretty rare need, it took a long time for anyone to run into the problem and report it.

An interesting little detail is that, while Linus and Al were hunting for a fix, Al at one point complained that the approach Linus was taking wouldn't support certain architectures, including *ARM* and *PowerPC*. Linus' response was, "I doubt it's worth caring about. [...] If the ARM/PPC people end up caring, they could add the struct-return support to gcc."

It's always interesting to see how corner cases crop up and get dealt with. In some cases, part of the fix has to happen in the kernel, part in GCC and part elsewhere. In this particular instance, Al felt the whole thing could be done in the kernel, and he was inspired to write his own version of the patch, which Linus accepted.

*Andi Kleen* wanted to add low-level CPU event support to *perf*. The problem was that there could be tons of low-level events, and it varied widely from CPU to CPU. Even storing the possible events in memory for all CPUs would significantly increase the kernel's running size. So, hard-coding this information into the kernel would be problematic.

He pointed out that the *OProfile* tool relied on publicly available lists of these events, though he said the OProfile developers didn't always keep their lists up to date with the latest available versions.

To solve these issues, Andi submitted a patch that allowed perf to identify which event-list was needed for the particular CPU on the given system, and automatically download the latest version of that list from its home location. Then perf could interpret the list and analyze the events, without overburdening the kernel.

There was various feedback to Andi's code, mostly to do with which directory should house the event-lists, and what the filenames should be called. The behavior of the code itself seemed to get a good reception. One detail that may turn out to be more controversial than the others was Andi's decision to download the lists to a subdirectory of the user's own home directory. Andi said that otherwise users might be encouraged to download the event-lists as the root user, which would be bad security practice.

Sasha Levin recently posted a script to translate the *hexadecimal offsets *from stack dumps into meaningful line numbers that pointed into the kernel's source files. So something like "ffffffff811f0ec8" might be translated into "fs/proc/generic.c:445".

However, it turned out that Linus Torvalds was planning to remove the hex offsets from the stack dumps for exactly the reason that they were unreadable. So Sasha's code was about to go out of date.

They went back and forth a bit on it. At first Sasha decided to rely on data stored in the System.map file to compensate, but Linus pointed out that some people, including him, didn't keep their System.map file around. Linus recommended using /usr/bin/nm to extract the symbols from the compiled kernel files.

So, it seems as though Sasha's script may actually provide meaningful file and line numbers for debugging stack dumps, assuming the stack dumps provide enough information to do the calculations. 

--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/diff-u-whats-new-kernel-development-0

原文作者：[Zack Brown][a]

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxjournal.com/user/801501
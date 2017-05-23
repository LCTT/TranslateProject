ictlyh Translating
Writing a Linux Debugger Part 5: Source and signals
============================================================

In the the last part we learned about DWARF information and how it can be used to read variables and associate our high-level source code with the machine code which is being executed. In this part we’ll put this into practice by implementing some DWARF primitives which will be used by the rest of our debugger. We’ll also take this opportunity to get our debugger to print out the current source context when a breakpoint is hit.

* * *

### Series index

These links will go live as the rest of the posts are released.

1.  [Setup][1]

2.  [Breakpoints][2]

3.  [Registers and memory][3]

4.  [Elves and dwarves][4]

5.  [Source and signals][5]

6.  [Source-level stepping][6]

7.  Source-level breakpoints

8.  Stack unwinding

9.  Reading variables

10.  Next steps

* * *

### Setting up our DWARF parser

As I noted way back at the start of this series, we’ll be using [`libelfin`][7] to handle our DWARF information. Hopefully you got this set up in the first post, but if not, do so now, and make sure that you use the `fbreg` branch of my fork.

Once you have `libelfin` building, it’s time to add it to our debugger. The first step is to parse the ELF executable we’re given and extract the DWARF from it. This is very easy with `libelfin`, just make these changes to `debugger`:

```
class debugger {
public:
    debugger (std::string prog_name, pid_t pid)
         : m_prog_name{std::move(prog_name)}, m_pid{pid} {
        auto fd = open(m_prog_name.c_str(), O_RDONLY);

        m_elf = elf::elf{elf::create_mmap_loader(fd)};
        m_dwarf = dwarf::dwarf{dwarf::elf::create_loader(m_elf)};
    }
    //...

private:
    //...
    dwarf::dwarf m_dwarf;
    elf::elf m_elf;
};
```

`open` is used instead of `std::ifstream` because the elf loader needs a UNIX file descriptor to pass to `mmap` so that it can just map the file into memory rather than reading it a bit at a time.

* * *

### Debug information primitives

Next we can implement functions to retrieve line entries and function DIEs from PC values. We’ll start with `get_function_from_pc`:

```
dwarf::die debugger::get_function_from_pc(uint64_t pc) {
    for (auto &cu : m_dwarf.compilation_units()) {
        if (die_pc_range(cu.root()).contains(pc)) {
            for (const auto& die : cu.root()) {
                if (die.tag == dwarf::DW_TAG::subprogram) {
                    if (die_pc_range(die).contains(pc)) {
                        return die;
                    }
                }
            }
        }
    }

    throw std::out_of_range{"Cannot find function"};
}
```

Here I take a naive approach of just iterating through compilation units until I find one which contains the program counter, then iterating through the children until we find the relevant function (`DW_TAG_subprogram`). As mentioned in the last post, you could handle things like member functions and inlining here if you wanted.

Next is `get_line_entry_from_pc`:

```
dwarf::line_table::iterator debugger::get_line_entry_from_pc(uint64_t pc) {
    for (auto &cu : m_dwarf.compilation_units()) {
        if (die_pc_range(cu.root()).contains(pc)) {
            auto &lt = cu.get_line_table();
            auto it = lt.find_address(pc);
            if (it == lt.end()) {
                throw std::out_of_range{"Cannot find line entry"};
            }
            else {
                return it;
            }
        }
    }

    throw std::out_of_range{"Cannot find line entry"};
}
```

Again, we simply find the correct compilation unit, then ask the line table to get us the relevant entry.

* * *

### Printing source

When we hit a breakpoint or step around our code, we’ll want to know where in the source we end up.

```
void debugger::print_source(const std::string& file_name, unsigned line, unsigned n_lines_context) {
    std::ifstream file {file_name};

    //Work out a window around the desired line
    auto start_line = line <= n_lines_context ? 1 : line - n_lines_context;
    auto end_line = line + n_lines_context + (line < n_lines_context ? n_lines_context - line : 0) + 1;

    char c{};
    auto current_line = 1u;
    //Skip lines up until start_line
    while (current_line != start_line && file.get(c)) {
        if (c == '\n') {
            ++current_line;
        }
    }

    //Output cursor if we're at the current line
    std::cout << (current_line==line ? "> " : "  ");

    //Write lines up until end_line
    while (current_line <= end_line && file.get(c)) {
        std::cout << c;
        if (c == '\n') {
            ++current_line;
            //Output cursor if we're at the current line
            std::cout << (current_line==line ? "> " : "  ");
        }
    }

    //Write newline and make sure that the stream is flushed properly
    std::cout << std::endl;
}
```

Now that we can print out source, we’ll need to hook this into our debugger. A good place to do this is when the debugger gets a signal from a breakpoint or (eventually) single step. While we’re at this, we might want to add some better signal handling to our debugger.

* * *

### Better signal handling

We want to be able to tell what signal was sent to the process, but we also want to know how it was produced. For example, we want to be able to tell if we just got a `SIGTRAP` because we hit a breakpoint, or if it was because a step completed, or a new thread spawned, etc. Fortunately, `ptrace` comes to our rescue again. One of the possible commands to `ptrace` is `PTRACE_GETSIGINFO`, which will give you information about the last signal which the process was sent. We use it like so:

```
siginfo_t debugger::get_signal_info() {
    siginfo_t info;
    ptrace(PTRACE_GETSIGINFO, m_pid, nullptr, &info);
    return info;
}
```

This gives us a `siginfo_t` object, which provides the following information:

```
siginfo_t {
    int      si_signo;     /* Signal number */
    int      si_errno;     /* An errno value */
    int      si_code;      /* Signal code */
    int      si_trapno;    /* Trap number that caused
                              hardware-generated signal
                              (unused on most architectures) */
    pid_t    si_pid;       /* Sending process ID */
    uid_t    si_uid;       /* Real user ID of sending process */
    int      si_status;    /* Exit value or signal */
    clock_t  si_utime;     /* User time consumed */
    clock_t  si_stime;     /* System time consumed */
    sigval_t si_value;     /* Signal value */
    int      si_int;       /* POSIX.1b signal */
    void    *si_ptr;       /* POSIX.1b signal */
    int      si_overrun;   /* Timer overrun count;
                              POSIX.1b timers */
    int      si_timerid;   /* Timer ID; POSIX.1b timers */
    void    *si_addr;      /* Memory location which caused fault */
    long     si_band;      /* Band event (was int in
                              glibc 2.3.2 and earlier) */
    int      si_fd;        /* File descriptor */
    short    si_addr_lsb;  /* Least significant bit of address
                              (since Linux 2.6.32) */
    void    *si_lower;     /* Lower bound when address violation
                              occurred (since Linux 3.19) */
    void    *si_upper;     /* Upper bound when address violation
                              occurred (since Linux 3.19) */
    int      si_pkey;      /* Protection key on PTE that caused
                              fault (since Linux 4.6) */
    void    *si_call_addr; /* Address of system call instruction
                              (since Linux 3.5) */
    int      si_syscall;   /* Number of attempted system call
                              (since Linux 3.5) */
    unsigned int si_arch;  /* Architecture of attempted system call
                              (since Linux 3.5) */
}
```

I’ll just be using `si_signo` to work out which signal was sent, and `si_code` to get more information about the signal. The best place to put this code is in our `wait_for_signal` function:

```
void debugger::wait_for_signal() {
    int wait_status;
    auto options = 0;
    waitpid(m_pid, &wait_status, options);

    auto siginfo = get_signal_info();

    switch (siginfo.si_signo) {
    case SIGTRAP:
        handle_sigtrap(siginfo);
        break;
    case SIGSEGV:
        std::cout << "Yay, segfault. Reason: " << siginfo.si_code << std::endl;
        break;
    default:
        std::cout << "Got signal " << strsignal(siginfo.si_signo) << std::endl;
    }
}
```

Now to handle `SIGTRAP`s. It suffices to know that `SI_KERNEL` or `TRAP_BRKPT` will be sent when a breakpoint is hit, and `TRAP_TRACE` will be sent on single step completion:

```
void debugger::handle_sigtrap(siginfo_t info) {
    switch (info.si_code) {
    //one of these will be set if a breakpoint was hit
    case SI_KERNEL:
    case TRAP_BRKPT:
    {
        set_pc(get_pc()-1); //put the pc back where it should be
        std::cout << "Hit breakpoint at address 0x" << std::hex << get_pc() << std::endl;
        auto line_entry = get_line_entry_from_pc(get_pc());
        print_source(line_entry->file->path, line_entry->line);
        return;
    }
    //this will be set if the signal was sent by single stepping
    case TRAP_TRACE:
        return;
    default:
        std::cout << "Unknown SIGTRAP code " << info.si_code << std::endl;
        return;
    }
}
```

There are a bunch of different signals and flavours of signals which you could handle. See `man sigaction` for more information.

Since we now correct the program counter when we get the `SIGTRAP`, we can remove this coded from `step_over_breakpoint`, so it now looks like:

```
void debugger::step_over_breakpoint() {
    if (m_breakpoints.count(get_pc())) {
        auto& bp = m_breakpoints[get_pc()];
        if (bp.is_enabled()) {
            bp.disable();
            ptrace(PTRACE_SINGLESTEP, m_pid, nullptr, nullptr);
            wait_for_signal();
            bp.enable();
        }
    }
}
```

* * *

### Testing it out

Now you should be able to set a breakpoint at some address, run the program and see the source code printed out with the currently executing line marked with a cursor.

Next time we’ll be adding the ability to set source-level breakpoints. In the meantime, you can get the code for this post [here][8].

--------------------------------------------------------------------------------

via: https://blog.tartanllama.xyz/c++/2017/04/24/writing-a-linux-debugger-source-signal/

作者：[TartanLlama ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.twitter.com/TartanLlama
[1]:https://blog.tartanllama.xyz/2017/03/21/writing-a-linux-debugger-setup/
[2]:https://blog.tartanllama.xyz/c++/2017/03/24/writing-a-linux-debugger-breakpoints/
[3]:https://blog.tartanllama.xyz/c++/2017/03/31/writing-a-linux-debugger-registers/
[4]:https://blog.tartanllama.xyz/c++/2017/04/05/writing-a-linux-debugger-elf-dwarf/
[5]:https://blog.tartanllama.xyz/c++/2017/04/24/writing-a-linux-debugger-source-signal/
[6]:https://blog.tartanllama.xyz/c++/2017/05/06/writing-a-linux-debugger-dwarf-step/
[7]:https://github.com/TartanLlama/libelfin/tree/fbreg
[8]:https://github.com/TartanLlama/minidbg/tree/tut_source

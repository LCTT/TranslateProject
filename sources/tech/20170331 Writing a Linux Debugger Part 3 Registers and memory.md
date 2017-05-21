Writing a Linux Debugger Part 3: Registers and memory
============================================================ 

In the last post we added simple address breakpoints to our debugger. This time we’ll be adding the ability to read and write registers and memory, which will allow us to screw around with our program counter, observe state and change the behaviour of our program.

* * *

### Series index

These links will go live as the rest of the posts are released.

1.  [Setup][3]

2.  [Breakpoints][4]

3.  [Registers and memory][5]

4.  [Elves and dwarves][6]

5.  [Source and signals][7]

6.  [Source-level stepping][8]

7.  Source-level breakpoints

8.  Stack unwinding

9.  Reading variables

10.  Next steps

* * *

### Registering our registers

Before we actually read any registers, we need to teach our debugger a bit about our target, which is x86_64\. Alongside sets of general and special purpose registers, x86_64 has floating point and vector registers available. I’ll be omitting the latter two for simplicity, but you can choose to support them if you like. x86_64 also allows you to access some 64 bit registers as 32, 16, or 8 bit registers, but I’ll just be sticking to 64\. Due to these simplifications, for each register we just need its name, its DWARF register number, and where it is stored in the structure returned by `ptrace`. I chose to have a scoped enum for referring to the registers, then I laid out a global register descriptor array with the elements in the same order as in the `ptrace` register structure.

```
enum class reg {
    rax, rbx, rcx, rdx,
    rdi, rsi, rbp, rsp,
    r8,  r9,  r10, r11,
    r12, r13, r14, r15,
    rip, rflags,    cs,
    orig_rax, fs_base,
    gs_base,
    fs, gs, ss, ds, es
};

constexpr std::size_t n_registers = 27;

struct reg_descriptor {
    reg r;
    int dwarf_r;
    std::string name;
};

const std::array<reg_descriptor, n_registers> g_register_descriptors {{
    { reg::r15, 15, "r15" },
    { reg::r14, 14, "r14" },
    { reg::r13, 13, "r13" },
    { reg::r12, 12, "r12" },
    { reg::rbp, 6, "rbp" },
    { reg::rbx, 3, "rbx" },
    { reg::r11, 11, "r11" },
    { reg::r10, 10, "r10" },
    { reg::r9, 9, "r9" },
    { reg::r8, 8, "r8" },
    { reg::rax, 0, "rax" },
    { reg::rcx, 2, "rcx" },
    { reg::rdx, 1, "rdx" },
    { reg::rsi, 4, "rsi" },
    { reg::rdi, 5, "rdi" },
    { reg::orig_rax, -1, "orig_rax" },
    { reg::rip, -1, "rip" },
    { reg::cs, 51, "cs" },
    { reg::rflags, 49, "eflags" },
    { reg::rsp, 7, "rsp" },
    { reg::ss, 52, "ss" },
    { reg::fs_base, 58, "fs_base" },
    { reg::gs_base, 59, "gs_base" },
    { reg::ds, 53, "ds" },
    { reg::es, 50, "es" },
    { reg::fs, 54, "fs" },
    { reg::gs, 55, "gs" },
}};
```

You can typically find the register data structure in `/usr/include/sys/user.h` if you’d like to look at it yourself, and the DWARF register numbers are taken from the [System V x86_64 ABI][11].

Now we can write a bunch of functions to interact with registers. We’d like to be able to read registers, write to them, retrieve a value from a DWARF register number, and lookup registers by name and vice versa. Let’s start with implementing `get_register_value`:

```
uint64_t get_register_value(pid_t pid, reg r) {
    user_regs_struct regs;
    ptrace(PTRACE_GETREGS, pid, nullptr, &regs);
    //...
}
```

Again, `ptrace` gives us easy access to the data we want. We just construct an instance of `user_regs_struct` and give that to `ptrace` alongside the `PTRACE_GETREGS` request.

Now we want to read `regs` depending on which register was requested. We could write a big switch statement, but since we’ve laid out our `g_register_descriptors` table in the same order as `user_regs_struct`, we can just search for the index of the register descriptor, and access `user_regs_struct` as an array of `uint64_t`s.[1][9]

```
        auto it = std::find_if(begin(g_register_descriptors), end(g_register_descriptors),
                               [r](auto&& rd) { return rd.r == r; });

        return *(reinterpret_cast<uint64_t*>(&regs) + (it - begin(g_register_descriptors)));
```

The cast to `uint64_t` is safe because `user_regs_struct` is a standard layout type, but I think the pointer arithmetic is technically UB. No current compilers even warn about this and I’m lazy, but if you want to maintain utmost correctness, write a big switch statement.

`set_register_value` is much the same, we just write to the location and write the registers back at the end:

```
void set_register_value(pid_t pid, reg r, uint64_t value) {
    user_regs_struct regs;
    ptrace(PTRACE_GETREGS, pid, nullptr, &regs);
    auto it = std::find_if(begin(g_register_descriptors), end(g_register_descriptors),
                           [r](auto&& rd) { return rd.r == r; });

    *(reinterpret_cast<uint64_t*>(&regs) + (it - begin(g_register_descriptors))) = value;
    ptrace(PTRACE_SETREGS, pid, nullptr, &regs);
}
```

Next is lookup by DWARF register number. This time I’ll actually check for an error condition just in case we get some weird DWARF information:

```
uint64_t get_register_value_from_dwarf_register (pid_t pid, unsigned regnum) {
    auto it = std::find_if(begin(g_register_descriptors), end(g_register_descriptors),
                           [regnum](auto&& rd) { return rd.dwarf_r == regnum; });
    if (it == end(g_register_descriptors)) {
        throw std::out_of_range{"Unknown dwarf register"};
    }

    return get_register_value(pid, it->r);
}
```

Nearly finished, now he have register name lookups:

```
std::string get_register_name(reg r) {
    auto it = std::find_if(begin(g_register_descriptors), end(g_register_descriptors),
                           [r](auto&& rd) { return rd.r == r; });
    return it->name;
}

reg get_register_from_name(const std::string& name) {
    auto it = std::find_if(begin(g_register_descriptors), end(g_register_descriptors),
                           [name](auto&& rd) { return rd.name == name; });
    return it->r;
}
```

And finally we’ll add a simple helper to dump the contents of all registers:

```
void debugger::dump_registers() {
    for (const auto& rd : g_register_descriptors) {
        std::cout << rd.name << " 0x"
                  << std::setfill('0') << std::setw(16) << std::hex << get_register_value(m_pid, rd.r) << std::endl;
    }
}
```

As you can see, iostreams has a very concise interface for outputting hex data nicely[2][10]. Feel free to make an I/O manipulator to get rid of this mess if you like.

This gives us enough support to handle registers easily in the rest of the debugger, so we can now add this to our UI.

* * *

### Exposing our registers

All we need to do here is add a new command to the `handle_command` function. With the following code, users will be able to type `register read rax`, `register write rax 0x42` and so on.

```
    else if (is_prefix(command, "register")) {
        if (is_prefix(args[1], "dump")) {
            dump_registers();
        }
        else if (is_prefix(args[1], "read")) {
            std::cout << get_register_value(m_pid, get_register_from_name(args[2])) << std::endl;
        }
        else if (is_prefix(args[1], "write")) {
            std::string val {args[3], 2}; //assume 0xVAL
            set_register_value(m_pid, get_register_from_name(args[2]), std::stol(val, 0, 16));
        }
    }
```

* * *

### Where is my mind?

We’ve already read from and written to memory when setting our breakpoints, so we just need to add a couple of functions to hide the `ptrace` call a bit.

```
uint64_t debugger::read_memory(uint64_t address) {
    return ptrace(PTRACE_PEEKDATA, m_pid, address, nullptr);
}

void debugger::write_memory(uint64_t address, uint64_t value) {
    ptrace(PTRACE_POKEDATA, m_pid, address, value);
}
```

You might want to add support for reading and writing more than a word at a time, which you can do by just incrementing the address each time you want to read another word. You could also use [`process_vm_readv` and `process_vm_writev`][12] or `/proc/<pid>/mem` instead of `ptrace` if you like.

Now we’ll add commands for our UI:

```
    else if(is_prefix(command, "memory")) {
        std::string addr {args[2], 2}; //assume 0xADDRESS

        if (is_prefix(args[1], "read")) {
            std::cout << std::hex << read_memory(std::stol(addr, 0, 16)) << std::endl;
        }
        if (is_prefix(args[1], "write")) {
            std::string val {args[3], 2}; //assume 0xVAL
            write_memory(std::stol(addr, 0, 16), std::stol(val, 0, 16));
        }
    }
```

* * *

### Patching `continue_execution`

Before we test out our changes, we’re now in a position to implement a more sane version of `continue_execution`. Since we can get the program counter, we can check our breakpoint map to see if we’re at a breakpoint. If so, we can disable the breakpoint and step over it before continuing.

First we’ll add for couple of helper functions for clarity and brevity:

```
uint64_t debugger::get_pc() {
    return get_register_value(m_pid, reg::rip);
}

void debugger::set_pc(uint64_t pc) {
    set_register_value(m_pid, reg::rip, pc);
}
```

Then we can write a function to step over a breakpoint:

```
void debugger::step_over_breakpoint() {
    // - 1 because execution will go past the breakpoint
    auto possible_breakpoint_location = get_pc() - 1;

    if (m_breakpoints.count(possible_breakpoint_location)) {
        auto& bp = m_breakpoints[possible_breakpoint_location];

        if (bp.is_enabled()) {
            auto previous_instruction_address = possible_breakpoint_location;
            set_pc(previous_instruction_address);

            bp.disable();
            ptrace(PTRACE_SINGLESTEP, m_pid, nullptr, nullptr);
            wait_for_signal();
            bp.enable();
        }
    }
}
```

First we check to see if there’s a breakpoint set for the value of the current PC. If there is, we first put execution back to before the breakpoint, disable it, step over the original instruction, and re-enable the breakpoint.

`wait_for_signal` will encapsulate our usual `waitpid` pattern:

```
void debugger::wait_for_signal() {
    int wait_status;
    auto options = 0;
    waitpid(m_pid, &wait_status, options);
}
```

Finally we rewrite `continue_execution` like this:

```
void debugger::continue_execution() {
    step_over_breakpoint();
    ptrace(PTRACE_CONT, m_pid, nullptr, nullptr);
    wait_for_signal();
}
```

* * *

### Testing it out

Now that we can read and modify registers, we can have a bit of fun with our hello world program. As a first test, try setting a breakpoint on the call instruction again and continue from it. You should see `Hello world` being printed out. For the fun part, set a breakpoint just after the output call, continue, then write the address of the call argument setup code to the program counter (`rip`) and continue. You should see `Hello world` being printed a second time due to this program counter manipulation. Just in case you aren’t sure where to set the breakpoint, here’s my `objdump` output from the last post again:

```
0000000000400936 <main>:
  400936:	55                   	push   rbp
  400937:	48 89 e5             	mov    rbp,rsp
  40093a:	be 35 0a 40 00       	mov    esi,0x400a35
  40093f:	bf 60 10 60 00       	mov    edi,0x601060
  400944:	e8 d7 fe ff ff       	call   400820 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
  400949:	b8 00 00 00 00       	mov    eax,0x0
  40094e:	5d                   	pop    rbp
  40094f:	c3                   	ret

```

You’ll want to move the program counter back to `0x40093a` so that the `esi` and `edi` registers are set up properly.

In the next post, we’ll take our first look at DWARF information and add various kinds of single stepping to our debugger. After that, we’ll have a mostly functioning tool which can step through code, set breakpoints wherever we like, modify data and so forth. As always, drop a comment below if you have any questions!

You can find the code for this post [here][13].

* * *

1.  You could also reorder the `reg` enum and cast them to the underlying type to use as indexes, but I wrote it this way in the first place, it works, and I’m too lazy to change it. [↩][1]

2.  Ahahahahahahahahahahahahahahahaha [↩][2]

--------------------------------------------------------------------------------

via: https://blog.tartanllama.xyz/c++/2017/03/31/writing-a-linux-debugger-registers/

作者：[ TartanLlama ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.twitter.com/TartanLlama
[1]:https://blog.tartanllama.xyz/c++/2017/03/31/writing-a-linux-debugger-registers/#fnref:2
[2]:https://blog.tartanllama.xyz/c++/2017/03/31/writing-a-linux-debugger-registers/#fnref:1
[3]:https://blog.tartanllama.xyz/2017/03/21/writing-a-linux-debugger-setup/
[4]:https://blog.tartanllama.xyz/c++/2017/03/24/writing-a-linux-debugger-breakpoints/
[5]:https://blog.tartanllama.xyz/c++/2017/03/31/writing-a-linux-debugger-registers/
[6]:https://blog.tartanllama.xyz/c++/2017/04/05/writing-a-linux-debugger-elf-dwarf/
[7]:https://blog.tartanllama.xyz/c++/2017/04/24/writing-a-linux-debugger-source-signal/
[8]:https://blog.tartanllama.xyz/c++/2017/05/06/writing-a-linux-debugger-dwarf-step/
[9]:https://blog.tartanllama.xyz/c++/2017/03/31/writing-a-linux-debugger-registers/#fn:2
[10]:https://blog.tartanllama.xyz/c++/2017/03/31/writing-a-linux-debugger-registers/#fn:1
[11]:https://www.uclibc.org/docs/psABI-x86_64.pdf
[12]:http://man7.org/linux/man-pages/man2/process_vm_readv.2.html
[13]:https://github.com/TartanLlama/minidbg/tree/tut_registers

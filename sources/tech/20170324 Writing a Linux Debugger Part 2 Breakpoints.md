icltyh Translating
Writing a Linux Debugger Part 2: Breakpoints
============================================================

In the first part of this series we wrote a small process launcher as a base for our debugger. In this post we’ll learn how breakpoints work in x86 Linux and augment our tool with the ability to set them.

* * *

### Series index

These links will go live as the rest of the posts are released.

1.  [Setup][1]
2.  [Breakpoints][2]
3.  Registers and memory
4.  Elves and dwarves
5.  Stepping, source and signals
6.  Stepping on dwarves
7.  Source-level breakpoints
8.  Stack unwinding
9.  Reading variables
10.  Next steps

* * *

### How is breakpoint formed?

There are two main kinds of breakpoints: hardware and software. Hardware breakpoints typically involve setting architecture-specific registers to produce your breaks for you, whereas software breakpoints involve modifying the code which is being executed on the fly. We’ll be focusing solely on software breakpoints for this article, as they are simpler and you can have as many as you want. On x86 you can only have four hardware breakpoints set at a given time, but they give you the power to make them fire on just reading from or writing to a given address rather than only executing code there.

I said above that software breakpoints are set by modifying the executing code on the fly, so the questions are:

*   How do we modify the code?
*   What modifications do we make to set a breakpoint?
*   How is the debugger notified?

The answer to the first question is, of course, `ptrace`. We’ve previously used it to set up our program for tracing and continuing its execution, but we can also use it to read and write memory.

The modification we make has to cause the processor to halt and signal the program when the breakpoint address is executed. On x86 this is accomplished by overwriting the instruction at that address with the `int 3` instruction. x86 has an  _interrupt vector table_  which the operating system can use to register handlers for various events, such as page faults, protection faults, and invalid opcodes. It’s kind of like registering error handling callbacks, but right down at the hardware level. When the processor executes the `int 3` instruction, control is passed to the breakpoint interrupt handler, which – in the case of Linux – signals the process with a `SIGTRAP`. You can see this process in the diagram below, where we overwrite the first byte of the `mov` instruction with `0xcc`, which is the instruction encoding for `int 3`.

 ![breakpoint](http://blog.tartanllama.xyz/assets/breakpoint.png) 

The last piece of the puzzle is how the debugger is notified of the break. If you remember back in the previous post, we can use `waitpid` to listen for signals which are sent to the debugee. We can do exactly the same thing here: set the breakpoint, continue the program, call `waitpid` and wait until the `SIGTRAP`occurs. This breakpoint can then be communicated to the user, perhaps by printing the source location which has been reached, or changing the focused line in a GUI debugger.

* * *

### Implementing software breakpoints

We’ll implement a `breakpoint` class to represent a breakpoint on some location which we can enable or disable as we wish.

```
class breakpoint {
public:
    breakpoint(pid_t pid, std::intptr_t addr)
        : m_pid{pid}, m_addr{addr}, m_enabled{false}, m_saved_data{}
    {}

    void enable();
    void disable();

    auto is_enabled() const -> bool { return m_enabled; }
    auto get_address() const -> std::intptr_t { return m_addr; }

private:
    pid_t m_pid;
    std::intptr_t m_addr;
    bool m_enabled;
    uint64_t m_saved_data; //data which used to be at the breakpoint address
};
```

Most of this is just tracking of state; the real magic happens in the `enable` and `disable` functions.

As we’ve learned above, we need to replace the instruction which is currently at the given address with an `int 3`instruction, which is encoded as `0xcc`. We’ll also want to save out what used to be at that address so that we can restore the code later; we don’t want to just forget to execute the user’s code!

```
void breakpoint::enable() {
    m_saved_data = ptrace(PTRACE_PEEKDATA, m_pid, m_addr, nullptr);
    uint64_t int3 = 0xcc;
    uint64_t data_with_int3 = ((m_saved_data & ~0xff) | int3); //set bottom byte to 0xcc
    ptrace(PTRACE_POKEDATA, m_pid, m_addr, data_with_int3);

    m_enabled = true;
}
```

The `PTRACE_PEEKDATA` request to `ptrace` is how to read the memory of the traced process. We give it a process ID and an address, and it gives us back the 64 bits which are currently at that address. `(m_saved_data & ~0xff)` zeroes out the bottom byte of this data, then we bitwise `OR` that with our `int 3` instruction to set the breakpoint. Finally, we set the breakpoint by overwriting that part of memory with our new data with `PTRACE_POKEDATA`.

The implementation of `disable` is easier, as we simply need to restore the original data which we overwrote with `0xcc`.

```
void breakpoint::disable() {
    ptrace(PTRACE_POKEDATA, m_pid, m_addr, m_saved_data);
    m_enabled = false;
}
```

* * *

### Adding breakpoints to the debugger

We’ll make three changes to our debugger class to support setting breakpoints through the user interface:

1.  Add a breakpoint storage data structure to `debugger`
2.  Write a `set_breakpoint_at_address` function
3.  Add a `break` command to our `handle_command` function

I’ll store my breakpoints in a `std::unordered_map<std::intptr_t, breakpoint>` structure so that it’s easy and fast to check if a given address has a breakpoint on it and, if so, retrieve that breakpoint object.

```
class debugger {
    //...
    void set_breakpoint_at_address(std::intptr_t addr);
    //...
private:
    //...
    std::unordered_map<std::intptr_t,breakpoint> m_breakpoints;
}
```

In `set_breakpoint_at_address` we’ll create a new breakpoint, enable it, add it to the data structure, and print out a message for the user. If you like, you could factor out all message printing so that you can use the debugger as a library as well as a command-line tool, but I’ll mash it all together for simplicity.

```
void debugger::set_breakpoint_at_address(std::intptr_t addr) {
    std::cout << "Set breakpoint at address 0x" << std::hex << addr << std::endl;
    breakpoint bp {m_pid, addr};
    bp.enable();
    m_breakpoints[addr] = bp;
}
```

Now we’ll augment our command handler to call our new function.

```
void debugger::handle_command(const std::string& line) {
    auto args = split(line,' ');
    auto command = args[0];

    if (is_prefix(command, "cont")) {
        continue_execution();
    }
    else if(is_prefix(command, "break")) {
        std::string addr {args[1], 2}; //naively assume that the user has written 0xADDRESS
        set_breakpoint_at_address(std::stol(addr, 0, 16));
    }
    else {
        std::cerr << "Unknown command\n";
    }
}
```

I’ve simply removed the first two characters of the string and called `std::stol` on the result, but feel free to make the parsing more robust. `std::stol` optionally takes a radix to convert from, which is handy for reading in hexadecimal.

* * *

### Continuing from the breakpoint

If you try this out, you might notice that if you continue from the breakpoint, nothing happens. That’s because the breakpoint is still set in memory, so it’s just hit repeatedly. The simple solution is to just disable the breakpoint, single step, re-enable it, then continue. Unfortunately we’d also need to modify the program counter to point back before the breakpoint, so we’ll leave this until the next post where we’ll learn about manipulating registers.

* * *

### Testing it out

Of course, setting a breakpoint on some address isn’t very useful if you don’t know what address to set it at. In the future we’ll be adding the ability to set breakpoints on function names or source code lines, but for now, we can work it out manually.

A simple way to test out your debugger is to write a hello world program which writes to `std::cerr` (to avoid buffering) and set a breakpoint on the call to the output operator. If you continue the debugee then hopefully the execution will stop without printing anything. You can then restart the debugger and set a breakpoint just after the call, and you should see the message being printed successfully.

One way to find the address is to use `objdump`. If you open up a shell and execute `objdump -d <your program>`, then you should see the disassembly for your code. You should then be able to find the `main` function and locate the `call` instruction which you want to set the breakpoint on. For example, I built a hello world example, disassembled it, and got this as the disassembly for `main`:

```
0000000000400936 <main>:
  400936:	55                   	push   %rbp
  400937:	48 89 e5             	mov    %rsp,%rbp
  40093a:	be 35 0a 40 00       	mov    $0x400a35,%esi
  40093f:	bf 60 10 60 00       	mov    $0x601060,%edi
  400944:	e8 d7 fe ff ff       	callq  400820 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
  400949:	b8 00 00 00 00       	mov    $0x0,%eax
  40094e:	5d                   	pop    %rbp
  40094f:	c3                   	retq
```

As you can see, we would want to set a breakpoint on `0x400944`to see no output, and `0x400949` to see the output.

* * *

### Finishing up

You should now have a debugger which can launch a program and allow the user to set breakpoints on memory addresses. Next time we’ll add the ability to read from and write to memory and registers. Again, let me know in the comments if you have any issues.

You can find the code for this post [here][3].

--------------------------------------------------------------------------------

via: http://blog.tartanllama.xyz/c++/2017/03/24/writing-a-linux-debugger-breakpoints/

作者：[Simon Brand ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://blog.tartanllama.xyz/
[1]:http://blog.tartanllama.xyz/c++/2017/03/21/writing-a-linux-debugger-setup/
[2]:http://blog.tartanllama.xyz/c++/2017/03/24/writing-a-linux-debugger-breakpoints/
[3]:https://github.com/TartanLlama/minidbg/tree/tut_break

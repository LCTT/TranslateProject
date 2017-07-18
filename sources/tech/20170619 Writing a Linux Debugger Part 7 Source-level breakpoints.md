Writing a Linux Debugger Part 7: Source-level breakpoints
============================================================

Setting breakpoints on memory addresses is all well and good, but it doesn’t provide the most user-friendly tool. We’d like to be able to set breakpoints on source lines and function entry addresses as well, so that we can debug at the same abstraction level as our code.

This post will add source-level breakpoints to our debugger. With all of the support we already have available to us, this is a lot easier than it may first sound. We’ll also add a command to get the type and address of a symbol, which can be useful for locating code or data and understanding linking concepts.

* * *

### Series index

These links will go live as the rest of the posts are released.

1.  [Setup][1]

2.  [Breakpoints][2]

3.  [Registers and memory][3]

4.  [Elves and dwarves][4]

5.  [Source and signals][5]

6.  [Source-level stepping][6]

7.  [Source-level breakpoints][7]

8.  [Stack unwinding][8]

9.  Reading variables

10.  Next steps

* * *

### Breakpoints

### DWARF

The [Elves and dwarves][9] post described how DWARF debug information works and how it can be used to map the machine code back to the high-level source. Recall that DWARF contains the address ranges of functions and a line table which lets you translate code positions between abstraction levels. We’ll be using these capabilities to implement our breakpoints.

### Function entry

Setting breakpoints on function names can be complex if you want to take overloading, member functions and such into account, but we’re going to iterate through all of the compilation units and search for functions with names which match what we’re looking for. The DWARF information will look something like this:

```
< 0><0x0000000b>  DW_TAG_compile_unit
                    DW_AT_producer              clang version 3.9.1 (tags/RELEASE_391/final)
                    DW_AT_language              DW_LANG_C_plus_plus
                    DW_AT_name                  /super/secret/path/MiniDbg/examples/variable.cpp
                    DW_AT_stmt_list             0x00000000
                    DW_AT_comp_dir              /super/secret/path/MiniDbg/build
                    DW_AT_low_pc                0x00400670
                    DW_AT_high_pc               0x0040069c

LOCAL_SYMBOLS:
< 1><0x0000002e>    DW_TAG_subprogram
                      DW_AT_low_pc                0x00400670
                      DW_AT_high_pc               0x0040069c
                      DW_AT_name                  foo
                      ...
...
<14><0x000000b0>    DW_TAG_subprogram
                      DW_AT_low_pc                0x00400700
                      DW_AT_high_pc               0x004007a0
                      DW_AT_name                  bar
                      ...

```

We want to match against `DW_AT_name` and use `DW_AT_low_pc`(the start address of the function) to set our breakpoint.

```
void debugger::set_breakpoint_at_function(const std::string& name) {
    for (const auto& cu : m_dwarf.compilation_units()) {
        for (const auto& die : cu.root()) {
            if (die.has(dwarf::DW_AT::name) && at_name(die) == name) {
                auto low_pc = at_low_pc(die);
                auto entry = get_line_entry_from_pc(low_pc);
                ++entry; //skip prologue
                set_breakpoint_at_address(entry->address);
            }
        }
    }
}
```

The only bit of that code which looks a bit weird is the `++entry`. The problem is that the `DW_AT_low_pc` for a function doesn’t point at the start of the user code for that function, it points to the start of the prologue. The compiler will usually output a prologue and epilogue for a function which carries out saving and restoring registers, manipulating the stack pointer and suchlike. This isn’t very useful for us, so we increment the line entry by one to get the first line of the user code instead of the prologue. The DWARF line table actually has some functionality to mark an entry as the first line after the function prologue, but not all compilers output this, so I’ve taken the naive approach.

### Source line

To set a breakpoint on a high-level source line, we translate this line number into an address by looking it up in the DWARF. We’ll iterate through the compilation units looking for one whose name matches the given file, then look for the entry which corresponds to the given line.

The DWARF will look something like this:

```
.debug_line: line number info for a single cu
Source lines (from CU-DIE at .debug_info offset 0x0000000b):

NS new statement, BB new basic block, ET end of text sequence
PE prologue end, EB epilogue begin
IS=val ISA number, DI=val discriminator value
<pc>        [lno,col] NS BB ET PE EB IS= DI= uri: "filepath"
0x004004a7  [   1, 0] NS uri: "/super/secret/path/a.hpp"
0x004004ab  [   2, 0] NS
0x004004b2  [   3, 0] NS
0x004004b9  [   4, 0] NS
0x004004c1  [   5, 0] NS
0x004004c3  [   1, 0] NS uri: "/super/secret/path/b.hpp"
0x004004c7  [   2, 0] NS
0x004004ce  [   3, 0] NS
0x004004d5  [   4, 0] NS
0x004004dd  [   5, 0] NS
0x004004df  [   4, 0] NS uri: "/super/secret/path/ab.cpp"
0x004004e3  [   5, 0] NS
0x004004e8  [   6, 0] NS
0x004004ed  [   7, 0] NS
0x004004f4  [   7, 0] NS ET

```

So if we want to set a breakpoint on line 5 of `ab.cpp`, we look up the entry which corresponds to that line (`0x004004e3`) and set a breakpoint there.

```
void debugger::set_breakpoint_at_source_line(const std::string& file, unsigned line) {
    for (const auto& cu : m_dwarf.compilation_units()) {
        if (is_suffix(file, at_name(cu.root()))) {
            const auto& lt = cu.get_line_table();

            for (const auto& entry : lt) {
                if (entry.is_stmt && entry.line == line) {
                    set_breakpoint_at_address(entry.address);
                    return;
                }
            }
        }
    }
}
```

My `is_suffix` hack is there so you can type `c.cpp` for `a/b/c.cpp`. Of course you should actually use a sensible path handling library or something; I’m lazy. The `entry.is_stmt` is checking that the line table entry is marked as the beginning of a statement, which is set by the compiler on the address it thinks is the best target for a breakpoint.

* * *

### Symbol lookup

When we get down to the level of object files, symbols are king. Functions are named with symbols, global variables are named with symbols, you get a symbol, we get a symbol, everyone gets a symbol. In a given object file, some symbols might reference other object files or shared libraries, where the linker will patch things up to create an executable program from the symbol reference spaghetti.

Symbols can be looked up in the aptly-named symbol table, which is stored in ELF sections in the binary. Fortunately, `libelfin` has a fairly nice interface for doing this, so we don’t need to deal with all of the ELF nonsense ourselves. To give you an idea of what we’re dealing with, here is a dump of the `.symtab` section of a binary, produced with `readelf`:

```
Num:    Value          Size Type    Bind   Vis      Ndx Name
 0: 0000000000000000     0 NOTYPE  LOCAL  DEFAULT  UND
 1: 0000000000400238     0 SECTION LOCAL  DEFAULT    1
 2: 0000000000400254     0 SECTION LOCAL  DEFAULT    2
 3: 0000000000400278     0 SECTION LOCAL  DEFAULT    3
 4: 00000000004002c8     0 SECTION LOCAL  DEFAULT    4
 5: 0000000000400430     0 SECTION LOCAL  DEFAULT    5
 6: 00000000004004e4     0 SECTION LOCAL  DEFAULT    6
 7: 0000000000400508     0 SECTION LOCAL  DEFAULT    7
 8: 0000000000400528     0 SECTION LOCAL  DEFAULT    8
 9: 0000000000400558     0 SECTION LOCAL  DEFAULT    9
10: 0000000000400570     0 SECTION LOCAL  DEFAULT   10
11: 0000000000400714     0 SECTION LOCAL  DEFAULT   11
12: 0000000000400720     0 SECTION LOCAL  DEFAULT   12
13: 0000000000400724     0 SECTION LOCAL  DEFAULT   13
14: 0000000000400750     0 SECTION LOCAL  DEFAULT   14
15: 0000000000600e18     0 SECTION LOCAL  DEFAULT   15
16: 0000000000600e20     0 SECTION LOCAL  DEFAULT   16
17: 0000000000600e28     0 SECTION LOCAL  DEFAULT   17
18: 0000000000600e30     0 SECTION LOCAL  DEFAULT   18
19: 0000000000600ff0     0 SECTION LOCAL  DEFAULT   19
20: 0000000000601000     0 SECTION LOCAL  DEFAULT   20
21: 0000000000601018     0 SECTION LOCAL  DEFAULT   21
22: 0000000000601028     0 SECTION LOCAL  DEFAULT   22
23: 0000000000000000     0 SECTION LOCAL  DEFAULT   23
24: 0000000000000000     0 SECTION LOCAL  DEFAULT   24
25: 0000000000000000     0 SECTION LOCAL  DEFAULT   25
26: 0000000000000000     0 SECTION LOCAL  DEFAULT   26
27: 0000000000000000     0 SECTION LOCAL  DEFAULT   27
28: 0000000000000000     0 SECTION LOCAL  DEFAULT   28
29: 0000000000000000     0 SECTION LOCAL  DEFAULT   29
30: 0000000000000000     0 SECTION LOCAL  DEFAULT   30
31: 0000000000000000     0 FILE    LOCAL  DEFAULT  ABS init.c
32: 0000000000000000     0 FILE    LOCAL  DEFAULT  ABS crtstuff.c
33: 0000000000600e28     0 OBJECT  LOCAL  DEFAULT   17 __JCR_LIST__
34: 00000000004005a0     0 FUNC    LOCAL  DEFAULT   10 deregister_tm_clones
35: 00000000004005e0     0 FUNC    LOCAL  DEFAULT   10 register_tm_clones
36: 0000000000400620     0 FUNC    LOCAL  DEFAULT   10 __do_global_dtors_aux
37: 0000000000601028     1 OBJECT  LOCAL  DEFAULT   22 completed.6917
38: 0000000000600e20     0 OBJECT  LOCAL  DEFAULT   16 __do_global_dtors_aux_fin
39: 0000000000400640     0 FUNC    LOCAL  DEFAULT   10 frame_dummy
40: 0000000000600e18     0 OBJECT  LOCAL  DEFAULT   15 __frame_dummy_init_array_
41: 0000000000000000     0 FILE    LOCAL  DEFAULT  ABS /super/secret/path/MiniDbg/
42: 0000000000000000     0 FILE    LOCAL  DEFAULT  ABS crtstuff.c
43: 0000000000400818     0 OBJECT  LOCAL  DEFAULT   14 __FRAME_END__
44: 0000000000600e28     0 OBJECT  LOCAL  DEFAULT   17 __JCR_END__
45: 0000000000000000     0 FILE    LOCAL  DEFAULT  ABS
46: 0000000000400724     0 NOTYPE  LOCAL  DEFAULT   13 __GNU_EH_FRAME_HDR
47: 0000000000601000     0 OBJECT  LOCAL  DEFAULT   20 _GLOBAL_OFFSET_TABLE_
48: 0000000000601028     0 OBJECT  LOCAL  DEFAULT   21 __TMC_END__
49: 0000000000601020     0 OBJECT  LOCAL  DEFAULT   21 __dso_handle
50: 0000000000600e20     0 NOTYPE  LOCAL  DEFAULT   15 __init_array_end
51: 0000000000600e18     0 NOTYPE  LOCAL  DEFAULT   15 __init_array_start
52: 0000000000600e30     0 OBJECT  LOCAL  DEFAULT   18 _DYNAMIC
53: 0000000000601018     0 NOTYPE  WEAK   DEFAULT   21 data_start
54: 0000000000400710     2 FUNC    GLOBAL DEFAULT   10 __libc_csu_fini
55: 0000000000400570    43 FUNC    GLOBAL DEFAULT   10 _start
56: 0000000000000000     0 NOTYPE  WEAK   DEFAULT  UND __gmon_start__
57: 0000000000400714     0 FUNC    GLOBAL DEFAULT   11 _fini
58: 0000000000000000     0 FUNC    GLOBAL DEFAULT  UND __libc_start_main@@GLIBC_
59: 0000000000400720     4 OBJECT  GLOBAL DEFAULT   12 _IO_stdin_used
60: 0000000000601018     0 NOTYPE  GLOBAL DEFAULT   21 __data_start
61: 00000000004006a0   101 FUNC    GLOBAL DEFAULT   10 __libc_csu_init
62: 0000000000601028     0 NOTYPE  GLOBAL DEFAULT   22 __bss_start
63: 0000000000601030     0 NOTYPE  GLOBAL DEFAULT   22 _end
64: 0000000000601028     0 NOTYPE  GLOBAL DEFAULT   21 _edata
65: 0000000000400670    44 FUNC    GLOBAL DEFAULT   10 main
66: 0000000000400558     0 FUNC    GLOBAL DEFAULT    9 _init

```

You can see lots of symbols for sections in the object file, symbols which are used by the implementation for setting up the environment, and at the end you can see the symbol for `main`.

We’re interested in the type, name, and value (address) of the symbol. We’ll have a `symbol_type` enum for the type and use a `std::string` for the name and `std::uintptr_t` for the address:

```
enum class symbol_type {
    notype,            // No type (e.g., absolute symbol)
    object,            // Data object
    func,              // Function entry point
    section,           // Symbol is associated with a section
    file,              // Source file associated with the
};                     // object file

std::string to_string (symbol_type st) {
    switch (st) {
    case symbol_type::notype: return "notype";
    case symbol_type::object: return "object";
    case symbol_type::func: return "func";
    case symbol_type::section: return "section";
    case symbol_type::file: return "file";
    }
}

struct symbol {
    symbol_type type;
    std::string name;
    std::uintptr_t addr;
};
```

We’ll need to map between the symbol type we get from `libelfin` and our enum since we don’t want the dependency poisoning this interface. Fortunately I picked the same names for everything, so this is dead easy:

```
symbol_type to_symbol_type(elf::stt sym) {
    switch (sym) {
    case elf::stt::notype: return symbol_type::notype;
    case elf::stt::object: return symbol_type::object;
    case elf::stt::func: return symbol_type::func;
    case elf::stt::section: return symbol_type::section;
    case elf::stt::file: return symbol_type::file;
    default: return symbol_type::notype;
    }
};
```

Lastly we want to look up the symbol. For illustrative purposes I loop through the sections of the ELF looking for symbol tables, then collect any symbols I find in them into a `std::vector`. A smarter implementation would build up a map from names to symbols so that you only have to look at all the data once.

```
std::vector<symbol> debugger::lookup_symbol(const std::string& name) {
    std::vector<symbol> syms;

    for (auto &sec : m_elf.sections()) {
        if (sec.get_hdr().type != elf::sht::symtab && sec.get_hdr().type != elf::sht::dynsym)
            continue;

        for (auto sym : sec.as_symtab()) {
            if (sym.get_name() == name) {
                auto &d = sym.get_data();
                syms.push_back(symbol{to_symbol_type(d.type()), sym.get_name(), d.value});
            }
        }
    }

    return syms;
}
```

* * *

### Adding commands

As always, we need to add some more commands to expose the functionality to users. For breakpoints I’ve gone for a GDB-style interface, where the kind of breakpoint is inferred from the argument you pass rather than requiring explicit switches:

*   `0x<hexadecimal>` -> address breakpoint

*   `<line>:<filename>` -> line number breakpoint

*   `<anything else>` -> function name breakpoint

```
    else if(is_prefix(command, "break")) {
        if (args[1][0] == '0' && args[1][1] == 'x') {
            std::string addr {args[1], 2};
            set_breakpoint_at_address(std::stol(addr, 0, 16));
        }
        else if (args[1].find(':') != std::string::npos) {
            auto file_and_line = split(args[1], ':');
            set_breakpoint_at_source_line(file_and_line[0], std::stoi(file_and_line[1]));
        }
        else {
            set_breakpoint_at_function(args[1]);
        }
    }
```

For symbols we’ll lookup the symbol and print out any matches we find:

```
else if(is_prefix(command, "symbol")) {
    auto syms = lookup_symbol(args[1]);
    for (auto&& s : syms) {
        std::cout << s.name << ' ' << to_string(s.type) << " 0x" << std::hex << s.addr << std::endl;
    }
}
```

* * *

### Testing it out

Fire up your debugger on a simple binary, play around with setting source-level breakpoints. Setting a breakpoint on some `foo` and seeing my debugger stop on it was one of the most rewarding moments of this project for me.

Symbol lookup can be tested by adding some functions or global variables to your program and looking up the names of them. Note that if you’re compiling C++ code you’ll need to take [name mangling][10] into account as well.

That’s all for this post. Next time I’ll show how to add stack unwinding support to the debugger.

You can find the code for this post [here][11].

--------------------------------------------------------------------------------

via: https://blog.tartanllama.xyz/c++/2017/06/19/writing-a-linux-debugger-source-break/

作者：[Simon Brand ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://twitter.com/TartanLlama
[1]:https://blog.tartanllama.xyz/c++/2017/03/21/writing-a-linux-debugger-setup/
[2]:https://blog.tartanllama.xyz/c++/2017/03/24/writing-a-linux-debugger-breakpoints/
[3]:https://blog.tartanllama.xyz/c++/2017/03/31/writing-a-linux-debugger-registers/
[4]:https://blog.tartanllama.xyz/c++/2017/04/05/writing-a-linux-debugger-elf-dwarf/
[5]:https://blog.tartanllama.xyz/c++/2017/04/24/writing-a-linux-debugger-source-signal/
[6]:https://blog.tartanllama.xyz/c++/2017/05/06/writing-a-linux-debugger-dwarf-step/
[7]:https://blog.tartanllama.xyz/c++/2017/06/19/writing-a-linux-debugger-source-break/
[8]:https://blog.tartanllama.xyz/c++/2017/06/24/writing-a-linux-debugger-unwinding/
[9]:https://blog.tartanllama.xyz/c++/2017/04/05/writing-a-linux-debugger-elf-dwarf/
[10]:https://en.wikipedia.org/wiki/Name_mangling#C.2B.2B
[11]:https://github.com/TartanLlama/minidbg/tree/tut_source_break

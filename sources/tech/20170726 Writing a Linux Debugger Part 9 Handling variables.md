Writing a Linux Debugger Part 9: Handling variables
============================================================ 

Variables are sneaky. At one moment they’ll be happily sitting in registers, but as soon as you turn your head they’re spilled to the stack. Maybe the compiler completely throws them out of the window for the sake of optimization. Regardless of how often variables move around in memory, we need some way to track and manipulate them in our debugger. This post will teach you more about handling variables in your debugger and demonstrate a simple implementation using `libelfin`.

* * *

### Series index

1.  [Setup][1]

2.  [Breakpoints][2]

3.  [Registers and memory][3]

4.  [Elves and dwarves][4]

5.  [Source and signals][5]

6.  [Source-level stepping][6]

7.  [Source-level breakpoints][7]

8.  [Stack unwinding][8]

9.  [Handling variables][9]

10.  [Advanced topics][10]

* * *

Before you get started, make sure that the version of `libelfin` you are using is the [`fbreg` branch of my fork][11]. This contains some hacks to support getting the base of the current stack frame and evaluating location lists, neither of which are supported by vanilla `libelfin`. You might need to pass `-gdwarf-2` to GCC to get it to generate compatible DWARF information. But before we get into the implementation, I’ll give a more detailed description of how locations are encoded in DWARF 5, which is the most recent specification. If you want more information than what I write here, then you can grab the standard from [here][12].

### DWARF locations

The location of a variable in memory at a given moment is encoded in the DWARF information using the `DW_AT_location`attribute. Location descriptions can be either single location descriptions, composite location descriptions, or location lists.

*   Simple location descriptions describe the location of one contiguous piece (usually all) of an object. A simple location description may describe a location in addressable memory, or in a register, or the lack of a location (with or without a known value).
    *   Example:
        *   `DW_OP_fbreg -32`

        *   A variable which is entirely stored -32 bytes from the stack frame base

*   Composite location descriptions describe an object in terms of pieces, each of which may be contained in part of a register or stored in a memory location unrelated to other pieces.
    *   Example:
        *   `DW_OP_reg3 DW_OP_piece 4 DW_OP_reg10 DW_OP_piece 2`

        *   A variable whose first four bytes reside in register 3 and whose next two bytes reside in register 10.

*   Location lists describe objects which have a limited lifetime or change location during their lifetime.
    *   Example:
        *   `<loclist with 3 entries follows>`
            *   `[ 0]<lowpc=0x2e00><highpc=0x2e19>DW_OP_reg0`

            *   `[ 1]<lowpc=0x2e19><highpc=0x2e3f>DW_OP_reg3`

            *   `[ 2]<lowpc=0x2ec4><highpc=0x2ec7>DW_OP_reg2`

        *   A variable whose location moves between registers depending on the current value of the program counter

The `DW_AT_location` is encoded in one of three different ways, depending on the kind of location description. `exprloc`s encode simple and composite location descriptions. They consist of a byte length followed by a DWARF expression or location description. `loclist`s and `loclistptr`s encode location lists. They give indexes or offsets into the `.debug_loclists` section, which describes the actual location lists.

### DWARF Expressions

The actual location of the variables is computed using DWARF expressions. These consist of a series of operations which operate on a stack of values. There are an impressive number of DWARF operations available, so I won’t explain them all in detail. Instead I’ll give a few examples from each class of expression to give you a taste of what is available. Also, don’t get scared off by these; `libelfin` will take care off all of this complexity for us.

*   Literal encodings
    *   `DW_OP_lit0`, `DW_OP_lit1`, …, `DW_OP_lit31`
        *   Push the literal value on to the stack

    *   `DW_OP_addr <addr>`
        *   Pushes the address operand on to the stack

    *   `DW_OP_constu <unsigned>`
        *   Pushes the unsigned value on to the stack

*   Register values
    *   `DW_OP_fbreg <offset>`
        *   Pushes the value found at the base of the stack frame, offset by the given value

    *   `DW_OP_breg0`, `DW_OP_breg1`, …, `DW_OP_breg31 <offset>`
        *   Pushes the contents of the given register plus the given offset to the stack

*   Stack operations
    *   `DW_OP_dup`
        *   Duplicate the value at the top of the stack

    *   `DW_OP_deref`
        *   Treats the top of the stack as a memory address, and replaces it with the contents of that address

*   Arithmetic and logical operations
    *   `DW_OP_and`
        *   Pops the top two values from the stack and pushes back the logical `AND` of them

    *   `DW_OP_plus`
        *   Same as `DW_OP_and`, but adds the values

*   Control flow operations
    *   `DW_OP_le`, `DW_OP_eq`, `DW_OP_gt`, etc.
        *   Pops the top two values, compares them, and pushes `1` if the condition is true and `0`otherwise

    *   `DW_OP_bra <offset>`
        *   Conditional branch: if the top of the stack is not `0`, skips back or forward in the expression by `offset`

*   Type conversions
    *   `DW_OP_convert <DIE offset>`
        *   Converts value on the top of the stack to a different type, which is described by the DWARF information entry at the given offset

*   Special operations
    *   `DW_OP_nop`
        *   Do nothing!

### DWARF types

DWARF’s representation of types needs to be strong enough to give debugger users useful variable representations. Users most often want to be able to debug at the level of their application rather than at the level of their machine, and they need a good idea of what their variables are doing to achieve that.

DWARF types are encoded in DIEs along with the majority of the other debug information. They can have attributes to indicate their name, encoding, size, endianness, etc. A myriad of type tags are available to express pointers, arrays, structures, typedefs, anything else you could see in a C or C++ program.

Take this simple structure as an example:

```
struct test{
    int i;
    float j;
    int k[42];
    test* next;
};
```

The parent DIE for this struct is this:

```
< 1><0x0000002a>    DW_TAG_structure_type
                      DW_AT_name                  "test"
                      DW_AT_byte_size             0x000000b8
                      DW_AT_decl_file             0x00000001 test.cpp
                      DW_AT_decl_line             0x00000001

```

The above says that we have a structure called `test` of size `0xb8`, declared at line `1` of `test.cpp`. All there are then many children DIEs which describe the members.

```
< 2><0x00000032>      DW_TAG_member
                        DW_AT_name                  "i"
                        DW_AT_type                  <0x00000063>
                        DW_AT_decl_file             0x00000001 test.cpp
                        DW_AT_decl_line             0x00000002
                        DW_AT_data_member_location  0
< 2><0x0000003e>      DW_TAG_member
                        DW_AT_name                  "j"
                        DW_AT_type                  <0x0000006a>
                        DW_AT_decl_file             0x00000001 test.cpp
                        DW_AT_decl_line             0x00000003
                        DW_AT_data_member_location  4
< 2><0x0000004a>      DW_TAG_member
                        DW_AT_name                  "k"
                        DW_AT_type                  <0x00000071>
                        DW_AT_decl_file             0x00000001 test.cpp
                        DW_AT_decl_line             0x00000004
                        DW_AT_data_member_location  8
< 2><0x00000056>      DW_TAG_member
                        DW_AT_name                  "next"
                        DW_AT_type                  <0x00000084>
                        DW_AT_decl_file             0x00000001 test.cpp
                        DW_AT_decl_line             0x00000005
                        DW_AT_data_member_location  176(as signed = -80)

```

Each member has a name, a type (which is a DIE offset), a declaration file and line, and a byte offset into the structure where the member is located. The types which are pointed to come next.

```
< 1><0x00000063>    DW_TAG_base_type
                      DW_AT_name                  "int"
                      DW_AT_encoding              DW_ATE_signed
                      DW_AT_byte_size             0x00000004
< 1><0x0000006a>    DW_TAG_base_type
                      DW_AT_name                  "float"
                      DW_AT_encoding              DW_ATE_float
                      DW_AT_byte_size             0x00000004
< 1><0x00000071>    DW_TAG_array_type
                      DW_AT_type                  <0x00000063>
< 2><0x00000076>      DW_TAG_subrange_type
                        DW_AT_type                  <0x0000007d>
                        DW_AT_count                 0x0000002a
< 1><0x0000007d>    DW_TAG_base_type
                      DW_AT_name                  "sizetype"
                      DW_AT_byte_size             0x00000008
                      DW_AT_encoding              DW_ATE_unsigned
< 1><0x00000084>    DW_TAG_pointer_type
                      DW_AT_type                  <0x0000002a>

```

As you can see, `int` on my laptop is a 4-byte signed integer type, and `float` is a 4-byte float. The integer array type is defined by pointing to the `int` type as its element type, a `sizetype` (think `size_t`) as the index type, with `2a` elements. The `test*` type is a `DW_TAG_pointer_type` which references the `test` DIE.

* * *

### Implementing a simple variable reader

As mentioned, `libelfin` will deal with most of the complexity for us. However, it doesn’t implement all of the different methods for representing variable locations, and handling a lot of them in our code would get pretty complex. As such, I’ve chosen to only support `exprloc`s for now. Feel free to add support for more types of expression. If you’re really feeling brave, submit some patches to `libelfin` to help complete the necessary support!

Handling variables is mostly down to locating the different parts in memory or registers, then reading or writing is the same as you’ve seen before. I’ll only show you how to implement reading for the sake of simplicity.

First we need to tell `libelfin` how to read registers from our process. We do this by creating a class which inherits from `expr_context` and uses `ptrace` to handle everything:

```
class ptrace_expr_context : public dwarf::expr_context {
public:
    ptrace_expr_context (pid_t pid) : m_pid{pid} {}

    dwarf::taddr reg (unsigned regnum) override {
        return get_register_value_from_dwarf_register(m_pid, regnum);
    }

    dwarf::taddr pc() override {
        struct user_regs_struct regs;
        ptrace(PTRACE_GETREGS, m_pid, nullptr, &regs);
        return regs.rip;
    }

    dwarf::taddr deref_size (dwarf::taddr address, unsigned size) override {
        //TODO take into account size
        return ptrace(PTRACE_PEEKDATA, m_pid, address, nullptr);
    }

private:
    pid_t m_pid;
};
```

The reading will be handled by a `read_variables` function in our `debugger` class:

```
void debugger::read_variables() {
    using namespace dwarf;

    auto func = get_function_from_pc(get_pc());

    //...
}
```

The first thing we do above is find the function which we’re currently in. Then we need to loop through the entries in that function, looking for variables:

```
    for (const auto& die : func) {
        if (die.tag == DW_TAG::variable) {
            //...
        }
    }
```

We get the location information by looking up the `DW_AT_location` entry in the DIE:

```
            auto loc_val = die[DW_AT::location];
```

Then we ensure that it’s an `exprloc` and ask `libelfin` to evaluate the expression for us:

```
            if (loc_val.get_type() == value::type::exprloc) {
                ptrace_expr_context context {m_pid};
                auto result = loc_val.as_exprloc().evaluate(&context);
```

Now that we’ve evaluated the expression, we need to read the contents of the variable. It could be in memory or a register, so we’ll handle both cases:

```
                switch (result.location_type) {
                case expr_result::type::address:
                {
                    auto value = read_memory(result.value);
                    std::cout << at_name(die) << " (0x" << std::hex << result.value << ") = "
                              << value << std::endl;
                    break;
                }

                case expr_result::type::reg:
                {
                    auto value = get_register_value_from_dwarf_register(m_pid, result.value);
                    std::cout << at_name(die) << " (reg " << result.value << ") = "
                              << value << std::endl;
                    break;
                }

                default:
                    throw std::runtime_error{"Unhandled variable location"};
                }
```

As you can see I’ve simply printed out the value without interpreting it based on the type of the variable. Hopefully from this code you can see how you could support writing variables, or searching for variables with a given name.

Finally we can add this to our command parser:

```
    else if(is_prefix(command, "variables")) {
        read_variables();
    }
```

### Testing it out

Write a few small functions which have some variables, compile it without optimizations and with debug info, then see if you can read the values of your variables. Try writing to the memory address where a variable is stored and see the behaviour of the program change.

* * *

Nine posts down, one to go! Next time I’ll be talking about some more advanced concepts which might interest you. For now you can find the code for this post [here][13]

--------------------------------------------------------------------------------

via: https://blog.tartanllama.xyz/writing-a-linux-debugger-variables/

作者：[ Simon Brand][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.twitter.com/TartanLlama
[1]:https://blog.tartanllama.xyz/writing-a-linux-debugger-setup/
[2]:https://blog.tartanllama.xyz/writing-a-linux-debugger-breakpoints/
[3]:https://blog.tartanllama.xyz/writing-a-linux-debugger-registers/
[4]:https://blog.tartanllama.xyz/writing-a-linux-debugger-elf-dwarf/
[5]:https://blog.tartanllama.xyz/writing-a-linux-debugger-source-signal/
[6]:https://blog.tartanllama.xyz/writing-a-linux-debugger-dwarf-step/
[7]:https://blog.tartanllama.xyz/writing-a-linux-debugger-source-break/
[8]:https://blog.tartanllama.xyz/writing-a-linux-debugger-unwinding/
[9]:https://blog.tartanllama.xyz/writing-a-linux-debugger-variables/
[10]:https://blog.tartanllama.xyz/writing-a-linux-debugger-advanced-topics/
[11]:https://github.com/TartanLlama/libelfin/tree/fbreg
[12]:http://dwarfstd.org/
[13]:https://github.com/TartanLlama/minidbg/tree/tut_variable

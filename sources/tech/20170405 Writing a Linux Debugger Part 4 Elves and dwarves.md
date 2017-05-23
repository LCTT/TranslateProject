ictlyh Translating
Writing a Linux Debugger Part 4: Elves and dwarves
============================================================ 

Up until now you’ve heard whispers of dwarves, of debug information, of a way to understand the source code without just parsing the thing. Today we’ll be going into the details of source-level debug information in preparation for using it in following parts of this tutorial.

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

### Introduction to ELF and DWARF

ELF and DWARF are two components which you may not have heard of, but probably use most days. ELF (Executable and Linkable Format) is the most widely used object file format in the Linux world; it specifies a way to store all of the different parts of a binary, like the code, static data, debug information, and strings. It also tells the loader how to take the binary and ready it for execution, which involves noting where different parts of the binary should be placed in memory, which bits need to be fixed up depending on the position of other components ( _relocations_ ) and more. I won’t cover much more of ELF in these posts, but if you’re interested, you can have a look at [this wonderful infographic][7] or [the standard][8].

DWARF is the debug information format most commonly used with ELF. It’s not necessarily tied to ELF, but the two were developed in tandem and work very well together. This format allows a compiler to tell a debugger how the original source code relates to the binary which is to be executed. This information is split across different ELF sections, each with its own piece of information to relay. Here are the different sections which are defined, taken from this highly informative if slightly out of date [Introduction to the DWARF Debugging Format][9]:

*   `.debug_abbrev` Abbreviations used in the `.debug_info` section

*   `.debug_aranges` A mapping between memory address and compilation

*   `.debug_frame` Call Frame Information

*   `.debug_info` The core DWARF data containing DWARF Information Entries (DIEs)

*   `.debug_line` Line Number Program

*   `.debug_loc` Location descriptions

*   `.debug_macinfo` Macro descriptions

*   `.debug_pubnames` A lookup table for global objects and functions

*   `.debug_pubtypes` A lookup table for global types

*   `.debug_ranges` Address ranges referenced by DIEs

*   `.debug_str` String table used by `.debug_info`

*   `.debug_types` Type descriptions

We are most interested in the `.debug_line` and `.debug_info` sections, so lets have a look at some DWARF for a simple program.

```
int main() {
    long a = 3;
    long b = 2;
    long c = a + b;
    a = 4;
}
```

* * *

### DWARF line table

If you compile this program with the `-g` option and run the result through `dwarfdump`, you should see something like this for the line number section:

```
.debug_line: line number info for a single cu
Source lines (from CU-DIE at .debug_info offset 0x0000000b):

            NS new statement, BB new basic block, ET end of text sequence
            PE prologue end, EB epilogue begin
            IS=val ISA number, DI=val discriminator value
<pc>        [lno,col] NS BB ET PE EB IS= DI= uri: "filepath"
0x00400670  [   1, 0] NS uri: "/home/simon/play/MiniDbg/examples/variable.cpp"
0x00400676  [   2,10] NS PE
0x0040067e  [   3,10] NS
0x00400686  [   4,14] NS
0x0040068a  [   4,16]
0x0040068e  [   4,10]
0x00400692  [   5, 7] NS
0x0040069a  [   6, 1] NS
0x0040069c  [   6, 1] NS ET

```

The first bunch of lines is some information on how to understand the dump – the main line number data starts at the line starting with `0x00400670`. Essentially this maps a code memory address with a line and column number in some file. `NS` means that the address marks the beginning of a new statement, which is often used for setting breakpoints or stepping. `PE`marks the end of the function prologue, which is helpful for setting function entry breakpoints. `ET` marks the end of the translation unit. The information isn’t actually encoded like this; the real encoding is a very space-efficient program of sorts which can be executed to build up this line information.

So, say we want to set a breakpoint on line 4 of variable.cpp, what do we do? We look for entries corresponding to that file, then we look for a relevant line entry, look up the address which corresponds to it, and set a breakpoint there. In our example, that’s this entry:

```
0x00400686  [   4,14] NS

```

So we want to set a breakpoint at address `0x00400686`. You could do so by hand with the debugger you’ve already written if you want to give it a try.

The reverse works just as well. If we have a memory location – say, a program counter value – and want to find out where that is in the source, we just find the closest mapped address in the line table information and grab the line from there.

* * *

### DWARF debug info

The `.debug_info` section is the heart of DWARF. It gives us information about the types, functions, variables, hopes, and dreams present in our program. The fundamental unit in this section is the DWARF Information Entry, affectionately known as DIEs. A DIE consists of a tag telling you what kind of source-level entity is being represented, followed by a series of attributes which apply to that entity. Here’s the `.debug_info` section for the simple example program I posted above:

```

.debug_info

COMPILE_UNIT<header overall offset = 0x00000000>:
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
                      DW_AT_frame_base            DW_OP_reg6
                      DW_AT_name                  main
                      DW_AT_decl_file             0x00000001 /super/secret/path/MiniDbg/examples/variable.cpp
                      DW_AT_decl_line             0x00000001
                      DW_AT_type                  <0x00000077>
                      DW_AT_external              yes(1)
< 2><0x0000004c>      DW_TAG_variable
                        DW_AT_location              DW_OP_fbreg -8
                        DW_AT_name                  a
                        DW_AT_decl_file             0x00000001 /super/secret/path/MiniDbg/examples/variable.cpp
                        DW_AT_decl_line             0x00000002
                        DW_AT_type                  <0x0000007e>
< 2><0x0000005a>      DW_TAG_variable
                        DW_AT_location              DW_OP_fbreg -16
                        DW_AT_name                  b
                        DW_AT_decl_file             0x00000001 /super/secret/path/MiniDbg/examples/variable.cpp
                        DW_AT_decl_line             0x00000003
                        DW_AT_type                  <0x0000007e>
< 2><0x00000068>      DW_TAG_variable
                        DW_AT_location              DW_OP_fbreg -24
                        DW_AT_name                  c
                        DW_AT_decl_file             0x00000001 /super/secret/path/MiniDbg/examples/variable.cpp
                        DW_AT_decl_line             0x00000004
                        DW_AT_type                  <0x0000007e>
< 1><0x00000077>    DW_TAG_base_type
                      DW_AT_name                  int
                      DW_AT_encoding              DW_ATE_signed
                      DW_AT_byte_size             0x00000004
< 1><0x0000007e>    DW_TAG_base_type
                      DW_AT_name                  long int
                      DW_AT_encoding              DW_ATE_signed
                      DW_AT_byte_size             0x00000008

```

The first DIE represents a compilation unit (CU), which is essentially a source file with all of the `#includes` and such resolved. Here are the attributes annotated with their meaning:

```
DW_AT_producer   clang version 3.9.1 (tags/RELEASE_391/final)    <-- The compiler which produced
                                                                     this binary
DW_AT_language   DW_LANG_C_plus_plus                             <-- The source language
DW_AT_name       /super/secret/path/MiniDbg/examples/variable.cpp  <-- The name of the file which
                                                                     this CU represents
DW_AT_stmt_list  0x00000000                                      <-- An offset into the line table
                                                                     which tracks this CU
DW_AT_comp_dir   /super/secret/path/MiniDbg/build                  <-- The compilation directory
DW_AT_low_pc     0x00400670                                      <-- The start of the code for
                                                                     this CU
DW_AT_high_pc    0x0040069c                                      <-- The end of the code for
                                                                     this CU

```

The other DIEs follow a similar scheme, and you can probably intuit what the different attributes mean.

Now we can try and solve a few practical problems with our new-found knowledge of DWARF.

### Which function am I in?

Say we have a program counter value and want to figure out what function we’re in. A simple algorithm for this is:

```
for each compile unit:
    if the pc is between DW_AT_low_pc and DW_AT_high_pc:
        for each function in the compile unit:
            if the pc is between DW_AT_low_pc and DW_AT_high_pc:
                return function information

```

This will work for many purposes, but things get a bit more difficult in the presence of member functions and inlining. With inlining, for example, once we’ve found the function whose range contains our PC, we’ll need to recurse over the children of that DIE to see if there are any inlined functions which are a better match. I won’t deal with inlining in my code for this debugger, but you can add support for this if you like.

### How do I set a breakpoint on a function?

Again, this depends on if you want to support member functions, namespaces and suchlike. For free functions you can just iterate over the functions in different compile units until you find one with the right name. If your compiler is kind enough to fill in the `.debug_pubnames` section, you can do this a lot more efficiently.

Once the function has been found, you can set a breakpoint on the memory address given by `DW_AT_low_pc`. However, that’ll break at the start of the function prologue, but it’s preferable to break at the start of the user code. Since the line table information can specify the memory address which specifies the prologue end, you could just lookup the value of `DW_AT_low_pc` in the line table, then keep reading until you get to the entry marked as the prologue end. Some compilers won’t output this information though, so another option is to just set a breakpoint on the address given by the second line entry for that function.

Say we want to set a breakpoint on `main` in our example program. We search for the function called `main`, and get this DIE:

```
< 1><0x0000002e>    DW_TAG_subprogram
                      DW_AT_low_pc                0x00400670
                      DW_AT_high_pc               0x0040069c
                      DW_AT_frame_base            DW_OP_reg6
                      DW_AT_name                  main
                      DW_AT_decl_file             0x00000001 /super/secret/path/MiniDbg/examples/variable.cpp
                      DW_AT_decl_line             0x00000001
                      DW_AT_type                  <0x00000077>
                      DW_AT_external              yes(1)

```

This tells us that the function begins at `0x00400670`. If we look this up in our line table, we get this entry:

```
0x00400670  [   1, 0] NS uri: "/super/secret/path/MiniDbg/examples/variable.cpp"

```

We want to skip the prologue, so we read ahead an entry:

```
0x00400676  [   2,10] NS PE

```

Clang has included the prologue end flag on this entry, so we know to stop here and set a breakpoint on address `0x00400676`.

### How do I read the contents of a variable?

Reading variables can be very complex. They are elusive things which can move around throughout a function, sit in registers, be placed in memory, be optimised out, hide in the corner, whatever. Fortunately our simple example is, well, simple. If we want to read the contents of variable `a`, we have a look at its `DW_AT_location` attribute:

```
DW_AT_location              DW_OP_fbreg -8

```

This says that the contents are stored at an offset of `-8` from the base of the stack frame. To work out where this base is, we look at the `DW_AT_frame_base` attribute on the containing function.

```
DW_AT_frame_base            DW_OP_reg6

```

`reg6` on x86 is the frame pointer register, as specified by the [System V x86_64 ABI][10]. Now we read the contents of the frame pointer, subtract 8 from it, and we’ve found our variable. If we actually want to make sense of the thing, we’ll need to look at its type:

```
< 2><0x0000004c>      DW_TAG_variable
                        DW_AT_name                  a
                        DW_AT_type                  <0x0000007e>

```

If we look up this type in the debug information, we get this DIE:

```
< 1><0x0000007e>    DW_TAG_base_type
                      DW_AT_name                  long int
                      DW_AT_encoding              DW_ATE_signed
                      DW_AT_byte_size             0x00000008

```

This tells us that the type is a 8 byte (64 bit) signed integer type, so we can go ahead and interpret those bytes as an `int64_t` and display it to the user.

Of course, types can get waaaaaaay more complex than that, as they have to be able to express things like C++ types, but this gives you a basic idea of how they work.

Coming back to that frame base for a second, Clang was nice enough to track the frame base with the frame pointer register. Recent versions of GCC tend to prefer `DW_OP_call_frame_cfa`, which involves parsing the `.eh_frame` ELF section, and that’s an entirely different article which I won’t be writing. If you tell GCC to use DWARF 2 instead of more recent versions, it’ll tend to output location lists, which are somewhat easier to read:

```
DW_AT_frame_base            <loclist at offset 0x00000000 with 4 entries follows>
 low-off : 0x00000000 addr  0x00400696 high-off  0x00000001 addr 0x00400697>DW_OP_breg7+8
 low-off : 0x00000001 addr  0x00400697 high-off  0x00000004 addr 0x0040069a>DW_OP_breg7+16
 low-off : 0x00000004 addr  0x0040069a high-off  0x00000031 addr 0x004006c7>DW_OP_breg6+16
 low-off : 0x00000031 addr  0x004006c7 high-off  0x00000032 addr 0x004006c8>DW_OP_breg7+8

```

A location list gives different locations depending on where the program counter is. This example says that if the PC is at an offset of `0x0` from `DW_AT_low_pc` then the frame base is an offset of 8 away from the value stored in register 7, if it’s between `0x1` and `0x4` away, then it’s at an offset of 16 away from the same, and so on.

* * *

### Take a breath

That’s a lot of information to get your head round, but the good news is that in the next few posts we’re going to have a library do the hard work for us. It’s still useful to understand the concepts at play, particularly when something goes wrong or when you want to support some DWARF concept which isn’t implemented in whatever DWARF library you use.

If you want to learn more about DWARF, then you can grab the standard [here][11]. At the time of writing, DWARF 5 has just been released, but DWARF 4 is more commonly supported.

--------------------------------------------------------------------------------

via: https://blog.tartanllama.xyz/c++/2017/04/05/writing-a-linux-debugger-elf-dwarf/

作者：[ TartanLlama ][a]
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
[7]:https://github.com/corkami/pics/raw/master/binary/elf101/elf101-64.pdf
[8]:http://www.skyfree.org/linux/references/ELF_Format.pdf
[9]:http://www.dwarfstd.org/doc/Debugging%20using%20DWARF-2012.pdf
[10]:https://www.uclibc.org/docs/psABI-x86_64.pdf
[11]:http://dwarfstd.org/Download.php

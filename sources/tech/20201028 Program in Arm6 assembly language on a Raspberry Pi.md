[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Program in Arm6 assembly language on a Raspberry Pi)
[#]: via: (https://opensource.com/article/20/10/arm6-assembly-language)
[#]: author: (Marty Kalin https://opensource.com/users/mkalindepauledu)

Program in Arm6 assembly language on a Raspberry Pi
======
Assembly language offers special insights into how machines work and how
they can be programmed.
![An intersection of pipes.][1]

The [Arm website][2] touts the processor's underlying architecture as "the keystone of the world's largest compute ecosystem," which is plausible given the number of handheld and embedded devices with Arm processors. Arm processors are prevalent in the Internet of Things (IoT), but they are also used in desktop machines, servers, and even high-performance computers, such as the Fugaku HPC. But why look at Arm machines through the lens of assembly language?

Assembly language is the symbolic language immediately above machine code and thereby offers special insights into how machines work and how they can be programmed efficiently. In this article, I hope to illustrate this point with the Arm6 architecture using a Raspberry Pi 4 mini-desktop machine running Debian.

The Arm6 family of processors supports two instruction sets:

  * The Arm set, with 32-bit instructions throughout.
  * The Thumb set, with a mix of 16-bit and 32-bit instructions.



The examples in this article use the Arm instruction set. The Arm assembly code is in lowercase, and, for contrast, pseudo-assembly code is in uppercase.

### Load-store machines

The RISC/CISC distinction is often seen when comparing the Arm family and the Intel x86 family of processors, both of which are commercial products competing on the market. The terms RISC (reduced instruction set computer) and CISC (complex instruction set computer) date from the middle 1980s. Even then the terms were misleading, in that both RISC (e.g., MIPS) and CISC (e.g., Intel) processors had about 300 instructions in their instruction sets; today the counts for core instructions in Arm and Intel machines are close, although both types of machines have extended their instruction sets. A sharper distinction between Arm and Intel machines draws on an architectural feature other than instruction count.

An instruction set architecture (ISA) is an abstract model of a computing machine. Processors from Arm and Intel implement different ISAs: Arm processors implement a load-store ISA, whereas their Intel counterparts implement a register-memory ISA. The difference in ISAs can be described as:

  * In a load-store machine, only two instructions move data between a CPU and the memory subsystem:
    * A load instruction copies bits from memory into a CPU register.
    * A store instruction copies bits from a CPU register into memory.
  * Other instructions—in particular, the ones for arithmetic-logic operations—use only CPU registers as source and destination operands. For example, here is pseudo-assembly code on a load-store machine to add two numbers originally in memory, storing their sum back in memory (comments start with `##`): [code] ## R0 is a CPU register, RAM[32] is a memory location
LOAD R0, RAM[32]   ## R0 = RAM[32]
LOAD R1, RAM[64]   ## R1 = RAM[64]
ADD R2, R0, R1     ## R2 = R0 + R1
STORE R2, RAM[32]  ## RAM[32] = R2 [/code] The task requires four instructions: two LOADs, one ADD, and one STORE.
  * By contrast, a register-memory machine allows the operands for arithmetic-logic instructions to be registers or memory locations, usually in any combination. For example, here is pseudo-assembly code on a register-memory machine to add two numbers in memory: [code]`ADD RAM[32], RAM[32], RAM[64] ## RAM[32] += RAM[64]`[/code] The task can be accomplished with a single instruction, although the bits to be added must still be fetched from memory to a CPU, and the sum then must be copied back to memory location RAM[32].



Any ISA comes with tradeoffs. As the example above illustrates, a load-store ISA has what architects call "low instruction density": relatively many instructions may be required to perform a task. A register-memory machine has high instruction density, which is an upside. There are upsides, as well, to the load-store ISA.

Load-store design is an effort to simplify an architecture. For instance, consider the case in which a register-memory machine has an instruction with mixed operands:


```
COPY R2, RAM[64]          ## R2 = RAM[64]
ADD RAM[32], RAM[32], R2  ## RAM[32] = RAM[32] + R2
```

Executing the ADD instruction is tricky in that the access times for the numbers to be added differs—perhaps significantly if the memory operand happens to be only in main memory rather than also in a cache thereof. Load-store machines avoid the problem of mixed access times in arithmetic-logic operations: all operands, as registers, have the same access time.

Furthermore, load-store architectures emphasize fixed-sized instructions (e.g., 32-bits apiece), limited formats (e.g., one, two, or three fields per instruction), and relatively few addressing modes. These design constraints mean that the processor's control unit (CU) and arithmetic-logic unit (ALU) can be simplified: fewer transistors and wires, less required power and generated heat, and so on. Load-store machines are designed to be architecturally sparse.

My aim is not to step into the debate over load-store versus register-memory machines but rather to set up a code example in the load-store Arm6 architecture. This first look at load-store helps to explain the code that follows. The two programs (one in C, one in Arm6 assembly) are available on [my website][3].

### The hstone program in C

Among my favorite short code examples is the hailstone function, which takes a positive integer as an argument. (I used this example in an [earlier article on WebAssembly][4].) This function is rich enough to highlight important assembly-language details. The function is defined as:


```
             3N+1 if N is odd
hstone(N) =
             N/2 if N is even
```

For example, hstone(12) evaluates to 6, whereas hstone(11) evaluates to 34. If N is odd, then 3N+1 is even; but if N is even, then N/2 could be either even (e.g., 4/2 = 2) or odd (e.g., 6/2 = 3).

The hstone function can be used iteratively by passing the returned value as the next argument. The result is a _hailstone sequence_, such as this one, which starts with 24 as the original argument, the returned value 12 as the next argument, and so on:


```
`24,12,6,3,10,5,16,8,4,2,1,4,2,1,...`
```

It takes 10 steps for the sequence to converge to 1, at which point the sequence of 4,2,1 repeats indefinitely: (3x1)+1 is 4, which is halved to yield 2, which is halved to yield 1, and so on. For an explanation of why "hailstone" seems an appropriate name for such sequences, see "[Mathematical mysteries: Hailstone sequences][5]."

Note that powers of 2 converge quickly: 2N requires just N divisions by 2 to reach 1. For example, 32 = 25 has a convergence length of 5, and 512 = 29 has a convergence length of 9. If the hailstone function returns any power of 2, then the sequence converges to 1. Of interest here is the sequence length from the initial argument to the first occurrence of 1.

The [Collatz conjecture][6] is that a hailstone sequence converges to 1 no matter what the initial argument N &gt; 0 happens to be. Neither a counterexample nor a proof has been found. The conjecture, simple as it is to illustrate with a program, remains a profoundly challenging problem in number theory.

Below is the C source code for the hstoneC program, which computes the length of the hailstone sequence whose starting value is given as user input. The assembly-language version of the program (hstoneS) is provided after an overview of Arm6 basics. For clarity, the two programs are structurally similar.

Here is the C source code:


```
#include &lt;stdio.h&gt;

/* Compute steps from n to 1.
   -- update an odd n to (3 * n) + 1
   -- update an even n to (n / 2) */
unsigned hstone(unsigned n) {
  unsigned len = 0; /* counter */
  while (1) {
    if (1 == n) break;          
    n = (0 == (n &amp; 1)) ? n / 2 : (3 * n) + 1;
    len++;                      
  }
  return len;
}

int main() {
  [printf][7]("Integer &gt; 0: ");
  unsigned num;
  [scanf][8]("%u", &amp;num);
  [printf][7]("Steps from %u to 1: %u\n", num, hstone(num));
  return 0;
}
```

When the program is run with an input of 9, the output is:


```
`Steps from 9 to 1: 19`
```

The hstoneC program has a simple structure. The `main` function prompts the user for an input N (an integer &gt; 0) and then calls the `hstone` function with this input as an argument. The `hstone` function loops until the sequence from N reaches the first 1, returning the number of steps required.

The most complicated statement in the program involves C's conditional operator, which is used to update N:


```
`n = (0 == (n & 1)) ? n / 2 : (3 * n) + 1;`
```

This is a terse form of an if-then construct. The test `(0 == (n & 1))` checks whether the C variable `n` (representing N) is even or odd depending on whether the bitwise AND of N and 1 is zero: an integer value is even just in case its least-significant (rightmost) bit is zero. If N is even, N/2 becomes the new value; otherwise, 3N+1 becomes the new value. The assembly-language version of the program (hstoneS) likewise avoids an explicit if-else construct in updating its implementation of N.

My Arm6 mini-desktop machine includes the GNU C toolset, which can generate the corresponding code in assembly language. With `%` as the command-line prompt, the command is:


```
`% gcc -S hstoneC.c ## -S flag produces and saves assembly code`
```

This produces the file hstoneC.s, which is about 120 lines of assembly-language source code, including a `nop` ("no operation") instruction. Compiler-generated assembly tends to be hard to read and may have inefficiencies such as the `nop`. A hand-crafted version, such as `hstoneS.s` (below), can be easier to follow and even significantly shorter (e.g., `hstoneS.s` has about 50 lines of code).

### Assembly language basics

Arm6, like most modern architectures, is byte-addressable: a memory address is of a byte, even if the addressed item (e.g., a 32-bit instruction) consists of multiple bytes. Instructions are addressed in little-[endian][9] fashion: the address is of the low-order byte. Data items are addressed in little-endian fashion by default, but this can be changed to big-endian so that the address of a multi-byte data item points to the high-order byte. By tradition, the low-order byte is depicted as the rightmost one and the high-order byte as the leftmost one: 


```
high-order    low-order
    /             /
+----+----+----+----+
| b1 | b2 | b3 | b4 | ## 4 bytes = 32 bits
+----+----+----+----+
```

Addresses are 32-bits in size, and data items come in three standard sizes:

  * A _byte_ is 8 bits in size.
  * A _halfword_ is 16 bits in size.
  * A _word_ is 32 bits in size.



Aggregates of bytes, halfwords, and words (e.g., arrays and structures) are supported. CPU registers are 32-bits in size.

Assembly languages, in general, have three key features with a syntax that is close and, at times, identical:

  * Directives in both Arm6 and Intel assembly start with a period. Here are two Arm6 examples, which happen to work in Intel as well:


```
.data      
.align 4
```

The first directive indicates that the following section holds data items rather than code. The `.align 4` directive specifies that data items should be laid out, in memory, on 4-byte boundaries, which is common in modern architectures. As the name suggests, a directive gives direction to the translator (the "assembler") as this does its work.

By contrast, this directive indicates a code rather than a data section:


```
`.text`
```

The term "text" is traditional, and its meaning, in this context, is "read-only": during program execution, code is read-only, whereas data can be read and written.

  * Labels in both recent Arm and Intel assembly end with colons. A label is a memory address for either data items (e.g., variables) or code blocks (e.g., functions). Assembly languages, in general, rely heavily on addresses, which means that manipulating pointers—in particular, dereferencing them to get the values to which they point—takes front stage in assembly-language programming. Here are two labels in the hstoneS program:


```
collatz:         /* label */
     mov r0, #0  /* instruction */  
loop_start:      /* label */
     ...
```

The first label marks the start of the `collatz` function, whose first instruction copies the value zero (`#0`) into the register `r0`. (The `mov` for "move" opcode occurs across assembly languages but really means "copy.") The second label, `loop_start:`, is the address of the loop that computes the length of the hailstone sequence. The register `r0` serves as the sequence counter.

  * Instructions, which assembly-sensitive editors usually indent along with directives, specify the operations to be performed (e.g., `mov`) together with operands (in this case, `r0` and `#0`). There are instructions with no operands and others with several.




The `mov` instruction above does not violate the load-store principle about memory access. In general, a load instruction (`ldr` in Arm6) loads memory contents into a register. By contrast, a `mov` instruction can be used to copy an "immediate value," such as an integer constant, into a register:


```
`mov r0, #0 /* copy zero into r0 */`
```

A `mov` instruction also can be used to copy the contents of one register into another:


```
`mov r1, r0 /* r1 = r0 */`
```

The load opcode `ldr` would be inappropriate in both cases because a memory location is not in play. Examples of Arm6 `ldr` ("load register") and `str` ("store register") instructions are forthcoming.

The Arm6 architecture has 16 primary CPU registers (each 32-bits in size), a mix of general-purpose and special-purpose. Table 1 gives a summary, listing special features and uses beyond scratchpad:

#### Table 1. Primary CPU registers

Register | Special features
---|---
r0 | 1st arg to library function, retval
r1 | 2nd arg to library function
r2 | 3rd arg to library function
r3 | 4th arg to library function
r4 | callee-saved
r5 | callee-saved
r6 | callee-saved
r7 | callee-saved, system calls
r8 | callee-saved
r9 | callee-saved
r10 | callee-saved
r11 | callee-saved, frame pointer
r12 | intra-procedure
r13 | stack pointer
r14 | link register
r15 | program counter

In general, CPU registers serve as a backup for the stack, the area of main memory that provides reusable scratchpad storage for the arguments passed to functions and the local variables used in functions and other code blocks (e.g., the body of a loop). Given that CPU registers reside on the same chip as the CPU, access time is fast. Access to the stack is significantly slower, with the details depending on the particularities of a system. However, registers are scarce. In the case of Arm6, there are only 16 primary CPU registers, and some of these have special uses beyond scratchpad.

The first four registers, `r0` through `r3`, are used for scratchpad but also to pass arguments along to library functions. For example, calling a library function such as `printf` (used in both the hstoneC and hstoneS programs) requires that the expected arguments be in the expected registers. The `printf` function takes at least one argument (a format string) but usually takes others, as well (the values to be formatted). The address of the format string has to be in register `r0` for the call to succeed. A programmer-defined function can implement its own register strategy, of course, but using the first four registers for function arguments is common in Arm6 programming.

Register `r0` also has special uses. For example, it typically holds the value returned from a function, as in the `collatz` function of the hstoneS program. If a program calls the `syscall` function, which is used to invoke system functions such as `read` and `write`, register `r0` holds the integer identifier of the system function to be called (e.g., function `write` has 4 as its identifier). In this respect, register `r0` is similar in purpose to register `r7`, which holds such an identifier when function `svc` ("supervisor call") is used instead of `syscall`.

Registers `r4` through `r11` are general-purpose and "callee saved" (aka "non-volatile" or "call-preserved"). Consider the case in which function F1 calls function F2 using registers to pass arguments to F2. The registers `r0` through `r3` are "caller saved" (aka "volatile" or "call-clobbered") in that, for example, the called function F2 might call some other function F3 by using the very same registers that F1 did—but with new values therein:


```
  27  13    191  437
   \   \      \   \
   r0, r1     r0, r1
F1--------&gt;F2--------&gt;F3
```

After F1 calls F2, the contents of registers `r0` and `r1` get changed for F2's call to F3. Accordingly, F1 must not assume that its values in `r0` and `r1` (27 and 13, respectively) have been preserved; instead, these values have been overwritten—clobbered by the new values 191 and 437. Because the first four registers are not "callee saved," called function F2 is not responsible for preserving and later restoring the values in the registers set by F1.

Callee-saved registers bring responsibility to a called function. For example, if F1 used callee-saved registers `r4` and `r5` in its call to F2, then F2 would be responsible for saving the contents of these registers (typically on the stack) and then restoring the values before returning to F1. F2's code then might start and end as follows:


```
push {r4, r5}  /* save r4 and r5 values on the stack */
...            /* reuse r4 and r5 for some other task */
pop {r4, r5}   /* restore r4 and r5 values */
```

The `push` operation saves the values in `r4` and `r5` to the stack. The matching `pop` operation then recovers these values from the stack and puts them into `r4` and `r5`.

Other registers in Table 1 can be used as scratchpad, but some have a special use, as well. As noted earlier, register `r7` can be used to make system calls (e.g., to function `write`), which a later example shows in detail. In an `svc` instruction, the integer identifier for a particular system function must be in register `r7` (e.g., 4 to identify the `write` function).

Register `r11` is aliased as `fp` for "frame pointer," which points to the start of the current call frame. When one function calls another, the called function gets its own area of the stack (a call frame) for use as scratchpad. A frame pointer, unlike the stack pointer described below, typically remains fixed until a called function returns.

Register `r12`, also known as `ip` ("intra-procedure"), is used by the dynamic linker. Between calls to dynamically linked library functions, however, a program can use this register as scratchpad.

Register `r13`, which has `sp` ("stack pointer") as an alias, points to the top of the stack and is updated automatically through `push` and `pop` operations. The stack pointer also can be used as a base address with an offset; for example, `sp - #4` points 4 bytes below where the `sp` points. The Arm6 stack, like its Intel counterpart, grows from high to low addresses. (Some authors accordingly describe the stack pointer as pointing to the bottom rather than the top of the stack.)

Register `r14`, with `lr` as an alias, serves as the "link register" that holds a return address for a function. However, a called function can call another with a `bl` ("branch with link") or `bx` ("branch with exchange") instruction, thereby clobbering the contents of the `lr` register. For example, in the hstoneS program, the function `main` calls four others. Accordingly, function `main` saves the `lr` of its caller on the stack and later restores this value. The pattern occurs regularly in Arm6 assembly language:


```
push {lr} /* save caller's lr */
...       /* call some functions */
pop {lr}  /* restore caller's lr */
```

Register `r15` is also the `pc` ("program counter"). In most architectures, the program counter points to the "next" instruction to be executed. For historical reasons, the Arm6 `pc` points to _two_ instructions beyond the current one. The `pc` can be manipulated directly (for example, to call a function), but the recommended approach is to use instructions such as `bl` that manipulate the link register.

Arm6 has the usual assortment of instructions for arithmetic (e.g., add, subtract, multiply, divide), logic (e.g., compare, shift), control (e.g., branch, exit), and input/output (e.g., read, write). The results of comparisons and other operations are saved in the special-purpose register `cpsr` ("current processor status register"). For example, this register records whether an addition caused an overflow or whether two compared integer values are equal.

It is worth repeating that the Arm6 has exactly two basic data movement instructions: `ldr` to load memory contents into a register and `str` to store register contents in memory. Arm6 includes variations of the basic `ldr` and `str` instructions, but the load-store pattern of moving data between registers and memory remains the same.

A code example brings these architectural details to life. The next section introduces the hailstone program in assembly language.

### The hstone program in Arm6 assembly

The above overview of Arm6 assembly is enough to introduce the full code example for hstoneS. For clarity, the assembly-language program hstoneS has essentially the same structure as the C program hstoneC: two functions, `main` and `collatz`, and mostly straight-line code execution in each function. The behavior of the two programs is the same.

Here is the source code for hstoneS:


```
        .data        /* data versus code */
        .balign 4    /* alignment on 4-byte boundaries */

/* labels (addresses) for user input, formatters, etc. */
num:    .int    0               /* 4-byte integer */
steps:  .int    0               /* another for the result */
prompt: .asciz  "Integer &gt; 0: " /* zero-terminated ASCII string */
format: .asciz  "%u"            /* %u for "unsigned" */
report: .asciz  "From %u to 1 takes %u steps.\n"
       
        .text          /* code: 'text' in the sense of 'read only' */
        .global main   /* program's entry point must be global */
        .extern [printf][7] /* library function */
        .extern [scanf][8]  /* ditto */

collatz:                 /** collatz function **/
        mov r0, #0       /* r0 is the step counter */
loop_start:              /** collatz loop **/
        cmp r1, #1       /* are we done? (num == 1?) */
        beq collatz_end  /* if so, return to main */    
       
        and r2, r1, #1            /* odd-even test for r1 (num) */
        cmp r2, #0                /* even? */
        moveq r1, r1, LSR #1      /* even: divide by 2 via a 1-bit right shift */
        addne r1, r1, r1, LSL #1  /* odd: multiply by adding and 1-bit left shift */
        addne r1, #1              /* odd: add the 1 for (3 * num) + 1 */

        add r0, r0, #1            /* increment counter by 1 */
        b loop_start              /* loop again */
collatz_end:
        bx lr                     /* return to caller (main) */

main:  
        push {lr}              /* save link register to stack */

        /* prompt for and read user input */
        ldr r0, =prompt        /* format string's address into r0 */
        bl  [printf][7]             /* call printf, with r0 as only argument */

        ldr r0, =format        /* format string for scanf */
        ldr r1, =num           /* address of num into r1 */
        bl  [scanf][8]              /* call scanf */

        ldr r1, =num           /* address of num into r1 */
        ldr r1, [r1]           /* value at the address into r1 */
        bl  collatz            /* call collatz with r1 as the argument */

        /* demo a store */
        ldr r3, =steps         /* load memory address into r3 */
        str r0, [r3]           /* store hailstone steps at mem[r3] */

        /* setup report */
        mov r2, r0             /* r0 holds hailstone steps: copy into r2 */
        ldr r1, =num           /* get user's input again */
        ldr r1, [r1]           /* dereference address to get value */
        ldr r0, =report        /* format string for report into r0 */
        bl  [printf][7]             /* print report */

        pop {lr}               /* return to caller */
```

Arm6 assembly supports documentation in either C style (the slash-star and star-slash syntax used here) or one-line comments introduced by the @ sign. The hstoneS program, like its C counterpart, has two functions:

  * The program's entry point is the `main` function, which is identified by the label `main:`; this label marks where the function's first instruction is found. In Arm6 assembly, the entry point must be declared as global:


```
`.global main`
```

In C, a function's _name_ is the address of the code block that makes up the function's body, and a C function is `extern` (global) by default. It is unsurprising how much C and assembly language resemble one another; indeed, C is portable assembly language.

  * The `collatz` function expects one argument, which is implemented by the register `r1` to hold the user's input of an unsigned integer value (e.g., 9). This function updates register `r1` until it equals 1, keeping count of the steps involved with register `r0`, which thereby serves as the function's return value.




An early and interesting code segment in `main` involves the call to the library function `scanf`, a high-level input function that scans a value from the standard input (by default, the keyboard) and converts this value to the desired data type, in this case, a 4-byte unsigned integer. Here is the code segment in full:


```
ldr r0, =format  /* address of format string into r0 */
ldr r1, =num     /* address of num into r1 */
bl  [scanf][8]        /* call scanf (bl = branch with link) */

ldr r1, =num     /* address of num into r1 */
ldr r1, [r1]     /* value at the address into r1 */
bl  collatz      /* call collatz with r1 as the argument */
```

Two labels (addresses) are in play: `format` and `num`, both of which are defined in the `.data` section at the top of the program:


```
num:    .int    0      
format: .asciz  "%u"    
```

The label `num:` is the memory address of a 4-byte integer value, initialized to zero; the label `format:` points to a null-terminated (the "z" in "asciz" for zero) string `"%u"`, which specifies that the scanned input should be converted to an unsigned integer. Accordingly, the first two instructions in the code segment load the address of the format string (`=format`) into register `r0` and the address for the scanned number (`=num`) into register `r1`. Note that each label now starts with an equals sign ("assign address") and that the colon is dropped at the end of each label. The library function `scanf` can take an arbitrary number of arguments, but the first (which `scanf` expects in register `r0`) should be the "address" of a format string. In this example, the second argument to `scanf` is the "address" at which to save the scanned integer.

The last three instructions in the code segment highlight important assembly details. The first `ldr` instruction loads the _address_ of the memory-based integer (`=num`) into register `r1`. However, the `collatz` function expects the _value_ stored at this address, not the address itself; hence, the address is dereferenced to get the value:


```
ldr r1, =num /* load address into r1 */
ldr r1, [r1] /* dereference to get value */
```

The square brackets specify memory and `r1` holds a memory address. The expression `[r1]` thus evaluates to the _value_ stored in memory at address `r1`. The example underscores that registers can hold addresses and values stored at addresses: register `r1` first holds an address and then the value stored at this address.

When the `collatz` function returns to `main`, this function first performs a store operation:


```
ldr r3, =steps /* steps is a memory address */
str r0, [r3]   /* store r0 value at mem[r3] */
```

The label `steps:` is from the `.data` section and register `r0` holds the steps computed in the `collatz` function. The `str` instruction thus saves to memory the length of the hailstone sequence. In a `ldr` instruction, the first operand (a register) is the _target_ for the load; but in a `str` operation, the first operand (also a register) is the _source_ for the store. In both cases, the second operand is a memory location.

Some additional work in `main` sets up the final report:


```
mov r2, r0      /* save count in r2 */
ldr r1, =num    /* recover user input */
ldr r1, [r1]    /* dereference r1 */  
ldr r0, =report /* r0 points to format string */
bl  [printf][7]      /* print report */
```

In the `collatz` function, register `r0` tracks how many steps are needed to reach 1 from the user's input, but the library function `printf` expects its first argument (the address of a format string) to be stored in register `r0`. The return value in register `r0` is therefore copied into register `r2` with the `mov` instruction. The address of the format string for `printf` is then stored in register `r0`.

The argument to the `collatz` function is the scanned input, which is stored in register `r1`; but this register is updated in the `collatz` loop unless the value happens to be 1 at the start. Accordingly, the address `num:` is again copied into `r1` and then dereferenced to get the user's original input. This value becomes the second argument to `printf`, the starting value of the hailstone sequence. With this setup in place, `main` calls `printf` with the `bl` ("branch with link") instruction.

At the very start of the `collatz` loop, the program checks whether the sequence has hit a 1:


```
cmp r1, #1      
beq collatz_end  
```

If register `r1` has 1 as its value, there is a branch (`beq` for "branch if equal") to the end of the `collatz` function, which means a return to its caller `main` with register `r0` as the return value—the number of steps in the hailstone sequence.

The `collatz` function introduces new features and opcodes, which illustrate how efficient assembly code can be. The assembly code, like the C code, checks for N's parity, with register `r1` as N:


```
and r2, r1, #1 /* r2 = r1 &amp; 1 */          
cmp r2, #0     /* is the result even? */
```

The result of the bitwise AND operation on register `r1` and 1 is stored in register `r2`. If the least-significant (rightmost) bit of register `r2` is a 1, then N (register `r1`) is odd, and otherwise, it is even. The result of this comparison (saved in the special-purpose register `cpsr`) is used automatically in forthcoming instructions such as `moveq` ("move if equal") and `addne` ("add if not equal").

The assembly code, like the C code, now avoids an explicit if-else construct. This code segment has the same effect as an if-else test, but the code is more efficient in that no branching is involved—the code executes in straight-line fashion because the conditional tests are built into the instruction opcodes:


```
moveq r1, r1, LSR #1     /* right-shift 1 bit if even */
addne r1, r1, r1, LSL #1 /* left-shift 1 bit and add otherwise */
addne r1, #1             /* add 1 for the + 1 in N = 3N + 1 */
```

The `moveq` (`eq` for "if equal") instruction checks the outcome of the earlier `cmp` test, which determines whether the current value of register `r1` (N) is even or odd. If the value in register `r1` is even, this value must be updated to its half, which is done by a 1-bit right-shift (`LSR #1`). In general, right-shifting an integer is more efficient than explicitly dividing it by two. For example, suppose that register `r1` currently holds 4, whose least significant four bits are:


```
`...0100 ## 4 in binary`
```

Shifting right by 1 bit yields:


```
`...0010 ## 2 in binary`
```

The `LSR` stands for "logical shift right" and contrasts with `ASR` for "arithmetic shift right." An arithmetic shift is sign-preserving (most significant bit of 1 for negative and 0 for non-negative), whereas a logical shift is not, but the hailstone programs deal exclusively with _unsigned_ (hence, non-negative) values. In a logical shift, the shifted bits are replaced by zeros.

If register `r1` holds a value with odd parity, similar straight-line code occurs:


```
addne r1, r1, r1, LSL #1  /* r1 = r1 * 3 */
addne r1, #1              /* r1 = r1 + 1 */
```

The two `addne` instructions (`ne` for "if not equal") execute only if the earlier check for parity indicates an odd value. The first `addne` instruction does multiplication through a 1-bit left-shift and addition. In general, shifting and adding are more efficient than explicitly multiplying. The second `addne` then adds 1 to register `r1` so that the update is from N to 3N+1.

### Assembling the hstoneS program

The assembly source code for the hstoneS program needs to be translated ("assembled") into a binary _object module_, which is then linked with appropriate libraries to become executable. The simplest approach is to use the GNU C compiler in the same way as it is used to compile a C program such as hstoneC:


```
`% gcc -o hstoneS hstoneS.s`
```

This command does the assembling and linking.

A slightly more efficient approach is to use the _as_ utility that ships with the GNU toolset. This approach separates the assembling and the linking. Here is the assembling step:


```
`% as -o hstoneS.o hstoneS.s ## assemble`
```

The extension `.o` is traditional for object modules. The system utility _ld_ then could be used for the linking, but an easier and equally efficient approach is to revert to the _gcc_ command:


```
`% gcc -o hstoneS hstoneS.o ## link`
```

This approach highlights again that the C compiler handles any mix of C and assembly, whether source files or object modules.

### Wrapping up with an explicit system call

The two hailstone programs use the high-level input/output functions `scanf` and `printf`. These functions are high-level in that they deal with formatted types (in this case, unsigned integers) rather than with raw bytes. In an embedded system, however, these functions might not be available; the low-level input/output functions `read` and `write`, which ultimately implement their high-level counterparts, then would be used instead. These two system functions are low-level in that they work with raw bytes.

In Arm6 assembly, a program explicitly calls a system function such as `write` in an indirect manner—by invoking one of the aforementioned functions `svc` or `syscall`, for example:


```
        calls      calls
program-------&gt;svc-------&gt;write
```

The integer identifier for a particular system function (e.g., 4 identifies `write`) goes into the appropriate register (register `r7` for `svc` and register `r0` for `syscall`). The code segments below illustrate, first with `svc` and then with `syscall`.

The two code segments write the traditional greeting to the standard output, which is the screen by default. The standard output has a _file descriptor_, a non-negative integer value that identifies it. The three predefined descriptors are:


```
standard input:  0 (keyboard by default)
standard output: 1 (screen by default)
standard error:  2 (screen by default)
```

Here is the code segment for a sample system call with `svc`:


```
msg: .asciz "Hello, world!\n" /* greeting */
...
mov r0, #1    /* 1 = standard output */
ldr r1, =msg  /* address of bytes to write */
mov r2, #14   /* message length (in bytes) */
mov r7, #4    /* write has 4 as an id */
svc #0        /* system call to write */
```

The function `write` takes three arguments and, when called via `svc`, the function's arguments go into the following registers:

  * `r0` holds the target for the write operation, in this case, the standard output (`#1`).
  * `r1` has the address of the byte(s) to write (`=msg`).
  * `r2` specifies how many bytes are to be written (`#14`).



In the case of the `svc` instruction, register `r7` identifies, with a non-negative integer (in this case, `#4`), which system function to call. The `svc` call returns zero (the `#0`) to signal success but usually a negative value to signal an error.

The `syscall` and `svc` functions differ in detail, but using either to invoke a system function requires the same two steps:

  * Specify the system function to be called (in `r7` for `svc`, in `r0` for `syscall`).
  * Put the arguments for the system function in the appropriate registers, which differ between the `svc` and `syscall` variants.



Here is the `syscall` example of invoking the `write` function:


```
msg: .asciz "Hello, world!\n" /* greeting */
...
mov r1, #1   /* standard output */
ldr r2, =msg /* address of message */
mov r3, #14  /* byte count */
mov r0, #4   /* identifier for write */
syscall
```

C has a thin wrapper not only for the `syscall` function but for the system functions `read` and `write` as well. The C wrapper for `syscall` gives the gist at a high level:


```
syscall(SYS_write,         /* 4 is the id for write */
        STDOUT_FILENO,     /* 1 is the standard output */
        "Hello, world!\n", /* message */
        14);               /* byte length */
```

The direct approach in C uses the wrapper for the system `write` function:


```
`write(STDOUT_FILENO, "Hello, world!\n", 14);`
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/arm6-assembly-language

作者：[Marty Kalin][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mkalindepauledu
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LAW-Internet_construction_9401467_520x292_0512_dc.png?itok=RPkPPtDe (An intersection of pipes.)
[2]: https://www.arm.com/
[3]: https://condor.depaul.edu/mkalin
[4]: https://opensource.com/article/19/8/webassembly-speed-code-reuse
[5]: https://plus.maths.org/content/mathematical-mysteries-hailstone-sequences
[6]: https://en.wikipedia.org/wiki/Collatz_conjecture
[7]: http://www.opengroup.org/onlinepubs/009695399/functions/printf.html
[8]: http://www.opengroup.org/onlinepubs/009695399/functions/scanf.html
[9]: https://en.wikipedia.org/wiki/Endianness

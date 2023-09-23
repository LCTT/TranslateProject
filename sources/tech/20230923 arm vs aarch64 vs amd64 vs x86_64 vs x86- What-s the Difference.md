[#]: subject: "arm vs aarch64 vs amd64 vs x86_64 vs x86: What's the Difference?"
[#]: via: "https://itsfoss.com/arm-aarch64-x86_64/"
[#]: author: "Pratham Patel https://itsfoss.com/author/pratham/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

arm vs aarch64 vs amd64 vs x86_64 vs x86: What's the Difference?
======

Are you someone that is confused by terms like `ARM`, `AArch64`, `x86_64`, `i386`, etc when viewing a datasheet or downloads page of a software? These are called CPU architectures and I will help you dip your toes in this topic of computing.

Following is a table that will provide you with a good summary of what each string means:

**CPU Architecture** | **Description**
---|---
**`x86_64`** /`x86`/`amd64` | Same name for 64-bit AMD/Intel CPUs
**`AArch64`** /`arm64`/`ARMv8`/`ARMv9` | Same name for 64-bit ARM CPUs
**`i386`** | 32-bit AMD/Intel CPUs
**`AArch32`** /`arm`/`ARMv1` to `ARMv7` | Same name for 32-bit ARM CPUs
**`rv64gc`** /`rv64g` | Same name for 64-bit RISC-V CPUs
**`ppc64le`** | 64-bit PowerPC CPUs
with **little-endian memory ordering**

Reading from left to right is the preference of using that term to describe the CPU architecture over the other, alternatively used terms on its right.

If you are nerdy like me and want a more in-depth explanation, do read on!

### General overview: CPU architectures

The terms that I listed above, generally speaking, are CPU architectures. Though, pedantically speaking, these are what a computer engineer calls a CPU ISA (Instruction Set Architecture).

A CPU ISA is what defines how the 1's and 0's of binary are interpreted by your CPU.

There are a few supersets of these CPU ISAs.

  * x86 (AMD/Intel)
  * ARM
  * RISC-V
  * PowerPC (still alive at IBM)



There are more CPU ISAs like MIPS, SPARC, DEC Alpha, etc. But the ones I listed above are the ones that are still widely used today (in some capacity).

The above listed ISAs have at least two subsets. This is mainly based on the _width of the memory bus_. The width of the memory bus denotes how many bits can be transferred between the CPU and the RAM in one go. There are several widths for the memory bus, but the two most important widths are 32-bit wide memory bus and a 64-bit wide memory bus.

💡

The 32-bit counterparts of the CPU ISAs are either a relic of the past, kept alive for legacy support or are only used in micro-controllers. It is safe to assume that ****any new hardware is 64-bit**** (especially consumer facing hardware).

### x86 (AMD/Intel)

The x86 CPU ISA comes primarily from Intel as Intel was the one who created it in the first place with the 8085 micro-processor. The 8085 micro-processor had a 16-bit wide memory bus. Later, AMD came to the game and followed Intel's footsteps until AMD created their own superset 64-bit architecture, surpassing Intel.

The subsets of x86 architecture are as follows:

  * `i386`: If you own a CPU from pre-2007, this is likely your CPU architecture. It is the 32-bit "variant" of the currently known x86 architecture from AMD/Intel.
  * `x86_64`/`x86`/`amd64`: All three terms are used interchangibly depending on the project you look at. But they all refer to the 64-bit "variant" of the x86 AMD/Intel architecture. Regardless, the string `x86_64` is widely used (and preferred) over `x86` and `amd64`. An example of this is that the FreeBSD project refers to the 64-bit x86 architecture as `amd64` while Linux and macOS refer to this as `x86_64`.



💡

Since AMD beat Intel at creating a 64-bit ISA, some projects like FreeBSD refer to the 64-bit variant of x86 as amd64. ****But the more widely accepted term is still**** ****x86_64****.****

The `x86` string for CPU ISA is a special one. You see, during the transition from 32-bit x86 (`i386`) to 64-bit x86 (`x86_64`), the CPU vendors made sure that the CPU can run both, 32-bit _and_ 64-bit instructions. Therefore, sometimes when you read `x86`, it can also mean "It will run only on a 64-bit computer, but if that computer can run 32-bit instructions, you can run 32-bit user software on it."

This ambuiguity of x86--meaning 64-bit processors that can also run 32-bit code--is mainly for/due-to Operating Systems that run on 64-bit processors, but allow the user of said OS to run 32-bit software. Windows makes use of this with a feature called "compatibility mode".

Let's recap, there are two CPU architectures for the CPUs designed by AMD and Intel. They are 32-bit (`i386`) and 64-bit (`x86_84`).

#### Extra _intel_

_(Yeah! I am funny)_

The `x86_64` ISA also has sub-sets. All of these subsets are 64-bit but have various features added. Especially SIMD (Single Instruction Multiple Data) instructions.

  * `x86_64-v1`: The base `x86_64` ISA that almost everyone is familar with. When someone says `x86_64`, they are most likely referring to the `x86_64-v1` ISA.
  * `x86_64-v2`: This adds more instructions like SSE3 (Streaming SIMD Extensions 3) as extensions.
  * `x86_64-v3`: Adds instructions like AVX (Advance Vector eXtensions) and AVX2 which can use **up-to 256-bit wide CPU registers**! This can massively parallelize your computations if you can take advantage.
  * `x86_64-v4`: Iterates upon the `x86_64-v3` ISA by adding more SIMD instruction as extensions. Such as AVX256 and AVX512. The later can use **up-to 512-bit wide CPU registers**!



### ARM

ARM is a company that creates its own specification for a CPU ISA, designs and licenses their own CPU cores and also allows other companies to design their own CPU cores using the ARM CPU ISA. (The last part felt like an SQL query!)

You might have heard about ARM because of SBCs (Single Board Computer) like the Raspberry Pi line up of SBCs. But their CPUs are also widely used in mobile phones. Recently, Apple has switched from `x86_64` processors to using their own design of ARM processors in their laptop and desktop offerings.

Like any CPU architecture, there are two subsets based on the width of the memory bus.

The officially recognised names for the 32-bit and 64-bit ARM architectures are `AArch32` and `AArch64` respectively. The 'AArch' string stands for 'Arm Architecture'. These are **modes** a CPU can be in, for executing instructions.

The actual specification of an instruction that complies with ARM's CPU ISA are named `ARMvX` where _`X`_ refers to a generation number of a specification. To this date, there have been 9 major versions of this specification. Ranging from `ARMv1` to `ARMv7`, which is defines a CPU architecture specification for 32-bit CPUs. While `ARMv8` and `ARMv9` are specifications for the 64-bit ARM CPUs. ([More info here.][1])

💡

Each ARM CPU specification has further sub-specifications. Taking ARMv8 as an example, we have ARMv8-R, ARMv8-A, ARMv8.1-A, ARMv8.2-A, ARMv8.3-A, ARMv8.4-A, ARMv8.5-A, ARMv8.6-A, ARMv8.7-A, ARMv8.8-A and ARMv8.9-A. The -A stands for "Applications cores" and -R stands for "Real-time cores".

You might be wondering why some people call it `arm64` even when `AArch64` is the officially recognized name for 64-bit ARM architecture. The reason is two-folds:

  1. The name `arm64` caught on before `AArch64` was decided upon by ARM. (ARM also refers to the 64-bit ARM architecture as `arm64` in some of it's official documentation... 😬)
  2. [Linus Torvalds dislikes the `AArch64` name.][2] Therefore the Linux codebase largely refers to `AArch64` as `arm64`. But it will still report `aarch64` when you do a `uname -m`.



Therefore, for 32-bit ARM CPUs, you should look for the string `AArch32` but sometimes it might also be `arm` or `armv7`. Similarly, for 64-bit ARM CPUs, you should look for the string `AArch64` but sometimes it might also be `arm64` or `ARMv8` or `ARMv9`.

### RISC-V

RISC-V is an open source specification of a CPU ISA. **This doesn't mean that the CPUs themselves are open source!** It is a standard, kind of like Ethernet. The Ethernet specification is open source but the cables, routers and switches you purchase do cost money. Same deal with RISC-V CPUs. :)

Though, this has not prevented people from creating RISC-V cores that are freely available ( **as designs** ; not as physical cores/SoC) under an open source license. Here is [one such effort][3].

💡

TL;DR: You sould be looking for the string ****rv64gc**** if you are looking for software to run on RISC-V consumer CPUs. This is what a large number of Linux distributions have agreed upon.

Just like any CPU architecture, RISC-V has 32-bit and 64-bit CPU architectures. Since RISC-V is _very new_ (in the terms of a CPU ISA), all major CPU cores in consumer/client side are usually 64-bit CPUs. The 32-bit designs are mostly micro-controllers that have a very specific use-case.

What they do differ in, are CPU extensions. The absolute minimum extension one needs to implement to be called a RISC-V CPU is the 'Base Integer Instruction Set' (`rv64i`).

A table of a few extensions and the description is as below:

**Extension name** | **Description**
---|---
`rv64i` | 64-bit Base Integer Instruction Set ( **mandatory** )
`m` | Multiplication and Division instructions
`a` | Atomic instructions
`f` | Single-precision floating point instructions
`d` | Double-precision floating point instructions
`g` | Alias; A collection of extensions necessary to run a **g** eneral-purpose OS (includes `imafd`)
`c` | Compressed instructions

In the string `rv64i`, `rv` stands for RISC-V, `64` denotes that this is a 64-bit CPU architecture and `i` is the extension for the **mandatory** base integer instruction set. The reason why `rv64i` is written together is because, even though the `i` extension is an "extension", **it is mandatory**.

The convention is to have the extension name in the specific order listed as above. So `rv64g` expands to `rv64imafd`, not to `rv64adfim`.

💡

There are other extensions like Zicsr and Zifencei that sit between the d and g extensions but I deliberately didn't include them as to not scare you off.

So technically, (as of writing this article) rv64g is actually rv64imafdZicsrZifencei. __evil laughter__

### PowerPC

PowerPC was very popular CPU architecture in the early days of Apple, IBM and Motorola partnership. It was the CPU architecture that Apple used in their entire consumer line-up until they switched from PowerPC to Intel's x86.

PowerPC initially had big-endian memory ordering. Later, when a 64-bit architecture was introduced, an option to use little-endianness was added. This was done to be compatible with Intel's memory ordering (to prevent software bugs) which has always been little-endian. I could go on and on about endianness but you are better served with [this Mozilla document][4] to learn more about endianness.

Since endianness is also a factor here, there are 3 architectures of PowerPC:

  * `powerpc`: The 32-bit PowerPC architecture.
  * `ppc64`: The 64-bit PowerPC architecture with **big-endian memory ordering**.
  * `ppc64le`: The 64-bit PowerPC architecture with **little-endian memory ordering**.



As of now, **`ppc64le` is widely used**.

### Conclusion

There are many CPU architectures out there in the wild. For each CPU architecture, there are 32-bit and 64-bit subsets. There are CPUs that offer x86, ARM, RISC-V and PowerPC architectures.

The x86 is the most widely and easily available CPU architecture, since that is what Intel and AMD use. There are also offerings from ARM which are almost exclusively used in mobile phones and accessible SBCs.

RISC-V is in an ongoing effort to make the hardware more widely accessible. I have an SBC that has a RISC-V CPU ;)

PowerPC is mainly found in servers, at least at the moment.

--------------------------------------------------------------------------------

via: https://itsfoss.com/arm-aarch64-x86_64/

作者：[Pratham Patel][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pratham/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/ARM_architecture_family#Cores
[2]: https://lore.kernel.org/lkml/CA+55aFxL6uEre-c=JrhPfts=7BGmhb2Js1c2ZGkTH8F=+rEWDg@mail.gmail.com/
[3]: https://github.com/openhwgroup
[4]: https://developer.mozilla.org/en-US/docs/Glossary/Endianness

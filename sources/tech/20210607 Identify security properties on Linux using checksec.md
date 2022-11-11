[#]: subject: (Identify security properties on Linux using checksec)
[#]: via: (https://opensource.com/article/21/6/linux-checksec)
[#]: author: (Gaurav Kamathe https://opensource.com/users/gkamathe)
[#]: collector: (lujun9972)
[#]: translator: (chai001125)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Identify security properties on Linux using checksec
======
Learn how to use checksec to identify an executable's security
properties, understand what they mean, and know how to use them.
![Target practice][1]

Compiling source code produces a binary. During compilation, you can provide flags to the compiler to enable or disable certain properties on the binary. Some of these properties are relevant to security.

Checksec is a nifty little tool (and shell script) that, among other functions, identifies the security properties that were built into a binary when it was compiled. A compiler might enable some of these properties by default, and you might have to provide specific flags to enable others.

This article explains how to use checksec to identify the security properties on a binary, including:

  1. The underlying commands checksec uses to find information on the security properties
  2. How to enable security properties using the GNU Compiler Collection (GCC) when compiling a sample binary



## Install checksec

To install checksec on Fedora and other RPM-based systems, use:


```
`$ sudo dnf install checksec`
```

For Debian-based distros, use the equivalent `apt` command.

## The shell script

Checksec is a single-file shell script, albeit a rather large one. An advantage is that you can read through the script quickly and understand all the system commands running to find information about binaries or executables:


```
$ file /usr/bin/checksec
/usr/bin/checksec: Bourne-Again shell script, ASCII text executable, with very long lines

$ wc -l /usr/bin/checksec
2111 /usr/bin/checksec
```

Take checksec for a drive with a binary you probably run daily: the ubiquitous `ls` command. The command's format is `checksec --file=` followed by the absolute path of the `ls` binary:


```
$ checksec --file=/usr/bin/ls
RELRO           STACK CANARY      NX            PIE             RPATH      RUNPATH      Symbols         FORTIFY Fortified       Fortifiable     FILE
Full RELRO      Canary found      NX enabled    PIE enabled     No RPATH   No RUNPATH   No Symbols        Yes   5       17              /usr/bin/ls
```

When you run this in a terminal, you see color-coding that shows what is good and what probably isn't. I say "probably" because even if something is in red, it doesn't necessarily mean things are horrible—it might just mean the distro vendors made some tradeoffs when compiling the binaries.

The first line provides various security properties that are usually available for binaries, like `RELRO`, `STACK CANARY`, `NX`, and so on (I explain in detail below). The second line shows the status of these properties for the given binary (`ls`, in this case). For example, `NX enabled` means some property is enabled for this binary.

## A sample binary

For this tutorial, I'll use the following "hello world" program as the sample binary.


```
#include &lt;stdio.h&gt;

int main()
{
        [printf][2]("Hello World\n");
        return 0;
}
 
```

Note that I did not provide `gcc` with any additional flags during compilation:


```
$ gcc hello.c -o hello
 
$ file hello
hello: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=014b8966ba43e3ae47fab5acae051e208ec9074c, for GNU/Linux 3.2.0, not stripped

$ ./hello
Hello World
```

Run the binary through checksec. Some of the properties are different than with the `ls` command above (on your screen, these may be displayed in red):


```
$ checksec --file=./hello
RELRO           STACK CANARY      NX            PIE             RPATH      RUNPATH      Symbols         FORTIFY Fortified       Fortifiable     FILE
Partial RELRO   No canary found   NX enabled    No PIE          No RPATH   No RUNPATH   85) Symbols       No    0       0./hello
$
```

## Changing the output format

Checksec allows various output formats, which you can specify with `--output`. I'll choose the JSON format and pipe the output to the `jq` utility for pretty printing.

To follow along, [ensure you have `jq` installed][3] because this tutorial uses this output format to quickly grep for specific properties from the output and report `yes` or `no` on each:


```
$ checksec --file=./hello --output=json | jq
{
  "./hello": {
    "relro": "partial",
    "canary": "no",
    "nx": "yes",
    "pie": "no",
    "rpath": "no",
    "runpath": "no",
    "symbols": "yes",
    "fortify_source": "no",
    "fortified": "0",
    "fortify-able": "0"
  }
}
```

## Walking through the security properties

The binary above includes several security properties. I'll compare that binary against the `ls` binary above to examine what is enabled and explain how checksec found this information.

### 1\. Symbols

I'll start with the easy one first. During compilation, certain symbols are included in the binary, mostly for debugging. These symbols are required when you are developing software and require multiple cycles for debugging and fixing things.

These symbols are usually stripped (removed) from the final binary before it's released for general use. This does not affect the binary's execution in any way; it will run just as it would with the symbols. Stripping is often done to save space, as the binary is somewhat lighter once the symbols have been stripped. In closed-source or proprietary software, symbols often are removed because having these symbols in a binary makes it somewhat easy to infer the software's inner workings.

According to checksec, symbols are present in this binary, yet they were not in the `ls` binary. You can also find this information by running the `file` command on the program—you see `not stripped` in the output towards the end:


```
$ checksec --file=/bin/ls --output=json | jq | grep symbols
    "symbols": "no",

$ checksec --file=./hello --output=json | jq | grep symbols
    "symbols": "yes",

$ file hello
hello: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=014b8966ba43e3ae47fab5acae051e208ec9074c, for GNU/Linux 3.2.0, not stripped
```

How did checksec find this information? Well, it provides a handy `--debug` option to show which functions ran. Therefore, running the following command should show you which functions ran within the shell script:


```
`$ checksec --debug --file=./hello`
```

In this tutorial, I'm looking for the underlying commands used to find this information. Since it's a shell script, you can always utilize Bash features. This command will output every command that ran from within the shell script:


```
`$ bash -x /usr/bin/checksec --file=./hello`
```

If you scroll through the output, you should see an `echo_message` followed by the security property's category. Here is what checksec reports about whether the binary contains symbols:


```
\+ readelf -W --symbols ./hello
\+ grep -q '\\.symtab'
\+ echo_message '\033[31m96) Symbols\t\033[m  ' Symbols, ' symbols="yes"' '"symbols":"yes",'
```

To simplify this, checksec utilizes the `readelf` utility to read the binary and provides a special `--symbols` flag that lists all symbols within the binary. Then it greps for a special value, `.symtab`, that provides a count of entries (symbols) it finds. You can try out the following commands on the test binary you compiled above:


```
$ readelf -W --symbols ./hello
$ readelf -W --symbols ./hello | grep -i symtab
```

## How to strip symbols

You can strip symbols after compilation or during compilation.

  * **Post compilation:** After compilation, you can use the `strip` utility on the binary to remove the symbols. Confirm it worked using the `file` command, which now shows the output as `stripped`: [code] $ gcc hello.c -o hello
$
$ file hello
hello: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=322037496cf6a2029dcdcf68649a4ebc63780138, for GNU/Linux 3.2.0, not stripped
$
$ strip hello
$
$ file hello
hello: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=322037496cf6a2029dcdcf68649a4ebc63780138, for GNU/Linux 3.2.0, stripped
$ 
```
## How to strip symbols during compilation

Instead of stripping symbols manually after compilation, you can ask the compiler to do it for you by providing the `-s` argument:
```


$ gcc -s hello.c -o hello
$
$ file hello
hello: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=247de82a8ad84e7d8f20751ce79ea9e0cf4bd263, for GNU/Linux 3.2.0, stripped
$

```
After rerunning checksec, you can see that `symbols` are shown as `no`:
```


$ checksec --file=./hello --output=json | jq | grep symbols
    "symbols": "no",
$

```
### 2\. Canary

Canaries are known values that are placed between a buffer and control data on the _stack_ to monitor buffer overflows. When an application executes, two kinds of memory are assigned to it.  One of them is a _stack_, which is simply a data structure with two operations: `push`, which puts data onto the stack, and `pop`, which removes data from the stack in reverse order. Malicious input could overflow or corrupt the stack with specially crafted input and cause the program to crash:
```


$ checksec --file=/bin/ls --output=json | jq | grep canary
    "canary": "yes",
$
$ checksec --file=./hello --output=json | jq | grep canary
    "canary": "no",
$

```
How does checksec find out if the binary is enabled with a canary? Using the method above, you can narrow it down by running the following command within the shell script:
```
`$ readelf -W -s ./hello | grep -E '__stack_chk_fail|__intel_security_cookie'`
```
#### Enable canary

To protect against these cases, the compiler provides the `-stack-protector-all` flag, which adds extra code to the binary to check for such buffer overflows:
```


$ gcc -fstack-protector-all hello.c -o hello

$ checksec --file=./hello --output=json | jq | grep canary
    "canary": "yes",

```
Checksec shows that the property is now enabled. You can also verify this with:
```


$ readelf -W -s ./hello | grep -E '__stack_chk_fail|__intel_security_cookie'
     2: 0000000000000000     0 FUNC    GLOBAL DEFAULT  UND __stack_chk_fail@GLIBC_2.4 (3)
    83: 0000000000000000     0 FUNC    GLOBAL DEFAULT  UND __stack_chk_fail@@GLIBC_2.4
$

```
### 3\. PIE

PIE stands for position-independent executable. As the name suggests, it's code that is placed somewhere in memory for execution regardless of its absolute address:
```


$ checksec --file=/bin/ls --output=json | jq | grep pie
    "pie": "yes",

$ checksec --file=./hello --output=json | jq | grep pie
    "pie": "no",

```
Often, PIE is enabled only for libraries and not for standalone command-line programs. In the output below, `hello` is shown as `LSB executable`, whereas, the `libc` standard library (`.so`) file is marked `LSB shared object`:
```


$ file hello
hello: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=014b8966ba43e3ae47fab5acae051e208ec9074c, for GNU/Linux 3.2.0, not stripped

$ file /lib64/libc-2.32.so
/lib64/libc-2.32.so: ELF 64-bit LSB shared object, x86-64, version 1 (GNU/Linux), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=4a7fb374097fb927fb93d35ef98ba89262d0c4a4, for GNU/Linux 3.2.0, not stripped

```
Checksec tries to find this information with:
```


$ readelf -W -h ./hello | grep EXEC
  Type:                              EXEC (Executable file)

```
If you try the same command on a shared library instead of `EXEC`, you will see a `DYN`:
```


$ readelf -W -h /lib64/libc-2.32.so | grep DYN
  Type:                              DYN (Shared object file)

```
#### Enable PIE

To enable PIE on a test program, send the following arguments to the compiler:
```
`$ gcc -pie -fpie hello.c -o hello`
```
You can verify PIE is enabled using checksec:
```


$ checksec --file=./hello --output=json | jq | grep pie
    "pie": "yes",
$

```
It should show as a PIE executable with the type changed from `EXEC` to `DYN`:
```


$ file hello
hello: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=bb039adf2530d97e02f534a94f0f668cd540f940, for GNU/Linux 3.2.0, not stripped

$ readelf -W -h ./hello | grep DYN
  Type:                              DYN (Shared object file)

```
### 4\. NX

NX stands for "non-executable." It's often enabled at the CPU level, so an operating system with NX enabled can mark certain areas of memory as non-executable. Often, buffer-overflow exploits put code on the stack and then try to execute it. However, making this writable area non-executable can prevent such attacks. This property is enabled by default during regular compilation using `gcc`:
```


$ checksec --file=/bin/ls --output=json | jq | grep nx
    "nx": "yes",

$ checksec --file=./hello --output=json | jq | grep nx
    "nx": "yes",

```
Checksec determines this information with the command below. `RW` towards the end means the stack is readable and writable; since there is no `E`, it's not executable:
```


$ readelf -W -l ./hello | grep GNU_STACK
  GNU_STACK      0x000000 0x0000000000000000 0x0000000000000000 0x000000 0x000000 RW  0x10

```
#### Disable NX for demo purposes

It's not recommended, but you can disable `NX` when compiling a program by using the `-z execstack` argument:
```


$ gcc -z execstack hello.c -o hello

$ checksec --file=./hello --output=json | jq | grep nx
    "nx": "no",

```
Upon compilation, the stack becomes executable (`RWE`), which allows malicious code to execute:
```


$ readelf -W -l ./hello | grep GNU_STACK
  GNU_STACK      0x000000 0x0000000000000000 0x0000000000000000 0x000000 0x000000 RWE 0x10

```
### 5\. RELRO

RELRO stands for Relocation Read-Only. An Executable Linkable Format (ELF) binary uses a Global Offset Table (GOT) to resolve functions dynamically. When enabled, this security property makes the GOT within the binary read-only, which prevents some form of relocation attacks:
```


$ checksec --file=/bin/ls --output=json | jq | grep relro
    "relro": "full",

$ checksec --file=./hello --output=json | jq | grep relro
    "relro": "partial",

```
Checksec finds this information by using the command below. Here, one of the RELRO properties is enabled; therefore, the binary shows "partial" when verifying via checksec:
```


$ readelf -W -l ./hello | grep GNU_RELRO
  GNU_RELRO      0x002e10 0x0000000000403e10 0x0000000000403e10 0x0001f0 0x0001f0 R   0x1

$ readelf -W -d ./hello | grep BIND_NOW

```
#### Enable full RELRO

To enable full RELRO, use the following command-line arguments when compiling with `gcc`:
```


$ gcc -Wl,-z,relro,-z,now hello.c -o hello

$ checksec --file=./hello --output=json | jq | grep relro
    "relro": "full",

```
Now, the second property is also enabled, making the program full RELRO:
```


$ readelf -W -l ./hello | grep GNU_RELRO
  GNU_RELRO      0x002dd0 0x0000000000403dd0 0x0000000000403dd0 0x000230 0x000230 R   0x1

$ readelf -W -d ./hello | grep BIND_NOW
 0x0000000000000018 (BIND_NOW)          

```
### 6\. Fortify

Fortify is another security property, but it's out of scope for this article. I will leave learning how checksec verifies fortify in binaries and how it's enabled with `gcc` as an exercise for you to tackle.
```


$ checksec --file=/bin/ls --output=json | jq  | grep -i forti
    "fortify_source": "yes",
    "fortified": "5",
    "fortify-able": "17"

$ checksec --file=./hello --output=json | jq  | grep -i forti
    "fortify_source": "no",
    "fortified": "0",
    "fortify-able": "0"

```
## Other checksec features

The topic of security is never-ending, and while it's not possible to cover everything here, I do want to mention a few more features of the `checksec` command that make it a pleasure to work with.

### Run against multiple binaries

You don't have to provide each binary to checksec individually. Instead, you can provide a directory path where multiple binaries reside, and checksec will verify all of them for you in one go:
```
`$ checksec --dir=/usr

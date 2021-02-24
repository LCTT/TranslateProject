[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cross-compiling made easy with Golang)
[#]: via: (https://opensource.com/article/21/1/go-cross-compiling)
[#]: author: (Gaurav Kamathe https://opensource.com/users/gkamathe)

Cross-compiling made easy with Golang
======
I learned about Go's cross-compilation capabilities by stepping out of
my comfort zone.
![Person using a laptop][1]

I work with multiple servers with various architectures (e.g., Intel, AMD, Arm, etc.) when I'm testing software on Linux. Once I've [provisioned a Linux box][2] and the server meets my testing needs, I still have a number of steps to do:

  1. Download and install prerequisite software.
  2. Verify whether new test packages for the software I'm testing are available on the build server.
  3. Get and set the required yum repos for the dependent software packages.
  4. Download and install the new test packages (based on step #2).
  5. Get and set up the required SSL certificates.
  6. Set up the test environment, get the required Git repos, change configurations in files, restart daemons, etc.
  7. Do anything else that needs to be done.



### Script it all away

These steps are so routine that it makes sense to automate them and save the script to a central location (like a file server) where I can download it when I need it. I did this by writing a 100–120-line Bash shell script that does all the configuration for me (including error checks). The script simplifies my workflow by:

  1. Provisioning a new Linux system (of the architecture under test)
  2. Logging into the system and downloading the automated shell script from a central location
  3. Running it to configure the system
  4. Starting the testing



### Enter Go

I've wanted to learn [Golang][3] for a while, and converting my beloved shell script into a Go program seemed like a good project to help me get started. The syntax seemed fairly simple, and after trying out some test programs, I set out to advance my knowledge and become familiar with the Go standard library.

It took me a week to write the Go program on my laptop. I tested my program often on my go-to x86 server to weed our errors and improve the program. Everything worked fine.

I continued relying on my shell script until I finished the Go program. Then I pushed the binary onto a central file server so that every time I provisioned a new server, all I had to do was wget the binary, set the executable bit on, and run the binary. I was happy with the early results:


```
$ wget <http://file.example.com/\>&lt;myuser&gt;/bins/prepnode
$ chmod  +x ./prepnode
$ ./prepnode
```

### And then, an issue

The next week, I provisioned a fresh new server from the pool, as usual, downloaded the binary, set the executable bit, and ran the binary. It errored out—with a strange error:


```
$ ./prepnode
bash: ./prepnode: cannot execute binary file: Exec format error
$
```

At first, I thought maybe the executable bit was not set. However, it was set as expected:


```
$ ls -l prepnode
-rwxr-xr-x. 1 root root 2640529 Dec 16 05:43 prepnode
```

What happened? I didn't make any changes to the source code, the compilation threw no errors nor warnings, and it worked well the last time I ran it, so I looked more closely at the error message, `format error`.

I checked the binary's format, and everything looked OK:


```
$ file prepnode
prepnode: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, not stripped
```

I quickly ran the following command to identify the architecture of the test server I provisioned and where the binary was trying to run. It was Arm64 architecture, but the binary I compiled (on my x86 laptop) was generating an x86-64 format binary:


```
$ uname -m
aarch64
```

### Compilation 101 for scripting folks

Until then, I had never accounted for this scenario (although I knew about it). I primarily work on scripting languages (usually Python) coupled with shell scripting. The Bash shell and the Python interpreter are available on most Linux servers of any architecture. Hence, everything had worked well before.

However, now I was dealing with a compiled language, Go, which produces an executable binary. The compiled binary consists of [opcodes][4] or assembly instructions that are tied to a specific architecture. That's why I got the format error. Since the Arm64 CPU (where I ran the binary) could not interpret the binary's x86-64 instructions, it errored out. Previously, the shell and Python interpreter took care of the underlying opcodes or architecture-specific instructions for me.

### Cross-compiling with Go

I checked the Golang docs and discovered that to produce an Arm64 binary, all I had to do was set two environment variables when compiling the Go program before running the `go build` command.

`GOOS` refers to the operating system (Linux, Windows, BSD, etc.), while `GOARCH` refers to the architecture to build for.


```
`$ env GOOS=linux GOARCH=arm64 go build -o prepnode_arm64`
```

After building the program, I reran the `file` command, and this time it showed Arm AArch64 instead of the x86 it showed before. Therefore, I was able to build a binary for a different architecture than the one on my laptop:


```
$ file prepnode_arm64
prepnode_arm64: ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), statically linked, not stripped
```

I copied the binary onto the Arm server from my laptop. Now, running the binary (after setting the executable bit on) produced no errors:


```
$ ./prepnode_arm64  -h
Usage of ./prepnode_arm64:
  -c    Clean existing installation
  -n    Do not start test run (default true)
  -s    Use stage environment, default is qa
  -v    Enable verbose output
```

### What about other architectures?

x86 and Arm are two of the five architectures I test software on. I was worried that Go might not support the other ones, but that was not the case. You can find out which architectures Go supports with:


```
`$ go tool dist list`
```

Go supports a variety of platforms and operating systems, including:

  * AIX
  * Android
  * Darwin
  * Dragonfly
  * FreeBSD
  * Illumos
  * JavaScript
  * Linux
  * NetBSD
  * OpenBSD
  * Plan 9
  * Solaris
  * Windows



To find the specific Linux architectures it supports, run:


```
`$ go tool dist list | grep linux`
```

As the output below shows, Go supports all of the architectures I use. Although x86_64 is not on the list, AMD64 is compatible with x86_64, so you can produce an AMD64 binary, and it will run fine on x86 architecture:


```
$ go tool dist list | grep linux
linux/386
linux/amd64
linux/arm
linux/arm64
linux/mips
linux/mips64
linux/mips64le
linux/mipsle
linux/ppc64
linux/ppc64le
linux/riscv64
linux/s390x
```

### Handling all architectures

Generatiing binaries for all of the architectures under my test is as simple as writing a tiny shell script from my x86 laptop:


```
#!/usr/bin/bash
archs=(amd64 arm64 ppc64le ppc64 s390x)

for arch in ${archs[@]}
do
        env GOOS=linux GOARCH=${arch} go build -o prepnode_${arch}
done

[/code] [code]

$ file prepnode_*
prepnode_amd64:   ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, Go BuildID=y03MzCXoZERH-0EwAAYI/p909FDnk7xEUo2LdHIyo/V2ABa7X_rLkPNHaFqUQ6/5p_q8MZiR2WYkA5CzJiF, not stripped
prepnode_arm64:   ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), statically linked, Go BuildID=q-H-CCtLv__jVOcdcOpA/CywRwDz9LN2Wk_fWeJHt/K4-3P5tU2mzlWJa0noGN/SEev9TJFyvHdKZnPaZgb, not stripped
prepnode_ppc64:   ELF 64-bit MSB executable, 64-bit PowerPC or cisco 7500, version 1 (SYSV), statically linked, Go BuildID=DMWfc1QwOGIq2hxEzL_u/UE-9CIvkIMeNC_ocW4ry/r-7NcMATXatoXJQz3yUO/xzfiDIBuUxbuiyaw5Goq, not stripped
prepnode_ppc64le: ELF 64-bit LSB executable, 64-bit PowerPC or cisco 7500, version 1 (SYSV), statically linked, Go BuildID=C6qCjxwO9s63FJKDrv3f/xCJa4E6LPVpEZqmbF6B4/Mu6T_OR-dx-vLavn1Gyq/AWR1pK1cLz9YzLSFt5eU, not stripped
prepnode_s390x:   ELF 64-bit MSB executable, IBM S/390, version 1 (SYSV), statically linked, Go BuildID=faC_HDe1_iVq2XhpPD3d/7TIv0rulE4RZybgJVmPz/o_SZW_0iS0EkJJZHANxx/zuZgo79Je7zAs3v6Lxuz, not stripped
```

Now, whenever I provision a new machine, I just run this wget command to download the binary for a specific architecture, set the executable bit on, and run the binary:


```
$ wget <http://file.domain.com/\>&lt;myuser&gt;/bins/prepnode_&lt;arch&gt;
$ chmod +x ./prepnode_&lt;arch&gt;
$ ./prepnode_&lt;arch&gt;
```

### But why?

You may be wondering why I didn't save all of this hassle by sticking to shell scripts or porting the program over to Python instead of a compiled language. All fair points. But then I wouldn't have learned about Go's cross-compilation capabilities and how programs work underneath the hood when they're executing on the CPU. In computing, there are always trade-offs to be considered, but never let them stop you from learning.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/go-cross-compiling

作者：[Gaurav Kamathe][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://opensource.com/article/20/12/linux-server
[3]: https://golang.org/
[4]: https://en.wikipedia.org/wiki/Opcode

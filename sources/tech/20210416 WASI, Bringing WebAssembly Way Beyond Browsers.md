[#]: subject: (WASI, Bringing WebAssembly Way Beyond Browsers)
[#]: via: (https://www.linux.com/news/wasi-bringing-webassembly-way-beyond-browsers/)
[#]: author: (Dan Brown https://training.linuxfoundation.org/announcements/wasi-bringing-webassembly-way-beyond-browsers/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

WASI, Bringing WebAssembly Way Beyond Browsers
======

_By Marco Fioretti_

[WebAssembly (Wasm)][1] is a binary software format that all browsers can run directly, [safely][2] and at near-native speeds, on any operating system (OS). Its biggest promise, however, is to eventually work in the same way [everywhere][3], from IoT devices and edge servers, to mobile devices and traditional desktops. This post introduces the main interface that should make this happen. The next post in this series will describe some of the already available, real-world implementations and applications of the same interface.

**What is portability, again?**

To be safe and portable, software code needs, as a minimum: 

  1. guarantees that users and programs can do only what they actually _have_ the right to do, and only do it without creating problems to other programs or users
  2. standard, platform-independent methods to declare and apply those guarantees



Traditionally, these services are provided by libraries of “system calls” for each language, that is functions with which a software program can ask its host OS to perform some low-level, or sensitive task. When those libraries follow standards like [POSIX][4], any compiler can automatically combine them with the source code, to produce a binary file that can run on _some_ combination of OSes and processors.

**The next level: BINARY compatibility**

System calls only make _source code_ portable across platforms. As useful as they are, they still force developers to generate platform-specific executable files, all too often from more or less different combinations of source code.

WebAssembly instead aims to get to the next level: use any language you want, then compile it once, to produce one binary file that will _just run_, securely, in any environment that recognizes WebAssembly. 

**What Wasm does not need to work outside browsers**

Since WebAssembly already “compiles once” for all major browsers, the easiest way to expand its reach may seem to create, for every target environment, a full virtual machine (runtime) that provides everything a Wasm module expects from Firefox or Chrome.

Work like that however would be _really_ complex, and above all simply unnecessary, if not impossible, in many cases (e.g. on IoT devices). Besides, there are better ways to secure Wasm modules than dumping them in one-size-fits-all sandboxes as browsers do today.

**The solution? A virtual operating system and runtime**

Fully portable Wasm modules cannot happen until, to give one practical example, accesses to webcams or websites can be written only with system calls that generate platform-dependent machine code.

Consequently, the most practical way to have such modules, from _any_ programming language, seems to be that of the [WebAssembly System interface (WASI) project][5]: write and compile code for only _one, obviously virtual,_ but complete operating system.

On one hand WASI gives to all the developers of [Wasm runtimes][6] one single OS to emulate. On the other, WASI gives to all programming languages one set of system calls to talk to that same OS.

In this way, even if you loaded it on ten different platforms, a _binary_ Wasm module calling a certain WASI function would still get – from the runtime that launched it – a different binary object every time. But since all those objects would interact with that single Wasm module in exactly the same way, it would not matter!

This approach would work also in the first use case of WebAssembly, that is with the JavaScript virtual machines inside web browsers. To run Wasm modules that use WASI calls, those machines should only load the JavaScript versions of the corresponding libraries.

This OS-level emulation is also more secure than simple sandboxing. With WASI, any runtime can implement different versions of each system call – with different security privileges – as long as they all follow the specification. Then that runtime could place every instance of every Wasm module it launches into a separate sandbox, containing only the smallest, and least privileged combination of functions that that specific instance really needs.

This “principle of least privilege”, or “[capability-based security model][7]“, is everywhere in WASI. A WASI runtime can pass into a sandbox an instance of the “open” system call that is only capable of opening the specific files, or folders, that were _pre-selected_ by the runtime itself. This is a more robust, much more granular control on what programs can do than it would be possible with traditional file permissions, or even with chroot systems.

Coding-wise, functions for things like basic management of files, folders, network connections or time are needed by almost any program. Therefore the corresponding WASI interfaces are designed as similar as possible to their POSIX equivalents, and all packaged into one “wasi-core” module, that every WASI-compliant runtime must contain.

A version of the [libc][8] standard C library, rewritten usi wasi-core functions, is already available and, [according to its developers][9], already “sufficiently stable and usable for many purposes”. 

All the other virtual interfaces that WASI includes, or will include over time, are standardized and packaged as separate modules,  without forcing any runtime to support all of them. In the next article we will see how some of these WASI components are already used today.

The post [WASI, Bringing WebAssembly Way Beyond Browsers][10] appeared first on [Linux Foundation – Training][11].

--------------------------------------------------------------------------------

via: https://www.linux.com/news/wasi-bringing-webassembly-way-beyond-browsers/

作者：[Dan Brown][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://training.linuxfoundation.org/announcements/wasi-bringing-webassembly-way-beyond-browsers/
[b]: https://github.com/lujun9972
[1]: https://training.linuxfoundation.org/announcements/an-introduction-to-webassembly/
[2]: https://training.linuxfoundation.org/announcements/webassembly-security-now-and-in-the-future/
[3]: https://webassembly.org/docs/non-web/
[4]: https://www.gnu.org/software/libc/manual/html_node/POSIX.html#POSIX
[5]: https://hacks.mozilla.org/2019/03/standardizing-wasi-a-webassembly-system-interface/
[6]: https://github.com/appcypher/awesome-wasm-runtimes
[7]: https://github.com/WebAssembly/WASI/blob/main/docs/WASI-overview.md#capability-oriented
[8]: https://en.wikipedia.org/wiki/C_standard_library
[9]: https://github.com/WebAssembly/wasi-libc
[10]: https://training.linuxfoundation.org/announcements/wasi-bringing-webassembly-way-beyond-browsers/
[11]: https://training.linuxfoundation.org/

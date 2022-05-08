[#]: subject: (WebAssembly Security, Now and in the Future)
[#]: via: (https://www.linux.com/news/webassembly-security-now-and-in-the-future/)
[#]: author: (Dan Brown https://training.linuxfoundation.org/announcements/webassembly-security-now-and-in-the-future/)
[#]: collector: (lujun9972)
[#]: translator: (hanszhao80)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

WebAssembly Security, Now and in the Future
======

_By Marco Fioretti_

**Introduction**

WebAssembly is, as we [explained recently][1], a binary format for software written in any language, designed to eventually run on any platform without changes. The first application of WebAssembly is inside web browsers, to make websites faster and more interactive. Plans to push WebAssembly beyond the Web, from servers of all sorts to the Internet of Things (IoT), create as many opportunities as security issues. This post is an introductory overview of those issues and of the WebAssembly security model.

**WebAssembly is like JavaScript**

Inside web browsers, WebAssembly modules are managed by the same Virtual Machine (VM) that executes JavaScript code. Therefore, WebAssembly may be used to do much of the same harm that is doable with JavaScript, just more efficiently and less visibly. Since JavaScript is plain text that the browser will compile, and WebAssembly a ready-to-run binary format, the latter runs faster, and is also harder to scan (even by antivirus software) for malicious instructions.

This “code obfuscation” effect of WebAssembly has been already used, among other things, to pop up unwanted advertising or to open fake “tech support” windows that ask for sensitive data. Another trick is to automatically redirect browsers to “landing” pages that contain the really dangerous malware.

Finally, WebAssembly may be used, just like JavaScript, to “steal” processing power instead of data. In 2019, an [analysis of 150 different Wasm modules][2] found out that about _32%_ of them were used for cryptocurrency-mining.

**WebAssembly sandbox, and interfaces**

WebAssembly code runs closed into a [sandbox][3] managed by the VM, not by the operating system. This gives it no visibility of the host computer, or ways to interact directly with it. Access to system resources, be they files, hardware or internet connections, can only happen through the WebAssembly System Interface (WASI) provided by that VM.

The WASI is different from most other application programming interfaces, with unique security characteristics that are truly driving the adoption of WASM on servers/edge computing scenarios, and will be the topic of the next post. Here, it is enough to say that its security implications greatly vary, when moving from the web to other environments. Modern web browsers are terribly complex pieces of software, but lay on decades of experience, and of daily tests from billions of people. Compared to browsers, servers or IoT devices are almost uncharted lands. The VMs for those platforms will require extensions of WASI and thus, in turn, surely introduce new security challenges.

**Memory and code management in WebAssembly**

Compared to normal compiled programs, WebAssembly applications have very restricted access to memory, and to themselves too. WebAssembly code cannot directly access functions or variables that are not yet called, jump to arbitrary addresses or execute data in memory as bytecode instructions.

Inside browsers, a Wasm module only gets one, global array (“linear memory”) of contiguous bytes to play with. WebAssembly can directly read and write any location in that area, or request an increase in its size, but that’s all. This linear memory is also separated from the areas that contain its actual code, execution stack, and of course the virtual machine that runs WebAssembly. For browsers, all these data structures are ordinary JavaScript objects, insulated from all the others using standard procedures.

**The result: good, but not perfect**

All these restrictions make it quite hard for a WebAssembly module to misbehave, but not impossible.

The sandboxed memory that makes it almost impossible for WebAssembly to touch what is _outside_ also makes it harder for the operating system to prevent bad things from happening _inside_. Traditional memory monitoring mechanisms like [“stack canaries”][4], which notice if some code tries to mess with objects that it should not touch, [cannot work there][5].

The fact that WebAssembly can only access its own linear memory, but directly, may also _facilitate_ the work of attackers. With those constraints, and access to the source code of a module, it is much easier to guess which memory locations could be overwritten to make the most damage. It also seems [possible][6] to corrupt local variables, because they stay in an unsupervised stack in the linear memory.

A 2020 paper on the [binary security of WebAssembly][5] noted that WebAssembly code can still overwrite string literals in supposedly constant memory. The same paper describes other ways in which WebAssembly may be less secure than when compiled to a native binary, on three different platforms (browsers, server-side applications on Node.js, and applications for stand-alone WebAssembly VMs) and is recommended further reading on this topic.

In general, the idea that WebAssembly can only damage what’s inside its own sandbox can be misleading. WebAssembly modules do the heavy work for the JavaScript code that calls them, exchanging variables every time. If they write into any of those variables code that may cause crashes or data leaks in the unsafe JavaScript that called WebAssembly, those things _will_ happen.

**The road ahead**

Two emerging features of WebAssembly that will surely impact its security (how and how much, it’s too early to tell) are [concurrency][7], and internal garbage collection.

Concurrency is what allows several WebAssembly modules to run in the same VM simultaneously. Today this is possible only through JavaScript [web workers][8], but better mechanisms are under development. Security-wise, they may bring in [“a lot of code… that did not previously need to be”][9], that is more ways for things to go wrong.

A [native Garbage Collector][10] is needed to increase performance and security, but above all to use WebAssembly outside the well-tested Java VMs of browsers, that collect all the garbage inside themselves anyway. Even this new code, of course, may become another entry point for bugs and attacks.

On the positive side, general strategies to make WebAssembly even safer than it is today also exist. Quoting again from [here][5], they include compiler improvements, _separate_ linear memories for stack, heap and constant data, and avoiding to compile as WebAssembly modules code in “unsafe languages, such as C”.

The post [WebAssembly Security, Now and in the Future][11] appeared first on [Linux Foundation – Training][12].

--------------------------------------------------------------------------------

via: https://www.linux.com/news/webassembly-security-now-and-in-the-future/

作者：[Dan Brown][a]
选题：[lujun9972][b]
译者：[hanszhao80](https://github.com/hanszhao80)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://training.linuxfoundation.org/announcements/webassembly-security-now-and-in-the-future/
[b]: https://github.com/lujun9972
[1]: https://training.linuxfoundation.org/announcements/an-introduction-to-webassembly/
[2]: https://www.sec.cs.tu-bs.de/pubs/2019a-dimva.pdf
[3]: https://webassembly.org/docs/security/
[4]: https://ctf101.org/binary-exploitation/stack-canaries/
[5]: https://www.usenix.org/system/files/sec20-lehmann.pdf
[6]: https://spectrum.ieee.org/tech-talk/telecom/security/more-worries-over-the-security-of-web-assembly
[7]: https://github.com/WebAssembly/threads
[8]: https://en.wikipedia.org/wiki/Web_worker
[9]: https://googleprojectzero.blogspot.com/2018/08/the-problems-and-promise-of-webassembly.html
[10]: https://github.com/WebAssembly/gc/blob/master/proposals/gc/Overview.md
[11]: https://training.linuxfoundation.org/announcements/webassembly-security-now-and-in-the-future/
[12]: https://training.linuxfoundation.org/

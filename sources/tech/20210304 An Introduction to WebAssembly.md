[#]: subject: (An Introduction to WebAssembly)
[#]: via: (https://www.linux.com/news/an-introduction-to-webassembly/)
[#]: author: (Dan Brown https://training.linuxfoundation.org/announcements/an-introduction-to-webassembly/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

An Introduction to WebAssembly
======

_By Marco Fioretti_

## **What on Earth is WebAssembly?**

[WebAssembly, also called Wasm][1], is a Web-optimized code format and API (Application Programming Interface) that can greatly improve the performances and capabilities of websites. Version 1.0 of WebAssembly, was released in 2017, and became an official W3C standard in 2019.

The standard is actively supported by all major browser suppliers, for obvious reasons: the official list of [“inside the browser” use cases][2] mentions, among other things, video editing, 3D games, virtual and augmented reality, p2p services, and scientific simulations. Besides making browsers much more powerful than JavaScript could, this standard may even extend the lifespan of websites: for example, it is WebAssembly that powers the continued support of [Flash animations and games at the Internet Archive][3].

WebAssembly isn’t just for browsers though; it is currently being used in mobile and edge based environments with such products as Cloudflare Workers.

## **How WebAssembly works**

Files in .wasm format contain low level binary instructions (bytecode), executable at “near CPU-native speed” by a virtual machine that uses a common stack. The code is packaged in modules – that is objects that are directly executable by a browser – and each module can be instantiated multiple times by a web page. The functions defined inside modules are listed in one dedicated array, or Table, and the corresponding data are contained in another structure, called arraybuffer. Developers can explicitly allocate memory for .wasm code with the Javascript WebAssembly.memory() call.

A pure text version of the .wasm format – that can greatly simplify learning and debugging – is also available. WebAssembly, however, is not really intended for direct human use. Technically speaking, .wasm is just a browser-compatible **compilation target**: a format in which software compilers can automatically translate code written in high-level programming languages.

This choice is exactly what allows developers to program directly for the preferred user interface of billions of people, in languages they already know (C/C++, Python, Go, Rust and others) but could not be efficiently used by browsers before. Even better, programmers would get this – at least in theory – without ever looking directly at WebAssembly code or worrying (since the target is a **virtual** machine) about which physical CPUs will actually run their code.

## **But we already have JavaScript. Do we really need WebAssembly?**

Yes, for several reasons. To begin with, being binary instructions, .wasm files can be much smaller – that is much faster to download – than JavaScript files of equivalent functionality. Above all, Javascript files must be fully parsed and verified before a browser can convert them to bytecode usable by its internal virtual machine.

.wasm files, instead, can be verified and compiled in a single pass, thus making “Streaming Compilation” possible: a browser can start to compile and execute them the moment it starts **downloading them**, just like happens with streaming movies.

This said, not all conceivable WebAssembly applications would surely be faster – or smaller – than equivalent JavaScript ones that are manually optimized by expert programmers. This may happen, for example, if some .wasm needed to include libraries that are not needed with JavaScript.

## **Does WebAssembly make JavaScript obsolete?**

In a word: no. Certainly not for a while, at least inside browsers. WebAssembly modules still need JavaScript because by design they cannot access the Document Object Model (DOM), that is the [main API made to modify web pages][4]. Besides, .wasm code cannot make system calls or read the browser’s memory. WebAssembly only runs in a sandbox and, in general, can interact with the outside world even less than JavaScript can, and only through JavaScript interfaces.

Therefore – at least in the near future – .wasm modules will just provide, through JavaScript, the parts that would consume much more bandwidth, memory or CPU time if they were written in that language.

## **How web browsers run WebAssembly**

In general, a browser needs at least two pieces to handle dynamic applications: a virtual machine (VM) that runs the app code and standard APIs that that code can use to modify both the behaviour of the browser, and the content of the web page that it displays.

The VMs inside modern browsers support both JavaScript and WebAssembly in the following way:

  1. The browser downloads a web page written in the HTML markup language, and renders it
  2. if that HTML calls JavaScript code, the browser’s VM executes it. But…
  3. if that JavaScript code contains an instance of a WebAssembly module, that one is fetched as explained above, and then used as needed by JavaScript, via the WebAssembly APIs
  4. and when the WebAssembly code produces something that would alter the DOM – that is the structure of the “host” web page – the JavaScript code receives it and proceeds to the actual alteration.



## **How can I create usable WebAssembly code?**

There are more and more programming language communities that are supporting compiling to Wasm directly, we recommend looking at the [introductory guides][5] from webassembly.org as a starting point depending what language you work with. Note that not all programming languages have the same level of Wasm support, so your mileage may vary. 

We plan to release a series of articles in the coming months providing more information about WebAssembly. To get started using it yourself, you can enroll in The Linux Foundation’s free [Introduction to WebAssembly][6] online training course.

The post [An Introduction to WebAssembly][7] appeared first on [Linux Foundation – Training][8].

--------------------------------------------------------------------------------

via: https://www.linux.com/news/an-introduction-to-webassembly/

作者：[Dan Brown][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://training.linuxfoundation.org/announcements/an-introduction-to-webassembly/
[b]: https://github.com/lujun9972
[1]: https://webassembly.org/
[2]: https://webassembly.org/docs/use-cases/
[3]: https://blog.archive.org/2020/11/19/flash-animations-live-forever-at-the-internet-archive/
[4]: https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model/Introduction
[5]: https://webassembly.org/getting-started/developers-guide/
[6]: https://training.linuxfoundation.org/training/introduction-to-webassembly-lfd133/
[7]: https://training.linuxfoundation.org/announcements/an-introduction-to-webassembly/
[8]: https://training.linuxfoundation.org/

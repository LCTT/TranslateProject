[#]: subject: (6 things to know about using WebAssembly on Firefox)
[#]: via: (https://opensource.com/article/21/3/webassembly-firefox)
[#]: author: (Stephan Avenwedde https://opensource.com/users/hansic99)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13230-1.html)

在 Firefox 上使用 WebAssembly 要了解的 6 件事
======

> 了解在 Firefox 上运行 WebAssembly 的机会和局限性。 

![](https://img.linux.net.cn/data/attachment/album/202103/23/223901pi6tcg7ybsyxos7x.jpg)

WebAssembly 是一种可移植的执行格式，由于它能够以近乎原生的速度在浏览器中执行应用而引起了人们的极大兴趣。WebAssembly 本质上有一些特殊的属性和局限性。但是，通过将其与其他技术结合，将出现全新的可能性，尤其是与浏览器中的游戏有关的可能性。

本文介绍了在 Firefox 上运行 WebAssembly 的概念、可能性和局限性。

### 沙盒

WebAssembly 有 [严格的安全策略][2]。 WebAssembly 中的程序或功能单元称为*模块*。每个模块实例都运行在自己的隔离内存空间中。因此，即使同一个网页加载了多个模块，它们也无法访问另一个模块的虚拟地址空间。设计上，WebAssembly 还考虑了内存安全性和控制流完整性，这使得（几乎）确定性的执行成为可能。

### Web API

通过 JavaScript [Web API][3] 可以访问多种输入和输出设备。根据这个 [提案][4]，将来可以不用绕道到 JavaScript 来访问 Web API。C++ 程序员可以在 [Emscripten.org][5] 上找到有关访问 Web API 的信息。Rust 程序员可以使用 [rustwasm.github.io][7] 中写的 [wasm-bindgen][6] 库。

### 文件输入/输出

因为 WebAssembly 是在沙盒环境中执行的，所以当它在浏览器中执行时，它无法访问主机的文件系统。但是，Emscripten 提供了虚拟文件系统形式的解决方案。

Emscripten 使在编译时将文件预加载到内存文件系统成为可能。然后可以像在普通文件系统上一样从 WebAssembly 应用中读取这些文件。这个 [教程][8] 提供了更多信息。

### 持久化数据

如果你需要在客户端存储持久化数据，那么必须通过 JavaScript Web API 来完成。请参考 Mozilla 开发者网络（MDN）关于 [浏览器存储限制和过期标准][9] 的文档，了解不同方法的详细信息。

### 内存管理

WebAssembly 模块作为 [堆栈机][10] 在线性内存上运行。这意味着堆内存分配等概念是没有的。然而，如果你在 C++ 中使用 `new` 或者在 Rust 中使用 `Box::new`，你会期望它会进行堆内存分配。将堆内存分配请求转换成 WebAssembly 的方式在很大程度上依赖于工具链。你可以在 Frank Rehberger 关于 [WebAssembly 和动态内存][11] 的文章中找到关于不同工具链如何处理堆内存分配的详细分析。

### 游戏！

与 [WebGL][12] 结合使用时，WebAssembly 的执行速度很高，因此可以在浏览器中运行原生游戏。大型专有游戏引擎 [Unity][13] 和[虚幻 4][14] 展示了 WebGL 可以实现的功能。也有使用 WebAssembly 和 WebGL 接口的开源游戏引擎。这里有些例子：

  * 自 2011 年 11 月起，[id Tech 4][15] 引擎（更常称之为 Doom 3 引擎）可在 [GitHub][16] 上以 GPL 许可的形式获得。此外，还有一个 [Doom 3 的 WebAssembly 移植版][17]。
  * Urho3D 引擎提供了一些 [令人印象深刻的例子][18]，它们可以在浏览器中运行。
  * 如果你喜欢复古游戏，可以试试这个 [Game Boy 模拟器][19]。
  * [Godot 引擎也能生成 WebAssembly][20]。我找不到演示，但 [Godot 编辑器][21] 已经被移植到 WebAssembly 上。

### 有关 WebAssembly 的更多信息

WebAssembly 是一项很有前途的技术，我相信我们将来会越来越多地看到它。除了在浏览器中执行之外，WebAssembly 还可以用作可移植的执行格式。[Wasmer][22] 容器主机使你可以在各种平台上执行 WebAssembly 代码。

如果你需要更多的演示、示例和教程，请看一下这个 [WebAssembly 主题集合][23]。Mozilla 的 [游戏和示例合集][24] 并非全是 WebAssembly，但仍然值得一看。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/webassembly-firefox

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hansic99
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF (Woman using laptop concentrating)
[2]: https://webassembly.org/docs/security/
[3]: https://developer.mozilla.org/en-US/docs/Web/API
[4]: https://github.com/WebAssembly/gc/blob/master/README.md
[5]: https://emscripten.org/docs/porting/connecting_cpp_and_javascript/Interacting-with-code.html
[6]: https://github.com/rustwasm/wasm-bindgen
[7]: https://rustwasm.github.io/wasm-bindgen/
[8]: https://emscripten.org/docs/api_reference/Filesystem-API.html
[9]: https://developer.mozilla.org/en-US/docs/Web/API/IndexedDB_API/Browser_storage_limits_and_eviction_criteria
[10]: https://en.wikipedia.org/wiki/Stack_machine
[11]: https://frehberg.wordpress.com/webassembly-and-dynamic-memory/
[12]: https://en.wikipedia.org/wiki/WebGL
[13]: https://beta.unity3d.com/jonas/AngryBots/
[14]: https://www.youtube.com/watch?v=TwuIRcpeUWE
[15]: https://en.wikipedia.org/wiki/Id_Tech_4
[16]: https://github.com/id-Software/DOOM-3
[17]: https://wasm.continuation-labs.com/d3demo/
[18]: https://urho3d.github.io/samples/
[19]: https://vaporboy.net/
[20]: https://docs.godotengine.org/en/stable/development/compiling/compiling_for_web.html
[21]: https://godotengine.org/editor/latest/godot.tools.html
[22]: https://github.com/wasmerio/wasmer
[23]: https://github.com/mbasso/awesome-wasm
[24]: https://developer.mozilla.org/en-US/docs/Games/Examples

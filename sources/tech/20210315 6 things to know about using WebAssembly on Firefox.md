[#]: subject: (6 things to know about using WebAssembly on Firefox)
[#]: via: (https://opensource.com/article/21/3/webassembly-firefox)
[#]: author: (Stephan Avenwedde https://opensource.com/users/hansic99)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

6 things to know about using WebAssembly on Firefox
======
Get to know the opportunities and limitations of running WebAssembly on
Firefox.
![Business woman on laptop sitting in front of window][1]

WebAssembly is a portable execution format that has drawn a lot of interest due to its ability to execute applications in the browser at near-native speed. By its nature, WebAssembly has some special properties and limitations. However, by combining it with other technologies, completely new possibilities arise, especially related to gaming in the browser.

This article describes the concepts, possibilities, and limitations of running WebAssembly on Firefox.

### The sandbox

WebAssembly has a [strict security policy][2]. A program or functional unit in WebAssembly is called a _module_. Each module instance runs its own isolated memory space. Therefore, one module cannot access another module's virtual address space, even if they are loaded on the same web page. By design, WebAssembly also considers memory safety and control-flow integrity, which enables an (almost-) deterministic execution.

### Web APIs

Access to many kinds of input and output devices is granted via JavaScript [Web APIs][3]. In the future, access to Web APIs will be available without the detour over to JavaScript, according to this [proposal][4]. C++ programmers can find information about accessing the Web APIs on [Emscripten.org][5]. Rust programmers can use the [wasm-bindgen][6] library that is documented on [rustwasm.github.io][7].

### File input/output

Because WebAssembly is executed in a sandboxed environment, it cannot access the host's filesystem when it is executed in a browser. However, Emscripten offers a solution in the form of a virtual filesystem.

Emscripten makes it possible to preload files to the memory filesystem at compile time. Those files can then be read from within the WebAssembly application, just as you would on an ordinary filesystem. This [tutorial][8] offers more information.

### Persistent data

If you need to store persistent data on the client-side, it must be done over a JavaScript Web API. Refer to Mozilla Developer Network's documentation on [browser storage limits and eviction criteria][9] for more detailed information about the different approaches.

### Memory management

WebAssembly modules operate on linear memory as a [stack machine][10]. This means that concepts like heap memory allocations are not available. However, if you are using `new` in C++ or `Box::new` in Rust, you would expect it to result in a heap memory allocation. The way heap memory allocation requests are translated into WebAssembly relies heavily upon the toolchain. You can find a detailed analysis of how different toolchains deal with heap memory allocations in Frank Rehberger's post about [_WebAssembly and dynamic memory_][11].

### Games!

In combination with [WebGL][12], WebAssembly enables native gaming in the browser due to its high execution speed. The big proprietary game engines [Unity][13] and [Unreal Engine 4][14] show what is possible with WebGL. There are also open source game engines that use WebAssembly and the WebGL interface. Here are some examples:

  * Since November 2011, the [id Tech 4][15] engine (better known as the Doom 3 engine) is available under the GPL license on [GitHub][16]. There is also a [WebAssembly port of Doom 3][17].
  * The Urho3D engine provides some [impressive examples][18] that can run in the browser.
  * If you like retro games, try this [Game Boy emulator][19].
  * The [Godot engine is also capable of producing WebAssembly][20]. I couldn't find a demo, but the [Godot editor][21] has been ported to WebAssembly.



### More about WebAssembly

WebAssembly is a promising technology that I believe we will see more frequently in the future. In addition to executing in the browser, WebAssembly can also be used as a portable execution format. The [Wasmer][22] container host enables you to execute WebAssembly code on various platforms.

If you want more demos, examples, and tutorials, take a look at this [extensive collection of WebAssembly topics][23]. Not exclusive to WebAssembly but still worth a look are Mozilla's [collection of games and demos][24].

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/webassembly-firefox

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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

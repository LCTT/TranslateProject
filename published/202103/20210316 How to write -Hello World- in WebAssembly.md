[#]: subject: (How to write 'Hello World' in WebAssembly)
[#]: via: (https://opensource.com/article/21/3/hello-world-webassembly)
[#]: author: (Stephan Avenwedde https://opensource.com/users/hansic99)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13250-1.html)

如何在 WebAssembly 中写 “Hello World”？
======
> 通过这个分步教程，开始用人类可读的文本编写 WebAssembly。

![](https://img.linux.net.cn/data/attachment/album/202103/30/095907r6ecev48dw0l9w44.jpg)

WebAssembly 是一种字节码格式，[几乎所有的浏览器][2] 都可以将它编译成其宿主操作系统的机器代码。除了 JavaScript 和 WebGL 之外，WebAssembly 还满足了将应用移植到浏览器中以实现平台独立的需求。作为 C++ 和 Rust 的编译目标，WebAssembly 使 Web 浏览器能够以接近原生的速度执行代码。

当谈论 WebAssembly 应用时，你必须区分三种状态：

  1. **源码（如 C++ 或 Rust）：** 你有一个用兼容语言编写的应用，你想把它在浏览器中执行。
  2. **WebAssembly 字节码：** 你选择 WebAssembly 字节码作为编译目标。最后，你得到一个 `.wasm` 文件。
  3. **机器码（opcode）：** 浏览器加载 `.wasm` 文件，并将其编译成主机系统的相应机器码。

WebAssembly 还有一种文本格式，用人类可读的文本表示二进制格式。为了简单起见，我将其称为 **WASM-text**。WASM-text 可以比作高级汇编语言。当然，你不会基于 WASM-text 来编写一个完整的应用，但了解它的底层工作原理是很好的（特别是对于调试和性能优化）。

本文将指导你在 WASM-text 中创建经典的 “Hello World” 程序。

### 创建 .wat 文件

WASM-text 文件通常以 `.wat` 结尾。第一步创建一个名为 `helloworld.wat` 的空文本文件，用你最喜欢的文本编辑器打开它，然后粘贴进去：

```
(module
    ;; 从 JavaScript 命名空间导入
    (import  "console"  "log" (func  $log (param  i32  i32))) ;; 导入 log 函数
    (import  "js"  "mem" (memory  1)) ;; 导入 1 页 内存（64kb）
   
    ;; 我们的模块的数据段
    (data (i32.const 0) "Hello World from WebAssembly!")
   
    ;; 函数声明：导出 helloWorld()，无参数
    (func (export  "helloWorld")
        i32.const 0  ;; 传递偏移 0 到 log
        i32.const 29  ;; 传递长度 29 到 log（示例文本的字符串长度）
        call  $log
        )
)
```

WASM-text 格式是基于 S 表达式的。为了实现交互，JavaScript 函数用 `import` 语句导入，WebAssembly 函数用 `export` 语句导出。在这个例子中，从 `console` 模块中导入 `log` 函数，它需要两个类型为 `i32` 的参数作为输入，以及一页内存（64KB）来存储字符串。

字符串将被写入偏移量 为 `0` 的数据段。数据段是你的内存的<ruby>叠加投影<rt>overlay</rt></ruby>，内存是在 JavaScript 部分分配的。

函数用关键字 `func` 标记。当进入函数时，栈是空的。在调用另一个函数之前，函数参数会被压入栈中（这里是偏移量和长度）（见 `call $log`）。当一个函数返回一个 `f32` 类型时（例如），当离开函数时，一个 `f32` 变量必须保留在栈中（但在本例中不是这样）。

### 创建 .wasm 文件

WASM-text 和 WebAssembly 字节码是 1:1 对应的，这意味着你可以将 WASM-text 转换成字节码（反之亦然）。你已经有了 WASM-text，现在将创建字节码。

转换可以通过 [WebAssembly Binary Toolkit][3]（WABT）来完成。从该链接克隆仓库，并按照安装说明进行安装。

建立工具链后，打开控制台并输入以下内容，将 WASM-text 转换为字节码：

```
wat2wasm helloworld.wat -o helloworld.wasm
```

你也可以用以下方法将字节码转换为 WASM-text：

```
wasm2wat helloworld.wasm -o helloworld_reverse.wat
```

一个从 `.wasm` 文件创建的 `.wat` 文件不包括任何函数或参数名称。默认情况下，WebAssembly 用它们的索引来识别函数和参数。

### 编译 .wasm 文件

目前，WebAssembly 只与 JavaScript 共存，所以你必须编写一个简短的脚本来加载和编译 `.wasm` 文件并进行函数调用。你还需要在 WebAssembly 模块中定义你要导入的函数。

创建一个空的文本文件，并将其命名为 `helloworld.html`，然后打开你喜欢的文本编辑器并粘贴进去：

```
<!DOCTYPE  html>
<html>
  <head>
    <meta  charset="utf-8">
    <title>Simple template</title>
  </head>
  <body>
    <script>
   
      var memory = new  WebAssembly.Memory({initial:1});

      function  consoleLogString(offset, length) {
        var  bytes = new  Uint8Array(memory.buffer, offset, length);
        var  string = new  TextDecoder('utf8').decode(bytes);
        console.log(string);
      };

      var  importObject = {
        console: {
          log:  consoleLogString
        },
        js : {
          mem:  memory
        }
      };
     
      WebAssembly.instantiateStreaming(fetch('helloworld.wasm'), importObject)
      .then(obj  => {
        obj.instance.exports.helloWorld();
      });
     
    </script>
  </body>
</html>
```

`WebAssembly.Memory(...)` 方法返回一个大小为 64KB 的内存页。函数 `consoleLogString` 根据长度和偏移量从该内存页读取一个字符串。这两个对象作为 `importObject` 的一部分传递给你的 WebAssembly 模块。

在你运行这个例子之前，你可能必须允许 Firefox 从这个目录中访问文件，在地址栏输入 `about:config`，并将 `privacy.file_unique_origin` 设置为 `true`：

![Firefox setting][4]

> **注意：** 这样做会使你容易受到 [CVE-2019-11730][6] 安全问题的影响。

现在，在 Firefox 中打开 `helloworld.html`，按下 `Ctrl+K` 打开开发者控制台。

![Debugger output][7]

### 了解更多

这个 Hello World 的例子只是 MDN 的 [了解 WebAssembly 文本格式][8] 文档中的教程之一。如果你想了解更多关于 WebAssembly 的知识以及它的工作原理，可以看看这些文档。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/hello-world-webassembly

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hansic99
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/helloworld_bread_lead.jpeg?itok=1r8Uu7gk (Hello World inked on bread)
[2]: https://developer.mozilla.org/en-US/docs/WebAssembly#browser_compatibility
[3]: https://github.com/webassembly/wabt
[4]: https://opensource.com/sites/default/files/uploads/firefox_setting.png (Firefox setting)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://www.mozilla.org/en-US/security/advisories/mfsa2019-21/#CVE-2019-11730
[7]: https://opensource.com/sites/default/files/uploads/debugger_output.png (Debugger output)
[8]: https://developer.mozilla.org/en-US/docs/WebAssembly/Understanding_the_text_format

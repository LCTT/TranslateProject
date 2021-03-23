[#]: subject: (How to write 'Hello World' in WebAssembly)
[#]: via: (https://opensource.com/article/21/3/hello-world-webassembly)
[#]: author: (Stephan Avenwedde https://opensource.com/users/hansic99)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to write 'Hello World' in WebAssembly
======
Get started writing WebAssembly in human-readable text with this
step-by-step tutorial.
![Hello World inked on bread][1]

WebAssembly is a bytecode format that [virtually every browser][2] can compile to its host system's machine code. Alongside JavaScript and WebGL, WebAssembly fulfills the demand for porting applications for platform-independent use in the web browser. As a compilation target for C++ and Rust, WebAssembly enables web browsers to execute code at near-native speed.

When you talk about a WebAssembly, application, you must distinguish between three states:

  1. **Source code (e.g., C++ or Rust):** You have an application written in a compatible language that you want to execute in the browser.
  2. **WebAssembly bytecode:** You choose WebAssembly bytecode as your compilation target. As a result, you get a `.wasm` file.
  3. **Machine code (opcode):** The browser loads the `.wasm` file and compiles it to the corresponding machine code of its host system.



WebAssembly also has a text format that represents the binary format in human-readable text. For the sake of simplicity, I will refer to this as **WASM-text**. WASM-text can be compared to high-level assembly language. Of course, you would not write a complete application based on WASM-text, but it's good to know how it works under the hood (especially for debugging and performance optimization).

This article will guide you through creating the classic _Hello World_ program in WASM-text.

### Creating the .wat file

WASM-text files usually end with `.wat`. Start from scratch by creating an empty text file named `helloworld.wat`, open it with your favorite text editor, and paste in:


```
(module
    ;; Imports from JavaScript namespace
    (import  "console"  "log" (func  $log (param  i32  i32))) ;; Import log function
    (import  "js"  "mem" (memory  1)) ;; Import 1 page of memory (54kb)
   
    ;; Data section of our module
    (data (i32.const 0) "Hello World from WebAssembly!")
   
    ;; Function declaration: Exported as helloWorld(), no arguments
    (func (export  "helloWorld")
        i32.const 0  ;; pass offset 0 to log
        i32.const 29  ;; pass length 29 to log (strlen of sample text)
        call  $log
        )
)
```

The WASM-text format is based upon S-expressions. To enable interaction, JavaScript functions are imported with the `import` statement, and WebAssembly functions are exported with the `export` statement. For this example, import the `log `function from the `console` module, which takes two parameters of type `i32` as input and one page of memory (64KB) to store the string.

The string will be written into the `data` section at offset `0`. The `data` section is an overlay of your memory, and the memory is allocated in the JavaScript part.

Functions are marked with the keyword `func`. The stack is empty when entering a function. Function parameters are pushed onto the stack (here offset and length) before another function is called (see `call $log`). When a function returns an `f32` type (for example), an `f32` variable must remain on the stack when leaving the function (but this is not the case in this example).

### Creating the .wasm file

The WASM-text and the WebAssembly bytecode have 1:1 correspondence. This means you can convert WASM-text into bytecode (and vice versa). You already have the WASM-text, and now you want to create the bytecode.

The conversion can be performed with the [WebAssembly Binary Toolkit][3] (WABT). Make a clone of the repository at that link and follow the installation instructions.

After you build the toolchain, convert WASM-text to bytecode by opening a console and entering:


```
`wat2wasm helloworld.wat -o helloworld.wasm`
```

You can also convert bytecode to WASM-text with:


```
`wasm2wat helloworld.wasm -o helloworld_reverse.wat`
```

A `.wat` file created from a `.wasm` file does not include any function nor parameter names. By default, WebAssembly identifies functions and parameters with their index.

### Compiling the .wasm file

Currently, WebAssembly only coexists with JavaScript, so you have to write a short script to load and compile the `.wasm` file and do the function calls. You also need to define the functions you will import in your WebAssembly module.

Create an empty text file and name it `helloworld.html`, then open your favorite text editor and paste in:


```
&lt;!DOCTYPE  html&gt;
&lt;html&gt;
  &lt;head&gt;
    &lt;meta  charset="utf-8"&gt;
    &lt;title&gt;Simple template&lt;/title&gt;
  &lt;/head&gt;
  &lt;body&gt;
    &lt;script&gt;
   
      var memory = new  WebAssembly.Memory({initial:1});

      function  consoleLogString(offset, length) {
        var  bytes = new  Uint8Array(memory.buffer, offset, length);
        var  string = new  TextDecoder('utf8').decode(bytes);
        console.log(string);
      };

      var  importObject = {
        console: {
          log:  consoleLogString
        },
        js : {
          mem:  memory
        }
      };
     
      WebAssembly.instantiateStreaming(fetch('helloworld.wasm'), importObject)
      .then(obj  =&gt; {
        obj.instance.exports.helloWorld();
      });
     
    &lt;/script&gt;
  &lt;/body&gt;
&lt;/html&gt;
```

The `WebAssembly.Memory(...)` method returns one page of memory that is 64KB in size. The function `consoleLogString` reads a string from that memory page based on the length and offset. Both objects are passed to your WebAssembly module as part of the `importObject`.

Before you can run this example, you may have to allow Firefox to access files from this directory by typing `about:config` in the address line and setting `privacy.file_unique_origin` to `true`:

![Firefox setting][4]

(Stephan Avenwedde, [CC BY-SA 4.0][5])

> **Caution:** This will make you vulnerable to the [CVE-2019-11730][6] security issue.

Now, open `helloworld.html` in Firefox and enter **Ctrl**+**K** to open the developer console.

![Debugger output][7]

(Stephan Avenwedde, [CC BY-SA 4.0][5])

### Learn more

This Hello World example is just one of the detailed tutorials in MDN's [Understanding WebAssembly text format][8] documentation. If you want to learn more about WebAssembly and how it works under the hood, take a look at these docs.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/hello-world-webassembly

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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

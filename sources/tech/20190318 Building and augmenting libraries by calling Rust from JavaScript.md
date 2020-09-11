[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Building and augmenting libraries by calling Rust from JavaScript)
[#]: via: (https://opensource.com/article/19/3/calling-rust-javascript)
[#]: author: (Ryan Levick https://opensource.com/users/ryanlevick)

Building and augmenting libraries by calling Rust from JavaScript
======

Explore how to use WebAssembly (Wasm) to embed Rust inside JavaScript.

![JavaScript in Vim][1]

In _[Why should you use Rust in WebAssembly?][2]_ , I looked at why you might want to write WebAssembly (Wasm), and why you might choose Rust as the language to do it in. Now I'll share what that looks like by exploring ways to embed Rust inside JavaScript.

This is something that separates Rust from Go, C#, and other languages with large runtimes that can compile to Wasm. Rust has a minimal runtime (basically just an allocator), making it easy to use Rust from JavaScript libraries. C and C++ have similar stories, but what sets Rust apart is its tooling, which we'll take a look at now.

### The basics

If you've never used Rust before, you'll first want to get that set up. It's pretty easy. First download [**Rustup**][3], which is a way to control versions of Rust and different toolchains for cross-compilation. This will give you access to [**Cargo**][4], which is the Rust build tool and package manager.

Now we have a decision to make. We can easily write Rust code that runs in the browser through WebAssembly, but if we want to do anything other than make people's CPU fans spin, we'll probably at some point want to interact with the Document Object Model (DOM) or use some JavaScript API. In other words: _we need JavaScript interop_ (aka the JavaScript interoperability API).

### The problem and the solutions

WebAssembly is an extremely simple machine language. If we want to be able to communicate with JavaScript, Wasm gives us only four data types to do it with: 32- and 64-bit floats and integers. Wasm doesn't have a concept of strings, arrays, objects, or any other rich data type. Basically, we can only pass around pointers between Rust and JavaScript. Needless to say, this is less than ideal.

The good news is there are two libraries that facilitate communication between Rust-based Wasm and JavaScript: [**wasm-bindgen**][5] and [**stdweb**][6]. The bad news, however, is these two libraries are unfortunately incompatible with each other. **wasm-bindgen** is lower-level than **stdweb** and attempts to provide full control over how JavaScript and Rust interact. In fact, there is even talk of [rewriting **stdweb** using **wasm-bindgen**][7], which would get rid of the issue of incompatibility.

Because **wasm-bindgen** is the lighter-weight option (and the option officially worked on by the official [Rust WebAssembly working group][8]), we'll focus at that.

### wasm-bindgen and wasm-pack

We're going to create a function that takes a string from JavaScript, makes it uppercase and prepends "HELLO, " to it, and returns it back to JavaScript. We'll call this function **excited_greeting**!

First, let's create our Rust library that will house this fabulous function:

```
$ cargo new my-wasm-library --lib
$ cd my-wasm-library
```

Now we'll want to replace the contents of **src/lib.rs** with our exciting logic. I think it's best to write the code out instead of copy/pasting.

```
// Include the `wasm_bindgen` attribute into the current namespace.
use wasm_bindgen::prelude::wasm_bindgen;

// This attribute makes calling Rust from JavaScript possible.
// It generates code that can convert the basic types wasm understands
// (integers and floats) into more complex types like strings and
// vice versa. If you're interested in how this works, check this out:
// <https://blog.ryanlevick.com/posts/wasm-bindgen-interop/>
#[wasm_bindgen]
// This is pretty plain Rust code. If you've written Rust before this
// should look extremely familiar. If not, why wait?! Check this out:
// <https://doc.rust-lang.org/book/>
pub fn excited_greeting(original: &str) -> String {
format!("HELLO, {}", original.to_uppercase())
}
```

Second, we'll have to make two changes to our **Cargo.toml** configuration file:

  * Add **wasm_bindgen** as a dependency.
  * Configure the type of library binary to be a **cdylib** or dynamic system library. In this case, our system is **wasm** , and setting this option is how we produce **.wasm** binary files.


```
[package]
name = "my-wasm-library"
version = "0.1.0"
authors = ["$YOUR_INFO"]
edition = "2018"

[lib]
crate-type = ["cdylib", "rlib"]

[dependencies]
wasm-bindgen = "0.2.33"
```

Now let's build! If we just use **cargo build** , we'll get a **.wasm** binary, but in order to make it easy to call our Rust code from JavaScript, we'd like to have some JavaScript code that converts rich JavaScript types like strings and objects to pointers and passes these pointers to the Wasm module on our behalf. Doing this manually is tedious and prone to bugs.

Luckily, in addition to being a library, **wasm-bindgen** also has the ability to create this "glue" JavaScript for us. This means in our code we can interact with our Wasm module using normal JavaScript types, and the generated code from **wasm-bindgen** will do the dirty work of converting these rich types into the pointer types that Wasm actually understands.

We can use the awesome **wasm-pack** to build our Wasm binary, invoke the **wasm-bindgen** CLI tool, and package all of our JavaScript (and any optional generated TypeScript types) into one nice and neat package. Let's do that now!

First we'll need to install **wasm-pack** :

```
$ cargo install wasm-pack
```

By default, **wasm-bindgen** produces ES6 modules. We'll use our code from a simple script tag, so we just want it to produce a plain old JavaScript object that gives us access to our Wasm functions. To do this, we'll pass it the **\--target no-modules** option.

```
$ wasm-pack build --target no-modules
```

We now have a **pkg** directory in our project. If we look at the contents, we'll see the following:

  * **package.json** : useful if we want to package this up as an NPM module
  * **my_wasm_library_bg.wasm** : our actual Wasm code
  * **my_wasm_library.js** : the JavaScript "glue" code
  * Some TypeScript definition files



Now we can create an **index.html** file that will make use of our JavaScript and Wasm:

```
<[html][9]>
<[head][10]>
<[meta][11] content="text/html;charset=utf-8" http-equiv="Content-Type" />
</[head][10]>
<[body][12]>
<!-- Include our glue code -->
<[script][13] src='./pkg/my_wasm_library.js'></[script][13]>
<!-- Include our glue code -->
<[script][13]>
window.addEventListener('load', async () => {
// Load the wasm file
await wasm_bindgen('./pkg/my_wasm_library_bg.wasm');
// Once it's loaded the `wasm_bindgen` object is populated
// with the functions defined in our Rust code
const greeting = wasm_bindgen.excited_greeting("Ryan")
console.log(greeting)
});
</[script][13]>
</[body][12]>
</[html][9]>
```

You may be tempted to open the HTML file in your browser, but unfortunately, this is not possible. For security reasons, Wasm files have to be served from the same domain as the HTML file. You'll need an HTTP server. If you have a favorite static HTTP server that can serve files from your filesystem, feel free to use that. I like to use [**basic-http-server**][14], which you can install and run like so:

```
$ cargo install basic-http-server
$ basic-http-server
```

Now open the **index.html** file through the web server by going to **<http://localhost:4000/index.html>** and check your JavaScript console. You should see a very exciting greeting there!

If you have any questions, please [let me know][15]. Next time, we'll take a look at how we can use various browser and JavaScript APIs from within our Rust code.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/calling-rust-javascript

作者：[Ryan Levick][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ryanlevick
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/javascript_vim.jpg?itok=mqkAeakO (JavaScript in Vim)
[2]: https://opensource.com/article/19/2/why-use-rust-webassembly
[3]: https://rustup.rs/
[4]: https://doc.rust-lang.org/cargo/
[5]: https://github.com/rustwasm/wasm-bindgen
[6]: https://github.com/koute/stdweb
[7]: https://github.com/koute/stdweb/issues/318
[8]: https://www.rust-lang.org/governance/wgs/wasm
[9]: http://december.com/html/4/element/html.html
[10]: http://december.com/html/4/element/head.html
[11]: http://december.com/html/4/element/meta.html
[12]: http://december.com/html/4/element/body.html
[13]: http://december.com/html/4/element/script.html
[14]: https://github.com/brson/basic-http-server
[15]: https://twitter.com/ryan_levick

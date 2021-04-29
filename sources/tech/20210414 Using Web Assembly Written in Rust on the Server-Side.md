[#]: subject: (Using Web Assembly Written in Rust on the Server-Side)
[#]: via: (https://www.linux.com/news/using-web-assembly-written-in-rust-on-the-server-side/)
[#]: author: (Dan Brown https://training.linuxfoundation.org/announcements/using-web-assembly-written-in-rust-on-the-server-side/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Using Web Assembly Written in Rust on the Server-Side
======

_By Bob Reselman_

_This article was originally published at [TheNewStac][1]k_

WebAssembly allows you to write code in a low-level programming language such as Rust, that gets compiled into a transportable binary. That binary can then be run on the client-side in the WebAssembly virtual machine that is [standard in today’s web browsers][2]. Or, the binary can be used on the server-side, as a component consumed by another programming framework — such as Node.js or [Deno][3].

WebAssembly combines the efficiency inherent in low-level code programming with the ease of component transportability typically found in Linux containers. The result is a development paradigm specifically geared toward doing computationally intensive work at scale — for example, artificial intelligence and complex machine learning tasks.

As Solomon Hykes, the creator of Docker, [tweeted][4] on March 27, 2019: “If WASM+WASI existed in 2008, we wouldn’t have needed to have created Docker. That’s how important it is. WebAssembly on the server is the future of computing.”

WebAssembly is a compelling approach to software development. However, in order to get a true appreciation for the technology, you need to see it in action.

In this article, I am going to show you how to program a WebAssembly binary in Rust and use it in a TypeScript-powered web server running under Deno. I’ll show you how to install Rust and prep the runtime environment. We’ll compile the source code into a Rust binary. Then, once the binary is created, I’ll demonstrate how to run it on the server-side under [Deno][3]. Deno is a TypeScript-based programming framework that was started by Ryan Dahl, the creator of Node.js.

### Understanding the Demonstration Project

The demonstration project that accompanies this article is called Wise Sayings. The project stores a collection of “wise sayings” in a text file named wisesayings.txt. Each line in the text file is a wise saying, for example, “_A friend in need is a friend indeed._”

The Rust code publishes a single function, get_wise_saying(). That function gets a random line from the text file, wisesayings.txt, and returns the random line to the caller. (See Figure 1, below)

<https://cdn.thenewstack.io/media/2021/03/50e3e12f-image1.png>

Figure 1: The demonstration project compiles data in a text file directly into the WebAssembly binary

Both the code and text file are compiled into a single WebAssembly binary file, named wisesayings.wasm. Then another layer of processing is performed to make the WebAssembly binary consumable by the Deno web server code. The Deno code calls the function get_wise_sayings() in the WebAssembly binary, to produce a random wise saying. (See Figure 2.)

<https://cdn.thenewstack.io/media/2021/03/ed3a0b83-image2.png>

Figure 2: WebAssembly binaries can be consumed by a server-side programming framework such as Deno.

_You get the source code for the Wise Sayings demonstration project used in this article [on GitHub][5]. All the steps described in this article are listed on the repository’s main [Readme][6] document._

### Prepping the Development Environment

The first thing we need to do to get the code up and running is to make sure that Rust is installed in the development environment. The following steps describe the process.

**Step 1: **Make sure Rust is installed on your machine by typing:

1 | rustc —version
---|---

You’ll get output similar to the following:

1 | rustc 1.50.0 (cb75ad5db 2021–02–10)
---|---

If the call to rustc –version fails, you don’t have Rust installed. Follow the instructions below and** make sure you do all the tasks presented by the given installation method**.

To install Rust, go here and install on Linux/MAC: …

1 | curl —proto ‘=https’ —tlsv1.2 –sSf <https://sh.rustup.rs>
---|---

… or here to install it on Windows:

Download and run rustup-init.exe which you can find at this URL: <https://static.rust-lang.org/rustup/dist/i686-pc-windows-gnu/rustup-init.exe>.

**Step 2:** Modify your system’s PATH

1 | export PATH=“$HOME/.cargo/bin:$PATH”
---|---

**Step 3: **If you’re working in a Linux environment do the following steps to install the required additional Linux components.

1 2 3 4 5 | sudo apt–get update –y sudo apt–get install –y libssl–dev apt install pkg–config
---|---

***Developer’s Note: *_The optimal development environment in which to run this code is one that uses the Linux operating system._

**Step 4: **Get the CLI tool that you’ll use for generating the TypeScript/JavaScript adapter files. These adapter files (a.k.a. shims) do the work of exposing the function get_wise_saying() in the WebAssembly binary to the Deno web server that will be hosting the binary. Execute the following command at the command line to install the tool, [wasm-bindgen-cli][7].

1 | cargo install wasm–bindgen–cli
---|---

The development environment now has Rust installed, along with the necessary ancillary libraries. Now we need to get the Wise Saying source code.

### Working with the Project Files

The Wise Saying source code is hosted in a GitHub repository. Take the following steps to clone the source code from GitHub onto the local development environment.

**Step 1: **Execute the following command to clone the Wise Sayings source code from GitHub

1 | git clone <https://github.com/reselbob/wisesayingswasm.git>
---|---

**Step 2: **Go to the working directory

1 | cd wisesayingswasm/
---|---

Listing 1, below lists the files that make up the source code cloned from the GitHub repository.

1 2 3 4 5 6 7 8 9 10 11 12 13 14 | . ├── Cargo.toml ├── cheatsheet.txt ├── LICENSE ├── lldbconfig ├── package–lock.json ├── README.md ├── server │   ├── main.ts │   └── package–lock.json └── src     ├── fortunes.txt     ├── lib.rs     └── main.rs
---|---

_Listing 1: The files for the source code for the Wise Sayings demonstration project hosted in the GitHub repository_

Let’s take a moment to describe the source code files listed above in Listing 1. The particular files of interest with regard to creating the WebAssembly binary are the files in the directory named, src at Line 11 and the file, Cargo.toml at Line 2.

Let’s discuss Cargo.toml first. The content of Cargo.toml is shown in Listing 2, below.

1 2 3 4 5 6 7 8 9 10 11 12 13 14 | [package] name = “wise-sayings-wasm” version = “0.1.0” authors = [“Bob Reselman &lt;bob@CogArtTech.com&gt;”] edition = “2018” [dependencies] rand = “0.8.3” getrandom = { version = “0.2”, features = [“js”] } wasm–bindgen = “0.2.70” [lib] name = “wisesayings” crate–type =[“cdylib”, “lib”]
---|---

_Listing 2: The content of Cargo.toml for the demonstration project Wise Sayings_

Cargo.toml is the [manifest file][8] that describes various aspects of the Rust project under development. The Cargo.toml file for the Wise Saying project is organized into three sections: package, dependencies, and lib. The section names are defined in the Cargo manifest specification, which you read [here][8].

#### Understanding the Package Section of Cargo.toml

The package section indicates the name of the package (wise-sayings-wasm), the developer assigned version (0.1.0), the authors (Bob Reselman &lt;[bob@CogArtTech.com][9]&gt;) and the edition of Rust (2018) that is used to program the binary.

#### Understanding the Dependencies Section of Cargo.toml

The dependencies section lists the dependencies that the WebAssembly project needs to do its work. As you can see in Listing 2, above at Line 8, the Cargo.toml lists the rand library as a dependency. The rand library provides the capability to generate a random number which is used to get a random line of wise saying text from the file, wisesayings.txt.

The reference to getrandom at Line 9 in Listing 2 above indicates that the WebAssembly binary’s [getrandom][10] is running under Javascript and that the [JavaScript interface should be used][11]. This condition is very particular to running a WebAssembly binary under JavaScript. The long and short of it is that if the line getrandom = { version = “0.2”, features = [“js”] } is not included in the Cargo.toml, the WebAssembly binary will not be able to create a random number.

The entry at Line 10 declares the [wasm-bindgen][12] library as a dependency. The wasm-bindgen library provides the capability for wasm modules to talk to JavaScript and JavaScript to talk to wasm modules.

#### Understanding the Lib Section of Cargo.toml

The entry [crate-type =[“cdylib”, “lib”]][13] at Line 14 in the lib section of the Cargo.toml file tells the Rust compiler to create a wasm binary without a start function. Typically when cdylib is indicated, the compiler will create a [dynamic library][14] with the extension .dll in Windows, .so in Linux, or .dylib in MacOS. In this case, because the deployment unit is a WebAssembly binary, the compiler will create a file with the extension .wasm. The name of the wasm file will be wisesayings.wasm, as indicated at Line 13 above in Listing 2.

The important thing to understand about Cargo.toml is that it provides both the design and runtime information needed to get your Rust code up and running. If the Cargo.toml file is not present, the Rust compiler doesn’t know what to do and the build will fail.

### Understanding the Core Function, get_wise_saying()

The actual work of getting a random line that contains a Wise Saying from the text file wisesayings.txt is done by the function get_wise_saying(). The code for get_wise_sayings() is in the Rust library file, ./src/lib.rs. The Rust code is shown below in Listing 3.

1 2 3 4 5 6 7 8 9 10 11 12 13 | use rand::seq::IteratorRandom; use wasm_bindgen::prelude::*; #[wasm_bindgen] pub fn get_wise_saying() -&gt; String {     let str = include_str!(“fortunes.txt”);     let mut lines = str.lines();     let line = lines         .choose(&amp;mut rand::thread_rng())         .expect(“File had no lines”);     return line.to_string(); }
---|---

_Listing 3: The function file, lib.rs contains the function, get_wise_saying()._

The important things to know about the source is that it’s tagged at Line 4 with the attribute #[wasm_bindgen], which lets the Rust compiler know that the source code is targeted as a WebAssembly binary. The code publishes one function, get_wise_saying(), at Line 5. The way the wise sayings text file is loaded into memory is to use the [Rust macro][15], [include_str!][16]. This macro does the work of getting the file from disk and loading the data into memory. The macro loads the file as a string and the function str.lines() separates the lines within the string into an array. (Line 7.)

The rand::thread_rng() call at Line 10 returns a number that is used as an index by the .choose() function at Line 10. The result of it all is an array of characters (a string) that reflects the wise saying returned by the function.

### Creating the WebAssembly Binary

Let’s move on compiling the code into a WebAssembly Binary.

**Step 1: **Compile the source code into a WebAssembly is shown below.

1 | cargo build —lib —target wasm32–unknown–unknown
---|---

WHERE

**cargo build** is the command and subcommand to invoke the Rust compiler using the settings in the Cargo.toml file.

**–lib** is the option indicating that you’re going to build a library against the source code in the ./lib directory.

**–targetwasm32-unknown-unknown** indicates that Rust will use the wasm-unknown-unknown compiler and will store the build artifacts as well as the WebAssembly binary into directories within the target directory, **wasm32-unknown-unknown.**

#### **Understanding the Rust Target Triple Naming Convention**

Rust has a naming convention for targets. The term used for the convention is a _target triple_. A target triple uses the following format: ARCH-VENDOR-SYS-ABI.

**WHERE**

**ARCH** describes the intended target architecture, for example wasm32 for WebAssembly, or i686 for current-generation Intel chips.

**VENDOR** describes the vendor publishing the target; for example, Apple or Nvidia.

**SYS** describes the operating system; for example, Windows or Linux.

**ABI** describes how the process starts up, for eabi is used for bare metal, while gnu is used for glibc.

Thus, the name i686-unknown-linux-gnu means that the Rust binary is targeted to an i686 architecture, the vendor is defined as unknown, the targeted operating system is Linux, and ABI is gnu.

In the case of wasm32-unknown-unknown, the target is WebAssembly, the operating system is unknown and the ABI is unknown. The informal inference of the name is “it’s a WebAssembly binary.”

There are a standard set of built-in targets defined by Rust that can be found [here][17].

If you find the naming convention to be confusing because there are optional fields and sometimes there are four sections to the name, while other times there will be three sections, you are not alone.

### Deploying the Binary Server-Side Using Deno

After we build the base WeAssembly binary, we need to create the adapter (a.k.a shim) files and a special version of the WebAssembly binary — all of which can be run from within JavaScript. We’ll create these artifacts using the [wasm-bindgen][18] tool.

**Step 1: **We create these new artifacts using the command shown below.

1 | wasm–bindgen —target deno ./target/wasm32–unknown–unknown/debug/wisesayings.wasm —out–dir ./server
---|---

WHERE

**wasm-bindgen** is the command for creating the adapter files and the special WebAssembly binary.

**–target deno ./target/wasm32-unknown-unknown/debug/wisesayings.wasm** is the option that indicates the adapter files will be targeted for Deno. Also, the option denotes the location of the original WebAssembly wasm binary that is the basis for the artifact generation process.

**–out-dir ./server** is the option that declares the location where the created adapter files will be stored on disk; in this case, **./server**.

The result of running wasm-bindgen is the server directory shown in Listing 4 below.

1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 | . ├── Cargo.toml ├── cheatsheet.txt ├── LICENSE ├── lldbconfig ├── package–lock.json ├── README.md ├── server │   ├── main.ts │   ├── package–lock.json │   ├── wisesayings_bg.wasm │   ├── wisesayings_bg.wasm.d.ts │   ├── wisesayings.d.ts │   └── wisesayings.js └── src     ├── fortunes.txt     ├── lib.rs     └── main.rs
---|---

_Listing 4: The server directory contains the results of running wasm-bindgen_

Notice that the contents of the server directory, shown above in Listing 4, now has some added JavaScript (js) and TypeScript (ts) files. Also, the server directory has the special version of the WebAssembly binary, named wisesayings_bg.wasm. This version of the WebAssembly binary is a stripped-down version of the wasm file originally created by the initial compilation, done when invoking cargo build earlier. You can think of this new wasm file as a JavaScript-friendly version of the original WebAssembly binary. The suffix, _bg, is an abbreviation for bindgen.

### Running the Deno Server

Once all the artifacts for running WebAssembly have been generated into the server directory, we’re ready to invoke the Deno web server. Listing 5 below shows content of main.ts, which is the source code for the Deno web server.

1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 | import { serve } from “https://deno.land/std@0.86.0/http/server.ts”; import { get_wise_saying } from “./wisesayings.js”; const env = Deno.env.toObject(); let port = 4040; if(env.WISESAYING_PORT){   port = Number(env.WISESAYING_PORT); }; const server = serve({ hostname: “0.0.0.0”, port}); console.log(`HTTP webserver running at ${new Date()}.  Access it at:  http://localhost:${port}/`); for await (const request of server) {     const saying = get_wise_saying();     request.respond({ status: 200, body: saying });   }
---|---

_Listing 5: main.ts is the Deno webserver code that uses the WebAssembly binary_

You’ll notice that the WebAssembly wasm binary is not imported directly. This is because the work of representing the WebAssembly binary is done by the JavaScript and TypeScript adapter (a.k.a shim) files generated earlier. The WebAssembly/Rust function, get_wise_sayings(), is exposed in the auto-generated JavaScript file, wisesayings.js.

The function get_wise_saying is imported into the webserver code at Line 2 above. The function is used at Line 16 to get a wise saying that will be returned as an HTTP response by the webserver.

To get the Deno web server up and running, execute the following command in a terminal window.

**Step 1:**

1 | deno run —allow–read —allow–net —allow–env ./main.ts
---|---

WHERE

deno run is the command set to invoke the webserver.

–allow-read is the option that allows the Deno webserver code to have permission to read files from disk.

–allow-net is the option that allows the Deno webserver code to have access to the network.

–allow-env is the option that allows the Deno webserver code read environment variables.

./main.ts is the TypeScript file that Deno is to run. In this case, it’s the webserver code.

When the webserver is up and running, you’ll get output similar to the following:

HTTP webserver running at Thu Mar 11 2021 17:57:32 GMT+0000 (Coordinated Universal Time). Access it at: <http://localhost:4040/>

**Step 2:**

Run the following command in a terminal on your computer to exercise the Deno/WebAssembly code

1 | curl localhost:4040
---|---

You’ll get a wise saying, for example:

_True beauty lies within._

**Congratulations!** You’ve created and run a server-side WebAssembly binary.

### Putting It All Together

In this article, I’ve shown you everything you need to know to create and use a WebAssembly binary in a Deno web server. Yet for as detailed as the information presented in this article is, there is still a lot more to learn about what’s under the covers. Remember, Rust is a low-level programming language. It’s meant to go right up against the processor and memory directly. That’s where its power really is. The real benefit of WebAssembly is using the technology to do computationally intensive work from within a browser. Applications that are well suited to WebAssembly are visually intensive games and activities that require complex machine learning capabilities — for example, real-time voice recognition and language translation. WebAssembly allows you to do computation on the client-side that previously was only possible on the server-side. As Solomon Hykes said, WebAssembly is the future of computing. He might very well be right.

The important thing to understand is that WebAssembly provides enormous opportunities for those wanting to explore cutting-edge approaches to modern distributed computing. Hopefully, the information presented in this piece will motivate you to explore those opportunities.

The post [Using Web Assembly Written in Rust on the Server-Side][19] appeared first on [Linux Foundation – Training][20].

--------------------------------------------------------------------------------

via: https://www.linux.com/news/using-web-assembly-written-in-rust-on-the-server-side/

作者：[Dan Brown][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://training.linuxfoundation.org/announcements/using-web-assembly-written-in-rust-on-the-server-side/
[b]: https://github.com/lujun9972
[1]: https://thenewstack.io/using-web-assembly-written-in-rust-on-the-server-side/
[2]: https://www.infoq.com/news/2017/12/webassembly-browser-support/
[3]: https://deno.land/
[4]: https://twitter.com/solomonstre/status/1111004913222324225?s=20
[5]: https://github.com/reselbob/wisesayingswasm
[6]: https://github.com/reselbob/wisesayingswasm/blob/main/README.md
[7]: https://rustwasm.github.io/docs/wasm-bindgen/reference/cli.html
[8]: https://doc.rust-lang.org/cargo/reference/manifest.html
[9]: mailto:bob@CogArtTech.com
[10]: https://docs.rs/getrandom/0.2.2/getrandom/
[11]: https://docs.rs/getrandom/0.2.2/getrandom/#webassembly-support
[12]: https://rustwasm.github.io/docs/wasm-bindgen/
[13]: https://rustwasm.github.io/docs/wasm-pack/tutorials/npm-browser-packages/template-deep-dive/cargo-toml.html#1-crate-type
[14]: https://en.wikipedia.org/wiki/Library_(computing)#Shared_libraries
[15]: https://doc.rust-lang.org/book/ch19-06-macros.html
[16]: https://doc.rust-lang.org/std/macro.include_str.html
[17]: https://docs.rust-embedded.org/embedonomicon/compiler-support.html#built-in-target
[18]: https://rustwasm.github.io/wasm-bindgen/
[19]: https://training.linuxfoundation.org/announcements/using-web-assembly-written-in-rust-on-the-server-side/
[20]: https://training.linuxfoundation.org/

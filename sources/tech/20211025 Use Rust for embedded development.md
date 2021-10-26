[#]: subject: "Use Rust for embedded development"
[#]: via: "https://opensource.com/article/21/10/rust-embedded-development"
[#]: author: "Alan Smithee https://opensource.com/users/alansmithee"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Use Rust for embedded development
======
Rust's high performance, reliability, and productivity make it apt for
embedded systems.
![Ferris the crab under the sea, unofficial logo for Rust programming language][1]

Over the past several years, Rust has gained a passionate following among programmers. Tech trends come and go, so it can be difficult to separate excitement just because something is new versus excitement over the merits of a technology, but I think Rust is a truly well-designed language. It aims to help developers build reliable and efficient software, and it was designed for that purpose from the ground up. There are key features you'll hear about Rust, and in this article, I demonstrate that many of these features are exactly why Rust also happens to be great for embedded systems. Here are some examples:

  * High performance: It's fast, with high memory utilization
  * Reliability: Memory errors can be eliminated during compilation
  * Productivity: Great documentation, a friendly compiler with useful error messages, and top-notch tooling. There's an integrated package manager and build tool, smart multi-editor support with auto-completion and type inspections, an auto-formatter, and more.



### Why use Rust for embedded development?

Rust is designed to guarantee both security and high performance. Embedded software can have problems, mostly due to memory. Rust is, in a way, a compiler-oriented language, so you can be sure that you're using memory safely while compiling. Here are some of the benefits of using Rust to develop on embedded devices:

  * Powerful static analysis
  * Flexible memory
  * Fearless concurrency
  * Interoperability
  * Portability
  * Community-driven



In this article, I use the open source [RT-Thread operating system][2] to demonstrate how to use Rust for embedded development.

### How to call Rust in C

When calling Rust code in C code, you must package the Rust source code as a static library file. When the C code compiles, link it in.

#### Creating a static library with Rust

There are two steps in this process.

1\. Use `cargo init --lib rust_to_c` to build a lib library in Clion. Add the following code to the `lib.rs`. The following function evaluates the sum of two values of type **i32** and returns the result:


```
#![no_std]
use core::panic::PanicInfo;

#[no_mangle]
pub extern "C" fn sum(a: i32, b: i32) -&gt; i32 {
    a + b
}

#[panic_handler]
fn panic(_info:&amp;PanicInfo) -&gt; !{
    loop{}
}
```

2\. Add the following code to your `Cargo.toml` file to tell Rustc what type of library to generate:


```
[lib]
name = "sum"
crate-type = ["staticlib"]
path = "src/lib.rs"
```

#### Cross-compilation

You can cross-compile for your target. Assuming your embedded system is Arm-based, the steps are simple:


```
`$ rustup target add armv7a-none-eabi`
```

2\. Generate the static library file:


```
$ cargo build --target=armv7a-none-eabi --release --verbose
Fresh rust_to_c v0.1.0
Finished release [optimized] target(s) in 0.01s
```

#### Generate Header File

You need header files, too.

1\. Install [cbindgen][3]. The `cbindgen` tool generates a C or C++11 header file from the Rust library:


```
`$ cargo install --force cbindgen`
```

2\. Create a new `cbindgen.toml` file under your project folder.

3\. Generate a header file:


```
`$ cbindgen --config cbindgen.toml --crate rust_to_c --output sum.h`
```

#### Call the Rust library file

Now you can make calls to your Rust libraries.

1\. Put the generated `sum.h` and `sum.a` files into the `rt-thread/bsp/qemu-vexpress-a9/applications` directory.

2\. Modify the `SConscript` file and add a static library:


```
   from building import *
   
   cwd     = GetCurrentDir()
   src     = Glob('*.c') + Glob('*.cpp')
   CPPPATH = [cwd]
   
   LIBS = ["libsum.a"]
   LIBPATH = [GetCurrentDir()]
   
   group = DefineGroup('Applications', src, depend = [''], CPPPATH = CPPPATH, LIBS = LIBS, LIBPATH = LIBPATH)
   
   Return('group')
```

3\. Call the **sum** function in the main function, get the return value, and `printf` the value.


```
   #include &lt;stdint.h&gt;
   #include &lt;stdio.h&gt;
   #include &lt;stdlib.h&gt;
   #include &lt;rtthread.h&gt;
   #include "sum.h"
   
   int main(void)
   {
       int32_t tmp;
   
       tmp = sum(1, 2);
       printf("call rust sum(1, 2) = %d\n", tmp);
   
       return 0;
   }
```

4\. In the RT-Thread [Env][4] environment, use `scons` to compile the project and run:


```
$ scons -j6
scons: Reading SConscript files ...
scons: done reading SConscript files.
scons: Building targets ...
[...]
scons: done building targets.

$ qemu.sh
 \ | /
\- RT -     Thread Operating System
 / | \     4.0.4 build Jul 28 2021
2006 - 2021 Copyright by rt-thread team
lwIP-2.1.2 initialized!
[...]
call rust sum(1, 2) = 3
```

### Add, subtract, multiply, and divide

You can implement some complicated math in Rust. In the `lib.rs` file, use the Rust language to implement add, subtract, multiply, and divide:


```
#![no_std]
use core::panic::PanicInfo;

#[no_mangle]
pub extern "C" fn add(a: i32, b: i32) -&gt; i32 {
    a + b
}

#[no_mangle]
pub extern "C" fn subtract(a: i32, b: i32) -&gt; i32 {
    a - b
}

#[no_mangle]
pub extern "C" fn multiply(a: i32, b: i32) -&gt; i32 {
    a * b
}

#[no_mangle]
pub extern "C" fn divide(a: i32, b: i32) -&gt; i32 {
    a / b
}

#[panic_handler]
fn panic(_info:&amp;PanicInfo) -&gt; !{
    loop{}
}
```

Build your library files and header files and place them in the application directory. Use `scons` to compile. If errors appear during linking, find the solution on the official [Github page][5].

Modify the `rtconfig.py` file, and add the link parameter `--allow-multiple-definition`:


```
       DEVICE = ' -march=armv7-a -marm -msoft-float'
       CFLAGS = DEVICE + ' -Wall'
       AFLAGS = ' -c' + DEVICE + ' -x assembler-with-cpp -D__ASSEMBLY__ -I.'
       LINK_SCRIPT = 'link.lds'
       LFLAGS = DEVICE + ' -nostartfiles -Wl,--gc-sections,-Map=rtthread.map,-cref,-u,system_vectors,--allow-multiple-definition'+\
                         ' -T %s' % LINK_SCRIPT
   
       CPATH = ''
       LPATH = ''
```

Compile and run QEMU to see your work.

### Call C in Rust

Rust can be called in C code, but what about calling C in your Rust code? The following is an example of calling the `rt_kprintf` C function in Rust code.

First, modify the `lib.rs` file:


```
    // The imported rt-thread functions list
    extern "C" {
        pub fn rt_kprintf(format: *const u8, ...);
    }
   
    #[no_mangle]
    pub extern "C" fn add(a: i32, b: i32) -&gt; i32 {
        unsafe {
            rt_kprintf(b"this is from rust\n" as *const u8);
        }
        a + b
    }
```

Next, generate the library file:


```
$ cargo build --target=armv7a-none-eabi --release --verbose
Compiling rust_to_c v0.1.0
Running `rustc --crate-name sum --edition=2018 src/lib.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type staticlib --emit=dep-info,link -C opt-level=3 -C embed-bitcode=no -C metadata=a
Finished release [optimized] target(s) in 0.11s
```

And now, to run the code, copy the library files generated by Rust into the application directory and rebuild:


```
$ scons -j6 scons: Reading SConscript files ... scons: done reading SConscript files. [...]
scons: Building targets ... scons: done building targets.
```

Run QEMU again to see the results in your embedded image.

### You can have it all

Using Rust for your embedded development gives you all the features of Rust without the need to sacrifice flexibility or stability. Try Rust on your embedded system today. For more information about the process of embedded Rust (and about RT-Thread itself), check out the RT-Thread project's [YouTube channel][6]. And remember, embedded can be open, too.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/rust-embedded-development

作者：[Alan Smithee][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alansmithee
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rust_programming_crab_sea.png?itok=2eWLz8A5 (Ferris the crab under the sea, unofficial logo for Rust programming language)
[2]: https://github.com/RT-Thread/rt-thread
[3]: https://github.com/eqrion/cbindgen
[4]: https://www.rt-thread.io/download.html?download=Env
[5]: https://github.com/rust-lang/compiler-builtins/issues/353
[6]: https://www.youtube.com/channel/UCdDHtIfSYPq4002r27ffqP

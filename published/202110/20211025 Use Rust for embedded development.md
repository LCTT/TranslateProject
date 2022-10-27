[#]: subject: "Use Rust for embedded development"
[#]: via: "https://opensource.com/article/21/10/rust-embedded-development"
[#]: author: "Alan Smithee https://opensource.com/users/alansmithee"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13921-1.html"

使用 Rust 进行嵌入式开发
======

> Rust 的高性能、高可靠性和高生产力使它适合于嵌入式系统。

![](https://img.linux.net.cn/data/attachment/album/202110/26/103848djcdhjk0d2z1hc52.jpg)

在过去的几年里，Rust 在程序员中获得了热情的追捧。技术潮流来来去去，所以很难将仅仅因为某项新技术而产生的兴奋与对某项技术的优点的兴奋区分开来，但我认为 Rust 是一种真正设计良好的语言。它的目标是帮助开发者建立可靠和高效的软件，而且它从一开始就是为这个目的设计的。你可能听过一些 Rust 的关键特性，在这篇文章中，我会证明这些特性正是 Rust 也恰好适合嵌入式系统的原因。比如：

  * 高性能：它速度快，内存利用率高
  * 可靠性：在编译过程中可以消除内存错误
  * 生产力：很棒的文档，友好的编译器，有用的错误信息，以及一流的工具化。它有一个集成的包管理器和构建工具，智能的多编辑器支持自动补完和类型检查、自动格式化等等。

### 为什么使用 Rust 进行嵌入式开发？

Rust 的设计是为了保证安全和高性能。嵌入式软件会出现的问题主要是内存的问题。从某种程度上说，Rust 是一种面向编译器的语言，所以你可以确保在编译时安全使用内存。以下是使用 Rust 在嵌入式设备上开发的一些好处：

  * 强大的静态分析
  * 灵活的内存
  * 无畏的并发性
  * 互操作性
  * 可移植性
  * 社区驱动

在这篇文章中，我使用开源的 [RT-Thread 操作系统][2] 来演示如何使用 Rust 进行嵌入式开发。

### 如何在 C 语言中调用 Rust

在 C 代码中调用 Rust 代码时，你必须将 Rust 源代码打包成静态库文件。当 C 代码编译时，将其链接进去。

#### 用 Rust 创建一个静态库

在这个过程中，有两个步骤：

1、使用 `cargo init --lib rust_to_c` 在 Clion 中建立一个 `lib` 库。在 `lib.rs` 中加入以下代码。下面的函数计算两个类型为 `i32` 的值的总和并返回结果：

```
#![no_std]
use core::panic::PanicInfo;

#[no_mangle]
pub extern "C" fn sum(a: i32, b: i32) -> i32 {
    a + b
}

#[panic_handler]
fn panic(_info:&PanicInfo) -> !{
    loop{}
}
```

2、在你的 `Cargo.toml` 文件中添加以下代码，以告诉 Rustc 要生成什么类型的库：

```
[lib]
name = "sum"
crate-type = ["staticlib"]
path = "src/lib.rs"
```

#### 交叉编译

你可以针对你的目标平台进行交叉编译。假设你的嵌入式系统是基于 Arm 的，步骤很简单：

```
$ rustup target add armv7a-none-eabi
```

生成静态库文件：

```
$ cargo build --target=armv7a-none-eabi --release --verbose
Fresh rust_to_c v0.1.0
Finished release [optimized] target(s) in 0.01s
```

#### 生成头文件

你也需要头文件：

1、安装 [cbindgen][3]。`cbindgen` 工具会从 Rust 库中生成一个 C 或 C++11 的头文件：

```
$ cargo install --force cbindgen
```

2、在你的项目文件夹下创建一个新的 `cbindgen.toml` 文件。

3、生成一个头文件：

```
$ cbindgen --config cbindgen.toml --crate rust_to_c --output sum.h
```

#### 调用 Rust 库文件

现在你可以对你的 Rust 库进行调用了。

1、把生成的 `sum.h` 和 `sum.a` 文件放到 `rt-thread/bsp/qemu-vexpress-a9/applications` 目录下。

2、修改 `SConscript` 文件并添加一个静态库：

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

3、在主函数中调用 `sum` 函数，得到返回值，并 `printf` 该值：

```
   #include <stdint.h>
   #include <stdio.h>
   #include <stdlib.h>
   #include <rtthread.h>
   #include "sum.h"
   
   int main(void)
   {
       int32_t tmp;
   
       tmp = sum(1, 2);
       printf("call rust sum(1, 2) = %d\n", tmp);
   
       return 0;
   }
```

4、在 RT-Thread [Env][4] 环境中，使用 `scons` 来编译项目并运行：

```
$ scons -j6
scons: Reading SConscript files ...
scons: done reading SConscript files.
scons: Building targets ...
[...]
scons: done building targets.

$ qemu.sh
 \ | /
- RT -     Thread Operating System
 / | \     4.0.4 build Jul 28 2021
2006 - 2021 Copyright by rt-thread team
lwIP-2.1.2 initialized!
[...]
call rust sum(1, 2) = 3
```

### 加、减、乘、除

你可以在 Rust 中实现一些复杂的数学运算。在 `lib.rs` 文件中，使用 Rust 语言来实现加、减、乘、除：

```
#![no_std]
use core::panic::PanicInfo;

#[no_mangle]
pub extern "C" fn add(a: i32, b: i32) -> i32 {
    a + b
}

#[no_mangle]
pub extern "C" fn subtract(a: i32, b: i32) -> i32 {
    a - b
}

#[no_mangle]
pub extern "C" fn multiply(a: i32, b: i32) -> i32 {
    a * b
}

#[no_mangle]
pub extern "C" fn divide(a: i32, b: i32) -> i32 {
    a / b
}

#[panic_handler]
fn panic(_info:&PanicInfo) -> !{
    loop{}
}
```

构建你的库文件和头文件，并把它们放在应用程序目录中。使用 `scons` 来编译。如果在链接过程中出现错误，请在官方 [Github 页面][5] 中找到解决方案。

修改 `rtconfig.py` 文件，并添加链接参数 `--allow-multiple-definition`：

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

编译并运行 QEMU 来看看你的工作。

### 在 Rust 中调用 C 语言

Rust 可以在 C 代码中调用，但是如何在你的 Rust 代码中调用 C 呢？下面是一个在 Rust 代码中调用 `rt_kprintf` C 函数的例子。

首先，修改 `lib.rs` 文件：

```
    // The imported rt-thread functions list
    extern "C" {
        pub fn rt_kprintf(format: *const u8, ...);
    }
   
    #[no_mangle]
    pub extern "C" fn add(a: i32, b: i32) -> i32 {
        unsafe {
            rt_kprintf(b"this is from rust\n" as *const u8);
        }
        a + b
    }
```

接下来，生成库文件：

```
$ cargo build --target=armv7a-none-eabi --release --verbose
Compiling rust_to_c v0.1.0
Running `rustc --crate-name sum --edition=2018 src/lib.rs --error-format=json --json=diagnostic-rendered-ansi --crate-type staticlib --emit=dep-info,link -C opt-level=3 -C embed-bitcode=no -C metadata=a
Finished release [optimized] target(s) in 0.11s
```

而现在，要运行代码，将 Rust 生成的库文件复制到应用程序目录中，然后重新构建：

```
$ scons -j6 scons: Reading SConscript files ... scons: done reading SConscript files. [...]
scons: Building targets ... scons: done building targets.
```

再次运行 QEMU，可以在你的嵌入式镜像中看到结果。

### 你可以拥有这一切

在你的嵌入式开发中使用 Rust，你可以获得 Rust 的所有功能，而不需要牺牲灵活性或稳定性。今天就在你的嵌入式系统上试试 Rust 吧。关于嵌入式 Rust 的过程（以及 RT-Thread 本身）的更多信息，请查看 RT-Thread 项目的 [YouTube 频道][6]。请记住，嵌入式也可以是开放的。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/rust-embedded-development

作者：[Alan Smithee][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alansmithee
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rust_programming_crab_sea.png?itok=2eWLz8A5 (Ferris the crab under the sea, unofficial logo for Rust programming language)
[2]: https://github.com/RT-Thread/rt-thread
[3]: https://github.com/eqrion/cbindgen
[4]: https://www.rt-thread.io/download.html?download=Env
[5]: https://github.com/rust-lang/compiler-builtins/issues/353
[6]: https://www.youtube.com/channel/UCdDHtIfSYPq4002r27ffqP

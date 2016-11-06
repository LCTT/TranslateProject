当 Rust 遇上 Fedora
=============

![rust](https://i2.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/09/rust.jpg?fit=945%2C400&ssl=1)

### Rust 是什么？

Rust 是一种系统编程语言，它运行速度惊人，并且可以避免几乎所有的崩溃、[内存区块错误](https://wikipedia.org/wiki/Segmentation_fault) 以及数据竞争。你也许会质疑为什么我们还需要又一种这样的语言，因为已经有很多同类的语言了。这篇文章将会告诉你为什么。

### 安全性 vs. 控制权

![为什么选择 Rust？](https://i0.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/09/Screenshot-from-2016-09-12-08-29-02.png?&ssl=1)

你也许见过上面的图谱。一边是 C/C++，对运行的硬件拥有更多的控制权，因此它可以让开发者通过对所生成的机器代码进行更精细的控制来优化性能。然而这不是很安全，这很容易造成内存区块错误以及像 [心血漏洞](https://fedoramagazine.org/update-on-cve-2014-0160-aka-heartbleed/) 这样的安全漏洞。

另一边是像 Python、Ruby 和 JavaScript 这种没有给予开发者多少控制权但是可以创建出更安全的代码的语言。虽然这些代码可以生成相当安全并且可控的异常，但是它们不会造成内存区块错误。

在图谱中间的区域是 Java 和一些其它混合了这些特性的语言。它们提供对运行的硬件部分控制权，并且尝试尽量减少漏洞的出现。

Rust 有点不太一样，它并没有出现在这个图谱上。它同时提供给开发者安全性和控制权。

### Rust 的特性

Rust 是一种像 C/C++ 一样的系统编程语言，除此之外它还给予开发者对内存分配细粒度的控制。它不需要垃圾回收器。它的运行环境（runtime）很小，运行速度接近于在裸机上的运行。它为开发者提供了代码性能更大的保证。此外，任何了解 C/C++ 的人都能读懂以及编写 Rust 的代码。

Rust 的运行速度非常快，因为它是一种编译语言。它使用 LLVM 作为编译器的后端，并且还可以利用一大堆优化。在许多领域，它的性能都要高于 C/C++。它像 JavaScript、Ruby 和 Python 一样，与生俱来就是安全的，这意味着它们不会造成内存区块错误、野指针（dangling pointers）或者空指针（null pointers）。

另外一个很重要的特性就是消除数据竞争。如今，大多数计算机都具有多个核心，许多线程并发运行。然而，开发者很难编写好的并行代码，因此这个特性除去了他们的后顾之忧。Rust 使用两个关键概念来消除数据竞争：

* 所有权（Ownership）。每一个变量都被移动到一个新的位置，并防止通过先前的位置来引用它。每一个数据块只有一个所有者。
* 借用（Borrowing）。被拥有的值可以借用，以允许在一段时间内使用。

### 在 Fedora 24 和 25 上使用 Rust

若要开始使用，只需安装软件包：

```
sudo dnf install rust
```

```
fn main() {
    println!("Hello, Rust is running on Fedora 25 Alpha!");
}
```

```
rustc helloworld.rs
./helloworld
```

在 Fedora 上执行以下命令来安装最新的测试版本：

```
sudo dnf --enablerepo=updates-testing --refresh --best install rust
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/rust-meets-fedora/

作者：[Sumantro Mukherjee][a]
译者：[OneNewLife](https://github.com/OneNewLife)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/sumantrom/

OneNewLife translating

### [Rust meets Fedora](https://fedoramagazine.org/rust-meets-fedora/)

### ![rust](https://i2.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/09/rust.jpg?fit=945%2C400&ssl=1)

### What is Rust?

Rust is a system programming language which runs blazingly fast, and prevents almost all crashes, [segfaults](https://wikipedia.org/wiki/Segmentation_fault), and data races. You might wonder exactly why yet another programming language is useful, since there are already so many of them. This article aims to explain why.

### Safety vs. control

[![Why Rust?](https://i0.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/09/Screenshot-from-2016-09-12-08-29-02.png?resize=300%2C210&ssl=1)](https://i0.wp.com/cdn.fedoramagazine.org/wp-content/uploads/2016/09/Screenshot-from-2016-09-12-08-29-02.png?ssl=1)

You may have seen a diagram of the above spectrum. On one side there’s C/C++, which has more control of the hardware it’s running on. Therefore it lets the developer optimize performance by executing finer control over the generated machine code. However, this isn’t very safe; it’s easier to cause a segfault, or security bugs like [Heartbleed](https://fedoramagazine.org/update-on-cve-2014-0160-aka-heartbleed/).

On the other hand, there are languages like Python, Ruby, and JavaScript where the developer has little control but creates safer code. The code can’t generate a segfault, although it can generate exceptions which are fairly safe and contained.

Somewhere in the middle, there’s Java and a few other languages which are a mixture of these characteristics. They offer some control of the hardware they run on but try to minimize vulnerabilities.

Rust is a bit different, and doesn’t fall in this spectrum. Instead it gives the developer both safety and control.

### Specialties of Rust

Rust is a system programming language like C/C++, except that it gives the developer fine grained control over memory allocations. A garbage collector is not required. It has a minimal runtime, and runs very close to the bare metal. The developer has greater guarantees about the performance of the code. Furthermore, anyone who knows C/C++ can understand and write code for this language.

Rust runs blazingly fast, since it’s a compiled language. It uses LLVM as the compiler backend and can tap into a large suite of optimizations. In many areas it can perform better than C/C++. Like JavaScript, Ruby, and Python, it’s safe by default, meaning it doesn’t cause segfaults, dangling pointers, or null pointers.

Another important feature is the elimination of data races. Nowadays, most computers have multiple cores and many threads running in parallel. However it’s tough for developers to write good parallel code, so this feature removes that necessity. There are two key concepts Rust uses to eliminate data races:

*   Ownership. Each variable is moved to a new location, and prevents the previous location from using it. There is only oneowner of each piece of data.
*   Borrowing. Owned values can be borrowed to allow usage for a certain period of time.

### Rust in Fedora 24 and 25

To get started, just install the package:

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

Run the following command to install the latest testing version on Fedora:

```
sudo dnf --enablerepo=updates-testing --refresh --best install rust
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/rust-meets-fedora/

作者：[Sumantro Mukherjee][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/sumantrom/

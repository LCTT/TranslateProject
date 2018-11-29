为什么 Linux 用户应该试一试 Rust
======
> 在 Linux 系统上安装 Rust 编程语言可能是你近年来所做的最有价值的事情之一。

![](https://images.idgesg.net/images/article/2018/09/rust-rusted-metal-100773678-large.jpg)

Rust 是一种相当年轻和现代的编程语言，具有许多使其非常灵活而及其安全的功能。数据显示它正在变得非常受欢迎，连续三年（[2016][1]、[2017][2] 和 [2018][3]）在 Stack Overflow 开发者调查中获得“最受喜爱的编程语言”的第一名。

Rust 也是开源语言的一种，它具有一系列特殊的功能，使得它可以适应许多不同的编程项目。 它最初源于 2006 年 Mozilla 员工的个人项目，几年后（2009 年）被 Mozilla 选为特别项目，然后在 2010 年宣布供公众使用。

Rust 程序运行速度极快，可防止段错误，并能保证线程安全。这些属性使该语言极大地吸引了专注于应用程序安全性的开发人员。Rust 也是一种非常易读的语言，可用于从简单程序到非常大而复杂的项目。

Rust 优点：

  * 内存安全 —— Rust 不会受到悬空指针、缓冲区溢出或其他与内存相关的错误的影响。它提供内存安全，无回收垃圾。
  * 通用 —— Rust 是适用于任何类型编程的语言
  * 快速 —— Rust 在性能上与 C / C++ 相当，但具有更好的安全功能。
  * 高效 —— Rust 是为了便于并发编程而构建的。
  * 面向项目 —— Rust 具有内置的依赖关系和构建管理系统 Cargo。
  * 得到很好的支持 —— Rust 有一个令人印象深刻的[支持社区][4]。

Rust 还强制执行 RAII（<ruby>资源获取初始化<rt>Resource Acquisition Is Initialization</rt></ruby>）。这意味着当一个对象超出范围时，将调用其析构函数并释放其资源，从而提供防止资源泄漏的屏蔽。它提供了功能抽象和一个很棒的[类型系统][5]，并具有速度和数学健全性。

简而言之，Rust 是一种令人印象深刻的系统编程语言，具有其它大多数语言所缺乏的功能，使其成为 C、C++ 和 Objective-C 等多年来一直被使用的语言的有力竞争者。

### 安装 Rust

安装 Rust 是一个相当简单的过程。

```
$ curl https://sh.rustup.rs -sSf | sh
```

安装 Rust 后，使用 `rustc --version` 或 `which` 命令显示版本信息。

```
$ which rustc
rustc 1.27.2 (58cc626de 2018-07-18)
$ rustc --version
rustc 1.27.2 (58cc626de 2018-07-18)
```

### Rust 入门

Rust 即使是最简单的代码也与你之前使用过的语言输入的完全不同。

```
$ cat hello.rs
fn main() {
    // Print a greeting
    println!("Hello, world!");
}
```

在这些行中，我们正在设置一个函数（`main`），添加一个描述该函数的注释，并使用 `println` 语句来创建输出。您可以使用下面显示的命令编译然后运行程序。

```
$ rustc hello.rs
$ ./hello
Hello, world!
```

另外，你也可以创建一个“项目”（通常仅用于比这个更复杂的程序！）来保持代码的有序性。

```
$ mkdir ~/projects
$ cd ~/projects
$ mkdir hello_world
$ cd hello_world
```

请注意，即使是简单的程序，一旦编译，就会变成相当大的可执行文件。

```
$ ./hello
Hello, world!
$ ls -l hello*
-rwxrwxr-x 1 shs shs 5486784 Sep 23 19:02 hello     <== executable
-rw-rw-r-- 1 shs shs 68 Sep 23 15:25 hello.rs
```

当然，这只是一个开始且传统的“Hello, world!” 程序。 Rust 语言具有一系列可帮助你快速进入高级编程技能的功能。

### 学习 Rust

![rust programming language book cover][6]

*No Starch Press*

Steve Klabnik 和 Carol Nichols 的《[Rust 编程语言][7]》 （2018）一书提供了学习 Rust 的最佳方法之一。 这本书由核心开发团队的两名成员撰写，可从 [No Starch Press][7] 出版社获得纸制书或者从 [rust-lang.org][8] 获得电子书。它已经成为 Rust 开发者社区中的参考书。

在所涉及的众多主题中，你将了解这些高级主题：

  * 所有权和 borrowing
  * 安全保障
  * 测试和错误处理
  * 智能指针和多线程
  * 高级模式匹配
  * 使用 Cargo（内置包管理器）
  * 使用 Rust 的高级编译器

#### 目录

- 前言（Nicholas Matsakis 和 Aaron Turon 编写）
- 致谢
- 介绍
- 第 1 章：新手入门
- 第 2 章：猜谜游戏
- 第 3 章：通用编程概念
- 第 4 章：了解所有权
- 第 5 章：结构
- 第 6 章：枚举和模式匹配
- 第 7 章：模块
- 第 8 章：常见集合
- 第 9 章：错误处理
- 第 10 章：通用类型、特征和生命周期
- 第 11 章：测试
- 第 12 章：输入/输出项目
- 第 13 章：迭代器和闭包
- 第 14 章：关于货物和 Crates.io 的更多信息
- 第 15 章：智能指针
- 第 16 章：并发
- 第 17 章：Rust 是面向对象的吗？
- 第 18 章：模式
- 第 19 章：关于生命周期的更多信息
- 第 20 章：高级类型系统功能
- 附录 A：关键字
- 附录 B：运算符和符号
- 附录 C：可衍生的特征
- 附录 D：宏
- 索引

《[Rust 编程语言][7]》 将你从基本安装和语言语法带到复杂的主题，例如模块、错误处理、crates（与其他语言中的 “library”
 或“package”同义），模块（允许你将你的代码分配到 crate 本身），生命周期等。

可能最重要的是，本书可以让您从基本的编程技巧转向构建和编译复杂、安全且非常有用的程序。

### 结束

如果你已经准备好用一种非常值得花时间和精力学习并且越来越受欢迎的语言进行一些严肃的编程，那么 Rust 是一个不错的选择！

加入 [Facebook][9] 和 [LinkedIn][10] 上的 Network World 社区，评论最重要的话题。

--------------------------------------------------------------------------------


via: https://www.networkworld.com/article/3308162/linux/why-you-should-try-rust.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[way-ww](https://github.com/way-ww)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]: https://insights.stackoverflow.com/survey/2016#technology-most-loved-dreaded-and-wanted
[2]: https://insights.stackoverflow.com/survey/2017#technology-most-loved-dreaded-and-wanted-languages
[3]: https://insights.stackoverflow.com/survey/2018#technology-most-loved-dreaded-and-wanted-languages
[4]: https://www.rust-lang.org/en-US/community.html
[5]: https://doc.rust-lang.org/reference/type-system.html
[6]: https://images.idgesg.net/images/article/2018/09/rust-programming-language_book-cover-100773679-small.jpg
[7]: https://nostarch.com/Rust
[8]: https://doc.rust-lang.org/book/2018-edition/index.html
[9]: https://www.facebook.com/NetworkWorld/
[10]: https://www.linkedin.com/company/network-world

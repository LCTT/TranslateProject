[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12979-1.html)
[#]: subject: (Learn Rust by writing a simple game)
[#]: via: (https://opensource.com/article/20/12/learn-rust)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

通过编写一个简单的游戏来学习 Rust
======

> 你可以尝试以多种语言编程一个简单的游戏来开始编程之路。
 
![海底的螃蟹 Ferris，Rust 编程语言的非官方标志][1]

当你想学习一门新的编程语言时，不妨关注一下编程语言的共同点。

  * 变量
  * 表达式
  * 语句

这些概念是大多数编程语言的基础。一旦你理解了它们，你就可以开始弄清楚其余的东西。

因为编程语言通常具有相似性，一旦你懂了一种语言，你就可以通过理解其差异来学习另一种语言的基础知识。

学习新语言的一个好方法是使用一个你可以用来练习的标准程序。这可以让你专注于语言，而不是程序的逻辑。我在这一系列文章中使用了一个“猜数字”的程序，在这个程序中，电脑会在 1 到 100 之间选一个数字让你猜。程序一直循环，直到你猜对数字为止。

这个程序锻炼了编程语言的几个概念:

  * 变量
  * 输入
  * 输出
  * 条件评估
  * 循环

这是学习一门新编程语言的很好的实践实验。

### 安装 Rust

你可以[使用 Rustup 安装一个 Rust 工具链][2]，或者你可以[在线尝试 Rust][3] 而不在本地安装它。

如果你在本地安装，你应该定期用 `rustup update` 来更新它，以保持你的工具链的新鲜，并使用 `cargo update` 来保持你的库的最新版本。

### Rust 语言版本的猜数字

[Rust][4] 是一门赋予任何人构建可靠和高效的软件能力的语言。你可以通过编写一个 Rust 版本的“猜数字”游戏来探索 Rust。

第一步是编写一个 `Cargo.toml` 文件。你可以使用 `cargo new` 命令生成一个骨架 `Cargo.toml`。这几乎是开始一个 Rust 项目的最佳方式。

```
$ cargo new guess
$ cd guess
$ ls -1
Cargo.toml
src/
```

`Cargo.toml` 文件为你的包命名，并给它一些元数据，最重要的是，指明了它依赖于 `rand` [crate][5]。

```
[package]
name = "guess"
version = "2020.11.0"
authors = ["Moshe Zadka <moshez@opensource.com>"]
edition = "2018"

# See more keys and their definitions at https://doc.rust-lang.org/cargo/reference/manifest.html

[dependencies]
rand = "*"
```

Rust 中的许多东西不是由语言或标准库提供的。取而代之的是，你可以从某个外部 crate 得到它们，这些 crate 可以做许多事情。

程序逻辑在 `src/main.rs` 中：

```
use rand::Rng;
use std::io::BufRead;

fn main() {
    let mut rng = rand::thread_rng();
    let random = rng.gen_range(1..101);
    println!("Guess a number between 1 and 100");
    for line in std::io::stdin().lock().lines() {
        let parsed = line.ok().as_deref().map(str::parse::<i64>);
        if let Some(Ok(guess)) = parsed {
            match guess {
                _ if guess < random => println!("Too low"),
                _ if guess > random => println!("Too high"),
                _ => {
                    println!("That's right");
                    break;
                }
            }
        }
    }
}
```

代码的前两行声明你要做什么。在本例中，`rand::Rng` 生成一个猜测值，而 [trait][7] `std::io::BufRead` 使得可以从标准输入中读取。

Rust 代码的入口在 `main()` 函数中，所以下一步就是定义 `main()`。

要给一个变量赋值，先放 `let`，再放变量的名字，后面放 `=` 号。这样就创建了一个[不可变][8]变量。

Rust 中大多数变量都是不可变的，但是 `rng` 对象必须是可变的（`mut`）。例如，语句 `let random = 0` 给`random` 变量分配一个零值。

函数的第一行创建了一个线程安全的 `Rng` 对象，并将其分配给变量 `rng`。Rust 是建立在线程和内存安全的基础上的，所以你必须在开始写代码时就考虑到这些事情。

程序的下一行读取函数 `gen_range()` 的结果，并将其分配给名为 `random` 的变量。该函数取一个最小值（包含）和一个上界（不包含）。为了也包含上界，你可以用一个等号来标记较大的数字（例如，`1...=100`），或者你也可以像我在代码中做的那样，将上界设置为比你的预期最大值大 1。在这种情况下，该范围是 `1` 到 `100`，使得游戏刚好有足够的挑战性。

中央循环在 `std::io::stdin()` 中迭代行。由于有各种可能导致行不能读取的例外情况，Rust 要求你用一个 `Result` 来包裹一行。有时候可能无法将一行解析为一个整数。

这段代码使用条件模式匹配来忽略所有会导致错误的行：

```
        let parsed = line.ok().as_deref().map(str::parse::<i64>);
        if let Some(Ok(guess)) = parsed {
            // ...
        }
```

第一行创建了一个 `Result<Option<i64>, ...>` 对象，因为它可能在读取或解析步骤中失败。由于下一行只在 `Some(Ok(guess))` 上匹配，每当一行的结果是一个不匹配的值时，它就会跳过 `if` 语句。这是一种强大的忽略错误的方法。

Rust 支持条件表达式和流程控制，比如循环。在“猜数字”游戏中，只要猜中的值不等于 `random`，Rust 就会继续循环。

`if` 语句的主体包含一个 Rust 的 `match` 语句的三向分支。虽然 `match` 最常用于模式匹配，但它也可以检查任意条件。在这种情况下是打印一个适当的信息，如果猜测是正确的，则中断（`break`）循环。

### 示例输出

现在你已经写好了你的 Rust 程序，你可以运行它来玩“猜数字”游戏。每次运行程序时，Rust 都会选择一个不同的随机数，所以继续猜，直到找到正确的数字。

```
$ cargo run
   Compiling guess v2020.11.0 (/Users/mzadka/src/guess)
    Finished dev [unoptimized + debuginfo] target(s) in 0.70s
     Running `target/debug/guess`
Guess a number between 1 and 100
50
Too high
25
Too high
12
Too low
18
Too high
15
Too high
13
Too low
14
That's right
```

典型的做法是用 `cargo run` 来测试程序。最终，你可能会使用 `cargo build` 分成两个独立的步骤[构建一个可执行文件并运行它][9]。

### 学习 Rust

这个“猜数字”游戏是学习一门新的编程语言的一个很好的入门程序，因为它以一种相当直接的方式锻炼了几个常见的编程概念。通过在不同的编程语言中实现这个简单的游戏，你可以展示语言的一些核心概念，并比较它们的细节。

你有喜欢的编程语言吗？你会如何用它来写“猜数字”游戏呢？请关注本系列文章，看看你可能感兴趣的其他编程语言的例子吧！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/learn-rust

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rust_programming_crab_sea.png?itok=2eWLz8A5 (Ferris the crab under the sea, unofficial logo for Rust programming language)
[2]: https://www.rust-lang.org/learn/get-started
[3]: https://play.rust-lang.org/
[4]: https://www.rust-lang.org/
[5]: https://doc.rust-lang.org/book/ch07-01-packages-and-crates.html
[6]: mailto:moshez@opensource.com
[7]: https://doc.rust-lang.org/rust-by-example/trait.html
[8]: https://en.wikipedia.org/wiki/Immutable_object
[9]: https://opensource.com/article/20/3/rust-cargo

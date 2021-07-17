[#]: collector: "lujun9972"
[#]: translator: "mcfd"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13589-1.html"
[#]: subject: "My top 7 keywords in Rust"
[#]: via: "https://opensource.com/article/20/10/keywords-rust"
[#]: author: "Mike Bursell https://opensource.com/users/mikecamel"

我的 7 大 Rust 关键字
======

> 从 Rust 标准库学习一些有用的关键字。

![Rustacean t-shirt][1]

我使用 [Rust][2] 已经有几个月了，写的东西比我预期的要多——尽管随着我的学习，我改进了所写的代码，并完成了一些超出我最初意图的更复杂的任务，相当多的东西已经被扔掉了。

我仍然喜欢它，并认为谈论一些在 Rust 中反复出现的重要关键字可能会有好处。我会提供我个人对它们的作用的总结：为什么你需要考虑如何使用它们，以及任何其他有用的东西，特别是对于刚接触 Rust 的新手或来自另一种语言的人（如 Java；请阅读我的文章 [为什么作为一个 Java 程序员的我喜欢学习 Rust][3]）。

事不宜迟，让我们开始吧。获取更多信息的好地方总是 Rust 官方文档 —— 你可能想从 [std 标准库][4]开始。

  1. `const` – 你可以用 `const` 来声明常量，而且你应该这样做。虽然这不是造火箭，但请一定要用 `const` ，如果你要在不同的模块中使用常量，那请创建一个 `lib.rs` 文件（Rust 默认的），你可以把所有的常量放在一个命名良好的模块中。我曾经在不同模块的不同文件中发生过 `const` 变量名（和值）的冲突，仅仅是因为我太懒了，除了在不同文件中剪切和粘贴之外，我本可以通过创建一个共享模块来节省大量的工作。
  2. `let` – 你并不 _总是_ 需要用 `let` 语句声明一个变量，但当你这样做时你的代码会更加清晰。此外，如果可以，请一定要添加变量类型。Rust 会尽最大努力猜测它应该是什么类型的变量，但它不一定总能在运行时做到这一点（在这种情况下，编译器 [Cargo][5] 会提示你），它甚至可能做不到你期望的那样。在后一种情况下，对于 Cargo 来说，抱怨你所赋值的函数（例如）与声明不一致，总比 Rust 试图帮助你做错事，而你却不得不在其他地方花费大量时间来进行调试要简单。
  3. `match` – `match` 对我来说是新鲜事物，我喜欢使用它。它与其他编程语言中的 `switch` 没有什么不同，但在 Rust 中被广泛使用。它使代码更清晰易读，如果你做了一些愚蠢的事情（例如错过一些可能的情况），Cargo 会很好地提示你。我一般的经验法则是，在管理不同的选项或进行分支时，如果可以使用 `match`，那就请一定要使用它。
  4. `mut` – 在声明一个变量时，如果它的值在声明后会发生变化，那么你需要声明它是可变的（LCTT 译注：Rust 中变量默认是不可变的）。常见的错误是在某个变量 _没有_ 变化的情况下声明它是可变的，这时编译器会警告你。如果你收到了 Cargo 的警告，说一个可变的变量没有被改变，而你认为它被 _改变_ 了，那么你可能要检查该变量的范围，并确保你使用的是正确的那个。
  5. `return` – 实际上我很少使用 `return`，它用于从函数中返回一个值，但是如果你只是在函数的最后一行提供值（或提供返回值的函数），通常会变得更简单，能更清晰地阅读。警告：在很多情况下，你 _会_ 忘记省略这一行末尾的分号（`;`），如果你这样做，编译器会不高兴的。
  6. `unsafe` – 如其意：如果你想做一些不能保证 Rust 内存安全的事情，那么你就需要使用这个关键字。我绝对无意在现在或将来的任何时候宣布我的任何 Rust 代码不安全；Rust 如此友好的原因之一是它阻止了这种黑客行为。如果你真的需要这样做，再想想，再想想，然后重新设计代码。除非你是一个非常低级的系统程序员，否则要 _避免_ 使用 `unsafe`。
  7. `use` – 当你想使用另一个 crate 中的东西时，例如结构体、变量、函数等，那么你需要在你要使用它的代码的代码块的开头声明它。另一个常见的错误是，你这样做了，但没有在 `Cargo.toml` 文件中添加该 crate （最好有一个最小版本号）。

我知道，这不是我写过的最复杂的文章，但这是我在开始学习 Rust 时会欣赏的那种文章。我计划在关键函数和其他 Rust 必知知识方面编写类似的文章：如果你有任何要求，请告诉我！ 

* * *

_本文最初发表于 [Alice, Eve, and Bob][6] 经作者许可转载。_

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/keywords-rust

作者：[Mike Bursell][a]
选题：[lujun9972][b]
译者：[mcfd](https://github.com/mcfd)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mikecamel
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rustacean-tshirt.jpg?itok=u7LBmyaj "Rustacean t-shirt"
[2]: https://www.rust-lang.org/
[3]: https://opensource.com/article/20/5/rust-java
[4]: https://doc.rust-lang.org/std/
[5]: https://doc.rust-lang.org/cargo/
[6]: https://aliceevebob.com/2020/09/01/rust-my-top-7-keywords/

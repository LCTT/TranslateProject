介绍 Fedora 上的 Swift
======

![](https://fedoramagazine.org/wp-content/uploads/2018/09/swift-816x345.jpg)

Swift 是一种使用现代方法构建安全性、性能和软件设计模式的通用编程语言。它旨在成为各种编程项目的最佳语言，从系统编程到桌面应用程序，以及扩展到云服务。继续阅读了解它以及如何在 Fedora 中尝试它。

### 安全、快速、富有表现力

与许多现代编程语言一样，Swift 被设计为比基于 C 的语言更安全。例如，变量总是在使用之前初始化。检查数组和整数是否溢出。内存自动管理。

Swift 将意图放在语法中。要声明变量，请使用 `var` 关键字。要声明常量，请使用 `let`。

Swift 还保证对象永远不会是 `nil`。实际上，尝试使用已知为 `nil` 的对象将导致编译时错误。当使用 `nil` 值时，它支持一种称为 **optional** 的机制。optional 可能包含 `nil`，但使用 `?` 运算符可以安全地解包。

更多的功能包括：

* 与函数指针统一的闭包
* 元组和多个返回值
* 泛型
* 对范围或集合进行快速而简洁的迭代
* 支持方法、扩展和协议的结构体
* 函数式编程模式，例如 `map` 和 `filter`
* 内置强大的错误处理
* 拥有 `do`、`guard`、`defer` 和 `repeat` 关键字的高级控制流


### 尝试 Swift

Swift 在 Fedora 28 中可用，包名为 **swift-lang**。安装完成后，运行 `swift` 并启动 REPL 控制台。

```
$ swift
Welcome to Swift version 4.2 (swift-4.2-RELEASE). Type :help for assistance.
 1> let greeting="Hello world!"
greeting: String = "Hello world!"
 2> print(greeting)
Hello world!
 3> greeting = "Hello universe!"
error: repl.swift:3:10: error: cannot assign to value: 'greeting' is a 'let' constant
greeting = "Hello universe!"
~~~~~~~~ ^


 3>
```

Swift 有一个不断发展的社区，特别的，有一个[工作组][1]致力于使其成为一种高效且有力的服务器端编程语言。请访问其[主页][2]了解更多参与方式。

图片由 [Uillian Vargas][3] 发布在 [Unsplash][4] 上。


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/introducing-swift-fedora/

作者：[Link Dupont][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/linkdupont/
[1]: https://swift.org/server/
[2]: http://swift.org
[3]: https://unsplash.com/photos/7oJpVR1inGk?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://unsplash.com/search/photos/fast?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText

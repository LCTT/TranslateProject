你没听说过的 Go 语言惊人优点
============================================================

![](https://cdn-images-1.medium.com/max/2000/1*NDXd5I87VZG0Z74N7dog0g.png)

来自 [https://github.com/ashleymcnamara/gophers][1] 的图稿

在这篇文章中，我将讨论为什么你需要尝试一下 Go，以及应该从哪里学起。

Golang 是可能是最近几年里你经常听人说起的编程语言。尽管它在 2009 年已经发布，但它最近才开始流行起来。

![](https://cdn-images-1.medium.com/max/2000/1*cQ8QzhCPiFXqk_oQdUk_zw.png)

根据 Google 趋势，Golang 语言非常流行。

这篇文章不会讨论一些你经常看到的 Golang 的主要特性。

相反，我想向您介绍一些相当小众但仍然很重要的功能。在您决定尝试Go后，您才会知道这些功能。

这些都是表面上没有体现出来的惊人特性，但它们可以为您节省数周或数月的工作量。而且这些特性还可以使软件开发更加愉快。

阅读本文不需要任何语言经验，所以不比担心 Golang 对你来说是新的事物。如果你想了解更多，可以看看我在底部列出的一些额外的链接，。

我们将讨论以下主题：

*   GoDoc

*   静态代码分析

*   内置的测试和分析框架

*   竞争条件检测

*   学习曲线

*   反射（Reflection）

*   专制独裁的 Go

*   文化

Please, note that the list doesn’t follow any particular order. It is also opinionated as hell.
请注意，这个列表不遵循任何特定顺序来讨论。

### GoDoc

Golang 非常重视代码中的文档，简洁也是如此。

[GoDoc][4] 是一个静态代码分析工具，可以直接从代码中创建漂亮的文档页面。GoDoc 的一个显着特点是它不使用任何其他的语言，如 JavaDoc，PHPDoc 或 JSDoc 来注释代码中的结构，只需要用英语。

它使用从代码中获取的尽可能多的信息来概述、构造和格式化文档。它有多而全的功能，比如：交叉引用，代码示例以及一个指向版本控制系统仓库的链接。

而你需要做的只有添加一些好的，像 `// MyFunc transforms Foo into Bar` 这样子的注释，而这些注释也会反映在的文档中。你甚至可以添加一些通过网络接口或者在本地可以实际运行的 [代码示例][5]。

GoDoc 是 Go 的唯一文档引擎，供整个社区使用。这意味着用 Go 编写的每个库或应用程序都具有相同的文档格式。从长远来看，它可以帮你在浏览这些文档时节省大量时间。

例如，这是我最近一个小项目的 GoDoc 页面：[pullkee — GoDoc][6]。

### 静态代码分析

Go 严重依赖于静态代码分析。例子包括 godoc 文档，gofmt 代码格式化，golint 代码风格统一，等等。

There are so many of them that there’s even an everything-included-kind-of project called [gometalinter][10] to compose them all into a single utility.

这些工具通常作为独立的命令行应用程序实现，并可轻松与任何编码环境集成。

静态代码分析实际上并不是现代编程的新概念，但是 Go 将其带入了绝对的范畴。我无法估量它为我节省了多少时间。此外，它给你一种安全感，就像有人在你背后支持你一样。

创建自己的分析器非常简单，因为 Go 有专门的内置包来解析和加工 Go 源码。

你可以从这个链接中了解到更多相关内容: [GothamGo Kickoff Meetup: Go Static Analysis Tools by Alan Donovan][11].

### 内置的测试和分析框架

您是否曾尝试为一个从头开始的 Javascript 项目选择测试框架？如果是这样，你可能会明白经历这种分析瘫痪的斗争。您可能也意识到您没有使用其中 80％ 的框架。

一旦您需要进行一些可靠的分析，问题就会重复出现。

Go 附带内置测试工具，旨在简化和提高效率。它为您提供了最简单的 API，并做出最小的假设。您可以将它用于不同类型的测试，分析，甚至可以提供可执行代码示例。

它可以开箱即用地生成持续集成友好的输出，而且它的用法很简单，只需运行 `go test`。当然，它还支持高级功能，如并行运行测试，跳过标记代码，以及其他更多功能。

### Race condition detection

You might already know about Goroutines, which are used in Go to achieve concurrent code execution. If you don’t, [here’s][12] a really brief explanation.

Concurrent programming in complex applications is never easy regardless of the specific technique, partly due to the possibility of race conditions.

Simply put, race conditions happen when several concurrent operations finish in an unpredicted order. It might lead to a huge number of bugs, which are particularly hard to chase down. Ever spent a day debugging an integration test which only worked in about 80% of executions? It probably was a race condition.

All that said, concurrent programming is taken very seriously in Go and, luckily, we have quite a powerful tool to hunt those race conditions down. It is fully integrated into Go’s toolchain.

You can read more about it and learn how to use it here: [Introducing the Go Race Detector — The Go Blog][13].

### Learning curve

You can learn ALL Go’s language features in one evening. I mean it. Of course, there are also the standard library, and the best practices in different, more specific areas. But two hours would totally be enough time to get you confidently writing a simple HTTP server, or a command-line app.

The project has [marvelous documentation][14], and most of the advanced topics have already been covered on their blog: [The Go Programming Language Blog][15].

Go is much easier to bring to your team than Java (and the family), Javascript, Ruby, Python, or even PHP. The environment is easy to setup, and the investment your team needs to make is much smaller before they can complete your first production code.

### Reflection

Code reflection is essentially an ability to sneak under the hood and access different kinds of meta-information about your language constructs, such as variables or functions.

Given that Go is a statically typed language, it’s exposed to a number of various limitations when it comes to more loosely typed abstract programming. Especially compared to languages like Javascript or Python.

Moreover, Go [doesn’t implement a concept called Generics][16] which makes it even more challenging to work with multiple types in an abstract way. Nevertheless, many people think it’s actually beneficial for the language because of the amount of complexity Generics bring along. And I totally agree.

According to Go’s philosophy (which is a separate topic itself), you should try hard to not over-engineer your solutions. And this also applies to dynamically-typed programming. Stick to static types as much as possible, and use interfaces when you know exactly what sort of types you’re dealing with. Interfaces are very powerful and ubiquitous in Go.

However, there are still cases in which you can’t possibly know what sort of data you are facing. A great example is JSON. You convert all the kinds of data back and forth in your applications. Strings, buffers, all sorts of numbers, nested structs and more.

In order to pull that off, you need a tool to examine all the data in runtime that acts differently depending on its type and structure. Reflection to rescue! Go has a first-class [reflect][17] package to enable your code to be as dynamic as it would be in a language like Javascript.

An important caveat is to know what price you pay for using it — and only use it when there is no simpler way.

You can read more about it here: [The Laws of Reflection — The Go Blog][18].

You can also read some real code from the JSON package sources here: [src/encoding/json/encode.go — Source Code][19]

### Opinionatedness

Is there such a word, by the way?

Coming from the Javascript world, one of the most daunting processes I faced was deciding which conventions and tools I needed to use. How should I style my code? What testing library should I use? How should I go about structure? What programming paradigms and approaches should I rely on?

Which sometimes basically got me stuck. I was doing this instead of writing the code and satisfying the users.

To begin with, I should note that I totally get where those conventions should come from. It’s always you and your team. Anyway, even a group of experienced Javascript developers can easily find themselves having most of the experience with entirely different tools and paradigms to achieve kind of the same results.

This makes the analysis paralysis cloud explode over the whole team, and also makes it harder for the individuals to integrate with each other.

Well, Go is different. You have only one style guide that everyone follows. You have only one testing framework which is built into the basic toolchain. You have a lot of strong opinions on how to structure and maintain your code. How to pick names. What structuring patterns to follow. How to do concurrency better.

While this might seem too restrictive, it saves tons of time for you and your team. Being somewhat limited is actually a great thing when you are coding. It gives you a more straightforward way to go when architecting new code, and makes it easier to reason about the existing one.

As a result, most of the Go projects look pretty alike code-wise.

### Culture

People say that every time you learn a new spoken language, you also soak in some part of the culture of the people who speak that language. Thus, the more languages you learn, more personal changes you might experience.

It’s the same with programming languages. Regardless of how you are going to apply a new programming language in the future, it always gives you a new perspective on programming in general, or on some specific techniques.

Be it functional programming, pattern matching, or prototypal inheritance. Once you’ve learned it, you carry these approaches with you which broadens the problem-solving toolset that you have as a software developer. It also changes the way you see high-quality programming in general.

And Go is a terrific investment here. The main pillar of Go’s culture is keeping simple, down-to-earth code without creating many redundant abstractions and putting the maintainability at the top. It’s also a part of the culture to spend the most time actually working on the codebase, instead of tinkering with the tools and the environment. Or choosing between different variations of those.

Go is also all about “there should be only one way of doing a thing.”

A little side note. It’s also partially true that Go usually gets in your way when you need to build relatively complex abstractions. Well, I’d say that’s the tradeoff for its simplicity.

If you really need to write a lot of abstract code with complex relationships, you’d be better off using languages like Java or Python. However, even when it’s not obvious, it’s very rarely the case.

Always use the best tool for the job!

### Conclusion

You might have heard of Go before. Or maybe it’s something that has been staying out of your radar for a while. Either way, chances are, Go can be a very decent choice for you or your team when starting a new project or improving the existing one.

This is not a complete list of all the amazing things about Go. Just the undervalued ones.

Please, give Go a try with [A Tour of Go][20] which is an incredible place to start.

If you wish to learn more about Go’s benefits, you can check out these links:

*   [Why should you learn Go? — Keval Patel — Medium][2]

*   [Farewell Node.js — TJ Holowaychuk — Medium][3]

Share your observations down in the comments!

Even if you are not specifically looking for a new language to use, it’s worth it to spend an hour or two getting the feel of it. And maybe it can become quite useful for you in the future.

Always be looking for the best tools for your craft!

* * *

If you like this article, please consider following me for more, and clicking on those funny green little hands right below this text for sharing. 👏👏👏

Check out my [Github][21] and follow me on [Twitter][22]!

--------------------------------------------------------------------------------

作者简介：

Software Engineer and Traveler. Coding for fun. Javascript enthusiast. Tinkering with Golang. A lot into SOA and Docker. Architect at Velvica.

------------


via: https://medium.freecodecamp.org/here-are-some-amazing-advantages-of-go-that-you-dont-hear-much-about-1af99de3b23a

作者：[Kirill Rogovoy][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:
[1]:https://github.com/ashleymcnamara/gophers
[2]:https://medium.com/@kevalpatel2106/why-should-you-learn-go-f607681fad65
[3]:https://medium.com/@tjholowaychuk/farewell-node-js-4ba9e7f3e52b
[4]:https://godoc.org/
[5]:https://blog.golang.org/examples
[6]:https://godoc.org/github.com/kirillrogovoy/pullkee
[7]:https://godoc.org/
[8]:https://golang.org/cmd/gofmt/
[9]:https://github.com/golang/lint
[10]:https://github.com/alecthomas/gometalinter#supported-linters
[11]:https://vimeo.com/114736889
[12]:https://gobyexample.com/goroutines
[13]:https://blog.golang.org/race-detector
[14]:https://golang.org/doc/
[15]:https://blog.golang.org/
[16]:https://golang.org/doc/faq#generics
[17]:https://golang.org/pkg/reflect/
[18]:https://blog.golang.org/laws-of-reflection
[19]:https://golang.org/src/encoding/json/encode.go
[20]:https://tour.golang.org/
[21]:https://github.com/kirillrogovoy/
[22]:https://twitter.com/krogovoy

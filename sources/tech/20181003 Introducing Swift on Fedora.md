translating---geekpi

Introducing Swift on Fedora
======

![](https://fedoramagazine.org/wp-content/uploads/2018/09/swift-816x345.jpg)

Swift is a general-purpose programming language built using a modern approach to safety, performance, and software design patterns. It aims to be the best language for a variety of programming projects, ranging from systems programming to desktop applications and scaling up to cloud services. Read more about it and how to try it out in Fedora.

### Safe, Fast, Expressive

Like many modern programming languages, Swift was designed to be safer than C-based languages. For example, variables are always initialized before they can be used. Arrays and integers are checked for overflow. Memory is automatically managed.

Swift puts intent right in the syntax. To declare a variable, use the var keyword. To declare a constant, use let.

Swift also guarantees that objects can never be nil; in fact, trying to use an object known to be nil will cause a compile-time error. When using a nil value is appropriate, it supports a mechanism called **optionals**. An optional may contain nil, but is safely unwrapped using the **?** operator.

Some additional features include:

  * Closures unified with function pointers
  * Tuples and multiple return values
  * Generics
  * Fast and concise iteration over a range or collection
  * Structs that support methods, extensions, and protocols
  * Functional programming patterns, e.g., map and filter
  * Powerful error handling built-in
  * Advanced control flow with do, guard, defer, and repeat keywords



### Try Swift out

Swift is available in Fedora 28 under then package name **swift-lang**. Once installed, run swift and the REPL console starts up.

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

Swift has a growing community, and in particular, a [work group][1] dedicated to making it an efficient and effective server-side programming language. Be sure to visit [its home page][2] for more ways to get involved.

Photo by [Uillian Vargas][3] on [Unsplash][4].


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/introducing-swift-fedora/

作者：[Link Dupont][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/linkdupont/
[1]: https://swift.org/server/
[2]: http://swift.org
[3]: https://unsplash.com/photos/7oJpVR1inGk?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://unsplash.com/search/photos/fast?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText

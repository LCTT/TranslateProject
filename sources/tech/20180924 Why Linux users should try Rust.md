Why Linux users should try Rust
======

![](https://images.idgesg.net/images/article/2018/09/rust-rusted-metal-100773678-large.jpg)

Rust is a fairly young and modern programming language with a lot of features that make it incredibly flexible and very secure. It's also becoming quite popular, having won first place for the "most loved programming language" in the Stack Overflow Developer Survey three years in a row — [2016][1], [2017][2], and [2018][3].

Rust is also an _open-source_ language with a suite of special features that allow it to be adapted to many different programming projects. It grew out of what was a personal project of a Mozilla employee back in 2006, was picked up as a special project by Mozilla a few years later (2009), and then announced for public use in 2010.

Rust programs run incredibly fast, prevent segfaults, and guarantee thread safety. These attributes make the language tremendously appealing to developers focused on application security. Rust is also a very readable language and one that can be used for anything from simple programs to very large and complex projects.

Rust is:

  * Memory safe — Rust will not suffer from dangling pointers, buffer overflows, or other memory-related errors. And it provides memory safety without garbage collection.
  * General purpose — Rust is an appropriate language for any type of programming
  * Fast — Rust is comparable in performance to C/C++ but with far better security features.
  * Efficient — Rust is built to facilitate concurrent programming.
  * Project-oriented — Rust has a built-in dependency and build management system called Cargo.
  * Well supported — Rust has an impressive [support community][4].



Rust also enforces RAII (Resource Acquisition Is Initialization). That means when an object goes out of scope, its destructor will be called and its resources will be freed, providing a shield against resource leaks. It provides functional abstractions and a great [type system][5] together with speed and mathematical soundness.

In short, Rust is an impressive systems programming language with features that other most languages lack, making it a serious contender for languages like C, C++ and Objective-C that have been used for years.

### Installing Rust

Installing Rust is a fairly simple process.

```
$ curl https://sh.rustup.rs -sSf | sh
```

Once Rust in installed, calling rustc with the **\--version** argument or using the **which** command displays version information.

```
$ which rustc
rustc 1.27.2 (58cc626de 2018-07-18)
$ rustc --version
rustc 1.27.2 (58cc626de 2018-07-18)
```

### Getting started with Rust

The simplest code example is not all that different from what you'd enter if you were using one of many scripting languages.

```
$ cat hello.rs
fn main() {
 // Print a greeting
 println!("Hello, world!");
}
```

In these lines, we are setting up a function (main), adding a comment describing the function, and using a println statement to create output. You could compile and then run a program like this using the command shown below.

```
$ rustc hello.rs
$ ./hello
Hello, world!
```

Alternately, you might create a "project" (generally used only for more complex programs than this one!) to keep your code organized.

```
$ mkdir ~/projects
$ cd ~/projects
$ mkdir hello_world
$ cd hello_world
```

Notice that even a simple program, once compiled, becomes a fairly large executable.

```
$ ./hello
Hello, world!
$ ls -l hello*
-rwxrwxr-x 1 shs shs 5486784 Sep 23 19:02 hello     <== executable
-rw-rw-r-- 1 shs shs 68 Sep 23 15:25 hello.rs
```

And, of course, that's just a start — the traditional "Hello, world!" program. The Rust language has a suite of features to get you moving quickly to advanced levels of programming skill.

### Learning Rust

![rust programming language book cover][6]
No Starch Press

The Rust Programming Language book by Steve Klabnik and Carol Nichols (2018) provides one of the best ways to learn Rust. Written by two members of the core development team, this book is available in print from [No Starch Press][7] or in ebook format at [rust-lang.org][8]. It has earned its reference as "the book" among the Rust developer community.

Among the many topics covered, you will learn about these advanced topics:

  * Ownership and borrowing
  * Safety guarantees
  * Testing and error handling
  * Smart pointers and multi-threading
  * Advanced pattern matching
  * Using Cargo (the built-in package manager)
  * Using Rust's advanced compiler



#### Table of Contents

The table of contents is shown below.

```
Foreword by Nicholas Matsakis and Aaron Turon
Acknowledgements
Introduction
Chapter 1: Getting Started
Chapter 2: Guessing Game
Chapter 3: Common Programming Concepts
Chapter 4: Understanding Ownership
Chapter 5: Structs
Chapter 6: Enums and Pattern Matching
Chapter 7: Modules
Chapter 8: Common Collections
Chapter 9: Error Handling
Chapter 10: Generic Types, Traits, and Lifetimes
Chapter 11: Testing
Chapter 12: An Input/Output Project
Chapter 13: Iterators and Closures
Chapter 14: More About Cargo and Crates.io
Chapter 15: Smart Pointers
Chapter 16: Concurrency
Chapter 17: Is Rust Object Oriented?
Chapter 18: Patterns
Chapter 19: More About Lifetimes
Chapter 20: Advanced Type System Features
Appendix A: Keywords
Appendix B: Operators and Symbols
Appendix C: Derivable Traits
Appendix D: Macros
Index

```

[The Rust Programming Language][7] takes you from basic installation and language syntax to complex topics, such as modules, error handling, crates (synonymous with a ‘library’ or ‘package’ in other languages), modules (allowing you to partition your code within the crate itself), lifetimes, etc.

Probably the most important thing to say is that the book can move you from basic programming skills to building and compiling complex, secure and very useful programs.

### Wrap-up

If you're ready to get into some serious programming with a language that's well worth the time and effort to study and becoming increasingly popular, Rust is a good bet!

Join the Network World communities on [Facebook][9] and [LinkedIn][10] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3308162/linux/why-you-should-try-rust.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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

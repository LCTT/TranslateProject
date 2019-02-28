[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Which programming languages should you learn?)
[#]: via: (https://opensource.com/article/19/2/which-programming-languages-should-you-learn)
[#]: author: (Marty Kalin https://opensource.com/users/mkalindepauledu)

Which programming languages should you learn?
======
Learning a new programming language is a great way to get ahead in your career. But which one?
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/search_find_code_issue_bug_programming.png?itok=XPrh7fa0)

If you want to get started or get ahead in your programming career, learning a new language is a smart idea. But the huge number of languages in active use invites the question: Which programming language is the best one to know? To answer that, let's start with a simplifying question: What sort of programming do you want to do?

If you want to do web programming on the client side, then the specialized languages HTML, CSS, and JavaScript—in one of its seemingly infinite dialects—are de rigueur.

If you want to do web programming on the server side, the options include all of the familiar general-purpose languages: C++, Golang, Java, C#, Node.js, Perl, Python, Ruby, and so on. As a matter of course, server-side programs interact with datastores, such as relational and other databases, which means query languages such as SQL may come into play.

If you're writing native apps for mobile devices, knowing the target platform is important. For Apple devices, Swift has supplanted Objective C as the language of choice. For Android devices, Java (with dedicated libraries and toolsets) remains the dominant language. There are special languages such as Xamarin, used with C#, that can generate platform-specific code for Apple, Android, and Windows devices.

What about general-purpose languages? There are various choices within the usual pigeonholes. Among the dynamic or scripting languages (e.g., Perl, Python, and Ruby), there are newer offerings such as Node.js. Java and C#, which are more alike than their fans like to admit, remain the dominant statically compiled languages targeted at a virtual machine (the JVM and CLR, respectively). Among languages that compile into native executables, C++ is still in the mix, along with later arrivals such as Golang and Rust. General-purpose functional languages abound (e.g., Clojure, Haskell, Erlang, F#, Lisp, and Scala), often with passionately devoted communities. It's worth noting that object-oriented languages such as Java and C# have added functional constructs (in particular, lambdas), and the dynamic languages have had functional constructs from the start.

Let me end with a pitch for C, which is a small, elegant, and extensible language not to be confused with C++. Modern operating systems are written mostly in C, with the rest in assembly language. The standard libraries on any platform are likewise mostly in C. For example, any program that issues the Hello, world! greeting does so through a call to the C library function named **write**.

C serves as a portable assembly language, exposing details about the underlying system that other high-level languages deliberately hide. To understand C is thus to gain a better grasp of how programs contend for the shared system resources (processors, memory, and I/O devices) required for execution. C is at once high-level and close-to-the-metal, so unrivaled in performance—except, of course, for assembly language. Finally, C is the lingua franca among programming languages, and almost every general-purpose language supports C calls in one form or another.

For a modern introduction to C, consider my book [C Programming: Introducing Portable Assembler][1]. No matter how you go about it, learn C and you'll learn a lot more than just another programming language.

What programming languages do you think are important to know? Do you agree or disagree with these recommendations? Let us know in the comments!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/which-programming-languages-should-you-learn

作者：[Marty Kalin][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mkalindepauledu
[b]: https://github.com/lujun9972
[1]: https://www.amazon.com/dp/1977056954?ref_=pe_870760_150889320

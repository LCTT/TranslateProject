[#]: subject: "5 Ways To Prevent Open Source Licensing Violations"
[#]: via: "https://www.opensourceforu.com/2022/08/5-ways-to-prevent-open-source-licensing-violations/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

5 Ways To Prevent Open Source Licensing Violations
======
Developers can save time and avoid having to reinvent the wheel by integrating open source software into their codebases. However, it also carries a significant danger of infringement on licences. You must adhere to whatever of the many open source licences that apply to reused open source code. If you don’t, you (or the company you work for) run the danger of being sued for breaking the terms of the open source licences. Even if these lawsuits are not widespread, they do occur. In fact, given that many open source projects are now run by businesses keen to protect their investment in open source communities, they may occur more frequently in the future.

1. Become familiar with open source licencing

Understanding open source licences is the single most crucial step in preventing concerns with open source licencing infringement. It’s simple to think that all open source licences impose the same conditions or that they all essentially call for the continued availability of the source code. In fact, there are dozens upon dozens of different open source licences, and they all have quite different terms. It’s a grave error to believe that simply because you get code from an open source project, you can use it whatever you like as long as you maintain the source code accessible. One typical — yet frequently missed — condition of several open source licences can be the necessity to provide credit to the original authors.

1. Record Your Use of Open Source

Creating a standardised method for documenting when you use open source code is a second excellent practise. Importing a module or pasting code from GitHub is simple enough. But if you don’t keep track of where that code comes from or under what licence, you can forget how and where you’re integrating open source into your codebase. Additionally, it becomes more difficult to demonstrate that you complied with the licencing conditions in effect when you borrowed the code, which could be problematic if the open source licence in force changes. Consider adding a page to your documentation wiki (if you have one) that lists the open source code you used to avoid this problem. Whenever you include open source components or dependencies, you should at the very least add comments inside your own source code.

1. Steer clear of unauthorised open source components

There are occasions when you may stumble across a hidden GitHub repository or other source code hosting location that has code you wish to use but doesn’t mention any licence guidelines. You could be tempted to believe that the creators of the code want it to be open source and that you can use it whatever you like. But that’s a perilous supposition. It’s possible that the developers will subsequently set specific licence conditions on the code and require you to abide by them, which could result in claims of licencing infringement in the future. Avoid using obscure code that lacks clear licencing restrictions unless you have a very solid reason to do so.

1. Create Open Source Code of Your Own

Making your own software totally open source is one method to reduce some of the risks associated with open source licencing. This implies that you’ll automatically adhere to any open source licencing conditions that call for the preservation of derivative source code. However, keep in mind that merely opening up your own code doesn’t ensure complete licencing compliance. You’ll still need to put in some effort to make sure you abide by the rules of each licence because the licences that apply to the code you borrowed may not be the same as the open source licence you select. However, you won’t have to worry about any clauses pertaining to source code sharing.

1. Detect Open Source Components Automatically

Although it’s great practise to manually track where and how you utilise open source inside your codebase, you can lower the likelihood of mistakes by employing software that identifies open source components and dependencies automatically. Here, we should think about two different kinds of tools. One of these is Source Composition Analysis, or SCA, software that automatically scans source code and identifies elements that were taken from trusted outside sources. The other is software supply chain management solutions, which support finding and monitoring any open source dependencies present in your application stack in addition to other things.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/08/5-ways-to-prevent-open-source-licensing-violations/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed

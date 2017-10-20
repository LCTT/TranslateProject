如何跟 NASA 顶级程序员一样编程—10 条重要原则
===

**[![rules of coding nasa](http://upload-images.jianshu.io/upload_images/2489863-791757ae6bd313e6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)][1] 引言:** 你知道 NASA 顶级程序员如何编写重要任务代码么？为了确保代码更清楚、更安全、且更容易理解，NASA  的喷气推进实验室制定了 10 条编码规则。
  
  

NASA 的开发者是编程界最有挑战性的工作之一。他们编写代码并将开发安全的关键任务应用程序作为其主要关注点。

在这种情形下，遵守一些重要的编码规则是重要的。这些规则覆盖软件开发的多个方面，例如软件应该被如何编码、哪些语言特性应该被使用等。

尽管很难就一个好的编码标准达成共识，NASA　的喷气推进实验室（JPL）遵守一个[编码规则][2]，其名为“The Power of Ten–Rules for Developing Safety Critical Code”。

由于 JPL 长期使用 C 语言，这个规则主要是针对于 C 程序语言编写。但是这些规则也可以很容地应用到其它的程序语言。

该规则由 JPL 的首席科学家 Gerard J. Holzmann 制定，这些严格的编码规则主要是聚焦于安全。

![][3]

NASA 的 10 条编写关键任务代码的规则：
1. 限制所有代码为极为简单的控制流结构—不用 `goto` 语句、`setjmp` 或 `longjmp` 结构，不用间接或直接的递归调用。

2. 所有循环必须有一个固定的上限值。该预置迭代上限值必须是能够非常可能被某个检测工具静态证明。如果该上限值不能静态证明，那么可以认为违背该原则。

3. 在初始化后不要使用动态内存分配。

4. 任何函数都不能比在一张纸上可打印的长度更长，在一个标准的参考格式中，一个语句一行，一个声明一行。通常地，这意味着一个函数的代码行不能超过 60。

5. 代码中断言的密度平均最少应该达到每个函数 2 个断言以上。断言被用于检测那些在真实生命周期中不可能发生的条件。断言必须总是没有副作用并应该定义为布尔测试。当一个断言失败时，一个明确的回复动作应该被执行，例如，返回一个错误条件到执行断言失败的函数调用者。对于静态工具来说，任何断言证明其从不失败或从不违反该规则（例如，通过增加 `assert(true)` 语句是不可能满足这个规则的）。

6. 必须在最小的范围内声明数据对象。

7. 每个调用函数必须检查非 void 函数的返回值，且在每个函数内其参数的有效性必须进行检查。

8. 预处理器的使用必须被限制在头文件包含和简单的宏定义。符号拼接、可变参数列表（省略号）和递归宏调用都是不允许的。所有的宏必须能够扩展为完整的语法单元。条件编译指令的使用通常是晦涩的，但也不总是能够避免。这意味着即使在一个大的软件开发中有一两个条件编译指令是正常的，推荐使用避免多次包含头文件的标准引用模板。上述每一种情况都应该用一个基本检查工具标记，并在代码中正当使用。

9. 应该限制指针的使用。特别地，不允许超过一级的解除指针引用。解除指针引用操作不可以隐含在宏定义或类型声明中。函数指针是不允许的。

10. 从开发的第一天起，必须在编译器开启最高级别告警选项的条件下，对代码进行编译。在此设置之下，代码必须零告警编译通过。代码必须每天至少进行一次检查，且更推荐一次以上。利用最先进的源代码静态分析工具对代码进行分析，且零告警通过。

关于这些规则，NASA 要求注意：

这些规则就像汽车中的安全带一样，刚开始你可能感到有一点不适，但是一段时间后就会养成习惯并且不使用它对你来说变得不可想象。

[来源][4]

此文是否对你有帮助？不要忘了在下面的评论区写下你的反馈。

---
作者简介：
Adarsh Verma 是 Fossbytes 的共同创始人，他是一个令人尊敬的企业家，他一直对开源、技术突破和完全保持密切关注。可以通过邮件联系他  — [adarsh.verma@fossbytes.com](mailto:adarsh.verma@fossbytes.com)

------------------

via: https://fossbytes.com/nasa-coding-programming-rules-critical/

作者：[Adarsh Verma ][a]
译者：[penghuster](https://github.com/penghuster)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fossbytes.com/author/adarsh/
[1]:http://fossbytes.com/wp-content/uploads/2016/06/rules-of-coding-nasa.jpg
[2]:http://pixelscommander.com/wp-content/uploads/2014/12/P10.pdf
[3]:https://fossbytes.com/wp-content/uploads/2016/12/learn-to-code-banner-ad-content-1.png
[4]:http://pixelscommander.com/wp-content/uploads/2014/12/P10.pdf

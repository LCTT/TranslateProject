红宝石（Ruby）史话
======

尽管我很难说清楚为什么，但 Ruby 一直是我最喜爱的一门编程语言。如果用音乐来类比的话，Python 给我的感觉像是<ruby>朋克摇滚<rt>punk rock</rt></ruby>，简单、直接，但略显单调，而 Ruby 则像是爵士乐，从根本上赋予了程序员表达自我的自由，虽然这可能会让代码变复杂，编写出来的程序对其他人来说不直观。

Ruby 社区一直将<ruby>灵活表达<rt>freedom of expression</rt></ruby>视为其核心价值。可我不认同这对于 Ruby 的开发和普及是最重要的。创建一门编程语言也许是为了更高的性能，也许是为了在抽象上节省更多的时间，可 Ruby 就有趣在它并不关心这些，从它诞生之初，它的目标就是让程序员更快乐。

### 松本·行弘

<ruby>松本·行弘<rt>Yukihiro Matsumoto</rt></ruby>，亦称为 “Matz”，于 1990 年毕业于筑波大学。筑波是东京东北方向上的一个小城市，是科学研究与技术开发的中心之一。筑波大学以其 STEM 计划广为流传。松本·行弘在筑波大学的信息科学专业学习过，且专攻编程语言。他也在 Ikuo Nakata 的编程语言实验室工作过。（LCTT 译注：STEM 是<ruby>科学<rt>Science</rt></ruby>、<ruby>技术<rt>Technology</rt></ruby>、<ruby>工程<rt>Engineering</rt></ruby>、<ruby>数学<rt>Mathematics</rt></ruby>四门学科英文首字母的缩写。）

松本从 1993 年开始制作 Ruby，那时他才刚毕业几年。他制作 Ruby 的起因是觉得那时的脚本语言缺乏一些特性。他在使用 Perl 的时候觉得这门语言过于“玩具”，此外 Python 也有点弱，用他自己的话说：

> 我那时就知道 Python 了，但我不喜欢它，因为我认为它不是一门真正的面向对象的语言。面向对象就像是 Python 的一个附件。作为一个编程语言狂热者，我在 15 年里一直是面向对象的忠实粉丝。我真的想要一门生来就面向对象而且易用的脚本语言。我为此特地寻找过，可事实并不如愿。[^1]

所以一种解释松本创造 Ruby 的动机就是他想要创造一门更好，且面向对象的 Perl。

但在其他场合，松本说他创造 Ruby 主要是为了让他自己和别人更快乐。2008 年，松本在谷歌技术讲座结束时放映了这张幻灯片：

![][1]

他对听众说到，

> 我希望 Ruby 能帮助世界上的每一个程序员更有效率地工作，享受编程并感到快乐。这也是制作 Ruby 语言的主要意图。[^2]

松本开玩笑的说他制作 Ruby 的原因很自私，因为他觉得其它的语言乏味，所以需要创造一点让自己开心的东西。

这张幻灯片展现了松本谦虚的一面。其实，松本是一位摩门教践行者，因此我很好奇他传奇般的友善有多少归功于他的宗教信仰。无论如何，他的友善在 Ruby 社区广为流传，甚至有一条称为 MINASWAN 的原则，即“<ruby>松本人很好，我们也一样<rt>Matz Is Nice And So We Are Nice</rt></ruby>”。我想那张幻灯片一定震惊了来自 Google 的观众。我想谷歌技术讲座上的每张幻灯片都充满着代码和运行效率的指标，来说明一个方案比另一个更快更有效，可仅仅放映崇高的目标的幻灯片却寥寥无几。

Ruby 主要受到 Perl 的影响。Perl 则是由 Larry Wall 于 20 世纪 80 年代晚期创造的语言，主要用于处理和转换基于文本的数据。Perl 因其文本处理和正则表达式而闻名于世。对于 Ruby 程序员，Perl 程序中的很多语法元素都不陌生，例如符号 `$`、符号 `@`、`elsif` 等等。虽然我觉得，这些不是 Ruby 应该具有的特征。除了这些符号外，Ruby 还借鉴了 Perl 中的正则表达式的处理和标准库。

但影响了 Ruby 的不仅仅只有 Perl 。在 Ruby 之前，松本制作过一个仅用 Emacs Lisp 编写的邮件客户端。这一经历让他对 Emacs 和 Lisp 语言运行的内部原理有了更多的认识。松本说 Ruby 底层的对象模型也受其启发。在那之上，松本添加了一个 Smalltalk 风格的信息传递系统，这一系统随后成为了 Ruby 中任何依赖 `#method_missing` 的操作的基石。松本也表示过 Ada 和 Eiffel 也影响了 Ruby 的设计。

当时间来到了给这门新语言命名的时候，松本和他的同事 Keiju Ishitsuka 挑选了很多个名字。他们希望名字能够体现新语言和 Perl、shell 脚本间的联系。在[这一段非常值得一读的即时消息记录][2]中，Ishitsuka 和 松本也许花了太多的时间来思考 <ruby>shell<rt>贝壳</rt></ruby>、<ruby>clam<rt>蛤蛎</rt></ruby>、<ruby>oyster<rt>牡蛎</rt></ruby>和<ruby>pearl<rt>珍珠</rt></ruby>之间的关系了，以至于差点把 Ruby 命名为“<ruby>Coral<rt>珊瑚虫</rt></ruby>”或“<ruby>Bisque<rt>贝类浓汤</rt></ruby>”。幸好，他们决定使用 Ruby，因为它就像 pearl 一样，是一种珍贵的宝石。此外，<ruby>Ruby<rt>红宝石</rt></ruby> 还是 7 月的生辰石，而 <ruby>Pearl<rt>珍珠</rt></ruby> 则是 6 月的生辰石，采用了类似 C++ 和 C# 的隐喻，暗示着她们是改进自前辈的编程语言。（LCTT 译注：Perl 和 Pearl 发音相同，所以也常以“珍珠”来借喻 Perl；shell 是操作系统提供的用户界面，这里指的是命令行界面；更多有关生辰石的[信息](https://zh.wikipedia.org/zh-hans/%E8%AA%95%E7%94%9F%E7%9F%B3)。）

### Ruby 西渐

Ruby 在日本的普及很快。1995 年 Ruby 刚刚发布后不久后，松本就被一家名为 Netlab 的日本软件咨询财团（全名 Network Applied Communication Laboratory）雇用，并全职为 Ruby 工作。到 2000 年时，在 Ruby 发布仅仅 5 年后，Ruby 在日本的流行度就超过了 Python。可这时的 Ruby 才刚刚进入英语国家。虽然从 Ruby 的诞生之初就存在讨论它的日语邮件列表，但是英语的邮件列表直到 1998 年才建立起来。起初，在英语的邮件列表中交流的大多是日本的 Ruby 狂热者，可随着 Ruby 在西方的逐渐普及而得以改变。

在 2000 年，Dave Thomas 出版了第一本涵盖 Ruby 的英文书籍《Programming Ruby》。因为它的封面上画着一把锄头，所以这本书也被称为锄头书。这是第一次向身处西方的程序员们介绍了 Ruby。就像在日本那样，Ruby 的普及很快，到 2002 年时，英语的 Ruby 邮件列表的通信量就超过了日语邮件列表。

时间来到了 2005 年，Ruby 更流行了，但它仍然不是主流的编程语言。然而，Ruby on Rails 的发布让一切都不一样了。Ruby on Rails 是 Ruby 的“杀手级应用”，没有别的什么项目能比它更推动 Ruby 的普及了。在 Ruby on Rails 发布后，人们对 Ruby 的兴趣爆发式的增长，看看 TIOBE 监测的语言排行：

![][3]

有时人们开玩笑的说，Ruby 程序全是基于 Ruby-on-Rails 的网站。虽然这听起来就像是 Ruby on Rails 占领了整个 Ruby 社区，但在一定程度上，这是事实。因为编写 Rails 应用时使用的语言正是 Ruby。Rails 欠 Ruby 的和 Ruby 欠 Rails 的一样多。

Ruby 的设计哲学也深深地影响了 Rails 的设计与开发。Rails 之父 David Heinemeier Hansson 常常提起他第一次与 Ruby 的接触的情形，那简直就是一次传教。他说，那种经历简直太有感召力了，让他感受到要为松本的杰作（指 Ruby）“传教”的使命。[^3] 对于 Hansson 来说，Ruby 的灵活性简直就是对 Python 或 Java 语言中自上而下的设计哲学的反抗。他很欣赏 Ruby 这门能够信任自己的语言，Ruby 赋予了他自由选择<ruby>程序表达方式<rt>express his programs</rt></ruby>的权力。

就像松本那样，Hansson 声称他创造 Rails 时因为对现状的不满并想让自己能更开心。他也认同让程序员更快乐高于一切的观点，所以检验 Rails 是否需要添加一项新特性的标准是“<ruby>更灿烂的笑容标准<rt>The Principle of The Bigger Smile</rt></ruby>”。什么功能能让 Hansson 更开心就给 Rails 添加什么。因此，Rails 中包括了很多非正统的功能，例如 “Inflector” 类和 `Time` 扩展（“Inflector”类试图将单个类的名字映射到多个数据库表的名字；`Time` 扩展允许程序员使用 `2.days.ago` 这样的表达式）。可能会有人觉得这些功能太奇怪了，但 Rails 的成功表明它的确能让很多人的生活得更快乐。

因此，虽然 Rails 的火热带动了 Ruby 的普及看起来是一个偶然，但事实上 Rails 体现了 Ruby 的很多核心准则。此外，很难看到使用其他语言开发的 Rails，正是因为 Rails 的实现依赖于 Ruby 中<ruby>类似于宏的类方法调用<rt>macro-like class method calls</rt></ruby>来实现模型关联这样的功能。一些人认为这么多的 Ruby 开发需要基于 Ruby on Rails 是 Ruby 生态不健康的表现，但 Ruby 和 Ruby on Rails 结合的如此紧密并不是没有道理的。

### Ruby 之未来  

人们似乎对 Ruby（及 Ruby on Rails）是否正在消亡有着异常的兴趣。早在 2011 年，Stack Overflow 和 Quora 上就充斥着程序员在咨询“如果几年后不再使用 Ruby 那么现在是否有必要学它”的话题。这些担忧对 Ruby 并非没有道理，根据 TIOBE 指数和 Stack Overflow 趋势，Ruby 和 Ruby on Rails 的人气一直在萎缩，虽然它也曾是热门新事物，但在更新更热的框架面前它已经黯然失色。

一种解释这种趋势的理论是程序员们正在舍弃动态类型的语言转而选择静态类型的。TIOBE 指数的趋势中可以看出对软件质量的需求在上升，这意味着出现在运行时的异常变得难以接受。他们引用 TypeScript 来说明这一趋势，TypeScript 是 JavaScript 的全新版本，而创造它的目的正是为了保证客户端运行的代码能受益于编译所提供的安全保障。

我认为另一个更可能的原因是比起 Ruby on Rails 推出的时候，现在存在着更多有竞争力的框架。2005 年它刚刚发布的时候，还没有那么多用于创建 Web 程序的框架，其主要的替代者还是 Java。可在今天，你可以使用为 Go、Javascript 或者 Python 开发的各种优秀的框架，而这还仅仅是主流的选择。Web 的世界似乎正走向更加分布式的结构，与其使用一块代码来完成从数据库读取到页面渲染所有事务，不如将事务拆分到多个组件，其中每个组件专注于一项事务并将其做到最好。在这种趋势下，Rails 相较于那些专攻于 JavaScript 前端通信的 JSON API 就显得过于宽泛和臃肿。

总而言之，我们有理由对 Ruby 的未来持乐观态度。因为不管是 Ruby 还是 Rails 的开发都还很活跃。松本和其他的贡献者们都在努力开发 Ruby 的第三个主要版本。新的版本将比现在的版本快上 3 倍，以减轻制约着 Ruby 发展的性能问题。虽然从 2005 年起，越来越多的 Web 框架被开发出来，但这并不意味着 Ruby on Rails 就失去了其生存空间。Rails 是一个富有大量功能的成熟的工具，对于一些特定类型的应用开发一直是非常好的选择。

但就算 Ruby 和 Rails 走上了消亡的道路，Ruby 让程序员更快乐的信条一定会存活下来。Ruby 已经深远的影响了许多新的编程语言的设计，这些语言的设计中能够看到来自 Ruby 的很多理念。而其他的新生语言则试着变成 Ruby 更现代的实现，例如 Elixir 是一个强调函数式编程范例的语言，仍在开发中的 Crystal 目标是成为使用静态类型的 Ruby 。世界上许多程序员都喜欢上了 Ruby 及其语法，因此它的影响必将会在未来持续很长一段时间。

喜欢这篇文章吗？这里每两周都会发表一篇这样的文章。请在推特上关注我们 [@TwoBitHistory][4] 或者订阅我们的 [RSS][5]，这样新文章发布的第一时间你就能得到通知。

[^1]: http://ruby-doc.org/docs/ruby-doc-bundle/FAQ/FAQ.html
[^2]: https://www.youtube.com/watch?v=oEkJvvGEtB4?t=30m55s
[^3]: http://rubyonrails.org/doctrine/

--------------------------------------------------------------------------------

via: https://twobithistory.org/2017/11/19/the-ruby-story.html

作者：[Two-Bit History][a]
选题：[lujun9972][b]
译者：[wwhio](https://github.com/wwhio)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://twobithistory.org
[b]: https://github.com/lujun9972
[1]: https://twobithistory.org/images/matz.png
[2]: http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/88819
[3]: https://twobithistory.org/images/tiobe_ruby.png
[4]: https://twitter.com/TwoBitHistory
[5]: https://twobithistory.org/feed.xml

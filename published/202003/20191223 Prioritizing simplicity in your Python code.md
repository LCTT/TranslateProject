[#]: collector: (lujun9972)
[#]: translator: (caiichenr)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11999-1.html)
[#]: subject: (Prioritizing simplicity in your Python code)
[#]: via: (https://opensource.com/article/19/12/zen-python-simplicity-complexity)
[#]: author: (Moshe Zadka https://opensource.com/users/moshez)

简单是 Python 编程的第一要则
======

> 本文是 Python 之禅特别系列的第二篇，我们将要关注其中第三与第四条原则：简单与复杂。

![](https://img.linux.net.cn/data/attachment/album/202003/15/124150t4wf3wwgdrijx6xx.jpg)

> "Il semble que la perfection soit atteinte non quand il n'y a plus rien à ajouter, mais quand il n'y plus rien à retrancher."
>
> "It seems that perfection is finally attained not when there is no longer anything to add, but when there is no longer anything to take away."
>
> “完美并非无可增，而是不可减。”
>
>  —Antoine de Saint-Exupéry, [Terre des Hommes][2], 1939

编程时最常有的考量是与复杂性的斗争，只想写出让旁人无从下手的繁杂代码，对每个程序员来讲都算不上难事。倘若未能触及代码的简繁取舍，那么 《[Python 之禅][3]》 就有了一角残缺。

### <ruby>简单胜过复杂<rt>Simple is better than complex</rt></ruby>

尚有选择余地时，应该选简单的方案。Python 少有*不可为*之事，这意味着设计出巴洛克风格（LCTT 译注：即夸张和不理性）的程序只为解决浅显的问题不仅有可能，甚至很简单。

正因如此，编程时应当谨记，代码的简单性是最易丢失，却最难复得的。

这意味着，在可以选用函数来表达时不要去引入额外的类；避免使用强力的第三方库往往有助于你针对迫切的问题场景设计更妥当的简短函数。不过其根本的意图，旨在让你减少对将来的盘算，而去着重解决手头的问题。

以简单和优美作为指导原则的代码相比那些想要囊括将来一切变数的，在日后要容易修改得多。

### <ruby>复杂胜过错综复杂<rt>Complex is better than complicated</rt></ruby>

把握用词的精确含义对于理解这条令人费解的原则是至关重要的。形容某事<ruby>复杂<rt>complex</rt></ruby>，是说它由许多部分组成，着重组成成分之多；而形容某事<ruby>错综复杂<rt>complicated</rt></ruby>，则是指其包含着差异巨大、难以预料的行为，强调的是各组成部分之间的杂乱联系。 

解决困难问题时，往往没有可行的简单方案。此时，最 Python 化的策略是“<ruby>自底向上<rt>bottom-up</rt></ruby>”地构建出简单的工具，之后将其组合用以解决该问题。

这正是<ruby>对象组合<rt>object composition</rt></ruby>这类技术的闪耀之处，它避免了错综复杂的继承体系，转而由独立的对象把一些方法调用传递给别的独立对象。这些对象都能独立地测试与部署，最终却可以组成一体。

“自底建造” 的另一例即是<ruby>[单分派泛函数][4]<rt>singledispatch</rt></ruby>的使用，抛弃了错综复杂的对象之后，我们得到是简单、几乎无行为的对象以及独立的行为。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/zen-python-simplicity-complexity

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[caiichenr](https://github.com/caiichenr)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/read_book_guide_tutorial_teacher_student_apaper.png?itok=_GOufk6N (Person reading a book and digital copy)
[2]: https://en.wikipedia.org/wiki/Wind,_Sand_and_Stars
[3]: https://www.python.org/dev/peps/pep-0020/
[4]: https://opensource.com/article/19/5/python-singledispatch



提升针对国际读者技术性写作的5个技巧
============================================================


![documentation](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/typewriter-801921_1920.jpg?itok=faTXFNoE "documentation")



针对国际读者用英语写作很不容易，下面这些小窍门可以记下来。[知识共享许可][2]


针对国际读者用英语写文档不需要特别考虑英语母语的人。相反，更应该注意文档的语言可能不是读者的第一语言。我们看看下面这些简单的句子：“加密密码用‘xxx’命令（Encrypt the password using the 'foo bar' command.）”

从语法上讲，这个句子是正确的。ing形式（动名词）经常在英语中使用，很多英语母语的人应该大概对这样造句没有疑惑。然而，仔细观察，这个句子有歧义：单词“using”可以针对“the password”，也可以针对动词“加密”。因此，这个句子能够有两种不同的理解方式。

*   Encrypt the password that uses the 'foo bar' command（ 加密这个使用xxx命令的密码）.  
*   Encrypt the password by using the 'foo bar' command（使用xxx命令加密密码）.  


关于这个话题（密码加密或者xxx命令），只要你有这方面的知识，你就不会理解错误，而且正确的选择第二种方式才是句子要表达的含义。但是如果你对这个知识点没有概念呢？如果你仅仅是一个翻译者，只有关于文章主题的一般知识，而不是一个技术专家？或者英语不是你的母语而且你不熟悉英语的高级语法形式呢？

甚至连英语母语的人都可能需要一些训练才能写出简洁明了的技术文档。所以提升对文章适用性和潜在问题的认识是第一步。


这篇文章，基于我在[欧盟开放源码峰会][5]上的演讲，提供了几种有用的技巧。大多数技巧不仅仅针对技术文档，也可以用于日程信函的书写，如邮件或者报告之类的。


**1. 转换视角**

转换视角，从你的读者出发。首先要了解你潜在的读者。如果你是作为开发人员针对用户写，则从用户的视角来看待你的产品。用户画像（Persona）技术能够帮助你专注于目标受众，而且提供关于你的受众适当的细节信息。

**2. 遵守KISS（Keep it short and simple）原则**

这个原则可以用于几个层次，如语法，句式或者单词。看下面的例子：

_单词:_

罕见的和长的单词会降低阅读速度而且可能会是非母语读者的障碍。使用简单点的单词，如：
“utilize” → “use”
“indicate” → “show”, “tell”, “say”
“prerequisite” → “requirement”




_语法：_

最好使用最简单的时态。举个例子，当提到一个动作的结果时使用一般现在时。如“Click '_OK_' . The  _Printer Options_  dialog appears（单击'_ok_'.就弹出_打印选项_对话框了）”


_句式：_ 

一般说来,一个句子就表达一个意思。然而在我看来，把句子的长度限制到一定数量的单词是没有用的。短句子不是想着那么容易理解的（特别是一组名词的时候）。有时候把句子剪短到一定单词数量会造成歧义，相应的还会使句子更加难以理解。




**3. 当心歧义**


作为作者，我们通常没有注意到句子中的歧义。让别人审阅你的文章有助于发现这些问题。如果无法这么做，就尝试从这些不同的视角审视每个句子：
对于没有相关知识背景的读者也能看懂吗？对于语言能力有限的读者也可以吗？所有句子成分间的语法关系清晰吗？如果某个句子没有达到这些要求，重新措辞来解决歧义。

**4. 格式统一**

这个适用于对单词，拼写和标点符号的选择，也是适用于短语和结构的选择。对于列表，使用平行的语法造句。如：

Why white space is important（为什么空格很重要）:

*   It focuses attention（让读者注意力集中）.

*   It visually separates sections（让文章章节分割更直观）.

*   It splits content into chunks（让文章内容分割为不同块）. 

**5. 清除冗余** 

对目标读者仅保留明确的信息。在句子层面，避免填充（如basically, easily）和没必要的修饰。如：

"already existing" → "existing"

"completely new" → "new"


##总结

你现在应该猜到了，写作就是改。好的文章需要付出和练习。但是如果你仅是偶尔写写，则可以通过专注目标读者和运用基本写作技巧来显著地提升你的文章。

文章易读性越高，理解起来越容易，即使针对于不同语言级别的读者也是一样。尤其在本地化翻译方面，高质量的原文是非常重要的，因为“错进错出（原文：Garbage in, garbage out）"。如果原文有不足，翻译时间会更长，导致更高的成本。甚至，这种不足会在翻译过程中成倍的放大而且后面需要在多种语言版本中改正。


![Tanja Roth](https://www.linux.com/sites/lcom/files/styles/floated_images/public/tanja-roth.jpg?itok=eta0fvZC "Tanja Roth")

Tanja Roth, SUSE Linux公司-技术文档专家 [使用许可][1]


_在对语言和技术两方面兴趣的驱动下，Tanja作为一名技术文章的写作者，在机械工程，医学技术和IT领域工作了很多年。她在2005年加入SUSE组织并且贡献了各种各样产品和项目的文章，包括高可用性和云的相关话题。_

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/event/open-source-summit-eu/2017/12/technical-writing-international-audience?sf175396579=1

作者：[TANJA ROTH ][a]
译者：[yizhuoyan](https://github.com/yizhuoyan)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/tanja-roth
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/creative-commons-zero
[3]:https://www.linux.com/files/images/tanja-rothjpg
[4]:https://www.linux.com/files/images/typewriter-8019211920jpg
[5]:https://osseu17.sched.com/event/ByIW
[6]:https://en.wikipedia.org/wiki/Persona_(user_experience)

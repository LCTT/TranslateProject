[#]: collector: (lujun9972)
[#]: translator: (Yufei-Yan)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What you need to know about hash functions)
[#]: via: (https://opensource.com/article/20/7/hash-functions)
[#]: author: (Mike Bursell https://opensource.com/users/mikecamel)

关于哈希函数你应该知道的东西
======

通过哈希计算，从输出反推回输入，这从计算的角度是不可行的。

![City with numbers overlay][1]

无论安全从业人员用计算机做什么，在他们的技能库中有一个对所有人都很有用的工具：加密哈希函数。听起来很神秘，很专业，甚至可能有点无聊，但是关于什么是哈希函数以及他们为什么对你很重要，我会作出一个简洁的解释。

加密哈系函数，比如 SHA-256 或者 MD5，接受一组二进制数据（通常是字节）作为输入，并且希望给出对应每一组可能的输入一个唯一的输出。对于任意模式的输入，给定哈希函数的输出长度——“哈希值”——通常都是一样（对于 SHA-256，他是 32 字节或者 256 比特——从名字中就能看出来）。重要的是：通过哈希计算，从输出反推回输入，这从计算的角度是<ruby>不可能的<rt>implausible</rt></ruby>（密码学家讨厌 _impossible_ 这个词）。这就是为什么他们有时候被称作<ruby>单向哈希函数<rt>one-way hash functions</rt></ruby>。

但是哈希函数是干什么用的呢？什么独一无二的属性如此重要？

### 唯一的输出

在描述哈希函数的输出时，<ruby>“但愿唯一<rt>hopefully unique</rt>”</ruby>是非常关键的，因为哈希函数就是用来呈现完全唯一的输出。比如，哈希函数用于验证 _你_ 下载的文件副本的每一个字节是否和 _我_ 下载的文件一样。当你下载一个 Linux 的 ISO 文件或者从 Linux 的仓库中下载软件，你会看到这个验证过程正在工作。没有了唯一性，这个技术就没用了，至少就通常的目的而言是这样的。

如果两个输入产生了相同的输出，那么这样的哈希就称作<ruby>“冲突”<rt>collision</rt></ruby>。事实上，MD5 已经被弃用，因为他现在非常可能与商业化的硬件和软件系统存在冲突。

另外一个重要的性质是，当消息中的一个微小变化，甚至只是一个比特位，都可能会在输出中产生一个明显的变化（这就是<ruby>“雪崩效应”<rt>avalanche effect</rt></ruby>）。

### 验证二进制数据

哈希函数的典型用途是当有人给你一段二进制数据，确保这些数据是你所期望的。无论是文本，可执行文件，视频，图像或者一个完整的数据库数据，在计算世界中，所有的数据都可以用二进制的形式进行描述，所以可以这么说，哈希的应用相当广泛。直接比较二进制数据非常缓慢且计算量巨大，但是哈希函数在设计之初就非常快。给定两个大小为几 M 或者几 G 的文件，你可以先生成他们的哈希值，然后在需要的时候再进行比较。

通常，对哈希值进行签名比对大型数据集本身进行签名更容易。这个特性太重要了，以至于密码学中对哈希值最常见的应用就是生成“数字”签名。

由于生成数据的哈希值很容易，所以通常不需要有两套数据。假设你想在你的电脑上运行一个可执行文件。但是在你运行之前，你需要检查这个文件就是你要的文件，并且没有被黑客篡改。你可以方便快捷的对文件生成哈希值，只要你有一个这个哈希值的副本，你就可以相当肯定这就是你想要的文件。

下面是一个简单的例子：

```
$ shasum -a256 ~/bin/fop
87227baf4e1e78f6499e4905e8640c1f36720ae5f2bd167de325fd0d4ebc791c  /home/bob/bin/fop
```

If I know that the SHA-256 sum of the `fop` executable, as delivered by its vendor (Apache Foundation, in this case) is:

如果我知道 fop 这个可执行文件的 SHA-256 的和，这由供应商（这个例子中是 Apache 基金会）提供的：

```
87227baf4e1e78f6499e4905e8640c1f36720ae5f2bd167de325fd0d4ebc791c
```

然后我就可以确信，我驱动器上的这个可执行文件和 Apache 基金会网站上发布的文件是一模一样的。这就是哈希函数难以发生冲突（或者至少是 _很难通过计算得到冲突_）这个性质的重要之处。如果黑客能将与真实文件的哈希值相同的文件轻易的进行替换，那么这个验证过程就毫无用处。

In fact, there are more technical names for the various properties, and what I've described above mashes three important ones together. More accurately, those technical names are:

事实上，对于不同的性质有更多的技术名称，而我将上面的描述总结成了三条。更准确的说，那些技术名称是：

  1. **<ruby>抗原像性<rt>pre-image resistance</rt></ruby>：** 给定一个哈希值，即使知道用了什么哈希函数，也无法得到能够得出这个哈希值的消息。
  2. **<ruby>抗次原像性<rt>second pre-image resistance</rt><ruby>：** 给定一个消息，无法得到另一个消息，使得这个消息可以产生相同的哈希值。
  3. **<ruby>抗碰撞性<rt>collision resistance</rt></ruby>：** 无法得到任意两个可以产生相同哈希值的消息。

_抗碰撞性_ 和 _抗原像性_ 也许听上去是同样的性质，但他们有细微的（和显著的）不同。_抗原像性_ 说的是如果 _已经_ 有了一个消息，你也无法得到一个与之哈希值相匹配的消息。抗碰撞性使你很难制造两个可以生成相同哈希值的消息，并且要在哈希函数中实现这一性质则更加困难。

让我回到黑客试图替换文件（可以通过哈希值进行校验）的场景。现在，使用任意加密哈希算法——不是那些在现实世界中由独角兽公司开发的完全无 Bug 且安全的实现——有一些重要且困难的附加条件需要满足。偏执的读者可能已经想到了其中一些，特别需要指出的是：

  1. 你必须确保现有的哈希值副本不容易遭到篡改。
  2. 你必须确保执行哈希算法的实体可以正确执行并且得到正确的结果。
  3. 你必须确保对比两个哈希值的实体可以得到这个对比的正确结果。

确保你能满足这些条件绝对不是一件容易的事。这就是<ruby>可信任平台模块<rt>Trusted Platform Modules</rt></ruby>（TPMs）成为许多计算系统一部分的原因之一。他们扮演着信任的硬件基础，可以为验证重要二进制数据真实性的加密工具提供保证。 TPMs 对于现实中系统来说是有用且重要的工具，我也打算将来写一篇关于 TPMs 的文章。

* * *

_This article was originally published on [Alice, Eve, and Bob][2] and is adapted and reprinted with the author's permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/hash-functions

作者：[Mike Bursell][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mikecamel
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_OpenData_CityNumbers.png?itok=lC03ce76 (City with numbers overlay)
[2]: https://aliceevebob.com/2020/06/16/whats-a-hash-function/

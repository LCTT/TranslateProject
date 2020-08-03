[#]: collector: (lujun9972)
[#]: translator: (Yufei-Yan)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12408-1.html)
[#]: subject: (What you need to know about hash functions)
[#]: via: (https://opensource.com/article/20/7/hash-functions)
[#]: author: (Mike Bursell https://opensource.com/users/mikecamel)

关于哈希（散列）函数你应该知道的东西
======

> 从输出的哈希值反推回输入，这从计算的角度是不可行的。

![](https://img.linux.net.cn/data/attachment/album/202007/12/145709d3ne3vee330oh3lv.jpg)

无论安全从业人员用计算机做什么，有一种工具对他们每个人都很有用：加密<ruby>哈希（散列）<rt>hash</rt></ruby>函数。这听起来很神秘、很专业，甚至可能有点乏味，但是， 在这里，关于什么是哈希函数以及它们为什么对你很重要，我会作出一个简洁的解释。

加密哈希函数，比如 SHA-256 或者 MD5，接受一组二进制数据（通常是字节）作为输入，并且对每个可能的输入集给出一个<ruby>希望唯一<rt>hopefully unique</rt></ruby>的输出。对于任意模式的输入，给定的哈希函数的输出（“哈希值”）的长度都是一样的（对于 SHA-256，是 32 字节或者 256 比特，这从名字中就能看出来）。最重要的是：从输出的哈希值反推回输入，这从计算的角度是<ruby>不可行的<rt>implausible</rt></ruby>（密码学家讨厌 “<ruby>不可能<rt>impossible</rt></ruby>” 这个词）。这就是为什么它们有时候被称作<ruby>单向哈希函数<rt>one-way hash function</rt></ruby>。

但是哈希函数是用来做什么的呢？为什么“唯一”的属性如此重要？

### 唯一的输出

在描述哈希函数的输出时，“<ruby>希望唯一<rt>hopefully unique</rt></ruby>”这个短语是至关重要的，因为哈希函数就是用来呈现完全唯一的输出。比如，哈希函数可以用于验证 *你* 下载的文件副本的每一个字节是否和 *我* 下载的文件一样。你下载一个 Linux 的 ISO 文件或者从 Linux 的仓库中下载软件时，你会看到使用这个验证过程。没有了唯一性，这个技术就没用了，至少就通常的目的而言是这样的。

如果两个不同的输入产生了相同的输出，那么这样的哈希过程就称作“<ruby>碰撞<rt>collision</rt></ruby>”。事实上，MD5 算法已经被弃用，因为虽然可能性微乎其微，但它现在可以用市面上的硬件和软件系统找到碰撞。

另外一个重要的特性是，消息中的一个微小变化，甚至只是改变一个比特位，都可能会在输出中产生一个明显的变化（这就是“<ruby>雪崩效应<rt>avalanche effect</rt></ruby>”）。

### 验证二进制数据

哈希函数的典型用途是当有人给你一段二进制数据，确保这些数据是你所期望的。无论是文本、可执行文件、视频、图像或者一个完整的数据库数据，在计算世界中，所有的数据都可以用二进制的形式进行描述，所以至少可以这么说，哈希是广泛适用的。直接比较二进制数据是非常缓慢的且计算量巨大，但是哈希函数在设计上非常快。给定两个大小为几 M 或者几 G 的文件，你可以事先生成它们的哈希值，然后在需要的时候再进行比较。

通常，对哈希值进行签名比对大型数据集本身进行签名更容易。这个特性太重要了，以至于密码学中对哈希值最常见的应用就是生成“数字”签名。

由于生成数据的哈希值很容易，所以通常不需要有两套数据。假设你想在你的电脑上运行一个可执行文件。但是在你运行之前，你需要检查这个文件就是你要的文件，没有被黑客篡改。你可以方便快捷的对文件生成哈希值，只要你有一个这个哈希值的副本，你就可以相当肯定这就是你想要的文件。

下面是一个简单的例子：

```
$ shasum -a256 ~/bin/fop
87227baf4e1e78f6499e4905e8640c1f36720ae5f2bd167de325fd0d4ebc791c  /home/bob/bin/fop
```

如果我知道 `fop` 这个可执行文件的 SHA-256 校验和，这是由供应商（这个例子中是 Apache 基金会）提供的：

```
87227baf4e1e78f6499e4905e8640c1f36720ae5f2bd167de325fd0d4ebc791c
```

然后我就可以确信，我驱动器上的这个可执行文件和 Apache 基金会网站上发布的文件是一模一样的。这就是哈希函数难以发生碰撞（或者至少是 *很难通过计算得到碰撞*）这个性质的重要之处。如果黑客能将真实文件用哈希值相同的文件轻易的进行替换，那么这个验证过程就毫无用处。

事实上，这些性质还有更技术性的名称，我上面所描述的将三个重要的属性混在了一起。更准确地说，这些技术名称是：

1. <ruby>抗原像性<rt>pre-image resistance</rt></ruby>：给定一个哈希值，即使知道用了什么哈希函数，也很难得到用于创建它的消息。
2. <ruby>抗次原像性<rt>second pre-image resistance</rt><ruby>：给定一个消息，很难找到另一个消息，使得这个消息可以产生相同的哈希值。
3. <ruby>抗碰撞性<rt>collision resistance</rt></ruby>：很难得到任意两个可以产生相同哈希值的消息。

*抗碰撞性* 和 *抗次原像性* 也许听上去是同样的性质，但它们具有细微而显著的不同。*抗次原像性* 说的是如果 *已经* 有了一个消息，你也很难得到另一个与之哈希值相匹配的消息。*抗碰撞性* 使你很难找到两个可以生成相同哈希值的消息，并且要在哈希函数中实现这一性质则更加困难。

让我回到黑客试图替换文件（可以通过哈希值进行校验）的场景。现在，要在“外面”使用加密哈希算法（除了使用那些在现实世界中由独角兽公司开发的完全无 Bug 且安全的实现之外），还有一些重要且困难的附加条件需要满足。认真的读者可能已经想到了其中一些，特别需要指出的是：

1. 你必须确保自己所拥有的哈希值副本也没有被篡改。
2. 你必须确保执行哈希算法的实体能够正确执行并报告了结果。
3. 你必须确保对比两个哈希值的实体确实报告了这个对比的正确结果。

确保你能满足这些条件绝对不是一件容易的事。这就是<ruby>可信平台模块<rt>Trusted Platform Modules</rt></ruby>（TPM）成为许多计算系统一部分的原因之一。它们扮演着信任的硬件基础，可以为验证重要二进制数据真实性的加密工具提供保证。TPM 对于现实中的系统来说是有用且重要的工具，我也打算将来写一篇关于 TPM 的文章。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/hash-functions

作者：[Mike Bursell][a]
选题：[lujun9972][b]
译者：[Yufei-Yan](https://github.com/Yufei-Yan)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mikecamel
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_OpenData_CityNumbers.png?itok=lC03ce76
[2]: https://aliceevebob.com/2020/06/16/whats-a-hash-function/

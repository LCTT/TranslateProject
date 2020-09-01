[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12545-1.html)
[#]: subject: (An attempt to make a font look more handwritten)
[#]: via: (https://jvns.ca/blog/2020/08/08/handwritten-font/)
[#]: author: (Julia Evans https://jvns.ca/)

一次让字体看起来更像手写体的尝试
======

![](https://img.linux.net.cn/data/attachment/album/202008/24/111019lzpc280kkvlfpv1p.jpg)

其实我对这个实验的结果并不是特别满意，但我还是想分享一下，因为摆弄字体是件非常简单和有趣的事情。而且有人问我怎么做，我告诉她我会写一篇博文来介绍一下 :)

### 背景：原本的手写体

先交代一些背景信息：我有一个我自己的手写字体，我已经在我的电子杂志中使用了好几年了。我用一个叫 [iFontMaker][1] 的令人愉快的应用程序制作了它。他们在网站上自诩为“你可以在 5 分钟内只用手指就能制作出你的手工字体”。根据我的经验，“5 分钟”的部分比较准确 —— 我可能花了更多的时间，比如 15 分钟。我对“只用手指”的说法持怀疑态度 —— 我用的是 Apple Pencil，它的精确度要好得多。但是，使用该应用程序制作你的笔迹的 TTF 字体是非常容易的，如果你碰巧已经有了 Apple Pencil 和 iPad，我认为这是一个有趣的方式，我只花了 7.99 美元。

下面是我的字体的样子。左边的“CONNECT”文字是我的实际笔迹，右边的段落是字体。其实有 2 种字体 —— 有一种是普通字体，一种是手写的“等宽”字体。（其实实际并不是等宽，我还没有想好如何在 iFontMaker 中制作一个实际的等宽字体）

![][2]

### 目标：在字体上做更多的字符变化

在上面的截图中，很明显可以看出这是一种字体，而不是实际的笔迹。当你有两个相同的字母相邻时，就最容易看出来，比如“HTTP”。

所以我想，使用一些 OpenType 的功能，以某种方式为这个字体引入更多的变化，比如也许两个 “T” 可以是不同的。不过我不知道该怎么做！

### 来自 Tristan Hume 的主意：使用 OpenType！

然后我在 5 月份的 !!Con 2020 上（所有的[演讲录音都在这里！][3]）看到了 Tristan Hume 的这个演讲：关于使用 OpenType 通过特殊的字体将逗号插入到大的数字中。他的演讲和博文都很棒，所以这里有一堆链接 —— 下面现场演示也许是最快看到他的成果的方式。

  * 一个现场演示： [Numderline 测试][4]
  * 博客文章：[将逗号插入到大的数字的各个位置：OpenType 冒险][5]
  * 谈话：[!!Con 2020 - 使用字体塑型，把逗号插入到大的数字的各个位置！][6]
  * GitHub 存储库： https://github.com/trishume/numderline/blob/master/patcher.py

### 基本思路：OpenType 允许你根据上下文替换字符

我一开始对 OpenType 到底是什么非常困惑。目前我仍然不甚了然，但我知道到你可以编写极其简单的 OpenType 规则来改变字体的外观，而且你甚至不需要真正了解字体。

下面是一个规则示例：

```
sub a' b by other_a;
```

这里 `sub a' b by other_a;` 的意思是：如果一个 `a` 字形是在一个 `b` 之前，那么替换 `a` 为字形 `other_a`。

所以这意味着我可以让 `ab` 和 `ac` 在字体中出现不同的字形。这并不像手写体那样随机，但它确实引入了一点变化。

### OpenType 参考文档：真棒

我找到的最好的 OpenType 文档是这个 [OpenType™ 特性文件规范][7] 资料。里面有很多你可以做的很酷的事情的例子，比如用一个连字替换 “ffi”。

### 如何应用这些规则：fonttools

为字体添加新的 OpenType 规则是超容易的。有一个 Python 库叫 `fonttools`，这 5 行代码会把放在 `rules.fea` 中的 OpenType 规则列表应用到字体文件 `input.ttf` 中。
 
```
from fontTools.ttLib import TTFont
from fontTools.feaLib.builder import addOpenTypeFeatures

ft_font = TTFont('input.ttf')
addOpenTypeFeatures(ft_font, 'rules.fea', tables=['GSUB'])
ft_font.save('output.ttf')
```

`fontTools` 还提供了几个名为 `ttx` 和 `fonttools` 的命令行工具。`ttx` 可以将 TTF 字体转换为 XML 文件，这对我很有用，因为我想重新命名我的字体中的一些字形，但我对字体一无所知。所以我只是将我的字体转换为 XML 文件，使用 `sed` 重命名字形，然后再次使用 `ttx` 将 XML 文件转换回 `ttf`。

`fonttools merge` 可以让我把我的 3 个手写字体合并成 1 个，这样我就在 1 个文件中得到了我需要的所有字形。

### 代码

我把我的极潦草的代码放在一个叫 [font-mixer][8] 的存储库里。它大概有 33 行代码，我认为它不言自明。（都在 `run.sh` 和 `combine.py` 中）

### 结果

下面是旧字体和新字体的小样。我不认为新字体的“感觉”更像手写体 —— 有更多的变化，但还是比不上实际的手写体文字（在下面）。

我觉得稍微有点不可思议，它明明还是一种字体，但它却要假装成不是字体：

![][9]

而这是实际手写的同样的文字的样本：

![][10]

如果我在制作另外 2 种手写字体的时候，把原来的字体混合在一起，再仔细一点，可能效果会更好。

### 添加 OpenType 规则这么容易，真酷！

这里最让我欣喜的是，添加 OpenType 规则来改变字体的工作方式是如此的容易，比如你可以很容易地做出一个“the”单词总是被“teh”代替的字体（让错别字一直留着！）。

不过我还是不知道如何做出更逼真的手写字体：）。我现在还在用旧的那个字体（没有额外的变化），我对它很满意。

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/08/08/handwritten-font/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://2ttf.com/
[2]: https://jvns.ca/images/font-sample-connect.png
[3]: http://bangbangcon.com/recordings.html
[4]: https://thume.ca/numderline/
[5]: https://blog.janestreet.com/commas-in-big-numbers-everywhere/
[6]: https://www.youtube.com/watch?v=Biqm9ndNyC8
[7]: https://adobe-type-tools.github.io/afdko/OpenTypeFeatureFileSpecification.html
[8]: https://github.com/jvns/font-mixer/
[9]: https://jvns.ca/images/font-mixer-comparison.png
[10]: https://jvns.ca/images/handwriting-sample.jpeg

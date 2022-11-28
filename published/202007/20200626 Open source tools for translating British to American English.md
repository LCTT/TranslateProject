[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12430-1.html)
[#]: subject: (Open source tools for translating British to American English)
[#]: via: (https://opensource.com/article/20/6/british-american-cli-translator)
[#]: author: (Jeff Macharyas https://opensource.com/users/jeffmacharyas)

将英式英语翻译成美式英语的开源工具
======

> 使用这些命令行翻译器将英式英语转换为美式英语（或反之）。

![Red telephone booth on a street in England][1]

去年圣诞节，我和我的妻子去了家乡佛罗里达的皮尔斯堡，并且经常光顾海滩上的一家当地人场所。在那儿，我们遇到了一对来自英国中部地区的夫妇。音乐很响，喝酒也很闹，所以很难听清楚。另外，即使他们“似乎”在说英语，但有时理解他们在说什么仍然是一个挑战。我以为我在澳大利亚的时光会给我足够的语言能力，但是，可惜，很多东西都超出了我的想象。不止是一般的 “soccer 是 football” 或 “trunk是 boot” 之类的困惑。

幸运的是，有开源方案可以将“英式”翻译成“美式”。我们可能使用相同的语言，但是我们共同的言语却比多塞特郡沙夫茨伯里的之字形山要曲折得多！

如果你碰巧在酒吧有 Linux 笔记本，那么你可以使用方便的开源命令行程序，它就叫 [美英英语翻译器][2]（MIT 许可证）。

我在我的改造运行 Linux 的 MacBook 上安装这个翻译器：

```
$ npm install -g american-british-english-translator
```

这需要我首先[安装 Node.js][3]。

### 声明！

除了翻译单词和短语，美英英语翻译器还能分析（嗯，剖析）文档。我用一个叫《独立宣言》的流行文件试了一下。它分析并返回了许多结果。其中一个比较有趣的是：

```
fall:
issue: Different meanings（意思不同）
details:
American English: autumn（秋天）
British English:
"""
to become pregnant. (Either as in 'I fell pregnant' or as in 'She fell for a baby.');（怀孕 —— 无论是“我怀孕了”还是“她怀孕了”）
```

并非如《宣言》作者所指控的“在公海俘虏”（taken captive on the high seas）：

> ”他在公海上俘虏我们的同胞，强迫他们拿起武器来反对自己的国家，成为残杀自己亲人和朋友的刽子手，或是死于自己的亲人和朋友的手下。“（He has constrained our fellow Citizens taken Captive on the high Seas to bear Arms against their Country, to become the executioners of their friends and Brethren, or to fall themselves by their Hands.）

### 还有一个

对于简单的单词替换，你可以尝试 [Common_Language][4]，这是一个开源（MIT 许可）Python 脚本。

当然，要与同伴一起喝几杯，你也许需要实际交流，并能理解他们。这就是需要用到 MARY 了。

[MaryTTS][5] 是一个使用 Java（GNU 许可）编写的开源多语言文本到语音合成平台。方便的[基于浏览器的界面][6]使你可以轻松地将美国酒吧谈话内容转换为男声或女声的正确英语（或其他语言）。

现在我可以和我的英国朋友们见面了（可以安全地再来一次），喝几杯！像当地人一样讲英语！大家干杯！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/british-american-cli-translator

作者：[Jeff Macharyas][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jeffmacharyas
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/england-telephone-booth-street.jpg?itok=JQsc_piX (Red telephone booth on a street in England)
[2]: https://github.com/hyperreality/American-British-English-Translator
[3]: https://nodejs.org/en/download/
[4]: https://github.com/willettk/common_language
[5]: https://github.com/marytts/marytts
[6]: http://mary.dfki.de:59125/

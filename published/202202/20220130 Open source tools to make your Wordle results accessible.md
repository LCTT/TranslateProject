[#]: subject: "Open source tools to make your Wordle results accessible"
[#]: via: "https://opensource.com/article/22/1/open-source-accessibility-wordle"
[#]: author: "AmyJune Hineline https://opensource.com/users/amyjune"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14268-1.html"

无障碍分享你的 Wordle 结果的开源工具
======

> 分享你的 Wordle 结果是有趣的。尝试这些开源技巧让它们可以无障碍分享。

![](https://img.linux.net.cn/data/attachment/album/202202/13/154452or9r33xjtzrjoj6b.jpg)

Wordle 似乎在社交媒体上到处出现。Wordle 是一个快速的文字游戏，你可以每天玩一次，你可以很容易地通过社交媒体与朋友分享结果。

Wordle 的目的是猜测一个秘密单词。要进行猜测，需要输入一个单词，然后 Wordle 在一个由彩色编码的表情符号组成的网格中显示你的猜测结果。绿色表示一个字母在正确的位置。黄色表示密语中包含该字母，但它在错误的位置。灰色表示该字母根本就不在这个词中。

![Sample of wordle results displaying colors for letter position][2]

人们通过将产生的字母网格粘贴到社交媒体上来分享他们在游戏中的进展，这很容易做到，因为这个网格只是 [一组表情符号][3]。然而，表情图标和表情符存在无障碍问题。虽然它们很容易复制和粘贴，但对于生活在低视力或色盲的人来说，共享的结果可能很难看清。灰色、黄色、绿色的颜色对一些人来说可能很难区分。

![Wordle results statistics][4]

受到与 Mike Lim 谈话的启发，我在互联网上做了一些探究，发现了一些提示，包括一个帮助改善共享游戏结果的无障碍性的开源项目。

### 使用一个开源的无障碍应用

[wa11y 应用][5] 的使用很简单。你可以在 [这里][6] 找到 wa11y GitHub 项目。复制你的 Wordle 结果并将其粘贴到应用中，它就会将你的结果转换为文字。

![Emoji converted to words][7]

你可以简单地勾选复选框来包含表情符号，以表示成功猜测，但该项目维护者不建议这样做。辅助技术非常喜欢表情符号，以至于它会读取每一个表情符号。内联地、全部读取。尽管技术圈喜欢阅读它们，但使用辅助技术的人可能会发现它很麻烦，并经常放弃有几个以上的表情符号的信息。

![Words and emoji included in the output][8]

![Emojis are beautiful, but can be frustrating for folks who use screen readers and other accessibility tools. Please consider your audience on social media.][9]

### 提供无障碍图片

也许你不能使用 wa11y 应用，但仍然想确保你的结果是无障碍访问的。你可以进行截图，上传图片，并添加替代文本。你有几种方法可以做到这一点：

  * 附上图片，并在信息栏中写上替代文本。
  * 附上图片并深入到你的特定社交媒体应用的无障碍选项中，启用替代文本并从那里添加。开源社交网络 [Mastodon][10] 默认启用实际的替代文本。
  * [@AltTxtReminder][11] 是一个你可以关注的账户，当你忘记时，它会提醒你为图片添加替代文本。

如果你分享了默认结果，你总是可以选择在表情符号之前添加替代文本。这样，你的受众就可以获得文字信息，但在重复的表情符号变得繁琐之前，可以中止信息的其余部分。

![Twitter wordle results without text][12]

![Twitter results with descriptive explanation of results][13]

### 总结

Wordle 是最近互联网上的一个热门游戏，所以在分享你的结果时，一定要记住无障碍分享。有一些使用开源技术的简单方法可以使你的结果更容易与大家分享。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/open-source-accessibility-wordle

作者：[AmyJune Hineline][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/amyjune
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_women_computing_5.png?itok=YHpNs_ss (Women in computing and open source v5)
[2]: https://opensource.com/sites/default/files/apple.png
[3]: https://opensource.com/article/19/10/how-type-emoji-linux
[4]: https://opensource.com/sites/default/files/statistics.png
[5]: http://wa11y.co/
[6]: https://github.com/cariad/wa11y.co
[7]: https://opensource.com/sites/default/files/do-not-include-emoji.png
[8]: https://opensource.com/sites/default/files/include-emoji.png
[9]: https://opensource.com/sites/default/files/wa11y_0.png
[10]: https://opensource.com/article/17/4/guide-to-mastodon
[11]: https://twitter.com/alttxtreminder
[12]: https://opensource.com/sites/default/files/twitter.png
[13]: https://opensource.com/sites/default/files/twitter-with-ords.png

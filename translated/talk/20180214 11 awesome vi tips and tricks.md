11 个超棒的 Vi 技巧和窍门
======

> 是否你刚刚接触 Vi 还是想进阶，这些技巧可以很快让你成为高级用户。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/keyboaord_enter_writing_documentation.jpg?itok=kKrnXc5h)

[Vi][1] 编辑器是 Unix 和像 Linux 这样的类 Unix 系统中 Linux 最流行的编辑器之一。无论您是 vi 新手还是想进阶，这里有 11 个技巧可以增强你使用的方式。

### 编辑

编辑长文本时可能很难受，特别是编辑其中某一行时，需要移动许久才能到这行。这有个很快的方法：

1、 `:set number` 这个命令可是在编辑器左边显示行号。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/setnum.png?itok=sFVA97mG)

您可以在命令行中输入 `vi +26 samp.txt` 命令直接打开文件到达 26 行，在 vi 编辑器中也可以输入 `:26` 跳转到 26 行。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/number.png?itok=d7FE0LL3)

### 快速导航

2、 `i` 将工作方式从“命令模式”更改为“输入模式”，并在当前光标位置开始插入内容。

3、 `a` 除了是光标之后开始插入内容，与上面的效果是一样的。

4、 `o` 在光标的下一行位置开始插入内容。

### 删除

如果您发现错误或错别字，能快速的修正是很重要的。好在 Vi 都事先想好了。

了解 Vi 的删除功能，保证你不会意外按下某个键并永久删除一行或多段内容，这点至关重要。

5、 `x` 删除当前光标的字符。

6、 `dd` 删除当前行 （是的，整行内容！)

下面看可怕的部分：`30dd` 从当前行开始删除以下 30 行！使用此命令请慎重。

### 搜索

您可以在“命令模式”搜索关键字，而不用在大量文本内容中手动导航查找特定的单词或内容。

7、 `:/<keyword>` 搜索 `< >` 中的单词并将光标移动到第一个匹配项。

8、 导航到该单词的下一个匹配项，请输入 `n` 并继续按下， 直到找到您要找的内容。

例如，在这个图像中我要搜索包含 `ssh` 的内容， Vi 光标就会突出第一个结果的开始位置。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/ssh-search.png?itok=tJ-7FujH)

按下 `n` 之后， Vi 光标就会突出下一个匹配项。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/n-search.png?itok=wU-u3LiI)

### 保存并退出

开发人员 （或其他人） 可能会发现这个命令很有用。

9、 `:x` 保存您的工作并退出 Vi 。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/x.png?itok=kfoHx84m)

10、 如果你想节省哪怕是纳秒，那么这有个更快的回到终端的方法。不用在键盘上按 `Shift+:` ，而是按下 `Shift+q` （或者大写字母 Q ) 来进入 [Ex 模式][2] 。但是如果你只是想按下 `x` 来保存退出，那就没有什么区别（如上所示）。

### 替换

如果您想将文中的某个单词全部替换为一个单词，这有个很巧妙的招式。例如，如果您想在一个大文件中将 “desktop” 替换为 “laptop” ，那么单调的搜索每个出现的 “desktop” 将其删掉，然后再输入 “laotop” ，是很浪费时间的。

11、 `:%s/desktop/laptop/g` 这个命令将在整个文件中的 “desktop” 用 “laptop” 替换，他就像 Linux 的 `sed` 命令一样。


这个例子中我用 “user” 替换了 “root” ：

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/subs-command.png?itok=M8MN72sp)

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/subs-result.png?itok=34zzVdUt)

这些技巧应该能帮组任何想开始学 Vi 的人。我有遗漏其他巧妙的提示吗？请在评论中分享他们。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/top-11-vi-tips-and-tricks

作者：[Archit Modi][a]
译者：[MZqk](https://github.com/MZqk)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux 中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/architmodi
[1]:http://ex-vi.sourceforge.net/
[2]:https://en.wikibooks.org/wiki/Learning_the_vi_Editor/Vim/Modes#Ex-mode

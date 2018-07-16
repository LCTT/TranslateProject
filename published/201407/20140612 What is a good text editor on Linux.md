优秀的Linux文本编辑器
================================================================================

想要挑起狂热Linux爱好者之间的激烈争辩吗？那就问问他们最喜欢的文本编辑器是什么吧。在开源社区中，选择一个用来写文本，或者更进一步，用来写代码的编辑器，比选择一个球队或者游戏控制器还要重要。但是任何一个Linux新手都不该为过多的建议和各种各样的煽动而感到焦虑不安，取而代之，先去试着熟悉熟悉一堆不同的文本编辑器吧。所以今天我将要给你建议一个简单主题的列表，里面的编辑器都可以在Linux下编辑文本。这个列表不包括那些成熟的只用来编程的IDE，也不包括那些专门进行LaTex排版的编辑器。如果你对后者感兴趣，我可以建议你去看看[这里][1].

### 1. Vim & Emacs ###

![](https://farm3.staticflickr.com/2936/14371977196_1a4522359b_z.jpg)

让我们直接从这两个“大咖”开始。当有人在一个聊天室里问关于Linux下的编辑器时，会有一个人立马回答[Vim][2]，然后会有另外一个说[Emacs][3]。（LCTT译注：这就是V党和E党啊~）之所以会这样，理由很充分。这两个都是非常强大的编辑器，有很多的特性，很多插件，很强大的社区支持。如果你一点都不熟悉它们的话，要描述清楚它们强大的功能是有点困难。但是简单来讲，它们允许你在文本中快速移动，简单地做出大量的修改，记录宏以及你能想到基本上任何疯狂的编辑方式。这两个编辑器共同的缺点是，不可避免地花时间去学习。讲完这点之后，我不会陷入到哪一个更好的争论中去，但是我真的想建议每一个人至少学习这两者之一。

![](https://farm4.staticflickr.com/3916/14393718612_a880b86a52_z.jpg)

### 2. Sublime Text & Lime & Atom ###

![](https://farm3.staticflickr.com/2917/14391734181_0f0ec76e4f_z.jpg)

一款叫做[Sublime Text][4]的文本编辑器在过去几年逐渐兴起。一些人可能会将它视为Vim或者Emacs的友好版，专为编程而设计的。事实上，它保持了一些与Vim和Emacs的相似特性。比如，批量编辑和函数跳转都会让人或多或少想起Emacs或者[一个充满活力的Vim][5]。然而，它保留了更多的可视性并且更加容易使用。同样，大量的插件吸引大家进行个性化定制。（LCTT译注：实际上，译者认为Sublime Text与其说是像Vim或Emacs，不如说更像是Mac上的编辑器神器textmate。另外，Sublime Text的发展最近已经陷入停滞了。）

Sublime Text唯一的“污点”是它的许可证：如果你只使用开源软件的话，你可以放弃它了。（LCTT译注：但是Sublime Text可以全功能一直试用下去，没有一点区别，只是如果你觉得应该支持的话，付费比较好，虽然挺贵。）为此，最近出现了一个雄心勃勃的克隆版 [Lime][6] 。这个软件正处在重度开发当中，但是它的理念是：跟Sublime Text相似的用户体验，但是带着开源的韵味。对于Lime，除了满满的期待没有更多要说的了。

距现在更近的，GitHub以开源形式发布了[Atom][7]，展开了与Sublime Text正式的竞争。Atom打包了所有你想要的文件跳转，代码片段使用等特性，提供一个完整特性的编辑器而不是简单的编辑框。使用HTML，CSS和集成Node.js环境，可以轻易地定制文本处理过程，这正是它的魅力所在。这其实已经要涉及到IDE的定义了，我们的列表最多会覆盖到这里。（LCTT译注：好吧，我觉得从Sublime Text转移出来的最佳出口就是Atom。）

![](https://farm4.staticflickr.com/3907/14395083745_469b7e49c9_z.jpg)

### 3. Gedit & Kate & Mousepad & Leafpad ###

![](https://farm3.staticflickr.com/2927/14371977076_c95a557233_z.jpg) 

如果不谈这些超级厉害的神器，我们可以转向我认为的“桌面环境经典版”编辑器。这些编辑器感觉上更加的传统，有些也可以用插件进行强化，但是它们的重点是输入简单。如果你头脑里有一些想法想要在忘记之前赶快记下来（我必须怪罪那些视频游戏让我的注意力变得短暂）。你不需要学习Vim或者Sublime Text的快捷键。你只需要一些空白的地方进行输入。这类编辑器的好处是它们或多或少的和你的桌面环境集成在一起。在这一类编辑器中，Gnome 下的 [Gedit][8] 和 KDE下的 [Kate][9] 都很好的集成在桌面系统中，可以通过插件进行个性化定制。比如，更容易的进行LaTeX排版。[Mousepad][10] 和 [Leafpad][11] 更适合于轻量级的桌面，比如Xfce和LXDE。它们在某种程度上很像Windows的记事本。所以，如果你需要的是灵活和便捷，请选择它们。

![](https://c2.staticflickr.com/6/5522/14415259703_d3885b3952_z.jpg)

### 4. Nano & Qute ###

![](https://farm3.staticflickr.com/2938/14208641327_49fc7286ba_z.jpg)

另外一个流行的文本编辑器“大家族”是“无打扰编辑器”。如果你喜欢在后台持续地开着Facebook或者Twitter，或者每5分钟就收一次邮件，你就会知道把注意力集中在那篇明天要交的散文，或者这些还没编译通过的代码是多么困难的事。如果是这样，你需要一个编辑器，它可以占满整个屏幕空间，并且屏蔽掉所有的其它事情。

也许这类编辑器里面最不受欢迎的是Nano。如果你想屏蔽所有分心的事，关掉X server（LCTT译注：关掉桌面，只用文字终端界面，Nano就是工作在这种模式下。实际上这时nano就是接管了X Server的工作。）。这是最简单和直接的方式。事实上，《权力游戏(Game of Thrones)》的作者Geogge R. R. Martin最近就在[一次采访][13]中说他使用一个类似DOS Word的文本处理程序写他的小说。

如果你想要一款更顺眼一点的编辑器，你可以试试我的最爱：[Qute][14]。没有酷炫的特性，也许有一点LaTeX排版使它开起来更美观，但是重点其实是在它的界面的。它提供了一个舒适的导航和编辑体验。如果你对终端感觉不太舒服，Qute是个不错的选择。


![](https://farm3.staticflickr.com/2927/14395083485_7f8f0d6d59_z.jpg)

### 5. LibreOffice & Calligra & Abiword ###

![](https://farm4.staticflickr.com/3845/14395083565_b07b33abf0_z.jpg)

最后，办公套件也是文本编辑器。我不确定你能否轻松使用办公套件编程，但是它确实更适合纯文本编辑，也比LaTeX更容易学习。在这类编辑器中，[LibreOffice][15] 和 [Calligra][16] 不能避而不谈。这两个编辑器因为它们丰富的特性和响亮的名声成为这类编辑器中的巨兽。这两者我都喜欢，但是很多人明确的偏向于前者。如果你怀念微软的Word处理软件，你会有自己的选择。稍处下风的[Abiword][17]相对前面的两个是一个轻量级的选择。如果你的目的只是编辑一个文本文档，不关心电子表格或者数据库，Abiword的特性可以达到理想的效果。

![](https://farm3.staticflickr.com/2915/14371976966_4d252928ec_z.jpg)

简单总结一下，如果我仅有一条建议给你，那么就是选择你周围的人正在使用的编辑器。如果因为某些疯狂的理由，每一个你周围的人都用LibreOffice写C程序，或者用Sublime Text写小说，而你也要做同样的事，你应该跟随潮流。原因就是当你遇到一个问题需要帮助的时候，他们可以更容易的给你提供帮助。

你最喜欢的文本编辑器是什么？你都用它来做什么？请在评论中和我们分享吧。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/06/good-text-editor-linux.html

译者：[love\_daisy\_love](https://github.com/CNprober) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/2014/04/latex-editor-software-linux.html
[2]:http://www.vim.org/
[3]:https://www.gnu.org/software/emacs/
[4]:http://www.sublimetext.com/
[5]:http://xmodulo.com/2014/06/turn-vim-full-fledged-ide.html
[6]:http://limetext.org/
[7]:https://atom.io/
[8]:https://wiki.gnome.org/Apps/Gedit
[9]:http://kate-editor.org/
[10]:http://www.home.unix-ag.org/bmeurer/xfce/apps.html
[11]:http://tarot.freeshell.org/leafpad/
[12]:https://www.flickr.com/photos/xmodulo/14415259703/
[13]:https://www.youtube.com/watch?v=X5REM-3nWHg
[14]:http://www.inkcode.net/qute
[15]:https://www.libreoffice.org/
[16]:http://www.calligra-suite.org/
[17]:http://www.abisource.com/
 

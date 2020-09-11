[#]: collector: (lujun9972)
[#]: translator: (zhs852)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10656-1.html)
[#]: subject: (How to host your own webfonts)
[#]: via: (https://opensource.com/article/19/3/webfonts)
[#]: author: (Seth Kenlon (Red Hat, Community Moderator) https://opensource.com/users/seth)

托管你自己的在线字体
======

> 使用自托管的开源字体来定制你的网页。

![开源字体][1]

字体对许多计算机用户来说可能都是很神秘的东西。举个例子，你在制作好一张很酷的传单之后，你需要将它送到某个地方去打印，结果发现，你设计的所有字体都变成了 Arial，这多半是因为打印店没用安装你设计用到的那些字体。不过，我们仍有很多方法来避免这种情况：你可以将这些使用特定字体的单词转换为路径，你也可以将它封装为 PDF，或是把开源字体封装到你的设计文件中，或者至少列出所需字体。不过，我们总会忘记一些事情，所以这仍是一个问题。

Web 上也有类似的问题。如果你对 CSS 有所了解，你可能会见过这种声明：

```
h1 { font-family: "Times New Roman", Times, serif; }
```

这是设计师正在尝试定义网站使用要用到的特定字体，如果用户没有安装 Times New Roman 这个字体，便会回落到另一个字体；如果用户也没有安装 Times 这个字体，便再次回落。它比使用图片而不是文本更好一些，但是在没有字体托管的情况下，这仍是一种棘手且不雅观的方法。不过，在早期的互联网时代，我们不得不这样做。

### 在线字体

在线字体的登场，把字体管理从客户端搬上了服务端。如今网页上的字体通常由服务器为客户端渲染，而不是要求浏览器从用户的系统中查找字体。谷歌和其它供应商托管了许多开源字体，网站设计师们可以很轻松的用 CSS 来引用它们。

不过，问题是，引用这些字体并不是不花费任何代价的。虽然引用它们免费，但是像谷歌这样的巨头喜欢跟踪那些引用它们资源的网站，其中就包括了字体资源。如果你不想你的网站帮谷歌记录每个人的活动，你可以自己托管在线字体。别觉得这很难，它其实是很简单的，大概流程就是上传字体到你的主机，再使用一个简单的 CSS 便可完成。这样做还有个好处，你的网站能更快地加载，因为它会在加载每个页面的时候进行更少的外部调用。

### 自托管在线字体

首先，你需要一个开源字体。如果你没有了解过那些令人费解的软件协议，你可能会感到很疑惑，特别是很多字体看起来都是免费的。我们中应该很少有人有字体付费意识，但是他们却在电脑上安装了一些高价的字体。不过，由于授权协议，它使得你的电脑也许带着一些 [法律上不允许复制和再分发][2] 的字体。像 Arial、Verdana、Calibri、Georgia、Impact、Lucida 和 Lucida Grande、Times 和 Times New Roman、Trebuchet、Geneva 以及其它的很多字体都是被微软、苹果和 Adobe 这种大公司所拥有的。如果你购买了一台预装了 Windows 或 macOS 的电脑，你就获得了使用这些字体的权利，但是你并没有拥有那些字体，也没有被许可上传它们至服务器（除非额外说明）。

幸运的事，开源热潮在很久以前就席卷了字体界。然后就有了许多优秀的开源字体的合集和项目，比如 [The League of Moveable Type][3]、[Font Library][4] 以及 [Omnibus Type][5]，甚至还有一些来自 [Google][6] 和 [Adobe][7] 的字体。

常见的字体格式有 TTF、OTF、WOFF、EOT 等。因为 Sorts Mill Goudy 发行过 <ruby>WOFF<rt>Web Open Font Format</rt></ruby>（互联网开放字体格式，Mozilla 参与了部分开发）版本，所以下文中我会用它来做例子。当然，其它字体的方法也是一样的。

假设你想在你的网站上使用 [Sorts Mill Goudy][8] 这个字体：

1、将字体文件 `GoudyStM-webfont.woff` 上传至你的服务器：

```
scp GoudyStM-webfont.woff seth@example.com:~/www/fonts/
```

你的主机可能带有像 cPanel 这样的图形化工具，通过它们上传也是一样的。

2、在你网站的 CSS 文件中，添加 `@font-face` 语句，添加后应该和这个差不多：

```
@font-face { 
  font-family: "titlefont";
  src: url("../fonts/GoudyStM-webfont.woff"); 
}
```

`font-family` 的值是你来决定的。这是一个易于理解的名字，它用于放在使用字体名的地方。我在这里使用 “titlefont” 作为例子，是因为我希望它被用来显示标题字体。你也可以使用 “officialfont” 和 “myfont” 这样的名字。

`src` 值是你字体文件的路径。这是你服务器上字体的路径。在这里，我用 `fonts` 目录来作为示例，它和 `css` 在一个文件夹里。你服务器的文件结构可能和我的不一样，所以你需要调整一下这个路径。记住一点，一个点意味着*工作目录*，两个点则代表*父目录*。

3、现在，你已经定义了字体的名字和目录，你可以在任何指定的 CSS 类或 ID 来调用它了。举个例子，如果你希望以 Sorts Mill Goudy 字体来渲染 `<h1>`，只需要在 CSS 规则中加入你自己的字体名称：

```
h1 { font-family: "titlefont", serif; }
```

现在，你已经成功地托管并使用你自己的字体了。

![在线字体的实际效果][10]

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/webfonts

作者：[Seth Kenlon (Red Hat, Community Moderator)][a]
选题：[lujun9972][b]
译者：[zhs852](https://github.com/zhs852)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life_typography_fonts.png?itok=Q1jMys5G (Open source fonts)
[2]: https://docs.microsoft.com/en-us/typography/fonts/font-faq
[3]: https://www.theleagueofmoveabletype.com/
[4]: https://fontlibrary.org/
[5]: https://www.omnibus-type.com
[6]: https://github.com/googlefonts
[7]: https://github.com/adobe-fonts
[8]: https://www.theleagueofmoveabletype.com/sorts-mill-goudy
[9]: /file/426056
[10]: https://opensource.com/sites/default/files/uploads/webfont.jpg (Web fonts on a website)

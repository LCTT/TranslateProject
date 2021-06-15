[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13052-1.html)
[#]: subject: (Make websites more readable with a shell script)
[#]: via: (https://opensource.com/article/19/2/make-websites-more-readable-shell-script)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)

利用 Shell 脚本让网站更具可读性
======

> 测算网站的文本和背景之间的对比度，以确保站点易于阅读。

![](https://img.linux.net.cn/data/attachment/album/202101/25/231152ce5ufhjtufxj1eeu.jpg)

如果希望人们发现你的网站实用，那么他们需要能够阅读它。为文本选择的颜色可能会影响网站的可读性。不幸的是，网页设计中的一种流行趋势是在打印输出文本时使用低对比度的颜色，就像在白色背景上的灰色文本。对于 Web 设计师来说，这也许看起来很酷，但对于许多阅读它的人来说确实很困难。

W3C 提供了《<ruby>Web 内容可访问性指南<rt>Web Content Accessibility Guidelines</rt></ruby>》，其中包括帮助 Web 设计人员选择易于区分文本和背景色的指导。z这就是所谓的“<ruby>对比度<rt>contrast ratio</rt></ruby>”。 W3C 定义的对比度需要进行一些计算：给定两种颜色，首先计算每种颜色的相对亮度，然后计算对比度。对比度在 1 到 21 的范围内（通常写为 1:1 到 21:1）。对比度越高，文本在背景下的突出程度就越高。例如，白色背景上的黑色文本非常醒目，对比度为 21:1。对比度为 1:1 的白色背景上的白色文本不可读。

[W3C 说，正文][1] 的对比度至少应为 4.5:1，标题至少应为 3:1。但这似乎是最低限度的要求。W3C 还建议正文至少 7:1，标题至少 4.5:1。

计算对比度可能比较麻烦，因此最好将其自动化。我已经用这个方便的 Bash 脚本做到了这一点。通常，脚本执行以下操作：

  1. 获取文本颜色和背景颜色
  2. 计算相对亮度
  3. 计算对比度

### 获取颜色

你可能知道显示器上的每种颜色都可以用红色、绿色和蓝色（R、G 和 B）来表示。要计算颜色的相对亮度，脚本需要知道颜色的红、绿和蓝的各个分量。理想情况下，脚本会将这些信息读取为单独的 R、G 和 B 值。 Web 设计人员可能知道他们喜欢的颜色的特定 RGB 代码，但是大多数人不知道不同颜色的 RGB 值。作为一种替代的方法是，大多数人通过 “red” 或 “gold” 或 “maroon” 之类的名称来引用颜色。

幸运的是，GNOME 的 [Zenity][2] 工具有一个颜色选择器应用程序，可让你使用不同的方法选择颜色，然后用可预测的格式 `rgb(R,G,B)` 返回 RGB 值。使用 Zenity 可以轻松获得颜色值：

```
color=$( zenity --title 'Set text color' --color-selection --color='black' )
```

如果用户（意外地）单击 “Cancel（取消）” 按钮，脚本将假定一种颜色：

```
if [ $? -ne 0 ] ; then
        echo '** color canceled .. assume black'
        color='rgb(0,0,0)'
fi
```

脚本对背景颜色值也执行了类似的操作，将其设置为 `$background`。

### 计算相对亮度

一旦你在 `$color` 中设置了前景色，并在 `$background` 中设置了背景色，下一步就是计算每种颜色的相对亮度。 [W3C 提供了一个算法][3] 用以计算颜色的相对亮度。

> 对于 sRGB 色彩空间，一种颜色的相对亮度定义为：
>
>  L = 0.2126 * R + 0.7152 * G + 0.0722 * B 
> 
>  R、G 和 B 定义为：
>
> if $R_{sRGB}$ <= 0.03928 then R = $R_{sRGB}$/12.92
> 
> else R = (($R_{sRGB}$+0.055)/1.055) $^{2.4}$
>
> if $G_{sRGB}$ <= 0.03928 then G = $G_{sRGB}$/12.92
> 
> else G = (($G_{sRGB}$+0.055)/1.055) $^{2.4}$
>
> if $B_{sRGB}$ <= 0.03928 then B = $B_{sRGB}$/12.92
> 
> else B = (($B_{sRGB}$+0.055)/1.055) $^{2.4}$
>
> $R_{sRGB}$、$G_{sRGB}$ 和 $B_{sRGB}$ 定义为：
>
> $R_{sRGB}$ = $R_{8bit}$/255
>
> $G_{sRGB}$ = $G_{8bit}$/255
>
> $B_{sRGB}$ = $B_{8bit}$/255

由于 Zenity 以 `rgb(R,G,B)` 的格式返回颜色值，因此脚本可以轻松拉取分隔开的 R、B 和 G 的值以计算相对亮度。AWK 可以使用逗号作为字段分隔符（`-F,`），并使用 `substr()` 字符串函数从 `rgb(R,G,B)` 中提取所要的颜色值：

```
R=$( echo $color | awk -F, '{print substr($1,5)}' )
G=$( echo $color | awk -F, '{print $2}' )
B=$( echo $color | awk -F, '{n=length($3); print substr($3,1,n-1)}' )
```

*有关使用 AWK 提取和显示数据的更多信息，[查看 AWK 备忘表][4]*

最好使用 BC 计算器来计算最终的相对亮度。BC 支持计算中所需的简单 `if-then-else`，这使得这一过程变得简单。但是由于 BC 无法使用非整数指数直接计算乘幂，因此需要使用自然对数替代它做一些额外的数学运算：

```
echo "scale=4
rsrgb=$R/255
gsrgb=$G/255
bsrgb=$B/255
if ( rsrgb <= 0.03928 ) r = rsrgb/12.92 else r = e( 2.4 * l((rsrgb+0.055)/1.055) )
if ( gsrgb <= 0.03928 ) g = gsrgb/12.92 else g = e( 2.4 * l((gsrgb+0.055)/1.055) )
if ( bsrgb <= 0.03928 ) b = bsrgb/12.92 else b = e( 2.4 * l((bsrgb+0.055)/1.055) )
0.2126 * r + 0.7152 * g + 0.0722 * b" | bc -l
```

这会将一些指令传递给 BC，包括作为相对亮度公式一部分的 `if-then-else` 语句。接下来 BC 打印出最终值。

### 计算对比度

利用文本颜色和背景颜色的相对亮度，脚本就可以计算对比度了。 [W3C 确定对比度][5] 是使用以下公式：

> (L1 + 0.05) / (L2 + 0.05)，这里的
> L1 是颜色较浅的相对亮度，
> L2 是颜色较深的相对亮度。

给定两个相对亮度值 `$r1` 和 `$r2`，使用 BC 计算器很容易计算对比度：

```
echo "scale=2
if ( $r1 > $r2 ) { l1=$r1; l2=$r2 } else { l1=$r2; l2=$r1 }
(l1 + 0.05) / (l2 + 0.05)" | bc
```

使用 `if-then-else` 语句确定哪个值（`$r1` 或 `$r2`）是较浅还是较深的颜色。BC 执行结果计算并打印结果，脚本可以将其存储在变量中。

### 最终脚本

通过以上内容，我们可以将所有内容整合到一个最终脚本。 我使用 Zenity 在文本框中显示最终结果：

```
#!/bin/sh
# script to calculate contrast ratio of colors

# read color and background color:
# zenity returns values like 'rgb(255,140,0)' and 'rgb(255,255,255)'

color=$( zenity --title 'Set text color' --color-selection --color='black' )
if [ $? -ne 0 ] ; then
        echo '** color canceled .. assume black'
        color='rgb(0,0,0)'
fi

background=$( zenity --title 'Set background color' --color-selection --color='white' )
if [ $? -ne 0 ] ; then
        echo '** background canceled .. assume white'
        background='rgb(255,255,255)'
fi

# compute relative luminance:

function luminance()
{
        R=$( echo $1 | awk -F, '{print substr($1,5)}' )
        G=$( echo $1 | awk -F, '{print $2}' )
        B=$( echo $1 | awk -F, '{n=length($3); print substr($3,1,n-1)}' )

        echo "scale=4
rsrgb=$R/255
gsrgb=$G/255
bsrgb=$B/255
if ( rsrgb <= 0.03928 ) r = rsrgb/12.92 else r = e( 2.4 * l((rsrgb+0.055)/1.055) )
if ( gsrgb <= 0.03928 ) g = gsrgb/12.92 else g = e( 2.4 * l((gsrgb+0.055)/1.055) )
if ( bsrgb <= 0.03928 ) b = bsrgb/12.92 else b = e( 2.4 * l((bsrgb+0.055)/1.055) )
0.2126 * r + 0.7152 * g + 0.0722 * b" | bc -l
}

lum1=$( luminance $color )
lum2=$( luminance $background )

# compute contrast

function contrast()
{
        echo "scale=2
if ( $1 > $2 ) { l1=$1; l2=$2 } else { l1=$2; l2=$1 }
(l1 + 0.05) / (l2 + 0.05)" | bc
}

rel=$( contrast $lum1 $lum2 )

# print results

( cat<<EOF
Color is $color on $background

Contrast ratio is $rel
Contrast ratios can range from 1 to 21 (commonly written 1:1 to 21:1).

EOF

if [ ${rel%.*} -ge 4 ] ; then
        echo "Ok for body text"
else
        echo "Not good for body text"
fi
if [ ${rel%.*} -ge 3 ] ; then
        echo "Ok for title text"
else
        echo "Not good for title text"
fi

cat<<EOF

W3C 说明：

1.4.3 对比度（最小值）：文本和文本图像的视觉呈现方式的对比度至少为 4.5：1，但以下情况除外：（AA 级）

    大文本：大文本和大文本图像的对比度至少为 3:1；

    附带说明：作为非活动用户界面组件一部分，纯装饰的，任何人都不可见或图片的一部分包含特定的其他可视内容的文本或文本图像没有对比度要求。

    小示意图：徽标或商标名称中的文本没有最低对比度要求。

1.4.6 对比度（增强）：文本和文本图像的视觉表示具有至少 7:1 的对比度，但以下情况除外：（AAA 级）

    大文本：大文本和大文本图像的对比度至少为 4.5:1；

    附带说明：作为非活动用户界面组件一部分，纯装饰的，任何人都不可见或图片的一部分包含特定的其他可视内容的文本或文本图像没有对比度要求。
 
    小示意图：徽标或商标名称中的文本没有最低对比度要求。
EOF
) | zenity --text-info --title='Relative Luminance' --width=800 --height=600
```

最后，我希望提供有关 W3C 建议的参考信息，以提醒自己。

Zenity 颜色选择器完成了所有解释颜色的艰苦工作，用户可以通过单击色轮或输入值来选择颜色。 Zenity 接受网站上使用的标准十六进制颜色值，例如 `＃000000` 或 `＃000`或 `rgb(0,0,0)`（所有这些均为黑色）。这是白色背景上的黑色文本的示例计算：

![](https://opensource.com/sites/default/files/uploads/zenity_screenshot1-a.png)

![](https://opensource.com/sites/default/files/uploads/zenity_screenshot1-b.png)

![](https://opensource.com/sites/default/files/uploads/relativeluminescence1-result.png)

Zenity 还识别标准的颜色名称，如“cadetblue”、“orange”或“gold”。在Zenity 中输入颜色名称，然后点击 `Tab` 键，Zenity 会将颜色名称转换为十六进制颜色值，如以下示例中对金色背景上的黑色文本的计算：

![](https://opensource.com/sites/default/files/uploads/zenity_screenshot2-a-name.png)

![](https://opensource.com/sites/default/files/uploads/zenity_screenshot2-a-value.png)

![](https://opensource.com/sites/default/files/uploads/zenity_screenshot2-b-name.png)

![](https://opensource.com/sites/default/files/uploads/zenity_screenshot2-b-value.png)

![](https://opensource.com/sites/default/files/uploads/relativeluminescence2-result.png)

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/make-websites-more-readable-shell-script

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://www.w3.org/TR/2008/REC-WCAG20-20081211/#visual-audio-contrast
[2]: https://wiki.gnome.org/Projects/Zenity
[3]: https://www.w3.org/TR/2008/REC-WCAG20-20081211/#relativeluminancedef
[4]: https://opensource.com/article/18/7/cheat-sheet-awk
[5]: https://www.w3.org/TR/2008/REC-WCAG20-20081211/#contrast-ratiodef

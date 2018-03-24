用Python解析HTML
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus_html_code.png?itok=VjUmGsnl)

图片由Jason Baker为Opensource.com所作。

作为Scribus文档团队的长期成员，我随时了解最新的源代码更新，以便对文档进行更新和补充。 我最近在刚升级到Fedora 27系统的计算机上使用Subversion进行“checkout”操作时，对于文档下载所需要的时间我感到很惊讶，文档由HTML页面和相关图像组成。 我担心该项目的文档看起来比项目本身大得多，并且怀疑其中的一些内容是“僵尸”文档——不会再使用的HTML文件以及HTML中无法访问到的图像。

我决定为自己创建一个项目来解决这个问题。 一种方法是搜索未使用的现有图像文件。 如果我可以扫描所有HTML文件中的图像引用，然后将该列表与实际图像文件进行比较，那么我可能会看到不匹配的文件。

这是一个典型的图像标签：
```
<img src="images/edit_shapes.png" ALT="Edit examples" ALIGN=left>
```

我对第一组引号之间的部分很感兴趣，在src =之后。 寻找解决方案后，我找到一个名为[BeautifulSoup][1]的Python模块。 脚本的核心部分如下所示：

```
soup = BeautifulSoup(all_text, 'html.parser')
match = soup.findAll("img")
if len(match) > 0:
    for m in match:
        imagelist.append(str(m))
```

我们可以使用这个`findAll` 方法来挖出图片标签。 这是一小部分输出：

```
<img src="images/pdf-form-ht3.png"/><img src="images/pdf-form-ht4.png"/><img src="images/pdf-form-ht5.png"/><img src="images/pdf-form-ht6.png"/><img align="middle" alt="GSview - Advanced Options Panel" src="images/gsadv1.png" title="GSview - Advanced Options Panel"/><img align="middle" alt="Scribus External Tools Preferences" src="images/gsadv2.png" title="Scribus External Tools Preferences"/>
```

到现在为止还挺好。我原以为下一步就可以搞定了，但是当我在脚本中尝试了一些字符串方法时，它返回了有关标记的错误而不是字符串的错误。 我将输出保存到一个文件中，并在[KWrite][2]中进行编辑。 KWrite的一个好处是你可以使用正则表达式（regex）来做“查找和替换”操作，所以我可以用`\n<img` 替换 `<img`，这样可以看得更清楚。 KWrite的另一个好处是，如果你用正则表达式做了一个不明智的选择，你还可以撤消。

但我认为，肯定有比这更好的东西，所以我转而使用正则表达式，或者更具体地说Python的 `re` 模块。 这个新脚本的相关部分如下所示：

```
match = re.findall(r'src="(.*)/>', all_text)
if len(match)>0:
    for m in match:
        imagelist.append(m)
```

它的一小部分输出如下所示：
```
images/cmcanvas.png" title="Context Menu for the document canvas" alt="Context Menu for the document canvas" /></td></tr></table><br images/eps-imp1.png" title="EPS preview in a file dialog" alt="EPS preview in a file dialog" images/eps-imp5.png" title="Colors imported from an EPS file" alt="Colors imported from an EPS file" images/eps-imp4.png" title="EPS font substitution" alt="EPS font substitution" images/eps-imp2.png" title="EPS import progress" alt="EPS import progress" images/eps-imp3.png" title="Bitmap conversion failure" alt="Bitmap conversion failure"
```

乍一看，它看起来与上面的输出类似，并且附带有修剪部分图像标签的好处，但是有令人费解的是还夹杂着表格标签和其他内容。 我认为这涉及到这个正则表达式`src="(.*)/>`，这被称为贪婪，意味着它不一定停止在遇到`/>`的第一个实例。我应该补充一点，我也尝试过`src="(.*)"`，这真的没有什么更好的效果，不是一个正则表达式专家（只是做了这个），我找了各种方法来改进这一点但是并没什么用。

做了一系列的事情之后，甚至尝试了Perl的`HTML::Parser`模块，最终我试图将这与我为Scribus编写的一些脚本进行比较，这些脚本逐个字符的分析文本内容，然后采取一些行动。 为了最终目的，我终于想出了所有这些方法，并且完全不需要正则表达式或HTML解析器。 让我们回到展示的那个`img`标签的例子。

```
<img src="images/edit_shapes.png" ALT="Edit examples" ALIGN=left>
```

我决定回到`src=`这一块。 一种方法是等待`s`出现，然后看下一个字符是否是`r`，下一个是`c`，下一个是否`=`。 如果是这样，那就匹配上了！ 那么两个双引号之间的内容就是我所需要的。 这种方法的问题在于需要连续识别上面这样的结构。 一种查看代表一行HTML文本的字符串的方法是：

```
for c in all_text:
```

但是这个逻辑太乱了，以至于不能持续匹配到前面的`c`，还有之前的字符，更之前的字符，更更之前的字符。

最后，我决定专注于`=`并使用索引方法，以便我可以轻松地引用字符串中的任何先前或将来的字符。 这里是搜索部分：

```
    index = 3
    while index < linelength:
        if (all_text[index] == '='):
            if (all_text[index-3] == 's') and (all_text[index-2] == 'r') and (all_text[index-1] == 'c'):
                imagefound(all_text, imagelist, index)
                index += 1
            else:
                index += 1
        else:
            index += 1
```

我用第四个字符开始搜索（索引从0开始），所以我在下面没有出现索引错误，并且实际上，在每一行的第四个字符之前不会有等号。 第一个测试是看字符串中是否出现了`=`，如果没有，我们就会前进。 如果我们确实看到一个等号，那么我们会看前三个字符是否是`s`，`r`和`c`。 如果全都匹配了，就调用函数`imagefound`：

```
def imagefound(all_text, imagelist, index):
    end = 0
    index += 2
    newimage = ''
    while end == 0:
        if (all_text[index] != '"'):
            newimage = newimage + all_text[index]
            index += 1
        else:
            newimage = newimage + '\n'
            imagelist.append(newimage)
            end = 1
            return
```

我们正在给函数发送当前索引，它代表着`=`。 我们知道下一个字符将会是`"`，所以我们跳过两个字符，并开始向名为`newimage`的控制字符串添加字符，直到我们发现下一个`"`，此时我们完成了一次匹配。 我们将字符串加一个`换行`符添加到列表`imagelist`中并`返回`，请记住，在剩余的这个HTML字符串中可能会有更多图片标签，所以我们马上回到搜索循环的中间。

以下是我们的输出现在的样子：
```
images/text-frame-link.png
images/text-frame-unlink.png
images/gimpoptions1.png
images/gimpoptions3.png
images/gimpoptions2.png
images/fontpref3.png
images/font-subst.png
images/fontpref2.png
images/fontpref1.png
images/dtp-studio.png
```

啊，干净多了，而这只花费几秒钟的时间。 我本可以将索引前移7步来剪切`images/`部分，但我更愿意把这个部分保存下来，确保我没有切片掉图像文件名的第一个字母，这很容易用KWrite编辑成功- - 你甚至不需要正则表达式。 做完这些并保存文件后，下一步就是运行我编写的另一个脚本`sortlist.py`：

```
#!/usr/bin/env python
# -*- coding: utf-8  -*-
# sortlist.py

import os

imagelist = []
for line in open('/tmp/imagelist_parse4.txt').xreadlines():
    imagelist.append(line)
   
imagelist.sort()

outfile = open('/tmp/imagelist_parse4_sorted.txt', 'w')
outfile.writelines(imagelist)
outfile.close()
```

这会读取文件内容，并存储为列表，对其排序，然后另存为另一个文件。 之后，我可以做到以下几点：

```
ls /home/gregp/development/Scribus15x/doc/en/images/*.png > '/tmp/actual_images.txt'
```

然后我需要在该文件上运行`sortlist.py`，因为`ls`方法的排序与Python不同。 我原本可以在这些文件上运行比较脚本，但我更愿意以可视方式进行操作。 最后，我成功找到了42个图像，这些图像没有来自文档的HTML引用。

这是我的完整解析脚本：
```
#!/usr/bin/env python
# -*- coding: utf-8  -*-
# parseimg4.py

import os

def imagefound(all_text, imagelist, index):
    end = 0
    index += 2
    newimage = ''
    while end == 0:
        if (all_text[index] != '"'):
            newimage = newimage + all_text[index]
            index += 1
        else:
            newimage = newimage + '\n'
            imagelist.append(newimage)
            end = 1
            return
       
htmlnames = []
imagelist = []
tempstring = ''
filenames = os.listdir('/home/gregp/development/Scribus15x/doc/en/')
for name in filenames:
    if name.endswith('.html'):
        htmlnames.append(name)
#print htmlnames
for htmlfile in htmlnames:
    all_text = open('/home/gregp/development/Scribus15x/doc/en/' + htmlfile).read()
    linelength = len(all_text)
    index = 3
    while index < linelength:
        if (all_text[index] == '='):
            if (all_text[index-3] == 's') and (all_text[index-2] == 'r') and
(all_text[index-1] == 'c'):
                imagefound(all_text, imagelist, index)
                index += 1
            else:
                index += 1
        else:
            index += 1

outfile = open('/tmp/imagelist_parse4.txt', 'w')
outfile.writelines(imagelist)
outfile.close()
imageno = len(imagelist)
print str(imageno) + " images were found and saved"
```

脚本名称为`parseimg4.py`，这并不能真实反映我陆续编写的脚本数量，包括微调的和大改的以及丢弃并重新开始写的。 请注意，我已经对这些目录和文件名进行了硬编码，但是总结起来很容易，要求用户输入这些信息。 同样，因为它们是工作脚本，所以我将输出发送到 `/tmp`目录，所以一旦重新启动系统，它们就会消失。

这不是故事的结尾，因为下一个问题是：僵尸HTML文件怎么办？ 任何未使用的文件都可能会引用到前面比对方法没有提取到的图像。 我们有一个`menu.xml`文件作为联机手册的目录，但我还需要考虑TOC（译者注：TOC是table of contents的缩写）中列出的某些文件可能引用了不在TOC中的文件，是的，我确实找到了一些这样的文件。

最后我可以说，这是一个比图像搜索更简单的任务，而且开发的过程对我有很大的帮助。


### About the author

 [![](https://opensource.com/sites/default/files/styles/profile_pictures/public/20150529_gregp.jpg?itok=nv02g6PV)][7] Greg Pittman - Greg是Kentucky州Louisville市的一名退休的神经学家，从二十世纪六十年代的Fortran IV语言开始长期以来对计算机和编程有着浓厚的兴趣。 当Linux和开源软件出现的时候，Greg深受启发，去学习更多只是，并实现最终贡献的承诺。 他是Scribus团队的成员。[更多关于我][8]

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/parsing-html-python

作者：[Greg Pittman][a]
译者：[Flowsnow](https://github.com/Flowsnow)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/greg-p
[1]:https://www.crummy.com/software/BeautifulSoup/
[2]:https://www.kde.org/applications/utilities/kwrite/
[7]:https://opensource.com/users/greg-p
[8]:https://opensource.com/users/greg-p

[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10717-1.html)
[#]: subject: (Using Square Brackets in Bash: Part 1)
[#]: via: (https://www.linux.com/blog/2019/3/using-square-brackets-bash-part-1)
[#]: author: (Paul Brown https://www.linux.com/users/bro66)

在 Bash 中使用[方括号] （一）
======

![square brackets][1]

> 这篇文章将要介绍方括号及其在命令行中的不同用法。

看完[花括号在命令行中的用法][3]之后，现在我们继续来看方括号（`[]`）在上下文中是如何发挥作用的。

### 通配

方括号最简单的用法就是通配。你可能在知道“<ruby><rt>Globbing</rt></ruby>”这个概念之前就已经通过通配来匹配内容了，列出具有相同特征的多个文件就是一个很常见的场景，例如列出所有 JPEG 文件：

```
ls *.jpg
```

使用<ruby>通配符<rt>wildcard</rt></ruby>来得到符合某个模式的所有内容，这个过程就叫通配。

在上面的例子当中，星号（`*`）就代表“0 个或多个字符”。除此以外，还有代表“有且仅有一个字符”的问号（`?`）。因此

```
ls d*k*
```

可以列出 `darkly` 和 `ducky`，而且 `dark` 和 `duck` 也是可以被列出的，因为 `*` 可以匹配 0 个字符。而

```
ls d*k?
```

则只能列出 `ducky`，不会列出 `darkly`、`dark` 和 `duck`。

方括号也可以用于通配。为了便于演示，可以创建一个用于测试的目录，并在这个目录下创建文件：

```
touch file0{0..9}{0..9}
```

（如果你还不清楚上面这个命令的原理，可以看一下[另一篇介绍花括号的文章][3]）

执行上面这个命令之后，就会创建 `file000`、`file001`、……、`file099` 这 100 个文件。

如果要列出这些文件当中第二位数字是 7 或 8 的文件，可以执行：

```
ls file0[78]?
```

如果要列出 `file022`、`file027`、`file028`、`file052`、`file057`、`file058`、`file092`、`file097`、`file098`，可以执行：

```
ls file0[259][278]
```

当然，不仅仅是 `ls`，很多其它的命令行工具都可以使用方括号来进行通配操作。但在删除文件、移动文件、复制文件的过程中使用通配，你需要有一点横向思维。

例如将 `file010` 到 `file029` 这 30 个文件复制成 `archive010` 到 `archive029` 这 30 个副本，不可以这样执行：

```
cp file0[12]? archive0[12]?
```

因为通配只能针对已有的文件，而 `archive` 开头的文件并不存在，不能进行通配。

而这条命令

```
cp file0[12]? archive0[1..2][0..9]
```

也同样不行，因为 `cp` 并不允许将多个文件复制到多个文件。在复制多个文件的情况下，只能将多个文件复制到一个指定的目录下：

```
mkdir archive
cp file0[12]? archive
```

这条命令是可以正常运行的，但它只会把这 30 个文件以同样的名称复制到 `archive/` 目录下，而这并不是我们想要的效果。

如果你阅读过我[关于花括号的文章][3]，你大概会记得可以使用 `%` 来截掉字符串的末尾部分，而使用 `#` 则可以截掉字符串的开头部分。

例如：

```
myvar="Hello World"
echo Goodbye Cruel ${myvar#Hello}
```

就会输出 `Goodbye Cruel World`，因为 `#Hello` 将 `myvar` 变量中开头的 `Hello` 去掉了。

在通配的过程中，也可以使用这一个技巧。

```
for i in file0[12]?;\
do\
cp $i archive${i#file};\
done
```

上面的第一行命令告诉 Bash 需要对所有 `file01` 开头或者 `file02` 开头，且后面只跟一个任意字符的文件进行操作，第二行的 `do` 和第四行的 `done` 代表需要对这些文件都执行这一块中的命令。

第三行就是实际的复制操作了，这里使用了两次 `$i` 变量：第一次在 `cp` 命令中直接作为源文件的文件名使用，第二次则是截掉文件名开头的 `file` 部分，然后在开头补上一个 `archive`，也就是这样：

```
"archive" + "file019" - "file" = "archive019"
```

最终整个 `cp` 命令展开为：

```
cp file019 archive019
```

最后，顺带说明一下反斜杠 `\` 的作用是将一条长命令拆分成多行，这样可以方便阅读。

在下一节，我们会了解方括号的更多用法，敬请关注。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/2019/3/using-square-brackets-bash-part-1

作者：[Paul Brown][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/bro66
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/square-gabriele-diwald-475007-unsplash.jpg?itok=cKmysLfd "square brackets"
[2]: https://www.linux.com/LICENSES/CATEGORY/CREATIVE-COMMONS-ZERO
[3]: https://linux.cn/article-10624-1.html


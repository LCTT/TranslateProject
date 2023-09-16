[#]: subject: "In a git repository, where do your files live?"
[#]: via: "https://jvns.ca/blog/2023/09/14/in-a-git-repository--where-do-your-files-live-/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16198-1.html"

在 Git 仓库中，文件究竟被存储在哪里？
======

![][0]

大家好！今天我和一个朋友讨论 Git 的工作原理，我们感到奇怪，Git 是如何存储你的文件的？我们知道它存储在 `.git` 目录中，但具体到 `.git` 中的哪个位置，各个版本的历史文件又被存储在哪里呢？

以这个博客为例，其文件存储在一个 Git 仓库中，其中有一个文件名为 `content/post/2019-06-28-brag-doc.markdown`。这个文件在我的 `.git` 文件夹中具体的位置在哪里？过去的文件版本又被存储在哪里？那么，就让我们通过编写一些简短的 Python 代码来探寻答案吧。

### Git 把文件存储在 .git/objects 之中

你的仓库中，每一个文件的历史版本都被储存在 `.git/objects` 中。比如，对于这个博客，`.git/objects` 包含了 2700 多个文件。

```
$ find .git/objects/ -type f | wc -l
2761
```

> 注意：`.git/objects` 包含的信息，不仅仅是 “仓库中每一个文件的所有先前版本”，但我们暂不详细讨论这一内容。

这里是一个简短的 Python 程序（[find-git-object.py][1]），它可以帮助我们定位在 `.git/objects` 中的特定文件的具体位置。

```
import hashlib
import sys

def object_path(content):
    header = f"blob {len(content)}\0"
    data = header.encode() + content
    sha1 = hashlib.sha1()
    sha1.update(data)
    digest = sha1.hexdigest()
    return f".git/objects/{digest[:2]}/{digest[2:]}"

with open(sys.argv[1], "rb") as f:
    print(object_path(f.read()))
```

此程序的主要操作如下：

  * 读取文件内容
  * 计算一个头部（`blob 16673\0`），并将其与文件内容合并
  * 计算出文件的 sha1 校验和（此处为 `e33121a9af82dd99d6d706d037204251d41d54`）
  * 将这个 sha1 校验和转换为路径（如 `.git/objects/e3/3121a9af82dd99d6d706d037204251d41d54`）

运行的方法如下：

```
$ python3 find-git-object.py content/post/2019-06-28-brag-doc.markdown
.git/objects/8a/e33121a9af82dd99d6d706d037204251d41d54
```

### 术语解释：“内容寻址存储”

这种存储策略的术语为“<ruby>内容寻址存储<rt>content addressed storage</rt></ruby>”，它指的是对象在数据库中的文件名与文件内容的哈希值相同。

内容寻址存储的有趣之处就是，假设我有两份或许多份内容完全相同的文件，在 Git 的数据库中，并不会因此占用额外空间。如果内容的哈希值是 `aabbbbbbbbbbbbbbbbbbbbbbbbb`，它们都会被存储在 `.git/objects/aa/bbbbbbbbbbbbbbbbbbbbb` 中。

### 这些对象是如何进行编码的？

如果我尝试在 `.git/objects` 目录下查看这个文件，显示的内容似乎有一些奇怪：

```
$ cat .git/objects/8a/e33121a9af82dd99d6d706d037204251d41d54
x^A<8D><9B>}s<E3>Ƒ<C6><EF>o|<8A>^Q<9D><EC>ju<92><E8><DD><9C><9C>*<89>j<FD>^...
```

这是怎么回事呢？让我们来运行 `file` 命令检查一下：

```
$ file .git/objects/8a/e33121a9af82dd99d6d706d037204251d41d54
.git/objects/8a/e33121a9af82dd99d6d706d037204251d41d54: zlib compressed data
```

原来，它是压缩的！我们可以编写一个小巧的 Python 程序—— `decompress.py`，然后用 `zlib` 模块去解压这些数据：

```
import zlib
import sys

with open(sys.argv[1], "rb") as f:
    content = f.read()
    print(zlib.decompress(content).decode())
```

让我们来解压一下看看结果：

```
$ python3 decompress.py .git/objects/8a/e33121a9af82dd99d6d706d037204251d41d54
blob 16673---
title: "Get your work recognized: write a brag document"
date: 2019-06-28T18:46:02Z
url: /blog/brag-documents/
categories: []
---
... the entire blog post ...
```

结果显示，这些数据的编码方式非常简单：首先有 `blob 16673\0` 标识，其后就是文件的全部内容。

### 这里并没有差异性数据（diff）

这里有一件我第一次知道时让我感到惊讶的事：这里并没有任何差异性数据！那个文件是该篇博客文章的第 9 个版本，但 Git 在 `.git/objects` 目录中存储的版本是完整文件内容，而并非与前一版本的差异。

尽管 Git 实际上有时候会以差异性数据存储文件（例如，当你运行 `git gc` 时，为了提升效率，它可能会将多个不同的文件封装成 “打包文件”），但在我个人经验中，我从未需要关注这个细节，所以我们不在此深入讨论。然而，关于这种格式如何工作，Aditya Mukerjee 有篇优秀的文章 《[拆解 Git 的打包文件][2]》。

### 博客文章的旧版本在哪？

你可能会好奇：如果在我修复了一些错别字之前，这篇博文已经存在了 8 个版本，那它们在 `.git/objects` 目录中的位置是哪里？我们如何找到它们呢？

首先，我们来使用 `git log` 命令来查找改动过这个文件的每一个提交：

```
$ git log --oneline  content/post/2019-06-28-brag-doc.markdown
c6d4db2d
423cd76a
7e91d7d0
f105905a
b6d23643
998a46dd
67a26b04
d9999f17
026c0f52
72442b67
```

然后，我们选择一个之前的提交，比如 `026c0f52`。提交也被存储在 `.git/objects` 中，我们可以尝试在那里找到它。但是失败了！因为 `ls .git/objects/02/6c*` 没有显示任何内容！如果有人告诉你，“我们知道有时 Git 会打包对象来节省空间，我们并不需过多关心它”，但现在，我们需要去面对这个问题了。

那就让我们去解决它吧。

### 让我们开始解包一些对象

现在我们需要从打包文件中解包出一些对象。我在 Stack Overflow 上查找了一下，看起来我们可以这样进行操作：

```
$ mv .git/objects/pack/pack-adeb3c14576443e593a3161e7e1b202faba73f54.pack .
$ git unpack-objects < pack-adeb3c14576443e593a3161e7e1b202faba73f54.pack
```

这种直接对库进行手术式的做法让人有些紧张，但如果我误操作了，我还可以从 Github 上重新克隆这个库，所以我并不太担心。

解包所有的对象文件后，我们得到了更多的对象：大约有 20000 个，而不是原来的大约 2700 个。看起来很酷。

```
find .git/objects/ -type f | wc -l
20138
```

### 我们回头再看看提交

现在我们可以继续看看我们的提交 `026c0f52`。我们之前说过 `.git/objects` 中并不都是文件，其中一部分是提交！为了弄清楚我们的旧文章 `content/post/2019-06-28-brag-doc.markdown` 是在哪里被保存的，我们需要深入查看这个提交。

首先，我们需要在 `.git/objects` 中查看这个提交。

### 查看提交的第一步：找到提交

经过解包后，我们现在可以在 `.git/objects/02/6c0f5208c5ea10608afc9252c4a56c1ac1d7e4` 中找到提交 `026c0f52`，我们可以用下面的方法去查看它：

```
$ python3 decompress.py .git/objects/02/6c0f5208c5ea10608afc9252c4a56c1ac1d7e4
commit 211tree 01832a9109ab738dac78ee4e95024c74b9b71c27
parent 72442b67590ae1fcbfe05883a351d822454e3826
author Julia Evans <julia@jvns.ca> 1561998673 -0400
committer Julia Evans <julia@jvns.ca> 1561998673 -0400

brag doc
```

我们也可以用 `git cat-file -p 026c0f52` 命令来获取相同的信息，这个命令能起到相同的作用，但是它在格式化数据时做得更好一些。（`-p` 选项意味着它能够以更友好的方式进行格式化）

### 查看提交的第二步：找到树

这个提交包含一个**树**。树是什么呢？让我们看一下。树的 ID 是 `01832a9109ab738dac78ee4e95024c74b9b71c27`，我们可以使用先前的 `decompress.py` 脚本查看这个 Git 对象，尽管我不得不移除 `.decode()` 才能避免脚本崩溃。

```
$ python3 decompress.py .git/objects/01/832a9109ab738dac78ee4e95024c74b9b71c27
```

这个输出的格式有些难以阅读。主要的问题在于，该提交的哈希（`\xc3\xf7$8\x9b\x8dO\x19/\x18\xb7}|\xc7\xce\x8e…`）是原始字节，而没有进行十六进制的编码，因此我们看到 `\xc3\xf7$8\x9b\x8d` 而非 `c3f76024389b8d`。我打算切换至 `git cat-file -p` 命令，它能以更友好的方式显示数据，我不想自己编写一个解析器。

```
$ git cat-file -p 01832a9109ab738dac78ee4e95024c74b9b71c27
100644 blob c3f76024389b8d4f192f18b77d7cc7ce8e3a68ad	.gitignore
100644 blob 7ebaecb311a05e1ca9a43f1eb90f1c6647960bc1	README.md
100644 blob 0f21dc9bf1a73afc89634bac586271384e24b2c9	Rakefile
100644 blob 00b9d54abd71119737d33ee5d29d81ebdcea5a37	config.yaml
040000 tree 61ad34108a327a163cdd66fa1a86342dcef4518e	content <-- 这是我们接下来的目标
040000 tree 6d8543e9eeba67748ded7b5f88b781016200db6f	layouts
100644 blob 22a321a88157293c81e4ddcfef4844c6c698c26f	mystery.rb
040000 tree 8157dc84a37fca4cb13e1257f37a7dd35cfe391e	scripts
040000 tree 84fe9c4cb9cef83e78e90a7fbf33a9a799d7be60	static
040000 tree 34fd3aa2625ba784bced4a95db6154806ae1d9ee	themes
```

这是我在这次提交时库的根目录中所有的文件。看起来我曾经不小心提交了一个名为 `mystery.rb` 的文件，后来我删除了它。

我们的文件在 `content` 目录中，接下来让我们看看那个树：`61ad34108a327a163cdd66fa1a86342dcef4518e`

### 查看提交的第三步：又一棵树

```
$ git cat-file -p 61ad34108a327a163cdd66fa1a86342dcef4518e
040000 tree 1168078878f9d500ea4e7462a9cd29cbdf4f9a56    about
100644 blob e06d03f28d58982a5b8282a61c4d3cd5ca793005    newsletter.markdown
040000 tree 1f94b8103ca9b6714614614ed79254feb1d9676c    post <-- 我们接下来的目标！
100644 blob 2d7d22581e64ef9077455d834d18c209a8f05302    profiler-project.markdown
040000 tree 06bd3cee1ed46cf403d9d5a201232af5697527bb    projects
040000 tree 65e9357973f0cc60bedaa511489a9c2eeab73c29    talks
040000 tree 8a9d561d536b955209def58f5255fc7fe9523efd    zines
```

还未结束……

### 查看提交的第四步：更多的树……

我们要寻找的文件位于 `post/` 目录，因此我们需要进一步探索：

```
$ git cat-file -p 1f94b8103ca9b6714614614ed79254feb1d9676c
.... 省略了大量行 ...
100644 blob 170da7b0e607c4fd6fb4e921d76307397ab89c1e    2019-02-17-organizing-this-blog-into-categories.markdown
100644 blob 7d4f27e9804e3dc80ab3a3912b4f1c890c4d2432    2019-03-15-new-zine--bite-size-networking-.markdown
100644 blob 0d1b9fbc7896e47da6166e9386347f9ff58856aa    2019-03-26-what-are-monoidal-categories.markdown
100644 blob d6949755c3dadbc6fcbdd20cc0d919809d754e56    2019-06-23-a-few-debugging-resources.markdown
100644 blob 3105bdd067f7db16436d2ea85463755c8a772046    2019-06-28-brag-doc.markdown <-- 我们找到了！！！
```

在此，`2019-06-28-brag-doc.markdown` 之所以位于列表最后，是因为在发布时它是最新的博文。

### 查看提交的第五步：我们终于找到它！

经过努力，我们找到了博文历史版本所在的对象文件！太棒了！它的哈希值是 `3105bdd067f7db16436d2ea85463755c8a772046`，因此它位于 `git/objects/31/05bdd067f7db16436d2ea85463755c8a772046`。

我们可以使用 `decompress.py` 来查看它：

```
$ python3 decompress.py .git/objects/31/05bdd067f7db16436d2ea85463755c8a772046 | head
blob 15924---
title: "Get your work recognized: write a brag document"
date: 2019-06-28T18:46:02Z
url: /blog/brag-documents/
categories: []
---
... 文件的剩余部分在此 ...
```

这就是博文的旧版本！如果我执行命令 `git checkout 026c0f52 content/post/2019-06-28-brag-doc.markdown` 或者 `git restore --source 026c0f52 content/post/2019-06-28-brag-doc.markdown`，我就会获取到这个版本。

### 这样遍历树就是 git log 的运行机制

我们刚刚经历的整个过程（找到提交、逐层遍历目录树、搜索所需文件名）看似繁琐，但实际上当我们执行 `git log content/post/2019-06-28-brag-doc.markdown` 时，背后就是这样在运行。它需要逐个检查你历史记录中的每一个提交，在每个提交中核查 `content/post/2019-06-28-brag-doc.markdown` 的版本（例如在这个案例中为 `3105bdd067f7db16436d2ea85463755c8a772046`），并查看它是否自上一提交以来有所改变。

这就是为什么有时 `git log FILENAME` 会执行的有些缓慢 —— 我的这个仓库中有 3000 个提交，它需要对每个提交做大量的工作，来判断该文件是否在该提交中发生过变化。

### 我有多少个历史版本的文件？

目前，我在我的博客仓库中跟踪了 1530 个文件：

```
$ git ls-files | wc -l
1530
```

但历史文件有多少呢？我们可以列出 `.git/objects` 中所有的内容，看看有多少对象文件：

```
$ find .git/objects/ -type f | grep -v pack | awk -F/ '{print $3 $4}' | wc -l
20135
```

但并不是所有这些都代表过去版本的文件 —— 正如我们之前所见，许多都是提交和目录树。不过，我们可以编写一个小小的 Python 脚本 `find-blobs.py`，遍历所有对象并检查是否以 `blob` 开头：

```
import zlib
import sys

for line in sys.stdin:
    line = line.strip()
    filename = f".git/objects/{line[0:2]}/{line[2:]}"
    with open(filename, "rb") as f:
        contents = zlib.decompress(f.read())
        if contents.startswith(b"blob"):
            print(line)
```

```
$ find .git/objects/ -type f | grep -v pack | awk -F/ '{print $3 $4}' | python3 find-blobs.py | wc -l
6713
```

于是，看起来在我的 Git 仓库中存放的旧文件版本有 `6713 - 1530 = 5183` 个，Git 会为我保存这些文件，以备我想着要恢复它们时使用。太好了！

### 就这些啦！

在 [这个 gist][1] 中附上了全部的此篇文章所用代码，其实没多少。

我以为我已经对 Git 的工作方式了如指掌，但我以前从未真正涉及过打包文件，所以这次探索很有趣。我也很少思考当我让 `git log` 跟踪一个文件的历史时，它实际上有多大的工作量，因此也很开心能深入研究这个。

作为一个有趣的后续：我提交这篇博文后，Git 就警告我仓库中的对象太多（我猜 20,000 太多了！），并运行 `git gc` 将它们全部压缩成打包文件。所以现在我的 `.git/objects` 目录已经被压缩得十分小了：

```
$ find .git/objects/ -type f | wc -l
14
```

*（题图：MJ/319a396c-6f3f-4891-b051-261312c8ea9a）*

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2023/09/14/in-a-git-repository--where-do-your-files-live-/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：ChatGPT
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://gist.github.com/jvns/ff884dceef7660402fe1eca697cfbf51
[2]: https://codewords.recurse.com/issues/three/unpacking-git-packfiles
[0]: https://img.linux.net.cn/data/attachment/album/202309/16/230138n1j44qiabgplgbw4.jpg
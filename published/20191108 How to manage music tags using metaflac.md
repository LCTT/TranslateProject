[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11579-1.html)
[#]: subject: (How to manage music tags using metaflac)
[#]: via: (https://opensource.com/article/19/11/metaflac-fix-music-tags)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansen)

如何使用 metaflac 管理音乐标签
======

> 使用这个强大的开源工具可以在命令行中纠正音乐标签错误。

![](https://img.linux.net.cn/data/attachment/album/201911/16/093629njth88bej8ttekh2.jpg)

很久以来我就将 CD 翻录到电脑。在此期间，我用过几种不同的翻录工具，观察到每种工具在标记上似乎有不同的做法，特别是在保存哪些音乐元数据上。所谓“观察”，我是指音乐播放器似乎按照有趣的顺序对专辑进行排序，它们将一个目录中的曲目分为两张专辑，或者产生了其他令人沮丧的烦恼。

我还看到有些标签非常不明确，许多音乐播放器和标签编辑器没有显示它们。即使这样，在某些极端情况下，它们仍可以使用这些标签来分类或显示音乐，例如播放器将所有包含 XYZ 标签的音乐文件与不包含该标签的所有文件分离到不同的专辑中。

那么，如果标记应用和音乐播放器没有显示“奇怪”的标记，但是它们受到了某种影响，你该怎么办？

### Metaflac 来拯救！

我一直想要熟悉 [metaflac][2]，它是一款开源命令行 [FLAC 文件][3]元数据编辑器，这是我选择的开源音乐文件格式。并不是说 [EasyTAG][4] 这样出色的标签编辑软件有什么问题，但我想起“如果你手上有个锤子……”这句老话（LCTT 译注：指如果你手上有个锤子，那么所有的东西看起来都像钉子。意指人们惯于用熟悉的方式解决问题，而不管合不合适）。另外，从实际的角度来看，带有 [Armbian][5] 和 [MPD][6] 的小型专用服务器，音乐存储在本地、运行精简的仅限音乐的无头环境就可以满足我的家庭和办公室的立体音乐的需求，因此命令行元数据管理工具将非常有用。

下面的截图显示了我的长期翻录过程中产生的典型问题：Putumayo 的哥伦比亚音乐汇编显示为两张单独的专辑，一张包含单首曲目，另一张包含其余 11 首：

![Album with incorrect tags][7]

我使用 `metaflac` 为目录中包含这些曲目的所有 FLAC 文件生成了所有标签的列表：

```
rm -f tags.txt
for f in *.flac; do
        echo $f &gt;&gt; tags.txt
        metaflac --export-tags-to=tags.tmp "$f"
        cat tags.tmp &gt;&gt; tags.txt
        rm tags.tmp
done
```

我将其保存为可执行的 shell 脚本（请参阅我的同事 [David Both][8] 关于 Bash shell 脚本的精彩系列专栏文章，[特别是关于循环这章][9]）。基本上，我在这做的是创建一个文件 `tags.txt`，包含文件名（`echo` 命令），后面是它的所有标签，然后是下一个文件名，依此类推。这是结果的前几行：


```
A Guapi.flac
TITLE=A Guapi
ARTIST=Grupo Bahia
ALBUMARTIST=Various Artists
ALBUM=Putumayo Presents: Colombia
DATE=2001
TRACKTOTAL=12
GENRE=Latin Salsa
MUSICBRAINZ_ALBUMARTISTID=89ad4ac3-39f7-470e-963a-56509c546377
MUSICBRAINZ_ALBUMID=6e096386-1655-4781-967d-f4e32defb0a3
MUSICBRAINZ_ARTISTID=2993268d-feb6-4759-b497-a3ef76936671
DISCID=900a920c
ARTISTSORT=Grupo Bahia
MUSICBRAINZ_DISCID=RwEPU0UpVVR9iMP_nJexZjc_JCc-
COMPILATION=1
MUSICBRAINZ_TRACKID=8a067685-8707-48ff-9040-6a4df4d5b0ff
ALBUMARTISTSORT=50 de Joselito, Los
Cumbia Del Caribe.flac
```

经过一番调查，结果发现我同时翻录了很多 Putumayo CD，并且当时我所使用的所有软件似乎给除了一个之外的所有文件加上了 `MUSICBRAINZ_*` 标签。（是 bug 么？大概吧。我在六张专辑中都看到了。）此外，关于有时不寻常的排序，我注意到，`ALBUMARTISTSORT` 标签将西班牙语标题 “Los” 移到了标题的最后面（逗号之后）。

我使用了一个简单的 `awk` 脚本来列出 `tags.txt` 中报告的所有标签：

```
awk -F= 'index($0,"=") > 0 {print $1}' tags.txt | sort -u
```

这会使用 `=` 作为字段分隔符将所有行拆分为字段，并打印包含等号的行的第一个字段。结果通过使用 `sort` 及其 `-u` 标志来传递，从而消除了输出中的所有重复项（请参阅我的同事 Seth Kenlon 的[关于 `sort` 程序的文章][10]）。对于这个 `tags.txt` 文件，输出为：

```
ALBUM
ALBUMARTIST
ALBUMARTISTSORT
ARTIST
ARTISTSORT
COMPILATION
DATE
DISCID
GENRE
MUSICBRAINZ_ALBUMARTISTID
MUSICBRAINZ_ALBUMID
MUSICBRAINZ_ARTISTID
MUSICBRAINZ_DISCID
MUSICBRAINZ_TRACKID
TITLE
TRACKTOTAL
```

研究一会后，我发现 `MUSICBRAINZ_*` 标签出现在除了一个 FLAC 文件之外的所有文件上，因此我使用 `metaflac` 命令删除了这些标签：

```
for f in *.flac; do metaflac --remove-tag MUSICBRAINZ_ALBUMARTISTID "$f"; done
for f in *.flac; do metaflac --remove-tag MUSICBRAINZ_ALBUMID "$f"; done
for f in *.flac; do metaflac --remove-tag MUSICBRAINZ_ARTISTID "$f"; done
for f in *.flac; do metaflac --remove-tag MUSICBRAINZ_DISCID "$f"; done
for f in *.flac; do metaflac --remove-tag MUSICBRAINZ_TRACKID "$f"; done
```

完成后，我可以使用音乐播放器重建 MPD 数据库。结果如下：

![Album with correct tags][11]

完成了，12 首曲目出现在了一张专辑中。

太好了，我很喜欢 `metaflac`。我希望我会更频繁地使用它，因为我会试图去纠正最后一些我弄乱的音乐收藏标签。强烈推荐！

### 关于音乐

我花了几个晚上在 CBC 音乐（CBC 是加拿大的公共广播公司）上收听 Odario Williams 的节目 After Dark。感谢 Odario，我听到了让我非常享受的 [Kevin Fox 的 Songs for Cello and Voice] [12]。在这里，他演唱了 Eurythmics 的歌曲 “[Sweet Dreams（Are Made of This）][13]”。

我购买了这张 CD，现在它在我的音乐服务器上，还有组织正确的标签！

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/metaflac-fix-music-tags

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/web-design-monitor-website.png?itok=yUK7_qR0 (website design image)
[2]: https://xiph.org/flac/documentation_tools_metaflac.html
[3]: https://xiph.org/flac/index.html
[4]: https://wiki.gnome.org/Apps/EasyTAG
[5]: https://www.armbian.com/
[6]: https://www.musicpd.org/
[7]: https://opensource.com/sites/default/files/uploads/music-tags1_before.png (Album with incorrect tags)
[8]: https://opensource.com/users/dboth
[9]: https://opensource.com/article/19/10/programming-bash-loops
[10]: https://opensource.com/article/19/10/get-sorted-sort
[11]: https://opensource.com/sites/default/files/uploads/music-tags2_after.png (Album with correct tags)
[12]: https://burlingtonpac.ca/events/kevin-fox/
[13]: https://www.youtube.com/watch?v=uyN66XI1zp4

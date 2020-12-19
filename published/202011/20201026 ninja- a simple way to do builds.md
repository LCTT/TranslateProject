[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12798-1.html)
[#]: subject: (ninja: a simple way to do builds)
[#]: via: (https://jvns.ca/blog/2020/10/26/ninja--a-simple-way-to-do-builds/)
[#]: author: (Julia Evans https://jvns.ca/)

ninja：一个简单的构建方式
======

大家好！每隔一段时间，我就会发现一款我非常喜欢的新软件，今天我想说说我最近喜欢的一款软件：[ninja][1]！

### 增量构建很有用

我做了很多小项目，在这些项目中，我想设置增量构建。例如，现在我正在写一本关于 bash 的杂志，杂志的每一页都有一个 `.svg`文件。我需要将 SVG 转换为 PDF，我的做法是这样的：

```
for i in *.svg
do
    svg2pdf $i $i.pdf # or ${i/.svg/.pdf} if you want to get really fancy
done
```

这很好用，但是我的 `svg2pdf` 脚本有点慢（它使用 Inkscape），而且当我刚刚只更新了一页的时候，必须等待 90 秒或者其他什么时间来重建所有的 PDF 文件，这很烦人。

### 构建系统是让人困惑的

在过去，我对使用 `make` 或 `bazel` 这样的构建系统来做我的小项目一直很反感，因为 `bazel` 是个大而复杂的东西，而 `make` 对我来说感觉有点神秘。我真的不想使用它们中的任何一个。

所以很长时间以来，我只是写了一个 bash 脚本或者其他的东西来进行构建，然后就认命了，有时候只能等一分钟。

### ninja 是一个极其简单的构建系统

但 `ninja` 并不复杂！以下是我所知道的关于 ninja 构建文件的语法：创建一个 `rule` 和一个 `build`：

`rule` 有一个命令（`command`）和描述（`description`）参数（描述只是给人看的，所以你可以知道它在构建你的代码时在做什么）。

```
rule svg2pdf
  command = inkscape $in --export-text-to-path --export-pdf=$out
  description = svg2pdf $in $out
```

`build` 的语法是 `build output_file: rule_name input_files`。下面是一个使用 `svg2pdf` 规则的例子。输出在规则中的 `$out` 里，输入在 `$in` 里。

```
build pdfs/variables.pdf: svg2pdf variables.svg
```

这就完成了！如果你把这两个东西放在一个叫 `build.ninja` 的文件里，然后运行 `ninja`，ninja 会运行 `inkscape variables.svg --export-text-to-path --export-pdf=pdfs/variables.pdf`。然后如果你再次运行它，它不会运行任何东西（因为它可以告诉你已经构建了 `pdfs/variables.pdf`，而且是最新的）。

Ninja 还有一些更多的功能（见[手册][2]），但我还没有用过。它最初是[为 Chromium][3] 构建的，所以即使只有一个小的功能集，它也能支持大型构建。

### ninja 文件通常是自动生成的

ninja 的神奇之处在于，你不必使用一些混乱的构建语言，它们很难记住，因为你不经常使用它（比如 `make`），相反，ninja 语言超级简单，如果你想做一些复杂的事情，那么你只需使用任意编程语言生成你想要的构建文件。

我喜欢写一个 `build.py` 文件，或者像这样的文件，创建 ninja 的构建文件，然后运行 `ninja`：

```
with open('build.ninja', 'w') as ninja_file:
    # write some rules
    ninja_file.write("""
rule svg2pdf
  command = inkscape $in --export-text-to-path --export-pdf=$out
  description = svg2pdf $in $out
""")

    # some for loop with every file I need to build
    for filename in things_to_convert:
        ninja_file.write(f"""
build {filename.replace('svg', 'pdf')}: svg2pdf {filename}
""")

# run ninja
import subprocess
subprocess.check_call(['ninja'])
```

我相信有一堆 `ninja` 的最佳实践，但我不知道。对于我的小项目而言，我发现它很好用。

### meson 是一个生成 ninja 文件的构建系统

我对 [Meson][4] 还不太了解，但最近我在构建一个 C 程序 （[plocate][5]，一个比 `locate` 更快的替代方案）时，我注意到它有不同的构建说明，而不是通常的 `./configure; make; make install`：

```
meson builddir
cd builddir
ninja
```

看起来 Meson 是一个可以用 ninja 作为后端的 C/C++/Java/Rust/Fortran 构建系统。

### 就是这些！

我使用 ninja 已经有几个月了。我真的很喜欢它，而且它几乎没有给我带来让人头疼的构建问题，这让我感觉非常神奇。

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2020/10/26/ninja--a-simple-way-to-do-builds/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://ninja-build.org/
[2]: https://ninja-build.org/manual.html
[3]: http://neugierig.org/software/chromium/notes/2011/02/ninja.html
[4]: https://mesonbuild.com/Tutorial.html
[5]: https://blog.sesse.net/blog/tech/2020-09-28-00-37_introducing_plocate

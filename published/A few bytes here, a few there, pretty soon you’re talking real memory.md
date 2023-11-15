[#]: subject: "A few bytes here, a few there, pretty soon you’re talking real memory"
[#]: via: "https://dave.cheney.net/2021/01/05/a-few-bytes-here-a-few-there-pretty-soon-youre-talking-real-memory#easy-footnote-6-4231"
[#]: author: "Dave Cheney https://dave.cheney.net/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "Drwhooooo"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16381-1.html"

这儿几个字节，那里几个字节，我们说的是真正的内存
======

![][0]

今天的帖子来自于最近的 Go 语言的一次小测试，观察下面的测试基础片段 [^1]：

```
func BenchmarkSortStrings(b *testing.B) {
        s := []string{"heart", "lungs", "brain", "kidneys", "pancreas"}
        b.ReportAllocs()
        for i := 0; i < b.N; i++ {
                sort.Strings(s)
        }
}
```

`sort.Strings` 是 `sort.StringSlice(s)` 的便捷包装器，`sort.Strings` 在原地对输入进行排序，因此不会分配内存（或至少 43% 回答此问题的 Twitter 用户是这么认为的）。然而，至少在 Go 的最近版本中，基准测试的每次迭代都会导致一次堆分配。为什么会是这种情况？

正如所有 Go 程序员应该知道的那样，接口是以 [双词结构][c] 实现的。每个接口值包含一个字段，其中保存接口内容的类型，以及指向接口内容的指针。[^2]

在 Go 语言伪代码中，一个接口可能是这样的：

```
type interface struct {
        // the ordinal number for the type of the value
        // assigned to the interface 
        type uintptr

        // (usually) a pointer to the value assigned to
        // the interface
        data uintptr
}
```

`interface.data` 可以容纳一个机器字（在大多数情况下为 8 个字节），但一个 `[]string` 却需要 24 个字节：一个字用于指向切片的底层数组；一个字用于存储切片的长度；另一个字用于存储底层数组的剩余容量。那么，Go 是如何将 24 个字节装入个 8 个字节的呢？通过编程中最古老的技巧，即间接引用。一个 `[]string`，即 `s`，需要 24 个字节；但 `*[]string` —— 即指向字符串切片的指针，只需要 8 个字节。

### 逃逸到堆

为了让示例更加明确，以下是重新编写的基准测试，不使用 `sort.Strings` 辅助函数：

```
func BenchmarkSortStrings(b *testing.B) {
        s := []string{"heart", "lungs", "brain", "kidneys", "pancreas"}
        b.ReportAllocs()
        for i := 0; i < b.N; i++ {
                var ss sort.StringSlice = s
                var si sort.Interface = ss // allocation
                sort.Sort(si)
        }
}
```

为了让接口正常运行，编译器将赋值重写为 `var si sort.Interface = &ss`，即 `ss` 的地址分配给接口值。[^3] 我们现在有这么一种情况：出现一个持有指向 `ss` 的指针的接口值。它指向哪里？还有 `ss` 存储在哪个内存位置？

似乎 `ss` 被移动到了堆上，这也同时导致了基准测试报告中的分配：

```
Total:    296.01MB   296.01MB (flat, cum) 99.66%
      8            .          .           func BenchmarkSortStrings(b *testing.B) { 
      9            .          .           	s := []string{"heart", "lungs", "brain", "kidneys", "pancreas"} 
     10            .          .           	b.ReportAllocs() 
     11            .          .           	for i := 0; i < b.N; i++ { 
     12            .          .           		var ss sort.StringSlice = s 
     13     296.01MB   296.01MB           		var si sort.Interface = ss // allocation 
     14            .          .           		sort.Sort(si) 
     15            .          .           	} 
     16            .          .           } 
```

发生这种分配是因为编译器当前无法确认 `ss` 比 `si` 生存期更长。Go 编译器开发人员对此的普遍态度是，觉得 [这个问题改进的余地][d]，不过我们另找时间再议。事实上，`ss` 就是被分配到了堆上。因此，问题变成了：每次迭代会分配多少个字节？为什么不去询问 `testing` 包呢？

```
% go test -bench=. sort_test.go
goos: darwin
goarch: amd64
cpu: Intel(R) Core(TM) i7-5650U CPU @ 2.20GHz
BenchmarkSortStrings-4          12591951                91.36 ns/op           24 B/op          1 allocs/op
PASS
ok      command-line-arguments  1.260s
```

可以看到，在 amd 64 平台的 Go 1.16 beta1 版本上，每次操作会分配 24 字节。[^4] 然而，在同一平台先前的 Go 版本中，每次操作则消耗了 32 字节。

```
% go1.15 test -bench=. sort_test.go
goos: darwin
goarch: amd64
BenchmarkSortStrings-4          11453016                96.4 ns/op            32 B/op          1 allocs/op
PASS
ok      command-line-arguments  1.225s
```

这引出了本文的主题，即 Go 1.16 版本中即将推出的一项便利改进。不过在讨论这个内容之前，我需要聊聊 “<ruby>尺寸类别<rt>size class</rt></ruby>”。

### 尺寸类别

在解释什么是 “<ruby>尺寸类别<rt>size class</rt></ruby>” 之前，我们先考虑个问题，理论上的 Go 语言在运行时是如何在其堆上分配 24 字节的。有一个简单的方法：追踪目前为止已分配到的所有内存的动向——利用指向堆上最后分配的字节的指针。分配 24 字节，堆指针就会增加 24，然后将前一个值返回给调用函数。只要写入的请求 24 字节的代码不超出该标记的范围，这种机制就没有额外开销。不过，现实情况下，内存分配器不仅要分配内存，有时还得释放内存。

最终，Go 语言程序在运行时将释放这些 24 字节，但从运行的视角来看，它只知道它给调用者的开始地址。它不知道从该地址起始之后又分配了多少字节。为了允许释放内存，我们假设的 Go 语言程序运行时分配器必须记录堆上每个分配的长度值。那么这些长度值的分配存储在何处？当然是在堆上。

在我们的设想中，当程序运行需要分配内存的时候，它可以请求稍微多一点，并把它用来存储请求的数量。而对于我们的切片示例而言，当我们请求 24 字节时，实际上会消耗 24 字节加上存储数字 `24` 的一些开销。这些开销有多大？事实上，实际上的最小开销量是一个字。[^5]

用来记录 24 字节分配的开销将是 8 字节。25% 不是很大，但也不算糟糕，随着分配的大小增加，开销将变得微不足道。然而，如果我们只想在堆上存储一个字节，会发生什么？开销将是请求数据量的 8 倍！是否有一种更高效的方式在堆上分配少量内存？

与其在每个分配旁边存储长度，不如将相同大小的内容存储在一起，这个主意如何？如果所有的 24 字节的内容都存储在一起，那么运行时会自动获取它们的大小。运行时所需要的是一个单一的位，指示 24 字节区域是否在使用中。在 Go 语言中，这些区域被称为 Size Classes，因为相同大小的所有内容都会存储在一起（类似学校班级，所有学生都按同一年级分班，而不是 C++ 中的类）。当运行时需要分配少量内存时，它会使用能够容纳该分配的最小的尺寸类别。

### 无限制的尺寸类别

现在我们知道尺寸类别是如何工作的了，那么问题又来了，它们存储在哪里？和我们想的一样，尺寸类别的内存来自堆。为了最小化开销，运行时会从堆上分配较大的内存块（通常是系统页面大小的倍数），然后将该空间用于单个大小的分配。不过，这里存在一个问题————

将大块区域用于存储同一大小的事物的模式很好用 [^6]，如果分配大小的数量是固定的，最好是少数几个。那么在通用语言中，程序可以要求运行时以任何大小分配内存[^7]。

例如，想象一下向运行时请求 9 字节。9 字节是一个不常见的大小，因此可能需要一个新的尺寸类别来存储 9 字节大小的物品。因为 9 字节大小的物品不常见，所以分配的其余部分（通常为 4KB 或更多）可能会被浪费。由于尺寸类别的集合是固定的，如果没有精确匹配的 size class 可用，分配将并入到下一个尺寸类别。在我们的示例中，9 字节可能会在 12 字节的尺寸类别中分配。未使用的 3 字节的开销要比几乎未使用的整个尺寸类别分配好。

### 总结一下

这是谜题的最后一块拼图。Go 1.15 版本没有 24 字节的尺寸类别，因此 `ss` 的堆分配是在 32 字节的尺寸类别中分配的。由于 Martin Möhrmann 的工作，Go 1.16 版本有一个 24 字节的尺寸类别，非常适合分配给接口的切片值。

[^1]: 这不是正确的对排序函数进行基准测试的方式，因为在第一次迭代之后，输入已经排序。但这又是另外一个话题了。
[^2]: 此语句的准确性取决于所使用的 Go 版本。例如，Go 1.15 版本添加了直接将一些 [整数存储在接口值][e] 中的功能，从而节省了分配和间接性。然而，对于大多数值来说，如果它不是指针类型，它的地址将被取出并存储在接口值中。
[^3]: 编译器在接口值的类型字段中跟踪了这种手法，因此它记住了分配给 `si` 的类型是 `sort.StringSlice` 而不是 `*sort.StringSlice`。
[^4]: 在 32 位平台上，这个数字减半，[但我们不再关注它][f]。
[^5]: 如果你准备限制分配为 4G 或者可能是 64KB，你可以使用较少内存来存储分配的尺寸，但实际上使用小于一个字来存储长度标头的节省会受到填充的影响。
[^6]: 将相同大小的物品存储在一起也是一种有效的对抗碎片化的策略。
[^7]: 这并不是一个不切实际的设想，字符串有各种形状和大小，生成以前未见过的大小的字符串可能就像附加空格一样简单。

### 相关文章

1. [我在 Devfest 2017年西伯利亚大会谈 Go 语言][g]
2. [如果对齐的内存写操作是原子性的，为什么我们还需要 sync/atomic 包呢？][h]
3. [为你的树莓派创建一个真实的串行控制台][i]
4. [为什么 Go 语言线程的栈是无限制的？][j]

*（题图：MJ/01d5fe46-778f-48fe-9481-162f4d0289dc）*

--------------------------------------------------------------------------------

via: https://dave.cheney.net/2021/01/05/a-few-bytes-here-a-few-there-pretty-soon-youre-talking-real-memory

作者：[Dave Cheney][a]
选题：[lujun9972][b]
译者：[Drwhooooo](https://github.com/Drwhooooo)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://dave.cheney.net/
[b]: https://github.com/lujun9972
[c]: https://research.swtch.com/interfaces
[d]: https://github.com/golang/go/issues/23676
[e]: https://golang.org/doc/go1.15#runtime
[f]: https://www.tallengestore.com/products/i-never-look-back-darling-it-distracts-from-the-now-edna-mode-inspirational-quote-tallenge-motivational-poster-collection-large-art-prints
[g]: https://dave.cheney.net/2017/08/23/im-talking-about-go-at-devfest-siberia-2017
[h]: https://dave.cheney.net/2018/01/06/if-aligned-memory-writes-are-atomic-why-do-we-need-the-sync-atomic-package
[i]: https://dave.cheney.net/2014/01/05/a-real-serial-console-for-your-raspberry-pi
[j]: https://dave.cheney.net/2013/06/02/why-is-a-goroutines-stack-infinite
[0]: https://img.linux.net.cn/data/attachment/album/202311/15/154636bhoqwdrdxczdhzxg.png
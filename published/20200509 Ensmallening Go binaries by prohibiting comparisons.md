[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12238-1.html)
[#]: subject: (Ensmallening Go binaries by prohibiting comparisons)
[#]: via: (https://dave.cheney.net/2020/05/09/ensmallening-go-binaries-by-prohibiting-comparisons)
[#]: author: (Dave Cheney https://dave.cheney.net/author/davecheney)

通过禁止比较让 Go 二进制文件变小
======

![](https://img.linux.net.cn/data/attachment/album/202005/22/101617lcha7vvqzhh7d565.jpg)

大家常规的认知是，Go 程序中声明的类型越多，生成的二进制文件就越大。这个符合直觉，毕竟如果你写的代码不去操作定义的类型，那么定义一堆类型就没有意义了。然而，链接器的部分工作就是检测没有被程序引用的函数（比如说它们是一个库的一部分，其中只有一个子集的功能被使用），然后把它们从最后的编译产出中删除。常言道，“类型越多，二进制文件越大”，对于多数 Go 程序还是正确的。

本文中我会深入讲解在 Go 程序的上下文中“相等”的意义，以及为什么[像这样][1]的修改会对 Go 程序的大小有重大的影响。

### 定义两个值相等

Go 的语法定义了“赋值”和“相等”的概念。赋值是把一个值赋给一个标识符的行为。并不是所有声明的标识符都可以被赋值，如常量和函数就不可以。相等是通过检查标识符的内容是否相等来比较两个标识符的行为。

作为强类型语言，“相同”的概念从根源上被植入标识符的类型中。两个标识符只有是相同类型的前提下，才有可能相同。除此之外，值的类型定义了如何比较该类型的两个值。

例如，整型是用算数方法进行比较的。对于指针类型，是否相等是指它们指向的地址是否相同。映射和通道等引用类型，跟指针类似，如果它们指向相同的地址，那么就认为它们是相同的。

上面都是按位比较相等的例子，即值占用的内存的位模式是相同的，那么这些值就相等。这就是所谓的 memcmp，即内存比较，相等是通过比较两个内存区域的内容来定义的。

记住这个思路，我过会儿再来谈。

### 结构体相等

除了整型、浮点型和指针等标量类型，还有复合类型：结构体。所有的结构体以程序中的顺序被排列在内存中。因此下面这个声明：

```
type S struct {
    a, b, c, d int64
}
```

会占用 32 字节的内存空间；`a` 占用 8 个字节，`b` 占用 8 个字节，以此类推。Go 的规则说如果结构体所有的字段都是可以比较的，那么结构体的值就是可以比较的。因此如果两个结构体所有的字段都相等，那么它们就相等。

```
a := S{1, 2, 3, 4}
b := S{1, 2, 3, 4}
fmt.Println(a == b) // 输出 true
```

编译器在底层使用 memcmp 来比较 `a` 的 32 个字节和 `b` 的 32 个字节。

### 填充和对齐

然而，在下面的场景下过分简单化的按位比较的策略会返回错误的结果：

```
type S struct {
    a byte
    b uint64
    c int16
    d uint32
}

func main()
    a := S{1, 2, 3, 4}
    b := S{1, 2, 3, 4}
    fmt.Println(a == b) // 输出 true
}
```

编译代码后，这个比较表达式的结果还是 `true`，但是编译器在底层并不能仅依赖比较 `a` 和 `b` 的位模式，因为结构体有*填充*。

Go 要求结构体的所有字段都对齐。2 字节的值必须从偶数地址开始，4 字节的值必须从 4 的倍数地址开始，以此类推 [^1]。编译器根据字段的类型和底层平台加入了填充来确保字段都*对齐*。在填充之后，编译器实际上看到的是 [^2]：

```
type S struct {
    a byte
    _ [7]byte // 填充
    b uint64
    c int16
    _ [2]int16 // 填充
    d uint32
}
```

填充的存在保证了字段正确对齐，而填充确实占用了内存空间，但是填充字节的内容是未知的。你可能会认为在 Go 中 填充字节都是 0，但实际上并不是 — 填充字节的内容是未定义的。由于它们并不是被定义为某个确定的值，因此按位比较会因为分布在 `s` 的 24 字节中的 9 个填充字节不一样而返回错误结果。

Go 通过生成所谓的相等函数来解决这个问题。在这个例子中，`s` 的相等函数只比较函数中的字段略过填充部分，这样就能正确比较类型 `s` 的两个值。

### 类型算法

呵，这是个很大的设置，说明了为什么，对于 Go 程序中定义的每种类型，编译器都会生成几个支持函数，编译器内部把它们称作类型的算法。如果类型是一个映射的键，那么除相等函数外，编译器还会生成一个哈希函数。为了维持稳定，哈希函数在计算结果时也会像相等函数一样考虑诸如填充等因素。

凭直觉判断编译器什么时候生成这些函数实际上很难，有时并不明显，（因为）这超出了你的预期，而且链接器也很难消除没有被使用的函数，因为反射往往导致链接器在裁剪类型时变得更保守。

### 通过禁止比较来减小二进制文件的大小

现在，我们来解释一下 Brad 的修改。向类型添加一个不可比较的字段 [^3]，结构体也随之变成不可比较的，从而强制编译器不再生成相等函数和哈希函数，规避了链接器对那些类型的消除，在实际应用中减小了生成的二进制文件的大小。作为这项技术的一个例子，下面的程序：

```
package main

import "fmt"

func main() {
    type t struct {
        // _ [0][]byte // 取消注释以阻止比较
        a byte
        b uint16
        c int32
        d uint64
    }
    var a t
    fmt.Println(a)
}
```

用 Go 1.14.2（darwin/amd64）编译，大小从 2174088 降到了 2174056，节省了 32 字节。单独看节省的这 32 字节似乎微不足道，但是考虑到你的程序中每个类型及其传递闭包都会生成相等和哈希函数，还有它们的依赖，这些函数的大小随类型大小和复杂度的不同而不同，禁止它们会大大减小最终的二进制文件的大小，效果比之前使用 `-ldflags="-s -w"` 还要好。

最后总结一下，如果你不想把类型定义为可比较的，可以在源码层级强制实现像这样的奇技淫巧，会使生成的二进制文件变小。

* * *

附录：在 Brad 的推动下，[Cherry Zhang][5] 和 [Keith Randall][6] 已经在 Go 1.15 做了大量的改进，修复了最严重的故障，消除了无用的相等和哈希函数（虽然我猜想这也是为了避免这类 CL 的扩散）。

[^1]: 在 32 位平台上 `int64` 和 `unit64` 的值可能不是按 8 字节对齐的，因为平台原生的是以 4 字节对齐的。查看 [议题 599][7] 了解内部详细信息。
[^2]: 32 位平台会在 `a` 和 `b` 的声明中填充 `_ [3]byte`。参见前一条。
[^3]: Brad 使用的是`[0]func()`，但是所有能限制和禁止比较的类型都可以。添加了一个有 0 个元素的数组的声明后，结构体的大小和对齐不会受影响。

#### 相关文章：

  1. [Go 运行时如何高效地实现映射（不使用泛型）][11]
  2. [空结构体][12]
  3. [填充很难][13]
  4. [Go 中有类型的 nil（2）][14]

--------------------------------------------------------------------------------

via: https://dave.cheney.net/2020/05/09/ensmallening-go-binaries-by-prohibiting-comparisons

作者：[Dave Cheney][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://dave.cheney.net/author/davecheney
[b]: https://github.com/lujun9972
[1]: https://github.com/golang/net/commit/e0ff5e5a1de5b859e2d48a2830d7933b3ab5b75f
[2]: tmp.uBLyaVR1Hm#easy-footnote-bottom-1-4116 (On 32bit platforms <code>int64</code> and <code>uint64</code> values may not be 8 byte aligned as the natural alignment of the platform is 4 bytes. See <a href="https://github.com/golang/go/issues/599">issue 599</a> for the gory details.)
[3]: tmp.uBLyaVR1Hm#easy-footnote-bottom-2-4116 (32 bit platforms would see <code>_ [3]byte</code> padding between the declaration of <code>a</code> and <code>b</code>. See previous.)
[4]: tmp.uBLyaVR1Hm#easy-footnote-bottom-3-4116 (Brad used <code>[0]func()</code>, but any type that the spec limits or prohibits comparisons on will do. By declaring the array has zero elements the type has no impact on the size or alignment of the struct.)
[5]: https://go-review.googlesource.com/c/go/+/231397
[6]: https://go-review.googlesource.com/c/go/+/191198
[7]: https://github.com/golang/go/issues/599
[8]: tmp.uBLyaVR1Hm#easy-footnote-1-4116
[9]: tmp.uBLyaVR1Hm#easy-footnote-2-4116
[10]: tmp.uBLyaVR1Hm#easy-footnote-3-4116
[11]: https://dave.cheney.net/2018/05/29/how-the-go-runtime-implements-maps-efficiently-without-generics (How the Go runtime implements maps efficiently (without generics))
[12]: https://dave.cheney.net/2014/03/25/the-empty-struct (The empty struct)
[13]: https://dave.cheney.net/2015/10/09/padding-is-hard (Padding is hard)
[14]: https://dave.cheney.net/2017/08/09/typed-nils-in-go-2 (Typed nils in Go 2)

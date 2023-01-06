[#]: subject: "An introduction to Go arrays and slices"
[#]: via: "https://opensource.com/article/18/7/introduction-go-arrays-and-slices"
[#]: author: "Mihalis Tsoukalos https://opensource.com/users/mtsouk"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14665-1.html"

Go 数组和切片的介绍
======

![](https://img.linux.net.cn/data/attachment/album/202206/02/105657zahhco3612vv1bbo.jpg)

> 了解使用数组和切片在 Go 中存储数据的优缺点，以及为什么其中一个更好。

在本系列的第四篇文章中，我将解释 [Go][5] 数组和切片，包括如何使用它们，以及为什么你通常要选择其中一个而不是另一个。

### 数组

数组是编程语言中最流行的数据结构之一，主要原因有两个：一是简单易懂，二是可以存储许多不同类型的数据。

你可以声明一个名为 `anArray` 的 Go 数组，该数组存储四个整数，如下所示：

```
anArray := [4]int{-1, 2, 0, -4}
```

数组的大小应该在它的类型之前声明，而类型应该在声明元素之前定义。`len()` 函数可以帮助你得到任何数组的长度。上面数组的大小是 4。

如果你熟悉其他编程语言，你可能会尝试使用 `for` 循环来遍历数组。Go 当然也支持 `for` 循环，不过，正如你将在下面看到的，Go 的 `range` 关键字可以让你更优雅地遍历数组或切片。

最后，你也可以定义一个二维数组，如下：

```
twoD := [3][3]int{
  {1, 2, 3},
  {6, 7, 8},
  {10, 11, 12}}
```

`arrays.go` 源文件中包含了 Go 数组的示例代码。其中最重要的部分是：

```
for i := 0; i < len(twoD); i++ {
  k := twoD[i]
  for j := 0; j < len(k); j++ {
    fmt.Print(k[j], " ")
  }
  fmt.Println()
}

for _, a := range twoD {
  for _, j := range a {
    fmt.Print(j, " ")
  }
  fmt.Println()
}
```

通过上述代码，我们知道了如何使用 `for` 循环和 `range` 关键字迭代数组的元素。`arrays.go` 的其余代码则展示了如何将数组作为参数传递给函数。

以下是 `arrays.go` 的输出：

```
$ go run arrays.go
Before change(): [-1 2 0 -4]
After change(): [-1 2 0 -4]
1 2 3
6 7 8
10 11 12
1 2 3
6 7 8
10 11 12
```

这个输出告诉我们：对函数内的数组所做的更改，会在函数退出后丢失。

### 数组的缺点

Go 数组有很多缺点，你应该重新考虑是否要在 Go 项目中使用它们。

首先，数组定义之后，大小就无法改变，这意味着 Go 数组不是动态的。简而言之，如果你需要将一个元素添加到一个没有剩余空间的数组中，你将需要创建一个更大的数组，并将旧数组的所有元素复制到新数组中。

其次，当你将数组作为参数传递给函数时，实际上是传递了数组的副本，这意味着你对函数内部的数组所做的任何更改，都将在函数退出后丢失。

最后，将大数组传递给函数可能会很慢，主要是因为 Go 必须创建数组的副本。

以上这些问题的解决方案，就是使用 Go 切片。

### 切片

Go 切片与 Go 数组类似，但是它没有后者的缺点。

首先，你可以使用 `append()` 函数将元素添加到现有切片中。此外，Go 切片在内部使用数组实现，这意味着 Go 中每个切片都有一个底层数组。

切片具有 `capacity` 属性和 `length` 属性，它们并不总是相同的。切片的长度与元素个数相同的数组的长度相同，可以使用 `len()` 函数得到。切片的容量是当前为切片分配的空间，可以使用 `cap()` 函数得到。

由于切片的大小是动态的，如果切片空间不足（也就是说，当你尝试再向切片中添加一个元素时，底层数组的长度恰好与容量相等），Go 会自动将它的当前容量加倍，使其空间能够容纳更多元素，然后将请求的元素添加到底层数组中。

此外，切片是通过引用传递给函数的，这意味着实际传递给函数的是切片变量的内存地址，这样一来，你对函数内部的切片所做的任何修改，都不会在函数退出后丢失。因此，将大切片传递给函数，要比将具有相同数量元素的数组传递给同一函数快得多。这是因为 Go 不必拷贝切片 —— 它只需传递切片变量的内存地址。

`slice.go` 源文件中有 Go 切片的代码示例，其中包含以下代码：

```
package main

import (
  "fmt"
)

func negative(x []int) {
  for i, k := range x {
    x[i] = -k
  }
}

func printSlice(x []int) {
  for _, number := range x {
    fmt.Printf("%d ", number)
  }
  fmt.Println()
}

func main() {
  s := []int{0, 14, 5, 0, 7, 19}
  printSlice(s)
  negative(s)
  printSlice(s)

  fmt.Printf("Before. Cap: %d, length: %d\n", cap(s), len(s))
  s = append(s, -100)
  fmt.Printf("After. Cap: %d, length: %d\n", cap(s), len(s))
  printSlice(s)

  anotherSlice := make([]int, 4)
  fmt.Printf("A new slice with 4 elements: ")
  printSlice(anotherSlice)
}
```

切片和数组在定义方式上的最大区别就在于：你不需要指定切片的大小。实际上，切片的大小取决于你要放入其中的元素数量。此外，`append()` 函数允许你将元素添加到现有切片 —— 请注意，即使切片的容量允许你将元素添加到该切片，它的长度也不会被修改，除非你调用 `append()`。上述代码中的 `printSlice()` 函数是一个辅助函数，用于打印切片中的所有元素，而 `negative()` 函数将切片中的每个元素都变为各自的相反数。

运行 `slice.go` 将得到以下输出：

```
$ go run slice.go
0 14 5 0 7 19
0 -14 -5 0 -7 -19
Before. Cap: 6, length: 6
After. Cap: 12, length: 7
0 -14 -5 0 -7 -19 -100
A new slice with 4 elements: 0 0 0 0
```

请注意，当你创建一个新切片，并为给定数量的元素分配内存空间时，Go 会自动地将所有元素都初始化为其类型的零值，在本例中为 0（`int` 类型的零值）。

### 使用切片来引用数组

Go 允许你使用 `[:]` 语法，使用切片来引用现有的数组。在这种情况下，你对切片所做的任何更改都将传播到数组中 —— 详见 `refArray.go`。请记住，使用 `[:]` 不会创建数组的副本，它只是对数组的引用。

`refArray.go` 中最有趣的部分是：

```
func main() {
  anArray := [5]int{-1, 2, -3, 4, -5}
  refAnArray := anArray[:]

  fmt.Println("Array:", anArray)
  printSlice(refAnArray)
  negative(refAnArray)
  fmt.Println("Array:", anArray)
}
```

运行 `refArray.go`，输出如下：

```
$ go run refArray.go
Array: [-1 2 -3 4 -5]
-1 2 -3 4 -5
Array: [1 -2 3 -4 5]
```

我们可以发现：对 `anArray` 数组的切片引用进行了操作后，它本身也被改变了。

### 总结

尽管 Go 提供了数组和切片两种类型，你很可能还是会使用切片，因为它们比 Go 数组更加通用、强大。只有少数情况需要使用数组而不是切片，特别是当你完全确定元素的数量固定不变时。

你可以在 [GitHub][6] 上找到 `arrays.go`、`slice.go` 和 `refArray.go` 的源代码。

如果你有任何问题或反馈，请在下方发表评论或在 [Twitter][7] 上与我联系。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/introduction-go-arrays-and-slices

作者：[Mihalis Tsoukalos][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mtsouk
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/traffic-light-go.png
[2]: https://opensource.com/article/18/5/creating-random-secure-passwords-go
[3]: https://opensource.com/article/18/5/building-concurrent-tcp-server-go
[4]: https://opensource.com/article/18/6/copying-files-go
[5]: https://golang.org/
[6]: https://github.com/mactsouk/opensource.com
[7]: https://twitter.com/mactsouk

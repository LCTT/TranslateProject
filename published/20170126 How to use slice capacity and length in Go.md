在 Go 中如何使用切片的容量和长度
============================================================ 

快速测试 - 下面的代码输出什么？

```
vals := make([]int, 5)  
for i := 0; i < 5; i++ {  
  vals = append(vals, i)
}
fmt.Println(vals)  
```

_[在 Go Playground 运行一下][1]_

如果你猜测的是 `[0 0 0 0 0 0 1 2 3 4]`，那你是对的。

_等等，什么？_ 为什么不是 `[0 1 2 3 4]`?

如果你在测试中做错了，你也不用担心。这是在过渡到 Go 语言的过程中相当常见的错误，在这篇文章中，我们将说明为什么输出不是你预期的，以及如何利用 Go 的细微差别来使你的代码更有效率。

### 切片 vs 数组

在 Go 中同时有数组（array）和切片（slice）。这可能令人困惑，但一旦你习惯了，你会喜欢上它。请相信我。

切片和数组之间存在许多差异，但我们要在本文中重点介绍的内容是数组的大小是其类型的一部分，而切片可以具有动态大小，因为它们是围绕数组的封装。

这在实践中意味着什么？那么假设我们有数组 `val a [10]int`。该数组具有固定大小，且无法更改。如果我们调用 `len(a)`，它总是返回 `10`，因为这个大小是类型的一部分。因此，如果你突然需要在数组中超过 10 个项，则必须创建一个完全不同类型的新对象，例如 `val b [11]int`，然后将所有值从 `a` 复制到 `b`。

在特定情况下，含有集合大小的数组是有价值的，但一般而言，这不是开发人员想要的。相反，他们希望在 Go 中使用类似于数组的东西，但是随着时间的推移，它们能够随时增长。一个粗略的方式是创建一个比它需要大得多的数组，然后将数组的一个子集视为数组。下面的代码是个例子。

```
var vals [20]int  
for i := 0; i < 5; i++ {  
  vals[i] = i * i
}
subsetLen := 5

fmt.Println("The subset of our array has a length of:", subsetLen)

// Add a new item to our array
vals[subsetLen] = 123  
subsetLen++  
fmt.Println("The subset of our array has a length of:", subsetLen)  
```

_[在 Go Playground 中运行][2]_

在代码中，我们有一个长度为 `20` 的数组，但是由于我们只使用一个子集，代码中我们可以假定数组的长度是 `5`，然后在我们向数组中添加一个新的项之后是 `6`。

这是（非常粗略地说）切片是如何工作的。它们包含一个具有设置大小的数组，就像我们前面的例子中的数组一样，它的大小为 `20`。

它们还跟踪程序中使用的数组的子集 - 这就是 `append` 属性，它类似于上一个例子中的 `subsetLen` 变量。

最后，一个切片还有一个 `capacity`，类似于前面例子中我们的数组的总长度（`20`）。这是很有用的，因为它会告诉你的子集在无法容纳切片数组之前可以增长的大小。当发生这种情况时，需要分配一个新的数组，但所有这些逻辑都隐藏在 `append` 函数的后面。

简而言之，使用 `append` 函数组合切片给我们一个非常类似于数组的类型，但随着时间的推移，它可以处理更多的元素。

我们再来看一下前面的例子，但是这次我们将使用切片而不是数组。

```
var vals []int  
for i := 0; i < 5; i++ {  
  vals = append(vals, i)
  fmt.Println("The length of our slice is:", len(vals))
  fmt.Println("The capacity of our slice is:", cap(vals))
}

// Add a new item to our array
vals = append(vals, 123)  
fmt.Println("The length of our slice is:", len(vals))  
fmt.Println("The capacity of our slice is:", cap(vals))

// Accessing items is the same as an array
fmt.Println(vals[5])  
fmt.Println(vals[2])  
```

_[在 Go Playground 中运行][3]_

我们仍然可以像数组一样访问我们的切片中的元素，但是通过使用切片和 `append` 函数，我们不再需要考虑背后数组的大小。我们仍然可以通过使用 `len` 和 `cap` 函数来计算出这些东西，但是我们不用担心太多。简洁吧？

### 回到测试

记住这点，让我们回顾前面的测试，看下什么出错了。

```
vals := make([]int, 5)  
for i := 0; i < 5; i++ {  
  vals = append(vals, i)
}
fmt.Println(vals)  
```

当调用 `make` 时，我们允许最多传入 3 个参数。第一个是我们分配的类型，第二个是类型的“长度”，第三个是类型的“容量”（_这个参数是可选的_）。

通过传递参数 `make([]int, 5)`，我们告诉程序我们要创建一个长度为 5 的切片，在这种情况下，默认的容量与长度相同 - 本例中是 5。

虽然这可能看起来像我们想要的那样，这里的重要区别是我们告诉我们的切片，我们要将“长度”和“容量”设置为 5，假设你想要在初始的 5 个元素_之后_添加新的元素，我们接着调用 `append` 函数，那么它会增加容量的大小，并且会在切片的最后添加新的元素。

如果在代码中添加一条 `Println()` 语句，你可以看到容量的变化。

```
vals := make([]int, 5)  
fmt.Println("Capacity was:", cap(vals))  
for i := 0; i < 5; i++ {  
  vals = append(vals, i)
  fmt.Println("Capacity is now:", cap(vals))
}

fmt.Println(vals)  
```

_[在 Go Playground 中运行][4]_

最后，我们最终得到 `[0 0 0 0 0 0 1 2 3 4]` 的输出而不是希望的 `[0 1 2 3 4]`。

如何修复它呢？好的，这有几种方法，我们将讲解两种，你可以选取任何一种在你的场景中最有用的方法。

#### 直接使用索引写入而不是 `append`

第一种修复是保留 `make` 调用不变，并且显式地使用索引来设置每个元素。这样，我们就得到如下的代码：

```
vals := make([]int, 5)  
for i := 0; i < 5; i++ {  
  vals[i] = i
}
fmt.Println(vals)  
```

_[在 Go Playground 中运行][5]_

在这种情况下，我们设置的值恰好与我们要使用的索引相同，但是你也可以独立跟踪索引。

比如，如果你想要获取 map 的键，你可以使用下面的代码。

```
package main

import "fmt"

func main() {  
  fmt.Println(keys(map[string]struct{}{
    "dog": struct{}{},
    "cat": struct{}{},
  }))
}

func keys(m map[string]struct{}) []string {  
  ret := make([]string, len(m))
  i := 0
  for key := range m {
    ret[i] = key
    i++
  }
  return ret
}
```

_[在 Go Playground 中运行][6]_

这样做很好，因为我们知道我们返回的切片的长度将与 map 的长度相同，因此我们可以用该长度初始化我们的切片，然后将每个元素分配到适当的索引中。这种方法的缺点是我们必须跟踪 `i`，以便了解每个索引要设置的值。

这就让我们引出了第二种方法……

#### 使用 `0` 作为你的长度并指定容量

与其跟踪我们要添加的值的索引，我们可以更新我们的 `make` 调用，并在切片类型之后提供两个参数。第一个，我们的新切片的长度将被设置为 `0`，因为我们还没有添加任何新的元素到切片中。第二个，我们新切片的容量将被设置为 map 参数的长度，因为我们知道我们的切片最终会添加许多字符串。

这会如前面的例子那样仍旧会在背后构建相同的数组，但是现在当我们调用 `append` 时，它会将它们放在切片开始处，因为切片的长度是 0。

```
package main

import "fmt"

func main() {  
  fmt.Println(keys(map[string]struct{}{
    "dog": struct{}{},
    "cat": struct{}{},
  }))
}

func keys(m map[string]struct{}) []string {  
  ret := make([]string, 0, len(m))
  for key := range m {
    ret = append(ret, key)
  }
  return ret
}
```

_[在 Go Playground 中运行][7]_

### 如果 `append` 处理它，为什么我们还要担心容量呢？

接下来你可能会问：“如果 `append` 函数可以为我增加切片的容量，那我们为什么要告诉程序容量呢？”

事实是，在大多数情况下，你不必担心这太多。如果它使你的代码变得更复杂，只需用 `var vals []int` 初始化你的切片，然后让 `append` 函数处理接下来的事。

但这种情况是不同的。它并不是声明容量困难的例子，实际上这很容易确定我们的切片的最后容量，因为我们知道它将直接映射到提供的 map 中。因此，当我们初始化它时，我们可以声明切片的容量，并免于让我们的程序执行不必要的内存分配。

如果要查看额外的内存分配情况，请在 Go Playground 上运行以下代码。每次增加容量，程序都需要做一次内存分配。

```
package main

import "fmt"

func main() {  
  fmt.Println(keys(map[string]struct{}{
    "dog":       struct{}{},
    "cat":       struct{}{},
    "mouse":     struct{}{},
    "wolf":      struct{}{},
    "alligator": struct{}{},
  }))
}

func keys(m map[string]struct{}) []string {  
  var ret []string
  fmt.Println(cap(ret))
  for key := range m {
    ret = append(ret, key)
    fmt.Println(cap(ret))
  }
  return ret
}
```

_[在 Go Playground 中运行][8]_

现在将此与相同的代码进行比较，但具有预定义的容量。

```
package main

import "fmt"

func main() {  
  fmt.Println(keys(map[string]struct{}{
    "dog":       struct{}{},
    "cat":       struct{}{},
    "mouse":     struct{}{},
    "wolf":      struct{}{},
    "alligator": struct{}{},
  }))
}

func keys(m map[string]struct{}) []string {  
  ret := make([]string, 0, len(m))
  fmt.Println(cap(ret))
  for key := range m {
    ret = append(ret, key)
    fmt.Println(cap(ret))
  }
  return ret
}
```

_[在 Go Playground 中运行][9]_

在第一个代码示例中，我们的容量从 `0` 开始，然后增加到 `1`、 `2`、 `4`, 最后是 `8`，这意味着我们不得不分配 5 次数组，最后一个容纳我们切片的数组的容量是 `8`，这比我们最终需要的要大。

另一方面，我们的第二个例子开始和结束都是相同的容量（`5`），它只需要在 `keys()` 函数的开头分配一次。我们还避免了浪费任何额外的内存，并返回一个能放下这个数组的完美大小的切片。

### 不要过分优化

如前所述，我通常不鼓励任何人做这样的小优化，但如果最后大小的效果真的很明显，那么我强烈建议你尝试为切片设置适当的容量或长度。

这不仅有助于提高程序的性能，还可以通过明确说明输入的大小和输出的大小之间的关系来帮助澄清你的代码。

### 总结

>你好！我写了很多关于Go、Web 开发和其他我觉得有趣的话题。
>
>如果你想跟上最新的文章，请[注册我的邮件列表][10]。我会给你发送我新书的样例、Go 的 Web 开发、以及每当有新文章（通常每周 1-2 次）会给你发送邮件。
>
>哦，我保证不会发垃圾邮件。我像你一样讨厌它 :)

本文并不是对切片或数组之间差异的详细讨论，而是简要介绍了容量和长度如何影响切片，以及它们在方案中的用途。

为了进一步阅读，我强烈推荐 Go 博客中的以下文章：

*   [Go Slices：使用及内部][11]
*   [数组、切片（和字符串）：“append” 的机制][12]
*   [切片技巧][13]

--------------------------------------------------------------------------------

作者简介：

Jon 是一名软件顾问，也是 《Web Development with Go》 一书的作者。在此之前，他创立了 EasyPost，一家 Y Combinator 支持的创业公司，并在 Google 工作。

https://www.usegolang.com

--------------------------------------------------------------------------------


via: https://www.calhoun.io/how-to-use-slice-capacity-and-length-in-go

作者：[Jon Calhoun][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.calhoun.io/hire-me
[1]:https://play.golang.org/p/7PgUqBdZ6Z
[2]:https://play.golang.org/p/Np6-NEohm2
[3]:https://play.golang.org/p/M_qaNGVbC-
[4]:https://play.golang.org/p/d6OUulTYM7
[5]:https://play.golang.org/p/JI8Fx3fJCU
[6]:https://play.golang.org/p/kIKxkdX35B
[7]:https://play.golang.org/p/h5hVAHmqJm
[8]:https://play.golang.org/p/fDbAxtAjLF
[9]:https://play.golang.org/p/nwT8X9-7eQ
[10]:https://www.calhoun.io/how-to-use-slice-capacity-and-length-in-go/?utm_source=golangweekly&utm_medium=email#mailing-list-form
[11]:https://blog.golang.org/go-slices-usage-and-internals
[12]:https://blog.golang.org/slices
[13]:https://github.com/golang/go/wiki/SliceTricks
[14]:https://www.calhoun.io/how-to-use-slice-capacity-and-length-in-go/

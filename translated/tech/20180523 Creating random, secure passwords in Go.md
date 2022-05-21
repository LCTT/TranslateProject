[#]: subject: "Creating random, secure passwords in Go"
[#]: via: "https://opensource.com/article/18/5/creating-random-secure-passwords-go"
[#]: author: "Mihalis Tsoukalos https://opensource.com/users/mtsouk"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

在 Go 中生成随机的安全密码
======
Go 的随机数生成器是生成难以猜测的密码的好方法。

![密码笔记本电脑][1]

图源：geralt，发布于 Pixabay，CC0

你可以使用 [Go 编程语言][2] 提供的随机数生成器来生成由 ASCII 字符组成的难以猜测的密码。尽管本文中提供的代码很容易阅读，但是你仍需要了解 Go 的基础知识，才能更好地理解它。如果你是对 Go 还不熟悉，请阅读 [Go 语言之旅][3] 来了解更多信息，然后返回此处。

在介绍实用程序和它的代码之前，让我们先来看看这个 ASCII 表的子集，它可以在 `man ascii` 命令的输出中找到：

```
30 40 50 60 70 80 90 100 110 120
 ---------------------------------
0:    (  2  <  F  P  Z  d   n   x
1:    )  3  =  G  Q  [  e   o   y
2:    *  4  >  H  R  \  f   p   z
3: !  +  5  ?  I  S  ]  g   q   {
4: "  ,  6  @  J  T  ^  h   r   |
5: #  -  7  A  K  U  _  i   s   }
6: $  .  8  B  L  V  `  j   t   ~
7: %  /  9  C  M  W  a  k   u  DEL
8: &  0  :  D  N  X  b  l   v
9: '  1  ;  E  O  Y  c  m   w
```

在所有 ASCII 字符中，可打印字符的十进制值范围为 33 到 126，其他的 ASCII 值都不适合用于密码。因此，本文介绍的实用程序将生成该范围内的 ASCII 字符。

### 生成随机整数

第一个实用程序名为 `random.go`，它生成指定数量的随机整数，这些整数位于给定范围内。`random.go` 最重要的部分是这个函数：

```
func random(min, max int) int {
    return rand.Intn(max-min) + min
}
```

此函数使用了 `rand.Intn()` 函数来生成一个属于给定范围的随机整数。请注意，`rand.Intn()` 返回一个属于 `[0,n)` 的非负随机整数。如果它的参数是一个负数，这个函数将会抛出异常，异常消息是：`panic: invalid argument to Intn`。你可以在 [math/rand 文档][4] 中找到 `math/rand` 包的使用说明。

`random.go` 实用程序接受三个命令行参数：生成的整数的最小值、最大值和个数。

编译和执行 `random.go` 会产生这样的输出：

```
$ go build random.go
$ ./random
Usage: ./random MIX MAX TOTAL
$ ./random 1 3 10
2 2 1 2 2 1 1 2 2 1
```

如果你希望在 Go 中生成更安全的随机数，请使用 Go 库中的 `crypto/rand` 包。

### 生成随机密码

第二个实用程序 `randomPass.go` 用于生成随机密码。`randomPass.go` 使用 `random()` 函数来生成随机整数，它们随后被以下 Go 代码转换为 ASCII 字符：

```
for {
    myRand := random(MIN, MAX)
    newChar := string(startChar[0] + byte(myRand))
    fmt.Print(newChar)
    if i == LENGTH {
        break
    }
    i++
}
```

`MIN` 的值为 `0`，`MAX` 的值为 `94`，而 `startChar` 的值为 `!`，它是 ASCII 表中第一个可打印的字符（十进制 ASCII 码为 `33`）。因此，所有生成的 ASCII 字符都位于 `!` 和 `~` 之间，后者的十进制 ASCII 码为 `126`。

因此，生成的每个随机数都大于 `MIN`，小于 `MAX`，并转换为 ASCII 字符。该过程继续进行，直到生成的密码达到指定的长度。

`randomPass.go` 实用程序接受单个（可选）命令行参数，以定义生成密码的长度，默认值为 8，这是一个非常常见的密码长度。执行 `randomPass.go` 会得到类似下面的输出：

```
$ go run randomPass.go 1
Z
$ go run randomPass.go 10
#Cw^a#IwkT
$ go run randomPass.go
Using default values!
[PP8@'Ci
```

最后一个细节：不要忘记调用 `rand.Seed()`，并提供一个<ruby>种子<rt>seed</rt></ruby>值，以初始化随机数生成器。如果你始终使用相同的种子值，随机数生成器将生成相同的随机整数序列。

![随机数生成代码][5]

你可以在 [GitHub][6] 找到 `random.go` 和 `randomPass.go` 的源码。你也可以直接在 [play.golang.org][7] 上执行它们。

我希望这篇文章对你有所帮助。如有任何问题，请在下方发表评论或在 [Twitter][8] 上与我联系。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/creating-random-secure-passwords-go

作者：[Mihalis Tsoukalos][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mtsouk
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/laptop-password.jpg
[2]: https://golang.org/
[3]: https://tour.golang.org/welcome/1
[4]: https://golang.org/pkg/math/rand/
[5]: https://opensource.com/sites/default/files/styles/panopoly_image_original/public/uploads/random.png?itok=DG0QPUGX
[6]: https://github.com/mactsouk/opensource.com
[7]: https://play.golang.org/
[8]: https://twitter.com/mactsouk

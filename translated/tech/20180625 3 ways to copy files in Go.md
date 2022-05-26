[#]: subject: "3 ways to copy files in Go"
[#]: via: "https://opensource.com/article/18/6/copying-files-go"
[#]: author: "Mihalis Tsoukalos https://opensource.com/users/mtsouk"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

在 Go 中复制文件的三种方法
======
本文是 Go 系列的第三篇文章，我将介绍三种最流行的复制文件的方法。

![][1]

图源：Opensource.com

本文将介绍展示如何使用 [Go 编程语言][3] 来复制文件。在 Go 中复制文件的方法有很多，我只介绍三种最常见的：使用 Go 库中的 `io.Copy()` 函数调用、一次读取输入文件并将其写入另一个文件，以及使用缓冲区一块块地复制文件。

### 方法一：使用 io.Copy()

第一种方法就是使用 Go 标准库的 `io.Copy()` 函数。你可以在 `copy()` 函数的代码中找到它的实现逻辑，如下所示：

```
func copy(src, dst string) (int64, error) {
  sourceFileStat, err := os.Stat(src)
  if err != nil {
    return 0, err
  }

  if !sourceFileStat.Mode().IsRegular() {
    return 0, fmt.Errorf("%s is not a regular file", src)
  }

  source, err := os.Open(src)
  if err != nil {
    return 0, err
  }
  defer source.Close()

  destination, err := os.Create(dst)
  if err != nil {
    return 0, err
  }
  defer destination.Close()
  nBytes, err := io.Copy(destination, source)
    return nBytes, err
  }
```

首先，上述代码做了两个判断，以便确定它可以被打开读取：一是判断将要复制的文件是否存在（`os.Stat(src)`），二是判断它是否为常规文件（`sourceFileStat.Mode().IsRegular()`）。剩下的所有工作都由 `io.Copy(destination, source)` 这行代码来完成。`io.Copy()` 函数执行结束后，会返回复制的字节数和复制过程中发生的第一条错误消息。在 Go 中，如果没有错误消息，错误变量的值就为 `nil`。

你可以在 [io 包][4] 的文档页面了解有关 `io.Copy()` 函数的更多信息。

运行 `cp1.go` 将产生以下输出：

```
$ go run cp1.go
Please provide two command line arguments!
$ go run cp1.go fileCP.txt /tmp/fileCPCOPY
Copied 3826 bytes!
$ diff fileCP.txt /tmp/fileCPCOPY
```

这个方法已经非常简单了，不过它没有为开发者提供灵活性。这并不总是一件坏事，但是，有些时候，开发者可能会需要/想要告诉程序该如何读取文件。

### 方法二：使用 ioutil.WriteFile() 和 ioutil.ReadFile()

复制文件的第二种方法是使用 `ioutil.ReadFile()` 和 `ioutil.WriteFile()` 函数。第一个函数用于将整个文件的内容，一次性地读入到某个内存中的字节切片里；第二个函数则用于将字节切片的内容写入到一个磁盘文件中。

实现代码如下：

```
input, err := ioutil.ReadFile(sourceFile)
if err != nil {
  fmt.Println(err)
  return
}

err = ioutil.WriteFile(destinationFile, input, 0644)
if err != nil {
  fmt.Println("Error creating", destinationFile)
  fmt.Println(err)
  return
}
```

上述代码包括了两个 if 代码块（嗯，用 Go 写程序就是这样的），程序的实际功能其实体现在 `ioutil.ReadFile()` 和 `ioutil.WriteFile()` 这两行代码中。

运行 `cp2.go`，你会得到下面的输出：

```
$ go run cp2.go
Please provide two command line arguments!
$ go run cp2.go fileCP.txt /tmp/copyFileCP
$ diff fileCP.txt /tmp/copyFileCP
```

请注意，虽然这种方法能够实现文件复制，但它在复制大文件时的效率可能不高。这是因为当文件很大时，`ioutil.ReadFile()` 返回的字节切片会很大。

### 方法三：使用 os.Read() 和 os.Write()

在 Go 中复制文件的第三种方法就是下面要介绍的 `cp3.go`。它接受三个参数：输入文件名、输出文件名和缓冲区大小。

`cp3.go` 最重要的部分位于以下 `for` 循环中，你可以在 `copy()` 函数中找到它，如下所示：

```
buf := make([]byte, BUFFERSIZE)
for {
  n, err := source.Read(buf)
  if err != nil && err != io.EOF {
    return err
  }
  if n == 0 {
    break
  }

  if _, err := destination.Write(buf[:n]); err != nil {
    return err
  }
}
```

该方法使用 `os.Read()` 将输入文件的一小部分读入名为 `buf` 的缓冲区，然后使用 `os.Write()` 将该缓冲区的内容写入文件。当读取出错或到达文件末尾（`io.EOF`）时，复制过程将停止。

运行 `cp3.go`，你会得到下面的输出：

```
$ go run cp3.go
usage: cp3 source destination BUFFERSIZE
$ go run cp3.go fileCP.txt /tmp/buf10 10
Copying fileCP.txt to /tmp/buf10
$ go run cp3.go fileCP.txt /tmp/buf20 20
Copying fileCP.txt to /tmp/buf20
```

在接下来的基准测试中，你会发现，缓冲区的大小极大地影响了 `cp3.go` 的性能。

### 运行基准测试

在本文的最后一部分，我将尝试比较这三个程序以及 `cp3.go` 在不同缓冲区大小下的性能（使用 `time(1)` 命令行工具）。

以下输出显示了复制 500MB 大小的文件时，`cp1.go`、`cp2.go` 和 `cp3.go` 的性能对比：

```
$ ls -l INPUT
-rw-r--r--  1 mtsouk  staff  512000000 Jun  5 09:39 INPUT
$ time go run cp1.go INPUT /tmp/cp1
Copied 512000000 bytes!

real    0m0.980s
user    0m0.219s
sys     0m0.719s
$ time go run cp2.go INPUT /tmp/cp2

real    0m1.139s
user    0m0.196s
sys     0m0.654s
$ time go run cp3.go INPUT /tmp/cp3 1000000
Copying INPUT to /tmp/cp3

real    0m1.025s
user    0m0.195s
sys     0m0.486s
```

我们可以看出，这三个程序的性能非常接近，这意味着 Go 标准库函数的实现非常聪明、经过了充分优化。

现在，让我们测试一下缓冲区大小对 `cp3.go` 的性能有什么影响吧！执行 `cp3.go`，并分别指定缓冲区大小为 10、20 和 1000 字节，在一台运行很快的机器上复制 500MB 文件，得到的结果如下：

```
$ ls -l INPUT
-rw-r--r--  1 mtsouk  staff  512000000 Jun  5 09:39 INPUT
$ time go run cp3.go INPUT /tmp/buf10 10
Copying INPUT to /tmp/buf10

real    6m39.721s
user    1m18.457s
sys 5m19.186s
$ time go run cp3.go INPUT /tmp/buf20 20
Copying INPUT to /tmp/buf20

real    3m20.819s
user    0m39.444s
sys 2m40.380s
$ time go run cp3.go INPUT /tmp/buf1000 1000
Copying INPUT to /tmp/buf1000

real    0m4.916s
user    0m1.001s
sys     0m3.986s
```

我们可以发现，缓冲区越大，`cp3.go` 运行得就越快，这或多或少是符合预期的。此外，使用小于 20 字节的缓冲区来复制大文件会非常缓慢，应该避免。

你可以在 [GitHub][5] 找到 `cp1.go`、`cp2.go` 和 `cp3.go` 的 Go 代码。

如果你有任何问题或反馈，请在（原文）下方发表评论或在 [Twitter][6] 上与我（原作者）联系。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/copying-files-go

作者：[Mihalis Tsoukalos][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mtsouk
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/LIFE_cat.png
[3]: https://golang.org/
[4]: https://golang.org/pkg/io/
[5]: https://github.com/mactsouk/opensource.com
[6]: https://twitter.com/mactsouk

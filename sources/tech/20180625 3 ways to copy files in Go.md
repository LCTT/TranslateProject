[#]: subject: "3 ways to copy files in Go"
[#]: via: "https://opensource.com/article/18/6/copying-files-go"
[#]: author: "Mihalis Tsoukalos https://opensource.com/users/mtsouk"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

3 ways to copy files in Go
======
In the third article in this series about the Go programming language, learn the three most popular ways to copy a file.

![Periwinkle the Cat: A crowdsourced name][1]

Image by: Opensource.com

This article will show you how to copy a file in the [Go programming language][3]. Although there are more than three ways to copy a file in Go, this article will present the three most common ways: using the `io.Copy()` function call from the Go library; reading the input file all at once and writing it to another file; and copying the file in small chunks using a buffer.

### Method 1: Using io.Copy()

The first version of the utility will use the `io.Copy()` function of the standard Go library. The logic of the utility can be found in the implementation of the `copy()` function, which is as follows:

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

Apart from testing whether the file that will be copied exists (`os.Stat(src)` ) and is a regular file (`sourceFileStat.Mode().IsRegular()` ) so you can open it for reading, all the work is done by the `io.Copy(destination, source)` statement. The `io.Copy()` function returns the number of bytes copied and the first error message that happened during the copying process. In Go, if there is no error message, the value of the error variable will be `nil`.

You can learn more about the `io.Copy()` function at the [io package][4] documentation page.

Executing `cp1.go` will generate the next kind of output:

```
$ go run cp1.go
Please provide two command line arguments!
$ go run cp1.go fileCP.txt /tmp/fileCPCOPY
Copied 3826 bytes!
$ diff fileCP.txt /tmp/fileCPCOPY
```

This technique is as simple as possible but gives no flexibility to the developer, which is not always a bad thing. However, there are times that the developer needs or wants to decide how they want to read the file.

### Method 2: Using ioutil.WriteFile() and ioutil.ReadFile()

A second way to copy a file uses the `ioutil.ReadFile()` and `ioutil.WriteFile()` functions. The first function reads the contents of an entire file into a byte slice, and the second function writes the contents of a byte slice into a file.

The logic of the utility can be found in the following Go code:

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

Apart from the two `if` blocks, which are part of the Go way of working, you can see that the functionality of the program is found in the `ioutil.ReadFile()` and `ioutil.WriteFile()` statements.

Executing `cp2.go` will generate the next kind of output:

```
$ go run cp2.go
Please provide two command line arguments!
$ go run cp2.go fileCP.txt /tmp/copyFileCP
$ diff fileCP.txt /tmp/copyFileCP
```

Please note that, although this technique will copy a file, it might not be efficient when you want to copy huge files because the byte slice returned by `ioutil.ReadFile()` will also be huge.

### Method 3: Using os.Read() and os.Write()

A third method of copying files in Go uses a `cp3.go`  utility that will be developed in this section. It accepts three parameters: the filename of the input file, the filename of the output file, and the size of the buffer.

The most important part of `cp3.go` resides in the following `for` loop, which can be found in the `copy() function:`

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

This technique uses `os.Read()` for reading small portions of the input file into a buffer named `buf` and `os.Write()` for writing the contents of that buffer to a file. The copying process stops when there is an error in reading or when you reach the end of the file (`io.EOF` ).

Executing `cp3.go` will generate the next kind of output:

```
$ go run cp3.go
usage: cp3 source destination BUFFERSIZE
$ go run cp3.go fileCP.txt /tmp/buf10 10
Copying fileCP.txt to /tmp/buf10
$ go run cp3.go fileCP.txt /tmp/buf20 20
Copying fileCP.txt to /tmp/buf20
```

As you will see, the size of the buffer greatly affects the performance of `cp3.go`.

### Doing some benchmarking

The last part of this article will try to compare the three programs as well as the performance of `cp3.go`  for various buffer sizes using the `time(1)` command line utility.

The following output shows the performance of `cp1.go`, `cp2.go`, and `cp3.go` when copying a 500MB file:

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

The output shows that the performance of all three utilities is pretty similar, which means that the functions of the standard Go library are quite clever and optimized.

Now, let's test how the buffer size affects the performance of `cp3.go`. Executing `cp3.go` with a buffer size of 10, 20, and 1,000 bytes to copy a 500MB file on a pretty fast machine will generate the following results:

```
$ ls -l INPUT
-rw-r--r--  1 mtsouk  staff  512000000 Jun  5 09:39 INPUT
$ time go run cp3.go INPUT /tmp/buf10 10
Copying INPUT to /tmp/buf10

real    6m39.721s
user    1m18.457s
sys         5m19.186s
$ time go run cp3.go INPUT /tmp/buf20 20
Copying INPUT to /tmp/buf20

real    3m20.819s
user    0m39.444s
sys         2m40.380s
$ time go run cp3.go INPUT /tmp/buf1000 1000
Copying INPUT to /tmp/buf1000

real    0m4.916s
user    0m1.001s
sys     0m3.986s
```

The generated output shows that the bigger the buffer, the faster the performance of the `cp3.go` utility, which is more or less expected. Moreover, using buffer sizes smaller than 20 bytes for copying big files is a very slow process and should be avoided.

You can find the Go code of `cp1.go`, `cp2.go`, and `cp3.go` at [GitHub][5].

If you have any questions or feedback, please leave a comment below or reach out to me on [Twitter][6].

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/copying-files-go

作者：[Mihalis Tsoukalos][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mtsouk
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/LIFE_cat.png
[3]: https://golang.org/
[4]: https://golang.org/pkg/io/
[5]: https://github.com/mactsouk/opensource.com
[6]: https://twitter.com/mactsouk

[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Eliminate error handling by eliminating errors)
[#]: via: (https://dave.cheney.net/2019/01/27/eliminate-error-handling-by-eliminating-errors)
[#]: author: (Dave Cheney https://dave.cheney.net/author/davecheney)

Eliminate error handling by eliminating errors
======

Go 2 aims to improve the overhead of [error handling][1], but do you know what is better than an improved syntax for handling errors? Not needing to handle errors at all. Now, I’m not saying “delete your error handling code”, instead I’m suggesting changing your code so you don’t have as many errors to handle.

This article draws inspiration from a chapter in John Ousterhout’s, _[A philosophy of Software Design,][2]_ “Define Errors Out of Existence”. I’m going to try to apply his advice to Go.

* * *

Here’s a function to count the number of lines in a file,

```
func CountLines(r io.Reader) (int, error) {
        var (
                br    = bufio.NewReader(r)
                lines int
                err   error
        )

        for {
                _, err = br.ReadString('\n')
                lines++
                if err != nil {
                        break
                }
        }

        if err != io.EOF {
                return 0, err
        }
        return lines, nil
 }
```

We construct a `bufio.Reader`, then sit in a loop calling the `ReadString` method, incrementing a counter until we reach the end of the file, then we return the number of lines read. That’s the code we _wanted_ to write, instead `CountLines` is made more complicated by its error handling. For example, there is this strange construction:

```
_, err = br.ReadString('\n')
lines++
if err != nil {
        break
}
```

We increment the count of lines _before_ checking the error—​that looks odd. The reason we have to write it this way is `ReadString` will return an error if it encounters an end-of-file—`io.EOF`—before hitting a newline character. This can happen if there is no trailing newline.

To address this problem, we rearrange the logic to increment the line count, then see if we need to exit the loop.1

But we’re not done checking errors yet. `ReadString` will return `io.EOF` when it hits the end of the file. This is expected, `ReadString` needs some way of saying _stop, there is nothing more to read_. So before we return the error to the caller of `CountLine`, we need to check if the error was _not_ `io.EOF`, and in that case propagate it up, otherwise we return `nil` to say that everything worked fine. This is why the final line of the function is not simply

```
return lines, err
```

I think this is a good example of Russ Cox’s [observation that error handling can obscure the operation of the function][3]. Let’s look at an improved version.

```
func CountLines(r io.Reader) (int, error) {
        sc := bufio.NewScanner(r)
        lines := 0

        for sc.Scan() {
                lines++
        }

        return lines, sc.Err()
}
```

This improved version switches from using `bufio.Reader` to `bufio.Scanner`. Under the hood `bufio.Scanner` uses `bufio.Reader` adding a layer of abstraction which helps remove the error handling which obscured the operation of our previous version of `CountLines` 2

The method `sc.Scan()` returns `true` if the scanner _has_ matched a line of text and _has not_ encountered an error. So, the body of our `for` loop will be called only when there is a line of text in the scanner’s buffer. This means our revised `CountLines` correctly handles the case where there is no trailing newline, It also correctly handles the case where the file is empty.

Secondly, as `sc.Scan` returns `false` once an error is encountered, our `for` loop will exit when the end-of-file is reached or an error is encountered. The `bufio.Scanner` type memoises the first error it encounters and we recover that error once we’ve exited the loop using the `sc.Err()` method.

Lastly, `buffo.Scanner` takes care of handling `io.EOF` and will convert it to a `nil` if the end of file was reached without encountering another error.

* * *

My second example is inspired by Rob Pikes’ _[Errors are values][4]_ blog post.

When dealing with opening, writing and closing files, the error handling is present but not overwhelming as, the operations can be encapsulated in helpers like `ioutil.ReadFile` and `ioutil.WriteFile`. However, when dealing with low level network protocols it often becomes necessary to build the response directly using I/O primitives, thus the error handling can become repetitive. Consider this fragment of a HTTP server which is constructing a HTTP/1.1 response.

```
type Header struct {
        Key, Value string
}

type Status struct {
        Code   int
        Reason string
}

func WriteResponse(w io.Writer, st Status, headers []Header, body io.Reader) error {
        _, err := fmt.Fprintf(w, "HTTP/1.1 %d %s\r\n", st.Code, st.Reason)
        if err != nil {
                return err
        }

        for _, h := range headers {
                _, err := fmt.Fprintf(w, "%s: %s\r\n", h.Key, h.Value)
                if err != nil {
                        return err
                }
        }

        if _, err := fmt.Fprint(w, "\r\n"); err != nil {
                return err
        }

        _, err = io.Copy(w, body)
        return err
}
```

First we construct the status line using `fmt.Fprintf`, and check the error. Then for each header we write the header key and value, checking the error each time. Lastly we terminate the header section with an additional `\r\n`, check the error, and copy the response body to the client. Finally, although we don’t need to check the error from `io.Copy`, we do need to translate it from the two return value form that `io.Copy` returns into the single return value that `WriteResponse` expects.

Not only is this a lot of repetitive work, each operation—fundamentally writing bytes to an `io.Writer`—has a different form of error handling. But we can make it easier on ourselves by introducing a small wrapper type.

```
type errWriter struct {
        io.Writer
        err error
}

func (e *errWriter) Write(buf []byte) (int, error) {
        if e.err != nil {
                return 0, e.err
        }

        var n int
        n, e.err = e.Writer.Write(buf)
        return n, nil
}
```

`errWriter` fulfils the `io.Writer` contract so it can be used to wrap an existing `io.Writer`. `errWriter` passes writes through to its underlying writer until an error is detected. From that point on, it discards any writes and returns the previous error.

```
func WriteResponse(w io.Writer, st Status, headers []Header, body io.Reader) error {
        ew := &errWriter{Writer: w}
        fmt.Fprintf(ew, "HTTP/1.1 %d %s\r\n", st.Code, st.Reason)

        for _, h := range headers {
                fmt.Fprintf(ew, "%s: %s\r\n", h.Key, h.Value)
        }

        fmt.Fprint(ew, "\r\n")
        io.Copy(ew, body)

        return ew.err
}
```

Applying `errWriter` to `WriteResponse` dramatically improves the clarity of the code. Each of the operations no longer needs to bracket itself with an error check. Reporting the error is moved to the end of the function by inspecting the `ew.err` field, avoiding the annoying translation from `io.Copy`’s return values.

* * *

When you find yourself faced with overbearing error handling, try to extract some of the operations into a helper type.

  1. This logic _still_ isn’t correct, can you spot the bug?
  2. `bufio.Scanner` can scan for any pattern, by default it looks for newlines.



### Related posts:

  1. [Error handling vs. exceptions redux][5]
  2. [Stack traces and the errors package][6]
  3. [Subcommand handling in Go][7]
  4. [Constant errors][8]



--------------------------------------------------------------------------------

via: https://dave.cheney.net/2019/01/27/eliminate-error-handling-by-eliminating-errors

作者：[Dave Cheney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://dave.cheney.net/author/davecheney
[b]: https://github.com/lujun9972
[1]: https://go.googlesource.com/proposal/+/master/design/go2draft-error-handling-overview.md
[2]: https://www.amazon.com/Philosophy-Software-Design-John-Ousterhout/dp/1732102201
[3]: https://www.youtube.com/watch?v=6wIP3rO6On8
[4]: https://blog.golang.org/errors-are-values
[5]: https://dave.cheney.net/2014/11/04/error-handling-vs-exceptions-redux (Error handling vs. exceptions redux)
[6]: https://dave.cheney.net/2016/06/12/stack-traces-and-the-errors-package (Stack traces and the errors package)
[7]: https://dave.cheney.net/2013/11/07/subcommand-handling-in-go (Subcommand handling in Go)
[8]: https://dave.cheney.net/2016/04/07/constant-errors (Constant errors)

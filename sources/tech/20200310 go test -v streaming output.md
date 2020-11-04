[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (go test -v streaming output)
[#]: via: (https://dave.cheney.net/2020/03/10/go-test-v-streaming-output)
[#]: author: (Dave Cheney https://dave.cheney.net/author/davecheney)

go test -v streaming output
======

The `testing` package is one of my favourite packages in the Go standard library, not just because of its low noise approach to unit testing, but, over the lifetime of Go, it has received a steady stream of quality of life improvements driven by real world usage.

The most recent example of this is, in Go 1.14, `go test -v` will stream `t.Log` output as it happens, rather than hoarding it til the end of the test run. Here’s an example;

```
package main

import (
    "fmt"
    "testing"
    "time"
)

func TestLogStreaming(t *testing.T) {
    for i := 0; i < 5; i++ {
        time.Sleep(300 * time.Millisecond)
        fmt.Println("fmt.Println:", i)
        t.Log("t.Log:", i)
    }
}
```

_Note:_ Calling `fmt.Println` inside a test is generally considered a no no as it bypasses the `testing` package’s output buffering irrespective of the `-v` flag. However, for this example, it‘s necessary to demonstrate the streaming `t.Log` change.

```
% go1.13 test -v tlog_test.go
=== RUN   TestLogStreaming
fmt.Println: 0
fmt.Println: 1
fmt.Println: 2
fmt.Println: 3
fmt.Println: 4
--- PASS: TestLogStreaming (1.52s)
    tlog_test.go:13: t.Log: 0
    tlog_test.go:13: t.Log: 1
    tlog_test.go:13: t.Log: 2
    tlog_test.go:13: t.Log: 3
    tlog_test.go:13: t.Log: 4
PASS
ok      command-line-arguments  1.971s
```

Under Go 1.13 and earlier the `fmt.Println` lines output immediately. `t.Log` lines are buffered and are printed after the test completes.

```
% go1.14 test -v tlog_test.go
=== RUN   TestLogStreaming
fmt.Println: 0
    TestLogStreaming: tlog_test.go:13: t.Log: 0
fmt.Println: 1
    TestLogStreaming: tlog_test.go:13: t.Log: 1
fmt.Println: 2
    TestLogStreaming: tlog_test.go:13: t.Log: 2
fmt.Println: 3
    TestLogStreaming: tlog_test.go:13: t.Log: 3
fmt.Println: 4
    TestLogStreaming: tlog_test.go:13: t.Log: 4
--- PASS: TestLogStreaming (1.51s)
PASS
ok      command-line-arguments  1.809s
```

Under Go 1.14 the `fmt.Println` and `t.Log` lines are interleaved, rather than waiting for the test to complete, demonstrating that test output is streamed when `go test -v` is used.

This is a great quality of life improvement for integration style tests that often retry for long periods when the test is failing. Streaming `t.Log` output will help Gophers debug those test failures without having to wait until the entire test times out to receive their output.

### Related posts:

  1. [More simple test coverage in Go 1.2][1]
  2. [Test fixtures in Go][2]
  3. [Stress test your Go packages][3]
  4. [Simple test coverage with Go 1.2][4]



--------------------------------------------------------------------------------

via: https://dave.cheney.net/2020/03/10/go-test-v-streaming-output

作者：[Dave Cheney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://dave.cheney.net/author/davecheney
[b]: https://github.com/lujun9972
[1]: https://dave.cheney.net/2013/11/14/more-simple-test-coverage-in-go-1-2 (More simple test coverage in Go 1.2)
[2]: https://dave.cheney.net/2016/05/10/test-fixtures-in-go (Test fixtures in Go)
[3]: https://dave.cheney.net/2013/06/19/stress-test-your-go-packages (Stress test your Go packages)
[4]: https://dave.cheney.net/2013/10/07/simple-test-coverage-with-go-1-2 (Simple test coverage with Go 1.2)

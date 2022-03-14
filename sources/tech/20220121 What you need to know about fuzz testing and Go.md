[#]: subject: "What you need to know about fuzz testing and Go"
[#]: via: "https://opensource.com/article/22/1/native-go-fuzz-testing"
[#]: author: "Gaurav Kamathe https://opensource.com/users/gkamathe"
[#]: collector: "lujun9972"
[#]: translator: "lxbwolf"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

What you need to know about fuzz testing and Go
======
The Go team has accepted a proposal to add fuzz testing support to the
language.
![Person using a laptop][1]

The usage of [Go][2] is growing rapidly. It is now the preferred language for writing cloud-native software, container software, command-line tools, databases, and more. Go has had built-in [support for testing][3] for quite some time now. It makes writing tests and running them using the Go tool relatively easy.

### What is fuzz testing?

Fuzzing, sometimes also called fuzz testing, is the practice of giving unexpected input to your software. Ideally, this test causes your application to crash, or behave in unexpected ways. Regardless of what happens, you can learn a lot from how your code reacts to data it wasn't programmed to accept, and you can add appropriate error handling.

Any given software program consists of instructions that accept input or data from various sources, then it processes this data and generates appropriate output. As software gets developed, a team of test engineers tests this software to find bugs in the software that can then be reported and fixed. Often, the intent is to see if the software behaves as expected. Testing can further get divided into multiple areas, such as functional testing, integration testing, performance testing, and more. Each focuses on a specific aspect of the software functionality to find bugs or improve reliability or performance.

Fuzzing takes this testing process a step further and tries to provide "invalid" or "random" data to the software program. This is intentional, and the expectation is that the program should crash or behave unexpectedly to uncover bugs in the program so the developers can fix them. Like testing, doing this manually doesn't scale, so many fuzzing tools have been written to automate this process.

### Software testing in Go

As an example to test `Add()` function within `add.go`, you could write tests within `add_test.go` by importing the "testing" package and adding the test functionality within a function starting with `TestXXX()`.

Given this code:


```


func Add(num1, num2 int) int {
}

```

In a file called `add_test.go`, you might have this code for testing:


```


import "testing"

func TestAdd(t *testing.T) {
}

```

Run the test:


```
`$ go test`
```

### Addition of fuzz testing support

The Go team has accepted a [proposal to add fuzz testing support][4] to the language to further this effort. This involves adding a new `testing.F` type, the addition of `FuzzXXX()` functions within the `_test.go` files, and to run these tests with the `-fuzz` option is being added to the Go tool.

In a file called `add_test.go`:


```


func FuzzAdd(f *testing.F) {
}

```

Run the code:


```
`$ go test -fuzz`
```

This [feature is experimental][5] at the time of writing, but it should be included in the 1.18 release. Also, many features like `-keepfuzzing` and `-race` are not supported at the moment. The Go team has recently published [a tutorial on fuzzing][6], which is well worth a read.

### Get the latest features with gotip installation

If you are enthusiastic and wish to try out the feature before the official release, you can utilize `gotip`, which allows you to test upcoming Go features and provide feedback. To install `gotip`, you can use the commands below. After installation, you can use the `gotip` utility to compile and run the program instead of the usual `go` utility.


```


$ go install golang.org/dl/gotip@latest
$ gotip download

$ gotip version
go version devel go1.18-f009910 Thu Jan 6 16:22:21 2022 +0000 linux/amd64
$

```

### Fuzzing opinions in the community

Fuzzing is often a point of discussion among the software community, and we find people on both ends of the spectrum. Some consider it a useful technique to find bugs, especially on the security front. Whereas given the required resources (CPU/memory) for fuzzing, some consider it a waste or prefer other techniques over it. This is even evident in the Go team as well. We can see Go co-founder Rob Pike being slightly skeptical about the uses of fuzzing and its implementation in Go.

> _... Although fuzzing is good at finding certain classes of bugs, it is very expensive in CPU and storage, and cost/benefit ratio remains unclear. I worry about wasting energy and filling up git repos with testdata noise..._
>
> _~_[Rob Pike][7]

However, another member of the Go security team, Filo Sottile, seems quite optimistic about the addition of fuzz support to Go, also backing it up with some examples and wants it to be a part of the development process.

> *I like to say that fuzzing finds bugs at the margin. It's why we are interested in it as the security team: bugs caught at the margin are ones that don't make it into production to become vulnerabilities. *
>
> _We want fuzzing to be part of the development—not build or security—process: make a change to the relevant code…_
>
> _~_[Filo Sottile][8]

### Real-world fuzzing

To me, fuzzing seems quite effective at findings bugs and making systems more secure and resilient. To give an example, even the Linux kernel is fuzz tested using a tool called [syzkaller][9], and it has uncovered a [variety of bugs][10].

[AFL][11]** **is another popular fuzzer, used to fuzz programs written in C/C++.

There were options available for fuzzing Go programs as well in the past, one of them being [go-fuzz][12] which Filo mentions in his GitHub comments

> _The track record of go-fuzz provides pretty amazing evidence that fuzzing is good at finding bugs that humans had not found. In my experience, just a few CPU minutes of fuzzing can be extremely effective at the margin_

### Why add native fuzzing support in Go

If the requirement is to fuzz Go programs and existing tools like `go-fuzz` could do it, why add native fuzzing support to the language? The [Go fuzzing design draft][13] provides some rationale for doing so. The idea was to bring simplicity to the process as using the above tools adds more work for the developer and has many missing features. If you are new to fuzzing, I recommend reading the design draft document.

> Developers could use tools like go-fuzz or fzgo (built on top of go-fuzz) to solve some of their needs. However, each existing solution involves more work than typical Go testing and is missing crucial features. Fuzz testing shouldn't be any more complicated or less feature-complete than other types of Go testing (like benchmarking or unit testing). Existing solutions add extra overhead, such as custom command-line tools,

### Fuzz tooling

Fuzzing is a welcome addition to the Go language's long list of desired features. Although experimental for now, it's expected to become robust in upcoming releases. This gives sufficient time to try it out and explore its use cases. Rather than seeing it as an overhead, it should be seen as an effective testing tool to uncover hidden bugs if used correctly. Teams using Go should encourage its use, starting with developers writing small fuzz tests and testing teams extending it further to utilize its potential fully.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/native-go-fuzz-testing

作者：[Gaurav Kamathe][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://go.dev/
[3]: https://pkg.go.dev/testing
[4]: https://github.com/golang/go/issues/44551
[5]: https://go.dev/blog/fuzz-beta
[6]: https://go.dev/doc/tutorial/fuzz
[7]: https://github.com/golang/go/issues/44551#issuecomment-784584785
[8]: https://github.com/golang/go/issues/44551#issuecomment-784655571
[9]: https://github.com/google/syzkaller
[10]: https://github.com/google/syzkaller/blob/master/docs/linux/found_bugs.md
[11]: https://github.com/google/AFL
[12]: https://github.com/dvyukov/go-fuzz
[13]: https://go.googlesource.com/proposal/+/master/design/draft-fuzzing.md

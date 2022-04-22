[#]: subject: "My favorite build options for Go"
[#]: via: "https://opensource.com/article/22/4/go-build-options"
[#]: author: "Gaurav Kamathe https://opensource.com/users/gkamathe"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

My favorite build options for Go
======
These handy Go build options can help you understand the Go compilation process better.

![GitHub launches Open Source Friday][1]

(Image by: Opensource.com)

One of the most gratifying parts of learning a new programming language is finally running an executable and getting the desired output. When I discovered the programming language Go, I started by reading some sample programs to get acquainted with the syntax, then wrote small test programs. Over time, this approach helped me get familiar with compiling and building the program.

The build options available for Go provide ways to gain more control over the build process. They can also provide additional information to help break the process into smaller parts. In this article, I will demonstrate some of the options I have used. Note: I am using the terms build and compile to mean the same thing.

### Getting started with Go

I am using Go version 1.16.7; however, the command given here should work on most recent versions as well. If you do not have Go installed, you can download it from the [Go website][2] and follow the instructions for installation. Verify the version you have installed by opening a prompt command and typing:

```
$ go version
```

The response should look like this, depending on your version.

```
go version go1.16.7 linux/amd64
$
```

### Basic compilation and execution of Go programs

I'll start with a sample Go program that simply prints "Hello World" to the screen.

```
$ cat hello.go
package main
import "fmt"
func main() {
        fmt.Println("Hello World")}
$
```

Before discussing more advanced options, I'll explain how to compile a sample Go program. I make use of the `build `option followed by the Go program source file name, which in this case is `hello.go`.

```
$ go build hello.go
```

If everything is working correctly, you should see an executable named `hello` created in your current directory. You can verify that it is in ELF binary executable format (on the Linux platform) by using the file command. You can also execute it and see that it outputs "Hello World."

```
$ ls
hello  hello.go
$
$ file ./hello
./hello: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, not stripped
$
$ ./hello
Hello World
$
```

Go provides a handy `run` option in case you do not want to have a resulting binary and instead want to see if the program works correctly and prints the desired output. Keep in mind that even if you do not see the executable in your current directory, Go still compiles and produces the executable somewhere, `run`s it, then removes it from the system. I'll explain in a later section of this article.

```
$ go run hello.go
Hello World
$
$ ls
hello.go
$
```

### Under the hood

The above commands worked like a breeze to run my program with minimal effort. However, if you want to find out what Go does under the hood to compile these programs, Go provides a `-x` option that prints everything Go does to produce the executable.

A quick look tells you that Go creates a temporary working directory within `/tmp`, produces the executable, and then moves it to the current directory where the source Go program was present.

```
$ go build -x hello.goWORK=/tmp/go-build1944767317mkdir -p $WORK/b001/<< snip >>mkdir -p $WORK/b001/exe/cd ./usr/lib/golang/pkg/tool/linux_amd64/link -o $WORK \/b001/exe/a.out -importcfg $WORK/b001 \/importcfg.link -buildmode=exe -buildid=K26hEYzgDkqJjx2Hf-wz/\
nDueg0kBjIygx25rYwbK/W-eJaGIOdPEWgwC6o546 \/K26hEYzgDkqJjx2Hf-wz -extld=gcc /root/.cache/go-build /cc \/cc72cb2f4fbb61229885fc434995964a7a4d6e10692a23cc0ada6707c5d3435b-d/usr/lib/golang/pkg/tool/linux_amd64/buildid -w $WORK \/b001/exe/a.out # internalmv $WORK/b001/exe/a.out hellorm -r $WORK/b001/
```

This helps solve the mysteries when a program runs but no resulting executable is created within the current directory. Using `-x `shows that the executable file was indeed created in a` /tmp `working directory and was executed. However, unlike the `build` option, the executable did not move to the current directory, making it appear that no executable was created.

```
$ go run -x hello.gomkdir -p $WORK/b001/exe/cd ./usr/lib/golang/pkg/tool/linux_amd64/link -o $WORK/b001 \/exe/hello -importcfg $WORK/b001/importcfg.link -s -w -buildmode=exe -buildid=hK3wnAP20DapUDeuvAAS/E_TzkbzwXz6tM5dEC8Mx \/7HYBzuaDGVdaZwSMEWAa/hK3wnAP20DapUDeuvAAS -extld=gcc \/root/.cache/go-build/75/ \
7531fcf5e48444eed677bfc5cda1276a52b73c62ebac3aa99da3c4094fa57dc3-d$WORK/b001/exe/hello
Hello World
```

### Mimic compilation without producing the executable

Suppose you don't want to compile the program and produce an actual binary, but you do want to see all steps in the process. You can do so by using the `-n` build option, which prints the steps that it would normally run without actually creating the binary.

```
$ go build -n hello.go
```

### Save temp directories

A lot of work happens in the `/tmp` working directory, which is deleted once the executable is created and run. But what if you want to see which files were created in the compilation process? Go provides a ``-work`` option that can be used when compiling a program. The ``-work`` option prints the working directory path in addition to running the program, but it doesn't delete the working directory afterward, so you can move to that directory and examine all the files created during the compile process.

```
$ go run -work hello.goWORK=/tmp/go-build3209320645
Hello World
$
$ find /tmp/go-build3209320645/tmp/go-build3209320645/tmp/go-build3209320645/b001/tmp/go-build3209320645/b001/importcfg.link/tmp/go-build3209320645/b001/exe/tmp/go-build3209320645/b001/exe/hello
$
$ /tmp/go-build3209320645/b001/exe/hello
Hello World
$
```

### Alternative compilation options

What if, instead of using the build/run magic of Go, you want to compile the program by hand and end up with an executable that can be run directly by your operating system (in this case, Linux)? This process can be divided into two parts: compile and link. Use the `tool` option to see how it works.

First, use the `tool compile` option to produce the resulting `ar` `ar`chive file, which contains the `.o` intermediate file. Next, use the `tool link` option on this hello`.o` file to produce the final executable, which can then run.

```
$ go tool compile hello.go
$
$ file hello.o
hello.o: current ar archive
$
$ ar t hello.o
__.PKGDEF
_go_.o
$
$ go tool link -o hello hello.o
$
$ file hello
hello: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, not stripped
$
$ ./hello
Hello World
$
```

To peek further into the link process of producing the executable from the `hello.o` file, you can use the `-v` option, which searches for the `runtime.a` file included in every Go executable.

```
$ go tool link -v -o hello hello.o
HEADER = -H5 -T0x401000 -R0x1000
searching for runtime.a in /usr/lib/golang/pkg/linux_amd64/runtime.a82052 symbols, 18774 reachable
        1 package symbols, 1106 hashed symbols, 77185 non-package symbols, 3760 external symbols81968 liveness data
$
```

### Cross-compilation options

Now that I've explained the compilation of a Go program, I'll demonstrate how Go allows you to `build` an executable targeted at different hardware architectures and operating systems by providing two environment variables—GOOS and GOARCH—before the actual `build` command.

Why does this matter? You can see an example when an executable produced for the ARM (aarch64) architecture won't run on an Intel (x86_64) architecture and produces an Exec format error.

These options make it trivial to produce cross-platform binaries.

```
$ GOOS=linux GOARCH=arm64 go build hello.go
$
$ file ./hello
./hello: ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), statically linked, not stripped
$
$ ./hello
bash: ./hello: cannot execute binary file: Exec format error
$
$ uname -m
x86_64
$
```

You can read my earlier blog post about my experiences with [cross-compilation using Go][3] to learn more.

### View underlying assembly instructions

The source code is not directly converted to an executable, though it generates an intermediate assembly format which is then assembled into an executable. In Go, this is mapped to an intermediate assembly format rather than the underlying hardware assembly instructions.

To view this intermediate assembly format, use `-gcflags` followed by `-S` given to the build command. This command shows the assembly instructions.

```
$ go build -gcflags="-S" hello.go# command-line-arguments"".main STEXT size=138 args=0x0 locals=0x58 funcid=0x0
        0x0000 00000 (/test/hello.go:5) TEXT    "".main(SB), ABIInternal, $88-0
        0x0000 00000 (/test/hello.go:5) MOVQ    (TLS), CX
        0x0009 00009 (/test/hello.go:5) CMPQ    SP, 16(CX)
        0x000d 00013 (/test/hello.go:5) PCDATA  $0, $-2
        0x000d 00013 (/test/hello.go:5) JLS     128<< snip >>
$
```

You can also use the `objdump -s` option, as shown below, to see the assembly instructions for an executable program that was already compiled.

```
$ ls
hello  hello.go
$
$
$ go tool objdump -s main.main hello
TEXT main.main(SB) /test/hello.go
  hello.go:5            0x4975a0                64488b0c25f8ffffff      MOVQ FS:0xfffffff8, CX                  
  hello.go:5            0x4975a9                483b6110                CMPQ 0x10(CX), SP                       
  hello.go:5            0x4975ad                7671                    JBE 0x497620                            
  hello.go:5            0x4975af                4883ec58                SUBQ $0x58, SP                          
  hello.go:6            0x4975d8                4889442448              MOVQ AX, 0x48(SP)                       << snip >>
$
```

### Strip binaries to reduce their size

Go binaries are typically large. For example, a simple Hello World program produces a 1.9M-sized binary.

```
$ go build hello.go
$
$ du -sh hello
1.9M    hello
$
$ file hello
hello: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, not stripped
$
```

To reduce the size of the resulting binary, you can strip off information not needed during execution. Using `-ldflags` followed by `-s -w` flags makes the resulting binary slightly lighter, at 1.3M.

```
$ go build -ldflags="-s -w" hello.go
$
$ du -sh hello
1.3M    hello
$
$ file hello
hello: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, stripped
$
```

### Conclusion

I hope this article introduced you to some handy Go build options that can help you understand the Go compilation process better. For additional information on the build process and other interesting options available, refer to the help section:

```
$ go help build
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/4/go-build-options

作者：[Gaurav Kamathe][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/build_structure_tech_program_code_construction.png
[2]: https://go.dev/doc/install
[3]: https://opensource.com/article/21/1/go-cross-compiling

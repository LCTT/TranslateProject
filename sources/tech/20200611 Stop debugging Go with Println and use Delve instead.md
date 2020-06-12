[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Stop debugging Go with Println and use Delve instead)
[#]: via: (https://opensource.com/article/20/6/debug-go-delve)
[#]: author: (Gaurav Kamathe https://opensource.com/users/gkamathe)

Stop debugging Go with Println and use Delve instead
======
Delve is packed with functionality to make debugging a breeze.
![Bug tracking magnifying glass on computer screen][1]

When was the last time you tried to learn a new programming language? Do you stick with your tried and true, or are you one of the brave souls who tries out a new one as soon as it is announced? Either way, learning a new language can be extremely useful, and a lot of fun.

You try out with a simple "Hello, world!" then move onto writing some sample code and executing it, making minor changes along the way and then moving on from there. I am sure we have all gone through this experience no matter which technology we've worked on. Though if you do manage to stay with a language for some time, and you wish to become proficient in it, there are a few things that can help you along the way.

One of those things is a debugger. Some people prefer debugging using simple "print" statements in code, and they are fine for a few simple line programs; however, if you are working on a large project with multiple developers and thousands of lines of code, it makes sense to invest in a debugger.

I've recently started learning the Go programming language, and in this article, we will explore a debugger called Delve. Delve is a special utility made to debug Go programs, and we will cover some of its features using some sample Go code. Don't worry about the Go code examples presented here; they are understandable even if you have never programmed in Go before. One of the goals of Go is simplicity, so the code is consistent, which can be easier to understand and interpret.

### Introduction to Delve

Delve is an open source project hosted at [GitHub][2].

In its own words:

_Delve is a debugger for the Go programming language. The goal of the project is to provide a simple, full-featured debugging tool for Go. Delve should be easy to invoke and easy to use. Chances are if you're using a debugger, things aren't going your way. With that in mind, Delve should stay out of your way as much as possible._

Let's take a closer look.

My test system is a laptop running Fedora Linux along with the following Go compiler version:


```
$ cat /etc/fedora-release
Fedora release 30 (Thirty)
$
$ go version
go version go1.12.17 linux/amd64
$
```

### Golang installation

If you do not have Go installed, you can get it by simply running the following command to fetch it from your configured repositories.


```
`$ dnf install golang.x86_64`
```

Alternatively, you can visit the [install page][3] for other installation options suitable for your OS distribution.

Before we get started, please ensure that the following required PATHS are set, as required by Go tools. If these paths are not set, some of the examples might not work. These can be easily set as environment variables in your SHELL's RC file, like the `$HOME/bashrc` file in my case.


```
$ go env | grep GOPATH
GOPATH="/home/user/go"
$
$ go env | grep GOBIN
GOBIN="/home/user/go/gobin"
$
```

### Delve installation

You can install Delve by running a simple `go get` command, as shown below. `go get` is the Golang way of downloading and installing required packages from external sources. If you do face any issues with installation, please refer to the install instructions for Delve [here][4].


```
$ go get -u github.com/go-delve/delve/cmd/dlv
$
```

Running the above command downloads Delve to your $GOPATH location, which, in the default case, happens to be $HOME/go. It will be different if you have set $GOPATH to something else.

You can move to the go/ directory, within which you will see `dlv` under bin/ directory.


```
$ ls -l $HOME/go
total 8
drwxrwxr-x. 2 user user 4096 May 25 19:11 bin
drwxrwxr-x. 4 user user 4096 May 25 19:21 src
$
$ ls -l ~/go/bin/
total 19596
-rwxrwxr-x. 1 user user 20062654 May 25 19:17 dlv
$
```

Since you installed Delve under $GOPATH, it is also available as a regular shell command, so you do not have to move to the directory where it is installed every time. You can verify `dlv` is correctly installed by running it with the `version` option. The version it installed is 1.4.1.


```
$ which dlv
~/go/bin/dlv
$
$ dlv version
Delve Debugger
Version: 1.4.1
Build: $Id: bda606147ff48b58bde39e20b9e11378eaa4db46 $
$
```

Now, let's use Delve with some Go programs to understand its features and how to use them. As we do with all programs, let's start with a simple "Hello, world!" message, which, in Go, is called `hello.go`.

Remember, I am placing these sample programs within the $GOBIN directory.


```
$ pwd
/home/user/go/gobin
$
$ cat hello.go
package main

import "fmt"

func main() {
        fmt.Println("Hello, world!")
}
$
```

To build a Go program, you run the `build` command and provide it with the source file using the .go extention. If the program is free of any syntax issues, the Go compiler compiles it and puts out a binary or executables file. This file can then be executed directly, and we see the "Hello, world!" message displayed onscreen.


```
$ go build hello.go
$
$ ls -l hello
-rwxrwxr-x. 1 user user 1997284 May 26 12:13 hello
$
$ ./hello
Hello, world!
$
```

### Loading a program in Delve

There are two ways to load a program into the Delve debugger.

**Using the debug argument when source code is not yet compiled to binary.**

The first way is to use the **debug** command when you simply need to source files. Delve compiles a binary for you named **__debug_bin**, and loads it into the debugger.

In this example, move to the directory where **hello.go** is present and run the **dlv debug** command. If there are multiple Go source files within a directory and each has its own main function, then Delve might throw an error, expecting a single program or a single project to build a binary from. Should that occur, you're better off using the second option, presented below.


```
$ ls -l
total 4
-rw-rw-r--. 1 user user 74 Jun  4 11:48 hello.go
$
$ dlv debug
Type 'help' for list of commands.
(dlv)
```

Now open another terminal and list the contents of the same directory. You see an additional **__debug_bin** binary that was compiled from the source code and loaded into the debugger. You can now move to the **dlv** prompt to continue using Delve further.
 


```
$ ls -l
total 2036
-rwxrwxr-x. 1 user user 2077085 Jun  4 11:48 __debug_bin
-rw-rw-r--. 1 user user      74 Jun  4 11:48 hello.go
$
```

**Using the exec argument**
The second method to load a program into Delve is useful when you have a pre-compiled Go binary, or one that you have already compiled using the **go build** command, and don't want Delve to compile it to a `__debug_bin` binary. In such cases, use the **exec** argument to load the binary directory into the Delve debugger.


```
$ ls -l
total 4
-rw-rw-r--. 1 user user 74 Jun  4 11:48 hello.go
$
$ go build hello.go
$
$ ls -l
total 1956
-rwxrwxr-x. 1 user user 1997284 Jun  4 11:54 hello
-rw-rw-r--. 1 user user      74 Jun  4 11:48 hello.go
$
$ dlv exec ./hello
Type 'help' for list of commands.
(dlv)
```

### Getting help within Delve

At the **dlv** prompt, you can run `help` to have a look at the various help options available in Delve. The command list is quite extensive, and we will cover some of the important features here. Following is an overview of Delve's functionality.


```
(dlv) help
The following commands are available:

Running the program:

Manipulating breakpoints:

Viewing program variables and memory:

Listing and switching between threads and goroutines:

Viewing the call stack and selecting frames:

Other commands:

Type help followed by a command for full documentation.
(dlv)
```

#### Setting breakpoints

Now that we have loaded the hello.go program within the Delve debugger, let's set the breakpoint on our main function and then confirm it. Within Go, the main program starts with `main.main`, so you need to provide this name to the `break command`. Next, we will see if the breakpoint was set correctly using the `breakpoints` command.

Also, remember you can use shorthands for commands, so instead of using `break main.main`, you can also use `b main.main` to the same effect, or `bp` instead of `breakpoints`. To find the exact shorthand for a command, please refer to the help section by running the `help` command.


```
(dlv) break main.main
Breakpoint 1 set at 0x4a228f for main.main() ./hello.go:5
(dlv) breakpoints
Breakpoint runtime-fatal-throw at 0x42c410 for runtime.fatalthrow() /usr/lib/golang/src/runtime/panic.go:663 (0)
Breakpoint unrecovered-panic at 0x42c480 for runtime.fatalpanic() /usr/lib/golang/src/runtime/panic.go:690 (0)
        print runtime.curg._panic.arg
Breakpoint 1 at 0x4a228f for main.main() ./hello.go:5 (0)
(dlv)
```

#### Continue execution of the program

Now, let's continue running the program using "continue." It will run until it hits a breakpoint, which, in our case, is the `main.main` or the main function. From there, we can use the `next` command to execute the program line by line. Notice that, once we move ahead of `fmt.Println("Hello, world!")`, we can see that `Hello, world!` is printed to the screen while we are still within the debugger session.


```
(dlv) continue
&gt; main.main() ./hello.go:5 (hits goroutine(1):1 total:1) (PC: 0x4a228f)
     1: package main
     2:
     3: import "fmt"
     4:
=&gt;   5:      func main() {
     6:         fmt.Println("Hello, world!")
     7: }
(dlv) next
&gt; main.main() ./hello.go:6 (PC: 0x4a229d)
     1: package main
     2:
     3: import "fmt"
     4:
     5: func main() {
=&gt;   6:              fmt.Println("Hello, world!")
     7: }
(dlv) next
Hello, world!
&gt; main.main() ./hello.go:7 (PC: 0x4a22ff)
     2:
     3: import "fmt"
     4:
     5: func main() {
     6:         fmt.Println("Hello, world!")
=&gt;   7:      }
(dlv)
```

#### Quitting Delve

If you wish to quit the debugger at any time, you can run the `quit` command, and you will be returned to the shell prompt. Pretty simple, right?


```
(dlv) quit
$
```

Let's use some other Go programs to explore some other Delve features. This time, we will pick a program from the [Golang tour][5]. If you are learning Go, the Golang tour should be your first stop.

The following program, `functions.go`, simply displays how functions are defined and called in a Go program. Here, we have a simple `add()` function that adds two numbers and returns their value. You can build the program and execute it, as shown below.


```
$ cat functions.go
package main

import "fmt"

func add(x int, y int) int {
        return x + y
}

func main() {
        fmt.Println(add(42, 13))
}
$
```

You can build the program and execute it as shown below.


```
$ go build functions.go  &amp;&amp; ./functions
55
$
```

#### Stepping into functions

As shown earlier, let's load the binary into the Delve debugger using one of the options mentioned earlier, again setting a breakpoint at `main.main` and continuing to run the program while we hit the breakpoint. Then hit `next` until you reach `fmt.Println(add(42, 13))`; here we make a call to the `add()` function. We can use the Delve `step` command to move from the `main` function to the `add()` function, as seen below.


```
$ dlv debug
Type 'help' for list of commands.
(dlv) break main.main
Breakpoint 1 set at 0x4a22b3 for main.main() ./functions.go:9
(dlv) c
&gt; main.main() ./functions.go:9 (hits goroutine(1):1 total:1) (PC: 0x4a22b3)
     4:
     5: func add(x int, y int) int {
     6:         return x + y
     7: }
     8:
=&gt;   9:      func main() {
    10:         fmt.Println(add(42, 13))
    11: }
(dlv) next
&gt; main.main() ./functions.go:10 (PC: 0x4a22c1)
     5: func add(x int, y int) int {
     6:         return x + y
     7: }
     8:
     9: func main() {
=&gt;  10:              fmt.Println(add(42, 13))
    11: }
(dlv) step
&gt; main.add() ./functions.go:5 (PC: 0x4a2280)
     1: package main
     2:
     3: import "fmt"
     4:
=&gt;   5:      func add(x int, y int) int {
     6:         return x + y
     7: }
     8:
     9: func main() {
    10:         fmt.Println(add(42, 13))
(dlv)
```

#### Set breakpoint using filename: linenumber

Above, we went through `main` and then moved to the `add()` function, but you can also use the `filename:linenumber` combination to set a breakpoint directly where we want it. Following is another way of setting a breakpoint at the start of the `add()` function.


```
(dlv) break functions.go:5
Breakpoint 1 set at 0x4a2280 for main.add() ./functions.go:5
(dlv) continue
&gt; main.add() ./functions.go:5 (hits goroutine(1):1 total:1) (PC: 0x4a2280)
     1: package main
     2:
     3: import "fmt"
     4:
=&gt;   5:      func add(x int, y int) int {
     6:         return x + y
     7: }
     8:
     9: func main() {
    10:         fmt.Println(add(42, 13))
(dlv)
```

#### View current stack details

Now that we are at the `add()` function, we can view the current contents of the stack using the `stack` command in Delve. This shows the topmost function `add()` at 0 where we are, followed by `main.main` at 1 from where the `add()` function was called. Functions below `main.main` belong to the Go runtime, which is responsible for loading and executing the program.


```
(dlv) stack
0  0x00000000004a2280 in main.add
   at ./functions.go:5
1  0x00000000004a22d7 in main.main
   at ./functions.go:10
2  0x000000000042dd1f in runtime.main
   at /usr/lib/golang/src/runtime/proc.go:200
3  0x0000000000458171 in runtime.goexit
   at /usr/lib/golang/src/runtime/asm_amd64.s:1337
(dlv)
```

#### Move between frames

Using the `frame` command in Delve, we can switch between the above frames at will. In the example below, using `frame 1` switches us from within the `add()` frame to the `main.main` frame, and so on.


```
(dlv) frame 0
&gt; main.add() ./functions.go:5 (hits goroutine(1):1 total:1) (PC: 0x4a2280)
Frame 0: ./functions.go:5 (PC: 4a2280)
     1: package main
     2:
     3: import "fmt"
     4:
=&gt;   5:      func add(x int, y int) int {
     6:         return x + y
     7: }
     8:
     9: func main() {
    10:         fmt.Println(add(42, 13))
(dlv) frame 1
&gt; main.add() ./functions.go:5 (hits goroutine(1):1 total:1) (PC: 0x4a2280)
Frame 1: ./functions.go:10 (PC: 4a22d7)
     5: func add(x int, y int) int {
     6:         return x + y
     7: }
     8:
     9: func main() {
=&gt;  10:              fmt.Println(add(42, 13))
    11: }
(dlv)
```

**Print function arguments**

A function often accepts multiple arguments to work on. In the case of the `add()` function, it accepts two integers. Delve has a handy command called `args`, which displays the command-line arguments passed to the function.


```
(dlv) args
x = 42
y = 13
~r2 = 824633786832
(dlv)
```

#### View disassembly

Since we are dealing with compiled binaries, it is extremely helpful to be able to see the assembly language instructions produced by the compiler. Delve provides a `disassemble` command to view these. In the example below, we use it to view the disassembly instructions for the `add()` function.


```
(dlv) step
&gt; main.add() ./functions.go:5 (PC: 0x4a2280)
     1: package main
     2:
     3: import "fmt"
     4:
=&gt;   5:      func add(x int, y int) int {
     6:         return x + y
     7: }
     8:
     9: func main() {
    10:         fmt.Println(add(42, 13))
(dlv) disassemble
TEXT main.add(SB) /home/user/go/gobin/functions.go
=&gt;   functions.go:5  0x4a2280   48c744241800000000   mov qword ptr [rsp+0x18], 0x0
        functions.go:6  0x4a2289   488b442408           mov rax, qword ptr [rsp+0x8]
        functions.go:6  0x4a228e   4803442410           add rax, qword ptr [rsp+0x10]
        functions.go:6  0x4a2293   4889442418           mov qword ptr [rsp+0x18], rax
        functions.go:6  0x4a2298   c3                   ret
(dlv)
```

#### Stepout of functions

Another feature is `stepout`, which allows us to return back to where the function was called from. In our example, if we wish to return to the `main.main` function, we can simply run the `stepout` command and it will take us back. This can be quite a handy tool to help you move around in a large codebase.


```
(dlv) stepout
&gt; main.main() ./functions.go:10 (PC: 0x4a22d7)
Values returned:
        ~r2: 55

     5: func add(x int, y int) int {
     6:         return x + y
     7: }
     8:
     9: func main() {
=&gt;  10:              fmt.Println(add(42, 13))
    11: }
(dlv)
```

Let's use another sample program from the [Go tour][6] to see how Delve deals with variables in Go. The following sample program defines and initializes some variables of different types. You can build the program and execute it.


```
$ cat variables.go
package main

import "fmt"

var i, j int = 1, 2

func main() {
        var c, python, java = true, false, "no!"
        fmt.Println(i, j, c, python, java)
}
$

$ go build variables.go &amp;&amp; ./variables
1 2 true false no!
$
```

#### Print variable information

As stated earlier, use `delve debug` to load the program in the debugger. You can use the `print` command from within Delve along with the variable name to show their current values.


```
(dlv) print c
true
(dlv) print java
"no!"
(dlv)
```

Alternatively, you can use the `locals` command to print all local variables within a function.


```
(dlv) locals
python = false
c = true
java = "no!"
(dlv)
```

If you are not aware of the type of the variable, you can use the `whatis` command along with the variable name to print the type.


```
(dlv) whatis python
bool
(dlv) whatis c
bool
(dlv) whatis java
string
(dlv)
```

### Conclusion

So far, we have only scratched the surface of the features Delve offers. You can refer to the `help` section and try out various other commands. Some of the other useful features include attaching Delve to running Go programs (daemons!) or even using Delve to explore some of the internals of Golang libraries, provided you have the Go source code package installed. Keep exploring!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/debug-go-delve

作者：[Gaurav Kamathe][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bug_software_issue_tracking_computer_screen.jpg?itok=6qfIHR5y (Bug tracking magnifying glass on computer screen)
[2]: https://github.com/go-delve/delve
[3]: https://golang.org/doc/install
[4]: https://github.com/go-delve/delve/blob/master/Documentation/installation/linux/install.md
[5]: https://tour.golang.org/basics/4
[6]: https://tour.golang.org/basics/9

[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Go compiler intrinsics)
[#]: via: (https://dave.cheney.net/2019/08/20/go-compiler-intrinsics)
[#]: author: (Dave Cheney https://dave.cheney.net/author/davecheney)

Go compiler intrinsics
======

Go allows authors to write functions in assembly if required. This is called a _stub_ or _forward_ declaration.

```
package asm

// Add returns the sum of a and b.
func Add(a int64, b int64) int64
```

Here we’re declaring `Add`, a function which takes two `int64`‘s and returns their sum.`Add` is a normal Go function declaration, except it is missing the function body.

If we were to try to compile this package the compiler, justifiably, complains;

```
% go build
examples/asm
./decl.go:4:6: missing function body
```

To satisfy the compiler we must supply a body for `Add` via assembly, which we do by adding a `.s` file in the same package.

```
TEXT ·Add(SB),$0-24
        MOVQ a+0(FP), AX
        ADDQ b+8(FP), AX
        MOVQ AX, ret+16(FP)
        RET
```

Now we can build, test, and use our `Add` function just like normal Go code. But, there’s a problem, assembly functions cannot be inlined.

This has long been a complaint by Go developers who want to use assembly either for performance or to access operations which are not exposed in the language. Some examples would be vector instructions, atomic instructions, and so on. Without the ability to inline assembly functions writing these functions in Go can have a relatively large overhead.

```
var Result int64

func BenchmarkAddNative(b *testing.B) {
        var r int64
        for i := 0; i < b.N; i++ {
                r = int64(i) + int64(i)
        }
        Result = r
}

func BenchmarkAddAsm(b *testing.B) {
        var r int64
        for i := 0; i < b.N; i++ {
                r = Add(int64(i), int64(i))
        }
        Result = r
 }
```

```
BenchmarkAddNative-8    1000000000               0.300 ns/op
BenchmarkAddAsm-8       606165915                1.93 ns/op
```

Over the years there have been various proposals for an inline assembly syntax similar to gcc’s `asm(...)` directive. None have been accepted by the Go team. Instead, Go has added _intrinsic functions_[1][1].

An intrinsic function is Go code written in regular Go. These functions are known the the Go compiler which contains replacements which it can substitute during compilation. As of Go 1.13 the packages which the compiler knows about are:

  * `math/bits`
  * `sync/atomic`



The functions in these packages have baroque signatures but this lets the compiler, if your architecture supports a more efficient way of performing the operation, transparently replace the function call with comparable native instructions.

For the remainder of this post we’ll study two different ways the Go compiler produces more efficient code using intrinsics.

### Ones count

Population count, the number of `1` bits in a word, is an important cryptographic and compression primitive. Because this is an important operation most modern CPUs provide a native hardware implementation.

The `math/bits` package exposes support for this operation via the `OnesCount` series of functions. The various `OnesCount` functions are recognised by the compiler and, depending on the CPU architecture and the version of Go, will be replaced with the native hardware instruction.

To see how effective this can be lets compare three different ones count implementations. The first is Kernighan’s Algorithm[2][2].

```
func kernighan(x uint64) int {
        var count int
        for ; x > 0; x &= (x - 1) {
                count++
        }
        return count                
}    
```

This algorithm has a maximum loop count of the number of bits set; the more bits set, the more loops it will take.

The second algorithm is taken from Hacker’s Delight via [issue 14813][3].

```
func hackersdelight(x uint64) int {
        const m1 = 0x5555555555555555
        const m2 = 0x3333333333333333
        const m4 = 0x0f0f0f0f0f0f0f0f
        const h01 = 0x0101010101010101

        x -= (x >> 1) & m1
        x = (x & m2) + ((x >> 2) & m2)
        x = (x + (x >> 4)) & m4
        return int((x * h01) >> 56)
 }
```

Lots of clever bit twiddling allows this version to run in constant time and optimises very well if the input is a constant (the whole thing optimises away if the compiler can figure out the answer at compiler time).

Let’s benchmark these implementations against `math/bits.OnesCount64`.

```
var Result int

func BenchmarkKernighan(b *testing.B) {
        var r int
        for i := 0; i < b.N; i++ {
                r = kernighan(uint64(i))
        }
        Result = r
}

func BenchmarkPopcnt(b *testing.B) {
        var r int
        for i := 0; i < b.N; i++ {
                r = hackersdelight(uint64(i))
        }
        Result = r
}

func BenchmarkMathBitsOnesCount64(b *testing.B) {
        var r int
        for i := 0; i < b.N; i++ {
                r = bits.OnesCount64(uint64(i))
        }
        Result = r
}
```

To keep it fair, we’re feeding each function under test the same input; a sequence of integers from zero to `b.N`. This is fairer to Kernighan’s method as its runtime increases with the number of one bits in the input argument.[3][4]

```
BenchmarkKernighan-8                    100000000               11.2 ns/op
BenchmarkPopcnt-8                       618312062                2.02 ns/op
BenchmarkMathBitsOnesCount64-8          1000000000               0.565 ns/op
```

The winner by nearly 4x is `math/bits.OnesCount64`, but is this really using a hardware instruction, or is the compiler just doing a better job at optimising this code? Let’s check the assembly

```
% go test -c
% go tool objdump -s MathBitsOnesCount popcnt-intrinsic.test
TEXT examples/popcnt-intrinsic.BenchmarkMathBitsOnesCount64(SB) /examples/popcnt-intrinsic/popcnt_test.go
   popcnt_test.go:45     0x10f8610               65488b0c2530000000      MOVQ GS:0x30, CX
   popcnt_test.go:45     0x10f8619               483b6110                CMPQ 0x10(CX), SP
   popcnt_test.go:45     0x10f861d               7668                    JBE 0x10f8687
   popcnt_test.go:45     0x10f861f               4883ec20                SUBQ $0x20, SP
   popcnt_test.go:45     0x10f8623               48896c2418              MOVQ BP, 0x18(SP)
   popcnt_test.go:45     0x10f8628               488d6c2418              LEAQ 0x18(SP), BP
   popcnt_test.go:47     0x10f862d               488b442428              MOVQ 0x28(SP), AX
   popcnt_test.go:47     0x10f8632               31c9                    XORL CX, CX
   popcnt_test.go:47     0x10f8634               31d2                    XORL DX, DX
   popcnt_test.go:47     0x10f8636               eb03                    JMP 0x10f863b
   popcnt_test.go:47     0x10f8638               48ffc1                  INCQ CX
   popcnt_test.go:47     0x10f863b               48398808010000          CMPQ CX, 0x108(AX)
   popcnt_test.go:47     0x10f8642               7e32                    JLE 0x10f8676
   popcnt_test.go:48     0x10f8644               803d29d5150000          CMPB $0x0, runtime.x86HasPOPCNT(SB)
   popcnt_test.go:48     0x10f864b               740a                    JE 0x10f8657
   popcnt_test.go:48     0x10f864d               4831d2                  XORQ DX, DX
   popcnt_test.go:48     0x10f8650               f3480fb8d1              POPCNT CX, DX // math/bits.OnesCount64
   popcnt_test.go:48     0x10f8655               ebe1                    JMP 0x10f8638
   popcnt_test.go:47     0x10f8657               48894c2410              MOVQ CX, 0x10(SP)
   popcnt_test.go:48     0x10f865c               48890c24                MOVQ CX, 0(SP)
   popcnt_test.go:48     0x10f8660               e87b28f8ff              CALL math/bits.OnesCount64(SB)
   popcnt_test.go:48     0x10f8665               488b542408              MOVQ 0x8(SP), DX
   popcnt_test.go:47     0x10f866a               488b442428              MOVQ 0x28(SP), AX
   popcnt_test.go:47     0x10f866f               488b4c2410              MOVQ 0x10(SP), CX
   popcnt_test.go:48     0x10f8674               ebc2                    JMP 0x10f8638
   popcnt_test.go:50     0x10f8676               48891563d51500          MOVQ DX, examples/popcnt-intrinsic.Result(SB)
   popcnt_test.go:51     0x10f867d               488b6c2418              MOVQ 0x18(SP), BP
   popcnt_test.go:51     0x10f8682               4883c420                ADDQ $0x20, SP
   popcnt_test.go:51     0x10f8686               c3                      RET
   popcnt_test.go:45     0x10f8687               e884eef5ff              CALL runtime.morestack_noctxt(SB)
   popcnt_test.go:45     0x10f868c               eb82                    JMP examples/popcnt-intrinsic.BenchmarkMathBitsOnesCount64(SB)
   :-1                   0x10f868e               cc                      INT $0x3
   :-1                   0x10f868f               cc                      INT $0x3
```

There’s quite a bit going on here, but the key take away is on line 48 (taken from the source code of the `_test.go` file) the program is using the x86 `POPCNT` instruction as we hoped. This turns out to be faster than bit twiddling.

Of interest is the comparison two instructions prior to the `POPCNT`,

```
CMPB $0x0, runtime.x86HasPOPCNT(SB)
```

As not all intel CPUs support `POPCNT` the Go runtime records at startup if the CPU has the necessary support and stores the result in `runtime.x86HasPOPCNT`. Each time through the benchmark loop the program is checking _does the CPU have POPCNT support_ before it issues the `POPCNT` request.

The value of `runtime.x86HasPOPCNT` isn’t expected to change during the life of the program’s execution so the result of the check should be highly predictable making the check relatively cheap.

### Atomic counter

As well as generating more efficient code, intrinsic functions are just regular Go code, the rules of inlining (including mid stack inlining) apply equally to them.

Here’s an example of an atomic counter type. It’s got methods on types, method calls several layers deep, multiple packages, etc.

```
import (
         "sync/atomic"
)

type counter uint64

func (c counter) get() uint64 {
         return atomic.LoadUint64((uint64)(c))
}

func (c counter) inc() uint64 {
        return atomic.AddUint64((uint64)(c), 1)
}

func (c counter) reset() uint64 {
        return atomic.SwapUint64((uint64)(c), 0)
}

var c counter

func f() uint64 {
        c.inc()
        c.get()
        return c.reset()
}
```

You’d be forgiven for thinking this would have a lot of overhead. However, because of the interaction between inlining and compiler intrinsics, this code collapses down to efficient native code on most platforms.

```
TEXT main.f(SB) examples/counter/counter.go
   counter.go:23         0x10512e0               90                      NOPL
   counter.go:29         0x10512e1               b801000000              MOVL $0x1, AX
   counter.go:13         0x10512e6               488d0d0bca0800          LEAQ main.c(SB), CX
   counter.go:13         0x10512ed               f0480fc101              LOCK XADDQ AX, 0(CX) // c.inc
   counter.go:24         0x10512f2               90                      NOPL
   counter.go:10         0x10512f3               488b05fec90800          MOVQ main.c(SB), AX // c.get
   counter.go:25         0x10512fa               90                      NOPL
   counter.go:16         0x10512fb               31c0                    XORL AX, AX
   counter.go:16         0x10512fd               488701                  XCHGQ AX, 0(CX) // c.reset
   counter.go:16         0x1051300               c3                      RET
```

By way of explanation. The first operation, `counter.go:13` is `c.inc` a `LOCK`ed `XADDQ`, which on x86 is an atomic increment. The second, `counter.go:10` is `c.get` which on x86, due to its strong memory consistency model, is a regular load from memory. The final operation, `counter.go:16`, `c.reset` is an atomic exchange of the address in `CX` with `AX` which was zeroed on the previous line. This puts the value in `AX`, zero, into the address stored in `CX`. The value previously stored at `(CX)` is discarded.

### Conclusion

Intrinsics are a neat solution that give Go programmers access to low level architectural operations without having to extend the specification of the language. If an architecture doesn’t have a specific `sync/atomic` primitive (like some ARM variants), or a `math/bits` operation, then the compiler transparently falls back to the operation written in pure Go.

  1. This may not be their official name, however the word is in common use inside the compiler and its tests[][5]
  2. The C Programming Language 2nd Ed, 1998[][6]
  3. As extra credit homework, try passing `0xdeadbeefdeadbeef` to each function under test and observe the results.[][7]



#### Related posts:

  1. [Notes on exploring the compiler flags in the Go compiler suite][8]
  2. [Padding is hard][9]
  3. [Should methods be declared on T or *T][10]
  4. [Wednesday pop quiz: spot the race][11]



--------------------------------------------------------------------------------

via: https://dave.cheney.net/2019/08/20/go-compiler-intrinsics

作者：[Dave Cheney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://dave.cheney.net/author/davecheney
[b]: https://github.com/lujun9972
[1]: tmp.OyARdRB2s8#easy-footnote-bottom-1-3803 (This may not be their official name, however the word is in common use inside the compiler and its tests)
[2]: tmp.OyARdRB2s8#easy-footnote-bottom-2-3803 (The C Programming Language 2nd Ed, 1998)
[3]: https://github.com/golang/go/issues/14813
[4]: tmp.OyARdRB2s8#easy-footnote-bottom-3-3803 (As extra credit homework, try passing <code>0xdeadbeefdeadbeef</code> to each function under test and observe the results.)
[5]: tmp.OyARdRB2s8#easy-footnote-1-3803
[6]: tmp.OyARdRB2s8#easy-footnote-2-3803
[7]: tmp.OyARdRB2s8#easy-footnote-3-3803
[8]: https://dave.cheney.net/2012/10/07/notes-on-exploring-the-compiler-flags-in-the-go-compiler-suite (Notes on exploring the compiler flags in the Go compiler suite)
[9]: https://dave.cheney.net/2015/10/09/padding-is-hard (Padding is hard)
[10]: https://dave.cheney.net/2016/03/19/should-methods-be-declared-on-t-or-t (Should methods be declared on T or *T)
[11]: https://dave.cheney.net/2015/11/18/wednesday-pop-quiz-spot-the-race (Wednesday pop quiz: spot the race)

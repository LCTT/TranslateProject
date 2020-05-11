[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Ensmallening Go binaries by prohibiting comparisons)
[#]: via: (https://dave.cheney.net/2020/05/09/ensmallening-go-binaries-by-prohibiting-comparisons)
[#]: author: (Dave Cheney https://dave.cheney.net/author/davecheney)

Ensmallening Go binaries by prohibiting comparisons
======

Conventional wisdom dictates that the larger the number of types declared in a Go program, the larger the resulting binary. Intuitively this makes sense, after all, what’s the point in defining a bunch of types if you’re not going to write code that operates on them. However, part of the job of a linker is to detect functions which are not referenced by a program–say they are part of a library of which only a subset of functionality is used–and remove them from the final output. Yet, the adage mo’ types, mo’ binary holds true for the majority of Go programs.

In this post I’ll dig into what equality, in the context of a Go program, means and why changes [like this][1] have a measurable impact on the size of a Go program.

### Defining equality between two values

The Go spec defines the concepts of assignability and equality. Assignabiity is the act of assigning a value to an identifier. Not everything which is declared can be assigned, for example constants and functions. Equality is the act of comparing two identifies by asking _are their contents the same?_

Being a strongly typed language, the notion of sameness is fundamentally rooted in the identifier’s type. Two things can only be the same if they are of the same type. Beyond that, the type of the values defines how they are compared.

For example, integers are compared arithmetically. For pointer types, equality is determining if the addresses they point too are the same. Reference types like maps and channels, like pointers, are considered to be the same if they have the same address.

These are all examples of bitwise equality, that is, if the bit patterns of the memory that value occupies are the same, those values are equal. This is known as memcmp, short for memory comparison, as equality is defined by comparing the contents of two areas of memory.

Hold on to this idea, I’ll come back to in a second.

### Struct equality

Beyond scalar types like integers, floats, and pointers is the realm of compound types; structs. All structs are laid out in memory in program order, thus this declaration:

```
type S struct {
    a, b, c, d int64
}
```

will consume 32 bytes of memory; 8 bytes for `a`, then 8 bytes for `b`, and so on. The spec says that _struct values are comparable if all their fields are comparable_. Thus two structs are equal iff each of their fields are equal.

```
a := S{1, 2, 3, 4}
b := S{1, 2, 3, 4}
fmt.Println(a == b) // prints true
```

Under the hood the compiler uses memcmp to compare the 32 bytes of `a` and `b`.

### Padding and alignment

However the simplistic bitwise comparison strategy will fail in situations like this:

```
type S struct {
    a byte
    b uint64
    c int16
    d uint32
}

func main()
    a := S{1, 2, 3, 4}
    b := S{1, 2, 3, 4}
    fmt.Println(a == b) // prints true
}
```

The code compiles, the comparison is still true, but under the hood the compiler cannot rely on comparing the bit patterns of `a` and `b` because the structure contains _padding_.

Go requires each field in a struct to be naturally aligned. 2 byte values must start on an even address, four byte values on an address divisible by 4, and so on[1][2]. The compiler inserts padding to ensure the fields are _aligned_ to according to their type and the underlying platform. In effect, after padding, this is what the compiler sees[2][3]:

```
type S struct {
    a byte
    _ [7]byte // padding
    b uint64
    c int16
    _ [2]int16 // padding
    d uint32
}
```

Padding exists to ensure the correct field alignments, and while it does take up space in memory, the contents of those padding bytes are unknown. You might assume that, being Go, the padding bytes are always zero, but it turns out that’s not the case–the contents of padding bytes are simply not defined. Because they’re not defined to always be a certain value, doing a bitwise comparison may return false because the nine bytes of padding spread throughout the 24 bytes of `S` are may not be the same.

The Go compiler solves this problem by generating what is known as an equality function. In this case `S`‘s equality function knows how to compare two values of type `S` by comparing only the fields in the function while skipping over the padding.

### Type algorithms

Phew, that was a lot of setup to illustrate why, for each type defined in a Go program, the compiler may generate several supporting functions, known inside the compiler as the type’s algorithms. In addition to the equality function the compiler will generate a hash function if the type is used as a map key. Like the equality function, the hash function must consider factors like padding when computing its result to ensure it remains stable.

It turns out that it can be hard, and sometimes non obvious, to intuit when the compiler will generate these functions–it’s more than you’d expect–and it can be hard for the linker to eliminate the ones that are not needed as reflection often causes the linker to be more conservative when trimming types.

### Reducing binary size by prohibiting comparisons

Now we’re at a point to explain Brad’s change. By adding an incomparable field [3][4] to the type, the resulting struct is by extension incomparable, thus forcing the compiler to elide the generation of eq and hash algorithms, short circuiting the linkers elimination of those types and, in practice, reducing the size of the final binary. As an example of this technique, this program:

```
package main

import "fmt"

func main() {
    type t struct {
        // _ [0][]byte uncomment to prevent comparison
        a byte
        b uint16
        c int32
        d uint64
    }
    var a t
    fmt.Println(a)
}
```

when compiled with Go 1.14.2 (darwin/amd64), decreased from 2174088 to 2174056, a saving of 32 bytes. In isolation this 32 byte saving may seem like small beer, but consider that equality and hash functions can be generated for every type in the transitive closure of your program and all its dependencies, and the size of these functions varies depending on the size of the type and its complexity, prohibiting them can have a sizeable impact on the final binary over and above the old saw of `-ldflags="-s -w"`.

The bottom line, if you don’t wish to make your types comparable, a hack like this enforces it at the source level while contributing to a small reduction in the size of your binary.

* * *

Addendum: thanks to Brad’s prodding, Go 1.15 already has a bunch of improvements by [Cherry Zhang][5] and [Keith Randall][6] that fix the most egregious of the failures to eliminate unnecessary equality and hash functions (although I suspect it was also to avoid the proliferation of this class of CLs).

  1. On 32bit platforms `int64` and `uint64` values may not be 8 byte aligned as the natural alignment of the platform is 4 bytes. See [issue 599][7] for the gory details.[][8]
  2. 32 bit platforms would see `_ [3]byte` padding between the declaration of `a` and `b`. See previous.[][9]
  3. Brad used `[0]func()`, but any type that the spec limits or prohibits comparisons on will do. By declaring the array has zero elements the type has no impact on the size or alignment of the struct.[][10]



#### Related posts:

  1. [How the Go runtime implements maps efficiently (without generics)][11]
  2. [The empty struct][12]
  3. [Padding is hard][13]
  4. [Typed nils in Go 2][14]



--------------------------------------------------------------------------------

via: https://dave.cheney.net/2020/05/09/ensmallening-go-binaries-by-prohibiting-comparisons

作者：[Dave Cheney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://dave.cheney.net/author/davecheney
[b]: https://github.com/lujun9972
[1]: https://github.com/golang/net/commit/e0ff5e5a1de5b859e2d48a2830d7933b3ab5b75f
[2]: tmp.uBLyaVR1Hm#easy-footnote-bottom-1-4116 (On 32bit platforms <code>int64</code> and <code>uint64</code> values may not be 8 byte aligned as the natural alignment of the platform is 4 bytes. See <a href="https://github.com/golang/go/issues/599">issue 599</a> for the gory details.)
[3]: tmp.uBLyaVR1Hm#easy-footnote-bottom-2-4116 (32 bit platforms would see <code>_ [3]byte</code> padding between the declaration of <code>a</code> and <code>b</code>. See previous.)
[4]: tmp.uBLyaVR1Hm#easy-footnote-bottom-3-4116 (Brad used <code>[0]func()</code>, but any type that the spec limits or prohibits comparisons on will do. By declaring the array has zero elements the type has no impact on the size or alignment of the struct.)
[5]: https://go-review.googlesource.com/c/go/+/231397
[6]: https://go-review.googlesource.com/c/go/+/191198
[7]: https://github.com/golang/go/issues/599
[8]: tmp.uBLyaVR1Hm#easy-footnote-1-4116
[9]: tmp.uBLyaVR1Hm#easy-footnote-2-4116
[10]: tmp.uBLyaVR1Hm#easy-footnote-3-4116
[11]: https://dave.cheney.net/2018/05/29/how-the-go-runtime-implements-maps-efficiently-without-generics (How the Go runtime implements maps efficiently (without generics))
[12]: https://dave.cheney.net/2014/03/25/the-empty-struct (The empty struct)
[13]: https://dave.cheney.net/2015/10/09/padding-is-hard (Padding is hard)
[14]: https://dave.cheney.net/2017/08/09/typed-nils-in-go-2 (Typed nils in Go 2)

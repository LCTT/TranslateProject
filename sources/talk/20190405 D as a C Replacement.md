[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (D as a C Replacement)
[#]: via: (https://theartofmachinery.com/2019/04/05/d_as_c_replacement.html)
[#]: author: (Simon Arneaud https://theartofmachinery.com)

D as a C Replacement
======

Sircmpwn (the main developer behind the [Sway Wayland compositor][1]) recently wrote a blog post about how he thinks [Rust is not a good C replacement][2]. I don’t know if he’d like the [D programming language][3] either, but it’s become a C replacement for me.

### My C to D Story

My story is like a lot of systems programmers’ stories. At one time, C was my go-to language for most programming. One day I realised that most of my C programs kept reimplementing things from C++: dynamic arrays, better strings, polymorphic classes, etc. So I tried using C++ instead, and at first I loved it. RAII and classes and generics made programming fun again. Even better was the promise that if I read all these books on C++, and learned to master things like template metaprogramming, I’d become an almighty god of systems programming and my code would be amazing. But learning more eventually had the opposite effect: (in hindsight) my code actually got worse, and I fell out of love. I remember reading Scott Meyer’s Effective C++ and realising it was really more about _ineffective_ C++ — and that most of my C++ code until then was broken. Let’s face it: C might be fiddly to use, but it has a kind of elegance, and “elegant” is rarely a word you hear when C++ is involved.

Apparently, a lot of ex-C C++ programmers end up going back to C. In my case, I discovered D. It’s also not perfect, but I use it because it feels to me a lot more like the `C += 1` that C++ was meant to be. Here’s an example that’s very superficial, but I think is representative. Take this simple C program:

```
#include <stdio.h>

int main()
{
    printf("1 + 1 = %d!\n", 1 + 1);
    return 0;
}
```

Here’s a version using the C++ standard library:

```
#include <iostream>

int main()
{
    std::cout << "1 + 1 = " << 1 + 1 << "!" << std::endl;
    return 0;
}
```

Here’s an idiomatic D version:

```
import std.stdio;

void main()
{
    writef("1 + 1 = %d!\n", 1 + 1);
}
```

As I said, it’s a superficial example, but I think it shows a general difference in philosophy between C++ and D. (If I wanted to make the difference even clearer, I’d use an example that needed `iomanip` in C++.)

Update: Unlike in C, [D’s format strings can work with custom types][4]. Stefan Rohe has also pointed out that [D supports compile-time checking of format strings][5] using its metaprogramming features — unlike C which does it through built-in compiler special casing that can’t be used with custom code.

This [article about C++ member function pointers][6] happens to also be a good explanation of the origins of D. It’s a good read if you’re a programming language nerd like me, but here’s my TL;DR for everyone else: C++ member function pointers are supposed to feel like a low-level feature (like normal function pointers are), but the complexity and diversity of implementations means they’re really high level. The complexity of the implementations is because of the subtleties of the rules about what you can do with them. The author explains the implementations from several C++ compilers, including what’s “easily [his] favorite implementation”: the elegantly simple Digital Mars C++ implementation. (“Why doesn’t everyone else do it this way?”) The DMC compiler was written by Walter Bright, who invented D.

D has classes and templates and other core features of C++, but designed by someone who has spent a heck of a lot of time thinking about the C++ spec and how things could be simpler. Walter once said that his experiences implementing C++ templates made him consider not including them in D at all, until he realised they didn’t need to be so complex.

Here’s a quick tour of D from the point of view of incrementally improving C.

### `-betterC`

D compilers support a `-betterC` switch that disables [the D runtime][7] and all high-level features that depend on it. The example C code above can be translated directly into betterC:

```
import core.stdc.stdio;

extern(C):

int main()
{
    printf("1 + 1 = %d!\n", 1 + 1);
    return 0;
}

$ dmd -betterC example.d
$ ./example
1 + 1 = 2!
```

The resulting binary looks a lot like the equivalent C binary. In fact, if you rewrote a C library in betterC, it could still link to code that had been compiled against the C version, and work without changes. Walter Bright wrote a good article walking through all [the changes needed to convert a real C program to betterC][8].

You don’t actually need the `-betterC` switch just to write C-like code in D. It’s only needed in special cases where you simply can’t have the D runtime. But let me point out some of my favourite D features that still work with `-betterC`.

#### `static assert()`

This allows verifying some assumption at compile time.

```
static assert(kNumInducers < 16);
```

Systems code often makes assumptions about alignment or structure size or other things. With `static assert`, it’s possible to not only document these assumptions, but trigger a compilation error if someone breaks them by adding a struct member or something.

#### Slices

Typical C code is full of pointer/length pairs, and it’s a common bug for them to go out of sync. Slices are a simple and super-useful abstraction for a range of memory defined by a pointer and length. Instead of code like this:

```
buffer_p += offset;
buffer_len -= offset;  // Got to update both
```

You can use this much-less-bug-prone alternative:

```
buffer = buffer[offset..$];
```

A slice is nothing but a pointer/length pair with first-class syntactic support.

Update: [Walter Bright has written more about pointer/length pair problem in C][9].

#### Compile Time Function Evaluation (CTFE)

[Many functions can be evaluated at compile time.][10]

```
long factorial(int n) pure
{
    assert (n >= 0 && n <= 20);
    long ret = 1;
    foreach (j; 2..n+1) ret *= j;
    return ret;
}

// Statically allocated array
// Size is calculated at compile time
Permutation[factorial(kNumThings)] permutation_table;
```

#### `scope` Guards

Code in one part of a function is often coupled to cleanup code in a later part. Failing to match this code up correctly is another common source of bugs (especially when multiple control flow paths are involved). D’s scope guards make it simple to get this stuff right:

```
p = malloc(128);
// free() will be called when the current scope exits
scope (exit) free(p);
// Put whatever if statements, or loops, or early returns you like here
```

You can even have multiple scope guards in a scope, or have nested scopes. The cleanup routines will be called when needed, in the right order.

D also supports RAII using struct destructors.

#### `const` and `immutable`

It’s a popular myth that `const` in C and C++ is useful for compiler optimisations. Walter Bright has complained that every time he thought of a new `const`-based optimisation for C++, he eventually discovered it didn’t work in real code. So he made some changes to `const` semantics for D, and added `immutable`. You can read more in the [D `const` FAQ][11].

#### `pure`

Functional purity can be enforced. I’ve written about [some of the benefits of the `pure` keyword before][12].

#### `@safe`

SafeD is a subset of D that forbids risky language features like pointer typecasts and inline assembly. Code marked `@safe` is enforced by the compiler to not use these features, so that risky code can be limited to the small percentage of the application that needs it. You can [read more about SafeD in this article][13].

#### Metaprogramming

Like I hinted earlier, metaprogramming has got a bad reputation among some C++ programmers. But [D has the advantage of making metaprogramming less interesting][14], so D programmers tend to just do it when it’s useful, and not as a fun puzzle.

D has great support for [compile-time reflection][15]. In most cases, compile-time reflection can solve the same problems as run-time reflection, but with compile-time guarantees. Compile-time reflection can also be used to implement run-time reflection where it’s truly needed.

Need the names of an enumerated type as an array?

```
enum State
{
    stopped,
    starting,
    running,
    stopping,
}

string[] state_names = [__traits(allMembers, State)];
```

Thanks to D’s metaprogramming, the standard library has many nice, type-safe tools, like this [compile-time checked bit flag enum][16].

I’ve written more about [using metaprogramming in `-betterC` code][17].

#### No Preprocessor

Okay, this a non-feature as a feature, but D has no equivalent to C’s preprocessor. All its sane use-cases are replaced with native language features, like [manifest constants][18] and [templates][19]. That includes proper [modules][20] support, which means D can break free of the limitations of that old `#include` hack.

### Normal D

C-like D code can be written and compiled as normal D code without the `-betterC` switch. The difference is that normal D code is linked to the D runtime, which supports higher-level features, the most obvious ones being garbage collection and object-oriented classes. Some people have confused the D runtime with something like the Java virtual machine, so I once wrote [an article explaining exactly what it is][7] (spoiler: it’s like the C and C++ runtimes, but with more features).

Even with the runtime, compiled D is not much different from compiled C++. Sometimes I like to write throwaway code to, say, experiment with a new Linux system call or something. I used to think the best language for that is plain old C, but now I always use D.

D doesn’t natively support `#include`ing C code, but for nice APIs that don’t have a lot of preprocessor craziness (like most of Linux) I usually just write [ad-hoc bindings][21]. Many popular C libraries have maintained D bindings, which can be found in the [Dub registry][22], or in [the Derelict project][23], or in the newer [BindBC project][24]. There are also tools for automated bindings, including the awesome [dpp tool][25] that brings `#include` support directly to D code.

Update: This post has got a lot of attention from people who’ve never heard of D before. If you’re interested in learning D, I recommend

  * [The DLang Tour][26] for a quick dive into the language
  * [Ali Çehreli’s Programming in D book][27] if you prefer something in-depth
  * [The D forum Learn group][28] or [IRC channel][29] to get answers to your questions



--------------------------------------------------------------------------------

via: https://theartofmachinery.com/2019/04/05/d_as_c_replacement.html

作者：[Simon Arneaud][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://theartofmachinery.com
[b]: https://github.com/lujun9972
[1]: https://swaywm.org/
[2]: https://drewdevault.com/2019/03/25/Rust-is-not-a-good-C-replacement.html
[3]: https://dlang.org
[4]: https://wiki.dlang.org/Defining_custom_print_format_specifiers
[5]: https://dlang.org/phobos/std_format.html#format
[6]: https://www.codeproject.com/Articles/7150/Member-Function-Pointers-and-the-Fastest-Possible
[7]: /2017/06/04/what_is_the_d_runtime.html
[8]: https://dlang.org/blog/2018/06/11/dasbetterc-converting-make-c-to-d/
[9]: https://www.digitalmars.com/articles/b44.html
[10]: https://dlang.org/spec/function.html#interpretation
[11]: https://dlang.org/articles/const-faq.html
[12]: /2016/03/28/dirtying_pure_functions_can_be_useful.html
[13]: https://dlang.org/blog/2016/09/28/how-to-write-trusted-code-in-d/
[14]: https://epi.github.io/2017/03/18/less_fun.html
[15]: https://dlang.org/spec/traits.html
[16]: https://dlang.org/phobos/std_typecons.html#BitFlags
[17]: /2018/08/13/inheritance_and_polymorphism_2.html
[18]: https://dlang.org/spec/enum.html#manifest_constants
[19]: https://tour.dlang.org/tour/en/basics/templates
[20]: https://ddili.org/ders/d.en/modules.html
[21]: https://wiki.dlang.org/Bind_D_to_C
[22]: https://code.dlang.org/
[23]: https://github.com/DerelictOrg
[24]: https://github.com/BindBC
[25]: https://github.com/atilaneves/dpp
[26]: https://tour.dlang.org/
[27]: https://ddili.org/ders/d.en/index.html
[28]: https://forum.dlang.org/group/learn
[29]: irc://irc.freenode.net/d

[#]: collector: (lujun9972)
[#]: translator: (LazyWolfLin)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why const Doesn't Make C Code Faster)
[#]: via: (https://theartofmachinery.com/2019/08/12/c_const_isnt_for_performance.html)
[#]: author: (Simon Arneaud https://theartofmachinery.com)

为什么 `const` 不能让 C 代码跑得更快？
======

在几个月前的一篇文章里，我曾说过“[有个一个流行的传言，`const` 可以帮助编译器优化 C 和 C++ 代码][1]”。我觉得我需要解释一下，尤其是曾经我自己也以为这是显然对的。我将会用一些理论和人工构造的例子论证，然后在一个真正的代码库 Sqlite 上做一些实验和基准测试。

### 一个简单的测试

让我们从一个最简单、最明显的例子开始，以前认为这是一个 `const` 让 C 代码跑得更快的例子。首先，假设我们有如下两个函数声明：

```
void func(int *x);
void constFunc(const int *x);
```

然后假设我们如下两份代码：

```
void byArg(int *x)
{
  printf("%d\n", *x);
  func(x);
  printf("%d\n", *x);
}

void constByArg(const int *x)
{
  printf("%d\n", *x);
  constFunc(x);
  printf("%d\n", *x);
}
```

调用 `printf()` 时，CPU 会通过指针从 RAM 中取得 `*x` 的值。很显然，`constByArg()` 会稍微快一点，因为编译器知道 `*x` 是常量，因此不需要在调用 `constFunc()` 之后再次获取它的值。它仅是打印相同的东西。对吧？让我们来看下 GCC 在如下编译选项下生成的汇编代码：

```
$ gcc -S -Wall -O3 test.c
$ view test.s
```

以下是函数 `byArg()` 的完整汇编代码：

```
byArg:
.LFB23:
    .cfi_startproc
    pushq   %rbx
    .cfi_def_cfa_offset 16
    .cfi_offset 3, -16
    movl    (%rdi), %edx
    movq    %rdi, %rbx
    leaq    .LC0(%rip), %rsi
    movl    $1, %edi
    xorl    %eax, %eax
    call    __printf_chk@PLT
    movq    %rbx, %rdi
    call    func@PLT  # The only instruction that's different in constFoo
    movl    (%rbx), %edx
    leaq    .LC0(%rip), %rsi
    xorl    %eax, %eax
    movl    $1, %edi
    popq    %rbx
    .cfi_def_cfa_offset 8
    jmp __printf_chk@PLT
    .cfi_endproc
```

函数 `byArg()` 和函数 `constByArg()` 生成的汇编代码中唯一的不同之处是 `constByArg()` 有一句汇编代码 `call constFunc@PLT`，这正是源码中的调用。关键字 `const` 本身并没有造成任何字面上的不同。

好了，这是 GCC 的结果。或许我们需要一个更聪明的编译器。Clang 会有更好的表现吗？

```
$ clang -S -Wall -O3 -emit-llvm test.c
$ view test.ll
```

这是 IR 代码（LLVM 的中间语言）。它比汇编代码更加紧凑，所以我可以把两个函数都导出来，让你可以看清楚我所说的“除了调用外，没有任何字面上的不同”是什么意思：

```
; Function Attrs: nounwind uwtable
define dso_local void @byArg(i32*) local_unnamed_addr #0 {
  %2 = load i32, i32* %0, align 4, !tbaa !2
  %3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %2)
  tail call void @func(i32* %0) #4
  %4 = load i32, i32* %0, align 4, !tbaa !2
  %5 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %4)
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @constByArg(i32*) local_unnamed_addr #0 {
  %2 = load i32, i32* %0, align 4, !tbaa !2
  %3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %2)
  tail call void @constFunc(i32* %0) #4
  %4 = load i32, i32* %0, align 4, !tbaa !2
  %5 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %4)
  ret void
}
```

### Something that (sort of) works

接下来是一组 `const` 能够真正产生作用的代码：

```
void localVar()
{
  int x = 42;
  printf("%d\n", x);
  constFunc(&x);
  printf("%d\n", x);
}

void constLocalVar()
{
  const int x = 42;  // const on the local variable
  printf("%d\n", x);
  constFunc(&x);
  printf("%d\n", x);
}
```

下面是 `localVar()` 的汇编代码，其中有两条指令在 `constLocalVar()` 中会被优化：

```
localVar:
.LFB25:
    .cfi_startproc
    subq    $24, %rsp
    .cfi_def_cfa_offset 32
    movl    $42, %edx
    movl    $1, %edi
    movq    %fs:40, %rax
    movq    %rax, 8(%rsp)
    xorl    %eax, %eax
    leaq    .LC0(%rip), %rsi
    movl    $42, 4(%rsp)
    call    __printf_chk@PLT
    leaq    4(%rsp), %rdi
    call    constFunc@PLT
    movl    4(%rsp), %edx  # not in constLocalVar()
    xorl    %eax, %eax
    movl    $1, %edi
    leaq    .LC0(%rip), %rsi  # not in constLocalVar()
    call    __printf_chk@PLT
    movq    8(%rsp), %rax
    xorq    %fs:40, %rax
    jne .L9
    addq    $24, %rsp
    .cfi_remember_state
    .cfi_def_cfa_offset 8
    ret
.L9:
    .cfi_restore_state
    call    __stack_chk_fail@PLT
    .cfi_endproc
```

LLVM 生成的 IR 代码中更明显。在 `constLocalVar()` 中，第二次调用 `printf()` 之前的 `load` 会被优化掉：

```
; Function Attrs: nounwind uwtable
define dso_local void @localVar() local_unnamed_addr #0 {
  %1 = alloca i32, align 4
  %2 = bitcast i32* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #4
  store i32 42, i32* %1, align 4, !tbaa !2
  %3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 42)
  call void @constFunc(i32* nonnull %1) #4
  %4 = load i32, i32* %1, align 4, !tbaa !2
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %4)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #4
  ret void
}
```

好吧，现在，`constLocalVar()` 成功的优化了 `*x` 的重新读取，但是可能你已经注意到一些问题：`localVar()` 和 `constLocalVar()` 在函数体中做了同样的 `constFunc()` 调用。如果编译器能够推断出 `constFunc()` 没有修改 `constLocalVar()` 中的 `*x`，那为什么不能推断出完全一样的函数调用也没有修改 `localVar()` 中的 `*x`？

这个解释更贴近于为什么 C 语言的 `const` 不能作为优化手段的核心。C 语言的 `const` 有两个有效的含义：它可以表示这个变量是某个可能是常数也可能不是常数的数据的一个只读别名，或者它可以表示这变量真正的常量。如果你移除了一个指向常量的指针的 `const` 属性并写入数据，那结果将是一个未定义行为。另一方面，如果是一个指向非常量值的 `const` 指针，将就没问题。

这份 `constFunc()` 的可能实现揭示了这意味着什么：

```
// x 是一个指向某个可能是常数也可能不是常数的数据的只读指针
void constFunc(const int *x)
{
  // local_var 是一个真正的常数
  const int local_var = 42;

  // C 语言规定的未定义行为
  doubleIt((int*)&local_var);
  // 谁知道这是不是一个未定义行为呢？
  doubleIt((int*)x);
}

void doubleIt(int *x)
{
  *x *= 2;
}
```

`localVar()` gave `constFunc()` a `const` pointer to non-`const` variable. Because the variable wasn’t originally `const`, `constFunc()` can be a liar and forcibly modify it without triggering UB. So the compiler can’t assume the variable has the same value after `constFunc()` returns. The variable in `constLocalVar()` really is `const`, though, so the compiler can assume it won’t change — because this time it _would_ be UB for `constFunc()` to cast `const` away and write to it.

The `byArg()` and `constByArg()` functions in the first example are hopeless because the compiler has no way of knowing if `*x` really is `const`.

But why the inconsistency? If the compiler can assume that `constFunc()` doesn’t modify its argument when called in `constLocalVar()`, surely it can go ahead an apply the same optimisations to other `constFunc()` calls, right? Nope. The compiler can’t assume `constLocalVar()` is ever run at all. If it isn’t (say, because it’s just some unused extra output of a code generator or macro), `constFunc()` can sneakily modify data without ever triggering UB.

You might want to read the above explanation and examples a few times, but don’t worry if it sounds absurd: it is. Unfortunately, writing to `const` variables is the worst kind of UB: most of the time the compiler can’t know if it even would be UB. So most of the time the compiler sees `const`, it has to assume that someone, somewhere could cast it away, which means the compiler can’t use it for optimisation. This is true in practice because enough real-world C code has “I know what I’m doing” casting away of `const`.

In short, a whole lot of things can prevent the compiler from using `const` for optimisation, including receiving data from another scope using a pointer, or allocating data on the heap. Even worse, in most cases where `const` can be used by the compiler, it’s not even necessary. For example, any decent compiler can figure out that `x` is constant in the following code, even without `const`:

```
int x = 42, y = 0;
printf("%d %d\n", x, y);
y += x;
printf("%d %d\n", x, y);
```

TL;DR: `const` is almost useless for optimisation because

  1. Except for special cases, the compiler has to ignore it because other code might legally cast it away
  2. In most of the exceptions to #1, the compiler can figure out a variable is constant, anyway



### C++

There’s another way `const` can affect code generation if you’re using C++: function overloads. You can have `const` and non-`const` overloads of the same function, and maybe the non-`const` can be optimised (by the programmer, not the compiler) to do less copying or something.

```
void foo(int *p)
{
  // Needs to do more copying of data
}

void foo(const int *p)
{
  // Doesn't need defensive copies
}

int main()
{
  const int x = 42;
  // const-ness affects which overload gets called
  foo(&x);
  return 0;
}
```

On the one hand, I don’t think this is exploited much in practical C++ code. On the other hand, to make a real difference, the programmer has to make assumptions that the compiler can’t make because they’re not guaranteed by the language.

### An experiment with Sqlite3

That’s enough theory and contrived examples. How much effect does `const` have on a real codebase? I thought I’d do a test on the Sqlite database (version 3.30.0) because

  * It actually uses `const`
  * It’s a non-trivial codebase (over 200KLOC)
  * As a database, it includes a range of things from string processing to arithmetic to date handling
  * It can be tested with CPU-bound loads



Also, the author and contributors have put years of effort into performance optimisation already, so I can assume they haven’t missed anything obvious.

#### The setup

I made two copies of [the source code][2] and compiled one normally. For the other copy, I used this hacky preprocessor snippet to turn `const` into a no-op:

```
#define const
```

(GNU) `sed` can add that to the top of each file with something like `sed -i '1i#define const' *.c *.h`.

Sqlite makes things slightly more complicated by generating code using scripts at build time. Fortunately, compilers make a lot of noise when `const` and non-`const` code are mixed, so it was easy to detect when this happened, and tweak the scripts to include my anti-`const` snippet.

Directly diffing the compiled results is a bit pointless because a tiny change can affect the whole memory layout, which can change pointers and function calls throughout the code. Instead I took a fingerprint of the disassembly (`objdump -d libsqlite3.so.0.8.6`), using the binary size and mnemonic for each instruction. For example, this function:

```
000000000005d570 <sqlite3_blob_read>:
   5d570:       4c 8d 05 59 a2 ff ff    lea    -0x5da7(%rip),%r8        # 577d0 <sqlite3BtreePayloadChecked>
   5d577:       e9 04 fe ff ff          jmpq   5d380 <blobReadWrite>
   5d57c:       0f 1f 40 00             nopl   0x0(%rax)
```

would turn into something like this:

```
sqlite3_blob_read   7lea 5jmpq 4nopl
```

I left all the Sqlite build settings as-is when compiling anything.

#### Analysing the compiled code

The `const` version of libsqlite3.so was 4,740,704 bytes, about 0.1% larger than the 4,736,712 bytes of the non-`const` version. Both had 1374 exported functions (not including low-level helpers like stuff in the PLT), and a total of 13 had any difference in fingerprint.

A few of the changes were because of the dumb preprocessor hack. For example, here’s one of the changed functions (with some Sqlite-specific definitions edited out):

```
#define LARGEST_INT64  (0xffffffff|(((int64_t)0x7fffffff)<<32))
#define SMALLEST_INT64 (((int64_t)-1) - LARGEST_INT64)

static int64_t doubleToInt64(double r){
  /*
  ** Many compilers we encounter do not define constants for the
  ** minimum and maximum 64-bit integers, or they define them
  ** inconsistently.  And many do not understand the "LL" notation.
  ** So we define our own static constants here using nothing
  ** larger than a 32-bit integer constant.
  */
  static const int64_t maxInt = LARGEST_INT64;
  static const int64_t minInt = SMALLEST_INT64;

  if( r<=(double)minInt ){
    return minInt;
  }else if( r>=(double)maxInt ){
    return maxInt;
  }else{
    return (int64_t)r;
  }
}
```

Removing `const` makes those constants into `static` variables. I don’t see why anyone who didn’t care about `const` would make those variables `static`. Removing both `static` and `const` makes GCC recognise them as constants again, and we get the same output. Three of the 13 functions had spurious changes because of local `static const` variables like this, but I didn’t bother fixing any of them.

Sqlite uses a lot of global variables, and that’s where most of the real `const` optimisations came from. Typically they were things like a comparison with a variable being replaced with a constant comparison, or a loop being partially unrolled a step. (The [Radare toolkit][3] was handy for figuring out what the optimisations did.) A few changes were underwhelming. `sqlite3ParseUri()` is 487 instructions, but the only difference `const` made was taking this pair of comparisons:

```
test %al, %al
je <sqlite3ParseUri+0x717>
cmp $0x23, %al
je <sqlite3ParseUri+0x717>
```

And swapping their order:

```
cmp $0x23, %al
je <sqlite3ParseUri+0x717>
test %al, %al
je <sqlite3ParseUri+0x717>
```

#### Benchmarking

Sqlite comes with a performance regression test, so I tried running it a hundred times for each version of the code, still using the default Sqlite build settings. Here are the timing results in seconds:

| const | No const
---|---|---
Minimum | 10.658s | 10.803s
Median | 11.571s | 11.519s
Maximum | 11.832s | 11.658s
Mean | 11.531s | 11.492s

Personally, I’m not seeing enough evidence of a difference worth caring about. I mean, I removed `const` from the entire program, so if it made a significant difference, I’d expect it to be easy to see. But maybe you care about any tiny difference because you’re doing something absolutely performance critical. Let’s try some statistical analysis.

I like using the Mann-Whitney U test for stuff like this. It’s similar to the more-famous t test for detecting differences in groups, but it’s more robust to the kind of complex random variation you get when timing things on computers (thanks to unpredictable context switches, page faults, etc). Here’s the result:

| const | No const
---|---|---
N | 100 | 100
Mean rank | 121.38 | 79.62
Mann-Whitney U | 2912
---|---
Z | -5.10
2-sided p value | &lt;10-6
HL median difference | -.056s
95% confidence interval | -.077s – -0.038s

The U test has detected a statistically significant difference in performance. But, surprise, it’s actually the non-`const` version that’s faster — by about 60ms, or 0.5%. It seems like the small number of “optimisations” that `const` enabled weren’t worth the cost of extra code. It’s not like `const` enabled any major optimisations like auto-vectorisation. Of course, your mileage may vary with different compiler flags, or compiler versions, or codebases, or whatever, but I think it’s fair to say that if `const` were effective at improving C performance, we’d have seen it by now.

### So, what’s `const` for?

For all its flaws, C/C++ `const` is still useful for type safety. In particular, combined with C++ move semantics and `std::unique_pointer`s, `const` can make pointer ownership explicit. Pointer ownership ambiguity was a huge pain in old C++ codebases over ~100KLOC, so personally I’m grateful for that alone.

However, I used to go beyond using `const` for meaningful type safety. I’d heard it was best practices to use `const` literally as much as possible for performance reasons. I’d heard that when performance really mattered, it was important to refactor code to add more `const`, even in ways that made it less readable. That made sense at the time, but I’ve since learned that it’s just not true.

--------------------------------------------------------------------------------

via: https://theartofmachinery.com/2019/08/12/c_const_isnt_for_performance.html

作者：[Simon Arneaud][a]
选题：[lujun9972][b]
译者：[LazyWolfLin](https://github.com/LazyWolfLin)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://theartofmachinery.com
[b]: https://github.com/lujun9972
[1]: https://theartofmachinery.com/2019/04/05/d_as_c_replacement.html#const-and-immutable
[2]: https://sqlite.org/src/doc/trunk/README.md
[3]: https://rada.re/r/

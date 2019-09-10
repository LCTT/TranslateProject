[#]: collector: (lujun9972)
[#]: translator: (LazyWolfLin)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why const Doesn't Make C Code Faster)
[#]: via: (https://theartofmachinery.com/2019/08/12/c_const_isnt_for_performance.html)
[#]: author: (Simon Arneaud https://theartofmachinery.com)

为什么 `const` 不能让 `C` 代码跑得更快？
======

在几个月前的一篇文章里，我曾说过“[有个一个流行的传言，`const` 有助于编译器优化 `C` 和 `C++` 代码][1]”。我觉得我需要解释一下，尤其是曾经我自己也以为这是显然对的。我将会用一些理论和人工构造的例子论证，然后在一个真正的代码库 `Sqlite` 上做一些实验和基准测试。

### 一个简单的测试

让我们从一个最简单、最明显的例子开始，以前认为这是一个 `const` 让 `C` 代码跑得更快的例子。首先，假设我们有如下两个函数声明：

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

调用 `printf()` 时，CPU 会通过指针从 RAM 中取得 `*x` 的值。很显然，`constByArg()` 会稍微快一点，因为编译器知道 `*x` 是常量，因此不需要在调用 `constFunc()` 之后再次获取它的值。它仅是打印相同的东西。对吧？让我们来看下 `GCC` 在如下编译选项下生成的汇编代码：

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

好了，这是 `GCC` 的结果。或许我们需要一个更聪明的编译器。`Clang` 会有更好的表现吗？

```
$ clang -S -Wall -O3 -emit-llvm test.c
$ view test.ll
```

这是 `IR` 代码（`LLVM` 的中间语言）。它比汇编代码更加紧凑，所以我可以把两个函数都导出来，让你可以看清楚我所说的“除了调用外，没有任何字面上的不同”是什么意思：

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

### 一些有效的代码

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

`LLVM` 生成的 `IR` 代码中更明显。在 `constLocalVar()` 中，第二次调用 `printf()` 之前的 `load` 会被优化掉：

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

这个解释更贴近于为什么 `C` 语言的 `const` 不能作为优化手段的核心。`C` 语言的 `const` 有两个有效的含义：它可以表示这个变量是某个可能是常数也可能不是常数的数据的一个只读别名，或者它可以表示这变量真正的常量。如果你移除了一个指向常量的指针的 `const` 属性并写入数据，那结果将是一个未定义行为。另一方面，如果是一个指向非常量值的 `const` 指针，将就没问题。

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

`localVar()` 传递给 `constFunc()` 一个指向非 `const` 变量的 `const` 指针。因为这个变量并非常量，`constFunc()` 可以撒个谎并强行修改它而不触发而不触发未定义行为。所以，编译器不能断定变量在调用 `constFunc()` 后仍是同样的值。在 `constLocalVar()` 中的变量是真正的常量，因此，编译器可以断定它不会改变——因为在 `constFunc()` 去除变量的 `const` 属性并写入它*将*会是一个未定义行为。

第一个例子中的函数 `byArg()` 和 `constByArg()` 是没有可能的，因为编译器没有任何方法可以知道 `*x` 是否真的是 `const` 常量。

但是为什么不一致呢？如果编译器能够推断出 `constLocalVar()` 中调用的 `constFunc()` 不会修改它的参数，那么肯定也能继续在其他 `constFunc()` 的调用上实施相同的优化，对吧？不。编译器不能假设 `constLocalVar()` 根本没有运行。 If it isn’t (say, because it’s just some unused extra output of a code generator or macro), `constFunc()` can sneakily modify data without ever triggering UB.

你可能需要重复阅读上述说明和示例，但不要担心它听起来很荒谬，它确实是的。不幸的是，对 `const` 变量进行写入是最糟糕的未定义行为：大多数情况下，编译器不知道它是否将会是未定义行为。所以，大多数情况下，编译器看见 `const` 时必须假设它未来可能会被移除掉，这意味着编译器不能使用它进行优化。这在实践中是正确的，因为真实的 `C` 代码会在“明确知道后果”下移除 `const`。

简而言之，很多事情都可以阻止编译器使用 `const` 进行优化，包括使用指针从另一内存空间接受数据，或者在堆空间上分配数据。更糟糕的是，在大部分编译器能够使用 `const` 的情况，它都不是必须的。例如，任何像样的编译器都能推断出下面代码中的 `x` 是一个常量，甚至都不需要 `const`：

```
int x = 42, y = 0;
printf("%d %d\n", x, y);
y += x;
printf("%d %d\n", x, y);
```

TL；DR，`const` 对优化而言几乎无用，因为：

  1. 除了特殊情况，编译器需要忽略它，因为其他代码可能合法地移除它
  2. 在 #1 以外地大多数例外中，编译器无论如何都能推断出该变量是常量

### C++

如果你在使用 `C++` 那么有另外一个方法让 `const` 能够影响到代码的生成。你可以用 `const` 和非 `const` 的参数重载同一个函数，而非 `const` 版本的代码可能可以优化（由程序员优化而不是编译器）掉某些拷贝或者其他事情。

```
void foo(int *p)
{
  // 需要坐更多的数据拷贝
}

void foo(const int *p)
{
  // 不需要保护性的拷贝副本
}

int main()
{
  const int x = 42;
  // const 影响被调用的是哪一个版本的重载
  foo(&x);
  return 0;
}
```

一方面，我不认为这会在实际的 `C++` 代码中大量使用。另一方面，为了导致差异，程序员需要做出编译器无法做出的假设，因为它们不受语言保护。

### 用 `Sqlite3` 进行实验

有了足够的理论和例子。那么 `const` 在一个真正的代码库中有多大的影响呢？我将会在 `Sqlite`（版本：3.30.0）的代码库上做一个测试，因为：

  * 它真正地使用了 `const`
  * 它不是一个简单的代码库（超过 20 万行代码）
  * 作为一个代码库，它包括了字符串处理、数学计算、日期处理等一系列内容
  * 它能够在绑定 CPU 下进行负载测试



此外，作者和贡献者们已经进行了多年的性能优化工作，因此我能确定他们没有错过任何有显著效果的优化。

#### 配置

我做了两份[源码]][2]拷贝，并且正常编译其中一份。而对于另一份拷贝，我插入了这个预处理代码段，将 `const` 变成一个空操作：

```
#define const
```

(GNU) `sed` 可以将一些东西添加到每个文件的顶端，比如 `sed -i '1i#define const' *.c *.h`。

在编译期间使用脚本生成 `Sqlite` 代码稍微有点复杂。幸运的是当 `const` 代码和非 `const` 代码混合时，编译器会产生了大量的提醒，因此很容易发现它并调整脚本来包含我的反 `const` 代码段。

直接比较编译结果毫无意义，因为任意微小的改变就会影响整个内存布局，这可能会改变整个代码中的指针和函数调用。因此，我用每个指令的二进制大小和汇编代码作为反汇编代码（`objdump -d libsqlite3.so.0.8.6`）。举个例子，这个函数：

```
000000000005d570 <sqlite3_blob_read>:
   5d570:       4c 8d 05 59 a2 ff ff    lea    -0x5da7(%rip),%r8        # 577d0 <sqlite3BtreePayloadChecked>
   5d577:       e9 04 fe ff ff          jmpq   5d380 <blobReadWrite>
   5d57c:       0f 1f 40 00             nopl   0x0(%rax)
```

将会变成这样：

```
sqlite3_blob_read   7lea 5jmpq 4nopl
```

在编译时，我保留了所有 `Sqlite` 的编译设置。

#### 分析编译后的代码

The `const` version of `libsqlite3.so` was 4,740,704 bytes, about 0.1% larger than the 4,736,712 bytes of the non-`const` version. Both had 1374 exported functions (not including low-level helpers like stuff in the PLT), and a total of 13 had any difference in fingerprint.

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

`Sqlite` uses a lot of global variables, and that’s where most of the real `const` optimisations came from. Typically they were things like a comparison with a variable being replaced with a constant comparison, or a loop being partially unrolled a step. (The [Radare toolkit][3] was handy for figuring out what the optimisations did.) A few changes were underwhelming. `sqlite3ParseUri()` is 487 instructions, but the only difference `const` made was taking this pair of comparisons:

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

`Sqlite` comes with a performance regression test, so I tried running it a hundred times for each version of the code, still using the default `Sqlite` build settings. Here are the timing results in seconds:

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

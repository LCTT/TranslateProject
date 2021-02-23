[#]: collector: (lujun9972)
[#]: translator: (LazyWolfLin)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11339-1.html)
[#]: subject: (Why const Doesn't Make C Code Faster)
[#]: via: (https://theartofmachinery.com/2019/08/12/c_const_isnt_for_performance.html)
[#]: author: (Simon Arneaud https://theartofmachinery.com)

为什么 const 无法让 C 代码跑得更快？
======

![](https://img.linux.net.cn/data/attachment/album/201909/14/181535lsrt9t93k1c1n0mt.jpg)

在几个月前的一篇文章里，我曾说过“[有个一个流行的传言，`const` 有助于编译器优化 C 和 C++ 代码][1]”。我觉得我需要解释一下，尤其是曾经我自己也以为这是显然对的。我将会用一些理论并构造一些例子来论证，然后在一个真实的代码库 `Sqlite` 上做一些实验和基准测试。

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

调用 `printf()` 时，CPU 会通过指针从 RAM 中取得 `*x` 的值。很显然，`constByArg()` 会稍微快一点，因为编译器知道 `*x` 是常量，因此不需要在调用 `constFunc()` 之后再次获取它的值。它仅是打印相同的东西。没问题吧？让我们来看下 GCC 在如下编译选项下生成的汇编代码：

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
    call    func@PLT  # constFoo 中唯一不同的指令
    movl    (%rbx), %edx
    leaq    .LC0(%rip), %rsi
    xorl    %eax, %eax
    movl    $1, %edi
    popq    %rbx
    .cfi_def_cfa_offset 8
    jmp __printf_chk@PLT
    .cfi_endproc
```

函数 `byArg()` 和函数 `constByArg()` 生成的汇编代码中唯一的不同之处是 `constByArg()` 有一句汇编代码 `call constFunc@PLT`，这正是源代码中的调用。关键字 `const` 本身并没有造成任何字面上的不同。

好了，这是 GCC 的结果。或许我们需要一个更聪明的编译器。Clang 会有更好的表现吗？

```
$ clang -S -Wall -O3 -emit-llvm test.c
$ view test.ll
```

这是 `IR` 代码（LCTT 译注：LLVM 的中间语言）。它比汇编代码更加紧凑，所以我可以把两个函数都导出来，让你可以看清楚我所说的“除了调用外，没有任何字面上的不同”是什么意思：

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

### 某些有作用的东西

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
  const int x = 42;  // 对本地变量使用 const
  printf("%d\n", x);
  constFunc(&x);
  printf("%d\n", x);
}
```

下面是 `localVar()` 的汇编代码，其中有两条指令在 `constLocalVar()` 中会被优化掉：

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
    movl    4(%rsp), %edx  # 在 constLocalVar() 中没有
    xorl    %eax, %eax
    movl    $1, %edi
    leaq    .LC0(%rip), %rsi  # 在 constLocalVar() 中没有
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

在 LLVM 生成的 `IR` 代码中更明显一点。在 `constLocalVar()` 中，第二次调用 `printf()` 之前的 `load` 会被优化掉：

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

好吧，现在，`constLocalVar()` 成功的省略了对 `*x` 的重新读取，但是可能你已经注意到一些问题：`localVar()` 和 `constLocalVar()` 在函数体中做了同样的 `constFunc()` 调用。如果编译器能够推断出 `constFunc()` 没有修改 `constLocalVar()` 中的 `*x`，那为什么不能推断出完全一样的函数调用也没有修改 `localVar()` 中的 `*x`？

这个解释更贴近于为什么 C 语言的 `const` 不能作为优化手段的核心原因。C 语言的 `const` 有两个有效的含义：它可以表示这个变量是某个可能是常数也可能不是常数的数据的一个只读别名，或者它可以表示该变量是真正的常量。如果你移除了一个指向常量的指针的 `const` 属性并写入数据，那结果将是一个未定义行为。另一方面，如果是一个指向非常量值的 `const` 指针，将就没问题。

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

`localVar()` 传递给 `constFunc()` 一个指向非 `const` 变量的 `const` 指针。因为这个变量并非常量，`constFunc()` 可以撒个谎并强行修改它而不触发未定义行为。所以，编译器不能断定变量在调用 `constFunc()` 后仍是同样的值。在 `constLocalVar()` 中的变量是真正的常量，因此，编译器可以断定它不会改变 —— 因为在 `constFunc()` 去除变量的 `const` 属性并写入它*将*会是一个未定义行为。

第一个例子中的函数 `byArg()` 和 `constByArg()` 是没有可能优化的，因为编译器没有任何方法能知道 `*x` 是否真的是 `const` 常量。

> 补充（和题外话）：相当多的读者已经正确地指出，使用 `const int *x`，该指针本身不是限定的常量，只是该数据被加个了别名，而 `const int * const extra_const` 是一个“双向”限定为常量的指针。但是因为指针本身的常量与别名数据的常量无关，所以结果是相同的。仅在 `extra_const` 指向使用 `const` 定义的对象时，`*(int*const)extra_const = 0` 才是未定义行为。（实际上，`*(int*)extra_const = 0` 也不会更糟。）因为它们之间的区别可以一句话说明白，一个是完全的 `const` 指针，另外一个可能是也可能不是常量本身的指针，而是一个可能是也可能不是常量的对象的只读别名，我将继续不严谨地引用“常量指针”。（题外话结束）

但是为什么不一致呢？如果编译器能够推断出 `constLocalVar()` 中调用的 `constFunc()` 不会修改它的参数，那么肯定也能继续在其他 `constFunc()` 的调用上实施相同的优化，是吗？并不。编译器不能假设 `constLocalVar()` 根本没有运行。如果不是这样（例如，它只是代码生成器或者宏的一些未使用的额外输出），`constFunc()` 就能偷偷地修改数据而不触发未定义行为。

你可能需要重复阅读几次上述说明和示例，但不要担心，它听起来很荒谬，它确实是正确的。不幸的是，对 `const` 变量进行写入是最糟糕的未定义行为：大多数情况下，编译器无法知道它是否将会是未定义行为。所以，大多数情况下，编译器看见 `const` 时必须假设它未来可能会被移除掉，这意味着编译器不能使用它进行优化。这在实践中是正确的，因为真实的 C 代码会在“深思熟虑”后移除 `const`。

简而言之，很多事情都可以阻止编译器使用 `const` 进行优化，包括使用指针从另一内存空间接受数据，或者在堆空间上分配数据。更糟糕的是，在大部分编译器能够使用 `const` 进行优化的情况，它都不是必须的。例如，任何像样的编译器都能推断出下面代码中的 `x` 是一个常量，甚至都不需要 `const`：

```
int x = 42, y = 0;
printf("%d %d\n", x, y);
y += x;
printf("%d %d\n", x, y);
```

总结，`const` 对优化而言几乎无用，因为：

1. 除了特殊情况，编译器需要忽略它，因为其他代码可能合法地移除它
2. 在 #1 以外的大多数例外中，编译器无论如何都能推断出该变量是常量

### C++

如果你在使用 C++ 那么有另外一个方法让 `const` 能够影响到代码的生成：函数重载。你可以用 `const` 和非 `const` 的参数重载同一个函数，而非 `const` 版本的代码可能可以被优化（由程序员优化而不是编译器），减少某些拷贝或者其他事情。

```
void foo(int *p)
{
  // 需要做更多的数据拷贝
}

void foo(const int *p)
{
  // 不需要保护性的拷贝副本
}

int main()
{
  const int x = 42;
  // const 影响被调用的是哪一个版本的重载函数
  foo(&x);
  return 0;
}
```

一方面，我不认为这会在实际的 C++ 代码中大量使用。另一方面，为了导致差异，程序员需要假设编译器无法做出，因为它们不受语言保护。

### 用 Sqlite3 进行实验

有了足够的理论和例子。那么 `const` 在一个真正的代码库中有多大的影响呢？我将会在代码库 `Sqlite`（版本：3.30.0）上做一个测试，因为：

* 它真正地使用了 `const`
* 它不是一个简单的代码库（超过 20 万行代码）
* 作为一个数据库，它包括了字符串处理、数学计算、日期处理等一系列内容
* 它能够在绑定 CPU 的情况下进行负载测试

此外，作者和贡献者们已经进行了多年的性能优化工作，因此我能确定他们没有错过任何有显著效果的优化。

#### 配置

我做了两份[源码][2]拷贝，并且正常编译其中一份。而对于另一份拷贝，我插入了这个特殊的预处理代码段，将 `const` 变成一个空操作：

```
#define const
```

(GNU) `sed` 可以将一些东西添加到每个文件的顶端，比如 `sed -i '1i#define const' *.c *.h`。

在编译期间使用脚本生成 `Sqlite` 代码稍微有点复杂。幸运的是当 `const` 代码和非 `const` 代码混合时，编译器会产生了大量的提醒，因此很容易发现它并调整脚本来包含我的反 `const` 代码段。

直接比较编译结果毫无意义，因为任意微小的改变就会影响整个内存布局，这可能会改变整个代码中的指针和函数调用。因此，我用每个指令的二进制大小和汇编代码作为识别码（`objdump -d libsqlite3.so.0.8.6`）。举个例子，这个函数：

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

#### 分析编译结果

`const` 版本的 `libsqlite3.so` 的大小是 4,740,704 字节，大约比 4,736,712 字节的非 `const` 版本大了 0.1% 。在全部 1374 个导出函数（不包括类似 PLT 里的底层辅助函数）中，一共有 13 个函数的识别码不一致。

其中的一些改变是由于插入的预处理代码。举个例子，这里有一个发生了更改的函数（已经删去一些 `Sqlite` 特有的定义）：

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

删去 `const` 使得这些常量变成了 `static` 变量。我不明白为什么会有不了解 `const` 的人让这些变量加上 `static`。同时删去 `static` 和 `const` 会让 GCC 再次认为它们是常量，而我们将得到同样的编译输出。由于类似这样的局部的 `static const` 变量，使得 13 个函数中有 3 个函数产生假的变化，但我一个都不打算修复它们。

`Sqlite` 使用了很多全局变量，而这正是大多数真正的 `const` 优化产生的地方。通常情况下，它们类似于将一个变量比较代替成一个常量比较，或者一个循环在部分展开的一步。（[Radare toolkit][3] 可以很方便的找出这些优化措施。）一些变化则令人失望。`sqlite3ParseUri()` 有 487 个指令，但 `const` 产生的唯一区别是进行了这个比较：

```
test %al, %al
je <sqlite3ParseUri+0x717>
cmp $0x23, %al
je <sqlite3ParseUri+0x717>
```

并交换了它们的顺序：

```
cmp $0x23, %al
je <sqlite3ParseUri+0x717>
test %al, %al
je <sqlite3ParseUri+0x717>
```

#### 基准测试

`Sqlite` 自带了一个性能回归测试，因此我尝试每个版本的代码执行一百次，仍然使用默认的 `Sqlite` 编译设置。以秒为单位的测试结果如下：

| | const | 非 const
---|---|---
最小值 | 10.658s | 10.803s
中间值 | 11.571s | 11.519s
最大值 | 11.832s | 11.658s
平均值 | 11.531s | 11.492s

就我个人看来，我没有发现足够的证据来说明这个差异值得关注。我是说，我从整个程序中删去 `const`，所以如果它有明显的差别，那么我希望它是显而易见的。但也许你关心任何微小的差异，因为你正在做一些绝对性能非常重要的事。那让我们试一下统计分析。

我喜欢使用类似 Mann-Whitney U 检验这样的东西。它类似于更著名的 T 检验，但对你在机器上计时时产生的复杂随机变量（由于不可预测的上下文切换、页错误等）更加健壮。以下是结果：

|| const | 非 const|
---|---|---
N | 100 | 100
Mean rank | 121.38 | 79.62

|||
---|---
Mann-Whitney U | 2912
Z | -5.10
2-sided p value | <10-6
HL median difference | -0.056s
95% confidence interval | -0.077s – -0.038s

U 检验已经发现统计意义上具有显著的性能差异。但是，令人惊讶的是，实际上是非 `const` 版本更快——大约 60ms，0.5%。似乎 `const` 启用的少量“优化”不值得额外代码的开销。这不像是 `const` 启用了任何类似于自动矢量化的重要的优化。当然，你的结果可能因为编译器配置、编译器版本或者代码库等等而有所不同，但是我觉得这已经说明了 `const` 是否能够有效地提高 `C` 的性能，我们现在已经看到答案了。

### 那么，const 有什么用呢？

尽管存在缺陷，C/C++ 的 `const` 仍有助于类型安全。特别是，结合 C++ 的移动语义和 `std::unique_pointer`，`const` 可以使指针所有权显式化。在超过十万行代码的 C++ 旧代码库里，指针所有权模糊是一个大难题，我对此深有感触。

但是，我以前常常使用 `const` 来实现有意义的类型安全。我曾听说过基于性能上的原因，最好是尽可能多地使用 `const`。我曾听说过当性能很重要时，重构代码并添加更多的 `const` 非常重要，即使以降低代码可读性的方式。**当时觉得这没问题，但后来我才知道这并不对。**

--------------------------------------------------------------------------------

via: https://theartofmachinery.com/2019/08/12/c_const_isnt_for_performance.html

作者：[Simon Arneaud][a]
选题：[lujun9972][b]
译者：[LazyWolfLin](https://github.com/LazyWolfLin)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://theartofmachinery.com
[b]: https://github.com/lujun9972
[1]: https://theartofmachinery.com/2019/04/05/d_as_c_replacement.html#const-and-immutable
[2]: https://sqlite.org/src/doc/trunk/README.md
[3]: https://rada.re/r/

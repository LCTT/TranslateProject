[#]: subject: "Code memory safety and efficiency by example"
[#]: via: "https://opensource.com/article/21/8/memory-programming-c"
[#]: author: "Marty Kalin https://opensource.com/users/mkalindepauledu"
[#]: collector: "lujun9972"
[#]: translator: "unigeorge"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13845-1.html"

实例讲解代码之内存安全与效率
======

> 了解有关内存安全和效率的更多信息。

![](https://img.linux.net.cn/data/attachment/album/202110/03/101238cd0hgdrhamzab7hj.jpg)

C 是一种高级语言，同时具有“<ruby>接近金属<rt>close-to-the-metal</rt></ruby>”（LCTT 译注：即“接近人类思维方式”的反义词）的特性，这使得它有时看起来更像是一种可移植的汇编语言，而不像 Java 或 Python 这样的兄弟语言。内存管理作为上述特性之一，涵盖了正在执行的程序对内存的安全和高效使用。本文通过 C 语言代码示例，以及现代 C 语言编译器生成的汇编语言代码段，详细介绍了内存安全性和效率。

尽管代码示例是用 C 语言编写的，但安全高效的内存管理指南对于 C++ 是同样适用的。这两种语言在很多细节上有所不同（例如，C++ 具有 C 所缺乏的面向对象特性和泛型），但在内存管理方面面临的挑战是一样的。

### 执行中程序的内存概述

对于正在执行的程序（又名 _<ruby>进程<rt>process</rt></ruby>_），内存被划分为三个区域：**<ruby>栈<rt>stack</rt></ruby>**、**<ruby>堆<rt>heap</rt></ruby>** 和 **<ruby>静态区<rt>static area</rt></ryby>**。下文会给出每个区域的概述，以及完整的代码示例。

作为通用 CPU 寄存器的替补，_栈_ 为代码块（例如函数或循环体）中的局部变量提供暂存器存储。传递给函数的参数在此上下文中也视作局部变量。看一下下面这个简短的示例：

```
void some_func(int a, int b) {
   int n;
   ...
}
```

通过 `a` 和 `b` 传递的参数以及局部变量 `n` 的存储会在栈中，除非编译器可以找到通用寄存器。编译器倾向于优先将通用寄存器用作暂存器，因为 CPU 对这些寄存器的访问速度很快（一个时钟周期）。然而，这些寄存器在台式机、笔记本电脑和手持机器的标准架构上很少（大约 16 个）。

在只有汇编语言程序员才能看到的实施层面，栈被组织为具有 `push`（插入）和 `pop`（删除）操作的 LIFO（后进先出）列表。 `top` 指针可以作为偏移的基地址；这样，除了 `top` 之外的栈位置也变得可访问了。例如，表达式 `top+16` 指向堆栈的 `top` 指针上方 16 个字节的位置，表达式 `top-16` 指向 `top` 指针下方 16 个字节的位置。因此，可以通过 `top` 指针访问实现了暂存器存储的栈的位置。在标准的 ARM 或 Intel 架构中，栈从高内存地址增长到低内存地址；因此，减小某进程的 `top` 就是增大其栈规模。

使用栈结构就意味着轻松高效地使用内存。编译器（而非程序员）会编写管理栈的代码，管理过程通过分配和释放所需的暂存器存储来实现；程序员声明函数参数和局部变量，将实现过程交给编译器。此外，完全相同的栈存储可以在连续的函数调用和代码块（如循环）中重复使用。精心设计的模块化代码会将栈存储作为暂存器的首选内存选项，同时优化编译器要尽可能使用通用寄存器而不是栈。

**堆** 提供的存储是通过程序员代码显式分配的，堆分配的语法因语言而异。在 C 中，成功调用库函数 `malloc`（或其变体 `calloc` 等）会分配指定数量的字节（在 C++ 和 Java 等语言中，`new` 运算符具有相同的用途）。编程语言在如何释放堆分配的存储方面有着巨大的差异：

  * 在 Java、Go、Lisp 和 Python 等语言中，程序员不会显式释放动态分配的堆存储。

    例如，下面这个 Java 语句为一个字符串分配了堆存储，并将这个堆存储的地址存储在变量 `greeting` 中：

    ```
    String greeting = new String("Hello, world!");
    ```

    Java 有一个垃圾回收器，它是一个运行时实用程序，如果进程无法再访问自己分配的堆存储，回收器可以使其自动释放。因此，Java 堆释放是通过垃圾收集器自动进行的。在上面的示例中，垃圾收集器将在变量 `greeting` 超出作用域后，释放字符串的堆存储。

  * Rust 编译器会编写堆释放代码。这是 Rust 在不依赖垃圾回收器的情况下，使堆释放实现自动化的开创性努力，但这也会带来运行时复杂性和开销。向 Rust 的努力致敬！
  * 在 C（和 C++）中，堆释放是程序员的任务。程序员调用 `malloc` 分配堆存储，然后负责相应地调用库函数 `free` 来释放该存储空间（在 C++ 中，`new` 运算符分配堆存储，而 `delete` 和 `delete[]` 运算符释放此类存储）。下面是一个 C 语言代码示例：

    ```
    char* greeting = malloc(14);       /* 14 heap bytes */
    strcpy(greeting, "Hello, world!"); /* copy greeting into bytes */
    puts(greeting);                    /* print greeting */
    free(greeting);                    /* free malloced bytes */
    ```

    C 语言避免了垃圾回收器的成本和复杂性，但也不过是让程序员承担了堆释放的任务。

内存的 **静态区** 为可执行代码（例如 C 语言函数）、字符串文字（例如“Hello, world!”）和全局变量提供存储空间：

```
int n;                       /* global variable */
int main() {                 /* function */
   char* msg = "No comment"; /* string literal */
   ...
}
```

该区域是静态的，因为它的大小从进程执行开始到结束都固定不变。由于静态区相当于进程固定大小的内存占用，因此经验法则是通过避免使用全局数组等方法来使该区域尽可能小。

下文会结合代码示例对本节概述展开进一步讲解。

### 栈存储

想象一个有各种连续执行的任务的程序，任务包括了处理每隔几分钟通过网络下载并存储在本地文件中的数字数据。下面的 `stack` 程序简化了处理流程（仅是将奇数整数值转换为偶数），而将重点放在栈存储的好处上。


```
#include <stdio.h>
#include <stdlib.h>

#define Infile   "incoming.dat"
#define Outfile  "outgoing.dat"
#define IntCount 128000  /* 128,000 */

void other_task1() { /*...*/ }
void other_task2() { /*...*/ }

void process_data(const char* infile,
          const char* outfile,
          const unsigned n) {
  int nums[n];
  FILE* input = fopen(infile, "r");
  if (NULL == infile) return;
  FILE* output = fopen(outfile, "w");
  if (NULL == output) {
    fclose(input);
    return;
  }

  fread(nums, n, sizeof(int), input); /* read input data */
  unsigned i;
  for (i = 0; i < n; i++) {
    if (1 == (nums[i] & 0x1))  /* odd parity? */
      nums[i]--;               /* make even */
  }
  fclose(input);               /* close input file */

  fwrite(nums, n, sizeof(int), output);
  fclose(output);
}

int main() {
  process_data(Infile, Outfile, IntCount);
  
  /** now perform other tasks **/
  other_task1(); /* automatically released stack storage available */
  other_task2(); /* ditto */
  
  return 0;
}
```

底部的 `main` 函数首先调用 `process_data` 函数，该函数会创建一个基于栈的数组，其大小由参数 `n` 给定（当前示例中为 128,000）。因此，该数组占用 `128000 * sizeof(int)` 个字节，在标准设备上达到了 512,000 字节（`int` 在这些设备上是四个字节）。然后数据会被读入数组（使用库函数 `fread`），循环处理，并保存到本地文件 `outgoing.dat`（使用库函数 `fwrite`）。

当 `process_data` 函数返回到其调用者 `main` 函数时，`process_data` 函数的大约 500MB 栈暂存器可供 `stack` 程序中的其他函数用作暂存器。在此示例中，`main` 函数接下来调用存根函数 `other_task1` 和 `other_task2`。这三个函数在 `main` 中依次调用，这意味着所有三个函数都可以使用相同的堆栈存储作为暂存器。因为编写栈管理代码的是编译器而不是程序员，所以这种方法对程序员来说既高效又容易。 

在 C 语言中，在块（例如函数或循环体）内定义的任何变量默认都有一个 `auto` 存储类，这意味着该变量是基于栈的。存储类 `register` 现在已经过时了，因为 C 编译器会主动尝试尽可能使用 CPU 寄存器。只有在块内定义的变量可能是 `register`，如果没有可用的 CPU 寄存器，编译器会将其更改为 `auto`。基于栈的编程可能是不错的首选方式，但这种风格确实有一些挑战性。下面的 `badStack` 程序说明了这点。

```
#include <stdio.h>;

const int* get_array(const unsigned n) {
  int arr[n]; /* stack-based array */
  unsigned i;
  for (i = 0; i < n; i++) arr[i] = 1 + 1;

  return arr;  /** ERROR **/
}

int main() {
  const unsigned n = 16;
  const int* ptr = get_array(n);
  
  unsigned i;
  for (i = 0; i < n; i++) printf("%i ", ptr[i]);
  puts("\n");

  return 0;
}
```

`badStack` 程序中的控制流程很简单。`main` 函数使用 16（LCTT 译注：原文为 128，应为作者笔误）作为参数调用函数 `get_array`，然后被调用函数会使用传入参数来创建对应大小的本地数组。`get_array` 函数会初始化数组并返回给 `main` 中的数组标识符 `arr`。 `arr` 是一个指针常量，保存数组的第一个 `int` 元素的地址。

当然，本地数组 `arr` 可以在 `get_array` 函数中访问，但是一旦 `get_array` 返回，就不能合法访问该数组。尽管如此，`main` 函数会尝试使用函数 `get_array` 返回的堆栈地址 `arr` 来打印基于栈的数组。现代编译器会警告错误。例如，下面是来自 GNU 编译器的警告：

```
badStack.c: In function 'get_array':
badStack.c:9:10: warning: function returns address of local variable [-Wreturn-local-addr]
return arr;  /** ERROR **/
```

一般规则是，如果使用栈存储实现局部变量，应该仅在该变量所在的代码块内，访问这块基于栈的存储（在本例中，数组指针 `arr` 和循环计数器 `i` 均为这样的局部变量）。因此，函数永远不应该返回指向基于栈存储的指针。

### 堆存储

接下来使用若干代码示例凸显在 C 语言中使用堆存储的优点。在第一个示例中，使用了最优方案分配、使用和释放堆存储。第二个示例（在下一节中）将堆存储嵌套在了其他堆存储中，这会使其释放操作变得复杂。

```
#include <stdio.h>
#include <stdlib.h>

int* get_heap_array(unsigned n) {
  int* heap_nums = malloc(sizeof(int) * n); 
  
  unsigned i;
  for (i = 0; i < n; i++)
    heap_nums[i] = i + 1;  /* initialize the array */
  
  /* stack storage for variables heap_nums and i released
     automatically when get_num_array returns */
  return heap_nums; /* return (copy of) the pointer */
}

int main() {
  unsigned n = 100, i;
  int* heap_nums = get_heap_array(n); /* save returned address */
  
  if (NULL == heap_nums) /* malloc failed */
    fprintf(stderr, "%s\n", "malloc(...) failed...");
  else {
    for (i = 0; i < n; i++) printf("%i\n", heap_nums[i]);
    free(heap_nums); /* free the heap storage */
  }
  return 0; 
}
```

上面的 `heap` 程序有两个函数： `main` 函数使用参数（示例中为 100）调用 `get_heap_array` 函数，参数用来指定数组应该有多少个 `int` 元素。因为堆分配可能会失败，`main` 函数会检查 `get_heap_array` 是否返回了 `NULL`；如果是，则表示失败。如果分配成功，`main` 将打印数组中的 `int` 值，然后立即调用库函数 `free` 来对堆存储解除分配。这就是最优的方案。

`get_heap_array` 函数以下列语句开头，该语句值得仔细研究一下：

```
int* heap_nums = malloc(sizeof(int) * n); /* heap allocation */
```

`malloc` 库函数及其变体函数针对字节进行操作；因此，`malloc` 的参数是 `n` 个 `int` 类型元素所需的字节数（`sizeof(int)` 在标准现代设备上是四个字节）。`malloc` 函数返回所分配字节段的首地址，如果失败则返回 `NULL` .

如果成功调用 `malloc`，在现代台式机上其返回的地址大小为 64 位。在手持设备和早些时候的台式机上，该地址的大小可能是 32 位，或者甚至更小，具体取决于其年代。堆分配数组中的元素是 `int` 类型，这是一个四字节的有符号整数。这些堆分配的 `int` 的地址存储在基于栈的局部变量 `heap_nums` 中。可以参考下图：

```
                 heap-based
 stack-based        /
     \        +----+----+   +----+
 heap-nums--->|int1|int2|...|intN|
              +----+----+   +----+
```

一旦 `get_heap_array` 函数返回，指针变量 `heap_nums` 的栈存储将自动回收——但动态 `int` 数组的堆存储仍然存在，这就是 `get_heap_array` 函数返回这个地址（的副本）给 `main` 函数的原因：它现在负责在打印数组的整数后，通过调用库函数 `free` 显式释放堆存储：

```
free(heap_nums); /* free the heap storage */
```

`malloc` 函数不会初始化堆分配的存储空间，因此里面是随机值。相比之下，其变体函数 `calloc` 会将分配的存储初始化为零。这两个函数都返回 `NULL` 来表示分配失败。

在 `heap` 示例中，`main` 函数在调用 `free` 后会立即返回，正在执行的程序会终止，这会让系统回收所有已分配的堆存储。尽管如此，程序员应该养成在不再需要时立即显式释放堆存储的习惯。

### 嵌套堆分配

下一个代码示例会更棘手一些。C 语言有很多返回指向堆存储的指针的库函数。下面是一个常见的使用情景：

1、C 程序调用一个库函数，该函数返回一个指向基于堆的存储的指针，而指向的存储通常是一个聚合体，如数组或结构体：

```
SomeStructure* ptr = lib_function(); /* returns pointer to heap storage */
```

2、 然后程序使用所分配的存储。

3、 对于清理而言，问题是对 `free` 的简单调用是否会清理库函数分配的所有堆分配存储。例如，`SomeStructure` 实例可能有指向堆分配存储的字段。一个特别麻烦的情况是动态分配的结构体数组，每个结构体有一个指向又一层动态分配的存储的字段。下面的代码示例说明了这个问题，并重点关注了如何设计一个可以安全地为客户端提供堆分配存储的库。

```
#include <stdio.h>
#include <stdlib.h>

typedef struct {
  unsigned id;
  unsigned len;
  float*   heap_nums;
} HeapStruct;
unsigned structId = 1;

HeapStruct* get_heap_struct(unsigned n) {
  /* Try to allocate a HeapStruct. */
  HeapStruct* heap_struct = malloc(sizeof(HeapStruct));
  if (NULL == heap_struct) /* failure? */
    return NULL;           /* if so, return NULL */

  /* Try to allocate floating-point aggregate within HeapStruct. */
  heap_struct->heap_nums = malloc(sizeof(float) * n);
  if (NULL == heap_struct->heap_nums) {  /* failure? */
    free(heap_struct);                   /* if so, first free the HeapStruct */
    return NULL;                         /* then return NULL */
  }

  /* Success: set fields */
  heap_struct->id = structId++;
  heap_struct->len = n;

  return heap_struct; /* return pointer to allocated HeapStruct */
}

void free_all(HeapStruct* heap_struct) {
  if (NULL == heap_struct) /* NULL pointer? */
    return;                /* if so, do nothing */
  
  free(heap_struct->heap_nums); /* first free encapsulated aggregate */
  free(heap_struct);            /* then free containing structure */  
}

int main() {
  const unsigned n = 100;
  HeapStruct* hs = get_heap_struct(n); /* get structure with N floats */

  /* Do some (meaningless) work for demo. */
  unsigned i;
  for (i = 0; i < n; i++) hs->heap_nums[i] = 3.14 + (float) i;
  for (i = 0; i < n; i += 10) printf("%12f\n", hs->heap_nums[i]);

  free_all(hs); /* free dynamically allocated storage */
  
  return 0;
}
```

上面的 `nestedHeap` 程序示例以结构体 `HeapStruct` 为中心，结构体中又有名为 `heap_nums` 的指针字段：

```
typedef struct {
  unsigned id;
  unsigned len;
  float*   heap_nums; /** pointer **/
} HeapStruct;
```

函数 `get_heap_struct` 尝试为 `HeapStruct` 实例分配堆存储，这需要为字段 `heap_nums` 指向的若干个 `float` 变量分配堆存储。如果成功调用 `get_heap_struct` 函数，并将指向堆分配结构体的指针以 `hs` 命名，其结果可以描述如下：

```
hs-->HeapStruct instance
        id
        len
        heap_nums-->N contiguous float elements
```

在 `get_heap_struct` 函数中，第一个堆分配过程很简单：

```
HeapStruct* heap_struct = malloc(sizeof(HeapStruct));
if (NULL == heap_struct) /* failure? */
  return NULL;           /* if so, return NULL */
```

`sizeof(HeapStruct)` 包括了 `heap_nums` 字段的字节数（32 位机器上为 4，64 位机器上为 8），`heap_nums` 字段则是指向动态分配数组中的 `float` 元素的指针。那么，问题关键在于 `malloc` 为这个结构体传送了字节空间还是表示失败的 `NULL`；如果是 `NULL`，`get_heap_struct` 函数就也返回 `NULL` 以通知调用者堆分配失败。

第二步尝试堆分配的过程更复杂，因为在这一步，`HeapStruct` 的堆存储已经分配好了：

```
heap_struct->heap_nums = malloc(sizeof(float) * n);
if (NULL == heap_struct->heap_nums) {  /* failure? */
  free(heap_struct);                   /* if so, first free the HeapStruct */
  return NULL;                         /* and then return NULL */
}
```

传递给 `get_heap_struct` 函数的参数 `n` 指明动态分配的 `heap_nums` 数组中应该有多少个 `float` 元素。如果可以分配所需的若干个 `float` 元素，则该函数在返回 `HeapStruct` 的堆地址之前会设置结构的 `id` 和 `len` 字段。 但是，如果尝试分配失败，则需要两个步骤来实现最优方案：

1、 必须释放 `HeapStruct` 的存储以避免内存泄漏。对于调用 `get_heap_struct` 的客户端函数而言，没有动态 `heap_nums` 数组的 `HeapStruct` 可能就是没用的；因此，`HeapStruct` 实例的字节空间应该显式释放，以便系统可以回收这些空间用于未来的堆分配。

2、 返回 `NULL` 以标识失败。

如果成功调用 `get_heap_struct` 函数，那么释放堆存储也很棘手，因为它涉及要以正确顺序进行的两次 `free` 操作。因此，该程序设计了一个 `free_all` 函数，而不是要求程序员再去手动实现两步释放操作。回顾一下，`free_all` 函数是这样的：

```
void free_all(HeapStruct* heap_struct) {
  if (NULL == heap_struct) /* NULL pointer? */
    return;                /* if so, do nothing */
  
  free(heap_struct->heap_nums); /* first free encapsulated aggregate */
  free(heap_struct);            /* then free containing structure */  
}
```

检查完参数 `heap_struct` 不是 `NULL` 值后，函数首先释放 `heap_nums` 数组，这步要求 `heap_struct` 指针此时仍然是有效的。先释放 `heap_struct` 的做法是错误的。一旦 `heap_nums` 被释放，`heap_struct` 就可以释放了。如果 `heap_struct` 被释放，但 `heap_nums` 没有被释放，那么数组中的 `float` 元素就会泄漏：仍然分配了字节空间，但无法被访问到——因此一定要记得释放 `heap_nums`。存储泄漏将一直持续，直到 `nestedHeap` 程序退出，系统回收泄漏的字节时为止。

关于 `free` 库函数的注意事项就是要有顺序。回想一下上面的调用示例：

```
free(heap_struct->heap_nums); /* first free encapsulated aggregate */
free(heap_struct);            /* then free containing structure */
```

这些调用释放了分配的存储空间——但它们并 _不是_ 将它们的操作参数设置为 `NULL`（`free` 函数会获取地址的副本作为参数；因此，将副本更改为 `NULL` 并不会改变原地址上的参数值）。例如，在成功调用 `free` 之后，指针 `heap_struct` 仍然持有一些堆分配字节的堆地址，但是现在使用这个地址将会产生错误，因为对 `free` 的调用使得系统有权回收然后重用这些分配过的字节。

使用 `NULL` 参数调用 `free` 没有意义，但也没有什么坏处。而在非 `NULL` 的地址上重复调用 `free` 会导致不确定结果的错误：

```
free(heap_struct);  /* 1st call: ok */
free(heap_struct);  /* 2nd call: ERROR */
```

### 内存泄漏和堆碎片化

“内存泄漏”是指动态分配的堆存储变得不再可访问。看一下相关的代码段： 

```
float* nums = malloc(sizeof(float) * 10); /* 10 floats */
nums[0] = 3.14f;                          /* and so on */
nums = malloc(sizeof(float) * 25);        /* 25 new floats */
```

假如第一个 `malloc` 成功，第二个 `malloc` 会再将 `nums` 指针重置为 `NULL`（分配失败情况下）或是新分配的 25 个 `float` 中第一个的地址。最初分配的 10 个 `float` 元素的堆存储仍然处于被分配状态，但此时已无法再对其访问，因为 `nums` 指针要么指向别处，要么是 `NULL`。结果就是造成了 40 个字节（`sizeof(float) * 10`）的泄漏。 

在第二次调用 `malloc` 之前，应该释放最初分配的存储空间： 

```
float* nums = malloc(sizeof(float) * 10); /* 10 floats */
nums[0] = 3.14f;                          /* and so on */
free(nums);                               /** good **/
nums = malloc(sizeof(float) * 25);        /* no leakage */
```

即使没有泄漏，堆也会随着时间的推移而碎片化，需要对系统进行碎片整理。例如，假设两个最大的堆块当前的大小分别为 200MB 和 100MB。然而，这两个堆块并不连续，进程 `P` 此时又需要分配 250MB 的连续堆存储。在进行分配之前，系统可能要对堆进行 _碎片整理_ 以给 `P` 提供 250MB 连续存储空间。碎片整理很复杂，因此也很耗时。 

内存泄漏会创建处于已分配状态但不可访问的堆块，从而会加速碎片化。因此，释放不再需要的堆存储是程序员帮助减少碎片整理需求的一种方式。 

### 诊断内存泄漏的工具

有很多工具可用于分析内存效率和安全性，其中我最喜欢的是 [valgrind][11]。为了说明该工具如何处理内存泄漏，这里给出 `leaky` 示例程序： 

```
#include <stdio.h>
#include <stdlib.h>

int* get_ints(unsigned n) {
  int* ptr = malloc(n * sizeof(int));
  if (ptr != NULL) {
    unsigned i;
    for (i = 0; i < n; i++) ptr[i] = i + 1;
  }
  return ptr;
}

void print_ints(int* ptr, unsigned n) {
  unsigned i;
  for (i = 0; i < n; i++) printf("%3i\n", ptr[i]);
}

int main() {
  const unsigned n = 32;
  int* arr = get_ints(n);
  if (arr != NULL) print_ints(arr, n);

  /** heap storage not yet freed... **/
  return 0;
}
```

`main` 函数调用了 `get_ints` 函数，后者会试着从堆中 `malloc` 32 个 4 字节的 `int`，然后初始化动态数组（如果 `malloc` 成功）。初始化成功后，`main` 函数会调用 `print_ints`函数。程序中并没有调用 `free` 来对应 `malloc` 操作；因此，内存泄漏了。 

如果安装了 `valgrind` 工具箱，下面的命令会检查 `leaky` 程序是否存在内存泄漏（`%` 是命令行提示符）： 

```
% valgrind --leak-check=full ./leaky
```

绝大部分输出都在下面给出了。左边的数字 207683 是正在执行的 `leaky` 程序的进程标识符。这份报告给出了泄漏发生位置的详细信息，本例中位置是在 `main` 函数所调用的 `get_ints` 函数中对 `malloc` 的调用处。 

```
==207683== HEAP SUMMARY:
==207683==   in use at exit: 128 bytes in 1 blocks
==207683==   total heap usage: 2 allocs, 1 frees, 1,152 bytes allocated
==207683== 
==207683== 128 bytes in 1 blocks are definitely lost in loss record 1 of 1
==207683==   at 0x483B7F3: malloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_memcheck-amd64-linux.so)
==207683==   by 0x109186: get_ints (in /home/marty/gc/leaky)
==207683==   by 0x109236: main (in /home/marty/gc/leaky)
==207683== 
==207683== LEAK SUMMARY:
==207683==   definitely lost: 128 bytes in 1 blocks
==207683==   indirectly lost: 0 bytes in 0 blocks
==207683==   possibly lost: 0 bytes in 0 blocks
==207683==   still reachable: 0 bytes in 0 blocks
==207683==   suppressed: 0 bytes in 0 blocks
```

如果把 `main` 函数改成在对 `print_ints` 的调用之后，再加上一个对 `free` 的调用，`valgrind` 就会对 `leaky` 程序给出一个干净的内存健康清单： 

```
==218462== All heap blocks were freed -- no leaks are possible
```

### 静态区存储

在正统的 C 语言中，函数必须在所有块之外定义。这是一些 C 编译器支持的特性，杜绝了在另一个函数体内定义一个函数的可能。我举的例子都是在所有块之外定义的函数。这样的函数要么是 `static` ，即静态的，要么是 `extern`，即外部的，其中 `extern` 是默认值。 

C 语言中，以 `static` 或 `extern` 修饰的函数和变量驻留在内存中所谓的 **静态区** 中，因为在程序执行期间该区域大小是固定不变的。这两个存储类型的语法非常复杂，我们应该回顾一下。在回顾之后，会有一个完整的代码示例来生动展示语法细节。在所有块之外定义的函数或变量默认为 `extern`；因此，函数和变量要想存储类型为 `static` ，必须显式指定： 

```
/** file1.c: outside all blocks, five definitions  **/
int foo(int n) { return n * 2; }     /* extern by default */
static int bar(int n) { return n; }  /* static */
extern int baz(int n) { return -n; } /* explicitly extern */

int num1;        /* extern */
static int num2; /* static */
```

`extern` 和 `static` 的区别在于作用域：`extern` 修饰的函数或变量可以实现跨文件可见（需要声明）。相比之下，`static` 修饰的函数仅在 _定义_ 该函数的文件中可见，而 `static` 修饰的变量仅在 _定义_ 该变量的文件（或文件中的块）中可见： 

```
static int n1;    /* scope is the file */
void func() {
   static int n2; /* scope is func's body */
   ...
}
```

如果在所有块之外定义了 `static` 变量，例如上面的 `n1`，该变量的作用域就是定义变量的文件。无论在何处定义 `static` 变量，变量的存储都在内存的静态区中。 

`extern` 函数或变量在给定文件中的所有块之外定义，但这样定义的函数或变量也可以在其他文件中声明。典型的做法是在头文件中 _声明_ 这样的函数或变量，只要需要就可以包含进来。下面这些简短的例子阐述了这些棘手的问题。 

假设 `extern` 函数 `foo` 在 `file1.c` 中 _定义_，有无关键字 `extern` 效果都一样： 

```
/** file1.c **/
int foo(int n) { return n * 2; } /* definition has a body {...} */
```

必须在其他文件（或其中的块）中使用显式的 `extern` _声明_ 此函数才能使其可见。以下是使 `extern` 函数 `foo` 在文件 `file2.c` 中可见的声明语句： 

```
/** file2.c: make function foo visible here **/
extern int foo(int); /* declaration (no body) */
```

回想一下，函数声明没有用大括号括起来的主体，而函数定义会有这样的主体。 

为了便于查看，函数和变量声明通常会放在头文件中。准备好需要声明的源代码文件，然后就可以 `#include` 相关的头文件。下一节中的 `staticProg` 程序演示了这种方法。 

至于 `extern` 的变量，规则就变得更棘手了（很抱歉增加了难度！）。任何 `extern` 的对象——无论函数或变量——必须 _定义_ 在所有块之外。此外，在所有块之外定义的变量默认为 `extern`： 

```
/** outside all blocks **/
int n; /* defaults to extern */
```

但是，只有在变量的 _定义_ 中显式初始化变量时，`extern` 才能在变量的 _定义_ 中显式修饰（LCTT 译注：换言之，如果下列代码中的 `int n1;` 行前加上 `extern`，该行就由 _定义_ 变成了 _声明_）： 

```
/** file1.c: outside all blocks **/
int n1;             /* defaults to extern, initialized by compiler to zero */
extern int n2 = -1; /* ok, initialized explicitly */
int n3 = 9876;      /* ok, extern by default and initialized explicitly */
```

要使在 `file1.c` 中定义为 `extern` 的变量在另一个文件（例如 `file2.c`）中可见，该变量必须在 `file2.c` 中显式 _声明_ 为 `extern` 并且不能初始化（初始化会将声明转换为定义）：

```
/** file2.c **/
extern int n1; /* declaration of n1 defined in file1.c */
```

为了避免与 `extern` 变量混淆，经验是在 _声明_ 中显式使用 `extern`（必须），但不要在 _定义_ 中使用（非必须且棘手）。对于函数，`extern` 在定义中是可选使用的，但在声明中是必须使用的。下一节中的 `staticProg` 示例会把这些点整合到一个完整的程序中。

### staticProg 示例 

`staticProg` 程序由三个文件组成：两个 C 语言源文件（`static1.c` 和 `static2.c`）以及一个头文件（`static.h`），头文件中包含两个声明：

```
/** header file static.h **/
#define NumCount 100               /* macro */
extern int global_nums[NumCount];  /* array declaration */
extern void fill_array();          /* function declaration */
```

两个声明中的 `extern`，一个用于数组，另一个用于函数，强调对象在别处（“外部”）_定义_：数组 `global_nums` 在文件 `static1.c` 中定义（没有显式的 `extern`），函数 `fill_array` 在文件 `static2.c` 中定义（也没有显式的 `extern`）。每个源文件都包含了头文件 `static.h`。`static1.c` 文件定义了两个驻留在内存静态区域中的数组（`global_nums` 和 `more_nums`）。第二个数组有 `static` 修饰，这将其作用域限制为定义数组的文件 (`static1.c`)。如前所述， `extern` 修饰的 `global_nums` 则可以实现在多个文件中可见。 

```
/** static1.c **/
#include <stdio.h>
#include <stdlib.h>

#include "static.h"             /* declarations */

int global_nums[NumCount];      /* definition: extern (global) aggregate */
static int more_nums[NumCount]; /* definition: scope limited to this file */

int main() {
  fill_array(); /** defined in file static2.c **/

  unsigned i;
  for (i = 0; i < NumCount; i++)
    more_nums[i] = i * -1;

  /* confirm initialization worked */
  for (i = 0; i < NumCount; i += 10) 
    printf("%4i\t%4i\n", global_nums[i], more_nums[i]);
    
  return 0;  
}
```

下面的 `static2.c` 文件中定义了 `fill_array` 函数，该函数由 `main`（在 `static1.c` 文件中）调用；`fill_array` 函数会给名为 `global_nums` 的 `extern` 数组中的元素赋值，该数组在文件 `static1.c` 中定义。使用两个文件的唯一目的是凸显 `extern` 变量或函数能够跨文件可见。 

```
/** static2.c **/
#include "static.h" /** declarations **/

void fill_array() { /** definition **/
  unsigned i;
  for (i = 0; i < NumCount; i++) global_nums[i] = i + 2;
}
```

`staticProg` 程序可以用如下编译：

```
% gcc -o staticProg static1.c static2.c
```

### 从汇编语言看更多细节 

现代 C 编译器能够处理 C 和汇编语言的任意组合。编译 C 源文件时，编译器首先将 C 代码翻译成汇编语言。这是对从上文 `static1.c` 文件生成的汇编语言进行保存的命令：

```
% gcc -S static1.c
```

生成的文件就是 `static1.s`。这是文件顶部的一段代码，额外添加了行号以提高可读性： 

```
    .file    "static1.c"          ## line  1
    .text                         ## line  2
    .comm    global_nums,400,32   ## line  3
    .local    more_nums           ## line  4
    .comm    more_nums,400,32     ## line  5
    .section    .rodata           ## line  6
.LC0:                             ## line  7
    .string    "%4i\t%4i\n"       ## line  8
    .text                         ## line  9
    .globl    main                ## line 10
    .type    main, @function      ## line 11
main:                             ## line 12
...
```

诸如 `.file`（第 1 行）之类的汇编语言指令以句点开头。顾名思义，指令会指导汇编程序将汇编语言翻译成机器代码。`.rodata` 指令（第 6 行）表示后面是只读对象，包括字符串常量 `"%4i\t%4i\n"`（第 8 行），`main` 函数（第 12 行）会使用此字符串常量来实现格式化输出。作为标签引入（通过末尾的冒号实现）的 `main` 函数（第 12 行），同样也是只读的。

在汇编语言中，标签就是地址。标签 `main:`（第 12 行）标记了 `main` 函数代码开始的地址，标签 `.LC0:`（第 7 行）标记了格式化字符串开头所在的地址。 

`global_nums`（第 3 行）和 `more_nums`（第 4 行）数组的定义包含了两个数字：400 是每个数组中的总字节数，32 是每个数组（含 100 个 `int` 元素）中每个元素的比特数。（第 5 行中的 `.comm` 指令表示 `common name`，可以忽略。） 

两个数组定义的不同之处在于 `more_nums` 被标记为 `.local`（第 4 行），这意味着其作用域仅限于其所在文件 `static1.s`。相比之下，`global_nums` 数组就能在多个文件中实现可见，包括由 `static1.c` 和 `static2.c` 文件翻译成的汇编文件。 

最后，`.text` 指令在汇编代码段中出现了两次（第 2 行和第 9 行）。术语“text”表示“只读”，但也会涵盖一些读/写变量，例如两个数组中的元素。尽管本文展示的汇编语言是针对 Intel 架构的，但 Arm6 汇编也非常相似。对于这两种架构，`.text` 区域中的变量（本例中为两个数组中的元素）会自动初始化为零。 

### 总结

C 语言中的内存高效和内存安全编程准则很容易说明，但可能会很难遵循，尤其是在调用设计不佳的库的时候。准则如下：

  * 尽可能使用栈存储，进而鼓励编译器将通用寄存器用作暂存器，实现优化。栈存储代表了高效的内存使用并促进了代码的整洁和模块化。永远不要返回指向基于栈的存储的指针。
  * 小心使用堆存储。C（和 C++）中的重难点是确保动态分配的存储尽快解除分配。良好的编程习惯和工具（如 `valgrind`）有助于攻关这些重难点。优先选用自身提供释放函数的库，例如 `nestedHeap` 代码示例中的 `free_all` 释放函数。 
  * 谨慎使用静态存储，因为这种存储会自始至终地影响进程的内存占用。特别是尽量避免使用 `extern` 和 `static` 数组。 

本文 C 语言代码示例可在我的网站（<https://condor.depaul.edu/mkalin>）上找到。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/memory-programming-c

作者：[Marty Kalin][a]
选题：[lujun9972][b]
译者：[unigeorge](https://github.com/unigeorge)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mkalindepauledu
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_development_programming.png?itok=4OM29-82 (Code going into a computer.)
[2]: http://www.opengroup.org/onlinepubs/009695399/functions/fopen.html
[3]: http://www.opengroup.org/onlinepubs/009695399/functions/fclose.html
[4]: http://www.opengroup.org/onlinepubs/009695399/functions/fread.html
[5]: http://www.opengroup.org/onlinepubs/009695399/functions/fwrite.html
[6]: http://www.opengroup.org/onlinepubs/009695399/functions/printf.html
[7]: http://www.opengroup.org/onlinepubs/009695399/functions/puts.html
[8]: http://www.opengroup.org/onlinepubs/009695399/functions/malloc.html
[9]: http://www.opengroup.org/onlinepubs/009695399/functions/fprintf.html
[10]: http://www.opengroup.org/onlinepubs/009695399/functions/free.html
[11]: https://www.valgrind.org/

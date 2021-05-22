[#]: collector: (lujun9972)
[#]: translator: (mengxinayan)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13413-1.html)
[#]: subject: (A guide to understanding Linux software libraries in C)
[#]: via: (https://opensource.com/article/21/2/linux-software-libraries)
[#]: author: (Marty Kalin https://opensource.com/users/mkalindepauledu)

用 C 语言理解 Linux 软件库
======

> 软件库是重复使用代码的一种简单而合理的方式。

![](https://img.linux.net.cn/data/attachment/album/202105/22/165307u0n970uivji7kiim.jpg)

软件库是一种是一直以来长期存在的、简单合理的复用代码的方式。这篇文章解释了如何从头开始构建库并使得其可用。尽管这两个示例库都以 Linux 为例，但创建、发布和使用这些库的步骤也可以应用于其它类 Unix 系统。

这些示例库使用 C 语言编写，非常适合该任务。Linux 内核大部分由 C 语言和少量汇编语言编写（Windows 和 Linux 的表亲如 macOS 也是如此）。用于输入/输出、网络、字符串处理、数学、安全、数据编码等的标准系统库等主要由 C 语言编写。所以使用 C 语言编写库就是使用 Linux 的原生语言来编写。除此之外，C 语言的性能也在一众高级语言中鹤立鸡群。

还有两个来访问这些库的示例<ruby>客户程序<rt>client</rt></ruby>（一个使用 C，另一个使用 Python）。毫无疑问可以使用 C 语言客户程序来访问 C 语言编写的库，但是 Python 客户程序示例说明了一个由 C 语言编写的库也可以服务于其他编程语言。

### 静态库和动态库对比

Linux 系统存在两种类型库：

  * **静态库（也被称为归档库）**：在编译过程中的链接阶段，静态库会被编译进程序（例如 C 或 Rust）中。每个客户程序都有属于自己的一份库的拷贝。静态库有一个显而易见的缺点 —— 当库需要进行一定改动时（例如修复一个 bug），静态库必须重新链接一次。接下来要介绍的动态库避免了这一缺点。
  * **动态库（也被称为共享库）**：动态库首先会在程序编译中的链接阶段被标记，但是客户程序和库代码在运行之前仍然没有联系，且库代码不会进入到客户程序中。系统的动态加载器会把一个共享库和正在运行的客户程序进行连接，无论该客户程序是由静态编译语言（如 C）编写，还是由动态解释语言（如 Python）编写。因此，动态库不需要麻烦客户程序便可以进行更新。最后，多个客户程序可以共享同一个动态库的单一副本。

通常来说，动态库优于静态库，尽管其复杂性较高而性能较低。下面是两种类型的库如何创建和发布：

  1. 库的源代码会被编译成一个或多个目标模块，目标模块是二进制文件，可以被包含在库中并且链接到可执行的二进制中。
  2. 目标模块会会被打包成一个文件。对于静态库，标准的文件拓展名是 `.a` 意为“<ruby>归档<rt>archive</rt></ruby>”；对于动态库，标准的文件拓展名是 `.so` 意为“<ruby>共享目标<rt>shared object</rt></ruby>”。对于这两个相同功能的示例库，分别发布为 `libprimes.a` （静态库）和 `libshprimes.so` （动态库）。两种库的文件名都使用前缀 `lib` 进行标识。
  3. 库文件被复制到标准目录下，使得客户程序可以轻松地访问到库。无论是静态库还是动态库，典型的位置是 `/usr/lib` 或者 `/usr/local/lib`，当然其他位置也是可以的。

构建和发布每种库的具体步骤会在下面详细介绍。首先我将介绍两种库里涉及到的 C 函数。

### 示例库函数

这两个示例库都是由五个相同的 C 函数构建而成的，其中四个函数可供客户程序使用。第五个函数是其他四个函数的一个工具函数，它显示了 C 语言怎么隐藏信息。每个函数的源代码都很短，可以将这些函数放在单个源文件中，尽管也可以放在多个源文件中（如四个公布的函数都有一个文件）。

这些库函数是基本的处理函数，以多种方式来处理质数。所有的函数接收无符号（即非负）整数值作为参数：

- `is_prime` 函数测试其单个参数是否为质数。
- `are_coprimes` 函数检查了其两个参数的<ruby>最大公约数<rt>greatest common divisor</rt></ruby>（gcd）是否为 1，即是否为互质数。
- `prime_factors`：函数列出其参数的质因数。
- `glodbach`：函数接收一个大于等于 4 的偶数，列出其可以分解为两个质数的和。它也许存在多个符合条件的数对。该函数是以 18 世纪数学家 <ruby>[克里斯蒂安·哥德巴赫][2]<rt>Christian Goldbach</rt></ruby> 命名的，他的猜想是任意一个大于 2 的偶数可以分解为两个质数之和，这依旧是数论里最古老的未被解决的问题。

工具函数 `gcd` 留在已部署的库文件中，但是在没有包含这个函数的文件无法访问此函数。因此，一个使用库的客户程序无法调用 `gcd` 函数。仔细观察 C 函数可以明白这一点。

### 更多关于 C 函数的内容

每个在 C 语言中的函数都有一个存储类，它决定了函数的范围。对于函数，有两种选择。

- 函数默认的存储类是 `extern`，它给了函数一个全局域。一个客户程序可以调用在示例库中用 `extern` 修饰的任意函数。下面是一个带有显式 `extern` 声明的 `are_coprimes` 函数定义：

  ```
  extern unsigned are_coprimes(unsigned n1, unsigned n2) {
    ...
  }
  ``` 
- 存储类 `static` 将一个函数的的范围限制到函数被定义的文件中。在示例库中，工具函数 `gcd` 是静态的（`static`）：

  ```
  static unsigned gcd(unsigned n1, unsigned n2) {
    ...
  }
  ```

只有在 `primes.c` 文件中的函数可以调用 `gcd`，而只有 `are_coprimes` 函数会调用它。当静态库和动态库被构建和发布后，其他的程序可以调用外部的（`extern`）函数，如 `are_coprimes` ，但是不可以调用静态（`static`）函数 `gcd`。静态（`static`）存储类通过将函数范围限制在其他库函数内，进而实现了对库的客户程序隐藏 `gcd` 函数。

在 `primes.c` 文件中除了 `gcd` 函数外，其他函数并没有指明存储类，默认将会设置为外部的（`extern`）。然而，在库中显式注明 `extern` 更加常见。

C 语言区分了函数的<ruby>定义<rt>definition</rt></ruby>和<ruby>声明<rt>declaration</rt></ruby>，这对库来说很重要。接下来让我们开始了解定义。C 语言仅允许命名函数不允许匿名函数，并且每个函数需要定义以下内容：

- 一个唯一的名字。一个程序不允许存在两个同名的函数。
- 一个可以为空的参数列表。参数需要指明类型。
- 一个返回值类型（例如：`int` 代表 32 位有符号整数），当没有返回值时设置为空类型（`void`）。
- 用一对花括号包围起来的函数主体部分。在一个特制的示例中，函数主体部分可以为空。

程序中的每个函数必须要被定义一次。

下面是库函数 `are_coprimes` 的完整定义：

```
extern unsigned are_coprimes(unsigned n1, unsigned n2) { /* 定义 */
  return 1 == gcd(n1, n2); /* 最大公约数是否为 1? */
}
```

函数返回一个布尔值（`0` 代表假，`1` 代表真），取决于两个整数参数值的最大公约数是否为 1。工具函数 `gcd` 计算两个整数参数 `n1` 和 `n2` 的最大公约数。

函数声明不同于定义，其不需要主体部分：

```
extern unsigned are_coprimes(unsigned n1, unsigned n2); /* 声明 */
```

声明在参数列表后用一个分号代表结束，它没有被花括号包围起来的主体部分。程序中的函数可以被多次声明。

为什么需要声明？在 C 语言中，一个被调用的函数必须对其调用者可见。有多种方式可以提供这样的可见性，具体依赖于编译器如何实现。一个必然可行的方式就是当它们二者位于同一个文件中时，将被调用的函数定义在在它的调用者之前。

```
void f() {...}     /* f 定义在其被调用前 */
void g() { f(); }  /* ok */
```

当函数 `f` 被在调用前声明，此时函数 `f` 的定义可以移动到函数 `g` 的下方。

```
void f();         /* 声明使得函数 f 对调用者可见 */
void g() { f(); } /* ok */
void f() {...}    /* 相较于前一种方式，此方式显得更简洁 */
```

但是当如果一个被调用的函数和调用它的函数不在同一个文件中时呢？因为前文提到一个函数在一个程序中需要被定义一次，那么如何使得让一个文件中被定义的函数在另一个文件中可见？

这个问题会影响库，无论是静态库还是动态库。例如在这两个质数库中函数被定义在源文件 `primes.c` 中，每个库中都有该函数的二进制副本，但是这些定义的函数必须要对使用库的 C 程序可见，该 C 程序有其自身的源文件。

函数声明可以帮助提供跨文件的可见性。对于上述的“质数”例子，它有一个名为 `primes.h` 的头文件，其声明了四个函数使得它们对使用库的 C 程序可见。

```
/** 头文件 primes.h：函数声明 **/
extern unsigned is_prime(unsigned);
extern void prime_factors(unsigned);
extern unsigned are_coprimes(unsigned, unsigned);
extern void goldbach(unsigned);
```

这些声明通过为每个函数指定其调用语法来作为接口。

为了客户程序的便利性，头文件 `primes.h` 应该存储在 C 编译器查找路径下的目录中。典型的位置有 `/usr/include` 和 `/usr/local/include`。一个 C 语言客户程序应使用 `#include` 包含这个头文件，并尽可能将这条语句其程序源代码的首部（头文件将会被导入另一个源文件的“头”部）。C 语言头文件可以被导入其他语言（如 Rust 语言）中的 `bindgen`，使其它语言的客户程序可以访问 C 语言的库。

总之，一个库函数只可以被定义一次，但可以在任何需要它的地方进行声明，任一使用 C 语言库的程序都需要该声明。头文件可以包含函数声明，但不能包含函数定义。如果头文件包含了函数定义，那么该文件可能会在一个 C 语言程序中被多次包含，从而破坏了一个函数在 C 语言程序中必须被精确定义一次的规则。

### 库的源代码

下面是两个库的源代码。这部分代码、头文件、以及两个示例客户程序都可以在 [我的网页][3] 上找到。

```
#include <stdio.h>
#include <math.h>

extern unsigned is_prime(unsigned n) {
  if (n <= 3) return n > 1;                   /* 2 和 3 是质数 */
  if (0 == (n % 2) || 0 == (n % 3)) return 0; /* 2 和 3 的倍数不会是质数 */

  /* 检查 n 是否是其他 < n 的值的倍数 */
  unsigned i;
  for (i = 5; (i * i) <= n; i += 6)
    if (0 == (n % i) || 0 == (n % (i + 2))) return 0; /* 不是质数 */

  return 1; /* 一个不是 2 和 3 的质数 */
}

extern void prime_factors(unsigned n) {
  /* 在数字 n 的质因数分解中列出所有 2 */
  while (0 == (n % 2)) {  
    printf("%i ", 2);
    n /= 2;
  }

  /* 数字 2 已经处理完成，下面处理奇数 */
  unsigned i;
  for (i = 3; i <= sqrt(n); i += 2) {
    while (0 == (n % i)) {
      printf("%i ", i);
      n /= i;
    }
  }

  /* 还有其他质因数？*/
  if (n > 2) printf("%i", n);
}

/* 工具函数：计算最大公约数 */
static unsigned gcd(unsigned n1, unsigned n2) {
  while (n1 != 0) {
    unsigned n3 = n1;
    n1 = n2 % n1;
    n2 = n3;
  }
  return n2;
}

extern unsigned are_coprimes(unsigned n1, unsigned n2) {
  return 1 == gcd(n1, n2);
}

extern void goldbach(unsigned n) {
  /* 输入错误 */
  if ((n <= 2) || ((n & 0x01) > 0)) {
    printf("Number must be > 2 and even: %i is not.\n", n);
    return;
  }

  /* 两个简单的例子：4 和 6 */
  if ((4 == n) || (6 == n)) {
    printf("%i = %i + %i\n", n, n / 2, n / 2);
    return;
  }
 
  /* 当 n > 8 时，存在多种可能性 */
  unsigned i;
  for (i = 3; i < (n / 2); i++) {
    if (is_prime(i) && is_prime(n - i)) {
      printf("%i = %i + %i\n", n, i, n - i);
      /* 如果只需要一对，那么用 break 语句替换这句 */
    }
  }
}
```

*库函数*

这些函数可以被库利用。两个库可以从相同的源代码中获得，同时头文件 `primes.h` 是两个库的 C 语言接口。

### 构建库

静态库和动态库在构建和发布的步骤上有一些细节的不同。静态库需要三个步骤，而动态库需要增加两个步骤即一共五个步骤。额外的步骤表明了动态库的动态方法具有更多的灵活性。让我们先从静态库开始。

库的源文件 `primes.c` 被编译成一个目标模块。下面是命令，百分号 `%` 代表系统提示符，两个井字符 `#` 是我的注释。

```
% gcc -c primes.c ## 步骤1（静态）
```

这一步生成目标模块是二进制文件 `primes.o`。`-c` 标志意味着只编译。

下一步是使用 Linux 的 `ar` 命令将目标对象归档。

```
% ar -cvq libprimes.a primes.o ## 步骤2（静态）
```

`-cvq` 三个标识分别是“创建”、“详细的”、“快速添加”（以防新文件没有添加到归档中）的简称。回忆一下，前文提到过前缀 `lib` 是必须的，而库名是任意的。当然，库的文件名必须是唯一的，以避免冲突。

归档已经准备好要被发布：

```
% sudo cp libprimes.a /usr/local/lib ## 步骤3（静态）
```

现在静态库对接下来的客户程序是可见的，示例在后面。（包含 `sudo` 可以确保有访问权限将文件复制进 `/usr/local/lib` 目录中）

动态库还需要一个或多个对象模块进行打包：

```
% gcc primes.c -c -fpic ## 步骤1（动态）
```

增加的选项 `-fpic` 指示编译器生成与位置无关的代码，这意味着不需要将该二进制模块加载到一个固定的内存位置。在一个拥有多个动态库的系统中这种灵活性是至关重要的。生成的对象模块会略大于静态库生成的对象模块。

下面是从对象模块创建单个库文件的命令：

```
% gcc -shared -Wl,-soname,libshprimes.so -o libshprimes.so.1 primes.o ## 步骤2（动态）
```

选项 `-shared` 表明了该库是一个共享的（动态的）而不是静态的。`-Wl` 选项引入了一系列编译器选项，第一个便是设置动态库的 `-soname`，这是必须设置的。`soname` 首先指定了库的逻辑名字（`libshprimes.so`），接下来的 `-o` 选项指明了库的物理文件名字（`libshprimes.so.1`）。这样做的目的是为了保持逻辑名不变的同时允许物理名随着新版本而发生变化。在本例中，在物理文件名 `libshprimes.so.1` 中最后的 1 代表是第一个库的版本。尽管逻辑文件名和物理文件名可以是相同的，但是最佳做法是将它们命名为不同的名字。一个客户程序将会通过逻辑名（本例中为 `libshprimes.so`）来访问库，稍后我会进一步解释。

接下来的一步是通过复制共享库到合适的目录下使得客户程序容易访问，例如 `/usr/local/lib` 目录：

```
% sudo cp libshprimes.so.1 /usr/local/lib ## 步骤3（动态）
```

现在在共享库的逻辑名（`libshprimes.so`）和它的物理文件名（`/usr/local/lib/libshprimes.so.1`）之间设置一个符号链接。最简单的方式是将 `/usr/local/lib` 作为工作目录，在该目录下输入命令：

```
% sudo ln --symbolic libshprimes.so.1 libshprimes.so ## 步骤4（动态）
```

逻辑名 `libshprimes.so` 不应该改变，但是符号链接的目标（`libshrimes.so.1`）可以根据需要进行更新，新的库实现可以是修复了 bug，提高性能等。

最后一步（一个预防措施）是调用 `ldconfig` 工具来配置系统的动态加载器。这个配置保证了加载器能够找到新发布的库。

```
% sudo ldconfig ## 步骤5（动态）
```

到现在，动态库已为包括下面的两个在内的示例客户程序准备就绪了。

### 一个使用库的 C 程序

这个示例 C 程序是一个测试程序，它的源代码以两条 `#include` 指令开始：

```
#include <stdio.h>  /* 标准输入/输出函数 */
#include <primes.h> /* 我的库函数 */
```

文件名两边的尖括号表示可以在编译器的搜索路径中找到这些头文件（对于 `primes.h` 文件来说在 `/usr/local/inlcude` 目录下）。如果不包含 `#include`，编译器会抱怨缺少 `is_prime` 和 `prime_factors` 等函数的声明，它们在两个库中都有发布。顺便提一句，测试程序的源代码不需要更改即可测试两个库中的每一个库。

相比之下，库的源文件（`primes.c`）使用 `#include` 指令打开以下头文件：

```
#include <stdio.h>
#include <math.h>
```

`math.h` 头文件是必须的，因为库函数 `prime_factors` 会调用数学函数 `sqrt`，其在标准库 `libm.so` 中。

作为参考，这是测试库程序的源代码：

```
#include <stdio.h>
#include <primes.h>

int main() {
  /* 是质数 */
  printf("\nis_prime\n");
  unsigned i, count = 0, n = 1000;
  for (i = 1; i <= n; i++) {
    if (is_prime(i)) {
      count++;
      if (1 == (i % 100)) printf("Sample prime ending in 1: %i\n", i);
    }
  }
  printf("%i primes in range of 1 to a thousand.\n", count);

  /* prime_factors */
  printf("\nprime_factors\n");
  printf("prime factors of 12: ");
  prime_factors(12);
  printf("\n");
 
  printf("prime factors of 13: ");
  prime_factors(13);
  printf("\n");
 
  printf("prime factors of 876,512,779: ");
  prime_factors(876512779);
  printf("\n");

  /* 是合数 */
  printf("\nare_coprime\n");
  printf("Are %i and %i coprime? %s\n",
         21, 22, are_coprimes(21, 22) ? "yes" : "no");
  printf("Are %i and %i coprime? %s\n",
         21, 24, are_coprimes(21, 24) ? "yes" : "no");

  /* 哥德巴赫 */
  printf("\ngoldbach\n");
  goldbach(11);    /* error */
  goldbach(4);     /* small one */
  goldbach(6);     /* another */
  for (i = 100; i <= 150; i += 2) goldbach(i);

  return 0;
}
```

*测试程序*

在编译 `tester.c` 文件到可执行文件时，难处理的部分时链接选项的顺序。回想前文中提到两个示例库都是用 `lib` 作为前缀开始，并且每一个都有一个常规的拓展后缀：`.a` 代表静态库 `libprimes.a`，`.so` 代表动态库 `libshprimes.so`。在链接规范中，前缀 `lib` 和拓展名被忽略了。链接标志以 `-l` （小写 L）开始，并且一条编译命令可能包含多个链接标志。下面是一个完整的测试程序的编译指令，使用动态库作为示例：

```
% gcc -o tester tester.c -lshprimes -lm
```

第一个链接标志指定了库 `libshprimes.so`，第二个链接标志指定了标准数学库 `libm.so`。

链接器是懒惰的，这意味着链接标志的顺序是需要考虑的。例如，调整上述实例中的链接顺序将会产生一个编译时错误：

```
% gcc -o tester tester.c -lm -lshprimes ## 危险！
```

链接 `libm.so` 库的标志先出现，但是这个库中没有函数被测试程序显式调用；因此，链接器不会链接到 `math.so` 库。调用 `sqrt` 库函数仅发生在 `libshprimes.so` 库中包含的 `prime_factors` 函数。编译测试程序返回的错误是：

```
primes.c: undefined reference to 'sqrt'
```

因此，链接标志的顺序应该是通知链接器需要 `sqrt` 函数：

```
% gcc -o tester tester.c -lshprimes -lm ## 首先链接 -lshprimes
```

链接器在 `libshprimes.so` 库中发现了对库函数 `sqrt` 的调用，所以接下来对数学库 `libm.so`做了合适的链接。链接还有一个更复杂的选项，它支持链接的标志顺序。然而在本例中，最简单的方式就是恰当地排列链接标志。

下面是运行测试程序的部分输出结果：

```
is_prime
Sample prime ending in 1: 101
Sample prime ending in 1: 401
...
168 primes in range of 1 to a thousand.

prime_factors
prime factors of 12: 2 2 3
prime factors of 13: 13
prime factors of 876,512,779: 211 4154089

are_coprime
Are 21 and 22 coprime? yes
Are 21 and 24 coprime? no

goldbach
Number must be &gt; 2 and even: 11 is not.
4 = 2 + 2
6 = 3 + 3
...
32 =  3 + 29
32 = 13 + 19
...
100 =  3 + 97
100 = 11 + 89
...
```

对于 `goldbach` 函数，即使一个相当小的偶数值（例如 18）也许存在多个一对质数之和的组合（在这种情况下，5+13 和 7+11）。因此这种多个质数对是使得尝试证明哥德巴赫猜想变得复杂的因素之一。

### 封装使用库的 Python 程序

与 C 不同，Python 不是一个静态编译语言，这意味着 Python 客户示例程序必须访问动态版本而非静态版本的 `primes` 库。为了能这样做，Python 中有众多的支持<ruby>外部语言接口<rt>foreign function interface</rt></ruby>（FFI）的模块（标准的或第三方的），它们允许用一种语言编写的程序来调用另一种语言编写的函数。Python 中的 `ctypes` 是一个标准的、相对简单的允许 Python 代码调用 C 函数的 FFI。

任何 FFI 都面临挑战，因为对接的语言不大可能会具有完全相同的数据类型。例如：`primes` 库使用 C 语言类型 `unsigned int`，而 Python 并不具有这种类型；因此 `ctypes` FFI 将 C 语言中的 `unsigned int` 类型映射为 Python 中的 `int` 类型。在 `primes` 库中发布的四个 `extern` C 函数中，有两个在具有显式 `ctypes` 配置的 Python 中会表现得更好。

C 函数 `prime_factors` 和 `goldbach` 返回 `void` 而不是返回一个具体类型，但是 `ctypes` 默认会将 C 语言中的 `void` 替换为 Python 语言中的 `int`。当从 Python 代码中调用时，这两个 C 函数会从栈中返回一个随机整数值（因此，该值无任何意义）。然而，可以对 `ctypes` 进行配置，让这些函数返回 `None` （Python 中为 `null` 类型）。下面是对 `prime_factors` 函数的配置：

```
primes.prime_factors.restype = None
```

可以用类似的语句处理 `goldbach` 函数。

下面的交互示例（在 Python3 中）展示了在 Python 客户程序和 `primes` 库之间的接口是简单明了的。

```
>>> from ctypes import cdll

>>> primes = cdll.LoadLibrary("libshprimes.so") ## 逻辑名

>>> primes.is_prime(13)
1
>>> primes.is_prime(12)
0

>>> primes.are_coprimes(8, 24)
0
>>> primes.are_coprimes(8, 25)
1

>>> primes.prime_factors.restype = None
>>> primes.goldbach.restype = None

>>> primes.prime_factors(72)
2 2 2 3 3

>>> primes.goldbach(32)
32 = 3 + 29
32 = 13 + 19
```

在 `primes` 库中的函数只使用一个简单数据类型：`unsigned int`。如果这个 C 语言库使用复杂的类型如结构体，如果库函数传递和返回指向结构体的指针，那么比 `ctypes` 更强大的 FFI 更适合作为一个在 Python 语言和 C 语言之间的平滑接口。尽管如此，`ctypes` 示例展示了一个 Python 客户程序可以使用 C 语言编写的库。值得注意的是，用作科学计算的流行的 `Numpy` 库是用 C 语言编写的，然后在高级 Python API 中公开。

简单的 `primes` 库和高级的 `Numpy` 库强调了 C 语言仍然是编程语言中的通用语言。几乎每一个语言都可以与 C 语言交互，同时通过 C 语言也可以和任何其他语言交互。Python 很容易和 C 语言交互，作为另外一个例子，当 [Panama 项目](https://openjdk.java.net/projects/panama) 成为 Java Native Interface（JNI）一个替代品后，Java 语言和 C 语言交互也会变的很容易。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/linux-software-libraries

作者：[Marty Kalin][a]
选题：[lujun9972][b]
译者：[萌新阿岩](https://github.com/mengxinayan)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mkalindepauledu
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_linux31x_cc.png?itok=Pvim4U-B (5 pengiuns floating on iceburg)
[2]: https://en.wikipedia.org/wiki/Christian_Goldbach
[3]: https://condor.depaul.edu/mkalin
[4]: http://www.opengroup.org/onlinepubs/009695399/functions/printf.html
[5]: http://www.opengroup.org/onlinepubs/009695399/functions/sqrt.html
[6]: https://openjdk.java.net/projects/panama

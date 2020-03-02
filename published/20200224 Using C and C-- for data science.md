[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11950-1.html)
[#]: subject: (Using C and C++ for data science)
[#]: via: (https://opensource.com/article/20/2/c-data-science)
[#]: author: (Cristiano L. Fontana https://opensource.com/users/cristianofontana)

在数据科学中使用 C 和 C++
======

> 让我们使用 C99 和 C++11 完成常见的数据科学任务。

![metrics and data shown on a computer screen][1]

虽然 [Python][2] 和 [R][3] 之类的语言在数据科学中越来越受欢迎，但是 C 和 C++ 对于高效的数据科学来说是一个不错的选择。在本文中，我们将使用 [C99][4] 和 [C++11][5] 编写一个程序，该程序使用 [Anscombe 的四重奏][6]数据集，下面将对其进行解释。

我在一篇涉及 [Python 和 GNU Octave][7] 的文章中写了我不断学习编程语言的动机，值得大家回顾。这里所有的程序都需要在[命令行][8]上运行，而不是在[图形用户界面（GUI）][9]上运行。完整的示例可在 [polyglot_fit 存储库][10]中找到。

### 编程任务

你将在本系列中编写的程序：

* 从 [CSV 文件][11]中读取数据
* 用直线插值数据（即 `f(x)=m ⋅ x + q`）
* 将结果绘制到图像文件

这是许多数据科学家遇到的普遍情况。示例数据是 [Anscombe 的四重奏][6]的第一组，如下表所示。这是一组人工构建的数据，当拟合直线时可以提供相同的结果，但是它们的曲线非常不同。数据文件是一个文本文件，其中的制表符用作列分隔符，前几行作为标题。该任务将仅使用第一组（即前两列）。

![](https://img.linux.net.cn/data/attachment/album/202002/29/122805h3yrs1dkrgysssxk.png)

### C 语言的方式

[C][12] 语言是通用编程语言，是当今使用最广泛的语言之一（依据 [TIOBE 指数][13]、[RedMonk 编程语言排名][14]、[编程语言流行度指数][15]和 [GitHub Octoverse 状态][16] 得来）。这是一种相当古老的语言（大约诞生在 1973 年），并且用它编写了许多成功的程序（例如 Linux 内核和 Git 仅是其中的两个例子）。它也是最接近计算机内部运行机制的语言之一，因为它直接用于操作内存。它是一种[编译语言][17]；因此，源代码必须由[编译器][18]转换为[机器代码][19]。它的[标准库][20]很小，功能也不多，因此人们开发了其它库来提供缺少的功能。

我最常在[数字运算][21]中使用该语言，主要是因为其性能。我觉得使用起来很繁琐，因为它需要很多[样板代码][22]，但是它在各种环境中都得到了很好的支持。C99 标准是最新版本，增加了一些漂亮的功能，并且得到了编译器的良好支持。

我将一路介绍 C 和 C++ 编程的必要背景，以便初学者和高级用户都可以继续学习。

#### 安装

要使用 C99 进行开发，你需要一个编译器。我通常使用 [Clang][23]，不过 [GCC][24] 是另一个有效的开源编译器。对于线性拟合，我选择使用 [GNU 科学库][25]。对于绘图，我找不到任何明智的库，因此该程序依赖于外部程序：[Gnuplot][26]。该示例还使用动态数据结构来存储数据，该结构在[伯克利软件分发版（BSD）][27]中定义。

在 [Fedora][28] 中安装很容易：

```
sudo dnf install clang gnuplot gsl gsl-devel
```

#### 代码注释

在 C99 中，[注释][29]的格式是在行的开头放置 `//`，行的其它部分将被解释器丢弃。另外，`/*` 和 `*/` 之间的任何内容也将被丢弃。

```
// 这是一个注释，会被解释器忽略
/* 这也被忽略 */
```

#### 必要的库

库由两部分组成：

* [头文件][30]，其中包含函数说明
* 包含函数定义的源文件

头文件包含在源文件中，而库文件的源文件则[链接][31]到可执行文件。因此，此示例所需的头文件是：

```
// 输入/输出功能
#include <stdio.h>
// 标准库
#include <stdlib.h>
// 字符串操作功能
#include <string.h>
// BSD 队列
#include <sys/queue.h>
// GSL 科学功能
#include <gsl/gsl_fit.h>
#include <gsl/gsl_statistics_double.h>
```

#### 主函数

在 C 语言中，程序必须位于称为主函数 [main()][32] 的特殊函数内：

```
int main(void) {
    ...
}
```

这与上一教程中介绍的 Python 不同，后者将运行在源文件中找到的所有代码。

#### 定义变量

在 C 语言中，变量必须在使用前声明，并且必须与类型关联。每当你要使用变量时，都必须决定要在其中存储哪种数据。你也可以指定是否打算将变量用作常量值，这不是必需的，但是编译器可以从此信息中受益。 以下来自存储库中的 [fitting_C99.c 程序][33]：

```
const char *input_file_name = "anscombe.csv";
const char *delimiter = "\t";
const unsigned int skip_header = 3;
const unsigned int column_x = 0;
const unsigned int column_y = 1;
const char *output_file_name = "fit_C99.csv";
const unsigned int N = 100;
```

C 语言中的数组不是动态的，从某种意义上说，数组的长度必须事先确定（即，在编译之前）：

```
int data_array[1024];
```

由于你通常不知道文件中有多少个数据点，因此请使用[单链列表][34]。这是一个动态数据结构，可以无限增长。幸运的是，BSD [提供了链表][35]。这是一个示例定义：

```
struct data_point {
    double x;
    double y;

    SLIST_ENTRY(data_point) entries;
};

SLIST_HEAD(data_list, data_point) head = SLIST_HEAD_INITIALIZER(head);
SLIST_INIT(&head);
```

该示例定义了一个由结构化值组成的 `data_point` 列表，该结构化值同时包含 `x` 值和 `y` 值。语法相当复杂，但是很直观，详细描述它就会太冗长了。

#### 打印输出

要在终端上打印，可以使用 [printf()][36] 函数，其功能类似于 Octave 的 `printf()` 函数（在第一篇文章中介绍）：

```
printf("#### Anscombe's first set with C99 ####\n");
```

`printf()` 函数不会在打印字符串的末尾自动添加换行符，因此你必须添加换行符。第一个参数是一个字符串，可以包含传递给函数的其他参数的格式信息，例如：

```
printf("Slope: %f\n", slope);
```

#### 读取数据

现在来到了困难的部分……有一些用 C 语言解析 CSV 文件的库，但是似乎没有一个库足够稳定或流行到可以放入到 Fedora 软件包存储库中。我没有为本教程添加依赖项，而是决定自己编写此部分。同样，讨论这些细节太啰嗦了，所以我只会解释大致的思路。为了简洁起见，将忽略源代码中的某些行，但是你可以在存储库中找到完整的示例代码。

首先，打开输入文件：

```
FILE* input_file = fopen(input_file_name, "r");
```

然后逐行读取文件，直到出现错误或文件结束：

```
while (!ferror(input_file) && !feof(input_file)) {
    size_t buffer_size = 0;
    char *buffer = NULL;
   
    getline(&buffer, &buffer_size, input_file);

    ...
}
```

[getline()][39] 函数是 [POSIX.1-2008 标准][40]新增的一个不错的函数。它可以读取文件中的整行，并负责分配必要的内存。然后使用 [strtok()][42] 函数将每一行分成<ruby>[字元][41]<rt>token</rt></ruby>。遍历字元，选择所需的列：

```
char *token = strtok(buffer, delimiter);

while (token != NULL)
{
    double value;
    sscanf(token, "%lf", &value);

    if (column == column_x) {
        x = value;
    } else if (column == column_y) {
        y = value;
    }

    column += 1;
    token = strtok(NULL, delimiter);
}
```

最后，当选择了 `x` 和 `y` 值时，将新数据点插入链表中：

```
struct data_point *datum = malloc(sizeof(struct data_point));
datum->x = x;
datum->y = y;

SLIST_INSERT_HEAD(&head, datum, entries);
```

[malloc()][46] 函数为新数据点动态分配（保留）一些持久性内存。

#### 拟合数据

GSL 线性拟合函数 [gsl_fit_linear()][47] 期望其输入为简单数组。因此，由于你将不知道要创建的数组的大小，因此必须手动分配它们的内存：

```
const size_t entries_number = row - skip_header - 1;

double *x = malloc(sizeof(double) * entries_number);
double *y = malloc(sizeof(double) * entries_number);
```

然后，遍历链表以将相关数据保存到数组：

```
SLIST_FOREACH(datum, &head, entries) {
    const double current_x = datum->x;
    const double current_y = datum->y;

    x[i] = current_x;
    y[i] = current_y;

    i += 1;
}
```

现在你已经处理完了链表，请清理它。要**总是**释放已手动分配的内存，以防止[内存泄漏][48]。内存泄漏是糟糕的、糟糕的、糟糕的（重要的话说三遍）。每次内存没有释放时，花园侏儒都会找不到自己的头：

```
while (!SLIST_EMPTY(&head)) {
    struct data_point *datum = SLIST_FIRST(&head);

    SLIST_REMOVE_HEAD(&head, entries);

    free(datum);
}
```

终于，终于！你可以拟合你的数据了：

```
gsl_fit_linear(x, 1, y, 1, entries_number,
               &intercept, &slope,
               &cov00, &cov01, &cov11, &chi_squared);
const double r_value = gsl_stats_correlation(x, 1, y, 1, entries_number);

printf("Slope: %f\n", slope);
printf("Intercept: %f\n", intercept);
printf("Correlation coefficient: %f\n", r_value);
```

#### 绘图

你必须使用外部程序进行绘图。因此，将拟合数据保存到外部文件：

```
const double step_x = ((max_x + 1) - (min_x - 1)) / N;

for (unsigned int i = 0; i < N; i += 1) {
    const double current_x = (min_x - 1) + step_x * i;
    const double current_y = intercept + slope * current_x;

    fprintf(output_file, "%f\t%f\n", current_x, current_y);
}
```

用于绘制两个文件的 Gnuplot 命令是：

```
plot 'fit_C99.csv' using 1:2 with lines title 'Fit', 'anscombe.csv' using 1:2 with points pointtype 7 title 'Data'
```

#### 结果

在运行程序之前，你必须编译它：

```
clang -std=c99 -I/usr/include/ fitting_C99.c -L/usr/lib/ -L/usr/lib64/ -lgsl -lgslcblas -o fitting_C99
```

这个命令告诉编译器使用 C99 标准、读取 `fitting_C99.c` 文件、加载 `gsl` 和 `gslcblas` 库、并将结果保存到 `fitting_C99`。命令行上的结果输出为：

```
#### Anscombe's first set with C99 ####
Slope: 0.500091
Intercept: 3.000091
Correlation coefficient: 0.816421
```

这是用 Gnuplot 生成的结果图像：

![Plot and fit of the dataset obtained with C99][52]

### C++11 方式

[C++][53] 语言是一种通用编程语言，也是当今使用的最受欢迎的语言之一。它是作为 [C 的继承人][54]创建的（诞生于 1983 年），重点是[面向对象程序设计（OOP）][55]。C++ 通常被视为 C 的超集，因此 C 程序应该能够使用 C++ 编译器进行编译。这并非完全正确，因为在某些极端情况下它们的行为有所不同。 根据我的经验，C++ 与 C 相比需要更少的样板代码，但是如果要进行面向对象开发，语法会更困难。C++11 标准是最新版本，增加了一些漂亮的功能，并且基本上得到了编译器的支持。

由于 C++ 在很大程度上与 C 兼容，因此我将仅强调两者之间的区别。我在本部分中没有涵盖的任何部分，则意味着它与 C 中的相同。

#### 安装

这个 C++ 示例的依赖项与 C 示例相同。 在 Fedora 上，运行：

```
sudo dnf install clang gnuplot gsl gsl-devel
```

#### 必要的库

库的工作方式与 C 语言相同，但是 `include` 指令略有不同：

```
#include <cstdlib>
#include <cstring>
#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <algorithm>

extern "C" {
#include <gsl/gsl_fit.h>
#include <gsl/gsl_statistics_double.h>
}
```

由于 GSL 库是用 C 编写的，因此你必须将这个特殊情况告知编译器。

#### 定义变量

与 C 语言相比，C++ 支持更多的数据类型（类），例如，与其 C 语言版本相比，`string` 类型具有更多的功能。相应地更新变量的定义：

```
const std::string input_file_name("anscombe.csv");
```

对于字符串之类的结构化对象，你可以定义变量而无需使用 `=` 符号。

#### 打印输出

你可以使用 `printf()` 函数，但是 `cout` 对象更惯用。使用运算符 `<<` 来指示要使用 `cout` 打印的字符串（或对象）：

```
std::cout << "#### Anscombe's first set with C++11 ####" << std::endl;

...

std::cout << "Slope: " << slope << std::endl;
std::cout << "Intercept: " << intercept << std::endl;
std::cout << "Correlation coefficient: " << r_value << std::endl;
```

#### 读取数据

该方案与以前相同。将打开文件并逐行读取文件，但语法不同：

```
std::ifstream input_file(input_file_name);

while (input_file.good()) {
    std::string line;

    getline(input_file, line);

    ...
}
```

使用与 C99 示例相同的功能提取行字元。代替使用标准的 C 数组，而是使用两个[向量][56]。向量是 [C++ 标准库][57]中对 C 数组的扩展，它允许动态管理内存而无需显式调用 `malloc()`：

```
std::vector<double> x;
std::vector<double> y;

// Adding an element to x and y:
x.emplace_back(value);
y.emplace_back(value);
```

#### 拟合数据

要在 C++ 中拟合，你不必遍历列表，因为向量可以保证具有连续的内存。你可以将向量缓冲区的指针直接传递给拟合函数：

```
gsl_fit_linear(x.data(), 1, y.data(), 1, entries_number,
               &intercept, &slope,
               &cov00, &cov01, &cov11, &chi_squared);
const double r_value = gsl_stats_correlation(x.data(), 1, y.data(), 1, entries_number);

std::cout << "Slope: " << slope << std::endl;
std::cout << "Intercept: " << intercept << std::endl;
std::cout << "Correlation coefficient: " << r_value << std::endl;
```

#### 绘图

使用与以前相同的方法进行绘图。 写入文件：

```
const double step_x = ((max_x + 1) - (min_x - 1)) / N;

for (unsigned int i = 0; i < N; i += 1) {
    const double current_x = (min_x - 1) + step_x * i;
    const double current_y = intercept + slope * current_x;

    output_file << current_x << "\t" << current_y << std::endl;
}

output_file.close();
```

然后使用 Gnuplot 进行绘图。

#### 结果

在运行程序之前，必须使用类似的命令对其进行编译：

```
clang++ -std=c++11 -I/usr/include/ fitting_Cpp11.cpp -L/usr/lib/ -L/usr/lib64/ -lgsl -lgslcblas -o fitting_Cpp11
```

命令行上的结果输出为：

```
#### Anscombe's first set with C++11 ####
Slope: 0.500091
Intercept: 3.00009
Correlation coefficient: 0.816421
```

这就是用 Gnuplot 生成的结果图像：

![Plot and fit of the dataset obtained with C++11][58]

### 结论

本文提供了用 C99 和 C++11 编写的数据拟合和绘图任务的示例。由于 C++ 在很大程度上与 C 兼容，因此本文利用了它们的相似性来编写了第二个示例。在某些方面，C++ 更易于使用，因为它部分减轻了显式管理内存的负担。但是其语法更加复杂，因为它引入了为 OOP 编写类的可能性。但是，仍然可以用 C 使用 OOP 方法编写软件。由于 OOP 是一种编程风格，因此可以在任何语言中使用。在 C 中有一些很好的 OOP 示例，例如 [GObject][59] 和 [Jansson][60]库。

对于数字运算，我更喜欢在 C99 中进行，因为它的语法更简单并且得到了广泛的支持。直到最近，C++11 还没有得到广泛的支持，我倾向于避免使用先前版本中的粗糙不足之处。对于更复杂的软件，C++ 可能是一个不错的选择。

你是否也将 C 或 C++ 用于数据科学？在评论中分享你的经验。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/c-data-science

作者：[Cristiano L. Fontana][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cristianofontana
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_data_dashboard_system_computer_analytics.png?itok=oxAeIEI- (metrics and data shown on a computer screen)
[2]: https://opensource.com/article/18/9/top-3-python-libraries-data-science
[3]: https://opensource.com/article/19/5/learn-python-r-data-science
[4]: https://en.wikipedia.org/wiki/C99
[5]: https://en.wikipedia.org/wiki/C%2B%2B11
[6]: https://en.wikipedia.org/wiki/Anscombe%27s_quartet
[7]: https://linux.cn/article-11943-1.html
[8]: https://en.wikipedia.org/wiki/Command-line_interface
[9]: https://en.wikipedia.org/wiki/Graphical_user_interface
[10]: https://gitlab.com/cristiano.fontana/polyglot_fit
[11]: https://en.wikipedia.org/wiki/Comma-separated_values
[12]: https://en.wikipedia.org/wiki/C_%28programming_language%29
[13]: https://www.tiobe.com/tiobe-index/
[14]: https://redmonk.com/sogrady/2019/07/18/language-rankings-6-19/
[15]: http://pypl.github.io/PYPL.html
[16]: https://octoverse.github.com/
[17]: https://en.wikipedia.org/wiki/Compiled_language
[18]: https://en.wikipedia.org/wiki/Compiler
[19]: https://en.wikipedia.org/wiki/Machine_code
[20]: https://en.wikipedia.org/wiki/C_standard_library
[21]: https://en.wiktionary.org/wiki/number-crunching
[22]: https://en.wikipedia.org/wiki/Boilerplate_code
[23]: https://clang.llvm.org/
[24]: https://gcc.gnu.org/
[25]: https://www.gnu.org/software/gsl/
[26]: http://www.gnuplot.info/
[27]: https://en.wikipedia.org/wiki/Berkeley_Software_Distribution
[28]: https://getfedora.org/
[29]: https://en.wikipedia.org/wiki/Comment_(computer_programming)
[30]: https://en.wikipedia.org/wiki/Include_directive
[31]: https://en.wikipedia.org/wiki/Linker_%28computing%29
[32]: https://en.wikipedia.org/wiki/Entry_point#C_and_C++
[33]: https://gitlab.com/cristiano.fontana/polyglot_fit/-/blob/master/fitting_C99.c
[34]: https://en.wikipedia.org/wiki/Linked_list#Singly_linked_list
[35]: http://man7.org/linux/man-pages/man3/queue.3.html
[36]: https://en.wikipedia.org/wiki/Printf_format_string
[37]: http://www.opengroup.org/onlinepubs/009695399/functions/ferror.html
[38]: http://www.opengroup.org/onlinepubs/009695399/functions/feof.html
[39]: http://man7.org/linux/man-pages/man3/getline.3.html
[40]: https://en.wikipedia.org/wiki/POSIX
[41]: https://en.wikipedia.org/wiki/Lexical_analysis#Token
[42]: http://man7.org/linux/man-pages/man3/strtok.3.html
[43]: http://www.opengroup.org/onlinepubs/009695399/functions/strtok.html
[44]: http://www.opengroup.org/onlinepubs/009695399/functions/sscanf.html
[45]: http://www.opengroup.org/onlinepubs/009695399/functions/malloc.html
[46]: http://man7.org/linux/man-pages/man3/malloc.3.html
[47]: https://www.gnu.org/software/gsl/doc/html/lls.html
[48]: https://en.wikipedia.org/wiki/Memory_leak
[49]: http://www.opengroup.org/onlinepubs/009695399/functions/free.html
[50]: http://www.opengroup.org/onlinepubs/009695399/functions/printf.html
[51]: http://www.opengroup.org/onlinepubs/009695399/functions/fprintf.html
[52]: https://opensource.com/sites/default/files/uploads/fit_c99.png (Plot and fit of the dataset obtained with C99)
[53]: https://en.wikipedia.org/wiki/C%2B%2B
[54]: http://www.cplusplus.com/info/history/
[55]: https://en.wikipedia.org/wiki/Object-oriented_programming
[56]: https://en.wikipedia.org/wiki/Sequence_container_%28C%2B%2B%29#Vector
[57]: https://en.wikipedia.org/wiki/C%2B%2B_Standard_Library
[58]: https://opensource.com/sites/default/files/uploads/fit_cpp11.png (Plot and fit of the dataset obtained with C++11)
[59]: https://en.wikipedia.org/wiki/GObject
[60]: http://www.digip.org/jansson/

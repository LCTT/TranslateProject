D 编程语言是用于开发的绝佳语言的 5 个理由
============================================================

> D 语言的模块化、开发效率、可读性以及其它一些特性使其非常适合用于协同软件的开发。


![Why the D programming language is great for open source development](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/code_development_programming.png?itok=eYK4UXiq "Why the D programming language is great for open source development")

[D 编程语言][8]是一种静态类型的通用编程语言，它具有和 C 语言类似的语法，能够编译为本地代码。许多理由使得它很适合用于开源软件开发，下面讲到的是其中一些理由。

### 模块化能力

在大多数情况下，当你有一个好的想法，你可以完全按照你的内心所想的方式通过代码来实现它。然而，有的时候，你不得让你的想法向代码妥协，而不是通过模块化代码来适应想法。D 语言支持多种[编程范式][9]，包括函数式风格、命令式、面向对象、元编程、并发（演员模式），这些全都和谐共存。你可以选择任何一种方便的编程范式来将你的想法转换为代码。

通过使用[模板][10]，可以生成额外的 D 代码并在编译的过程中把它编排进去，你可以把这些代码描述成编译器生成代码的一种模式。这是一种非常有用的设计算法，无需把它们绑定到任何特定的类型。由于模版的通用性，就很容易生成平台无关的代码。通过将模板与[条件编译][11]结合，跨平台的应用变得更加容易实现，也更容易接受来自使用不同操作系统的开发者的贡献。有了这一点，一个程序员可以通过很少的代码，利用有限的时间实现很多东西。

[range][12] 已经深度集成到了 D 语言中，相对于具体实现，它抽象出容器元素（比如数组、关联数组和链表等）是如何访问的。这个抽象使得可以在许多容器类型中设计和使用大量的算法，而无需绑定到特定的数据结构。D 的[数组切片][13]是 range 的一个实现。最终，你可以用很少的时间写很少的代码，并且只需要很低的维护成本。

### 开发效率

大多数开源软件的代码贡献者都是基于有限的时间志愿工作的。 D 语言能够极大的提高开发效率，因为你可以用更少的时间完成更多的事情。D 的模板和 range 使得程序员在开发通用代码和可复用代码时效率更高，但这些仅仅是 D 开发效率高的其中几个优势。另外一个主要的吸引力是， D 的编译速度看起来感觉就像解释型语言一样，比如 Python、JavaScript、Ruby 和 PHP，它使得 D 能够快速成型。

D 可以很容易的与旧的代码进行对接，减少了移植的需要。它的设计目的是[与 C 代码进行自然地对接][14]，毕竟， C 语言大量用在遗留代码、精心编写而测试过的代码、库以及低级系统调用（特别是 Linux 系统）上。C++ 代码在[ D 中也是可调用的][15]，从而进行更大的扩展。事实上，[Python][16]、[Objective-C][17]、[Lua][18] 和 [Fortran][19] 这些语言在技术层面上都是可以在 D 中使用的，有许多第三方正在努力在把 D 语言推向这些领域。这使得大量的开源库在 D 中均可使用，这符合开源软件开发的惯例。

### 可读性和可维护性

```
import std.stdio; // 导入标准输入/输出模块
void main()
{
    writeln("Hello, World!");
}
```

*D 语言的 Hello, World 演示*

对于熟悉 C 语言的人来说， D 代码很容易理解。另外， D 代码的可读性很强，即使是复杂的代码。这使得很容易发现错误。可读性对于吸引贡献者来说也是很重要的，这是开源软件成长的关键。

在 D 中一个非常简单但很有用的[语法糖][20]是支持使用下滑线分隔数字，这使得数字的可读性更高。这在数学上很有用：

```
int count = 100_000_000;
double price = 20_220.00 + 10.00;
int number = 0x7FFF_FFFF; // 16 进制系统
```

[ddoc][21] 是一个内建的工具，它能够很容易的自动根据代码注释生成文档，而不需要使用额外的工具。文档写作、改进和更新变得更加简单，不具挑战性，因为它伴随代码同时生成。

[Contract][22] 能够检查代码的实现，从而确保 D 代码的行为能够像期望的那样。就像法律契约的签订是为了确保每一方在协议中做自己该做的事情，在 D 语言中的契约式编程，能够确保实现的每一个函数、类等如期望的那样产生预期的结果和行为。这样一个特性对于错误检查非常实用，特别是在开源软件中，当多个人合作一个项目的时候。契约是大项目的救星。D 语言强大的契约式编程特性是内建的，而不是后期添加的。契约不仅使得使用 D 语言更加方便，也减少了正确写作和维护困难的头痛。

### 方便

协同开发是具有挑战性的，因为代码经常发生变化，并且有许多移动部分。D 语言通过支持在本地范围内导入模块，从而缓解了那些问题：

```
// 返回偶数
int[] evenNumbers(int[] numbers)
{
    // "filter" and "array" are only accessible locally
    import std.algorithm: filter; 
    import std.array: array;
    return numbers.filter!(n => n%2 == 0).array;
}
```

*对 filter 使用 `!` 运算符是[模板参数][5]的一个语法*

上面的函数可以在不破坏代码的情况下调用，因为它不依赖任何全局导入模块。像这样实现的函数都可以在后期无需破坏代码的情况下增强，这是协同开发的好东西。

[通用函数调用语法（UFCS）][23]是 D 语言中的一个语法糖，它允许像调用一个对象的成员函数那样调用常规函数。一个函数的定义如下：

```
void cook(string food, int quantity)
{
    import std.stdio: writeln;
    writeln(food, " in quantity of ", quantity);
}
```

它能够以通常的方式调用：

```
string food = "rice";
int quantity = 3;

cook(food, quantity);
```

通过 UFCS，这个函数也可以像下面这样调用，看起来好像 `cook` 是一个成员函数：

```
string food = "rice";
int quantity = 3;

food.cook(quantity);
```

在编译过程中，编译器会自动把 `food` 作为 `cook` 函数的第一个参数。UFCS 使得它能够链起来常规函数，给你的代码产生一种函数风格编程的自然感觉。UFCS 在 D 语言中被大量使用，就像在上面的 `evenNumbers` 函数中使用的 `filter` 和 `array` 函数那样。结合模板、range、条件编译和 UFCS 能够在不牺牲方便性的前提下给予你强大的力量。

`auto` 关键词可以用来代替任何类型。编译器在编译过程中会静态推断类型。这样可以省去输入很长的类型名字，让你感觉写 D 代码就像是在写动态类型语言。

```
// Nope. Do you?
VeryLongTypeHere variable = new VeryLongTypeHere(); 

// 使用 auto 关键词
auto variable =  new VeryLongTypeHere();
auto name = "John Doe";
auto age = 12;
auto letter  = 'e';
auto anArray = [1, 2.0, 3, 0, 1.5]; // type of double[]
auto dictionary = ["one": 1, "two": 2, "three": 3]; // type of int[string]
auto cook(string food) {...} // auto for a function return type
```

D 的[foreach][24] 循环允许遍历各种不同的底层数据类型的集合和 range：

```
foreach(name; ["John", "Yaw", "Paul", "Kofi", "Ama"])
{
    writeln(name);
}

foreach(number; [1, 2, 3, 4, 4, 6]) {...}

foreach(number; 0..10) {...} // 0..10 is the syntax for number range

class Student {...}
Student[] students = [new Student(), new Student()];
foreach(student; students) {...}
```

D 语言中内建的[单元测试][25]不仅免除了使用外部工具的需要，也方便了程序员在自己的代码中执行测试。所有的测试用例都位于可定制的 `unittest{}` 块中：

```
int[] evenNumbers(int[] numbers)
{
    import std.algorithm: filter; 
    import std.array: array;
    return numbers.filter!(n => n%2 == 0).array;
}

unittest
{
    assert( evenNumbers([1, 2, 3, 4]) == [2, 4] );
}
```

使用 D 语言的标准编译器 DMD，你可以通过增加 `-unittest` 编译器标志把所有的测试编译进可执行结果中。

[Dub][26] 是 D 语言的一个内建包管理器和构建工具，使用它可以很容易的添加来自 [Dub package registry][27] 的第三方库。Dub 可以在编译过程中下载、编译和链接这些包，同时也会升级到新版本。

### 选择

除了提供多种编程范例和功能特性外，D 还提供其他的选择。它目前有三个可用的开源编译器。官方编译器 DMD 使用它自己的后端，另外两个编译器 GDC 和 LDC，分别使用 GCC 和 LLVM 后端。DMD 以编译速度块而著称，而 LDC 和 GDC 则以在很短的编译时间内生成快速生成机器代码而著称。你可以自由选择其中一个以适应你的使用情况。

默认情况下，D 语言是采用[垃圾收集][28]的内存分配方式的。你也可以选择手动进行内存管理，如果你想的话，甚至可以进行引用计数。一切选择都是你的。

### 更多

在这个简要的讨论中，还有许多 D 语言好的特性没有涉及到。我强烈推荐阅读 [D 语言的特性概述][29]，这是隐藏在[标准库][30]中的宝藏，以及 [D 语言的使用区域][31]，从而进一步了解人们用它来干什么。许多组织已经[使用 D 语言来进行开发][32]。最后，如果你打算开始学习 D 语言，那么请看这本书 *[D 语言编程][6]*。

（题图：opensource.com）

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/5/d-open-source-software-development

作者：[Lawrence Aberba][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/aberba
[1]:https://opensource.com/tags/python?src=programming_resource_menu
[2]:https://opensource.com/tags/javascript?src=programming_resource_menu
[3]:https://opensource.com/tags/perl?src=programming_resource_menu
[4]:https://developers.redhat.com/?intcmp=7016000000127cYAAQ&amp;amp;amp;amp;src=programming_resource_menu
[5]:http://ddili.org/ders/d.en/templates.html
[6]:http://ddili.org/ders/d.en/index.html
[7]:https://opensource.com/article/17/5/d-open-source-software-development?rate=2NrC12X6cAUXB18h8bLBYUkDmF2GR1nuiAdeMCFCvh8
[8]:https://dlang.org/
[9]:https://en.wikipedia.org/wiki/Programming_paradigm
[10]:http://ddili.org/ders/d.en/templates.html
[11]:https://dlang.org/spec/version.html
[12]:http://ddili.org/ders/d.en/ranges.html
[13]:https://dlang.org/spec/arrays.html#slicing
[14]:https://dlang.org/spec/interfaceToC.html
[15]:https://dlang.org/spec/cpp_interface.html
[16]:https://code.dlang.org/packages/pyd
[17]:https://dlang.org/spec/objc_interface.html
[18]:http://beza1e1.tuxen.de/into_luad.html
[19]:http://www.active-analytics.com/blog/interface-d-with-c-fortran/
[20]:https://en.wikipedia.org/wiki/Syntactic_sugar
[21]:https://dlang.org/spec/ddoc.html
[22]:http://ddili.org/ders/d.en/contracts.html
[23]:http://ddili.org/ders/d.en/ufcs.html
[24]:http://ddili.org/ders/d.en/foreach.html
[25]:https://dlang.org/spec/unittest.html
[26]:http://code.dlang.org/getting_started
[27]:https://code.dlang.org/
[28]:https://dlang.org/spec/garbage.html
[29]:https://dlang.org/comparison.html
[30]:https://dlang.org/phobos/index.html
[31]:https://dlang.org/areas-of-d-usage.html
[32]:https://dlang.org/orgs-using-d.html
[33]:https://opensource.com/user/129491/feed
[34]:https://opensource.com/users/aberba

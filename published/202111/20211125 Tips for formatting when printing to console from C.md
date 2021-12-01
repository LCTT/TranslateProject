[#]: subject: "Tips for formatting when printing to console from C++"
[#]: via: "https://opensource.com/article/21/11/c-stdcout-cheat-sheet"
[#]: author: "Stephan Avenwedde https://opensource.com/users/hansic99"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14027-1.html"

C++ 控制台格式化打印技巧
======

> 下次当你为控制台输出的格式而苦恼时，请参考这篇文章及其速查表。

![](https://img.linux.net.cn/data/attachment/album/202111/28/100548utbax4o4ttwcgyjz.jpg)

我写文章主要是为了给自己写文档。我在编程时非常健忘，所以我经常会写下有用的代码片段、特殊的特性，以及我使用的编程语言中的常见错误。这篇文章完全切合我最初的想法，因为它涵盖了从 C++ 控制台格式化打印时的常见用例。

像往常一样，这篇文章带有大量的例子。除非另有说明，代码片段中显示的所有类型和类都是 `std` 命名空间的一部分。所以当你阅读这段代码时，你必须在类型和类的前面加上`using namespace std;`。当然，该示例代码也可以在 [GitHub][3] 上找到。

### 面向对象的流

如果你曾经用过 C++ 编程，你肯定使用过 [cout][4]。当你包含 `<iostream>` 时，[ostream][5] 类型的 `cout` 对象就进入了作用域。这篇文章的重点是 `cout`，它可以让你打印到控制台，但这里描述的一般格式化对所有 [ostream][5] 类型的流对象都有效。`ostream` 对象是 `basic_ostream` 的一个实例，其模板参数为 `char` 类型。头文件 `<iosfwd>` 是 `<iostream>` 的包含层次结构的一部分，包含了常见类型的前向声明。

类 `basic_ostream` 继承于 `basic_ios`，该类型又继承于 `ios_base`。在 [cppreference.com][6] 上你可以找到一个显示不同类之间关系的类图。

`ios_base` 类是所有 I/O 流类的基类。`basic_ios` 类是一个模板类，它对常见的字符类型进行了<ruby>模板特化<rt>specialization</rt></ruby>，称为 `ios`。因此，当你在标准 I/O 的上下文中读到 `ios` 时，它是 `basic_ios` 的 `char` 类型的模板特化。

### 格式化流

一般来说，基于 `ostream` 的流有三种格式化的方法。

  1. 使用 `ios_base` 提供的格式标志。
  2. 在头文件 `<omanip>` 和 `<ios>` 中定义的流修改函数。
  3. 通过调用 `<<` 操作符的 [特定重载][7]。

所有这些方法都有其优点和缺点，通常取决于使用哪种方法的情况。下面显示的例子混合使用所有这些方法。

#### 右对齐

默认情况下，`cout` 占用的空间与要打印的数据所需的空间一样大。为了使这种右对齐的输出生效，你必须定义一个行允许占用的最大宽度。我使用格式标志来达到这个目的。

右对齐输出的标志和宽度调整只适用于其后的行。

```
cout.setf(ios::right, ios::adjustfield);
cout.width(50);
cout << "This text is right justified" << endl;
cout << "This text is left justified again" << endl;
```

在上面的代码中，我使用 `setf` 配置了右对齐的输出。我建议你将位掩码 `ios::adjustfield` 应用于 `setf`，这将使位掩码指定的所有标志在实际的 `ios::right` 标志被设置之前被重置，以防止发生组合碰撞。

#### 填充空白

当使用右对齐输出时，默认情况下，空的地方会用空白字符填充。你可以通过使用 `setfill` 指定填充字符来改变它：

```
cout << right << setfill('.') << setw(30) << 500 << " pcs" << endl;
cout << right << setfill('.') << setw(30) << 3000 << " pcs" << endl;
cout << right << setfill('.') << setw(30) << 24500 << " pcs" << endl;
```

代码输出如下：

```
...........................500 pcs
..........................3000 pcs
.........................24500 pcs
```

#### 组合 

想象一下，你的 C++ 程序记录了你的储藏室库存。不时地，你想打印一份当前库存的清单。要做到这一点，你可以使用以下格式。

下面的代码是左对齐和右对齐输出的组合，使用点作为填充字符，可以得到一个漂亮的列表：

```
cout << left << setfill('.') << setw(20) << "Flour" << right << setfill('.') << setw(20) << 0.7 << " kg" << endl;
cout << left << setfill('.') << setw(20) << "Honey" << right << setfill('.') << setw(20) << 2 << " Glasses" << endl;
cout << left << setfill('.') << setw(20) << "Noodles" << right << setfill('.') << setw(20) << 800 << " g" << endl;
cout << left << setfill('.') << setw(20) << "Beer" << right << setfill('.') << setw(20) << 20 << " Bottles" << endl;
```

输出：

```
Flour...............................0.70 kg
Honey..................................2 Glasses
Noodles..............................800 g
Beer..................................20 Bottles
```

### 打印数值

当然，基于流的输出也能让你输出各种变量类型。

#### 布尔型

`boolalpha` 开关可以让你把布尔型的二进制解释转换为字符串：

```
Flour...............................0.70 kg
Honey..................................2 Glasses
Noodles..............................800 g
Beer..................................20 Bottles
```

以上几行产生的输出结果如下：

```
Boolean output without using boolalpha: 1 / 0
Boolean output using boolalpha: true / false
```

#### 地址

如果一个整数的值应该被看作是一个地址，那么只需要把它投到 `void*` 就可以了，以便调用正确的重载。下面是一个例子：

```
cout << "Boolean output without using boolalpha: " << true << " / " << false << endl;
cout << "Boolean output using boolalpha: " << boolalpha << true << " / " << false << endl;
```

该代码产生了以下输出：

```
Treat as unsigned long: 43981
Treat as address: 0000ABCD
```

该代码打印出了具有正确长度的地址。一个 32 位的可执行文件产生了上述输出。

#### 整数

打印整数是很简单的。为了演示，我使用 `setf` 和 `setiosflags` 来指定数字的基数。应用流修改器 `hex`/`oct` 也有同样的效果。

```
int myInt = 123;

cout << "Decimal: " << myInt << endl;

cout.setf(ios::hex, ios::basefield);
cout << "Hexadecimal: " << myInt << endl;

cout << "Octal: " << resetiosflags(ios::basefield) <<  setiosflags(ios::oct) << myInt << endl;
```

**注意：** 默认情况下，没有指示所使用的基数，但你可以使用 `showbase` 添加一个。

```
Decimal: 123
Hexadecimal: 7b
Octal: 173
```

#### 用零填充

```
0000003
0000035
0000357
0003579
```

你可以通过指定宽度和填充字符得到类似上述的输出：

```
cout << setfill('0') << setw(7) << 3 << endl;
cout << setfill('0') << setw(7) << 35 << endl;
cout << setfill('0') << setw(7) << 357 << endl;
cout << setfill('0') << setw(7) << 3579 << endl;
```

#### 浮点值

如果我想打印浮点数值，我可以选择“固定”和“科学”格式。此外，我还可以指定精度：

```
double myFloat = 1234.123456789012345;
int defaultPrecision = cout.precision(); // == 2

cout << "Default precision: " << myFloat << endl;
cout.precision(4);
cout << "Modified precision: " << myFloat << endl;
cout.setf(ios::scientific, ios::floatfield);
cout << "Modified precision & scientific format: " << myFloat << endl;
/* back to default */
cout.precision(defaultPrecision);
cout.setf(ios::fixed, ios::floatfield);
cout << "Default precision & fixed format:  " << myFloat << endl;
```

上面的代码产生以下输出：

```
Default precision: 1234.12
Modified precision: 1234.1235
Modified precision & scientific format: 1.2341e+03
Default precision & fixed format:  1234.12
```

#### 时间和金钱

通过 `put_money`，你可以用正确的、与当地有关的格式来打印货币单位。这需要你的控制台能够输出 UTF-8 字符集。请注意，变量 `specialOffering` 以美分为单位存储货币价值。

```
long double specialOffering = 9995;

cout.imbue(locale("en_US.UTF-8"));
cout << showbase << put_money(specialOffering) << endl;
cout.imbue(locale("de_DE.UTF-8"));
cout << showbase << put_money(specialOffering) << endl;
cout.imbue(locale("ru_RU.UTF-8"));
cout  << showbase << put_money(specialOffering) << endl;
```

`ios` 的 `imbue` 方法让你指定一个地区。通过命令 `locale -a`，你可以得到你系统中所有可用的地区标识符的列表。 

```
$99.95
99,950€
99,950₽
```

（不知道出于什么原因，在我的系统上，它打印的欧元和卢布有三个小数位，对我来说看起来很奇怪，但这也许是官方的格式。）

同样的原则也适用于时间输出。函数 `put_time` 可以让你以相应的地区格式打印时间。此外，你可以指定时间对象的哪些部分被打印出来。

```
time_t now = time(nullptr);
tm localtm = *localtime(&now);


cout.imbue(locale("en_US.UTF-8"));
cout << "en_US : " << put_time(&localtm, "%c") << endl;
cout.imbue(locale("de_DE.UTF-8"));
cout << "de_DE : " << put_time(&localtm, "%c") << endl;
cout.imbue(locale("ru_RU.UTF-8"));
cout << "ru_RU : " << put_time(&localtm, "%c") << endl;
```

格式指定符 `%c` 会打印一个标准的日期和时间字符串：

```
en_US : Tue 02 Nov 2021 07:36:36 AM CET
de_DE : Di 02 Nov 2021 07:36:36 CET
ru_RU : Вт 02 ноя 2021 07:36:36
```

### 创建自定义的流修改器

你也可以创建你自己的流。下面的代码在应用于 `ostream` 对象时插入了一个预定义的字符串：

```
ostream& myManipulator(ostream& os) {
    string myStr = ">>>Here I am<<<";
    os << myStr;
    return os;
}
```

**另一个例子：** 如果你有重要的事情要说，就像互联网上的大多数人一样，你可以使用下面的代码在你的信息后面根据重要程度插入感叹号。重要程度被作为一个参数传递：

```
struct T_Importance {
     int levelOfSignificance;
};

T_Importance importance(int lvl){
    T_Importance x = {.levelOfSignificance = lvl };
    return x;
}

ostream& operator<<(ostream& __os, T_Importance t){

    for(int i = 0; i < t.levelOfSignificance; ++i){
        __os.put('!');
    }
    return __os;
}
```

这两个修饰符现在都可以简单地传递给 `cout`：

```
cout << "My custom manipulator: " << myManipulator << endl;

cout << "I have something important to say" << importance(5) << endl;
```

产生以下输出：

```
My custom manipulator: >>>Here I am<<<

I have something important to say!!!!!
```

### 结语

下次你再纠结于控制台输出格式时，我希望你记得这篇文章及其 [速查表][2]。

在 C++ 应用程序中，`cout` 是 [printf][8] 的新邻居。虽然使用 `printf` 仍然有效，但我可能总是喜欢使用 `cout`。特别是与定义在 `<ios>` 中的修改函数相结合，会产生漂亮的、可读的代码。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/c-stdcout-cheat-sheet

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hansic99
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_women_computing_2.png?itok=JPlR5aCA (Woman sitting in front of her computer)
[2]: https://opensource.com/downloads/cout-cheat-sheet
[3]: https://github.com/hANSIc99/cpp_output_formatting
[4]: https://en.cppreference.com/w/cpp/io/cout
[5]: https://en.cppreference.com/w/cpp/io/basic_ostream
[6]: https://en.cppreference.com/w/cpp/io
[7]: https://en.cppreference.com/w/cpp/io/basic_ostream/operator_ltlt
[8]: https://opensource.com/article/20/8/printf

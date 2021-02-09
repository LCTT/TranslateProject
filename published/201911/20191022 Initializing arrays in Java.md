[#]: collector: (lujun9972)
[#]: translator: (laingke)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11533-1.html)
[#]: subject: (Initializing arrays in Java)
[#]: via: (https://opensource.com/article/19/10/initializing-arrays-java)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansen)

Java 中初始化数组
======

> 数组是一种有用的数据类型，用于管理在连续内存位置中建模最好的集合元素。下面是如何有效地使用它们。

![Coffee beans and a cup of coffee][1]

有使用 C 或者 FORTRAN 语言编程经验的人会对数组的概念很熟悉。它们基本上是一个连续的内存块，其中每个位置都是某种数据类型：整型、浮点型或者诸如此类的数据类型。

Java 的情况与此类似，但是有一些额外的问题。

### 一个数组的示例

让我们在 Java 中创建一个长度为 10 的整型数组：

```
int[] ia = new int[10];
```

上面的代码片段会发生什么？从左到右依次是：

  1. 最左边的 `int[]` 将变量的*类型*声明为 `int` 数组（由 `[]` 表示）。
  2. 它的右边是变量的名称，当前为 `ia`。
  3. 接下来，`=` 告诉我们，左侧定义的变量赋值为右侧的内容。
  4. 在 `=` 的右侧，我们看到了 `new`，它在 Java 中表示一个对象正在*被初始化中*，这意味着已为其分配存储空间并调用了其构造函数（[请参见此处以获取更多信息][2]）。
  5. 然后，我们看到 `int[10]`，它告诉我们正在初始化的这个对象是包含 10 个整型的数组。

因为 Java 是强类型的，所以变量 `ia` 的类型必须跟 `=` 右侧表达式的类型兼容。

### 初始化示例数组

让我们把这个简单的数组放在一段代码中，并尝试运行一下。将以下内容保存到一个名为 `Test1.java` 的文件中，使用 `javac` 编译，使用 `java` 运行（当然是在终端中）：

```
import java.lang.*;

public class Test1 {

    public static void main(String[] args) {
        int[] ia = new int[10];                              // 见下文注 1
        System.out.println("ia is " + ia.getClass());        // 见下文注 2
        for (int i = 0; i < ia.length; i++)                  // 见下文注 3
            System.out.println("ia[" + i + "] = " + ia[i]);  // 见下文注 4
    }

}
```

让我们来看看最重要的部分。

  1. 我们声明和初始化了长度为 10 的整型数组，即 `ia`，这显而易见。
  2. 在下面的行中，我们看到表达式 `ia.getClass()`。没错，`ia` 是属于一个*类*的*对象*，这行代码将告诉我们是哪个类。
  3. 在紧接的下一行中，我们看到了一个循环 `for (int i = 0; i < ia.length; i++)`，它定义了一个循环索引变量 `i`，该变量遍历了从 0 到比 `ia.length` 小 1 的序列，这个表达式告诉我们在数组 `ia` 中定义了多少个元素。
  4. 接下来，循环体打印出 `ia` 的每个元素的值。

当这个程序编译和运行时，它产生以下结果：

```
me@mydesktop:~/Java$ javac Test1.java
me@mydesktop:~/Java$ java Test1
ia is class [I
ia[0] = 0
ia[1] = 0
ia[2] = 0
ia[3] = 0
ia[4] = 0
ia[5] = 0
ia[6] = 0
ia[7] = 0
ia[8] = 0
ia[9] = 0
me@mydesktop:~/Java$
```

`ia.getClass()` 的输出的字符串表示形式是 `[I`，它是“整数数组”的简写。与 C 语言类似，Java 数组以第 0 个元素开始，扩展到第 `<数组大小> - 1` 个元素。如上所见，我们可以看到数组 `ia` 的每个元素都（似乎由数组构造函数）设置为零。

所以，就这些吗？声明类型，使用适当的初始化器，就完成了吗?

好吧，并没有。在 Java 中有许多其它方法来初始化数组。

### 为什么我要初始化一个数组，有其它方式吗？

像所有好的问题一样，这个问题的答案是“视情况而定”。在这种情况下，答案取决于初始化后我们希望对数组做什么。

在某些情况下，数组自然会作为一种累加器出现。例如，假设我们正在编程实现计算小型办公室中一组电话分机接收和拨打的电话数量。一共有 8 个分机，编号为 1 到 8，加上话务员的分机，编号为 0。 因此，我们可以声明两个数组：

```
int[] callsMade;
int[] callsReceived;
```

然后，每当我们开始一个新的累计呼叫统计数据的周期时，我们就将每个数组初始化为：

```
callsMade = new int[9];
callsReceived = new int[9];
```

在每个累计通话统计数据的最后阶段，我们可以打印出统计数据。粗略地说，我们可能会看到：

```
import java.lang.*;
import java.io.*;

public class Test2 {

    public static void main(String[] args) {

        int[] callsMade;
        int[] callsReceived;

        // 初始化呼叫计数器

        callsMade = new int[9];
        callsReceived = new int[9];

        // 处理呼叫……
        //   分机拨打电话：callsMade[ext]++
        //   分机接听电话：callsReceived[ext]++

        // 汇总通话统计

        System.out.printf("%3s%25s%25s\n", "ext", " calls made",
                "calls received");
        for (int ext = 0; ext < callsMade.length; ext++) {
            System.out.printf("%3d%25d%25d\n", ext,
                    callsMade[ext], callsReceived[ext]);
        }

    }

}
```

这会产生这样的输出：

```
me@mydesktop:~/Java$ javac Test2.java
me@mydesktop:~/Java$ java Test2
ext               calls made           calls received
  0                        0                        0
  1                        0                        0
  2                        0                        0
  3                        0                        0
  4                        0                        0
  5                        0                        0
  6                        0                        0
  7                        0                        0
  8                        0                        0
me@mydesktop:~/Java$
```

看来这一天呼叫中心不是很忙。

在上面的累加器示例中，我们看到由数组初始化程序设置的零起始值可以满足我们的需求。但是在其它情况下，这个起始值可能不是正确的选择。

例如，在某些几何计算中，我们可能需要将二维数组初始化为单位矩阵（除沿主对角线———左上角到右下角——以外所有全是零）。我们可以选择这样做：


```
double[][] m = new double[3][3];
for (int d = 0; d < 3; d++) {
    m[d][d] = 1.0;
}
```

在这种情况下，我们依靠数组初始化器 `new double[3][3]` 将数组设置为零，然后使用循环将主对角线上的元素设置为 1。在这种简单情况下，我们可以使用 Java 提供的快捷方式：

```
double[][] m = {
        {1.0, 0.0, 0.0},
        {0.0, 1.0, 0.0},
        {0.0, 0.0, 1.0}};
```

这种可视结构特别适用于这种应用程序，在这种应用程序中，它便于复查数组的实际布局。但是在这种情况下，行数和列数只在运行时确定时，我们可能会看到这样的东西:

```
int nrc;
// 一些代码确定行数和列数 = nrc
double[][] m = new double[nrc][nrc];
for (int d = 0; d < nrc; d++) {
    m[d][d] = 1.0;
}
```

值得一提的是，Java 中的二维数组实际上是数组的数组，没有什么能阻止无畏的程序员让这些第二层数组中的每个数组的长度都不同。也就是说，下面这样的事情是完全合法的：

```
int [][] differentLengthRows = {
     {1, 2, 3, 4, 5},
     {6, 7, 8, 9},
     {10, 11, 12},
     {13, 14},
     {15}};
```

在涉及不规则形状矩阵的各种线性代数应用中，可以应用这种类型的结构（有关更多信息，请参见[此 Wikipedia 文章][5]）。除此之外，既然我们了解到二维数组实际上是数组的数组，那么以下内容也就不足为奇了：

```
differentLengthRows.length
```

可以告诉我们二维数组 `differentLengthRows` 的行数，并且：

```
differentLengthRows[i].length
```

告诉我们 `differentLengthRows` 第 `i` 行的列数。

### 深入理解数组

考虑到在运行时确定数组大小的想法，我们看到数组在实例化之前仍需要我们知道该大小。但是，如果在处理完所有数据之前我们不知道大小怎么办？这是否意味着我们必须先处理一次以找出数组的大小，然后再次处理？这可能很难做到，尤其是如果我们只有一次机会使用数据时。

[Java 集合框架][6]很好地解决了这个问题。提供的其中一项是 `ArrayList` 类，它类似于数组，但可以动态扩展。为了演示 `ArrayList` 的工作原理，让我们创建一个 `ArrayList` 对象并将其初始化为前 20 个[斐波那契数字][7]：

```
import java.lang.*;
import java.util.*;

public class Test3 {

    public static void main(String[] args) {

        ArrayList<Integer> fibos = new ArrayList<Integer>();

        fibos.add(0);
        fibos.add(1);
        for (int i = 2; i < 20; i++) {
            fibos.add(fibos.get(i - 1) + fibos.get(i - 2));
        }

        for (int i = 0; i < fibos.size(); i++) {
            System.out.println("fibonacci " + i + " = " + fibos.get(i));
        }

    }
}
```

上面的代码中，我们看到：

  * 用于存储多个 `Integer` 的 `ArrayList` 的声明和实例化。
  * 使用 `add()` 附加到 `ArrayList` 实例。
  * 使用 `get()` 通过索引号检索元素。
  * 使用 `size()` 来确定 `ArrayList` 实例中已经有多少个元素。

这里没有展示 `put()` 方法，它的作用是将一个值放在给定的索引号上。

该程序的输出为：

```
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci 2 = 1
fibonacci 3 = 2
fibonacci 4 = 3
fibonacci 5 = 5
fibonacci 6 = 8
fibonacci 7 = 13
fibonacci 8 = 21
fibonacci 9 = 34
fibonacci 10 = 55
fibonacci 11 = 89
fibonacci 12 = 144
fibonacci 13 = 233
fibonacci 14 = 377
fibonacci 15 = 610
fibonacci 16 = 987
fibonacci 17 = 1597
fibonacci 18 = 2584
fibonacci 19 = 4181
```

`ArrayList` 实例也可以通过其它方式初始化。例如，可以给 `ArrayList` 构造器提供一个数组，或者在编译过程中知道初始元素时也可以使用 `List.of()` 和 `array.aslist()` 方法。我发现自己并不经常使用这些方式，因为我对 `ArrayList` 的主要用途是当我只想读取一次数据时。

此外，对于那些喜欢在加载数据后使用数组的人，可以使用 `ArrayList` 的 `toArray()` 方法将其实例转换为数组；或者，在初始化 `ArrayList` 实例之后，返回到当前数组本身。

Java 集合框架提供了另一种类似数组的数据结构，称为 `Map`（映射）。我所说的“类似数组”是指 `Map` 定义了一个对象集合，它的值可以通过一个键来设置或检索，但与数组（或 `ArrayList`）不同，这个键不需要是整型数；它可以是 `String` 或任何其它复杂对象。

例如，我们可以创建一个 `Map`，其键为 `String`，其值为 `Integer` 类型，如下：

```
Map<String, Integer> stoi = new Map<String, Integer>();
```

然后我们可以对这个 `Map` 进行如下初始化：

```
stoi.set("one",1);
stoi.set("two",2);
stoi.set("three",3);
```

等类似操作。稍后，当我们想要知道 `"three"` 的数值时，我们可以通过下面的方式将其检索出来：

```
stoi.get("three");
```

在我的认知中，`Map` 对于将第三方数据集中出现的字符串转换为我的数据集中的一致代码值非常有用。作为[数据转换管道][8]的一部分，我经常会构建一个小型的独立程序，用作在处理数据之前清理数据；为此，我几乎总是会使用一个或多个 `Map`。

值得一提的是，`ArrayList` 的 `ArrayList` 和 `Map` 的 `Map` 是很可能的，有时也是合理的。例如，假设我们在看树，我们对按树种和年龄范围累计树的数目感兴趣。假设年龄范围定义是一组字符串值（“young”、“mid”、“mature” 和 “old”），物种是 “Douglas fir”、“western red cedar” 等字符串值，那么我们可以将这个 `Map` 中的 `Map` 定义为：

```
Map<String, Map<String, Integer>> counter = new Map<String, Map<String, Integer>>();
```

这里需要注意的一件事是，以上内容仅为 `Map` 的*行*创建存储。因此，我们的累加代码可能类似于：

```
// 假设我们已经知道了物种和年龄范围
if (!counter.containsKey(species)) {
    counter.put(species,new Map<String, Integer>());
}
if (!counter.get(species).containsKey(ageRange)) {
    counter.get(species).put(ageRange,0);
}
```

此时，我们可以这样开始累加：

```
counter.get(species).put(ageRange, counter.get(species).get(ageRange) + 1);
```

最后，值得一提的是（Java 8 中的新特性）Streams 还可以用来初始化数组、`ArrayList` 实例和 `Map` 实例。关于此特性的详细讨论可以在[此处][9]和[此处][10]中找到。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/initializing-arrays-java

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[laingke](https://github.com/laingke)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/java-coffee-mug.jpg?itok=Bj6rQo8r (Coffee beans and a cup of coffee)
[2]: https://opensource.com/article/19/8/what-object-java
[3]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[4]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
[5]: https://en.wikipedia.org/wiki/Irregular_matrix
[6]: https://en.wikipedia.org/wiki/Java_collections_framework
[7]: https://en.wikipedia.org/wiki/Fibonacci_number
[8]: https://towardsdatascience.com/data-science-for-startups-data-pipelines-786f6746a59a
[9]: https://stackoverflow.com/questions/36885371/lambda-expression-to-initialize-array
[10]: https://stackoverflow.com/questions/32868665/how-to-initialize-a-map-using-a-lambda

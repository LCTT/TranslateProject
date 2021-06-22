[#]: collector: (lujun9972)
[#]: translator: (laingke)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11857-1.html)
[#]: subject: (Data streaming and functional programming in Java)
[#]: via: (https://opensource.com/article/20/1/javastream)
[#]: author: (Marty Kalin https://opensource.com/users/mkalindepauledu)

Java 中的数据流和函数式编程
======

> 学习如何使用 Java 8 中的流 API 和函数式编程结构。

![](https://img.linux.net.cn/data/attachment/album/202002/06/002505flazlb4cg4aavvb4.jpg)

当 Java SE 8（又名核心 Java 8）在 2014 年被推出时，它引入了一些更改，从根本上影响了用它进行的编程。这些更改中有两个紧密相连的部分：流 API 和函数式编程构造。本文使用代码示例，从基础到高级特性，介绍每个部分并说明它们之间的相互作用。

### 基础特性

流 API 是在数据序列中迭代元素的简洁而高级的方法。包 `java.util.stream` 和 `java.util.function` 包含了用于流 API 和相关函数式编程构造的新库。当然，代码示例胜过千言万语。

下面的代码段用大约 2,000 个随机整数值填充了一个 `List`：

```
Random rand = new Random2();
List<Integer> list = new ArrayList<Integer>();           // 空 list
for (int i = 0; i < 2048; i++) list.add(rand.nextInt()); // 填充它
```

另外用一个 `for` 循环可用于遍历填充列表，以将偶数值收集到另一个列表中。

流 API 提供了一种更简洁的方法来执行此操作：

```
List <Integer> evens = list
    .stream()                      // 流化 list
    .filter(n -> (n & 0x1) == 0)   // 过滤出奇数值
    .collect(Collectors.toList()); // 收集偶数值
```

这个例子有三个来自流 API 的函数：

- `stream` 函数可以将**集合**转换为流，而流是一个每次可访问一个值的传送带。流化是惰性的（因此也是高效的），因为值是根据需要产生的，而不是一次性产生的。
- `filter` 函数确定哪些流的值（如果有的话）通过了处理管道中的下一个阶段，即 `collect` 阶段。`filter` 函数是 <ruby>高阶的<rt>higher-order</rt></ruby>，因为它的参数是一个函数 —— 在这个例子中是一个 lambda 表达式，它是一个未命名的函数，并且是 Java 新的函数式编程结构的核心。

lambda 语法与传统的 Java 完全不同：

```
n -> (n & 0x1) == 0
```

箭头（一个减号后面紧跟着一个大于号）将左边的参数列表与右边的函数体分隔开。参数 `n` 虽未明确类型，但也可以明确。在任何情况下，编译器都会发现 `n` 是个 `Integer`。如果有多个参数，这些参数将被括在括号中，并用逗号分隔。

在本例中，函数体检查一个整数的最低位（最右）是否为零，这用来表示偶数。过滤器应返回一个布尔值。尽管可以，但该函数的主体中没有显式的 `return`。如果主体没有显式的 `return`，则主体的最后一个表达式即是返回值。在这个例子中，主体按照 lambda 编程的思想编写，由一个简单的布尔表达式 `(n & 0x1) == 0` 组成。

- `collect` 函数将偶数值收集到引用为 `evens` 的列表中。如下例所示，`collect` 函数是线程安全的，因此，即使在多个线程之间共享了过滤操作，该函数也可以正常工作。

### 方便的功能和轻松实现多线程

在生产环境中，数据流的源可能是文件或网络连接。为了学习流 API, Java 提供了诸如 `IntStream` 这样的类型，它可以用各种类型的元素生成流。这里有一个 `IntStream` 的例子：

```
IntStream                          // 整型流
    .range(1, 2048)                // 生成此范围内的整型流
    .parallel()                    // 为多个线程分区数据
    .filter(i -> ((i & 0x1) > 0))  // 奇偶校验 - 只允许奇数通过
    .forEach(System.out::println); // 打印每个值
```

`IntStream` 类型包括一个 `range` 函数，该函数在指定的范围内生成一个整数值流，在本例中，以 1 为增量，从 1 递增到 2048。`parallel` 函数自动划分该工作到多个线程中，在各个线程中进行过滤和打印。（线程数通常与主机系统上的 CPU 数量匹配。）函数 `forEach` 参数是一个*方法引用*，在本例中是对封装在 `System.out` 中的 `println` 方法的引用，方法输出类型为 `PrintStream`。方法和构造器引用的语法将在稍后讨论。

由于具有多线程，因此整数值整体上以任意顺序打印，但在给定线程中是按顺序打印的。例如，如果线程 T1 打印 409 和 411，那么 T1 将按照顺序 409-411 打印，但是其它某个线程可能会预先打印 2045。`parallel` 调用后面的线程是并发执行的，因此它们的输出顺序是不确定的。

### map/reduce 模式

*map/reduce* 模式在处理大型数据集方面变得很流行。一个 map/reduce 宏操作由两个微操作构成。首先，将数据分散（<ruby>映射<rt>mapped</rt></ruby>）到各个工作程序中，然后将单独的结果收集在一起 —— 也可能收集统计起来成为一个值，即<ruby>归约<rt>reduction</rt></ruby>。归约可以采用不同的形式，如以下示例所示。

下面 `Number` 类的实例用 `EVEN` 或 `ODD` 表示有奇偶校验的整数值：

```
public class Number {
    enum Parity { EVEN, ODD }
    private int value;
    public Number(int n) { setValue(n); }
    public void setValue(int value) { this.value = value; }
    public int getValue() { return this.value; }
    public Parity getParity() {
        return ((value & 0x1) == 0) ? Parity.EVEN : Parity.ODD;
    }
    public void dump() {
        System.out.format("Value: %2d (parity: %s)\n", getValue(),
                          (getParity() == Parity.ODD ? "odd" : "even"));
    }
}
```

下面的代码演示了用 `Number` 流进行 map/reduce 的情形，从而表明流 API 不仅可以处理 `int` 和 `float` 等基本类型，还可以处理程序员自定义的类类型。

在下面的代码段中，使用了 `parallelStream` 而不是 `stream` 函数对随机整数值列表进行流化处理。与前面介绍的 `parallel` 函数一样，`parallelStream` 变体也可以自动执行多线程。

```
final int howMany = 200;
Random r = new Random();
Number[] nums = new Number[howMany];
for (int i = 0; i < howMany; i++) nums[i] = new Number(r.nextInt(100));
List<Number> listOfNums = Arrays.asList(nums);  // 将数组转化为 list

Integer sum4All = listOfNums
    .parallelStream()           // 自动执行多线程
    .mapToInt(Number::getValue) // 使用方法引用，而不是 lambda
    .sum();                     // 将流值计算出和值
System.out.println("The sum of the randomly generated values is: " + sum4All);
```

高阶的 `mapToInt` 函数可以接受一个 lambda 作为参数，但在本例中，它接受一个方法引用，即 `Number::getValue`。`getValue` 方法不需要参数，它返回给定的 `Number` 实例的 `int` 值。语法并不复杂：类名 `Number` 后跟一个双冒号和方法名。回想一下先前的例子 `System.out::println`，它在 `System` 类中的 `static` 属性 `out` 后面有一个双冒号。

方法引用 `Number::getValue` 可以用下面的 lambda 表达式替换。参数 `n` 是流中的 `Number` 实例中的之一：

```
mapToInt(n -> n.getValue())
```

通常，lambda 表达式和方法引用是可互换的：如果像 `mapToInt` 这样的高阶函数可以采用一种形式作为参数，那么这个函数也可以采用另一种形式。这两个函数式编程结构具有相同的目的 —— 对作为参数传入的数据执行一些自定义操作。在两者之间进行选择通常是为了方便。例如，lambda 可以在没有封装类的情况下编写，而方法则不能。我的习惯是使用 lambda，除非已经有了适当的封装方法。

当前示例末尾的 `sum` 函数通过结合来自 `parallelStream` 线程的部分和，以线程安全的方式进行归约。但是，程序员有责任确保在 `parallelStream` 调用引发的多线程过程中，程序员自己的函数调用（在本例中为 `getValue`）是线程安全的。

最后一点值得强调。lambda 语法鼓励编写<ruby>纯函数<rt>pure function</rt></ruby>，即函数的返回值仅取决于传入的参数（如果有）；纯函数没有副作用，例如更新一个类中的 `static` 字段。因此，纯函数是线程安全的，并且如果传递给高阶函数的函数参数（例如 `filter` 和 `map` ）是纯函数，则流 API 效果最佳。

对于更细粒度的控制，有另一个流 API 函数，名为 `reduce`，可用于对 `Number` 流中的值求和:

```
Integer sum4AllHarder = listOfNums
    .parallelStream()                           // 多线程
    .map(Number::getValue)                      // 每个 Number 的值
    .reduce(0, (sofar, next) -> sofar + next);  // 求和
```

此版本的 `reduce` 函数带有两个参数，第二个参数是一个函数：

- 第一个参数（在这种情况下为零）是*特征*值，该值用作求和操作的初始值，并且在求和过程中流结束时用作默认值。
- 第二个参数是*累加器*，在本例中，这个 lambda 表达式有两个参数：第一个参数（`sofar`）是正在运行的和，第二个参数（`next`）是来自流的下一个值。运行的和以及下一个值相加，然后更新累加器。请记住，由于开始时调用了 `parallelStream`，因此 `map` 和 `reduce` 函数现在都在多线程上下文中执行。

在到目前为止的示例中，流值被收集，然后被规约，但是，通常情况下，流 API 中的 `Collectors` 可以累积值，而不需要将它们规约到单个值。正如下一个代码段所示，收集活动可以生成任意丰富的数据结构。该示例使用与前面示例相同的 `listOfNums`：

```
Map<Number.Parity, List<Number>> numMap = listOfNums
    .parallelStream()
    .collect(Collectors.groupingBy(Number::getParity));

List<Number> evens = numMap.get(Number.Parity.EVEN);
List<Number> odds = numMap.get(Number.Parity.ODD);
```

第一行中的 `numMap` 指的是一个 `Map`，它的键是一个 `Number` 奇偶校验位（`ODD` 或 `EVEN`），其值是一个具有指定奇偶校验位值的 `Number` 实例的 `List`。同样，通过 `parallelStream` 调用进行多线程处理，然后 `collect` 调用（以线程安全的方式）将部分结果组装到 `numMap` 引用的 `Map` 中。然后，在 `numMap` 上调用 `get` 方法两次，一次获取 `evens`，第二次获取 `odds`。

实用函数 `dumpList` 再次使用来自流 API 的高阶 `forEach` 函数：

```
private void dumpList(String msg, List<Number> list) {
    System.out.println("\n" + msg);
    list.stream().forEach(n -> n.dump()); // 或者使用 forEach(Number::dump)
}
```

这是示例运行中程序输出的一部分：

```
The sum of the randomly generated values is: 3322
The sum again, using a different method:     3322

Evens:

Value: 72 (parity: even)
Value: 54 (parity: even)
...
Value: 92 (parity: even)

Odds:

Value: 35 (parity: odd)
Value: 37 (parity: odd)
...
Value: 41 (parity: odd)
```

### 用于代码简化的函数式结构

函数式结构（如方法引用和 lambda 表达式）非常适合在流 API 中使用。这些构造代表了 Java 中对高阶函数的主要简化。即使在糟糕的过去，Java 也通过 `Method` 和 `Constructor` 类型在技术上支持高阶函数，这些类型的实例可以作为参数传递给其它函数。由于其复杂性，这些类型在生产级 Java 中很少使用。例如，调用 `Method` 需要对象引用（如果方法是非**静态**的）或至少一个类标识符（如果方法是**静态**的）。然后，被调用的 `Method` 的参数作为**对象**实例传递给它，如果没有发生多态（那会出现另一种复杂性！），则可能需要显式向下转换。相比之下，lambda 和方法引用很容易作为参数传递给其它函数。

但是，新的函数式结构在流 API 之外具有其它用途。考虑一个 Java GUI 程序，该程序带有一个供用户按下的按钮，例如，按下以获取当前时间。按钮按下的事件处理程序可能编写如下：

```
JButton updateCurrentTime = new JButton("Update current time");
updateCurrentTime.addActionListener(new ActionListener() {
    @Override
    public void actionPerformed(ActionEvent e) {
        currentTime.setText(new Date().toString());
    }
});
```

这个简短的代码段很难解释。关注第二行，其中方法 `addActionListener` 的参数开始如下：

```
new ActionListener() {
```

这似乎是错误的，因为 `ActionListener` 是一个**抽象**接口，而**抽象**类型不能通过调用 `new` 实例化。但是，事实证明，还有其它一些实例被实例化了：一个实现此接口的未命名内部类。如果上面的代码封装在名为 `OldJava` 的类中，则该未命名的内部类将被编译为 `OldJava$1.class`。`actionPerformed` 方法在这个未命名的内部类中被重写。

现在考虑使用新的函数式结构进行这个令人耳目一新的更改：

```
updateCurrentTime.addActionListener(e -> currentTime.setText(new Date().toString()));
```

lambda 表达式中的参数 `e` 是一个 `ActionEvent` 实例，而 lambda 的主体是对按钮上的 `setText` 的简单调用。

### 函数式接口和函数组合

到目前为止，使用的 lambda 已经写好了。但是，为了方便起见，我们可以像引用封装方法一样引用 lambda 表达式。以下一系列简短示例说明了这一点。

考虑以下接口定义：

```
@FunctionalInterface // 可选，通常省略
interface BinaryIntOp {
    abstract int compute(int arg1, int arg2); // abstract 声明可以被删除
}
```

注释 `@FunctionalInterface` 适用于声明*唯一*抽象方法的任何接口；在本例中，这个抽象接口是 `compute`。一些标准接口，（例如具有唯一声明方法 `run` 的 `Runnable` 接口）同样符合这个要求。在此示例中，`compute` 是已声明的方法。该接口可用作引用声明中的目标类型：

```
BinaryIntOp div = (arg1, arg2) -> arg1 / arg2;
div.compute(12, 3); // 4
```

包 `java.util.function` 提供各种函数式接口。以下是一些示例。

下面的代码段介绍了参数化的 `Predicate` 函数式接口。在此示例中，带有参数 `String` 的 `Predicate<String>` 类型可以引用具有 `String` 参数的 lambda 表达式或诸如 `isEmpty` 之类的 `String` 方法。通常情况下，Predicate 是一个返回布尔值的函数。

```
Predicate<String> pred = String::isEmpty; // String 方法的 predicate 声明
String[] strings = {"one", "two", "", "three", "four"};
Arrays.asList(strings)
   .stream()
   .filter(pred)                  // 过滤掉非空字符串
   .forEach(System.out::println); // 只打印空字符串
```

在字符串长度为零的情况下，`isEmpty` Predicate 判定结果为 `true`。 因此，只有空字符串才能进入管道的 `forEach` 阶段。

下一段代码将演示如何将简单的 lambda 或方法引用组合成更丰富的 lambda 或方法引用。考虑这一系列对 `IntUnaryOperator` 类型的引用的赋值，它接受一个整型参数并返回一个整型值：

```
IntUnaryOperator doubled = n -> n * 2;
IntUnaryOperator tripled = n -> n * 3;
IntUnaryOperator squared = n -> n * n;
```

`IntUnaryOperator` 是一个 `FunctionalInterface`，其唯一声明的方法为 `applyAsInt`。现在可以单独使用或以各种组合形式使用这三个引用 `doubled`、`tripled` 和 `squared`：

```
int arg = 5;
doubled.applyAsInt(arg); // 10
tripled.applyAsInt(arg); // 15
squared.applyAsInt(arg); // 25
```

以下是一些函数组合的样例：

```
int arg = 5;
doubled.compose(squared).applyAsInt(arg); // 5 求 2 次方后乘 2：50
tripled.compose(doubled).applyAsInt(arg); // 5 乘 2 后再乘 3：30
doubled.andThen(squared).applyAsInt(arg); // 5 乘 2 后求 2 次方：100
squared.andThen(tripled).applyAsInt(arg); // 5 求 2 次方后乘 3：75
```

函数组合可以直接使用 lambda 表达式实现，但是引用使代码更简洁。

### 构造器引用

构造器引用是另一种函数式编程构造，而这些引用在比 lambda 和方法引用更微妙的上下文中非常有用。再一次重申，代码示例似乎是最好的解释方式。

考虑这个 [POJO][13] 类：

```
public class BedRocker { // 基岩的居民
    private String name;
    public BedRocker(String name) { this.name = name; }
    public String getName() { return this.name; }
    public void dump() { System.out.println(getName()); }
}
```

该类只有一个构造函数，它需要一个 `String` 参数。给定一个名字数组，目标是生成一个 `BedRocker` 元素数组，每个名字代表一个元素。下面是使用了函数式结构的代码段：

```
String[] names = {"Fred", "Wilma", "Peebles", "Dino", "Baby Puss"};

Stream<BedRocker> bedrockers = Arrays.asList(names).stream().map(BedRocker::new);
BedRocker[] arrayBR = bedrockers.toArray(BedRocker[]::new);

Arrays.asList(arrayBR).stream().forEach(BedRocker::dump);
```

在较高的层次上，这个代码段将名字转换为 `BedRocker` 数组元素。具体来说，代码如下所示。`Stream` 接口（在包 `java.util.stream` 中）可以被参数化，而在本例中，生成了一个名为 `bedrockers` 的 `BedRocker` 流。

`Arrays.asList` 实用程序再次用于流化一个数组 `names`，然后将流的每一项传递给 `map` 函数，该函数的参数现在是构造器引用 `BedRocker::new`。这个构造器引用通过在每次调用时生成和初始化一个 `BedRocker` 实例来充当一个对象工厂。在第二行执行之后，名为 `bedrockers` 的流由五项 `BedRocker` 组成。

这个例子可以通过关注高阶 `map` 函数来进一步阐明。在通常情况下，一个映射将一个类型的值（例如，一个 `int`）转换为另一个*相同*类型的值（例如，一个整数的后继）:

```
map(n -> n + 1) // 将 n 映射到其后继
```

然而，在 `BedRocker` 这个例子中，转换更加戏剧化，因为一个类型的值（代表一个名字的 `String`）被映射到一个*不同*类型的值，在这个例子中，就是一个 `BedRocker` 实例，这个字符串就是它的名字。转换是通过一个构造器调用来完成的，它是由构造器引用来实现的：

```
map(BedRocker::new) // 将 String 映射到 BedRocker
```

传递给构造器的值是 `names` 数组中的其中一项。

此代码示例的第二行还演示了一个你目前已经非常熟悉的转换：先将数组先转换成 `List`，然后再转换成 `Stream`：

```
Stream<BedRocker> bedrockers = Arrays.asList(names).stream().map(BedRocker::new);
```

第三行则是另一种方式 —— 流 `bedrockers` 通过使用*数组*构造器引用 `BedRocker[]::new` 调用 `toArray` 方法:

```
BedRocker[ ] arrayBR = bedrockers.toArray(BedRocker[]::new);
```

该构造器引用不会创建单个 `BedRocker` 实例，而是创建这些实例的整个数组：该构造器引用现在为 `BedRocker[]:new`，而不是 `BedRocker::new`。为了进行确认，将 `arrayBR` 转换为 `List`，再次对其进行流式处理，以便可以使用 `forEach` 来打印 `BedRocker` 的名字。

```
Fred
Wilma
Peebles
Dino
Baby Puss
```

该示例对数据结构的微妙转换仅用几行代码即可完成，从而突出了可以将 lambda，方法引用或构造器引用作为参数的各种高阶函数的功能。

### <ruby>柯里化<rt>Currying</rt></ruby>

*柯里化*函数是指减少函数执行任何工作所需的显式参数的数量（通常减少到一个）。（该术语是为了纪念逻辑学家 Haskell Curry。）一般来说，函数的参数越少，调用起来就越容易，也更健壮。（回想一下一些需要半打左右参数的噩梦般的函数！）因此，应将柯里化视为简化函数调用的一种尝试。`java.util.function` 包中的接口类型适合于柯里化，如以下示例所示。

引用的 `IntBinaryOperator` 接口类型是为函数接受两个整型参数，并返回一个整型值：

```
IntBinaryOperator mult2 = (n1, n2) -> n1 * n2;
mult2.applyAsInt(10, 20); // 200
mult2.applyAsInt(10, 30); // 300
```

引用 `mult2` 强调了需要两个显式参数，在本例中是 10 和 20。

前面介绍的 `IntUnaryOperator` 比 `IntBinaryOperator` 简单，因为前者只需要一个参数，而后者则需要两个参数。两者均返回整数值。因此，目标是将名为 `mult2` 的两个参数 `IntBinraryOperator` 柯里化成一个单一的 `IntUnaryOperator` 版本 `curriedMult2`。

考虑 `IntFunction<R>` 类型。此类型的函数采用整型参数，并返回类型为 `R` 的结果，该结果可以是另一个函数 —— 更准确地说，是 `IntBinaryOperator`。让一个 lambda 返回另一个 lambda 很简单：

```
arg1 -> (arg2 -> arg1 * arg2) // 括号可以省略
```

完整的 lambda 以 `arg1` 开头，而该 lambda 的主体以及返回的值是另一个以 `arg2` 开头的 lambda。返回的 lambda 仅接受一个参数（`arg2`），但返回了两个数字的乘积（`arg1` 和 `arg2`）。下面的概述，再加上代码，应该可以更好地进行说明。

以下是如何柯里化 `mult2` 的概述：

- 类型为 `IntFunction<IntUnaryOperator>` 的 lambda 被写入并调用，其整型值为 10。返回的 `IntUnaryOperator` 缓存了值 10，因此变成了已柯里化版本的 `mult2`，在本例中为 `curriedMult2`。
- 然后使用单个显式参数（例如，20）调用 `curriedMult2` 函数，该参数与缓存的参数（在本例中为 10）相乘以生成返回的乘积。。

这是代码的详细信息：

```
// 创建一个接受一个参数 n1 并返回一个单参数 n2 -> n1 * n2 的函数，该函数返回一个（n1 * n2 乘积的）整型数。
IntFunction<IntUnaryOperator> curriedMult2Maker = n1 -> (n2 -> n1 * n2);
```

调用 `curriedMult2Maker` 生成所需的 `IntUnaryOperator` 函数：

```
// 使用 curriedMult2Maker 获取已柯里化版本的 mult2。
// 参数 10 是上面的 lambda 的 n1。
IntUnaryOperator curriedMult2 = curriedMult2Maker2.apply(10);
```

值 `10` 现在缓存在 `curriedMult2` 函数中，以便 `curriedMult2` 调用中的显式整型参数乘以 10：

```
curriedMult2.applyAsInt(20); // 200 = 10 * 20
curriedMult2.applyAsInt(80); // 800 = 10 * 80
```

缓存的值可以随意更改：

```
curriedMult2 = curriedMult2Maker.apply(50); // 缓存 50
curriedMult2.applyAsInt(101);               // 5050 = 101 * 50
```

当然，可以通过这种方式创建多个已柯里化版本的 `mult2`，每个版本都有一个 `IntUnaryOperator`。

柯里化充分利用了 lambda 的强大功能：可以很容易地编写 lambda 表达式来返回需要的任何类型的值，包括另一个 lambda。

### 总结

Java 仍然是基于类的面向对象的编程语言。但是，借助流 API 及其支持的函数式构造，Java 向函数式语言（例如 Lisp）迈出了决定性的（同时也是受欢迎的）一步。结果是 Java 更适合处理现代编程中常见的海量数据流。在函数式方向上的这一步还使以在前面的代码示例中突出显示的管道的方式编写清晰简洁的 Java 代码更加容易：

```
dataStream
   .parallelStream() // 多线程以提高效率
   .filter(...)      // 阶段 1
   .map(...)         // 阶段 2
   .filter(...)      // 阶段 3
   ...
   .collect(...);    // 或者，也可以进行归约：阶段 N
```

自动多线程，以 `parallel` 和 `parallelStream` 调用为例，建立在 Java 的 fork/join 框架上，该框架支持 <ruby>任务窃取<rt>task stealing</rt></ruby> 以提高效率。假设 `parallelStream` 调用后面的线程池由八个线程组成，并且 `dataStream` 被八种方式分区。某个线程（例如，T1）可能比另一个线程（例如，T7）工作更快，这意味着应该将 T7 的某些任务移到 T1 的工作队列中。这会在运行时自动发生。

在这个简单的多线程世界中，程序员的主要职责是编写线程安全函数，这些函数作为参数传递给在流 API 中占主导地位的高阶函数。尤其是 lambda 鼓励编写纯函数（因此是线程安全的）函数。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/javastream

作者：[Marty Kalin][a]
选题：[lujun9972][b]
译者：[laingke](https://github.com/laingke)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mkalindepauledu
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/features_solutions_command_data.png?itok=4_VQN3RK (computer screen )
[2]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+random
[3]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+list
[4]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
[5]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+number
[6]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+arrays
[7]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+integer
[8]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[9]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+jbutton
[10]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+actionlistener
[11]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+actionevent
[12]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+date
[13]: https://en.wikipedia.org/wiki/Plain_old_Java_object

[#]: subject: "Creating and initializing lists in Java and Groovy"
[#]: via: "https://opensource.com/article/22/1/creating-lists-groovy-java"
[#]: author: "Chris Hermansen https://opensource.com/users/clhermansen"
[#]: collector: "lujun9972"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

在 Java 和 Groovy 中创建和初始化列表的不同
======
首先在 Java 中创建初始化一个整数列表，然后在 Groovy 中做同样的事。
![Developing code.][1]

我非常喜欢 [Groovy 编程语言][2]。我喜欢它是因为我喜欢 Java，尽管 Java 有时候感觉很笨拙。正因为我是那么喜欢 Java，其他运行在 JVM 上语言都不能吸引我。比方说 Kotlin、Scala 还有 Clojure 语言，它们感觉上就和 Java 不一样，因为它们对于什么是好的编程语言的理解不同。Groovy 和它们都不一样，在我看来，Groovy 是一个完美的选项，特别是对于一部分程序员来说，他们喜欢 Java，但是又需要一个更灵活、更紧凑，并且有时候更直接的语言。

<ruby>列表<rt>List</rt></ruby> 这种数据结构是一个很好的例子，它可以容纳一个无序的列表，列表中的元素可以是数字、字符串或者对象，程序员可以用某种方式高效地遍历这些元素，特别是对于编写和维护脚本的人来说，“高效”的关键就是要有简洁清晰的表达，而不需要一大堆“仪式”，把代码的意图都变模糊了。

### 安装 Java 和 Groovy

Groovy 是基于 Java 的，因此需要同时安装一个 Java 才行。你的 Linux 发行版的仓库中可能有最近的比较好的 Java 版本。或者，你也可以在根据 [这些指示][3] 来安装 Groovy。对于 Linux 用户来说，SDKMan 是一个不错的代替选项，你可以使用它来获取多个 Java 和 Groovy 版本，以及许多其他的相关工具。在这篇文章中，我使用的 SDK 发行版是：

  * Java: version 11.0.12-open of OpenJDK 11
  * Groovy: version 3.0.8



### 言归正传

Java 中有很多方法可以实例化并初始化列表，从它最初被引入的时候就有了（我记得是在 Java 1.5 的时候，但请不要引用我的话）。在这些方法里，有两个有趣的方法，它们涉及到了 `java.util.Arrays` 和 `java.util.List` 这两个类。

#### 使用 java.util.Arrays 类

`java.util.Arrays` 类定义了一个 `asList()` 静态方法，它可以被用来创建一个基于数组的列表，因此大小是不可变的，尽管其中的元素是可以被修改的。下面是它的使用方式：


```java
var a1 = [Arrays][4].asList(1,2,3,4,5,6,7,8,9,10); // immutable list of mutable elements

[System][5].out.println("a1 = " + a1);
[System][5].out.println("a1 is an instance of " + a1.getClass());

// output is
// a1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
// a1 is an instance of class java.util.Arrays$ArrayList

a1.set(0,0); // succeeds
[System][5].out.println("a1 = " + a1); // output is
// a1 = [0, 2, 3, 4, 5, 6, 7, 8, 9, 10]

a1.add(11); // fails producing
// Exception in thread "main" java.lang.UnsupportedOperationException
[System][5].out.println("a1 = " + a1); // not reached

```

#### 使用 java.util.List 类

`java.util.List` 类定义了一个 `of()` 静态方法，它可以被用来创建一个不可变的列表，其中的元素是否可变要取决于它们本身是否支持修改。下面是它的使用方式：


```java
var a2 = [List][6].of(1,2,3,4,5,6,7,8,9,10);

[System][5].out.println("a2 = " + a2);
[System][5].out.println("a2 is an instance of " + a2.getClass());

// output is
// a2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
// a2 is an instance of class java.util.ImmutableCollections$ListN

a2.set(0,0); // fails producing
// Exception in thread "main" java.lang.UnsupportedOperationException
[System][5].out.println("a2 = " + a2); // not reached

a2.add(11); // also fails for same reason if above two lines commented out
[System][5].out.println("a2 = " + a2); // not reached

```

因此，我可以使用 `Arrays.asList()`，也可以使用 `List.of()` 方法，前提是如果我想要的是一个大小不能改变、且不关心元素是否可变的列表。

如果我想要初始化一个可变的列表，我更倾向于把这些不可变的列表作为参数传给一个列表构造器，就像下面这样：


```java
var a1 = new ArrayList<Integer>([Arrays][4].asList(1,2,3,4,5,6,7,8,9,10));

[System][5].out.println("a1 = " + a1);
[System][5].out.println("a1 is an instance of " + a1.getClass());

// output is
// a1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
// a1 is an instance of class java.util.ArrayList

a1.set(0,0);
[System][5].out.println("a1 = " + a1);

//output is
// a1 = [0, 2, 3, 4, 5, 6, 7, 8, 9, 10]

a1.add(11);
[System][5].out.println("a1 = " + a1);

// output is
// a1 = [0, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

```

注意，这个 `Arrays.asList()` 方法是用来初始化这个新的 `ArrayList<Integer>()` 的，也就是说，它为这个传进来的列表创建了一个可变的拷贝。

现在，或许只有我这么想，但是这种方式确实看起来需要理解很多关于 `java.util.Arrays` 和 `java.util.List` 类的细节才行，而我只是想要创建并初始化一个数字列表而已（尽管真正使用到的语句并没有太多“仪式”）。下面是真正用到的那行代码，仅供参考：


```java
`var a1 = new ArrayList<Integer>(Arrays.asList(1,2,3,4,5,6,7,8,9,10));`
```

### Groovy 是怎么做的

下面来看看在 Groovy 中如何实现上述需求：


```groovy
def a1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

println "a1 = $a1"
println "a1 is an instance of ${a1.getClass()}"

// output is
// a1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
// a1 is an instance of class java.util.ArrayList

a1[0] = 0
println "a1 = $a1"

// output is
// a1 = [0, 2, 3, 4, 5, 6, 7, 8, 9, 10]

a1 << 11
println "a1 = $a1"

// output is
// a1 = [0, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

```

我们一眼就能发现，Groovy 使用了 `def` 关键字而不是 `var` 关键字。我还发现了，仅仅是把一系列的类型（在这个例子里是整数）放进括号里，我就得到了一个创建好的列表。此外，这样创建出来的列表完全就是我想要的：一个可变的 `ArrayList` 实例。

现在，或许再一次只有我这么想，但是上面的代码看起来要简单多得多 —— 不用记住 `.of()` 和 `.asList()` 返回的是“<ruby>半不变<rt>semi-mutable</rt></ruby>”的结果，也不用为它们做一些补偿。另外一个好处是，我现在可以使用括号和下标来引用列表中的某个特定元素，而不用这个叫 `set()` 方法。另外，这个跟在列表后面的 `<<` 操作符也很方便，我再也不用调用 `add()` 方法来添加元素啦。还有，你注意到代码中没有分号了吗？没错，在 Groovy 里，句末的分号并不是必须的。最后，我们来看看字符串插值，只要在字符串里用 `$变量` 或者 `${表达式}` 就可以实现了哦！

在 Groovy 世界中还藏着许多“有待发掘”的东西。上面的列表定义其实是一个动态类型（Groovy 中默认）和 Java 中的静态类型的对比。在上面的 Groovy 代码定义的那一行，变量 `a1` 的类型是在运行的时候，根据等号右边的表达式的计算结果推断出来的。现在我们都知道，动态语言可以给我们带来强大的功能，有了强大的功能，我们有了很多机会去尝试不同的东西。对于那些不喜欢动态类型的程序员来说，Groovy 也支持静态类型。

### Groovy 相关资源

Apache Groovy 网站上有非常多的文档。另一个很棒的 Groovy 资源是 [Mr. Haki][7]。学习 Groovy 还有一个很棒的原因，那就是可以接着学习 [Grails][8]，后者是一个优秀的、高效率的全栈 Web 框架，基于许多优秀组件构建而成，比如有 Hibernate、Spring Boot 和 Micronaut 等。

本文献给我亲爱的朋友 Anil Mukhi，他于 2022 年 1 月 3 日不幸离世。谢谢你，Anil，让我有机会了解这么多关于 Groovy、Grails 和赛马数据的知识。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/creating-lists-groovy-java

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[lkxed](https://github.com/lkxed)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_development_programming.png?itok=M_QDcgz5 (Developing code.)
[2]: http://www.groovy-lang.org/
[3]: http://www.groovy-lang.org/install.html
[4]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+arrays
[5]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
[6]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+list
[7]: https://www.mrhaki.com/
[8]: https://grails.org/

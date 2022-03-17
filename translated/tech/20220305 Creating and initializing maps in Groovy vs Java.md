[#]: subject: "Creating and initializing maps in Groovy vs Java"
[#]: via: "https://opensource.com/article/22/3/maps-groovy-vs-java"
[#]: author: "Chris Hermansen https://opensource.com/users/clhermansen"
[#]: collector: "lujun9972"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

在 Groovy 和 Java 中创建并初始化 Map 的不同
======
Java 和 Groovy 中的 Map 都是非常通用的，它允许<ruby>关键字<rt>key</rt></ruby>和<ruby>值<rt>value</rt></ruby>为任意类型，只要继承了 Object 类即可。
![Business woman on laptop sitting in front of window][1]

我最近在探索 Java 与 Groovy 在 [创建并初始化<ruby>列表<rt>List</rt></ruby>][2] 和 [在运行时构建<ruby>列表<rt>List</rt></ruby>][3] 放面的一些差异。我观察到，就实现这些功能而言，Groovy 的简洁和 Java 的繁复形成了鲜明对比。 

在这篇文章中，我将实现在 Java 和 Groovy 中创建并初始化 Map。Map 为开发支持根据 _关键字_ 检索的结构提供了可能，如果找到了这样一个关键字，它就会返回对应的 _值_。今天，很多编程语言都实现了 Map，其中包括 Java 和 Groovy，也包括了 Python（它将 Map 称为<ruby>字典<rt>dict</rt></ruby>）、Perl、awk 以及许多其他语言。另一个经常被用来描述 Map 的术语是 _<ruby>关联数组<rt>associative arrays</rt></ruby>_，你可以在 [这篇维基百科文章][4] 中了解更多。Java 和 Groovy 中的 Map 都是非常通用的，它允许<ruby>关键字<rt>key</rt></ruby>和<ruby>值<rt>value</rt></ruby>为任意类型，只要继承了 Object 类即可。

### 安装 Java 和 Groovy

Groovy 基于 Java，因此你需要先安装 Java。你的 Linux 发行版的仓库中可能有最近的比较好的 Java 版本。或者，你也可以在根据上面链接中的指示来安装 Groovy。对于 Linux 用户来说，[SDKMan][5] 是一个不错的代替选项，你可以使用它来获取多个 Java 和 Groovy 版本，以及许多其他的相关工具。在这篇文章中，我使用的 SDK 发行版是：

  * Java: version 11.0.12-open of OpenJDK 11;
  * Groovy: version 3.0.8.



### 言归正传

Java 提供了非常多的方式来实例化和初始化 Map，并且从 Java 9 之后，一些新的方式也添加了进来。其中最明显的方式就是使用 `java.util.Map.of()` 这个静态方法，下面介绍如何使用它：


```


var m1 = [Map][6].of(
    "AF", "Afghanistan",
    "AX", "Åland Islands",
    "AL", "Albania",
    "DZ", "Algeria",
    "AS", "American Samoa",
    "AD", "Andorra",
    "AO", "Angola",
    "AI", "Anguilla",
    "AQ", "Antarctica");

[System][7].out.println("m1 = " + m1);
[System][7].out.println("m1 is an instance of " + m1.getClass());

```

事实证明，在此种情况下，`Map.of()` 有两个重要的限制。其一，这样创建出来的 Map 实例是<ruby>不可变的<rt>immutable</rt></ruby>。其二，你最多只能提供 20 个参数，用来表示 10 个<ruby>键值对<rt>key-value pairs</rt></ruby>。

你可以尝试着添加第 10 对和第 11 对，比方说 "AG", "Antigua and Barbuda" 和 "AR", "Argentina"，然后观察会发生什么。你将发现 Java 编译器尝试寻找一个支持 11 个键值对的 `Map.of()` 方法。

快速查看 [java.util.Map 类的文档][8]，你就会找到上述第二个限制的原因，以及解决这个难题的一种方式：


```


var m2 = [Map][6].ofEntries(
    [Map][6].entry("AF", "Afghanistan"),
    [Map][6].entry("AX", "Åland Islands"),
    [Map][6].entry("AL", "Albania"),
    [Map][6].entry("DZ", "Algeria"),
    [Map][6].entry("AS", "American Samoa"),
    [Map][6].entry("AD", "Andorra"),
    [Map][6].entry("AO", "Angola"),
    [Map][6].entry("AI", "Anguilla"),
    [Map][6].entry("AQ", "Antarctica"),
    [Map][6].entry("AG", "Antigua and Barbuda"),
    [Map][6].entry("AR", "Argentina"),
    [Map][6].entry("AM", "Armenia"),
    [Map][6].entry("AW", "Aruba"),
    [Map][6].entry("AU", "Australia"),
    [Map][6].entry("AT", "Austria"),
    [Map][6].entry("AZ", "Azerbaijan"),
    [Map][6].entry("BS", "Bahamas"),
    [Map][6].entry("BH", "Bahrain"),
    [Map][6].entry("BD", "Bangladesh"),
    [Map][6].entry("BB", "Barbados")
);
       
[System][7].out.println("m2 = " + m2);
[System][7].out.println("m2 is an instance of " + m2.getClass());

```

这就是一个比较好的解决方式，前提是我不在随后的代码里改变使用 `Map.ofEntries()` 创建并初始化的 Map 内容。注意，我在上面使用了 `Map.ofEntries()` 来代替 `Map.of()`。

然而，假设我想要创建并初始化一个非空的 Map，随后往这个 Map 中添加数据，我需要这样做：


```


var m3 = new HashMap&lt;[String][9],String&gt;([Map][6].ofEntries(
    [Map][6].entry("AF", "Afghanistan"),
    [Map][6].entry("AX", "Åland Islands"),
    [Map][6].entry("AL", "Albania"),
    [Map][6].entry("DZ", "Algeria"),
    [Map][6].entry("AS", "American Samoa"),
    [Map][6].entry("AD", "Andorra"),
    [Map][6].entry("AO", "Angola"),
    [Map][6].entry("AI", "Anguilla"),
    [Map][6].entry("AQ", "Antarctica"),
    [Map][6].entry("AG", "Antigua and Barbuda"),
    [Map][6].entry("AR", "Argentina"),
    [Map][6].entry("AM", "Armenia"),
    [Map][6].entry("AW", "Aruba"),
    [Map][6].entry("AU", "Australia"),
    [Map][6].entry("AT", "Austria"),
    [Map][6].entry("AZ", "Azerbaijan"),
    [Map][6].entry("BS", "Bahamas"),
    [Map][6].entry("BH", "Bahrain"),
    [Map][6].entry("BD", "Bangladesh"),
    [Map][6].entry("BB", "Barbados")
));

[System][7].out.println("m3 = " + m3);
[System][7].out.println("m3 is an instance of " + m3.getClass());

m3.put("BY", "Belarus");
[System][7].out.println("BY: " + m3.get("BY"));

```

这里，我把使用 `Map.ofEntries()` 创建出来的不可变 Map 作为 `HashMap` 的一个构造参数，以此创建了该 Map 的一个<ruby>可变拷贝<rt>mutable copy</rt></ruby>，之后我就可以修改它 —— 比如使用 `put()` 方法。

让我们来看看上述过程如何用 Groovy 来实现：


```


def m1 = [
    "AF": "Afghanistan",
    "AX": "Åland Islands",
    "AL": "Albania",
    "DZ": "Algeria",
    "AS": "American Samoa",
    "AD": "Andorra",
    "AO": "Angola",
    "AI": "Anguilla",
    "AQ": "Antarctica",
    "AG": "Antigua and Barbuda",
    "AR": "Argentina",
    "AM": "Armenia",
    "AW": "Aruba",
    "AU": "Australia",
    "AT": "Austria",
    "AZ": "Azerbaijan",
    "BS": "Bahamas",
    "BH": "Bahrain",
    "BD": "Bangladesh",
    "BB": "Barbados"]

println "m1 = $m1"
println "m1 is an instance of ${m1.getClass()}"

m1["BY"] = "Belarus"
println "m1 = $m1"

```

只看一眼，你就会发现 Groovy 使用了 `def` 关键字而不是 `var` —— 尽管在<ruby>最近模型<rt>late-model</rt><ruby>的 Groovy（version 3+）中，使用 `var` 关键字也是可行的。

你还会发现，你是通过在括号里添加了一个键值对列表来创建一个 Map 的。不仅如此，这样创建的列表对象还非常有用，这里有几个原因。其一，它是可变的；其二，它是一个 `LinkedHashMap` 的实例，内部维持了数据的插入顺序。所以，当你运行 Java 版本的代码并打印出变量 `m3`，你会看到：


```
`m3 = {BB=Barbados, BD=Bangladesh, AD=Andorra, AF=Afghanistan, AG=Antigua and Barbuda, BH=Bahrain, AI=Anguilla, AL=Albania, AM=Armenia, AO=Angola, AQ=Antarctica, BS=Bahamas, AR=Argentina, AS=American Samoa, AT=Austria, AU=Australia, DZ=Algeria, AW=Aruba, AX=Åland Islands, AZ=Azerbaijan}`
```

而当你运行 Groovy 版本的代码，你会看到：


```
`m1 = [AF:Afghanistan, AX:Åland Islands, AL:Albania, DZ:Algeria, AS:American Samoa, AD:Andorra, AO:Angola, AI:Anguilla, AQ:Antarctica, AG:Antigua and Barbuda, AR:Argentina, AM:Armenia, AW:Aruba, AU:Australia, AT:Austria, AZ:Azerbaijan, BS:Bahamas, BH:Bahrain, BD:Bangladesh, BB:Barbados]`
```

再一次，你将看到 Groovy 是如何简化事情的。这样的语法非常直观，有点像 Python 里的字典，并且，即使你有一个超过 10 个键值对的初始列表，你也不需要去记住各种必要的<ruby>复杂方式<rt>contortions</rt></ruby>：


```
`m1[“BY”] = “Belarus”`
```

而在 Java 中，你需要这样做：


```
`m1.put(“BY”, “Belarus”)`
```

还有，这个 Map 默认是可变的，这么做的利弊很难评判，还是得取决于你的需求是什么。我个人觉得，Java 在这种情况下的 “默认不可变” 机制，最让我困扰的地方是，它没有一个类似于 `Map.mutableOfMutableEntries()` 的方法。这迫使一些刚学会如何声明和初始化一个 Map 的程序员，不得不转念去思考该如何把他们手中不可变的 Map，转换为可变的。同时我也想问，创建一个不可变的对象然后再舍弃它，这样真的好吗？

另一个值得考虑的事情是，Groovy 使用方括号代替 Java 中的 `put()` 和 `get()` 方法来进行关键字查找。因此你可以这样写：


```
`m1[“ZZ”] = m1[“BY”]`
```

而不需要这样写：


```
`m1.put(“ZZ”,m1.get(“BY”))`
```

有时候，就像使用某个类的实例变量一样来使用 Map 中的关键字和值是一个好办法。设想你现在有一堆想要设置的属性，在 Groovy 中，它们看起来就像下面这样：


```


def properties = [
      verbose: true,
      debug: false,
      logging: false]

```

然后，你可以改变其中的某个属性，就像下面这样：


```
`properties.verbose = false`
```

之所以这样能工作，是因为，只要关键字符合特定的规则，你就可以省略引号，然后直接用点操作符来代替方括号。尽管这个功能非常有用，也非常好用，它也同时也意味着，如果你要把一个变量作为一个 Map 的关键字来使用，你就必须把这个变量包裹在圆括号里，就像下面这样：


```
`def myMap = [(k1): v1, (k2): v2]`
```

是时候告诉勤奋的读者 Groovy 是一门为编写脚本而量身定制的语言了。Map 通常是脚本中的关键元素，它为脚本提供了<ruby>查找表<rt>lookup tables</rt></ruby>，并且通常起到了作为内存数据库的作用。我在这里使用的例子是 ISO 3166 规定的两个字母的国家代码和国家名称。对在世界上各个国家的互联网使用者来说，这些代码是很熟悉的。此外，假设我们要编写一个从日志文件中查找互联网主机名，并借此来了解用户的地理位置分布的脚本工具，那么这些代码会是十分有用的部分。

### Groovy 相关资源

[Apache Groovy 网站][10] 上有非常多的文档。另一个很棒的 Groovy 资源是 [Mr. Haki][11]。[Baeldung 网站][12] 提供了大量 Java 和 Groovy 的有用教程。学习 Groovy 还有一个很棒的原因，那就是可以接着学习 [Grails][13]，后者是一个优秀的、高效率的全栈 Web 框架。它基于许多优秀组件构建而成，比如有 Hibernate、Spring Boot 和 Micronaut 等。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/3/maps-groovy-vs-java

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[lkxed](https://github.com/lkxed)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF (Woman using laptop concentrating)
[2]: https://opensource.com/article/22/1/creating-lists-groovy-java
[3]: https://opensource.com/article/22/2/accumulating-lists-groovy-vs-java
[4]: https://en.wikipedia.org/wiki/Associative_array
[5]: https://sdkman.io/
[6]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+map
[7]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
[8]: https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/Map.html
[9]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[10]: https://groovy-lang.org/
[11]: https://blog.mrhaki.com/
[12]: https://www.baeldung.com/
[13]: https://grails.org/

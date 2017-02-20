没有Kotlin(Android)生活
============================================================

![](https://cdn-images-1.medium.com/max/2000/1*Fd349rzh3XWwSbCP2IV7zA.jpeg)

> 开始投入一件事比远离它更容易。 — Donald Rumsfeld

没有Kotlin的生活就像在触摸板上玩魔兽争霸3。购买鼠标很简单，但如果你的新雇主不想让你在生产中使用Kotlin，你该怎么办？

下面有一些选择。
*  与你的产品负责人争取获得使用Kotlin的权利。
*  使用Kotlin并且不告诉其他人因为你知道最好的东西是只适合你的。
*  擦掉你的眼泪，自豪地使用Java。

想象一下，你在和产品负责人的斗争中失败，作为一个专业的工程师，在没有任何人的允许下你将不会去依靠和使用时髦的技术。我知道这听起来非常恐怖，特别当你已经品尝到Kotlin的好处但是又没有失去你的希望。

在文章接下来的部分，我想简短地描述一些Kotlin的特征，使你通过一些知名的工具和库，可以应用到你的Android里的Java代码中去。对于Kotlin和Java一个基本的认识是需要的。

### 数据类

你真的已经喜欢上Kotlin的数据类，不是吗？对于你来说，得到`equals()`, `hashCode()`, `toString()` 和 `copy()`这些类是很容易的。具体来说，`data`关键字还会按照声明顺序生成对应于属性的`componentN()`函数。 它们用于构造声明。
```
data class Person(val name: String)
val (riddle) = Person("Peter")
println(riddle)
```

你知道什么会被打印吗？确信它不会是从`Person` 类的`toString()` 返回的值。这是构造声明的作用，它赋值从`name`到`riddle`。使用园括号`(riddle)`编译器知道它必须使用构造声明机制。


```
val (riddle): String = Person("Peter").component1()
println(riddle) // prints Peter
view raw
```

>这个代码没有编译。它就是展示了构造声明怎么工作的。

正如你可以看到`data`关键字是一个超级有用的语言特性，所以你能做什么把它带到你的Java世界？ 使用注释处理器并修改抽象语法树。 如果你想更深入，请阅读文章末尾列出的文章（Project Lombok— Trick Explained）。

使用项目Lombok你可以实现几乎相同的功能，`data`关键字提供。 不幸的是，没有办法进行构造声明。

```
import lombok.Data;

@Data class Person {
    final String name;
}
```


`@ Data`注解生成`equals（）`，`hashCode（）`和`toString（）`。 此外，它为所有字段创建getters，为所有非最终字段创建setters，并为所有必填字段（finalals）创建构造函数。 值得注意的是，Lombok仅用于编译，因此库代码不会添加到您的最终的.apk。

### Lambda表达式

Android工程师有一个非常艰难的生活，因为Android中缺乏Java 8的特性，而且其中之一是lambda表达式。 Lambdas是很棒的，因为它们为你减少了成吨的样板。 你可以在回调和流中使用它们。 在Kotlin中，lambda表达式是内置的，它们看起来比它们在Java中看起来好多了。 此外，lambda的字节码可以直接插入到调用方法的字节码中，因此方法计数不会增加。 它可以使用内联函数。

```
button.setOnClickListener { println("Hello World") }
```
最近Google宣布在Android中支持Java 8的特性，由于Jack编译器，你可以在你的代码中使用lambdas。还要提及的是，它们在API 23或者更低的级别都可用。

```
button.setOnClickListener(view -> System.out.println("Hello World!"));
```

怎样使用它们？就只用添加下面几行到你的` build.gradle `文件中。


```
defaultConfig {
    jackOptions {
        enabled true
    }
}

compileOptions {
    sourceCompatibility JavaVersion.VERSION_1_8
    targetCompatibility JavaVersion.VERSION_1_8
}
```

如果你不是一个Jack编译器的粉丝，或则你由于一些原因不能使用它，这里有一个不同的解决方案提供给你。Retrolambda项目允许你使用Java 7，6或者5上的lambda表达式来运行Java 8的代码，下面是设置过程。
```
dependencies {
    classpath 'me.tatarka:gradle-retrolambda:3.4.0'
}

apply plugin: 'me.tatarka.retrolambda'

compileOptions {
    sourceCompatibility JavaVersion.VERSION_1_8
    targetCompatibility JavaVersion.VERSION_1_8
}
```
正如我前面提到的，在Kotlin下的lambdas内联函数不增加方法计数，但是如何在Jack或者Retrolambda下使用它们？ 显然，它们不是免费的，隐藏的成本如下。



 ![](https://cdn-images-1.medium.com/max/800/1*H7h2MB2auMslMkdaDtqAfg.png) 

### 数据操作


Kotlin引入了高阶函数作为流的替代。 当您必须将一组数据转换为另一组数据或过滤集合时，它们非常有用。

```
fun foo(persons: MutableList<Person>) {
    persons.filter { it.age >= 21 }
           .filter { it.name.startsWith("P") }
           .map { it.name }
           .sorted()
           .forEach(::println)
}

data class Person(val name: String, val age: Int)
```

Streams也由Google使用Jack编译器提供。 不幸的是，Jack不使用Lombok，因为它在编译代码时跳过生成中间的`.class`文件，而Lombok依赖于这些文件。


```
void foo(List<Person> persons) {
    persons.stream()
           .filter(it -> it.getAge() >= 21)
           .filter(it -> it.getName().startsWith("P"))
           .map(Person::getName)
           .sorted()
           .forEach(System.out::println);
}

class Person {
    final private String name;
    final private int age;

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    String getName() { return name; }
    int getAge() { return age; }
}
```

这太好了以至于不是真的，所以在哪里捉住？ 悲伤的是，流从API 24 \可用。谷歌做的不错，但为什么广泛的应用程序有` minSdkVersion = 24 `？

幸运的是，Android平台有一个很好的开源社区提供许多很棒的库。Lightweight-Stream-API是其中的一个，它包含基于Java 7及以下版本的迭代器的流实现。

```
import lombok.Data;
import com.annimon.stream.Stream;

void foo(List<Person> persons) {
    Stream.of(persons)
          .filter(it -> it.getAge() >= 21)
          .filter(it -> it.getName().startsWith("P"))
          .map(Person::getName)
          .sorted()
          .forEach(System.out::println);
}

@Data class Person {
    final String name;
    final int age;
}
```

上面的例子结合了Lombok，Retrolambda和Lightweight-Stream-API，它看起来几乎和Kotlin一样好，不是。 使用静态工厂方法允许您将任何Iterable转换为流，并对其应用lambdas，就像Java 8流一样。 将静态调用` Stream.of(persons) `包装为Iterable类型的扩展函数是完美的，但是Java不支持它。

### 扩展功能

扩展机制提供了向类添加功能而无需继承它的能力。 这个众所周知的概念非常适合Android世界，这就是Kotlin在社区很受欢迎的原因。

有没有技术或魔术将扩展功能添加到你的Java工具箱？ 由于Lombok，你可以使用它们作为一个实验功能。 根据Lombok文档的说明，他们想把它从实验状态移出，没有或微小的变化很快。 让我们重构最后一个样例，并将` Stream.of(persons) `包装成扩展函数。


```
import lombok.Data;
import lombok.experimental.ExtensionMethod;

@ExtensionMethod(Streams.class)
public class Foo {
    void foo(List<Person> persons) {
        persons.toStream()
               .filter(it -> it.getAge() >= 21)
               .filter(it -> it.getName().startsWith("P"))
               .map(Person::getName)
               .sorted()
               .forEach(System.out::println);
    }
}

@Data class Person {
    final String name;
    final int age;
}

class Streams {
    static <T> Stream<T> toStream(List<T> list) {
        return Stream.of(list);
    }
}
```

所有的方法是`public`，`static`，并且至少有一个参数的类型不是原始的，被认为是扩展方法。 `@ ExtensionMethod`注解允许你指定一个包含你的扩展函数的类。 而不是使用一个`.class`对象，你也可以传递数组。

* * *

我完全知道我的一些想法是非常有争议的，特别是Lombok，我也知道，有很多的库，可以使你的生活更轻松。请不要犹豫在评论里分享你的经验。干杯!


 ![](https://cdn-images-1.medium.com/max/800/1*peB9mmElOn6xwR3eH0HXXA.png) 



---------------------------------

作者简介：

![](https://cdn-images-1.medium.com/fit/c/60/60/1*l7_L6VCKzkOm0gq4Kplnkw.jpeg)

Coder and professional dreamer @ Grid Dynamics

--------------------------------------------------------------------------------

via: https://hackernoon.com/living-android-without-kotlin-db7391a2b170#.q95i5232f

作者：[Piotr Ślesarew][a]
译者：[DockerChen](https://github.com/DockerChen)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://hackernoon.com/@piotr.slesarew?source=post_header_lockup
[1]:http://jakewharton.com/exploring-java-hidden-costs/
[2]:https://medium.com/u/8ddd94878165
[3]:https://projectlombok.org/index.html
[4]:https://github.com/aNNiMON/Lightweight-Stream-API
[5]:https://github.com/orfjackal/retrolambda
[6]:http://notatube.blogspot.com/2010/11/project-lombok-trick-explained.html
[7]:http://notatube.blogspot.com/2010/11/project-lombok-trick-explained.html
[8]:https://twitter.com/SliskiCode

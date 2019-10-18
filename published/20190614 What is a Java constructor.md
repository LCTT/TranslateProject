[#]: collector: (lujun9972)
[#]: translator: (laingke)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11478-1.html)
[#]: subject: (What is a Java constructor?)
[#]: via: (https://opensource.com/article/19/6/what-java-constructor)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

什么是 Java 构造器？
======

> 构造器是编程的强大组件。使用它们来释放 Java 的全部潜力。

![](https://img.linux.net.cn/data/attachment/album/201910/18/230523hdx7sy804xdtxybb.jpg)

在开源、跨平台编程领域，Java 无疑（？）是无可争议的重量级语言。尽管有许多[伟大的跨平台][2][框架][3]，但很少有像 [Java][4] 那样统一和直接的。

当然，Java 也是一种非常复杂的语言，具有自己的微妙之处和惯例。Java 中与<ruby>构造器<rt> constructor</rt></ruby>有关的最常见问题之一是：它们是什么，它们的作用是什么？

简而言之：构造器是在 Java 中创建新<ruby>对象<rt>object</rt></ruby>时执行的操作。当 Java 应用程序创建一个你编写的类的实例时，它将检查构造器。如果（该类）存在构造器，则 Java 在创建实例时将运行构造器中的代码。这几句话中包含了大量的技术术语，但是当你看到它的实际应用时就会更加清楚，所以请确保你已经[安装了 Java][5] 并准备好进行演示。

### 没有使用构造器的开发日常

如果你正在编写 Java 代码，那么你已经在使用构造器了，即使你可能不知道它。Java 中的所有类都有一个构造器，因为即使你没有创建构造器，Java 也会在编译代码时为你生成一个。但是，为了进行演示，请忽略 Java 提供的隐藏构造器（因为默认构造器不添加任何额外的功能），并观察没有显式构造器的情况。

假设你正在编写一个简单的 Java 掷骰子应用程序，因为你想为游戏生成一个伪随机数。

首先，你可以创建骰子类来表示一个骰子。你玩了很久[《龙与地下城》][6]，所以你决定创建一个 20 面的骰子。在这个示例代码中，变量 `dice` 是整数 20，表示可能的最大掷骰数（一个 20 边骰子的掷骰数不能超过 20）。变量 `roll` 是最终的随机数的占位符，`rand` 用作随机数种子。

```
import java.util.Random;

public class DiceRoller {
  private int dice = 20;
  private int roll;
  private Random rand = new Random();
```

接下来，在 `DiceRoller` 类中创建一个函数，以执行计算机模拟模子滚动所必须采取的步骤：从 `rand` 中获取一个整数并将其分配给 `roll`变量，考虑到 Java 从 0 开始计数但 20 面的骰子没有 0 值的情况，`roll` 再加 1 ，然后打印结果。

```
import java.util.Random;

public class DiceRoller {
  private int dice = 20;
  private int roll;
  private Random rand = new Random();
```

最后，产生 `DiceRoller` 类的实例并调用其关键函数 `Roller`：

```
// main loop
public static void main (String[] args) {
  System.out.printf("You rolled a ");

  DiceRoller App = new DiceRoller();
  App.Roller();
  }
}
```

只要你安装了 Java 开发环境（如 [OpenJDK][10]），你就可以在终端上运行你的应用程序：

```
$ java dice.java
You rolled a 12
```

在本例中，没有显式构造器。这是一个非常有效和合法的 Java 应用程序，但是它有一点局限性。例如，如果你把游戏《龙与地下城》放在一边，晚上去玩一些《快艇骰子》，你将需要六面骰子。在这个简单的例子中，更改代码不会有太多的麻烦，但是在复杂的代码中这不是一个现实的选择。解决这个问题的一种方法是使用构造器。

### 构造函数的作用

这个示例项目中的 `DiceRoller` 类表示一个虚拟骰子工厂：当它被调用时，它创建一个虚拟骰子，然后进行“滚动”。然而，通过编写一个自定义构造器，你可以让掷骰子的应用程序询问你希望模拟哪种类型的骰子。

大部分代码都是一样的，除了构造器接受一个表示面数的数字参数。这个数字还不存在，但稍后将创建它。

```
import java.util.Random;

public class DiceRoller {
  private int dice;  
  private int roll;
  private Random rand = new Random();

  // constructor
  public DiceRoller(int sides) {
    dice = sides;
  }
```

模拟滚动的函数保持不变：

```
public void Roller() {
  roll = rand.nextInt(dice);
  roll += 1;
  System.out.println (roll);
}
```

代码的主要部分提供运行应用程序时提供的任何参数。这的确会是一个复杂的应用程序，你需要仔细解析参数并检查意外结果，但对于这个例子，唯一的预防措施是将参数字符串转换成整数类型。

```
public static void main (String[] args) {
  System.out.printf("You rolled a ");
  DiceRoller App = new DiceRoller( Integer.parseInt(args[0]) );
  App.Roller();
}
```

启动这个应用程序，并提供你希望骰子具有的面数：

```
$ java dice.java 20
You rolled a 10
$ java dice.java 6
You rolled a 2
$ java dice.java 100
You rolled a 44
```

构造器已接受你的输入，因此在创建类实例时，会将 `sides` 变量设置为用户指定的任何数字。

构造器是编程的功能强大的组件。练习用它们来解开了 Java 的全部潜力。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/what-java-constructor

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[laingke](https://github.com/laingke)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/build_structure_tech_program_code_construction.png?itok=nVsiLuag
[2]: https://opensource.com/resources/python
[3]: https://opensource.com/article/17/4/pyqt-versus-wxpython
[4]: https://opensource.com/resources/java
[5]: https://openjdk.java.net/install/index.html
[6]: https://opensource.com/article/19/5/free-rpg-day
[7]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+random
[8]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
[9]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[10]: https://openjdk.java.net/
[11]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+integer

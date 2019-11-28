[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11620-1.html)
[#]: subject: (7 Java tips for new developers)
[#]: via: (https://opensource.com/article/19/10/java-basics)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

给新手 Java 开发者的 7 点提示
======

> 如果你才刚开始学习 Java 编程，这里有七个你需要知道的基础知识。

![](https://img.linux.net.cn/data/attachment/album/201911/28/120421di3744urqnyyr6xi.jpg)

Java 是一个多功能的编程语言，在某种程度上，它用在几乎所有可能涉及计算机的行业了里。Java 的最大优势是，它运行在一个 Java 虚拟机（JVM）中，这是一个翻译 Java 代码为与操作系统兼容的字节码的层。只要有 JVM 存在于你的操作系统上 —— 不管这个操作系统是在一个服务器（或“[无服务器][2]”，也是同样的）、桌面电脑、笔记本电脑、移动设备，或嵌入式设备 —— 那么，Java 应用程序就可以运行在它上面。

这使得 Java 成为程序员和用户的一种流行语言。程序员知道，他们只需要写一个软件版本就能最终得到一个可以运行在任何平台上的应用程序；用户知道，应用程序可以运行在他们的计算机上，而不用管他们使用的是什么样的操作系统。

很多语言和框架是跨平台的，但是没有实现同样的抽象层。使用 Java，你针对的是 JVM，而不是操作系统。对于程序员，当面对一些编程难题时，这是阻力最小的线路，但是它仅在当你知道如何编程 Java 时有用。如果你刚开始学习 Java 编程，这里有你需要知道的七个基础的提示。

但是，首先，如果你不确定是否你安装了 Java ，你可以在一个终端（例如 [Bash][3] 或 [PowerShell][4]）中找出来，通过运行：

```
$ java --version
openjdk 12.0.2 2019-07-16
OpenJDK Runtime Environment 19.3 (build 12.0.2+9)
OpenJDK 64-Bit Server VM 19.3 (build 12.0.2+9, mixed mode, sharing)
```

如果你得到一个错误，或未返回任何东西，那么你应该安装 [Java 开发套件][5]（JDK）来开始 Java 开发。或者，安装一个 Java 运行时环境（JRE），如果你只是需要来运行 Java 应用程序。

### 1、Java 软件包

在 Java 语言中，相关的类被分组到一个*软件包*中。当你下载 JDK 时所获得的 Java 基础库将被分组到以 `java` 或 `javax` 开头的软件包中。软件包提供一种类似于计算机上的文件夹的功能：它们为相关的元素提供结构和定义（以编程术语说，*命名空间*）。额外的软件包可以从独立开发者、开源项目和商业供应商获得，就像可以为任何编程语言获得库一样。

当你写一个 Java 程序时，你应该在你的代码是顶部声明一个软件包名称。如果你只是编写一个简单的应用程序来入门 Java，你的软件包名称可以简单地用你的项目名称。如果你正在使用一个 Java 集成开发环境，如 [Eclipse][6]，当你启动一个新的项目时，它为你生成一个合乎情理的软件包名称。

```
package helloworld;

/**
 * @author seth
 * An application written in Java.
 */
```

除此之外，你可以通过查找它相对于你的项目整体的路径来确定你的软件包名称。例如，如果你正在写一组类来帮助游戏开发，并且该集合被称为 `jgamer`，那么你可能在其中有一些唯一的类。

```
package jgamer.avatar;

/**
 * @author seth
 * An imaginary game library.
 */
```

你的软件包的顶层是 `jgamer`，并且在其内部中每个软件包都是一个独立的派生物，例如 `jgamer.avatar` 和 `jgamer.score` 等等。在你的文件系统里，其目录结构反映了这一点，`jgamer` 是包含文件 `avatar.java` 和  `score.java` 的顶级目录。

### 2、Java 导入

作为一名通晓多种语言的程序员，最大的乐趣是找出是否用 `include`、`import`、`use`、`require`，或一些其它术语来引入你不管使用何种编程语言编写的库。在 Java 中，顺便说一句，当导入你的代码的需要的库时，使用 `import` 关键字。

```
package helloworld;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

/**
 * @author seth
 * A GUI hello world.
 */
```

导入是基于该环境的 Java 路径。如果 Java 不知道 Java 库存储在系统上的何处，那么，就不能成功导入。只要一个库被存储在系统的 Java 路径中，那么导入能够成功，并且库能够被用于构建和运行一个 Java 应用程序。

如果一个库并不在 Java 路径中（因为，例如，你正在写你自己的库），那么该库可以与你的应用程序绑定在一起（协议许可），以便导入可以按预期地工作。

### 3、Java 类

Java 类使用关键字 `public class` 声明，以及一个唯一的对应于它的文件名的类名。例如，在项目 `helloworld` 中的一个文件 `Hello.java` 中：

```
package helloworld;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

/**
 * @author seth
 * A GUI hello world.
 */

public class Hello {
        // this is an empty class
}
```

你可以在一个类内部声明变量和函数。在 Java 中，在一个类中的变量被称为*字段*。

### 4、Java 方法

Java 的方法本质上是对象中的函数。基于预期返回的数据类型（例如 `void`、`int`、`float` 等等），它们被定义为 `public`（意味着它们可以被任何其它类访问）或 `private`（限制它们的使用）。


```
    public void helloPrompt(ActionEvent event) {
        String salutation = "Hello %s";
 
        string helloMessage = "World";
        message = String.format(salutation, helloMessage);
        JOptionPane.showMessageDialog(this, message);
    }
 
    private int someNumber (x) {
        return x*2;
    }
```

当直接调用一个方法时，以其类和方法名称来引用。例如，`Hello.someNumber` 指向在 `Hello` 类中的 `someNumber` 方法。

### 5、static

Java 中的 `static` 关键字使代码中的成员可以独立于包含其的对象而被访问。

在面向对象编程中，你编写的代码用作“对象”的模板，这些对象在应用程序运行时产生。例如，你不需要编写一个具体的窗口，而是编写基于 Java 中的窗口类的窗口实例（并由你的代码修改）。由于在应用程序生成它的实例之前，你编写的所有代码都不会“存在”，因此在创建它们所依赖的对象之前，大多数方法和变量（甚至是嵌套类）都无法使用。

然而，有时，在对象被通过应用程序创建前，你需要访问或使用其中的数据。（例如，除非事先知道球是红色时，应用程序无法生成一个红色的球）。对于这些情况，请使用 `static` 关键字。

### 6、try 和 catch

Java 擅长捕捉错误，但是，只有你告诉它遇到错误时该做什么，它才能优雅地恢复。在 Java 中，尝试执行一个动作的级联层次结构以 `try` 开头，出现错误时回落到 `catch`，并以 `finally` 结束。如果 `try` 子句失败，则将调用 `catch`，最后，不管结果如何，总是由 `finally` 来执行一些合理的动作。这里是一个示例：

```
try {
        cmd = parser.parse(opt, args); 
       
        if(cmd.hasOption("help")) {
                HelpFormatter helper = new HelpFormatter();
                helper.printHelp("Hello <options>", opt);
                System.exit(0);
                }
        else {
                if(cmd.hasOption("shell") || cmd.hasOption("s")) {
                String target = cmd.getOptionValue("tgt");
                } // else
        } // fi
} catch (ParseException err) {
        System.out.println(err);
        System.exit(1);
        } //catch
        finally {
                new Hello().helloWorld(opt);
        } //finally
} //try
```

这是一个健壮的系统，它试图避免无法挽回的错误，或者，至少，为你提供让用户提交有用的反馈的选项。经常使用它，你的用户将会感谢你！

### 7、运行 Java 应用程序

Java 文件，通常以 `.java` 结尾，理论上说，可以使用 `java` 命令运行。然而，如果一个应用程序很复杂，运行一个单个文件是否会产生有意义的结果是另外一个问题。

来直接运行一个 `.java` 文件：

```
$ java ./Hello.java
```

通常，Java 应用程序以 Java 存档（JAR）文件的形式分发，以 `.jar` 结尾。一个 JAR 文件包含一个清单文件（可以指定主类、项目结构的一些元数据），以及运行应用程序所需的所有代码部分。

要运行一个 JAR 文件，你可以双击它的图标（取决于你的操作系统设置），你也可以从终端中启动它：

```
$ java -jar ./Hello.jar
```

### 适合所有人的 Java

Java 是一种强大的语言，由于有了 [OpenJDK][12] 项目及其它的努力，它是一种开放式规范，允许像 [IcedTea][13]、[Dalvik][14] 和 [Kotlin][15] 项目的茁壮成长。学习 Java 是一种准备在各种行业中工作的好方法，而且，[使用 Java 的理由很多][16]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/java-basics

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_cafe_brew_laptop_desktop.jpg?itok=G-n1o1-o (Coffee and laptop)
[2]: https://www.redhat.com/en/resources/building-microservices-eap-7-reference-architecture
[3]: https://www.gnu.org/software/bash/
[4]: https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-6
[5]: http://openjdk.java.net/
[6]: http://www.eclipse.org/
[7]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+actionevent
[8]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[9]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+joptionpane
[10]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
[11]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+parseexception
[12]: https://openjdk.java.net/
[13]: https://icedtea.classpath.org/wiki/Main_Page
[14]: https://source.android.com/devices/tech/dalvik/
[15]: https://kotlinlang.org/
[16]: https://opensource.com/article/19/9/why-i-use-java

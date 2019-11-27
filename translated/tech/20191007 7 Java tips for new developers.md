[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (7 Java tips for new developers)
[#]: via: (https://opensource.com/article/19/10/java-basics)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

给新 Java 开发者的 7 点提示
======
如果你只是刚刚开始 Java 编程，这里有七个你需要知道的基础知识。
![Coffee and laptop][1]

Java 是一个多功能的编程语言，在某种程度上，是一种通用的编程语言，在某种程度上，在几乎所有可能涉及计算机的行业。 Java 的最大优势是，它运行在一个 Java 虚拟机(JVM)中，一个翻译 Java 代码为操作系统兼容的字节码的层。只要有一个 JVM 存在于你的操作系统上，不管这个操作系统是在一个服务器 (或 [无服务器][2], 也是同样的), 桌面电脑，笔记本电脑，移动设备，或嵌入式设备，那么，一个 Java 应用程序可以运行在它上面。

这使得 Java 成为程序员和用户中间的一种流行语言。程序员知道，他们只需要写一个软件版本就能最终得到一个在任何平台上运行是应用程序，用户知道，一个应用程序将运行在他们的计算机上运行，而不用管他们使用什么样的操作系统。

很多语言和框架是跨平台的，但是没有实现同样的抽象层。使用 Java ，你的目标是 JVM ，而不是操作系统。对于程序员，当面对一些编程难题时，这些是阻力最小的线路，但是它仅在当你知道如何编程 Java 时有用。如果你刚开始 Java 编程，这里有你需要知道是七个基础的提示。

但是，首先，如果你不确定是否你安装了 Java ，你可以在一个终端(例如 [Bash][3] 或 [PowerShell][4]) 中找出来，通过运行：


```
$ java --version
openjdk 12.0.2 2019-07-16
OpenJDK Runtime Environment 19.3 (build 12.0.2+9)
OpenJDK 64-Bit Server VM 19.3 (build 12.0.2+9, mixed mode, sharing)
```

如果你获得一个错误，或未返回任何东西，那么你应该安装 [Java Development Kit][5] (JDK) 来开始 Java 开发。或者，安装一个 Java 运行时环境 ****(JRE) ，如果你只需要来运行 Java 应用程序。

### 1\. Java 软件包

在 Java 语言中，相关的类被分组到一个 _软件包_ 中。当你下载 JDK 时所获得的基本的 Java 库将被分组到以 **java** 或 **javax** 开头的软件包中。软件包提供一种类似于计算机上的文件夹的功能：它们为相关的元素提供结构和定义 (在编程术语中， _命名空间_)。额外的软件包可以从独立的代码，开源项目和商业供应商获得，就想可以为任何编程语言获得库一样。

当你写一个 Java 程序时，你应该在你的代码是顶部声明一个软件包。 如果你只是编写一个简单的应用程序来开始 Java ，你的软件包名称可以和你的项目的名称一样简单。如果你正在使用一个 Java 集成开发环境，像 [Eclipse][6] ，当你启动一个新的项目时，它为你生成一个合乎情理的软件包名称。


```
package helloworld;

/**
 * @author seth
 * An application written in Java.
 */
```

除此之外，你可以通过查找它的关系到你的项目的广泛定义的路径来查明你的软件包的名称。例如，如果你正在写一组类来帮助游戏开发，并且集合被称为 **jgamer** ，那么你可能在其中有一些唯一的类。


```
package jgamer.avatar;

/**
 * @author seth
 * An imaginary game library.
 */
```

你的软件包的顶层是 **jgamer** ，并且在其内部中每个软件包都是一个独立的派生物，例如 **jgamer.avatar** 和 **jgamer.score** 等等。在你的文件系统找那个，该结构反映这一点，**jgamer** 是包含文件 **avatar.java** 和  **score.java** 的顶级目录。

### 2\. Java 导入

作为一名通晓多种语言的程序员，最大的乐趣是尝试是否跟踪 **include** ， **import** ， **use** ， **require** ，或 **一些其它术语** 。无论你正在使用何种编程语言编写一个库。在 Java 中，对于记录，当导入你的代码的需要的库时，使用 **import** 关键字。


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

导入工作基于一个环境的 Java 路径。如果 Java 不知道Java 库存储在系统上的何处，那么，导入可能不成功。只要一个库被存储在系统的 Java 路径中，那么导入能够成功，并且库能够被用于构建和运行一个 Java 应用程序。

如果不希望一个库在 Java 路径中(因为，例如，你正在写你自己的库)，那么库可以与你的应用程序绑定在一起(协议许可)，以便导入工作按预期工作。

### 3\. Java 类

一个 Java 类被使用关键字 **public class** 声明，以及一个唯一的反应它的文件名称的类名称。例如，在项目 **helloworld** 中的一个文件**Hello.java** 中：


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

你可以在一个类内部声明变量和函数。在 Java 中，在一个类中的变量被称为 _终端_ 。

### 4\. Java 方法

Java 方法本质上是在一个对象中的函数。 基于预期返回的数据类型，它们被定义为 **public** (意味着它们可以被任何其它类访问) 或 **private** (限制它们使用)，例入 **void** ， **int** ， **float** 等等。


```
    public void helloPrompt([ActionEvent][7] event) {
        [String][8] salutation = "Hello %s";
 
        string helloMessage = "World";
        message = [String][8].format(salutation, helloMessage);
        [JOptionPane][9].showMessageDialog(this, message);
    }
 
    private int someNumber (x) {
        return x*2;
    }
```

当直接调用一个方法时，它被它的类和方法名称引用。例如， **Hello.someNumber** 指向在 **Hello** 类中的 **someNumber** 方法。

### 5\. 静态的

在 Java 中的 **static** 关键字使在你的代码中的一个成员独立地访问包含它的对象。

在面向对象编程中，在应用程序运行时，你所编写代码将作为所生成“对象”的一个模板。你不需要编写一个明确的窗口，例如，在 Java(和你所修改的代码)中，基于一个窗口类的一个窗口的一个 _实例_ 。因为，你所编码的东西将不“存在”，直到应用程序生成它的一个实例为止，大多数的方法和变量(和甚至嵌套类)将不能被使用，直到它们依赖的对象在被创建为止。

然而，有时，在它被通过应用程序创建前，你需要访问或使用在一个对象中的数据。(例如，没有事先知道球是红色时，一个应用程序不能生成一个红色的球)。对于这些情况，这里有 **static** 关键字。

### 6\. Try 和 catch

Java 擅长捕捉错误，但是，你告诉它做什么，它才能优雅地恢复。在 Java 中，以 **try** 开头来尝试级联层次结构执行一个动作，略微退回到 **catch** ，并以 **finally** 结尾。可能 **try** 分句会不执行，那么 **catch** 被引用，在结尾，不管结果如何，总是由 **finally** 来执行一些合理的动作。这里是一个示例：


```
try {
        cmd = parser.parse(opt, args); 
       
        if(cmd.hasOption("help")) {
                HelpFormatter helper = new HelpFormatter();
                helper.printHelp("Hello &lt;options&gt;", opt);
                [System][10].exit(0);
                }
        else {
                if(cmd.hasOption("shell") || cmd.hasOption("s")) {
                [String][8] target = cmd.getOptionValue("tgt");
                } // else
        } // fi
} catch ([ParseException][11] err) {
        [System][10].out.println(err);
        [System][10].exit(1);
        } //catch
        finally {
                new Hello().helloWorld(opt);
        } //finally
} //try
```

它是一个健壮的系统，它试图避免无法挽回的错误，或者，至少，向你提供给予用户有用的反馈的选项。经常使用它，你的用户将会感谢你！

### 7\. 运行一个 Java 应用程序

Java 文件，通常以 **.java** 结尾，理论上说，可以使用 **java** 命令运行。然而，如果一个应用程序是复杂的，运行一个单个文件是否会造成有意义的事将是另外一个问题。

来直接运行一个 **.java** 文件：


```
`$ java ./Hello.java`
```

通常，Java 应用程序以 Java 存档 (JAR) 文件的形式分发，以 **.jar** 结尾。一个 JAR 文件包含一个 manifest 文件，指定主类，项目结构的一些元数据，以及运行应用程序所需的你的代码的所有部分。

为运行一个 JAR 文件，你可以双击它的图标(取决于你的操作系统设置), 或者，你可以从一个终端中启动它：


```
`$ java -jar ./Hello.jar`
```

### 面向所有人的 Java

Java 是一种强大的的原因，归因于 [OpenJDK][12] 项目和其它的新方案，它是一种开放式规范，允许像 [IcedTea][13]， [Dalvik][14]，和 [Kotlin][15] 项目的茁壮成长。学习 Java 是一种准备在各种行业中工作的极好的方法，另外，这里有很多[极好的原因来使用它][16]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/java-basics

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

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

[#]: collector: (lujun9972)
[#]: translator: (arrowfeng)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11208-1.html)
[#]: subject: (Understanding software design patterns)
[#]: via: (https://opensource.com/article/19/7/understanding-software-design-patterns)
[#]: author: (Bryant Son https://opensource.com/users/brsonhttps://opensource.com/users/erezhttps://opensource.com/users/brson)

理解软件设计模式
======
> 设计模式可以帮助消除冗余代码。学习如何利用 Java 使用单例模式、工厂模式和观察者模式。

![](https://img.linux.net.cn/data/attachment/album/201908/10/080849ygyqtrw88f2qtzk4.jpg)

如果你是一名正在致力于计算机科学或者相关学科的程序员或者学生，很快，你将会遇到一条术语 “<ruby>软件设计模式<rt>software design pattern</rt></ruby>”。根据维基百科，“*[软件设计模式][2]是在平常的软件设计工作中所遭遇的问题的一种通用的、可重复使用的解决方案*”。我对该定义的理解是：当在从事于一个编码项目时，你经常会思考，“嗯，这里貌似是冗余代码，我觉得是否能改变这些代码使之更灵活和便于修改？”因此，你会开始考虑怎样分割那些保持不变的内容和需要经常改变的内容。

> **设计模式**是一种通过分割那些保持不变的部分和经常变化的部分，让你的代码更容易修改的方法。

不出意外的话，每个从事编程项目的人都可能会有同样的思考。特别是那些工业级别的项目，在那里通常工作着数十甚至数百名开发者；协作过程表明必须有一些标准和规则来使代码更加优雅并适应变化。这就是为什么我们有了 [面向对象编程][3]（OOP）和 [软件框架工具][4]。设计模式有点类似于 OOP，但它通过将变化视为自然开发过程的一部分而进一步发展。基本上，设计模式利用了一些 OOP 的思想，比如抽象和接口，但是专注于改变的过程。

当你开始开发项目时，你经常会听到这样一个术语*重构*，它意味着*通过改变代码使它变得更优雅和可复用*；这就是设计模式耀眼的地方。当你处理现有代码时（无论是由其他人构建还是你自己过去构建的），了解设计模式可以帮助你以不同的方式看待事物，你将发现问题以及改进代码的方法。

有很多种设计模式，其中单例模式、工厂模式和观察者模式三种最受欢迎，在这篇文章中我将会一一介绍它们。

### 如何遵循本指南

无论你是一位有经验的编程工作者还是一名刚刚接触的新手，我想让这篇教程让每个人都很容易理解。设计模式概念并不容易理解，减少开始旅程时的学习曲线始终是首要任务。因此，除了这篇带有图表和代码片段的文章外，我还创建了一个 [GitHub 仓库][5]，你可以克隆仓库并在你的电脑上运行这些代码来实现这三种设计模式。你也可以观看我创建的 [YouTube视频][6]。

#### 必要条件

如果你只是想了解一般的设计模式思想，则无需克隆示例项目或安装任何工具。但是，如果要运行示例代码，你需要安装以下工具：

  * **Java 开发套件（JDK）**：我强烈建议使用 [OpenJDK][7]。
  * **Apache Maven**：这个简单的项目使用 [Apache Maven][8] 构建；好的是许多 IDE 自带了Maven。
  * **交互式开发编辑器（IDE）**：我使用 [社区版 IntelliJ][9]，但是你也可以使用 [Eclipse IDE][10] 或者其他你喜欢的 Java IDE。
  * **Git**：如果你想克隆这个工程，你需要 [Git][11] 客户端。

安装好 Git 后运行下列命令克隆这个工程：

```
git clone https://github.com/bryantson/OpensourceDotComDemos.git
```

然后在你喜欢的 IDE 中，你可以将 TopDesignPatterns 仓库中的代码作为 Apache Maven 项目导入。

我使用的是 Java，但你也可以使用支持[抽象原则][12]的任何编程语言来实现设计模式。

### 单例模式：避免每次创建一个对象

<ruby>[单例模式][13]<rt>singleton pattern</rt></ruby>是非常流行的设计模式，它的实现相对来说很简单，因为你只需要一个类。然而，许多开发人员争论单例设计模式的是否利大于弊，因为它缺乏明显的好处并且容易被滥用。很少有开发人员直接实现单例；相反，像 Spring Framework 和 Google Guice 等编程框架内置了单例设计模式的特性。

但是了解单例模式仍然有巨大的用处。单例模式确保一个类仅创建一次且提供了一个对它的全局访问点。

> **单例模式**：确保仅创建一个实例且避免在同一个项目中创建多个实例。

下面这幅图展示了典型的类对象创建过程。当客户端请求创建一个对象时，构造函数会创建或者实例化一个对象并调用方法返回这个类给调用者。但是每次请求一个对象都会发生这样的情况：构造函数被调用，一个新的对象被创建并且它返回了一个独一无二的对象。我猜面向对象语言的创建者有每次都创建一个新对象的理由，但是单例过程的支持者说这是冗余的且浪费资源。

![Normal class instantiation][14]

下面这幅图使用单例模式创建对象。这里，构造函数仅当对象首次通过调用预先设计好的 `getInstance()` 方法时才会被调用。这通常通过检查该值是否为 `null` 来完成，并且这个对象被作为私有变量保存在单例类的内部。下次 `getInstance()` 被调用时，这个类会返回第一次被创建的对象。而没有新的对象产生；它只是返回旧的那一个。

![Singleton pattern instantiation][15]

下面这段代码展示了创建单例模式最简单的方法：

```
package org.opensource.demo.singleton;

public class OpensourceSingleton {

    private static OpensourceSingleton uniqueInstance;

    private OpensourceSingleton() {
    }

    public static OpensourceSingleton getInstance() {
        if (uniqueInstance == null) {
            uniqueInstance = new OpensourceSingleton();
        }
        return uniqueInstance;
    }

}
```

在调用方，这里展示了如何调用单例类来获取对象：

```
Opensource newObject = Opensource.getInstance();
```

这段代码很好的验证了单例模式的思想：

  1. 当 `getInstance()` 被调用时，它通过检查 `null` 值来检查对象是否已经被创建。
  2. 如果值为 `null`，它会创建一个新对象并把它保存到私有域，返回这个对象给调用者。否则直接返回之前被创建的对象。

单例模式实现的主要问题是它忽略了并行进程。当多个进程使用线程同时访问资源时，这个问题就产生了。对于这种情况有对应的解决方案，它被称为*双重检查锁*，用于多线程安全，如下所示：

```
package org.opensource.demo.singleton;

public class ImprovedOpensourceSingleton {

    private volatile static ImprovedOpensourceSingleton uniqueInstance;

    private ImprovedOpensourceSingleton() {}

    public static ImprovedOpensourceSingleton getInstance() {
        if (uniqueInstance == null) {
            synchronized (ImprovedOpensourceSingleton.class) {
                if (uniqueInstance == null) {
                    uniqueInstance = new ImprovedOpensourceSingleton();
                }
            }
        }
        return uniqueInstance;
    }

}
```

再强调一下前面的观点，确保只有在你认为这是一个安全的选择时才直接实现你的单例模式。最好的方法是通过使用一个制作精良的编程框架来利用单例功能。

### 工厂模式：将对象创建委派给工厂类以隐藏创建逻辑

<ruby>[工厂模式][16]<rt>factory pattern</rt></ruby>是另一种众所周知的设计模式，但是有一小点复杂。实现工厂模式的方法有很多，而下列的代码示例为最简单的实现方式。为了创建对象，工厂模式定义了一个接口，让它的子类去决定实例化哪一个类。

> **工厂模式**：将对象创建委派给工厂类，因此它能隐藏创建逻辑。

下列的图片展示了最简单的工厂模式是如何实现的。

![Factory pattern][17]

客户端请求工厂类创建类型为 x 的某个对象，而不是客户端直接调用对象创建。根据其类型，工厂模式决定要创建和返回的对象。

在下列代码示例中，`OpensourceFactory` 是工厂类实现，它从调用者那里获取*类型*并根据该输入值决定要创建和返回的对象：

```
package org.opensource.demo.factory;

public class OpensourceFactory {

    public OpensourceJVMServers getServerByVendor([String][18] name) {
        if(name.equals("Apache")) {
            return new Tomcat();
        }
        else if(name.equals("Eclipse")) {
            return new Jetty();
        }
        else if (name.equals("RedHat")) {
            return new WildFly();
        }
        else {
            return null;
        }
    }
}
```

`OpenSourceJVMServer` 是一个 100% 的抽象类（即接口类），它指示要实现的是什么，而不是怎样实现：

```
package org.opensource.demo.factory;

public interface OpensourceJVMServers {
    public void startServer();
    public void stopServer();
    public [String][18] getName();
}
```

这是一个 `OpensourceJVMServers` 类的实现示例。当 `RedHat` 被作为类型传递给工厂类，`WildFly` 服务器将被创建：

```
package org.opensource.demo.factory;

public class WildFly implements OpensourceJVMServers {
    public void startServer() {
        [System][19].out.println("Starting WildFly Server...");
    }

    public void stopServer() {
        [System][19].out.println("Shutting Down WildFly Server...");
    }

    public [String][18] getName() {
        return "WildFly";
    }
}
```

### 观察者模式：订阅主题并获取相关更新的通知

最后是<ruby>[观察者模式][20]<rt>observer pattern</rt></ruby>。像单例模式那样，很少有专业的程序员直接实现观察者模式。但是，许多消息队列和数据服务实现都借用了观察者模式的概念。观察者模式在对象之间定义了一对多的依赖关系，当一个对象的状态发生改变时，所有依赖它的对象都将被自动地通知和更新。

> **观察者模式**：如果有更新，那么订阅了该话题/主题的客户端将被通知。

理解观察者模式的最简单方法是想象一个邮件列表，你可以在其中订阅任何主题，无论是开源、技术、名人、烹饪还是您感兴趣的任何其他内容。每个主题维护者一个它的订阅者列表，在观察者模式中它们相当于观察者。当某一个主题更新时，它所有的订阅者（观察者）都将被通知这次改变。并且订阅者总是能取消某一个主题的订阅。

如下图所示，客户端可以订阅不同的主题并添加观察者以获得最新信息的通知。因为观察者不断的监听着这个主题，这个观察者会通知客户端任何发生的改变。

![Observer pattern][21]

让我们来看看观察者模式的代码示例，从主题/话题类开始：

```
package org.opensource.demo.observer;

public interface Topic {

    public void addObserver([Observer][22] observer);
    public void deleteObserver([Observer][22] observer);
    public void notifyObservers();
}
```

这段代码描述了一个为不同的主题去实现已定义方法的接口。注意一个观察者如何被添加、移除和通知的。

这是一个主题的实现示例：

```
package org.opensource.demo.observer;

import java.util.List;
import java.util.ArrayList;

public class Conference implements Topic {
    private List&lt;Observer&gt; listObservers;
    private int totalAttendees;
    private int totalSpeakers;
    private [String][18] nameEvent;

    public Conference() {
        listObservers = new ArrayList&lt;Observer&gt;();
    }

    public void addObserver([Observer][22] observer) {
        listObservers.add(observer);
    }

    public void deleteObserver([Observer][22] observer) {
        int i = listObservers.indexOf(observer);
        if (i &gt;= 0) {
            listObservers.remove(i);
        }
    }

    public void notifyObservers() {
        for (int i=0, nObservers = listObservers.size(); i &lt; nObservers; ++ i) {
            [Observer][22] observer = listObservers.get(i);
            observer.update(totalAttendees,totalSpeakers,nameEvent);
        }
    }

    public void setConferenceDetails(int totalAttendees, int totalSpeakers, [String][18] nameEvent) {
        this.totalAttendees = totalAttendees;
        this.totalSpeakers = totalSpeakers;
        this.nameEvent = nameEvent;
        notifyObservers();
    }
}
```

这段代码定义了一个特定主题的实现。当发生改变时，这个实现调用它自己的方法。注意这将获取观察者的数量，它以列表方式存储，并且可以通知和维护观察者。

这是一个观察者类：

```
package org.opensource.demo.observer;

public interface [Observer][22] {
    public void update(int totalAttendees, int totalSpeakers, [String][18] nameEvent);
}
```

这个类定义了一个接口，不同的观察者可以实现该接口以执行特定的操作。

例如，实现了该接口的观察者可以在会议上打印出与会者和发言人的数量：

```
package org.opensource.demo.observer;

public class MonitorConferenceAttendees implements [Observer][22] {
    private int totalAttendees;
    private int totalSpeakers;
    private [String][18] nameEvent;
    private Topic topic;

    public MonitorConferenceAttendees(Topic topic) {
        this.topic = topic;
        topic.addObserver(this);
    }

    public void update(int totalAttendees, int totalSpeakers, [String][18] nameEvent) {
        this.totalAttendees = totalAttendees;
        this.totalSpeakers = totalSpeakers;
        this.nameEvent = nameEvent;
        printConferenceInfo();
    }

    public void printConferenceInfo() {
        [System][19].out.println(this.nameEvent + " has " + totalSpeakers + " speakers and " + totalAttendees + " attendees");
    }
}
```

### 接下来

现在你已经阅读了这篇对于设计模式的介绍引导，你还可以去寻求了解其他设计模式，例如外观模式，模版模式和装饰器模式。也有一些并发和分布式系统的设计模式如断路器模式和锚定模式。

可是，我相信最好的磨砺你的技能的方式首先是通过在你的业余项目或者练习中实现这些设计模式。你甚至可以开始考虑如何在实际项目中应用这些设计模式。接下来，我强烈建议你查看 OOP 的 [SOLID 原则][23]。之后，你就准备好了解其他设计模式。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/understanding-software-design-patterns

作者：[Bryant Son][a]
选题：[lujun9972][b]
译者：[arrowfeng](https://github.com/arrowfeng)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/brsonhttps://opensource.com/users/erezhttps://opensource.com/users/brson
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003601_05_mech_osyearbook2016_cloud_cc.png?itok=XSV7yR9e (clouds in the sky with blue pattern)
[2]: https://en.wikipedia.org/wiki/Software_design_pattern
[3]: https://en.wikipedia.org/wiki/Object-oriented_programming
[4]: https://en.wikipedia.org/wiki/Software_framework
[5]: https://github.com/bryantson/OpensourceDotComDemos/tree/master/TopDesignPatterns
[6]: https://www.youtube.com/watch?v=VlBXYtLI7kE&feature=youtu.be
[7]: https://openjdk.java.net/
[8]: https://maven.apache.org/
[9]: https://www.jetbrains.com/idea/download/#section=mac
[10]: https://www.eclipse.org/ide/
[11]: https://git-scm.com/
[12]: https://en.wikipedia.org/wiki/Abstraction_principle_(computer_programming)
[13]: https://en.wikipedia.org/wiki/Singleton_pattern
[14]: https://opensource.com/sites/default/files/uploads/designpatterns1_normalclassinstantiation.jpg (Normal class instantiation)
[15]: https://opensource.com/sites/default/files/uploads/designpatterns2_singletonpattern.jpg (Singleton pattern instantiation)
[16]: https://en.wikipedia.org/wiki/Factory_method_pattern
[17]: https://opensource.com/sites/default/files/uploads/designpatterns3_factorypattern.jpg (Factory pattern)
[18]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[19]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
[20]: https://en.wikipedia.org/wiki/Observer_pattern
[21]: https://opensource.com/sites/default/files/uploads/designpatterns4_observerpattern.jpg (Observer pattern)
[22]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+observer
[23]: https://en.wikipedia.org/wiki/SOLID

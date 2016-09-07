安卓平台上的依赖注入 - 第一部分
===========================

![](https://d262ilb51hltx0.cloudfront.net/max/2000/1*YWlAzAY20KLLGIyyD_mzZw.png)

刚开始学习软件工程的时候，我们经常会碰到像这样的事情：

>软件应该符合 SOLID 原则。

但这句话实际是什么意思？让我们看看 SOLID 中每个字母在架构里所代表的重要含义，例如：

- [S  单职责原则][1]
- [O  开闭原则][2]
- [L  Liskov 替换原则][3]
- [I  接口分离原则][4]
- [D  依赖反转原则][5] 这也是依赖注入的核心概念。

简单来说，我们需要提供一个类，这个类有它所需要的所有对象，以便实现其功能。

### 概述

依赖注入听起来像是描述非常复杂的东西的一个术语，但实际上它很简单，看下面这个例子你就明白了：

```
class NoDependencyInjection {
  private Dependency d;
  
  public NoDependencyInjection() {
    d = new Dependency();
  }
}

class DependencyInjection {
  private Dependency d;
  
  public DependencyInjection(Dependency d) {
    this.d = d;
  }
}
```

正如我们所见，第一种情况是我们在构造器里创建了依赖对象，但在第二种情况下，它作为参数被传递给构造器，这就是我们所说的依赖注入。这样做是为了让我们所写的类不依靠特定依赖关系的实现，却能直接使用它。

参数传递的目标是构造器，我们就称之为构造器依赖注入；或者是某个方法，就称之为方法依赖注入：

```
class Example {
  private ConstructorDependency cd;
  private MethodDependency md;
  Example(ConstructorDependency cd) {
    this.cd = cd; //Constructor Dependency Injection
  }
  
  public setMethodDependency(MethodDependency md) {
    this.md = md; //Method Dependency Injection
  }
}
```


要是你想总体深入地了解依赖注入，可以看看由 [Dan Lew][t2] 发表的[精彩的演讲][t1]，事实上是这个演讲启迪了这个概述。

在 Android 平台，当需要框架来处理依赖注入这个特殊的问题时，我们有不同的选择，其中最有名的框架就是 [Dagger 2][t3]。它最开始是由 Square 公司（译者注：Square 是美国一家移动支付公司）里一些很棒的开发者开发出来的，然后慢慢发展成由 Google 自己开发。特别地，Dagger 1 先被开发出来，然后 Big G 接手这个项目，做了很多改动，比如以注释为基础，在编译的时候就完成 Dagger 的任务，也就是第二个版本。

### 导入框架

安装 Dagger 并不难，但需要导入 `android-apt` 插件，通过向项目的根目录下的 build.gradle 文件中添加它的依赖关系：

```
buildscript{
  ...
  dependencies{
    ...
    classpath ‘com.neenbedankt.gradle.plugins:android-apt:1.8’
  }
}
```

然后，我们需要将 `android-apt` 插件应用到项目 build.gradle 文件，放在文件顶部 Android 应用那一句的下一行：

```
apply plugin: ‘com.neenbedankt.android-apt’
```

这个时候，我们只用添加依赖关系，然后就能使用库和注释了：

```
dependencies{
    ...
    compile ‘com.google.dagger:dagger:2.6’ 
    apt ‘com.google.dagger:dagger-compiler:2.6’
    provided ‘javax.annotation:jsr250-api:1.0’
}
```

>需要加上最后一个依赖关系是因为 @Generated 注解在 Android 里还不可用，但它是[原生的 Java 注解][t4]。

### Dagger 模块

要注入依赖，首先需要告诉框架我们能提供什么（比如说上下文）以及特定的对象应该怎样创建。为了完成注入，我们用 `@Module` 注释对一个特殊的类进行了注解（这样 Dagger 就能识别它了），寻找 `@Provide` 标记的方法，生成图表，能够返回我们所请求的对象。

看下面的例子，这里我们创建了一个模块，它会返回给我们 `ConnectivityManager`，所以我们要把 `Context` 对象传给这个模块的构造器。

```
@Module
public class ApplicationModule {
  private final Context context;

  public ApplicationModule(Context context) {
    this.context = context;
  }

  @Provides @Singleton
  public Context providesContext() {
    return context;
  }

  @Provides @Singleton
  public ConnectivityManager providesConnectivityManager(Context context) {
    return (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
  }
}
```

>Dagger 中十分有意思的一点是只用在一个方法前面添加一个 Singleton 注解，就能处理所有从 Java 中继承过来的问题。

### 容器

当我们有一个模块的时候，我们需要告诉 Dagger 想把依赖注入到哪里：我们在一个容器里，一个特殊的注解过的接口里完成依赖注入。我们在这个接口里创造不同的方法，而接口的参数是我们想注入依赖关系的类。

下面给出一个例子并告诉 Dagger 我们想要 `MainActivity` 类能够接受 `ConnectivityManager`（或者在图表里的其它依赖对象）。我们只要做类似以下的事：

```
@Singleton
@Component(modules = {ApplicationModule.class})
public interface ApplicationComponent {

  void inject(MainActivity activity);
}
```

>正如我们所见，@Component 注解有几个参数，一个是所支持的模块的数组，意味着它能提供的依赖。这里既可以是 Context 也可以是 ConnectivityManager，因为他们在 ApplicationModule 类中有声明。

### 使用

这时，我们要做的是尽快创建容器（比如在应用的 onCreate 方法里面）并且返回这个容器，那么类就能用它来注入依赖了：

>为了让框架自动生成 DaggerApplicationComponent，我们需要构建项目以便 Dagger 能够扫描我们的代码库，并且生成我们需要的部分。

在 `MainActivity` 里，我们要做的两件事是用 `@Inject` 注解符对想要注入的属性进行注释，调用我们在 `ApplicationComponent` 接口中声明的方法（请注意后面一部分会因我们使用的注入类型的不同而变化，但这里简单起见我们不去管它），然后依赖就被注入了，我们就能自由使用他们：

```
public class MainActivity extends AppCompatActivity {
  @Inject
  ConnectivityManager manager;

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    ...
    ((App) getApplication()).getComponent().inject(this);
  }
}
```

### 总结

当然了，我们可以手动注入依赖，管理所有不同的对象，但 Dagger 打消了很多有关模板的“噪声”，Dagger 给我们有用的附加品（比如 `Singleton`），而仅用 Java 处理将会很糟糕。

--------------------------------------------------------------------------------

via: https://medium.com/di-101/di-101-part-1-81896c2858a0#.3hg0jj14o

作者:[Roberto Orgiu][a]
译者:[GitFuture](https://github.com/GitFuture)
校对:[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://medium.com/@_tiwiz
[1]: https://en.wikipedia.org/wiki/Single_responsibility_principle
[2]: https://en.wikipedia.org/wiki/Open/closed_principle
[3]: http://liskov_substitution_principle/
[4]: https://en.wikipedia.org/wiki/Interface_segregation_principle
[5]: https://en.wikipedia.org/wiki/Dependency_inversion_principle
[t1]: https://realm.io/news/daniel-lew-dependency-injection-dagger/
[t2]: https://twitter.com/danlew42
[t3]: http://google.github.io/dagger/
[t4]: https://docs.oracle.com/javase/7/docs/api/javax/annotation/Generated.html

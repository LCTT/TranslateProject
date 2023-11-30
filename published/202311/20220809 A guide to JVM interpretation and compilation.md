[#]: subject: "A guide to JVM interpretation and compilation"
[#]: via: "https://opensource.com/article/22/8/interpret-compile-java"
[#]: author: "Jayashree Huttanagoudar https://opensource.com/users/jayashree-huttanagoudar"
[#]: collector: "lkxed"
[#]: translator: "toknow-gh"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16353-1.html"

JVM 解释和编译指南
======

![][0]

> 通过理解解释、即时编译和预先编译之间的区别，有效地使用它们。

Java 是一种跨平台的编程语言。程序源代码会被编译为 <ruby>字节码<rt>bytecode</rt></ruby>，然后字节码在运行时被转换为 <ruby>机器码<rt>machine code</rt></ruby>。<ruby>解释器<rt>interpreter</rt></ruby> 在物理机器上模拟出的抽象计算机上执行字节码指令。<ruby>即时<rt>just-in-time</rt></ruby>（JIT）编译发生在运行期，而 <ruby>预先<rt>ahead-of-time</rt></ruby>（AOT）编译发生在构建期。

本文将说明解释器、JIT 和 AOT 分别何时起作用，以及如何在 JIT 和 AOT 之间权衡。

### 源代码、字节码、机器码

应用程序通常是由 C、C++ 或 Java 等编程语言编写。用这些高级编程语言编写的指令集合称为源代码。源代码是人类可读的。要在目标机器上执行它，需要将源代码转换为机器可读的机器码。这个转换工作通常是由 <ruby>编译器<rt>compiler</rt></ruby> 来完成的。

然而，在 Java 中，源代码首先被转换为一种中间形式，称为字节码。字节码是平台无关的，所以 Java 被称为平台无关编程语言。Java 编译器 `javac` 将源代码转换为字节码。然后解释器解释执行字节码。

下面是一个简单的 Java 程序, `Hello.java`：

```
//Hello.java
public class Hello {
    public static void main(String[] args) {
         System.out.println("Inside Hello World!");
    }
}
```

使用 `javac` 编译它，生成包含字节码的 `Hello.class` 文件。

```
$ javac Hello.java
$ ls
Hello.class  Hello.java
```

现在，使用 `javap` 来反汇编 `Hello.class` 文件的内容。使用 `javap` 时如果不指定任何选项，它将打印基本信息，包括编译这个 `.class` 文件的源文件、包名称、公共和受保护字段以及类的方法。

```
$ javap Hello.class
Compiled from "Hello.java"
public class Hello {
    public Hello();
    public static void main(java.lang.String[]);
}
```

要查看 `.class` 文件中的字节码内容，使用 `-c` 选项：

```
$ javap -c Hello.class
Compiled from "Hello.java"
public class Hello {
  public Hello();
        Code:
           0: aload_0
           1: invokespecial #1                      // Method java/lang/Object."<init>":()V
           4: return

  public static void main(java.lang.String[]);
        Code:
           0: getstatic         #2                      // Field java/lang/System.out:Ljava/io/PrintStream;
           3: ldc               #3                      // String Inside Hello World!
           5: invokevirtual #4                      // Method    
java/io/PrintStream.println:(Ljava/lang/String;)V
           8: return
}
```

要获取更详细的信息，使用 `-v` 选项：

```
$ javap -v Hello.class
```

### 解释器，JIT 和 AOT

解释器负责在物理机器上模拟出的抽象计算机上执行字节码指令。当使用 `javac` 编译源代码，然后使用 `java` 执行时，解释器在程序运行时运行并完成它的目标。

```
$ javac Hello.java
$ java Hello
Inside Hello World!
```

JIT 编译器也在运行期发挥作用。当解释器解释 Java 程序时，另一个称为运行时 <ruby>分析器<rt>profiler</rt></ruby> 的组件将静默地监视程序的执行，统计各部分代码被解释的次数。基于这些统计信息可以检测出程序的 <ruby>热点<rt>hotspot</rt></ruby>，即那些经常被解释的代码。一旦代码被解释次数超过设定的阈值，它们满足被 JIT 编译器直接转换为机器码的条件。所以 JIT 编译器也被称为分析优化的编译器。从字节码到机器码的转换是在程序运行过程中进行的，因此称为即时编译。JIT 减少了解释器将同一组指令模拟为机器码的负担。

AOT 编译器在构建期编译代码。在构建时将需要频繁解释和 JIT 编译的代码直接编译为机器码可以缩短 <ruby>Java 虚拟机<rt>Java Virtual Machine</rt></ruby>（JVM） 的<ruby>预热<rt>warm-up</rt></ruby>时间。（LCTT 译注：Java 程序启动后首先字节码被解释执行，此时执行效率较低。等到程序运行了足够的时间后，代码热点被检测出来，JIT 开始发挥作用，程序运行效率提升。JIT 发挥作用之前的过程就是预热。）AOT 是在 Java 9 中引入的一个实验性特性。`jaotc` 使用 Graal 编译器（它本身也是用 Java 编写的）来实现 AOT 编译。

以 `Hello.java` 为例：

```
//Hello.java
public class Hello {
    public static void main(String[] args) {
        System.out.println("Inside Hello World!");
    }
}


$ javac Hello.java
$ jaotc --output libHello.so Hello.class
$ java -XX:+UnlockExperimentalVMOptions -XX:AOTLibrary=./libHello.so Hello
Inside Hello World!
```

###  解释和编译发生的时机

下面通过例子来展示 Java 在什么时候使用解释器，以及 JIT 和 AOT 何时参与进来。这里有一个简单的程序 `Demo.java` :

```
//Demo.java
public class Demo {
    public int square(int i) throws Exception {
        return(i*i);
    }


    public static void main(String[] args) throws Exception {
        for (int i = 1; i <= 10; i++) {
            System.out.println("call " + Integer.valueOf(i));
            long a = System.nanoTime();
            Int r = new Demo().square(i);
            System.out.println("Square(i) = " + r);
            long b = System.nanoTime();
            System.out.println("elapsed= " + (b-a));
            System.out.println("--------------------------------");
        }
    }
}
```

在这个程序的 `main()` 方法中创建了一个 `Demo` 对象的实例，并调用该实例的 `square()`方法，然后显示 `for` 循环迭代变量的平方值。编译并运行它：

```
$ javac Demo.java
$ java Demo
1 iteration
Square(i) = 1
Time taken= 8432439
--------------------------------
2 iteration
Square(i) = 4
Time taken= 54631
--------------------------------
.
.
.
--------------------------------
10 iteration
Square(i) = 100
Time taken= 66498
--------------------------------
```

上面的结果是由谁产生的呢？是解释器，JIT 还是 AOT？在目前的情况下，它完全是通过解释产生的。我是怎么得出这个结论的呢？只有代码被解释的次数必须超过某个阈值时，这些热点代码片段才会被加入 JIT 编译队列。只有这时，JIT 编译才会发挥作用。使用以下命令查看 JDK 11 中的该阈值：

```
$ java -XX:+PrintFlagsFinal -version | grep CompileThreshold
 intx CompileThreshold     = 10000                                      {pd product} {default}
[...]
openjdk version "11.0.13" 2021-10-19
OpenJDK Runtime Environment 18.9 (build 11.0.13+8)
OpenJDK 64-Bit Server VM 18.9 (build 11.0.13+8, mixed mode, sharing)
```

上面的输出表明，一段代码被解释 10,000 次才符合 JIT 编译的条件。这个阈值是否可以手动调整呢？是否有 JVM 标志可以指示出方法是否被 JIT 编译了呢？答案是肯定的，而且有多种方式可以达到这个目的。

使用 `-XX:+PrintCompilation` 选项可以查看一个方法是否被 JIT 编译。除此之外，使用 `-Xbatch` 标志可以提高输出的可读性。如果解释和 JIT 同时发生，`-Xbatch` 可以帮助区分两者的输出。使用这些标志如下：

```
$ java -Xbatch  -XX:+PrintCompilation  Demo
         34        1        b  3           java.util.concurrent.ConcurrentHashMap::tabAt (22 bytes)
         35        2         n 0           jdk.internal.misc.Unsafe::getObjectVolatile (native)   
         35        3        b  3           java.lang.Object::<init> (1 bytes)
[...]
        210  269         n 0           java.lang.reflect.Array::newArray (native)   (static)
        211  270        b  3           java.lang.String::substring (58 bytes)
[...]
--------------------------------
10 iteration
Square(i) = 100
Time taken= 50150
--------------------------------
```

注意，上面命令的实际输出太长了，这里我只是截取了一部分。输出很长的原因是除了 `Demo` 程序的代码外，JDK 内部类的函数也被编译了。由于我的重点是 `Demo.java` 代码，我希望排除内部包的函数来简化输出。通过选项 `-XX:CompileCommandFile` 可以禁用内部类的 JIT：

```
$ java -Xbatch -XX:+PrintCompilation -XX:CompileCommandFile=hotspot_compiler Demo
```

在选项 `-XX:CompileCommandFile` 指定的文件 `hotspot_compiler` 中包含了要排除的包：

```
$ cat hotspot_compiler
quiet
exclude java/* *
exclude jdk/* *
exclude sun/* *
```

第一行的 `quiet` 告诉 JVM 不要输出任何关于被排除类的内容。用 `-XX:CompileThreshold` 将 JIT 阈值设置为 5。这意味着在解释 5 次之后，就会进行 JIT 编译：

```
$ java -Xbatch -XX:+PrintCompilation -XX:CompileCommandFile=hotspot_compiler \
-XX:CompileThreshold=5 Demo
        47      1       n 0     java.lang.invoke.MethodHandle::linkToStatic(LLLLLL)L (native)   
           (static)
        47      2       n 0     java.lang.invoke.MethodHandle::invokeBasic(LLLLL)L (native)   
        47      3       n 0     java.lang.invoke.MethodHandle::linkToSpecial(LLLLLLL)L (native)   
           (static)
        48      4       n 0     java.lang.invoke.MethodHandle::linkToStatic(L)I (native)   (static)
        48      5       n 0     java.lang.invoke.MethodHandle::invokeBasic()I (native)   
        48      6       n 0     java.lang.invoke.MethodHandle::linkToSpecial(LL)I (native)   
           (static)
[...]
        1 iteration
        69   40         n 0     java.lang.invoke.MethodHandle::linkToStatic(ILIIL)I (native)   
           (static)
[...]
Square(i) = 1
        78   48         n 0     java.lang.invoke.MethodHandle::linkToStatic(ILIJL)I (native)   
(static)
        79   49         n 0     java.lang.invoke.MethodHandle::invokeBasic(ILIJ)I (native)   
[...]
        86   54         n 0     java.lang.invoke.MethodHandle::invokeBasic(J)L (native)   
        87   55         n 0     java.lang.invoke.MethodHandle::linkToSpecial(LJL)L (native)   
(static)
Time taken= 8962738
--------------------------------
2 iteration
Square(i) = 4
Time taken= 26759
--------------------------------

10 iteration
Square(i) = 100
Time taken= 26492
--------------------------------
```

好像输出结果跟只用解释时并没有什么区别。根据 Oracle 的文档，这是因为只有禁用 `TieredCompilation` 时 `-XX:CompileThreshold` 才会生效：

```
$ java -Xbatch -XX:+PrintCompilation -XX:CompileCommandFile=hotspot_compiler \
-XX:-TieredCompilation -XX:CompileThreshold=5 Demo
124     1       n       java.lang.invoke.MethodHandle::linkToStatic(LLLLLL)L (native)   (static)
127     2       n       java.lang.invoke.MethodHandle::invokeBasic(LLLLL)L (native)   
[...]
1 iteration
        187   40        n       java.lang.invoke.MethodHandle::linkToStatic(ILIIL)I (native)   (static)
[...]
(native)   (static)
        212   54        n       java.lang.invoke.MethodHandle::invokeBasic(J)L (native)   
        212   55        n       java.lang.invoke.MethodHandle::linkToSpecial(LJL)L (native)   (static)
Time taken= 12337415
[...]
--------------------------------
4 iteration
Square(i) = 16
Time taken= 37183
--------------------------------
5 iteration
        214   56        b       Demo::<init> (5 bytes)
        215   57        b       Demo::square (16 bytes)
Square(i) = 25
Time taken= 983002
--------------------------------
6 iteration
Square(i) = 36
Time taken= 81589
[...]
10 iteration
Square(i) = 100
Time taken= 52393
```

可以看到在第五次迭代之后，代码片段被 JIT 编译了：

```
--------------------------------
5 iteration
        214   56        b       Demo::<init> (5 bytes)
        215   57        b       Demo::square (16 bytes)
Square(i) = 25
Time taken= 983002
--------------------------------
```

可以看到，与 `square()` 方法一起，构造方法也被 JIT 编译了。在 `for` 循环中调用 `square()` 之前要先构造 `Demo` 实例，所以构造方法的解释次数同样达到 JIT 编译阈值。这个例子说明了在解释发生之后何时 JIT 会介入。

要查看编译后的代码，需要使用 `-XX:+PrintAssembly` 标志，该标志仅在库路径中有反汇编器时才起作用。对于 OpenJDK，使用 `hsdis` 作为反汇编器。下载合适版本的反汇编程序库，在本例中是 `hsdis-amd64.so`，并将其放在 `Java_HOME/lib/server` 目录下。使用时还需要在 `-XX:+PrintAssembly` 之前增加 `-XX:+UnlockDiagnosticVMOptions` 选项。否则，JVM 会给你一个警告。

完整命令如下：

```
$ java -Xbatch -XX:+PrintCompilation -XX:CompileCommandFile=hotspot_compiler \ -XX:-TieredCompilation -XX:CompileThreshold=5 -XX:+UnlockDiagnosticVMOptions \ -XX:+PrintAssembly Demo
[...]
5 iteration
        178   56        b       Demo::<init> (5 bytes)
Compiled method (c2)    178   56                Demo::<init> (5 bytes)
 total in heap  [0x00007fd4d08dad10,0x00007fd4d08dafe0] = 720
 relocation     [0x00007fd4d08dae88,0x00007fd4d08daea0] = 24
[...]
 handler table  [0x00007fd4d08dafc8,0x00007fd4d08dafe0] = 24
[...]
 dependencies   [0x00007fd4d08db3c0,0x00007fd4d08db3c8] = 8
 handler table  [0x00007fd4d08db3c8,0x00007fd4d08db3f8] = 48
----------------------------------------------------------------------
Demo.square(I)I  [0x00007fd4d08db1c0, 0x00007fd4d08db2b8]  248 bytes
[Entry Point]
[Constants]
  # {method} {0x00007fd4b841f4b0} 'square' '(I)I' in 'Demo'
  # this:       rsi:rsi   = 'Demo'
  # parm0:      rdx     = int
  #             [sp+0x20]  (sp of caller)
[...]
[Stub Code]
  0x00007fd4d08db280: movabs $0x0,%rbx          ;   {no_reloc}
  0x00007fd4d08db28a: jmpq   0x00007fd4d08db28a  ;   {runtime_call}
  0x00007fd4d08db28f: movabs $0x0,%rbx          ;   {static_stub}
  0x00007fd4d08db299: jmpq   0x00007fd4d08db299  ;   {runtime_call}
[Exception Handler]
  0x00007fd4d08db29e: jmpq   0x00007fd4d08bb880  ;   {runtime_call ExceptionBlob}
[Deopt Handler Code]
  0x00007fd4d08db2a3: callq  0x00007fd4d08db2a8
  0x00007fd4d08db2a8: subq   $0x5,(%rsp)
  0x00007fd4d08db2ad: jmpq   0x00007fd4d08a01a0  ;   {runtime_call DeoptimizationBlob}
  0x00007fd4d08db2b2: hlt    
  0x00007fd4d08db2b3: hlt    
  0x00007fd4d08db2b4: hlt    
  0x00007fd4d08db2b5: hlt    
  0x00007fd4d08db2b6: hlt    
  0x00007fd4d08db2b7: hlt    
ImmutableOopMap{rbp=NarrowOop }pc offsets: 96
ImmutableOopMap{}pc offsets: 112
ImmutableOopMap{rbp=Oop }pc offsets: 148 Square(i) = 25
Time taken= 2567698
--------------------------------
6 iteration
Square(i) = 36
Time taken= 76752
[...]
--------------------------------
10 iteration
Square(i) = 100
Time taken= 52888
```

我只截取了输出中与 `Demo.java` 相关的部分。

现在再来看看 AOT 编译。它是在 JDK9 中引入的特性。AOT 是用于生成 `.so` 这样的库文件的静态编译器。用 AOT 可以将指定的类编译成 `.so` 库。这个库可以直接执行，而不用解释或 JIT 编译。如果 JVM 没有检测到 AOT 编译的代码，它会进行常规的解释和 JIT 编译。

使用 AOT 编译的命令如下：

```
$ jaotc --output=libDemo.so Demo.class
```

用下面的命令来查看共享库的符号表：

```
$ nm libDemo.so
```

要使用生成的 `.so` 库，使用 `-XX:+UnlockExperimentalVMOptions` 和  `-XX:AOTLibrary`：

```
$ java -XX:+UnlockExperimentalVMOptions -XX:AOTLibrary=./libDemo.so Demo
1 iteration
Square(i) = 1
Time taken= 7831139
--------------------------------
2 iteration
Square(i) = 4
Time taken= 36619
[...]
10 iteration
Square(i) = 100
Time taken= 42085
```

从输出上看，跟完全用解释的情况没有区别。为了确认 AOT 发挥了作用，使用 `-XX:+PrintAOT`：

```
$ java -XX:+UnlockExperimentalVMOptions -XX:AOTLibrary=./libDemo.so -XX:+PrintAOT Demo
         28        1         loaded        ./libDemo.so  aot library
         80        1         aot[ 1]   Demo.main([Ljava/lang/String;)V
         80        2         aot[ 1]   Demo.square(I)I
         80        3         aot[ 1]   Demo.<init>()V
1 iteration
Square(i) = 1
Time taken= 7252921
--------------------------------
2 iteration
Square(i) = 4
Time taken= 57443
[...]
10 iteration
Square(i) = 100
Time taken= 53586
```

要确认没有发生 JIT 编译，用如下命令：

```
$ java -XX:+UnlockExperimentalVMOptions -Xbatch -XX:+PrintCompilation \ -XX:CompileCommandFile=hotspot_compiler -XX:-TieredCompilation \ -XX:CompileThreshold=3 -XX:AOTLibrary=./libDemo.so -XX:+PrintAOT Demo
         19        1         loaded        ./libDemo.so  aot library
         77        1         aot[ 1]   Demo.square(I)I
         77        2         aot[ 1]   Demo.main([Ljava/lang/String;)V
         77        3         aot[ 1]   Demo.<init>()V
         77        2         aot[ 1]   Demo.main([Ljava/lang/String;)V   made not entrant
[...]
4 iteration
Square(i) = 16
Time taken= 43366
[...]
10 iteration
Square(i) = 100
Time taken= 59554
```

需要特别注意的是，修改被 AOT 编译了的源代码后，一定要重新生成 `.so` 库文件。否则，过时的的 AOT 编译库文件不会起作用。例如，修改 `square()` 方法，使其计算立方值：

```
//Demo.java
public class Demo {

    public int square(int i) throws Exception {
        return(i*i*i);
    }

    public static void main(String[] args) throws Exception {
        for (int i = 1; i <= 10; i++) {
          System.out.println("" + Integer.valueOf(i)+" iteration");
          long start = System.nanoTime();
          int r= new Demo().square(i);
          System.out.println("Square(i) = " + r);
          long end = System.nanoTime();
          System.out.println("Time taken= " + (end-start));
          System.out.println("--------------------------------");
        }
    }
}
```

重新编译 `Demo.java`：

```
$ java Demo.java
```

但不重新生成 `libDemo.so`。使用下面命令运行 `Demo`：

```
$ java -XX:+UnlockExperimentalVMOptions -Xbatch -XX:+PrintCompilation -XX:CompileCommandFile=hotspot_compiler -XX:-TieredCompilation -XX:CompileThreshold=3 -XX:AOTLibrary=./libDemo.so -XX:+PrintAOT Demo
         20        1         loaded        ./libDemo.so  aot library
         74        1         n           java.lang.invoke.MethodHandle::linkToStatic(LLLLLL)L (native)   (static)
2 iteration
sqrt(i) = 8
Time taken= 43838
--------------------------------
3 iteration
        137   56        b            Demo::<init> (5 bytes)
        138   57        b            Demo::square (6 bytes)
sqrt(i) = 27
Time taken= 534649
--------------------------------
4 iteration
sqrt(i) = 64
Time taken= 51916
[...]
10 iteration
sqrt(i) = 1000
Time taken= 47132
```

可以看到，虽然旧版本的 `libDemo.so` 被加载了，但 JVM 检测出它已经过时了。每次生成 `.class` 文件时，都会在类文件中添加一个指纹，并在 AOT 库中保存该指纹。修改源代码后类指纹与旧的 AOT 库中的指纹不匹配了，所以没有执行 AOT 编译生成的原生机器码。从输出可以看出，现在实际上是 JIT 在起作用（注意 `-XX:CompileThreshold` 被设置为了 3）。

### AOT 和 JIT 之间的权衡

如果你的目标是减少 JVM 的预热时间，请使用 AOT，这可以减少运行时负担。问题是 AOT 没有足够的数据来决定哪段代码需要预编译为原生代码。相比之下，JIT 在运行时起作用，却对预热时间有一定的影响。然而，它将有足够的分析数据来更高效地编译和反编译代码。

*（题图：MJ/ed3e6e15-56c7-4c1d-aff1-84a225faeeeb）*

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/8/interpret-compile-java

作者：[Jayashree Huttanagoudar][a]
选题：[lkxed][b]
译者：[toknow-gh](https://github.com/toknow-gh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jayashree-huttanagoudar
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/studying-books-java-couch-education.png
[2]: https://www.wocintechchat.com/
[3]: https://creativecommons.org/licenses/by/2.0/
[0]: https://img.linux.net.cn/data/attachment/album/202311/06/093552kheiob71meqierhd.png
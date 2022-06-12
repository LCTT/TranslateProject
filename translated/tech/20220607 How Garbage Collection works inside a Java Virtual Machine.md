[#]: subject: "How Garbage Collection works inside a Java Virtual Machine"
[#]: via: "https://opensource.com/article/22/6/garbage-collection-java-virtual-machine"
[#]: author: "Jayashree Huttanagoudar https://opensource.com/users/jayashree-huttanagoudar"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

JVM 垃圾回收的工作原理
======
对于程序员来说，掌握 Java 的内存管理机制并不是必须的，但它能够帮助你更好地理解 JVM 是如何处理程序中的变量和类实例的。

![咖啡豆][1]

图源：Pixabay. CC0.

Java 之所以能够如此流行，自动 <ruby>垃圾回收<rt>Garbage Collection</rt></ruby>（GC）功不可没，它也是 Java 最重要的几个特性之一。在这篇文章中，我将说明为什么垃圾回收如此重要。本文的主要内容为：自动的分代垃圾回收、JVM 划分内存的依据，以及 JVM 垃圾回收的工作原理。

### Java 内存分配

Java 程序的内存空间被划分为以下四个区域：

1. 堆区（Heap）：对象实例就是在这个区域分配的。不过，当我们声明一个对象时，堆中不会有任何内存分配发生，只是在栈中创建了一个对象的引用而已。
2. 栈区（Stack）：方法、局部变量和类的实例变量就是在这个区域分配的。
3. 代码区（Code）：这个区域存放了程序的字节码。
4. 静态区（Static）：这个区域存放了程序的静态数据和静态方法。

### 什么是自动垃圾回收？

自动垃圾回收是这样一个过程：首先，堆中的所有对象会被分类为“被引用的”和“未被引用的”；接着，“未被引用的对象”就会被做上标记，以待之后删除。其中，“被引用的对象”是指程序中的某一部分仍在使用的对象，“未被引用的对象”是指目前没有正在被使用的对象。

许多编程语言，例如 C 和 C++，都需要程序员手动管理内存的分配和释放。在 Java 中，这一过程是通过垃圾回收机制来自动完成的（尽管你也可以在代码中调用 `system.gc();` 来手动触发垃圾回收）。

垃圾回收的基本步骤如下：

#### 1. 标记已使用和未使用的对象

在这一步骤中，已使用和未使用的对象会被分别做上标记。这是一个及其耗时的过程，因为需要扫描内存中的所有对象，才能够确定它们是否正在被使用。

![标记已使用和未使用的对象][2]

#### 2. 扫描/删除对象

有两种不同的扫描和删除算法：

**简单删除（标记清除）**：它的过程很简单，我们只需要删除未被引用的对象即可。但是，后续给新对象分配内存就会变得很困难了，因为可用空间被分割成了一块块碎片。

![标记清除的过程][3]

**删除压缩（标记整理）**：除了会删除未被引用的对象，我们还会压缩被引用的对象（未被删除的对象）。这样以来，新对象的内存分配就相对容易了，并且内存分配的效率也有了提升。

![标记整理的过程][4]

### 什么是分代垃圾回收，为什么需要它？

正如我们在“扫描删除”模型中所看到的，一旦对象不断增长，我们就很难扫描所有未使用的对象以回收内存。不过，有一项实验性研究指出，在程序执行期间创建的大多数对象，它们的存活时间都很短。

既然大多数对象的存活时间都很短，那么我们就可以利用这个事实，从而提升垃圾回收的效率。该怎么做呢？首先，JVM 将内存划分为不同的“代”。接着，它将所有的对象都分类到这些内存“代”中，然后对这些“代”分别执行垃圾回收。这就是“分代垃圾回收”。

### 堆内存的“代”和分代垃圾回收过程

为了提升垃圾回收中的“标记清除”的效率，JVM 将对内存划分成以下三个“代”：

* 年轻代
* 老年代
* 永久代

![Hotspot 堆内存结构][5]

下面我将介绍每个“代”及其主要特征。

#### 年轻代

所有创建不久的对象都存放在这里。年轻代被进一步分为以下两个区域：

1. 伊甸区（Eden）：所有新创建的对象都在此处分配内存。
2. 幸存者区（Survivor，分为 S0 和 S1）：经历过一次垃圾回收后，仍然存活的对象会被移动到两个幸存者区中的一个。

![对象分配][6]

在年轻代发生的分代垃圾回收被称为 “Minor GC”。Minor GC 过程中的每个阶段都是“<ruby>停止世界<rt>Stop The World</rt></ruby>”（STW）的，这会导致其他应用程序暂停运行，直到垃圾回收结束。这也是 Minor GC 更快的原因。

一句话总结：伊甸区存放了所有新创建的对象，当它的可用空间被耗尽，第一次垃圾回收就会被触发。

![填充伊甸区][7]

Minor GC：在该垃圾回收过程中，所有存活和死亡的对象都会被做上标记。其中，存活对象会被移动到 S0 幸存者区。当所有存活对象都被移动到了 S0，未被引用的对象就会被删除。

![拷贝被引用的对象][8]

S0 中的对象年龄为 1，因为它们挺过了一次 Minor GC。此时，伊甸区和 S1 都是空的。

每当完成清理后，伊甸区就会再次接受新的存活对象。随着时间的推移，伊甸区和 S0 中的某些对象被宣判死亡（不再被引用），并且伊甸区的可用空间也再次耗尽（填满了），那么 Minor GC 又将再次被触发。

![对象年龄增长][9]

这一次，伊甸区和 S0 中的死亡和存活的对象会被做上标记。其中，伊甸区的存活对象会被移动到 S1，并且年龄增加至 1。S0 中的存活对象也会被移动到 S1，并且年龄增加至 2（因为它们挺过了两次 Minor GC）。此时，伊甸区和 S0 又是空的了。每次 Minor GC 之后，伊甸区和两个幸存者区中的一个都会是空的。

新对象总是在伊甸区被创建，周而复始。当下一次垃圾回收发生时，伊甸区和 S1 都会被清理，它们中的存活对象会被移动到 S0 区。每次 Minor GC 之后，这两个幸存者区（S0 和 S1）就会交换一次。

![额外年龄增长][10]

这个过程会一直进行下去，直到某个存活对象的年龄达到了某个阈值，然后它就会被移动到一个叫做“老年代”的地方，这是通过一个叫做“晋升”的过程来完成的。

使用 `-Xmn` 选项可以设置年轻代的大小。

### 老年代

这个区域存放着那些挺过了许多次 Minor GC，并且达到了某个年龄阈值的对象。

![晋升][11]

在上面这个示例图表中，晋升的年龄阈值为 8。在老年代发生的垃圾回收被称为 “Major GC”。

使用 `-Xms` 和 `-Xmx` 选项可以分别设置堆内存大小的初始值和最大值。（LCTT 译注：结合上面的 `-Xmn` 选项，就可以间接设置老年代的大小了。）

### 永久代

永久代存放着一些元数据，它们与应用程序、Java 标准环境以及 JVM 自用的库类及其方法相关。JVM 会在运行时，用到了什么类和方法，就会填充相应的数据。当 JVM 发现有未使用的类，就会卸载或是回收它们，从而为正在使用的类腾出空间。

使用 `-XX:PermGen` 和 `-XX:MaxPerGen` 选项可以分别设置永久代大小的初始值和最大值。

#### 元空间

Java 8 引入了元空间，并用它替换了永久代。这么做的好处是自动调整大小，避免了 <ruby>内存不足<rt>OutOfMemory</rt></ruby>（OOM）错误。

### 总结

本文讨论了各种不同的 JVM 内存“代”，以及它们是如何在分代垃圾回收算法中起作用的。对于程序员来说，掌握 Java 的内存管理机制并不是必须的，但它能够帮助你更好地理解 JVM 处理程序中的变量和类实例的方式。这种理解使你能够规划和排除代码故障，并理解特定平台固有的潜在限制。

正文配图来自：Jayashree Huttanagoudar，CC BY-SA 4.0

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/garbage-collection-java-virtual-machine

作者：[Jayashree Huttanagoudar][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jayashree-huttanagoudar
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/java-coffee-beans.jpg
[2]: https://opensource.com/sites/default/files/2022-06/1Marking.png
[3]: https://opensource.com/sites/default/files/2022-06/2NormalDeletion.png
[4]: https://opensource.com/sites/default/files/2022-06/3DeletionwithCompacting.png
[5]: https://opensource.com/sites/default/files/2022-06/4Hotspot.png
[6]: https://opensource.com/sites/default/files/2022-06/5ObjAllocation.png
[7]: https://opensource.com/sites/default/files/2022-06/6FillingEden.png
[8]: https://opensource.com/sites/default/files/2022-06/7CopyingRefdObjs.png
[9]: https://opensource.com/sites/default/files/2022-06/8ObjAging.png
[10]: https://opensource.com/sites/default/files/2022-06/9AddlAging.png
[11]: https://opensource.com/sites/default/files/2022-06/10Promotion.png

[#]: subject: "How Garbage Collection works inside a Java Virtual Machine"
[#]: via: "https://opensource.com/article/22/6/garbage-collection-java-virtual-machine"
[#]: author: "Jayashree Huttanagoudar https://opensource.com/users/jayashree-huttanagoudar"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How Garbage Collection works inside a Java Virtual Machine
======
Understanding how Java handles memory isn't always necessary, but it can help you envision how the JVM deals with your variables and class instances.

![Coffee beans][1]

Image by: Pixabay. CC0.

Automatic Garbage Collection (GC) is one of the most important features that makes Java so popular. This article explains why GC is essential. It includes automatic and generational GC, how the Java Virtual Machine (JVM) divides heap memory, and finally, how GC works inside the JVM.

### Java memory allocation

Java memory is divided into four sections:

1. Heap: The memory for object instances is allocated in the heap. When the object declaration is made, there won't be any memory allocated in the heap. Instead, a reference is created for that object in the stack.
2. Stack: This section allocates the memory for methods, local variables, and class instance variables.
3. Code: Bytecode resides in this section.
4. Static: Static data and methods are placed in this section.

### What is automatic Garbage Collection (GC)?

Automatic GC is a process in which the referenced and unreferenced objects in heap memory are identified, and then unreferenced objects are considered for deletion. The term *referenced objects* means some part of your program is using those objects. *Unreferenced objects* are not currently being used by the program.

Programming languages like C and C++ require manual allocation and deallocation of memory. This is automatically handled by GC in Java, although you can trigger GC manually with the `system.gc();` call in your code.

The fundamental steps of GC are:

#### 1. Mark used and unused objects

In this step, the used and unused objects are marked separately. This is a time-consuming process, as all objects in memory must be scanned to determine whether they're in use or not.

![Marking used and unused objects][2]

#### 2. Sweep/Delete objects

There are two variations of sweep and delete.

**Simple deletion**: Only unreferenced objects are removed. However, the memory allocation for new objects becomes difficult as the free space is scattered across available memory.

![Normal deleting process][3]

**Deletion with compaction**: Apart from deleting unreferenced objects, referenced objects are compacted. Memory allocation for new objects is relatively easy, and memory allocation performance is improved.

![Deletion with compacting][4]

### What is generational Garbage Collection (GC), and why is it needed?

As seen in the sweep and delete model, scanning all objects for memory reclamation from unused objects becomes difficult once the objects keep growing. An experimental study shows that most objects created during the program execution are short-lived.

The existence of short-lived objects can be used to improve the performance of GC. For that, the JVM divides the memory into different generations. Next, it categorizes the objects based on these memory generations and performs the GC accordingly. This approach is known as *generational GC*.

### Heap memory generations and the generational Garbage Collection (GC) process

To improve the performance of the GC mark and sweep steps, the JVM divides the heap memory into three generations:

* Young Generation
* Old Generation
* Permanent Generation

![Hotspot heap structure][5]

Here is a description of each generation and its key features.

#### Young Generation

All created objects are present here. The young generation is further divided into:

1. Eden: All newly created objects are allocated with the memory here.
2. Survivor space (S0 and S1): After surviving one GC, the live objects are moved to one of these survivor spaces.

![Object allocation][6]

The generational GC that happens in the Young Generation is known as *Minor GC*. All Minor GC cycles are "Stop the World" events that cause the other applications to pause until it completes the GC cycle. This is why Minor GC cycles are faster.

To summarize: Eden space has all newly created objects. Once Eden is full, the first Minor GC cycle is triggered.

![Filling Eden space][7]

Minor GC: The live and dead objects are marked during this cycle. The live objects are moved to survivor space S0. Once all live objects are moved to S0, the unreferenced objects are deleted.

![Copying referenced objects][8]

The age of objects in S0 is 1 because they have survived one Minor GC. Now Eden and S1 are empty.

Once cleared, the Eden space is again filled with new live objects. As time elapses, some objects in Eden and S0 become dead (unreferenced), and Eden's space is full again, triggering the Minor GC.

![Object aging][9]

This time the dead and live objects in Eden and S0 are marked. The live objects from Eden are moved to S1 with an age increment of 1. The live objects from S0 are also moved to S1 with an age increment of 2 (because they've now survived two Minor GCs). At this point, S0 and Eden are empty. After every Minor GC, Eden and one of the survivor spaces are empty.

The same cycle of creating new objects in Eden continues. When the next Minor GC occurs, Eden and S1 are cleared by moving the aged objects to S0. The survivor spaces switch after every Minor GC.

![Additional aging][10]

This process continues until the age of one of the surviving objects reaches a certain threshold, at which point it is moved to the so-called the Old Generation with a process called *promotion*.

Further, the `-Xmn` flag sets the Young Generation size.

### Old Generation (Tenured Generation)

This generation contains the objects that have survived several Minor GCs and aged to reach an expected threshold.

![Promotion][11]

In the example diagram above, the threshold is 8. The GC in the Old Generation is known as a *Major GC*. Use the flags `-Xms` and `-Xmx` to set the initial and maximum size of the heap memory.

### Permanent Generation

The Permanent Generation space stores metadata related to library classes and methods of an application, J2SE, and what's in use by the JVM itself. The JVM populates this data at runtime based on which classes and methods are in use. Once the JVM finds the unused classes, they are unloaded or collected, making space for used classes.

Use the flags `-XX:PermGen` and `-XX:MaxPermGen` to set the initial and maximum size of the Permanent Generation.

#### Metaspace

Metaspace was introduced in Java 8u and replaced PermGen. The advantage of this is automatic resizing, which avoids OutOfMemory errors.

### Wrap up

This article discusses the various memory generations of JVM and how they are helpful for automatic generational Garbage Collection (GC). Understanding how Java handles memory isn't always necessary, but it can help you envision how the JVM deals with your variables and class instances. This understanding allows you to plan and troubleshoot your code and comprehend potential limitations inherent in a specific platform.

Image by: (Jayashree Huttanagoudar, CC BY-SA 4.0)

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/garbage-collection-java-virtual-machine

作者：[Jayashree Huttanagoudar][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
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

[#]: subject: "7 kinds of garbage collection for Java"
[#]: via: "https://opensource.com/article/22/7/garbage-collection-java"
[#]: author: "Jayashree Huttanagoudar https://opensource.com/users/jayashree-huttanagoudar"
[#]: collector: "lkxed"
[#]: translator: "Veryzzj"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

7 kinds of garbage collection for Java
======
Learn about the choices you have in Java for memory management.

An application written using programming languages like C and C++ requires you to program the destruction of objects in memory when they're no longer needed. The more your application grows, the great the probability that you'll overlook releasing unused objects. This leads to a memory leak and eventually the system memory gets used up, and at some point there's no further memory to allocate. This results in a situation where the application fails with an OutOfMemoryError. But in the case of Java, Garbage Collection (GC) happens automatically during application execution, so it alleviates the task of manual deallocation and possible memory leaks.

Garbage Collection isn't a single task. The Java Virtual Machine (JVM) has eight different kinds of Garbage Collection, and it's useful to understand each one's purpose and strength.

### 1. Serial GC

![Serial threaded garbage collection][1]

A primitive implementation of GC using just a single thread. When Garbage Collection happens, it pauses the application (commonly known as a "stop the world" event.) This is suitable for applications that can withstand small pauses. Garbage Collection has a small footprint, so this is the preferred GC type for embedded applications. This Garbage Collection style can be enabled at runtime:

```
$ java -XX:+UseSerialGC
```

### 2. Parallel GC

![Parallel garbage collection][2]

Like Serial GC, this also uses a "stop the world" method. That means that while GC is happening, application threads are paused. But in this case, there are multiple threads performing GC operation. This type of GC is suitable for applications with medium to large data sets running in a multithreaded and multiprocessor environment.

This is the default GC in JVM, and is also known as the *Throughput Collector*. Various GC parameters, like throughput, pause time, number of threads, and footprint, can be tuned with suitable JVM flags:

* Number of threads: `-XX:ParallelGCThreads=<N>`
* Pause time: `-XX:MaxGCPauseMillis=<N>`
* Throughput (time spent for GC compared to actual application execution): `-XX:GCTimeRatio=<N>`
* Maximum heap footprint: `-Xmx<N>`
* Parallel GC can be explicitly enabled: `java -XX:+UseParallelGC`. With this option, minor GC in the young generation is done with multiple threads, but GC and compaction is done with a single thread in the old generation.

There's also a version of Parallel GC called *Parallel Old GC*, which uses multiple threads for both young and old generations:

```
$ java -XX:+UseParallelOldGC
```

### 3. Concurrent Mark Sweep (CMS)

![Concurrent garbage collection][3]

Concurrent Mark Sweep (CMS) garbage collection is run alongside an application. It uses multiple threads for both minor and major GC. Compaction for live objects isn't performed in CMS GC after deleting the unused objects, so the time paused is less than in other methods. This GC runs concurrently with the application, which slows the response time of the application. This is suitable for applications with low pause time. This GC was deprecated in Java 8u, and completely removed from 14u onwards. If you're still using a Java version that has it, though, you can enable it with:

```
$ java -XX:+UseConcMarkSweepGC
```

In the case of CMS GC, the application is paused twice. It's paused first when it marks a live object that's directly reachable. This pause is known as the *initial-mark*. It's paused a second time at the end of the CMS GC phase, to account for the objects that were missed during the concurrent cycle, when application threads updated the objects after CMS GC were completed. This is known as the *remark phase*.

### 4. G1 (Garbage First) GC

![Garbage first][4]

Garbage first (G1) was meant to replace CMS. G1 GC is parallel, concurrent, and incrementally compacting, with low pause-time. G1 uses a different memory layout than CMS, dividing the heap memory into equal sized regions. G1 triggers a global mark phase with multiple threads. After the mark phase is complete, G1 knows which region might be mostly empty and chooses that region for a sweep/deletion phase first.

In the case of G1, an object that's more than half a region size is considered a "humongous object." These objects are placed in the Old generation, in a region appropriately called the *humongous region*. To enable G1:

```
$ java -XX:+UseG1GC
```

### 5. Epsilon GC

This GC was introduced in 11u and is a *no-op* (do nothing) GC. Epsilon just manages memory allocation. It doesn’t do any actual memory reclamation. Epsilon is intended only when you know the exact memory footprint of your application, and knows that it is garbage collection free.

```
$ java -XX:+UnlockExperimentalVMOptions -XX:+UseEpsilonGC
```

### 6. Shenandoah

Shenandoah was introduced in JDK 12, and is a CPU intensive GC. It performs compaction, deletes unused objects, and release free space to the OS immediately. All of this happens in parallel with the application thread itself. To enable Shenandoah:

```
$ java -XX:+UnlockExperimentalVMOptions \ 
-XX:+UseShenandoahGC
```

### 7. ZGC

ZGC is designed for applications that have low latency requirements and use large heaps. ZGC allows a Java application to continue running while it performs all garbage collection operations. ZGC was introduced in JDK 11u and improved in JDK 12. Both Shenandoah and ZGC have been moved out of the experimental stage as of JDK 15. To enable ZGC:

```
$ java -XX:+UnlockExperimentalVMOptions -XX:+UseZGC
```

### Flexible garbage collection

Java provides flexibility for memory management. It's useful to get familiar with the different methods available so you can choose what's best for the application you're developing or running.

Image by: [Opensource.com][5]

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/7/garbage-collection-java

作者：[Jayashree Huttanagoudar][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jayashree-huttanagoudar
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/2022-07/jaya-java-gc-serial.webp
[2]: https://opensource.com/sites/default/files/2022-07/jaya-java-gc-parallel.webp
[3]: https://opensource.com/sites/default/files/2022-07/jaya-java-gc-concurrent.webp
[4]: https://opensource.com/sites/default/files/2022-07/g1.png
[5]: https://opensource.com/home-page-new

[#]: subject: "A guide to JVM interpretation and compilation"
[#]: via: "https://opensource.com/article/22/8/interpret-compile-java"
[#]: author: "Jayashree Huttanagoudar https://opensource.com/users/jayashree-huttanagoudar"
[#]: collector: "lkxed"
[#]: translator: "toknow-gh"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

A guide to JVM interpretation and compilation
======
Use interpretation, just-in-time compilation, and ahead-of-time compilation efficiently by understanding the differences among them.

Java is a platform-independent language. Programs are converted to *bytecode* after compilation. This bytecode gets converted to *machine code* at runtime. An interpreter emulates the execution of bytecode instructions for the abstract machine on a specific physical machine. Just-in-time (JIT) compilation happens at some point during execution, and ahead-of-time (AOT) compilation happens during build time.

This article explains when an interpreter comes into play and when JIT and AOT will occur. I also discuss the trade-offs between JIT and AOT.

### Source code, bytecode, machine code

Applications are generally written using a programming language like C, C++, or Java. The set of instructions written using high-level programming languages is called source code. Source code is human readable. To execute it on the target machine, source code needs to be converted to machine code, which is machine readable. Source code is typically converted into machine code by a compiler.

In Java, however, the source code is first converted into an intermediate form called *bytecode*. This bytecode is platform independent, which is why Java is well known as a platform-independent programming language. The primary Java compiler `javac` converts the Java source code into bytecode. Then, the bytecode is interpreted by the interpreter.

Here is a small `Hello.java` program:

```
//Hello.java
public class Hello {
    public static void main(String[] args) {
         System.out.println("Inside Hello World!");
    }
}
```

Compile it using `javac` to generate a `Hello.class` file containing the bytecode.

```
$ javac Hello.java
$ ls
Hello.class  Hello.java
```

Now, use `javap` to disassemble the content of the `Hello.class` file. The output of `javap` depends on the options used. If you don't choose any options, it prints basic information, including which source file this class file is compiled from, the package name, public and protected fields, and methods of the class.

```
$ javap Hello.class
Compiled from "Hello.java"
public class Hello {
    public Hello();
    public static void main(java.lang.String[]);
}
```

To see the bytecode content in the `.class` file, use the `-c` option:

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

To get more detailed information, use the `-v` option:

```
$ javap -v Hello.class
```

### Interpreter, JIT, AOT

The interpreter is responsible for emulating the execution of bytecode instructions for the abstract machine on a specific physical machine. When compiling source code using `javac` and executing using the `java` command, the interpreter operates during runtime and serves its purpose.

```
$ javac Hello.java
$ java Hello
Inside Hello World!
```

The JIT compiler also operates at runtime. When the interpreter interprets a Java program, another component, called a runtime profiler, is silently monitoring the program's execution to observe which portion of the code is getting interpreted and how many times. These statistics help detect the *hotspots* of the program, that is, those portions of code frequently being interpreted. Once they're interpreted above a set threshold, they are eligible to be converted into machine code directly by the JIT compiler. The JIT compiler is also known as a profile-guided compiler. Conversion of bytecode to native code happens on the fly, hence the name just-in-time. JIT reduces overhead of the interpreter emulating the same set of instructions to machine code.

The AOT compiler compiles code during build time. Generating frequently interpreted and JIT-compiled code at build time improves the warm-up time of the Java Virtual Machine (JVM). This compiler was introduced in Java 9 as an experimental feature. The `jaotc` tool uses the Graal compiler, which is itself written in Java, for AOT compilation.

Here's a sample use case for a Hello program:

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

### When do interpreting and compiling come into play: an example

This example illustrates when Java uses an interpreter and when JIT and AOT pitch in. Consider a simple Java program, `Demo.java` :

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

This simple program has a `main` method that creates a `Demo` object instance, and calls the method `square`, which displays the square root of the `for` loop iteration value. Now, compile and run the code:

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

The question now is whether the output is a result of the interpreter, JIT, or AOT. In this case, it's wholly interpreted. How did I conclude that? Well, to get JIT to contribute to the compilation, the hotspots of the code must be interpreted above a defined threshold. Then and only then are those pieces of code queued for JIT compilation. To find the threshold for JDK 11:

```
$ java -XX:+PrintFlagsFinal -version | grep CompileThreshold
 intx CompileThreshold     = 10000                                      {pd product} {default}
[...]
openjdk version "11.0.13" 2021-10-19
OpenJDK Runtime Environment 18.9 (build 11.0.13+8)
OpenJDK 64-Bit Server VM 18.9 (build 11.0.13+8, mixed mode, sharing)
```

The above output demonstrates that a particular piece of code should be interpreted 10,000 times to be eligible for JIT compilation. Can this threshold be manually tuned, and is there some JVM flag that indicates whether a method is JIT compiled? Yes, there are multiple options to serve this purpose.

One option for learning whether a method is JIT compiled is `-XX:+PrintCompilation`. Along with this option, the flag `-Xbatch` provides the output in a more readable way. If both interpretation and JIT are happening in parallel, the `-Xbatch` flag helps distinguish the output of both. Use these flags as follows:

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

The output of the above command is too lengthy, so I've truncated the middle portion. Note that along with the Demo program code, the JDKs internal class functions are also getting compiled. This is why the output is so lengthy. Because my focus is `Demo.java` code, I'll use an option that can minimize the output by excluding the internal package functions. The command -`XX:CompileCommandFile` disables JIT for internal classes:

```
$ java -Xbatch -XX:+PrintCompilation -XX:CompileCommandFile=hotspot_compiler Demo
```

The file `hotspot_compiler` referenced by `-XX:CompileCommandFile` contains this code to exclude specific packages:

```
$ cat hotspot_compiler
quiet
exclude java/* *
exclude jdk/* *
exclude sun/* *
```

In the first line, `quiet` instructs the JVM not to write anything about excluded classes. To tune the JIT threshold, use `-XX:CompileThreshold` with the value set to 5, meaning that after interpreting five times, it's time for JIT:

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

The output is still not different from interpreted output! This is because, as per Oracle's documentation, the `-XX:CompileThreshold` flag is effective only when `TieredCompilation` is disabled:

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

This section of code is now JIT compiled after the fifth interpretation:

```
--------------------------------
5 iteration
        214   56        b       Demo::<init> (5 bytes)
        215   57        b       Demo::square (16 bytes)
Square(i) = 25
Time taken= 983002
--------------------------------
```

Along with the `square()` method, the constructor is also getting JIT compiled because there is a Demo instance inside the `for` loop before calling `square()`. Hence, it will also reach the threshold and be JIT compiled. This example illustrates when JIT comes into play after interpretation.

To see the compiled version of the code, use the `-XX:+PrintAssembly flag`, which works only if there is a disassembler in the library path. For OpenJDK, use the `hsdis` disassembler. Download a suitable disassembler library— in this case, `hsdis-amd64.so` — and place it under `Java_HOME/lib/server`. Make sure to use `-XX:+UnlockDiagnosticVMOptions` before `-XX:+PrintAssembly`. Otherwise, JVM will give you a warning.

The entire command is as follows:

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

The output is lengthy, so I've included only the output related to `Demo.java`.

Now it's time for AOT compilation. This option was introduced in JDK9. AOT is a static compiler to generate the `.so` library. With AOT, the interested classes can be compiled to create an `.so` library that can be directly executed instead of interpreting or JIT compiling. If JVM doesn't find any AOT-compiled code, the usual interpretation and JIT compilation takes place.

The command used for AOT compilation is as follows:

```
$ jaotc --output=libDemo.so Demo.class
```

To see the symbols in the shared library, use the following:

```
$ nm libDemo.so
```

To use the generated `.so` library, use `-XX:AOTLibrary` along with `-XX:+UnlockExperimentalVMOptions` as follows:

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

This output looks as if it is an interpreted version itself. To make sure that the AOT compiled code is utilized, use `-XX:+PrintAOT` :

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

Just to make sure that JIT compilation hasn't happened, use the following:

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

If any small change is made to the source code subjected to AOT, it's important to ensure that the corresponding `.so` is created again. Otherwise, the stale AOT-compiled `.so` won't have any effect. For example, make a small change to the square function such that now it's calculating cube:

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

Now, compile `Demo.java` again:

```
$ java Demo.java
```

But, don't create `libDemo.so` using `jaotc`. Instead, use this command:

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

Though the old version of `libDemo.so` is loaded, JVM detected it as a stale one. Every time a `.class` file is created, a fingerprint goes into the class file, and a class fingerprint is kept in the AOT library. Because the class fingerprint is different from the one in the AOT library, AOT-compiled native code is not used. Instead, the method is now JIT compiled, because the `-XX:CompileThreshold` is set to 3.

### AOT or JIT?

If you are aiming to reduce the warm-up time of the JVM, use AOT, which reduces the burden during runtime. The catch is that AOT will not have enough data to decide which piece of code needs to be precompiled to native code.  By contrast, JIT pitches in during runtime and impacts the warm-up time. However, it will have enough profiling data to compile and decompile the code more efficiently.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/8/interpret-compile-java

作者：[Jayashree Huttanagoudar][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jayashree-huttanagoudar
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/studying-books-java-couch-education.png
[2]: https://www.wocintechchat.com/
[3]: https://creativecommons.org/licenses/by/2.0/

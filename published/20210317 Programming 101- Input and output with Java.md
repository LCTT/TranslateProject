[#]: subject: (Programming 101: Input and output with Java)
[#]: via: (https://opensource.com/article/21/3/io-java)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (piaoshi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13622-1.html)

编程基础：Java 中的输入和输出
======

> 学习 Java 如何外理数据的读与写。

![](https://img.linux.net.cn/data/attachment/album/202107/27/101854by7yizpokqyo77kk.jpg)

当你写一个程序时，你的应用程序可能需要读取和写入存储在用户计算机上的文件。这在你想加载或存储配置选项，你需要创建日志文件，或你的用户想要保存工作以待后用的情况下是很常见的。每种语言处理这项任务的方式都有所不同。本文演示了如何用 Java 处理数据文件。

### 安装 Java

不管你的计算机是什么平台，你都可以从 [AdoptOpenJDK][2] 安装 Java。这个网站提供安全和开源的 Java 构建。在 Linux 上，你的软件库中也可能找到 AdoptOpenJDK 的构建。

我建议你使用最新的长期支持（LTS）版本。最新的非 LTS 版本对希望尝试最新 Java 功能的开发者来说是最好的，但它很可能超过大多数用户所安装的版本 —— 要么是系统上默认安装的，要么是以前为其他 Java 应用安装的。使用 LTS 版本可以确保你与大多数用户所安装的版本保持一致。

一旦你安装好了 Java，就可以打开你最喜欢的文本编辑器并准备开始写代码了。你可能还想要研究一下 [Java 集成开发环境][3]。BlueJ 是新程序员的理想选择，而 Eclipse 和 Netbeans 对中级和有经验的编码者更友好。

### 利用 Java 读取文件

Java 使用 `File` 类来加载文件。

这个例子创建了一个叫 `Ingest` 的类来读取文件中数据。当你要在 Java 中打开一个文件时，你创建了一个 `Scanner` 对象，它可以逐行扫描你提供的文件。事实上，`Scanner` 与文本编辑器中的光标是相同的概念，这样你可以用 `Scanner` 的一些方法（如 `nextLine`）来控制这个“光标”以进行读写。

```
import java.io.File;
import java.util.Scanner;
import java.io.FileNotFoundException;

public class Ingest {
  public static void main(String[] args) {
   
      try {
          File myFile = new File("example.txt");
          Scanner myScanner = new Scanner(myFile);
          while (myScanner.hasNextLine()) {
              String line = myScanner.nextLine();
              System.out.println(line);
          }
          myScanner.close();
      } catch (FileNotFoundException ex) {
          ex.printStackTrace();  
      } //try
    } //main
} //class
```

这段代码首先在假设存在一个名为 `example.txt` 的文件的情况下创建了变量 `myfile`。如果该文件不存在，Java 就会“抛出一个异常”（如它所说的，这意味着它在你试图做的事情中发现了一个错误），这个异常是被非常特定的 `FileNotFoundException` 类所“捕获”。事实上，有一个专门的类来处理这个明确的错误，这说明这个错误是多么常见。

接下来，它创建了一个 `Scanner` 并将文件加载到其中。我把它叫做 `myScanner`，以区别于它的通用类模板。接着，一个 `while` 循环将 `myScanner` 逐行送入文件中，只要 _存在_ 下一行。这就是 `hasNextLine` 方法的作用：它检测“光标”之后是否还有数据。你可以通过在文本编辑器中打开一个文件来模拟这个过程：你的光标从文件的第一行开始，你可以用键盘控制光标来向下扫描文件，直到你走完了所有的行。

`while` 循环创建了一个变量 `line`，并将文件当前行的数据分配给它。然后将 `line` 的内容打印出来以提供反馈。一个更有用的程序可能会解析每一行的内容，从而提取它所包含的任何重要数据。

在这个过程结束时，关闭 `myScanner` 对象。

### 运行代码

将你的代码保存到 `Ingest.java` 文件（这是一个 Java 惯例，将类名的首字母大写，并以类名来命名相应的文件）。如果你试图运行这个简单的应用程序，你可能会接收到一个错误信息，这是因为还没有 `example.txt` 文件供应用程序加载:

```
$ java ./Ingest.java
java.io.FileNotFoundException:
example.txt (No such file or directory)
```

正好可以编写一个将数据写入文件的 Java 应用程序，多么完美的时机！

### 利用 Java 将数据写入文件

无论你是存储用户使用你的应用程序创建的数据，还是仅仅存储关于用户在应用程序中做了什么的元数据（例如，游戏保存或最近播放的歌曲），有很多很好的理由来存储数据供以后使用。在 Java 中，这是通过 `FileWriter` 类实现的，这次先打开一个文件，向其中写入数据，然后关闭该文件。

```
import java.io.FileWriter;
import java.io.IOException;

public class Exgest {
  public static void main(String[] args) {
    try {
        FileWriter myFileWriter = new FileWriter("example.txt", true);
        myFileWriter.write("Hello world\n");
        myFileWriter.close();
    } catch (IOException ex) {
        System.out.println(ex);
    } // try
  } // main
}
```

这个类的逻辑和流程与读取文件类似。但它不是一个 `Scanner`，而是以一个文件的名字为参数创建的一个 `FileWriter` 对象。`FileWriter` 语句末尾的 `true` 标志告诉 `FileWriter` 将文本 _追加_ 到文件的末尾。要覆盖一个文件的内容，请移除 `true` 标志。

```
`FileWriter myFileWriter = new FileWriter("example.txt", true);`
```

因为我在向文件中写入纯文本，所以我在写入文件的数据（`Hello world`）的结尾处手动添加了换行符（`\n`）。

### 试试代码

将这段代码保存到 `Exgest.java` 文件，遵循 Java 的惯例，使文件名为与类名相匹配。

既然你已经掌握了用 Java 创建和读取数据的方法，你可以按相反的顺序尝试运行你的新应用程序。

```
$ java ./Exgest.java
$ java ./Ingest.java
Hello world
$
```

因为程序是把数据追加到文件末尾，所以你可以重复执行你的应用程序以多次写入数据，只要你想把更多的数据添加到你的文件中。

```
$ java ./Exgest.java
$ java ./Exgest.java
$ java ./Exgest.java
$ java ./Ingest.java
Hello world
Hello world
Hello world
$
```

### Java 和数据

你不会经常向文件中写入原始文本；事实上，你可能会使用一个其它的类库以写入特定的格式。例如，你可能使用 XML 类库来写复杂的数据，使用 INI 或 YAML 类库来写配置文件，或者使用各种专门类库来写二进制格式，如图像或音频。

更完整的信息，请参阅 [OpenJDK 文档][10]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/io-java

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[piaoshi](https://github.com/piaoshi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/java-coffee-mug.jpg?itok=Bj6rQo8r (Coffee beans and a cup of coffee)
[2]: https://adoptopenjdk.net
[3]: https://opensource.com/article/20/7/ide-java
[4]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[5]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+file
[6]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
[7]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+filenotfoundexception
[8]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+filewriter
[9]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+ioexception
[10]: https://access.redhat.com/documentation/en-us/openjdk/11/

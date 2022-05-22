[#]: subject: "Parse command options in Java with commons-cli"
[#]: via: "https://opensource.com/article/21/8/java-commons-cli"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "unigeorge"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13699-1.html"

使用 commons-cli 解析 Java 中的命令行选项
======

> 让用户用命令行选项调整你的 Java 应用程序运行方式。

![](https://img.linux.net.cn/data/attachment/album/202108/19/115907lvjwc1ce5avumaau.jpg)

通常向终端中输入命令时，无论是启动 GUI 应用程序还是仅启动终端应用程序，都可以使用 
<ruby>
    [命令行选项][2]<rp>(</rp><rt>options or switches or flags</rt><rp>)</rp>
</ruby>
 （**以下简称选项**）来修改应用程序的运行方式。这是 [POSIX 规范][3] 设定的标准，因此能够检测和解析选项对 Java 程序员而言是很有用的技能。

Java 中有若干种解析选项的方法，其中我最喜欢用的是 [Apache Commons CLI][4] 库，简称 **commons-cli**。

### 安装 commons-cli

如果你使用类似 [Maven][5] 之类的项目管理系统以及<ruby>集成开发环境<rt>Integrated Development Environment</rt></ruby>（简称 IDE），可以在项目属性（比如 `pom.xml` 配置文件或者 Eclipse 和 NetBeans 的配置选项卡）中安装 Apache Commons CLI 库。

而如果你采用手动方式管理库，则可以从 Apache 网站下载 [该库的最新版本][6]。下载到本地的是几个捆绑在一起的 JAR 文件，你只需要其中的一个文件 `commons-cli-X.Y.jar`（其中 X 和 Y 代指最新版本号）。把这个 JAR 文件或手动或使用 IDE 添加到项目，就可以在代码中使用了。

### 将库导入至 Java 代码

在使用 `commons-cli` 库之前，必须首先导入它。对于本次选项解析的简单示例而言，可以先在 `Main.java` 文件中简单写入以下标准代码：

```
package com.opensource.myoptparser;

import org.apache.commons.cli.*;

public class Main {
    public static void main(String[] args) {
    // code 
    }
}
```

至此在 Java 中解析选项的准备工作已经做好了。

### 在 Java 中定义布尔选项

要实现解析选项，首先要定义应用程序可接收的有效选项。使用 `Option`（注意是单数）类来创建选项对象，使用 `Options`（注意是复数）类来追踪项目中创建的所有选项。

首先为选项创建一个组，按照惯例命名为 `options`：

```
    //code
    Options options = new Options();
```

接下来，通过列出短选项（即选项名简写）、长选项（即全写）、默认布尔值（LCTT 译注：设置是否需要选项参数，指定为 `false` 时此选项不带参，即为布尔选项）和帮助信息来定义选项，然后设置该选项是否为必需项（LCTT 译注：下方创建 `alpha` 对象的代码中未手动设置此项），最后将该选项添加到包含所有选项的 `options` 组对象中。在下面几行代码中，我只创建了一个选项，命名为 `alpha`： 

```
    //define options
    Option alpha = new Option("a", "alpha", false, "Activate feature alpha");
    options.addOption(alpha);
```

### 在 Java 中定义带参选项

有时用户需要通过选项提供 `true` 或 `false` 以外的信息，比如给出配置文件、输入文件或诸如日期、颜色这样的设置项值。这种情况可以使用 `builder` 方法，根据选项名简写为其创建属性（例如，`-c` 是短选项，`--config` 是长选项）。完成定义后，再将定义好的选项添加到 `options` 组中：

```
    Option config = Option.builder("c").longOpt("config")
        .argName("config")
        .hasArg()
        .required(true)
        .desc("set config file").build();
    options.addOption(config);
```

`builder` 函数可以用来设置短选项、长选项、是否为必需项（本段代码中必需项设置为 `true`，也就意味着用户启动程序时必须提供此选项，否则应用程序无法运行）、帮助信息等。

### 使用 Java 解析选项

定义并添加所有可能用到的选项后，需要对用户提供的参数进行迭代处理，检测是否有参数同预设的有效短选项列表中的内容相匹配。为此要创建命令行 `CommandLine` 本身的一个实例，其中包含用户提供的所有参数（包含有效选项和无效选项）。为了处理这些参数，还要创建一个 `CommandLineParser` 对象，我在代码中将其命名为 `parser`。最后，还可以创建一个 `HelpFormatter` 对象（我将其命名为 `helper`），当参数中缺少某些必需项或者用户使用 `--help` 或 `-h` 选项时，此对象可以自动向用户提供一些有用的信息。

```
    // define parser
    CommandLine cmd;
    CommandLineParser parser = new BasicParser();
    HelpFormatter helper = new HelpFormatter();
```

最后，添加一些条件判断来分析用户提供的选项，我们假设这些选项已经作为命令行输入被获取并存储在 `cmd` 变量中。这个示例应用程序有两种不同类型的选项，但对这两种类型都可以使用 `.hasOption` 方法加上短选项名称来检测选项是否存在。检测到一个存在的选项后，就可以对数据做进一步操作了。

```
try {
    cmd = parser.parse(options, args);
    if(cmd.hasOption("a")) {
    System.out.println("Alpha activated");
    }

    if (cmd.hasOption("c")) {
    String opt_config = cmd.getOptionValue("config");
    System.out.println("Config set to " + opt_config);
    }
} catch (ParseException e) {
    System.out.println(e.getMessage());
    helper.printHelp("Usage:", options);
    System.exit(0);
}
```

解析过程有可能会产生错误，因为有时可能缺少某些必需项如本例中的 `-c` 或 `--config` 选项。这时程序会打印一条帮助信息，并立即结束运行。考虑到此错误（Java 术语中称为异常），在 `main` 方法的开头要添加语句声明可能的异常：


```
public static void main(String[] args) throws ParseException {
```

示例程序至此就大功告成了。 

### 测试代码

你可以通过调整传递给代码的默认参数来在 IDE 中测试应用程序，或者创建一个 JAR 文件并在终端运行测试。这个过程可能会因 IDE 的不同而不同。具体请参阅相应的 IDE 文档，以及我写过的关于如何创建 JAR 文件的文章，或者参考 Daniel Oh 的关于如何使用 [Maven][11] 执行同样操作的文章。

首先，省略必需项 `-c` 或 `--config` 选项，检测解析器的异常处理：

```
$ java -jar dist/myapp.jar                 
Missing required option: c
usage: Usage:
 -a,--alpha             Activate feature alpha
 -c,--config &lt;config&gt;   Set config file
```

然后提供输入选项再进行测试：

```
java -jar dist/myantapp.jar --config foo -a
Alpha activated
Config set to foo
```

### 选项解析

为用户提供选项功能对任何应用程序来说都是很重要的。有了 Java 和 Apache Commons，要实现这个功能并不难。

以下是完整的演示代码，供读者参考：

```
package com.opensource.myapp;

import org.apache.commons.cli.*;

public class Main {
    
    /**
     * @param args the command line arguments
     * @throws org.apache.commons.cli.ParseException
     */ 
    public static void main(String[] args) throws ParseException {
        // define options
        Options options = new Options();
        
        Option alpha = new Option("a", "alpha", false, "Activate feature alpha");
        options.addOption(alpha);
        
        Option config = Option.builder("c").longOpt("config")
                .argName("config")
                .hasArg()
                .required(true)
                .desc("Set config file").build();
        options.addOption(config);
     
        // define parser
        CommandLine cmd;
        CommandLineParser parser = new BasicParser();
        HelpFormatter helper = new HelpFormatter();

        try {
            cmd = parser.parse(options, args);
            if(cmd.hasOption("a")) {
                System.out.println("Alpha activated");
            }
          
            if (cmd.hasOption("c")) {
                String opt_config = cmd.getOptionValue("config");
                System.out.println("Config set to " + opt_config);
            }
        } catch (ParseException e) {
            System.out.println(e.getMessage());
            helper.printHelp("Usage:", options);
            System.exit(0);
        }
    }
}
```

### 使用 Java 和选项

选项使用户可以调整命令的工作方式。使用 Java 时解析选项的方法有很多，其中之一的 `commons-cli` 是一个强大而灵活的开源解决方案。记得在你的下一个 Java 项目中尝试一下哦。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/java-commons-cli

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[unigeorge](https://github.com/unigeorge)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/studying-books-java-couch-education.png?itok=C9gasCXr (Learning and studying technology is the key to success)
[2]: https://opensource.com/article/21/8/linux-terminal#options
[3]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[4]: https://commons.apache.org/proper/commons-cli/usage.html
[5]: https://maven.apache.org/
[6]: https://commons.apache.org/proper/commons-cli/download_cli.cgi
[7]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[8]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+option
[9]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
[10]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+parseexception
[11]: https://developers.redhat.com/blog/2021/04/08/build-even-faster-quarkus-applications-with-fast-jar

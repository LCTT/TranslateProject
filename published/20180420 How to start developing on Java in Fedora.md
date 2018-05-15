如何在 Fedora 上开始 Java 开发
======

![](https://fedoramagazine.org/wp-content/uploads/2018/04/java-getting-started-816x345.jpg)

Java 是世界上最流行的编程语言之一。它广泛用于开发物联网设备、Android 程序、Web 和企业应用。本文将提供使用 [OpenJDK][1] 安装和配置工作站的指南。

### 安装编译器和工具

在 Fedora 中安装编译器或 Java Development Kit（JDK）很容易。在写这篇文章时，可以用 v8 和 v9 版本。只需打开一个终端并输入：

```
sudo dnf install java-1.8.0-openjdk-devel
```

这安装 JDK v8。对于 v9，请输入：

```
sudo dnf install java-9-openjdk-devel
```

对于需要其他工具和库（如 Ant 和 Maven）的开发人员，可以使用 **Java Development** 组。要安装套件，请输入：

```
sudo dnf group install "Java Development"
```

要验证编译器是否已安装，请运行：

```
javac -version
```

输出显示编译器版本，如下所示：

```
javac 1.8.0_162
```

### 编译程序

你可以使用任何基本的文本编辑器（如 nano、vim 或 gedit）编写程序。这个例子提供了一个简单的 “Hello Fedora” 程序。

打开你最喜欢的文本编辑器并输入以下内容：

```
public class HelloFedora {

      public static void main (String[] args) {
              System.out.println("Hello Fedora!");
      }
}
```

将文件保存为 `HelloFedora.java`。在终端切换到包含该文件的目录并执行以下操作：

```
javac HelloFedora.java
```

如果编译器遇到任何语法错误，它会发出错误。否则，它只会在下面显示 shell 提示符。

你现在应该有一个名为 `HelloFedora` 的文件，它是编译好的程序。使用以下命令运行它：

```
java HelloFedora
```

输出将显示：

```
Hello Fedora!
```

### 安装集成开发环境（IDE）

有些程序可能更复杂，IDE 可以帮助顺利进行。Java 程序员有很多可用的 IDE，其中包括：

+ Geany，一个快速加载的基本 IDE，并提供内置模板
+ Anjuta
+ GNOME Builder，已经在 [Builder  - 这是一个专门面向 GNOME 程序开发人员的新 IDE][6] 的文章中介绍过

然而，主要用 Java 编写的最流行的开源 IDE 之一是 [Eclipse][2]。 Eclipse 在官方仓库中有。要安装它，请运行以下命令：

```
sudo dnf install eclipse-jdt
```

安装完成后，Eclipse 的快捷方式会出现在桌面菜单中。

有关如何使用 Eclipse 的更多信息，请参阅其网站上的[用户指南][3]。

### 浏览器插件

如果你正在开发 Web 小程序并需要一个用于浏览器的插件，则可以使用 [IcedTea-Web][4]。像 OpenJDK 一样，它是开源的并易于在 Fedora 中安装。运行这个命令：

```
sudo dnf install icedtea-web
```

从 Firefox 52 开始，Web 插件不再有效。有关详细信息，请访问 Mozilla 支持网站 [https://support.mozilla.org/en-US/kb/npapi-plugins?as=u&utm_source=inproduct][5]。

恭喜，你的 Java 开发环境已准备完毕。


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/start-developing-java-fedora/

作者：[Shaun Assam][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/sassam/
[1]:http://openjdk.java.net/
[2]:https://www.eclipse.org/
[3]:http://help.eclipse.org/oxygen/nav/0
[4]:https://icedtea.classpath.org/wiki/IcedTea-Web
[5]:https://support.mozilla.org/en-US/kb/npapi-plugins?as=u&utm_source=inproduct
[6]:https://fedoramagazine.org/builder-a-new-ide-specifically-for-gnome-app-developers-2/
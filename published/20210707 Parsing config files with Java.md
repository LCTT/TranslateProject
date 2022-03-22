[#]: subject: (Parsing config files with Java)
[#]: via: (https://opensource.com/article/21/7/parsing-config-files-java)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (lkxed)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14381-1.html)

使用 Java 解析 XML 文件
======

> 在你使用 Java 编写软件时实现持久化配置。

![](https://img.linux.net.cn/data/attachment/album/202203/22/091553wf2gvj20fn4wfgpw.jpg)

当你编写一个应用时，你通常都会希望用户能够定制化他们和应用交互的方式，以及应用与系统进行交互的方式。这种方式通常被称为 “<ruby>偏好<rt>preference</rt></ruby>” 或者 “<ruby>设置<rt>setting</rt></ruby>”，它们被保存在一个 “偏好文件” 或者 “配置文件” 中，有时也直接简称为 “<ruby>配置<rt>config</rt></ruby>”。配置文件可以有很多种格式，包括 INI、JSON、YAML 和 XML。每一种编程语言解析这些格式的方式都不同。本文主要讨论，当你在使用 [Java 编程语言][2] 来编写软件时，实现持久化配置的方式。

### 选择一个格式

编写配置文件是一件相当复杂的事情。我曾经试过把配置项使用逗号分隔保存在一个文本文件里，也试过把配置项保存在非常详细的 YAML 和 XML 中。对于配置文件来说，最重要是要有一致性和规律性，它们使你可以简单快速地编写代码，从配置文件中解析出数据；同时，当用户决定要做出修改时，很方便地保存和更新配置。

目前有 [几种流行的配置文件格式][3]。对于大多数常见的配置文件格式，Java 都有对应的<ruby>库<rt>library</rt></ruby>。在本文中，我将使用 XML 格式。对于一些项目，你可能会选择使用 XML，因为它的一个突出特点是能够为包含的数据提供大量相关的元数据，而在另外一些项目中，你可能会因为 XML 的冗长而不选择它。在 Java 中使用 XML 是非常容易的，因为它默认包含了许多健壮的 XML 库。

### XML 基础

讨论 XML 可是一个大话题。我有一本关于 XML 的书，它有超过 700 页的内容。幸运的是，使用 XML 并不需要非常了解它的诸多特性。就像 HTML 一样，XML 是一个带有开始和结束标记的分层标记语言，每一个标记（标签）内可以包含零个或更多数据。下面是一个 XML 的简单示例片段：


```
<xml>
  <node>
    <element>Penguin</element>
  </node>
</xml>
```

在这个 <ruby>自我描述的<rt>self-descriptive</rt></ruby> 例子中，XML 解析器使用了以下几个概念：

  * <ruby>文档<rt>Document</rt></ruby>：`<xml>` 标签标志着一个 _文档_ 的开始，`</xml>` 标签标志着这个文档的结束。
  * <ruby>节点<rt>Node</rt></ruby>：`<node>` 标签代表了一个 _节点_。
  * <ruby>元素<rt>Element</rt></ruby>：`<element>Penguin</element>` 中，从开头的 `<` 到最后的 `>` 表示了一个 _元素_。
  * <ruby>内容<rt>Content</rt></ruby>： 在 `<element>` 元素里，字符串 `Penguin` 就是 _内容_。

不管你信不信，只要了解了以上几个概念，你就可以开始编写、解析 XML 文件了。

### 创建一个示例配置文件

要学习如何解析 XML 文件，只需要一个极简的示例文件就够了。假设现在有一个配置文件，里面保存的是关于一个图形界面窗口的属性：

```
<xml>
  <window>
    <theme>Dark</theme>
    <fullscreen>0</fullscreen>
    <icons>Tango</icons>
</window>
</xml>
```

创建一个名为 `~/.config/DemoXMLParser` 的目录：

```
$ mkdir ~/.config/DemoXMLParser
```

在 Linux 中，`~/.config` 目录是存放配置文件的默认位置，这是在 [自由桌面工作组][4] 的规范中定义的。如果你正在使用一个不遵守 <ruby>自由桌面工作组<rt>Freedesktop</rt><ruby> 标准的操作系统，你也仍然可以使用这个目录，只不过你需要自己创建这些目录了。

复制 XML 的示例配置文件，粘贴并保存为 `~/.config/DemoXMLParser/myconfig.xml` 文件。

### 使用 Java 解析 XML

如果你是 Java 的初学者，你可以先阅读我写的 [面向 Java 入门开发者的 7 个小技巧][5]。一旦你对 Java 比较熟悉了，打开你最喜爱的集成开发工具（IDE），创建一个新工程。我会把我的新工程命名为 `myConfigParser`。

刚开始先不要太关注依赖导入和异常捕获这些，你可以先尝试用 `javax` 和 `java.io` 包里的标准 Java 扩展来实例化一个解析器。如果你使用了 IDE，它会提示你导入合适的依赖。如果没有，你也可以在文章稍后的部分找到完整的代码，里面就有完整的依赖列表。


```
Path configPath = Paths.get(System.getProperty("user.home"), ".config", "DemoXMLParser");
File configFile = new File(configPath.toString(), "myconfig.xml");

DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();

DocumentBuilder builder = null;
builder = factory.newDocumentBuilder();

Document doc = null;
doc = builder.parse(configFile);
doc.getDocumentElement().normalize();
```

这段示例代码使用了 `java.nio.Paths` 类来找到用户的主目录，然后在拼接上默认配置文件的路径。接着，它用 `java.io.File` 类来把配置文件定义为一个 `File` 对象。

紧接着，它使用了 `javax.xml.parsers.DocumentBuilder` 和 `javax.xml.parsers.DocumentBuilderFactory` 这两个类来创建一个内部的文档构造器，这样 Java 程序就可以导入并解析 XML 数据了。

最后，Java 创建一个叫 `doc` 的文档对象，并且把 `configFile` 文件加载到这个对象里。通过使用 `org.w3c.dom` 包，它读取并规范化了 XML 数据。

基本上就是这样啦。理论上来讲，你已经完成了数据解析的工作。可是，如果你不能够访问数据的话，数据解析也没有多少用处嘛。所以，就让我们再来写一些查询，从你的配置中读取重要的属性值吧。

### 使用 Java 访问 XML 的值

从你已经读取的 XML 文档中获取数据，其实就是要先找到一个特定的节点，然后遍历它包含的所有元素。通常我们会使用多个循环语句来遍历节点中的元素，但是为了保持代码可读性，我会尽可能少地使用循环语句：

```
NodeList nodes = doc.getElementsByTagName("window");

for (int i = 0; i < nodes.getLength(); i++) {
 Node mynode = nodes.item(i);
 System.out.println("Property = " + mynode.getNodeName());
       
 if (mynode.getNodeType() == Node.ELEMENT_NODE) {
   Element myelement = (Element) mynode;
             
   System.out.println("Theme = " + myelement.getElementsByTagName("theme").item(0).getTextContent());
   System.out.println("Fullscreen = " + myelement.getElementsByTagName("fullscreen").item(0).getTextContent());
   System.out.println("Icon set = " + myelement.getElementsByTagName("icons").item(0).getTextContent());
 }
}
```

这段示例代码使用了 `org.w3c.dom.NodeList` 类，创建了一个名为 `nodes` 的 `NodeList` 对象。这个对象包含了所有名字匹配字符串 `window` 的子节点，实际上这样的节点只有一个，因为本文的示例配置文件中只配置了一个。

紧接着，它使用了一个 `for` 循环来遍历 `nodes` 列表。具体过程是：根据节点出现的顺序逐个取出，然后交给一个 `if-then` 子句处理。这个 `if-then` 子句创建了一个名为 `myelement` 的 `Element` 对象，其中包含了当前节点下的所有元素。你可以使用例如 `getChildNodes` 和 `getElementById` 方法来查询这些元素，项目中还 [记录了][9] 其他查询方法。

在这个示例中，每个元素就是配置的键。而配置的值储存在元素的内容中，你可以使用 `.getTextContent` 方法来提取出配置的值。

在你的 IDE 中运行代码（或者运行编译后的二进制文件）：

```
$ java ./DemoXMLParser.java
Property = window
Theme = Dark
Fullscreen = 0
Icon set = Tango
```

下面是完整的代码示例：

```
package myConfigParser;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class ConfigParser {

        public static void main(String[] args) {
                Path configPath = Paths.get(System.getProperty("user.home"), ".config", "DemoXMLParser");
                File configFile = new File(configPath.toString(), "myconfig.xml");
                DocumentBuilderFactory factory =
                DocumentBuilderFactory.newInstance();
                DocumentBuilder builder = null;
               
                try {
                        builder = factory.newDocumentBuilder();
                } catch (ParserConfigurationException e) {
                        e.printStackTrace();
                }
       
                Document doc = null;
       
                try {
                        doc = builder.parse(configFile);
                } catch (SAXException e) {
                        e.printStackTrace();
                } catch (IOException e) {
                        e.printStackTrace();
                }
        doc.getDocumentElement().normalize();
       
        NodeList nodes = doc.getElementsByTagName("window");
        for (int i = 0; i < nodes.getLength(); i++) {
           Node mynode = nodes.item(i);
           System.out.println("Property = " + mynode.getNodeName());
           
           if (mynode.getNodeType() == Node.ELEMENT_NODE) {
               Element myelement = (Element) mynode;

               System.out.println("Theme = " + myelement.getElementsByTagName("theme").item(0).getTextContent());
               System.out.println("Fullscreen = " + myelement.getElementsByTagName("fullscreen").item(0).getTextContent());
               System.out.println("Icon set = " + myelement.getElementsByTagName("icons").item(0).getTextContent());
           } // close if
        } // close for
    } // close method
} //close class
```

### 使用 Java 更新 XML

用户时不时地会改变某个偏好项，这时候 `org.w3c.dom` 库就可以帮助你更新某个 XML 元素的内容。你只需要选择这个 XML 元素，就像你读取它时那样。不过，此时你不再使用 `.getTextContent` 方法，而是使用 `.setTextContent` 方法。

```
updatePref = myelement.getElementsByTagName("fullscreen").item(0);
updatePref.setTextContent("1");

System.out.println("Updated fullscreen to " + myelement.getElementsByTagName("fullscreen").item(0).getTextContent());  
```

这么做会改变应用程序内存中的 XML 文档，但是还没有把数据写回到磁盘上。配合使用 `javax` 和 `w3c` 库，你就可以把读取到的 XML 内容写回到配置文件中。

```
TransformerFactory transformerFactory = TransformerFactory.newInstance();

Transformer xtransform;
xtransform = transformerFactory.newTransformer();

DOMSource mydom = new DOMSource(doc);
StreamResult streamResult = new StreamResult(configFile);

xtransform.transform(mydom, streamResult);
```

这么做会没有警告地写入转换后的数据，并覆盖掉之前的配置。

下面是完整的代码，包括更新 XML 的操作：

```
package myConfigParser;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class ConfigParser {

        public static void main(String[] args) {
                Path configPath = Paths.get(System.getProperty("user.home"), ".config", "DemoXMLParser");
                File configFile = new File(configPath.toString(), "myconfig.xml");
                DocumentBuilderFactory factory =
                DocumentBuilderFactory.newInstance();
                DocumentBuilder builder = null;
               
                try {
                        builder = factory.newDocumentBuilder();
                } catch (ParserConfigurationException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                }
       
                Document doc = null;
       
                try {
                        doc = builder.parse(configFile);
                } catch (SAXException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                } catch (IOException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                }
        doc.getDocumentElement().normalize();
        Node updatePref = null;
//        NodeList nodes = doc.getChildNodes();
        NodeList nodes = doc.getElementsByTagName("window");
        for (int i = 0; i < nodes.getLength(); i++) {
           Node mynode = nodes.item(i);
           System.out.println("Property = " + mynode.getNodeName());
           
           if (mynode.getNodeType() == Node.ELEMENT_NODE) {
               Element myelement = (Element) mynode;

               System.out.println("Theme = " + myelement.getElementsByTagName("theme").item(0).getTextContent());
               System.out.println("Fullscreen = " + myelement.getElementsByTagName("fullscreen").item(0).getTextContent());
               System.out.println("Icon set = " + myelement.getElementsByTagName("icons").item(0).getTextContent());

               updatePref = myelement.getElementsByTagName("fullscreen").item(0);
               updatePref.setTextContent("2");
               System.out.println("Updated fullscreen to " + myelement.getElementsByTagName("fullscreen").item(0).getTextContent());          
           } // close if
           
        }// close for

        // write DOM back to the file
        TransformerFactory transformerFactory = TransformerFactory.newInstance();
        Transformer xtransform;

        DOMSource mydom = new DOMSource(doc);
        StreamResult streamResult = new StreamResult(configFile);

        try {
                xtransform = transformerFactory.newTransformer();
                xtransform.transform(mydom, streamResult);
        } catch (TransformerException e) {
                e.printStackTrace();
        }
                       
    } // close method
} //close class
```

### 如何保证配置不出问题

编写配置文件看上去是一个还挺简单的任务。一开始，你可能会用一个简单的文本格式，因为你的应用程序只要寥寥几个配置项而已。但是，随着你引入了更多的配置项，读取或者写入错误的数据可能会给你的应用程序带来意料之外的错误。一种帮助你保持配置过程安全、不出错的方法，就是使用类似 XML 的规范格式，然后依靠你用的编程语言的内置功能来处理这些复杂的事情。

这也正是我喜欢使用 Java 和 XML 的原因。每当我试图读取错误的配置值时，Java 就会提醒我。通常，这是由于我在代码中试图获取的节点，并不存在于我期望的 XML 路径中。XML 这种高度结构化的格式帮助了代码保持可靠性，这对用户和开发者来说都是有好处的。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/parsing-config-files-java

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[lkxed](https://github.com/lkxed)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_tea_laptop_computer_work_desk.png?itok=D5yMx_Dr (Person drinking a hot drink at the computer)
[2]: https://opensource.com/resources/java
[3]: https://opensource.com/article/21/6/what-config-files
[4]: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
[5]: https://opensource.com/article/19/10/java-basics
[6]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+system
[7]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+file
[8]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+document
[9]: https://www.w3.org/2003/01/dom2-javadoc/org/w3c/dom/Document.html
[10]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[11]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+ioexception
[12]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+element

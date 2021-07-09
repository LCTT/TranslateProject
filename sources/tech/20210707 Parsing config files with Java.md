[#]: subject: (Parsing config files with Java)
[#]: via: (https://opensource.com/article/21/7/parsing-config-files-java)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (Starryi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Parsing config files with Java
======
Implement persistent settings when you're writing software in Java.
![Person drinking a hot drink at the computer][1]

When you write an application, you often want users to be able to configure how they interact with it and how it interacts with their system. These are commonly called "preferences" or "settings," and they're stored in "preference files" or "configuration files," or just "configs." There are many different formats for config files, including INI, JSON, YAML, and XML, and every language parses these languages differently. This article discusses some of the ways you can implement persistent settings when you're writing software in the [Java programming language][2].

### Choose a format

Writing configuration files is surprisingly flexible. I've kept configuration options in a simple comma-delimited text file, and I've kept options in highly detailed YAML or XML. The most important thing about configuration files is that they are consistent and predictable. This makes it easy for you to write code that can quickly and easily extract data from the configuration file, as well as save and update options when the user decides to make a change.

There are [several popular formats for configuration files][3]. Java has libraries for most of the common configuration formats, but in this article, I'll use the XML format. For some projects, you might choose to use XML for its inherent ability to provide lots of metadata about the data it contains, while for others, you may choose to avoid it due to its verbosity. Java makes working with XML relatively easy because it includes robust XML libraries by default.

### XML basics

XML is a big topic. Just one of the books I own about XML is over 700 pages. Fortunately, using XML doesn't require in-depth knowledge of all its many features. Like HTML, XML is a hierarchical markup language with opening and closing tags, which may contain zero or more data. Here's a sample snippet of XML:


```
&lt;xml&gt;
  &lt;node&gt;
    &lt;element&gt;Penguin&lt;/element&gt;
  &lt;/node&gt;
&lt;/xml&gt;
```

In this rather self-descriptive example, here are the terms that XML parsers use:

  * **Document:** The `<xml>` tag opens a _document_, and the `</xml>` tag closes it.
  * **Node:** The `<node>` tag is a _node_.
  * **Element:** The `<element>Penguin</element>`, from the first `<` to the last `>`, is an _element_.
  * **Content:** In the `<element>` element, the string `Penguin` is the _content_.



Believe it or not, that's all you need to know about XML to be able to write and parse it.

### Create a sample config file

A minimal example of a config file is all you need to learn how to parse XML. Imagine a config file tracking some display properties of a GUI window:


```
&lt;xml&gt;
  &lt;window&gt;
    &lt;theme&gt;Dark&lt;/theme&gt;
    &lt;fullscreen&gt;0&lt;/fullscreen&gt;
    &lt;icons&gt;Tango&lt;/icons&gt;
&lt;/window&gt;
&lt;/xml&gt;
```

Create a directory called `~/.config/DemoXMLParser`:


```
`$ mkdir ~/.config/DemoXMLParser`
```

On Linux, the `~/.config` directory is the default configuration file location, as defined by the [Freedesktop][4] specification. If you're on an operating system that doesn't follow Freedesktop standards, you can still use this location, but you may have to create all the directories yourself.

Copy and paste the sample configuration XML into a file and save it as `~/.config/DemoXMLParser/myconfig.xml`.

### Parse XML with Java

If you're new to Java, start by reading my [7 tips for new Java developers][5] article. Once you're relatively comfortable with Java, open your favorite integrated development environment (IDE) and create a new project. I call mine **myConfigParser**.

Without worrying too much about imports and error catching initially, you can instantiate a parser using the standard Java extensions found in the `javax` and `java.io` libraries. If you're using an IDE, you'll be prompted to import the appropriate libraries; otherwise, you can find a full list of libraries in the complete version of this code later in this article.


```
Path configPath = Paths.get([System][6].getProperty("user.home"), ".config", "DemoXMLParser");
[File][7] configFile = new [File][7](configPath.toString(), "myconfig.xml");

DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();

DocumentBuilder builder = null;
builder = factory.newDocumentBuilder();

[Document][8] doc = null;
doc = builder.parse(configFile);
doc.getDocumentElement().normalize();
```

This example code uses the `java.nio.Paths` library to locate the user's home directory, adding the default configuration location to the path. Then it defines the configuration file to be parsed as a File object using the `java.io.File` library.

Next, it uses the `javax.xml.parsers.DocumentBuilder` and `javax.xml.parsers.DocumentBuilderFactory` libraries to create an internal document builder so that the Java program can ingest and parse XML data.

Finally, Java builds a document called `doc` and loads the `configFile` file into it. Using `org.w3c.dom` libraries, it normalizes the ingested XML data.

That's essentially it. Technically, you're done parsing the data. But parsed data isn't of much use to you if you can't access it, so write some queries to extract important values from your configuration.

### Accessing XML values with Java

Getting data from your ingested XML document is a matter of referencing a specific node and then "walking" through the elements it contains. It's common to use a series of loops to iterate through elements in nodes, but I'll keep that to a minimum here, just to keep the code easy to read:


```
NodeList nodes = doc.getElementsByTagName("window");

for (int i = 0; i &lt; nodes.getLength(); i++) {
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

This sample code creates a `NodeList` object called `nodes` using the `org.w3c.dom.NodeList;` library. This object contains any child node with a name that matches the string `window`, which is the only node in the sample config file created in this article.

Next, it creates a for-loop to iterate over the `nodes` list, taking each node in order of appearance and processing it with an if-then loop. The if-then loop creates an `Element` object called `myelement` that contains all elements within the current node. You can query the elements using methods like `getChildNodes`, `getElementById`, and others, as [documented][9] by the project.

In this example, the elements are essentially the configuration keys. The values are stored as the content of the element, which you can extract with the `.getTextContent` method.

Run the code either in your IDE or as a binary:


```
$ java ./DemoXMLParser.java
Property = window
Theme = Dark
Fullscreen = 0
Icon set = Tango
```

Here's the full code:


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

        public static void main([String][10][] args) {
                Path configPath = Paths.get([System][6].getProperty("user.home"), ".config", "DemoXMLParser");
                [File][7] configFile = new [File][7](configPath.toString(), "myconfig.xml");
                DocumentBuilderFactory factory =
                DocumentBuilderFactory.newInstance();
                DocumentBuilder builder = null;
               
                try {
                        builder = factory.newDocumentBuilder();
                } catch (ParserConfigurationException e) {
                        e.printStackTrace();
                }
       
                [Document][8] doc = null;
       
                try {
                        doc = builder.parse(configFile);
                } catch (SAXException e) {
                        e.printStackTrace();
                } catch ([IOException][11] e) {
                        e.printStackTrace();
                }
        doc.getDocumentElement().normalize();
       
        NodeList nodes = doc.getElementsByTagName("window");
        for (int i = 0; i &lt; nodes.getLength(); i++) {
           Node mynode = nodes.item(i);
           [System][6].out.println("Property = " + mynode.getNodeName());
           
           if (mynode.getNodeType() == Node.ELEMENT_NODE) {
               [Element][12] myelement = ([Element][12]) mynode;

               [System][6].out.println("Theme = " + myelement.getElementsByTagName("theme").item(0).getTextContent());
               [System][6].out.println("Fullscreen = " + myelement.getElementsByTagName("fullscreen").item(0).getTextContent());
               [System][6].out.println("Icon set = " + myelement.getElementsByTagName("icons").item(0).getTextContent());
           } // close if
        } // close for
    } // close method
} //close class
```

### Updating XML with Java

From time to time, a user is going to change a preference. The `org.w3c.dom` libraries can update the contents of an XML element; you only have to select the XML element the same way you did when reading it. Instead of using the `.getTextContent` method, you use the `.setTextContent` method:


```
updatePref = myelement.getElementsByTagName("fullscreen").item(0);
updatePref.setTextContent("1");

[System][6].out.println("Updated fullscreen to " + myelement.getElementsByTagName("fullscreen").item(0).getTextContent());  
```

This changes the XML document in your application's memory, but it doesn't write the data back to the drive. Using a combination of `javax` and `w3c` libraries, you can place your ingested XML back into your configuration file:


```
TransformerFactory transformerFactory = TransformerFactory.newInstance();

Transformer xtransform;
xtransform = transformerFactory.newTransformer();

DOMSource mydom = new DOMSource(doc);
StreamResult streamResult = new StreamResult(configFile);

xtransform.transform(mydom, streamResult);
```

This silently overwrites the previous configuration file with transformed data.

Here's the full code, complete with the updater:


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

        public static void main([String][10][] args) {
                Path configPath = Paths.get([System][6].getProperty("user.home"), ".config", "DemoXMLParser");
                [File][7] configFile = new [File][7](configPath.toString(), "myconfig.xml");
                DocumentBuilderFactory factory =
                DocumentBuilderFactory.newInstance();
                DocumentBuilder builder = null;
               
                try {
                        builder = factory.newDocumentBuilder();
                } catch (ParserConfigurationException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                }
       
                [Document][8] doc = null;
       
                try {
                        doc = builder.parse(configFile);
                } catch (SAXException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                } catch ([IOException][11] e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                }
        doc.getDocumentElement().normalize();
        Node updatePref = null;
//        NodeList nodes = doc.getChildNodes();
        NodeList nodes = doc.getElementsByTagName("window");
        for (int i = 0; i &lt; nodes.getLength(); i++) {
           Node mynode = nodes.item(i);
           [System][6].out.println("Property = " + mynode.getNodeName());
           
           if (mynode.getNodeType() == Node.ELEMENT_NODE) {
               [Element][12] myelement = ([Element][12]) mynode;

               [System][6].out.println("Theme = " + myelement.getElementsByTagName("theme").item(0).getTextContent());
               [System][6].out.println("Fullscreen = " + myelement.getElementsByTagName("fullscreen").item(0).getTextContent());
               [System][6].out.println("Icon set = " + myelement.getElementsByTagName("icons").item(0).getTextContent());

               updatePref = myelement.getElementsByTagName("fullscreen").item(0);
               updatePref.setTextContent("2");
               [System][6].out.println("Updated fullscreen to " + myelement.getElementsByTagName("fullscreen").item(0).getTextContent());          
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

### Keep configuration trouble-free

Configuration can be a deceptively simple routine. You might start with a simple plain text config format while your application has only a few configurable features, but as you introduce more options, reading or writing incorrect data can cause unexpected behavior from your application. One way to help keep your configuration process safe from failure is to use a strict format like XML and to lean on your programming language's built-in features to handle the complexity.

I like using Java and XML for this very reason. When I try to read the wrong configuration value, Java lets me know, often because the node my code claims to want to read doesn't exist in the XML path I expect. XML's highly structured format helps me keep my code reliable, and that benefits both the users and the developer.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/parsing-config-files-java

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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

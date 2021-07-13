[#]: subject: (What is XML?)
[#]: via: (https://opensource.com/article/21/7/what-xml)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (amwps290)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

What is XML?
======
Get to know XML, a strict yet flexible markup language used for
everything from documentation to graphics.
![Computer screen with files or windows open][1]

XML is a hierarchical markup language. It uses opening and closing tags to define data. It's used to store and exchange data, and because of its extreme flexibility, it's used for everything from [documentation][2] to [graphics][3].

Here's a sample XML document:


```
&lt;xml&gt;
  &lt;os&gt;
   &lt;linux&gt;
    &lt;distribution&gt;
      &lt;name&gt;Fedora&lt;/name&gt;
      &lt;release&gt;8&lt;/release&gt;
      &lt;codename&gt;Werewolf&lt;/codename&gt;
    &lt;/distribution&gt;

    &lt;distribution&gt;
      &lt;name&gt;Slackware&lt;/name&gt;
      &lt;release&gt;12.1&lt;/release&gt;
      &lt;mascot&gt;
        &lt;official&gt;Tux&lt;/official&gt;
        &lt;unofficial&gt;Bob Dobbs&lt;/unofficial&gt;
      &lt;/mascot&gt;
    &lt;/distribution&gt;
   &lt;/linux&gt;
  &lt;/os&gt;    
&lt;/xml&gt;
```

Reading the sample XML, you might find there's an intuitive quality to the format. You can probably understand the data in this document whether you're familiar with the subject matter or not. This is partly because XML is considered verbose. It uses lots of tags, the tags can have long and descriptive names, and the data is ordered in a hierarchical manner that helps explain the data's relationships. You probably understand from this sample that the Fedora distribution and the Slackware distribution are two different and unrelated instances of Linux because each one is "contained" inside its own independent `<distribution>` tag.

XML is also extremely flexible. Unlike HTML, there's no predefined list of tags. You are free to create whatever data structure you need to represent.

### Components of XML

Data exists to be read, and when a computer "reads" data, the process is called _parsing_. Using the sample XML data again, here are the terms that most XML parsers consider significant.

  * **Document:** The `<xml>` tag opens a _document_, and the `</xml>` tag closes it.
  * **Node:** The `<os>`, `<distribution>`, and `<mascot>` are _nodes_. In parsing terminology, a node is a tag that contains other tags.
  * **Element:** An entity such as `<name>Fedora</name>` and `<official>Tux</official>`, from the first `<` to the last `>` is an _element_.
  * **Content:** The data between two element tags is considered _content_. In the first `<name>` element, the string `Fedora` is the content.



### XML schema

Tags and tag inheritance in an XML document are known as _schema_.

Some schemas are made up as you go (for example, the sample XML code in this article was purely improvised), while others are strictly defined by a standards group. For example, the Scalable Vector Graphics (SVG) schema is [defined by the W3C][4], while the [DocBook schema][5] is defined by Norman Walsh.

A schema enforces consistency. The most basic schemas are usually also the most restrictive. In my example XML code, it wouldn't make sense to place a distribution name within the `<mascot>` node because the implied schema of the document makes it clear that a mascot must be a "child" element of a distribution.

### Data object model (DOM)

Talking about XML would get confusing if you had to constantly describe tags and positions (e.g., "the name tag of the second distribution tag in the Linux part of the OS section"), so parsers use the concept of a Document Object Model (DOM) to represent XML data. The DOM places XML data into a sort of "family tree" structure, starting from the root element (in my sample XML, that's the `os` tag) and including each tag.

![Document Object Model][6]

(Seth Kenlon, [CC BY-SA 4.0][7])

This same XML data structure can be expressed as paths, just like files in a Linux system or the location of web pages on the internet. For instance, the path to the `<mascot>` tag can be represented as `//os/linux/distribution/slackware/mascot`.

The path to _both_ `<distribution>` tags can be represented as `//os/linux/distribution`. Because there are two distribution nodes, a parser loads both nodes (and the contents of each) into an array that can be queried.

### Strict XML

XML is also known for being strict. This means that most applications are designed to intentionally fail when they encounter errors in XML. That may sound problematic, but it's one of the things developers appreciate most about XML because unpredictable things can happen when applications try to guess how to resolve an error. For example, back before HTML was well defined, most web browsers included a "quirks mode" so that when people tried to view poor HTML code, the web browser could load what the author _probably_ intended. The results were wildly unpredictable, especially when one browser guessed differently than another.

XML disallows this by intentionally failing when there's an error. This lets the author fix errors until they produce valid XML. Because XML is well-defined, there are validator plugins for many applications and standalone commands like `xmllint` and `xmlstarlet` to help you locate errors early.

### Transforming XML

Because XML is often used as an interchange format, it's common to transform XML into some other data format or into some other XML schema. Classic examples include XSLTProc, xmlto, and [pandoc][8], but technically there are many other applications designed, at least in part, to convert XML.

In fact, LibreOffice uses XML to layout its word processor and spreadsheet documents, so any time you export or [convert a file from LibreOffice][9], you're transforming XML.

[Ebooks in the open source EPUB format][10] use XML, so any time you [convert a document into an EPUB][11] or from an EPUB, you're transforming XML.

Inkscape, the vector-based illustration application, saves its files in SVG, which is an XML schema designed for graphics. Any time you export an image from Inkscape as a PNG file, you're transforming XML.

The list could go on and on. XML is a data storage format, and it's designed to ensure that your data, whether it's points and lines on a canvas, nodes on a chart, or just words in a document, can be easily and accurately extracted, updated, and converted. 

### Learning XML

Writing XML is a lot like writing HTML. Thanks to the hard work of Jay Nick, [free and fun XML lessons are available online][3] that teach you how to create graphics with XML.

In general, very few special tools are required to explore XML. Thanks to the close relationship between HTML and XML, you can [view XML using a web browser][12]. In addition, open source text editors like [QXmlEdit][13], [NetBeans][14], and [Kate][15] make typing and reading XML easy with helpful prompts, autocompletion, syntax verification, and more.

### Choose XML

XML may look like a lot of data at first, but it's not that much different than HTML (in fact, HTML has been [reimplemented as XML in the form of XHTML][16]). XML has the unique benefit that the components forming its structure also happen to be metadata providing information about what it's storing. A well-designed XML schema contains and describes your data, allowing a user to understand it at a glance and parse it quickly, and enabling developers to [parse it efficiently][17] with convenient programming libraries.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/what-xml

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY (Computer screen with files or windows open)
[2]: https://opensource.com/article/17/9/docbook
[3]: https://opensource.com/article/17/5/coding-scalable-vector-graphics-make-steam
[4]: https://www.w3.org/TR/SVG11/
[5]: http://docbook.org
[6]: https://opensource.com/sites/default/files/uploads/dom.jpg (Document Object Model)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://opensource.com/article/20/5/pandoc-cheat-sheet
[9]: https://opensource.com/article/21/3/libreoffice-command-line
[10]: https://opensource.com/education/15/11/ebook-open-formats
[11]: https://opensource.com/life/13/8/how-create-ebook-open-source-way
[12]: https://opensource.com/article/18/12/xml-browser
[13]: https://opensource.com/article/17/7/7-ways-handle-xml-qxmledit
[14]: https://opensource.com/article/20/12/netbeans
[15]: https://opensource.com/article/20/12/kate-text-editor
[16]: https://www.w3.org/TR/xhtml1/
[17]: https://opensource.com/article/21/6/parsing-config-files-java

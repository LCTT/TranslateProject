[#]: collector: (lujun9972)
[#]: translator: (wwhio)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10515-1.html)
[#]: subject: (XML vs JSON)
[#]: via: (https://www.cs.tufts.edu/comp/150IDS/final_papers/tstras01.1/FinalReport/FinalReport.html)
[#]: author: (TOM STRASSNER tomstrassner@gmail.com)

XML 与 JSON 优劣对比
======

### 简介

XML 和 JSON 是现今互联网中最常用的两种数据交换格式。XML 格式由 W3C 于 1996 年提出。JSON 格式由 Douglas Crockford 于 2002 年提出。虽然这两种格式的设计目标并不相同，但它们常常用于同一个任务，也就是数据交换中。XML 和 JSON 的文档都很完善（[RFC 7159][1]、[RFC 4825][2]），且都同时具有<ruby>人类可读性<rt>human-readable</rt></ruby>和<ruby>机器可读性<rt>machine-readable</rt></ruby>。这两种格式并没有哪一个比另一个更强，只是各自适用的领域不用。（LCTT 译注：W3C 是[互联网联盟](https://www.w3.org/)，制定了各种 Web 相关的标准，如 HTML、CSS 等。Douglas Crockford 除了制定了 JSON 格式，还致力于改进 JavaScript，开发了 JavaScript 相关工具 [JSLint](http://jslint.com/) 和 [JSMin](http://www.crockford.com/javascript/jsmin.html)）

### XML 的优点

XML 与 JSON 相比有很多优点。二者间最大的不同在于 XML 可以通过在标签中添加属性这一简单的方法来存储<ruby>元数据<rt>metadata</rt></ruby>。而使用 JSON 时需要创建一个对象，把元数据当作对象的成员来存储。虽然二者都能达到存储元数据的目的，但在这一情况下 XML 往往是更好的选择，因为 JSON 的表达形式会让客户端程序开发人员误以为要将数据转换成一个对象。举个例子，如果你的 C++ 程序需要使用 JSON 格式发送一个附带元数据的整型数据，需要创建一个对象，用对象中的一个<ruby>名称/值对<rt>name/value pair</rt></ruby>来记录整型数据的值，再为每一个附带的属性添加一个名称/值对。接收到这个 JSON 的程序在读取后很可能把它当成一个对象，可事实并不是这样。虽然这是使用 JSON 传递元数据的一种变通方法，但他违背了 JSON 的核心理念：“<ruby>JSON 的结构与常规的程序语言中的结构相对应，而无需修改。<rt>JSON's structures look like conventional programming language structures. No restructuring is necessary.</rt></ruby>”[^2]

虽然稍后我会说这也是 XML 的一个缺点，但 XML 中对命名冲突、<ruby>前缀<rt>prefix</rt></ruby>的处理机制赋予了它 JSON 所不具备的能力。程序员们可以通过前缀来把统一名称给予两个不同的实体。[^1] 当不同的实体在客户端中使用的名称相同时，这一特性会非常有用。

XML 的另一个优势在于大多数的浏览器可以把它以<ruby>具有高可读性和强组织性的方式<rt>highly readable and organized way</rt></ruby>展现给用户。XML 的树形结构让它易于结构化，浏览器也让用户可以自行展开或折叠树中的元素，这简直就是调试的福音。

XML 对比 JSON 有一个很重要的优势就是它可以记录<ruby>混合内容<rt>mixed content</rt></ruby>。例如在 XML 中处理包含结构化标记的字符串时，程序员们只要把带有标记的文本放在一个标签内就可以了。可因为 JSON 只包含数据，没有用于指明标签的简单方式，虽然可以使用处理元数据的解决方法，但这总有点滥用之嫌。

### JSON 的优点

JSON 自身也有很多优点。其中最显而易见的一点就是 JSON 比 XML 简洁得多。因为 XML 中需要打开和关闭标签，而 JSON 使用名称/值对表示数据，使用简单的 `{` 和 `}` 来标记对象，`[` 和 `]` 来标记数组，`,` 来表示数据的分隔，`:` 表示名称和值的分隔。就算是使用 gzip 压缩，JSON 还是比 XML 要小，而且耗时更少。[^6] 正如 Sumaray 和 Makki 在实验中指出的那样，JSON 在很多方面都比 XML 更具优势，得出同样结果的还有 Nurseitov、Paulson、Reynolds 和 Izurieta。首先，由于 JSON 文件天生的简洁性，与包含相同信息的 XML 相比，JSON 总是更小，这意味着更快的传输和处理速度。第二，在不考虑大小的情况下，两组研究 [^3] [^4] 表明使用 JSON 执行序列化和反序列化的速度显著优于使用 XML。第三，后续的研究指出 JSON 的处理在 CPU 资源的使用上也优于 XML。研究人员发现 JSON 在总体上使用的资源更少，其中更多的 CPU 资源消耗在用户空间，系统空间消耗的 CPU 资源较少。这一实验是在 RedHat 的设备上进行的，RedHat 表示更倾向于在用户空间使用 CPU 资源。[^3a] 不出意外，Sumaray 和 Makki 在研究里还说明了在移动设备上 JSON 的性能也优于 XML。[^4a] 这是有道理的，因为 JSON 消耗的资源更少，而移动设备的性能也更弱。

JSON 的另一个优点在于其对对象和数组的表述和<ruby>宿主语言<rt>host language</rt></ruby>中的数据结构相对应，例如<ruby>对象<rt>object</rt></ruby>、<ruby>记录<rt>record</rt></ruby>、<ruby>结构体<rt>struct</rt></ruby>、<ruby>字典<rt>dictionary</rt></ruby>、<ruby>哈希表<rt>hash table</rt></ruby>、<ruby>键值列表<rt>keyed list</rt></ruby>还有<ruby>数组<rt>array</rt></ruby>、<ruby>向量<rt>vector</rt></ruby>、<ruby>列表<rt>list</rt></ruby>，以及对象组成的数组等等。[^2a] 虽然 XML 里也能表达这些数据结构，也只需调用一个函数就能完成解析，而往往需要更多的代码才能正确的完成 XML 的序列化和反序列化处理。而且 XML 对于人类来说不如 JSON 那么直观，XML 标准缺乏对象、数组的标签的明确定义。当结构化的标记可以替代嵌套的标签时，JSON 的优势极为突出。JSON 中的花括号和中括号则明确表示了数据的结构，当然这一优势也包含前文中的问题，在表示元数据时 JSON 不如 XML 准确。

虽然 XML 支持<ruby>命名空间<rt>namespace</rt></ruby>与<ruby>前缀<rt>prefix</rt></ruby>，但这不代表 JSON 没有处理命名冲突的能力。比起 XML 的前缀，它处理命名冲突的方式更简洁，在程序中的处理也更自然。在 JSON 里，每一个对象都在它自己的命名空间中，因此不同对象内的元素名称可以随意重复。在大多数编程语言中，不同的对象中的成员可以包含相同的名字，所以 JSON 根据对象进行名称区分的规则在处理时更加自然。

也许 JSON 比 XML 更优的部分是因为 JSON 是 JavaScript 的子集，所以在 JavaScript 代码中对它的解析或封装都非常的自然。虽然这看起来对 JavaScript 程序非常有用，而其他程序则不能直接从中获益，可实际上这一问题已经被很好的解决了。现在 JSON 的网站的列表上展示了 64 种不同语言的 175 个工具，它们都实现了处理 JSON 所需的功能。虽然我不能评价大多数工具的质量，但它们的存在明确了开发者社区拥抱 JSON 这一现象，而且它们切实简化了在不同平台使用 JSON 的难度。

### 二者的动机

简单地说，XML 的目标是标记文档。这和 JSON 的目标想去甚远，所以只要用得到 XML 的地方就尽管用。它使用树形的结构和包含语义的文本来表达混合内容以实现这一目标。在 XML 中可以表示数据的结构，但这并不是它的长处。

JSON 的目标是用于数据交换的一种结构化表示。它直接使用对象、数组、数字、字符串、布尔值这些元素来达成这一目标。这完全不同于文档标记语言。正如上面说的那样，JSON 没有原生支持<ruby>混合内容<rt>mixed content</rt></ruby>的记录。

### 软件

这些主流的开放 API 仅提供 XML：<ruby>亚马逊产品广告 API<rt>Amazon Product Advertising API</rt></ruby>。

这些主流 API 仅提供 JSON：<ruby>脸书图 API<rt>Facebook Graph API</rt></ruby>、<ruby>谷歌地图 API<rt>Google Maps API</rt></ruby>、<ruby>推特 API<rt>Twitter API</rt></ruby>、AccuWeather API、Pinterest API、Reddit API、Foursquare API。

这些主流 API 同时提供 XML 和 JSON：<ruby>谷歌云存储<rt>Google Cloud Storage</rt></ruby>、<ruby>领英 API<rt>Linkedin API</rt></ruby>、Flickr API。

根据<ruby>可编程网络<rt>Programmable Web</rt></ruby> [^9] 的数据，最流行的 10 个 API 中只有一个是仅提供 XML 且不支持 JSON 的。其他的要么同时支持 XML 和 JSON，要么只支持 JSON。这表明了大多数应用开发者都更倾向于使用支持 JSON 的 API，原因大概是 JSON 更快的处理速度与良好口碑，加之与 XML 相比更加轻量。此外，大多数 API 只是传递数据而非文档，所以 JSON 更加合适。例如 Facebook 的重点在于用户的交流与帖子，谷歌地图则主要处理坐标和地图信息，AccuWeather 就只传递天气数据。总之，虽然不能说天气 API 在使用时究竟是 JSON 用的多还是 XML 用的多，但是趋势明确偏向了 JSON。[^10] [^11]

这些主流的桌面软件仍然只是用 XML：Microsoft Word、Apache OpenOffice、LibraOffice。

因为这些软件需要考虑引用、格式、存储等等，所以比起 JSON，XML 优势更大。另外，这三款程序都支持混合内容，而 JSON 在这一点上做得并不如 XML 好。举例说明，当用户使用 Microsoft Word 编辑一篇论文时，用户需要使用不同的文字字形、文字大小、文字颜色、页边距、段落格式等，而 XML 结构化的组织形式与标签属性生来就是为了表达这些信息的。

这些主流的数据库支持 XML：IBM DB2、Microsoft SQL Server、Oracle Database、PostgresSQL、BaseX、eXistDB、MarkLogic、MySQL。

这些是支持 JSON 的主流数据库：MongoDB、CouchDB、eXistDB、Elastisearch、BaseX、MarkLogic、OrientDB、Oracle Database、PostgreSQL、Riak。

在很长一段时间里，SQL 和关系型数据库统治着整个数据库市场。像<ruby>甲骨文<rt>Oracle</rt></ruby>和<ruby>微软<rt>Microsoft</rt></ruby>这样的软件巨头都提供这类数据库，然而近几年 NoSQL 数据库正逐步受到开发者的青睐。也许是正巧碰上了 JSON 的普及，大多数 NoSQL 数据库都支持 JSON，像 MongoDB、CouchDB 和 Riak 这样的数据库甚至使用 JSON 来存储数据。这些数据库有两个重要的特性是它们适用于现代网站：一是它们与关系型数据库相比<ruby>更容易扩展<rt>more scalable</rt></ruby>；二是它们设计的目标就是 web 运行所需的核心组件。[^10a] 由于 JSON 更加轻量，又是 JavaScript 的子集，所以很适合 NoSQL 数据库，并且让这两个品质更容易实现。此外，许多旧的关系型数据库增加了 JSON 支持，例如 Oracle Database 和 PostgreSQL。由于 XML 与 JSON 间的转换比较麻烦，所以大多数开发者会直接在他们的应用里使用 JSON，因此开发数据库的公司才有支持 JSON 的理由。（LCTT 译注：NoSQL 是对不同于传统的关系数据库的数据库管理系统的统称。[参考来源](https://zh.wikipedia.org/wiki/NoSQL)） [^7]

### 未来

对互联网的种种变革中，最让人期待的便是<ruby>物联网<rt>Internet of Things</rt></ruby>（IoT）。这会给互联网带来大量计算机之外的设备，例如手表、温度计、电视、冰箱等等。这一势头的发展良好，预期在不久的将来迎来爆发式的增长。据估计，到 2020 年时会有 260 亿 到 2000 亿的物联网设备被接入互联网。[^12] [^13] 几乎所有的物联网设备都是小型设备，因此性能比笔记本或台式电脑要弱很多，而且大多数都是嵌入式系统。因此，当它们需要与互联网上的系统交换数据时，更轻量、更快速的 JSON 自然比 XML 更受青睐。[^10b] 受益于 JSON 在 web 上的快速普及，与 XML 相比，这些新的物联网设备更有可能从使用 JSON 中受益。这是一个典型的梅特卡夫定律的例子，无论是 XML 还是 JSON，抑或是什么其他全新的格式，现存的设备和新的设备都会从支持最广泛使用的格式中受益。

Node.js 是一款服务器端的 JavaScript 框架，随着她的诞生与快速成长，与 MongoDB 等 NoSQL 数据库一起，让全栈使用 JavaScript 开发成为可能。这些都预示着 JSON 光明的未来，这些软件的出现让 JSON 运用在全栈开发的每一个环节成为可能，这将使应用更加轻量，响应更快。这也是任何应用的追求之一，所以，全栈使用 JavaScript 的趋势在不久的未来都不会消退。[^10c]

此外，另一个应用开发的趋势是从 SOAP 转向 REST。[^11a] [^15] [^16] XML 和 JSON 都可以用于 REST，可 SOAP 只能使用 XML。

从这些趋势中可以推断，JSON 的发展将统一 Web 的信息交换格式，XML 的使用率将继续降低。虽然不应该把 JSON 吹过头了，因为 XML 在 Web 中的使用依旧很广，而且它还是 SOAP 的唯一选择，可考虑到 SOAP 到 REST 的迁移，NoSQL 数据库和全栈 JavaScript 的兴起，JSON 卓越的性能，我相信 JSON 很快就会在 Web 开发中超过 XML。至于其他领域，XML 比 JSON 更好的情况并不多。


### 角注

[^1]: [XML Tutorial](http://www.w3schools.com/xml/default.asp)
[^2]: [Introducing JSON](http://www.json.org/)
[^2a]: [Introducing JSON](http://www.json.org/)
[^3]: [Comparison of JSON and XML Data Interchange Formats: A Case Study](http://www.cs.montana.edu/izurieta/pubs/caine2009.pdf)
[^3a]: [Comparison of JSON and XML Data Interchange Formats: A Case Study](http://www.cs.montana.edu/izurieta/pubs/caine2009.pdf)
[^4]: [A comparison of data serialization formats for optimal efficiency on a mobile platform](http://dl.acm.org/citation.cfm?id=2184810)
[^4a]: [A comparison of data serialization formats for optimal efficiency on a mobile platform](http://dl.acm.org/citation.cfm?id=2184810)
[^5]: [JSON vs. XML: The Debate](http://ajaxian.com/archives/json-vs-xml-the-debate)
[^6]: [JSON vs. XML: Some hard numbers about verbosity](http://www.codeproject.com/Articles/604720/JSON-vs-XML-Some-hard-numbers-about-verbosity)
[^7]: [How JSON sparked NoSQL -- and will return to the RDBMS fold](http://www.infoworld.com/article/2608293/nosql/how-json-sparked-nosql----and-will-return-to-the-rdbms-fold.html)
[^8]: [Did You Say "JSON Support" in Oracle 12.1.0.2?](https://blogs.oracle.com/OTN-DBA-DEV-Watercooler/entry/did_you_say_json_support)
[^9]: [Most Popular APIs: At Least One Will Surprise You](http://www.programmableweb.com/news/most-popular-apis-least-one-will-surprise-you/2014/01/23)
[^10]: [Why JSON will continue to push XML out of the picture](https://www.centurylinkcloud.com/blog/post/why-json-will-continue-to-push-xml-out-of-the-picture/)
[^10a]: [Why JSON will continue to push XML out of the picture](https://www.centurylinkcloud.com/blog/post/why-json-will-continue-to-push-xml-out-of-the-picture/)
[^10b]: [Why JSON will continue to push XML out of the picture](https://www.centurylinkcloud.com/blog/post/why-json-will-continue-to-push-xml-out-of-the-picture/)
[^10c]: [Why JSON will continue to push XML out of the picture](https://www.centurylinkcloud.com/blog/post/why-json-will-continue-to-push-xml-out-of-the-picture/)
[^11]: [Thousands of APIs Paint a Bright Future for the Web](http://www.webmonkey.com/2011/03/thousand-of-apis-paint-a-bright-future-for-the-web/)
[^11a]: [Thousands of APIs Paint a Bright Future for the Web](http://www.webmonkey.com/2011/03/thousand-of-apis-paint-a-bright-future-for-the-web/)
[^12]: [A Simple Explanation Of 'The Internet Of Things’](http://www.forbes.com/sites/jacobmorgan/2014/05/13/simple-explanation-internet-things-that-anyone-can-understand/)
[^13]: [Proofpoint Uncovers Internet of Things (IoT) Cyberattack](http://www.proofpoint.com/about-us/press-releases/01162014.php)
[^14]: [The Internet of Things: New Threats Emerge in a Connected World](http://www.symantec.com/connect/blogs/internet-things-new-threats-emerge-connected-world)
[^15]: [3,000 Web APIs: Trends From A Quickly Growing Directory](http://www.programmableweb.com/news/3000-web-apis-trends-quickly-growing-directory/2011/03/08)
[^16]: [How REST replaced SOAP on the Web: What it means to you](http://www.infoq.com/articles/rest-soap)


--------------------------------------------------------------------------------

via: https://www.cs.tufts.edu/comp/150IDS/final_papers/tstras01.1/FinalReport/FinalReport.html

作者：[TOM STRASSNER][a]
选题：[lujun9972][b]
译者：[wwhio](https://github.com/wwhio)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: tomstrassner@gmail.com
[b]: https://github.com/lujun9972
[1]: https://tools.ietf.org/html/rfc7159
[2]: https://tools.ietf.org/html/rfc4825

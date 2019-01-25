[#]: collector: (lujun9972)
[#]: translator: (wwhio)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (XML vs JSON)
[#]: via: (https://www.cs.tufts.edu/comp/150IDS/final_papers/tstras01.1/FinalReport/FinalReport.html)
[#]: author: (TOM STRASSNER  tomstrassner@gmail.com)

XML vs JSON
======

### 简介 Introduction

XML and JSON are the two most common formats for data interchange in the Web today. XML was created by the W3C in 1996, and JSON was publicly specified by Douglas Crockford in 2002. Although their purposes are not identical, they are frequently used to accomplish the same task, which is data interchange. Both have well-documented open standards on the Web ([RFC 7159][1], [RFC 4825][2]), and both are human and machine-readable. Neither one is absolutely superior to the other, as each is better suited for different use cases.
在今天，XML 和 JSON 是互联网上最常用的两种数据交换格式。XML 格式由 W3C 于 1996 年提出。JSON 格式由 Douglas Crockford 于 2020 年提出。虽然制作这两种格式的目的不同，但它们都是数据交换中常用的格式。这两种格式的文档都很完善([RFC 7159][1], [RFC 4825][2])，且都同时具有<ruby>人类可读性<rt>human-readable</rt></ruby>和<ruby>机器可读性<rt>machine-readable</rt></ruby>。这两种格式并没有哪一个比另一个更强，只是各自适用的领域不用。（LCTT译注：W3C 是[互联网联盟](https://www.w3.org/)，制定了各种 Web 相关的标准，如 HTML、CSS 等。Douglas Crockford 除了制定了 JSON 格式，还致力于改进 JavaScript，开发了 JavaScript 相关工具 [JSLint](http://jslint.com/) 和 [JSMin](http://www.crockford.com/javascript/jsmin.html)。）

### XML 的优点 Advantages

There are several advantages that XML has over JSON. One of the biggest differences between the two is that in XML you can put metadata into the tags in the form of attributes. With JSON, the programmer could accomplish the same goal that metadata achieves by making the entity an object and adding the attributes as members of the object. However, the way XML does it may often be preferable, given the slightly misleading nature of turning something into an object that is not one in the client program. For example, if your C++ program sends an int via JSON and needs metadata to be sent along with it, you would have to make it an object, with one name/value pair for the actual value of the int, and more name/value pairs for each attribute. The program that receives the JSON would read it as an object, when in fact it is not one. While this is a viable solution, it defies one of JSON’s key advantages: “JSON's structures look like conventional programming language structures. No restructuring is necessary.”[2]
XML 与 JSON 相比有很多优点。二者间最大的不同在于使用 XML 时可以通过在标签中添加属性这一简单的方法来存储<ruby>元数据<rt>metadata</rt></ruby>。而使用 JSON 时需要创建一个对象，把元数据当作对象的成员来存储。虽然二者都能达到存储元数据的目的，但在这一情况下通常选择 XML，因为 JSON 的表达形式会让客户端程序误以为要将数据转换成一个对象。举个例子，如果你的 C++ 程序需要使用 JSON 格式发送一个附带元数据的整型数据，需要创建一个对象，用对象中的一个<ruby>名称/值对<rt>name/value pair</rt></ruby>来记录整型数据的值，再为每一个附带的属性添加一个名称/值对。接收到这个 JSON 的程序在读取后很可能把它当成一个对象，可事实并不是这样。虽然这是使用 JSON 传递元数据的一种变通方法，但他违背了 JSON 的核心优势：“<ruby>JSON 的结构与常规的程序语言中的结构相对应，而无需修改。<rt>JSON's structures look like conventional programming language structures. No restructuring is necessary.</rt></ruby>”[2]

Although I will argue later that this can also be a drawback of XML, its mechanism to resolve name conflicts, prefixes, gives it power that JSON does not have. With prefixes, the programmer has the ability to name two different kinds of entities the same thing.[1] This would be advantageous in situations where the different entities should have the same name in the client program, perhaps if they are used in entirely different scopes.
虽然我后面会说这也是 XML 的一个缺点，但 XML 中处理命名冲突、<ruby>前缀<rt>prefix</rt></ruby>的机制赋予了它 JSON 所不具备的能力。程序员们使用前缀可以给两个不同的实体使用同一名称。[1]当不同的实体在客户端中使用的名称相同时，这一特性会非常有用。

Another advantage of XML is that most browsers render it in a highly readable and organized way. The tree structure of XML lends itself well to this formatting, and allows for browsers to let users to naturally collapse individual tree elements. This feature would be particularly useful in debugging.
XML 的另一个优势在于大多数的浏览器可以把它以<ruby>具有高可读性和强组织性的方式<rt>highly readable and organized way</rt></ruby>展现给用户。XML 的树形结构让它易于结构化，浏览器也让用户可以自行展开或折叠树中的元素，这简直就是调试的福音。

One of the most significant advantages that XML has over JSON is its ability to communicate mixed content, i.e. strings that contain structured markup. In order to handle this with XML, the programmer need only put the marked-up text within a child tag of the parent in which it belongs. Similar to the metadata situation, since JSON only contains data, there is no such simple way to indicate markup. It would again require storing metadata as data, which could be considered an abuse of the format.
XML 对比 JSON 有一个很重要的能力就是它可以<ruby>混合多种内容<rt>mixed content</rt></ruby>。例如在 XML 中处理包含结构化标记的字符串时，程序员们只要把带有标记的文本放在一个标签内就可以了。而且和元数据的处理类似，由于 JSON 只包含数据，没有用于指明标签的简单方式。虽然这里还可以使用处理元数据的解决方法，但这总有点误用格式之嫌。

### JSON 的优点 Advantages

JSON has several advantages as well. One of the most obvious of these is that JSON is significantly less verbose than XML, because XML necessitates opening and closing tags (or in some cases less verbose self-closing tags), and JSON uses name/value pairs, concisely delineated by “{“ and “}” for objects, “[“ and “]” for arrays, “,” to separate pairs, and “:” to separate name from value. Even when zipped (using gzip), JSON is still smaller and it takes less time to zip it.[6] As determined by Sumaray and Makki as well as Nurseitov, Paulson, Reynolds, and Izurieta in their experimental findings, JSON outperforms XML in a number of ways. First, naturally following from its conciseness, JSON files that contain the same information as their XML counterparts are almost always significantly smaller, which leads to faster transmission and processing. Second, difference in size aside, both groups found that JSON was serialized and deserialized drastically faster than XML.[3][4] Third, the latter study determined that JSON processing outdoes XML in CPU resource utilization. They found that JSON used less total resources, more user CPU, and less system CPU. The experiment used RedHat machines, and RedHat claims that higher user CPU usage is preferable.[3] Unsurprisingly, the Sumaray and Makki study determined that JSON performance is superior to XML on mobile devices too.[4] This makes sense, given that JSON uses less resources, and mobile devices are less powerful than desktop machines.
JSON 自身也有很多优点。其最显而易见的一点就是 JSON 比 XML 简洁得多。因为 XML 中需要标签的打开和关闭，而 JSON 使用名称/值对，使用简单的“{”和“}”来标记对象，“\[”和“\]”来标记数组，“,”来表示数据的分隔，“:”表示名称和值的分隔。就算是使用 gzip 压缩，JSON 还是比 XML 要小，而且耗时更少。[6]正如 Sumaray 和 Makki 在实验中指出的那样，JSON 在很多方面都比 XML 更具优势，得出同样结果的还有 Nurseitov、Paulson、Reynolds 和 Izurieta。首先，由于 JSON 文件天生的简洁性，与包含相同信息的 XML 相比，JSON 总是更小，这就意味着更快的传输和处理速度。第二，在不考虑大小的情况下，两组研究[3][4]表明使用 JSON 序列化和反序列化的速度显著优于使用 XML。第三，后续的研究指出 JSON 的处理会使用更多的 CPU 资源。他们发现 JSON 在总体上使用的资源更少，但在用户空间消耗更多的 CPU 资源，同时系统空间消耗更少的 CPU 资源。这一实验是在 RedHat 的设备上进行的，RedHat 更倾向于在用户空间消耗更多的 CPU 资源。[3]不出意外，Sumaray 和 Makki 的研究里还说明了在移动设备上 JSON 的性能也优于 XML。[4]这说得通，因为 JSON 在整体上消耗的资源更少，而且移动设备也没有台式机那么强劲。

Yet another advantage that JSON has over XML is that its representation of objects and arrays allows for direct mapping onto the corresponding data structures in the host language, such as objects, records, structs, dictionaries, hash tables, keyed lists, and associative arrays for objects, and arrays, vectors, lists, and sequences for arrays.[2] Although it is perfectly possible to represent these structures in XML, it is only as a function of the parsing, and it takes more code to serialize and deserialize properly. It also would not always be obvious to the reader of arbitrary XML what tags represent an object and what tags represent an array, especially because nested tags can just as easily be structured markup instead. The curly braces and brackets of JSON definitively show the structure of the data. However, this advantage does come with the caveat explained above, that the JSON can inaccurately represent the data if the need arises to send metadata.
JSON 的另一个优点在于其对对象和数组的描述允许<ruby>宿主语言<rt>host language</rt></ruby>直接将它映射到对应数据结构上，例如<ruby>对象<rt>object</rt></ruby>、<ruby>记录<rt>record</rt></ruby>、<ruby>结构体<rt>struct</rt></ruby>、<ruby>字典<rt>dictionary</rt></ruby>、<ruby>哈希表<rt>hash table</rt></ruby>、<ruby>键值列表<rt>keyed list</rt></ruby>还有对象组成的数组，以及<ruby>数组<rt>array</rt></ruby>、<ruby>向量<rt>vector</rt></ruby>、<ruby>列表<rt>list</rt></ruby>等等。[2] 虽然 XML 里也能表达这些数据结构，也只需调用一个函数就能完成解析，但需要更多的代码才能正确的完成 XML 的序列化和反序列化处理。而且 XML 对于人类来说不如 JSON 那么直观，因为 XML 标准缺乏对象、数组的标签的明确定义，尤其是潜逃的标签可以简单的使用结构化的标记替代时。JSON 中的花括号和中括号则明确表示了数据的结构，当然这一优势也符合前文中的警告，在包含元数据时 JSON 的表示不如 XML 精确。

Although XML supports namespaces and prefixes, JSON’s handling of name collisions is less verbose than prefixes, and arguably feels more natural with the program using it; in JSON, each object is its own namespace, so names may be repeated as long as they are in different scopes. This may be preferable, as in most programming languages members of different objects can have the same name, because they are distinguished by the names of the objects to which they belong.
虽然 XML 支持<ruby>命名空间<rt>namespace</rt></ruby>与<ruby>前缀<rt>prefix</rt></ruby>，但这不代表 JSON 没有处理命名冲突的能力。比起 XML 的前缀，它处理命名冲突的方式更简洁，在程序中的处理也更自然。在 JSON 里，每一个对象都在它自己的命名空间中，因此不同对象内的元素可以随意的重复。因为在大多数编程语言中，不同的对象中的成员可以包含相同的名字，所以 JSON 根据对象名称进行区分的规则在处理时更加自然。

Perhaps the most significant advantage that JSON has over XML is that JSON is a subset of JavaScript, so code to parse and package it fits very naturally into JavaScript code. This seems highly beneficial for JavaScript programs, but does not directly benefit any programs that use languages other than JavaScript. However, this drawback has been largely overcome, as currently the JSON website lists over 175 tools for 64 different programming languages that exist to integrate JSON processing. While I cannot speak to the quality of most of these tools, it is clear that the developer community has embraced JSON and has made it simple to use in many different platforms.
也许 JSON 比 XML 更优的部分是因为 JSON 是 JavaScript 的子集，所以在 JavaScript 代码中对它的解析或封装都非常的自然。虽然这看起来对 JavaScript 程序非常有用，而其他程序则不能直接从中获益，可实际上这一问题已经被很好的解决了。现在 JSON 的网站的列表上展示了 64 种不同语言的 175 个工具，它们都继承了 JSON 处理功能。虽然我不能评价大多数工具的质量，但它们的存在明确了开发者社区拥抱 JSON 这一现象，而且它们切实简化了在不同平台使用 JSON 的难度。

### 目标

Simply put, XML’s purpose is document markup. This is decidedly not a purpose of JSON, so XML should be used whenever this is what needs to be done. It accomplishes this purpose by giving semantic meaning to text through its tree-like structure and ability to represent mixed content. Data structures can be represented in XML, but that is not its purpose.
简单地说，XML 的目标是完成一种文档标记。这和 JSON 的目标想去甚远，所以只要用得到 XML 的地方就尽管用。它使用树形的结构和包含语义的文本来表达混合内容以达成这一目标。XML 可以表示数据的结构，但这并不是它的初衷。

JSON’s purpose is structured data interchange. It serves this purpose by directly representing objects, arrays, numbers, strings, and booleans. Its purpose is distinctly not document markup. As described above, JSON does not have a natural way to represent mixed content.
JSON 的目标是完成一种结构化的数据交换。它直接使用对象、数组、数字、字符串、布尔值这些元素来达成这一目标。这完全不同于文档标记语言。正如上面说的那样，JSON 本身不存在表示混合内容的方法。

### 软件

The following major public APIs uses XML only: Amazon Product Advertising API.
这些主流的开放 API 仅提供 XML：<ruby>亚马逊产品广告 API<rt>Amazon Product Advertising API</rt></ruby>。

The following major APIs use JSON only: Facebook Graph API, Google Maps API, Twitter API, AccuWeather API, Pinterest API, Reddit API, Foursquare API.
这些主流 API 仅提供 JSON：<ruby>脸书图 API<rt>Facebook Graph API</rt></ruby>，<ruby>谷歌地图 API<rt>Google Maps API</rt></ruby>，<ruby>推特 API<rt>Twitter API</rt></ruby>，AccuWeather API，Pinterest API，Reddit API，Foursquare API。

The following major APIs use both XML and JSON: Google Cloud Storage, Linkedin API, Flickr API
这些主流 API 同时提供 XML 和 JSON：<ruby>谷歌云存储<rt>Google Cloud Storage</rt></ruby>，<ruby>领英 API<rt>Linkedin API</rt></ruby>，Flickr API。

Of the top 10 most popular APIs according to Programmable Web[9], along with a couple more popular ones, only one supports XML and not JSON. Several support both, and several support only JSON. Among developer APIs for modern and popular websites, JSON clearly seems to be preferred. This also indicates that more app developers that use these APIs prefer JSON. This is likely a result of its reputation as the faster and leaner of the two. Furthermore, most of these APIs communicate data rather than documents, so JSON would be more appropriate. For example, Facebook is mainly concerned with communicating data about users and posts, Google Maps deals in coordinates and information about entities on their maps, and AccuWeather just sends weather data. Overall, it is impossible to say whether JSON or XML is currently used more in APIs, but the trend is certainly swinging towards JSON.[10][11]
根据<ruby>可编程网络<rt>Programmable Web</rt></ruby>[9]的数据，最流行的 10 个 API 中只有一个是仅提供 XML 且不支持 JSON 的。其他的要么同时支持 XML 和 JSON，要么只支持 JSON。这表明了大多数应用开发者都更倾向于使用支持 JSON 的 API，原因大概是因为 JSON 的处理更快的良好口碑和与 XML 相比相对轻量。此外，大多数 API 只是传递数据而非文档，所以 JSON 更加合适。例如 Facebook 的重点在于用户的交流与帖子，谷歌地图则主要处理坐标和地图信息，AccuWeather 就只传递天气数据。总之，虽然不能说天气 API 在使用时究竟是 JSON 用的多还是 XML 用的多，但是趋势明确偏向了 JSON。[10][11]

The following major desktop software uses XML only: Microsoft Word, Apache OpenOffice, LibreOffice.
这些主流的桌面软件仍然只是用 XML：Microsoft Word，Apache OpenOffice，LibraOffice。

It makes sense for software that is mainly concerned with document creation, manipulation, and storage to use XML rather than JSON. Also, all three of these programs support mixed content, which JSON does not do well. For example, if a user is typing up an essay in Microsoft Word, they may put different font, size, color, positioning, and styling on different blocks of text. XML naturally represents these properties with nested tags and attributes.
因为这些软件需要考虑引用、格式、存储等等，所以比起 JSON，XML 优势更大。另外，这三款程序都支持混合内容，而 JSON 在这一点上做得并不如 XML 好。 For example, if a user is typing up an essay in Microsoft Word, they may put different font, size, color, positioning, and styling on different blocks of text. XML naturally represents these properties with nested tags and attributes.

The following major databases support XML: IBM DB2, Microsoft SQL Server, Oracle Database, PostgresSQL, BaseX, eXistDB, MarkLogic, MySQL.

The following major databases support JSON: MongoDB, CouchDB, eXistDB, Elastisearch, BaseX, MarkLogic, OrientDB, Oracle Database, PostgresSQL, Riak.

For a long time, SQL and the relational database model dominated the market. Corporate giants like Oracle and Microsoft have always marketed such databases. However, in the last decade, there has been a major rise in popularity of NoSQL databases. As this has coincided with the rise of JSON, most NoSQL databases support JSON, and some, such as MongoDB, CouchDB, and Riak use JSON to store their data. These databases have two important qualities that make them better suited for modern websites: they are generally more scalable than relational SQL databases, and they are designed to the core to run in the Web.[10] Since JSON is more lightweight and a subset of JavaScript, it suits NoSQL databases well, and helps facilitate these two qualities. In addition, many older databases have added support for JSON, such as Oracle Database and PostgresSQL. Conversion between XML and JSON is a hassle, so naturally, as more developers use JSON for their apps, more database companies have incentive to support it.[7]

### Future

One of the most heavily anticipated changes in the Internet is the “Internet of Things”, i.e. the addition to the Internet of non-computer devices such as watches, thermostats, televisions, refrigerators, etc. This movement is well underway, and is expected to explode in the near future, as predictions for the number of devices in the Internet of Things in 2020 range from about 26 billion to 200 billion.[12][13][13] Almost all of these devices are smaller and less powerful than laptop and desktop computers. Many of them only run embedded systems. Thus, when they have the need to exchange data with other entities in the Web, the lighter and faster JSON would naturally be preferable to XML.[10] Also, with the recent rapid rise of JSON use in the Web relative to XML, new devices may benefit more from speaking JSON. This highlights an example of Metcalf’s Law; whether XML or JSON or something entirely new becomes the most popular format in the Web, newly added devices and all existing devices will benefit much more if the newly added devices speak the most popular language.

With the creation and recent rapid increase in popularity of Node.js, a server-side JavaScript framework, along with NoSQL databases like MongoDB, full-stack JavaScript development has become a reality. This bodes well for the future of JSON, as with these new apps, JSON is spoken at every level of the stack, which generally makes the apps very fast and lightweight. This is a desirable trait for any app, so this trend towards full-stack JavaScript is not likely to die out anytime soon.[10]

Another existing trend in the world of app development is toward REST and away from SOAP.[11][15][16] Both XML and JSON can be used with REST, but SOAP exclusively uses XML.

The given trends indicate that JSON will continue to dominate the Web, and XML use will continue to decrease. This should not be overblown, however, because XML is still very heavily used in the Web, and it is the only option for apps that use SOAP. Given the widespread migration from SOAP to REST, the rise of NoSQL databases and full-stack JavaScript, and the far superior performance of JSON, I believe that JSON will soon be much more widely used than XML in the Web. There seem to be very few applications where XML is the better choice.

### References

1. [XML Tutorial](http://www.w3schools.com/xml/default.asp)
2. [Introducing JSON](http://www.json.org/)
3. [Comparison of JSON and XML Data Interchange Formats: A Case Study](http://www.cs.montana.edu/izurieta/pubs/caine2009.pdf)
4. [A comparison of data serialization formats for optimal efficiency on a mobile platform](http://dl.acm.org/citation.cfm?id=2184810)
5. [JSON vs. XML: The Debate](http://ajaxian.com/archives/json-vs-xml-the-debate)
6. [JSON vs. XML: Some hard numbers about verbosity](http://www.codeproject.com/Articles/604720/JSON-vs-XML-Some-hard-numbers-about-verbosity)
7. [How JSON sparked NoSQL -- and will return to the RDBMS fold](http://www.infoworld.com/article/2608293/nosql/how-json-sparked-nosql----and-will-return-to-the-rdbms-fold.html)
8. [Did You Say "JSON Support" in Oracle 12.1.0.2?](https://blogs.oracle.com/OTN-DBA-DEV-Watercooler/entry/did_you_say_json_support)
9. [Most Popular APIs: At Least One Will Surprise You](http://www.programmableweb.com/news/most-popular-apis-least-one-will-surprise-you/2014/01/23)
10. [Why JSON will continue to push XML out of the picture](https://www.centurylinkcloud.com/blog/post/why-json-will-continue-to-push-xml-out-of-the-picture/)
11. [Thousands of APIs Paint a Bright Future for the Web](http://www.webmonkey.com/2011/03/thousand-of-apis-paint-a-bright-future-for-the-web/)
12. [A Simple Explanation Of 'The Internet Of Things’](http://www.forbes.com/sites/jacobmorgan/2014/05/13/simple-explanation-internet-things-that-anyone-can-understand/)
13. [Proofpoint Uncovers Internet of Things (IoT) Cyberattack](http://www.proofpoint.com/about-us/press-releases/01162014.php)
14. [The Internet of Things: New Threats Emerge in a Connected World](http://www.symantec.com/connect/blogs/internet-things-new-threats-emerge-connected-world)
15. [3,000 Web APIs: Trends From A Quickly Growing Directory](http://www.programmableweb.com/news/3000-web-apis-trends-quickly-growing-directory/2011/03/08)
16. [How REST replaced SOAP on the Web: What it means to you](http://www.infoq.com/articles/rest-soap)


--------------------------------------------------------------------------------

via: https://www.cs.tufts.edu/comp/150IDS/final_papers/tstras01.1/FinalReport/FinalReport.html

作者：[TOM STRASSNER][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: tomstrassner@gmail.com
[b]: https://github.com/lujun9972
[1]: https://tools.ietf.org/html/rfc7159
[2]: https://tools.ietf.org/html/rfc4825

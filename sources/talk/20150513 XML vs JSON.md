[#]: collector: (lujun9972)
[#]: translator: (wwhio)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (XML vs JSON)
[#]: via: (https://www.cs.tufts.edu/comp/150IDS/final_papers/tstras01.1/FinalReport/FinalReport.html#xml-advantages)
[#]: author: (TOM STRASSNER  tomstrassner@gmail.com)

XML vs JSON
======

### Introduction

XML and JSON are the two most common formats for data interchange in the Web today. XML was created by the W3C in 1996, and JSON was publicly specified by Douglas Crockford in 2002. Although their purposes are not identical, they are frequently used to accomplish the same task, which is data interchange. Both have well-documented open standards on the Web ([RFC 7159][1], [RFC 4825][2]), and both are human and machine-readable. Neither one is absolutely superior to the other, as each is better suited for different use cases.

### XML Advantages

There are several advantages that XML has over JSON. One of the biggest differences between the two is that in XML you can put metadata into the tags in the form of attributes. With JSON, the programmer could accomplish the same goal that metadata achieves by making the entity an object and adding the attributes as members of the object. However, the way XML does it may often be preferable, given the slightly misleading nature of turning something into an object that is not one in the client program. For example, if your C++ program sends an int via JSON and needs metadata to be sent along with it, you would have to make it an object, with one name/value pair for the actual value of the int, and more name/value pairs for each attribute. The program that receives the JSON would read it as an object, when in fact it is not one. While this is a viable solution, it defies one of JSON’s key advantages: “JSON's structures look like conventional programming language structures. No restructuring is necessary.”[2]

Although I will argue later that this can also be a drawback of XML, its mechanism to resolve name conflicts, prefixes, gives it power that JSON does not have. With prefixes, the programmer has the ability to name two different kinds of entities the same thing.[1] This would be advantageous in situations where the different entities should have the same name in the client program, perhaps if they are used in entirely different scopes.

Another advantage of XML is that most browsers render it in a highly readable and organized way. The tree structure of XML lends itself well to this formatting, and allows for browsers to let users to naturally collapse individual tree elements. This feature would be particularly useful in debugging.

One of the most significant advantages that XML has over JSON is its ability to communicate mixed content, i.e. strings that contain structured markup. In order to handle this with XML, the programmer need only put the marked-up text within a child tag of the parent in which it belongs. Similar to the metadata situation, since JSON only contains data, there is no such simple way to indicate markup. It would again require storing metadata as data, which could be considered an abuse of the format.

### JSON Advantages

JSON has several advantages as well. One of the most obvious of these is that JSON is significantly less verbose than XML, because XML necessitates opening and closing tags (or in some cases less verbose self-closing tags), and JSON uses name/value pairs, concisely delineated by “{“ and “}” for objects, “[“ and “]” for arrays, “,” to separate pairs, and “:” to separate name from value. Even when zipped (using gzip), JSON is still smaller and it takes less time to zip it.[6] As determined by Sumaray and Makki as well as Nurseitov, Paulson, Reynolds, and Izurieta in their experimental findings, JSON outperforms XML in a number of ways. First, naturally following from its conciseness, JSON files that contain the same information as their XML counterparts are almost always significantly smaller, which leads to faster transmission and processing. Second, difference in size aside, both groups found that JSON was serialized and deserialized drastically faster than XML.[3][4] Third, the latter study determined that JSON processing outdoes XML in CPU resource utilization. They found that JSON used less total resources, more user CPU, and less system CPU. The experiment used RedHat machines, and RedHat claims that higher user CPU usage is preferable.[3] Unsurprisingly, the Sumaray and Makki study determined that JSON performance is superior to XML on mobile devices too.[4] This makes sense, given that JSON uses less resources, and mobile devices are less powerful than desktop machines.

Yet another advantage that JSON has over XML is that its representation of objects and arrays allows for direct mapping onto the corresponding data structures in the host language, such as objects, records, structs, dictionaries, hash tables, keyed lists, and associative arrays for objects, and arrays, vectors, lists, and sequences for arrays.[2] Although it is perfectly possible to represent these structures in XML, it is only as a function of the parsing, and it takes more code to serialize and deserialize properly. It also would not always be obvious to the reader of arbitrary XML what tags represent an object and what tags represent an array, especially because nested tags can just as easily be structured markup instead. The curly braces and brackets of JSON definitively show the structure of the data. However, this advantage does come with the caveat explained above, that the JSON can inaccurately represent the data if the need arises to send metadata.

Although XML supports namespaces and prefixes, JSON’s handling of name collisions is less verbose than prefixes, and arguably feels more natural with the program using it; in JSON, each object is its own namespace, so names may be repeated as long as they are in different scopes. This may be preferable, as in most programming languages members of different objects can have the same name, because they are distinguished by the names of the objects to which they belong.

Perhaps the most significant advantage that JSON has over XML is that JSON is a subset of JavaScript, so code to parse and package it fits very naturally into JavaScript code. This seems highly beneficial for JavaScript programs, but does not directly benefit any programs that use languages other than JavaScript. However, this drawback has been largely overcome, as currently the JSON website lists over 175 tools for 64 different programming languages that exist to integrate JSON processing. While I cannot speak to the quality of most of these tools, it is clear that the developer community has embraced JSON and has made it simple to use in many different platforms.

### Purposes

Simply put, XML’s purpose is document markup. This is decidedly not a purpose of JSON, so XML should be used whenever this is what needs to be done. It accomplishes this purpose by giving semantic meaning to text through its tree-like structure and ability to represent mixed content. Data structures can be represented in XML, but that is not its purpose.

JSON’s purpose is structured data interchange. It serves this purpose by directly representing objects, arrays, numbers, strings, and booleans. Its purpose is distinctly not document markup. As described above, JSON does not have a natural way to represent mixed content.

### Software

The following major public APIs uses XML only: Amazon Product Advertising API.

The following major APIs use JSON only: Facebook Graph API, Google Maps API, Twitter API, AccuWeather API, Pinterest API, Reddit API, Foursquare API.

The following major APIs use both XML and JSON: Google Cloud Storage, Linkedin API, Flickr API

Of the top 10 most popular APIs according to Programmable Web[9], along with a couple more popular ones, only one supports XML and not JSON. Several support both, and several support only JSON. Among developer APIs for modern and popular websites, JSON clearly seems to be preferred. This also indicates that more app developers that use these APIs prefer JSON. This is likely a result of its reputation as the faster and leaner of the two. Furthermore, most of these APIs communicate data rather than documents, so JSON would be more appropriate. For example, Facebook is mainly concerned with communicating data about users and posts, Google Maps deals in coordinates and information about entities on their maps, and AccuWeather just sends weather data. Overall, it is impossible to say whether JSON or XML is currently used more in APIs, but the trend is certainly swinging towards JSON.[10][11]

The following major desktop software uses XML only: Microsoft Word, Apache OpenOffice, LibreOffice.

It makes sense for software that is mainly concerned with document creation, manipulation, and storage to use XML rather than JSON. Also, all three of these programs support mixed content, which JSON does not do well. For example, if a user is typing up an essay in Microsoft Word, they may put different font, size, color, positioning, and styling on different blocks of text. XML naturally represents these properties with nested tags and attributes.

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

via: https://www.cs.tufts.edu/comp/150IDS/final_papers/tstras01.1/FinalReport/FinalReport.html#xml-advantages

作者：[TOM STRASSNER][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: tomstrassner@gmail.com
[b]: https://github.com/lujun9972
[1]: https://tools.ietf.org/html/rfc7159
[2]: https://tools.ietf.org/html/rfc4825

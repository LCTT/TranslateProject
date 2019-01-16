[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (JSON vs XML vs TOML vs CSON vs YAML)
[#]: via: (https://www.zionandzion.com/json-vs-xml-vs-toml-vs-cson-vs-yaml/)
[#]: author: (Tim Anderson https://www.zionandzion.com)

JSON vs XML vs TOML vs CSON vs YAML
======


### A Super Serious Segment About Sets, Subsets, and Supersets of Sample Serialization

I’m a developer. I read code. I write code. I write code that writes code. I write code that writes code for other code to read. It’s all very mumbo-jumbo, but beautiful in its own way. However, that last bit, writing code that writes code for other code to read, can get more convoluted than this paragraph—quickly. There are a lot of ways to do it. One not-so-convoluted way and a favorite among the developer community is through data serialization. For those who aren’t savvy on the super buzzword I just threw at you, data serialization is the process of taking some information from one system, churning it into a format that other systems can read, and then passing it along to those other systems.

While there are enough [data serialization formats][1] out there to bury the Burj Khalifa, they all mostly fall into two categories:

  * simplicity for humans to read and write,
  * and simplicity for machines to read and write.



It’s difficult to have both as we humans enjoy loosely typed, flexible formatting standards that allow us to be more expressive, whereas machines tend to enjoy being told exactly what everything is without doubt or lack of detail, and consider “strict specifications” to be their favorite flavor of Ben & Jerry’s.

Since I’m a web developer and we’re an agency who creates websites, we’ll stick to those special formats that web systems can understand, or be made to understand without much effort, and that are particularly useful for human readability: XML, JSON, TOML, CSON, and YAML. Each has benefits, cons, and appropriate use cases.

### Facts First

Back in the early days of the interwebs, [some really smart fellows][2] decided to put together a standard language which every system could read and creatively named it Standard Generalized Markup Language, or SGML for short. SGML was incredibly flexible and well defined by its publishers. It became the father of languages such as XML, SVG, and HTML. All three fall under the SGML specification, but are subsets with stricter rules and shorter flexibility.

Eventually, people started seeing a great deal of benefit in having very small, concise, easy to read, and easy to generate data that could be shared programmatically between systems with very little overhead. Around that time, JSON was born and was able to fulfil all requirements. In turn, other languages began popping up to deal with more specialized cases such as CSON, TOML, and YAML.

### XML: Ixnayed

Originally, the XML language was amazingly flexible and easy to write, but its drawback was that it was verbose, difficult for humans to read, really difficult for computers to read, and had a lot of syntax that wasn’t entirely necessary to communicate information.

Today, it’s all but dead for data serialization purposes on the web. Unless you’re writing HTML or SVG, both siblings to XML, you probably aren’t going to see XML in too many other places. Some outdated systems still use it today, but using it to pass data around tends to be overkill for the web.

I can already hear the XML greybeards beginning to scribble upon their stone tablets as to why XML is ah-may-zing, so I’ll provide a small addendum: XML can be easy to read and write by systems and people. However, it is really, and I mean ridiculously, hard to create a system that can read it to specification. Here’s a simple, beautiful example of XML:

```
<book id="bk101">
<author>Gambardella, Matthew</author>
<title>XML Developer's Guide</title>
<genre>Computer</genre>
<price>44.95</price>
<publish_date>2000-10-01</publish_date>
<description>An in-depth look at creating applications
with XML.</description>
</book>
```

Wonderful. Easy to read, reason about, write, and code a system that can read and write. But consider this example:

```
<!DOCTYPE r [ <!ENTITY y "a]>b"> ]>
<r>
<a b="&y;>" />
<![CDATA[[a>b <a>b <a]]>
<?x <a> <!-- <b> ?> c --> d
</r>
```

The above is 100% valid XML. Impossible to read, understand, or reason about. Writing code that can consume and understand this would cost at least 36 heads of hair and 248 pounds of coffee grounds. We don’t have that kind of time nor coffee, and most of us greybeards are balding nowadays. So let’s let it live only in our memory alongside [css hacks][3], [internet explorer 6][4], and [vacuum tubes][5].

### JSON: Juxtaposition Jamboree

Okay, we’re all in agreement. XML = bad. So, what’s a good alternative? JavaScript Object Notation, or JSON for short. JSON (read like the name Jason) was invented by Brendan Eich, and made popular by the great and powerful Douglas Crockford, the [Dutch Uncle of JavaScript][6]. It’s used just about everywhere nowadays. The format is easy to write by both human and machine, fairly easy to [parse][7] with strict rules in the specification, and flexible—allowing deep nesting of data, all of the primitive data types, and interpretation of collections as either arrays or objects. JSON became the de facto standard for transferring data from one system to another. Nearly every language out there has built-in functionality for reading and writing it.

JSON syntax is straightforward. Square brackets denote arrays, curly braces denote records, and two values separated by semicolons denote properties (or ‘keys’) on the left, and values on the right. All keys must be wrapped in double quotes:

```
{
"books": [
{
"id": "bk102",
"author": "Crockford, Douglas",
"title": "JavaScript: The Good Parts",
"genre": "Computer",
"price": 29.99,
"publish_date": "2008-05-01",
"description": "Unearthing the Excellence in JavaScript"
}
]
}
```

This should make complete sense to you. It’s nice and concise, and has stripped much of the extra nonsense from XML to convey the same amount of information. JSON is king right now, and the rest of this article will go into other language formats that are nothing more than JSON boiled down in an attempt to be either more concise or more readable by humans, but follow very similar structure.

### TOML: Truncated to Total Altruism

TOML (Tom’s Obvious, Minimal Language) allows for defining deeply-nested data structures rather quickly and succinctly. The name-in-the-name refers to the inventor, [Tom Preston-Werner][8], an inventor and software developer who’s active in our industry. The syntax is a bit awkward when compared to JSON, and is more akin to an [ini file][9]. It’s not a bad syntax, but could take some getting used to:

```
[[books]]
id = 'bk101'
author = 'Crockford, Douglas'
title = 'JavaScript: The Good Parts'
genre = 'Computer'
price = 29.99
publish_date = 2008-05-01T00:00:00+00:00
description = 'Unearthing the Excellence in JavaScript'
```

A couple great features have been integrated into TOML, such as multiline strings, auto-escaping of reserved characters, datatypes such as dates, time, integers, floats, scientific notation, and “table expansion”. That last bit is special, and is what makes TOML so concise:

```
[a.b.c]
d = 'Hello'
e = 'World'
```

The above expands to the following:

```
{
"a": {
"b": {
"c": {
"d": "Hello"
"e": "World"
}
}
}
}
```

You can definitely see how much you can save in both time and file length using TOML. There are few systems which use it or something very similar for configuration, and that is its biggest con. There simply aren’t very many languages or libraries out there written to interpret TOML.

### CSON: Simple Samples Enslaved by Specific Systems

First off, there are two CSON specifications. One stands for CoffeeScript Object Notation, the other stands for Cursive Script Object Notation. The latter isn’t used too often, so we won’t be getting into it. Let’s just focus on the CoffeeScript one.

[CSON][10] will take a bit of intro. First, let’s talk about CoffeeScript. [CoffeeScript][11] is a language that runs through a compiler to generate JavaScript. It allows you to write JavaScript in a more syntactically concise way, and have it [transcompiled][12] into actual JavaScript, which you would then use in your web application. CoffeeScript makes writing JavaScript easier by removing a lot of the extra syntax necessary in JavaScript. A big one that CoffeeScript gets rid of is curly braces—no need for them. In that same token, CSON is JSON without the curly braces. It instead relies on indentation to determine hierarchy of your data. CSON is very easy to read and write and usually requires fewer lines of code than JSON because there are no brackets.

CSON also offers up some extra niceties that JSON doesn’t have to offer. Multiline strings are incredibly easy to write, you can enter [comments][13] by starting a line with a hash, and there’s no need for separating key-value pairs with commas.

```
books: [
id: 'bk102'
author: 'Crockford, Douglas'
title: 'JavaScript: The Good Parts'
genre: 'Computer'
price: 29.99
publish_date: '2008-05-01'
description: 'Unearthing the Excellence in JavaScript'
]
```

Here’s the big issue with CSON. It’s **CoffeeScript** Object Notation. Meaning CoffeeScript is what you use to parse/tokenize/lex/transcompile or otherwise use CSON. CoffeeScript is the system that reads the data. If the intent of data serialization is to allow data to be passed from one system to another, and here we have a data serialization format that’s only read by a single system, well that makes it about as useful as a fireproof match, or a waterproof sponge, or that annoyingly flimsy fork part of a spork.

If this format is adopted by other systems, it could be pretty useful in the developer world. Thus far that hasn’t happened in a comprehensive manner, so using it in alternative languages such as PHP or JAVA are a no-go.

### YAML: Yielding Yips from Youngsters

Developers rejoice, as YAML comes into the scene from [one of the contributors to Python][14]. YAML has the same feature set and similar syntax as CSON, a boatload of new features, and parsers available in just about every web programming language there is. It also has some extra features, like circular referencing, soft-wraps, multi-line keys, typecasting tags, binary data, object merging, and [set maps][15]. It has incredibly good human readability and writability, and is a superset of JSON, so you can use fully qualified JSON syntax inside YAML and all will work well. You almost never need quotes, and it can interpret most of your base data types (strings, integers, floats, booleans, etc.).

```
books:
- id: bk102
author: Crockford, Douglas
title: 'JavaScript: The Good Parts'
genre: Computer
price: 29.99
publish_date: !!str 2008-05-01
description: Unearthing the Excellence in JavaScript
```

The younglings of the industry are rapidly adopting YAML as their preferred data serialization and system configuration format. They are smart to do so. YAML has all the benefits of being as terse as CSON, and all the features of datatype interpretation as JSON. YAML is as easy to read as Canadians are to hang out with.

There are two issues with YAML that stick out to me, and the first is a big one. At the time of this writing, YAML parsers haven’t yet been built into very many languages, so you’ll need to use a third-party library or extension for your chosen language to parse .yaml files. This wouldn’t be a big deal, however it seems most developers who’ve created parsers for YAML have chosen to throw “additional features” into their parsers at random. Some allow [tokenization][16], some allow [chain referencing][17], some even allow inline calculations. This is all well and good (sort of), except that none of these features are part of the specification, and so are difficult to find amongst other parsers in other languages. This results in system-locking; you end up with the same issue that CSON is subject to. If you use a feature found in only one parser, other parsers won’t be able to interpret the input. Most of these features are nonsense that don’t belong in a dataset, but rather in your application logic, so it’s best to simply ignore them and write your YAML to specification.

The second issue is there are few parsers that yet completely implement the specification. All the basics are there, but it can be difficult to find some of the more complex and newer things like soft-wraps, document markers, and circular references in your preferred language. I have yet to see an absolute need for these things, so hopefully they shouldn’t slow you down too much. With the above considered, I tend to keep to the more matured feature set presented in the [1.1 specification][18], and avoid the newer stuff found in the [1.2 specification][19]. However, programming is an ever-evolving monster, so by the time you finish reading this article, you’re likely to be able to use the 1.2 spec.

### Final Philosophy

The final word here is that each serialization language should be treated with a case-by-case reverence. Some are the bee’s knees when it comes to machine readability, some are the cat’s meow for human readability, and some are simply gilded turds. Here’s the ultimate breakdown: If you are writing code for other code to read, use YAML. If you are writing code that writes code for other code to read, use JSON. Finally, if you are writing code that transcompiles code into code that other code will read, rethink your life choices.

--------------------------------------------------------------------------------

via: https://www.zionandzion.com/json-vs-xml-vs-toml-vs-cson-vs-yaml/

作者：[Tim Anderson][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.zionandzion.com
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Comparison_of_data_serialization_formats
[2]: https://en.wikipedia.org/wiki/Standard_Generalized_Markup_Language#History
[3]: https://www.quirksmode.org/css/csshacks.html
[4]: http://www.ie6death.com/
[5]: https://en.wikipedia.org/wiki/Vacuum_tube
[6]: https://twitter.com/BrendanEich/status/773403975865470976
[7]: https://en.wikipedia.org/wiki/Parsing#Parser
[8]: https://en.wikipedia.org/wiki/Tom_Preston-Werner
[9]: https://en.wikipedia.org/wiki/INI_file
[10]: https://github.com/bevry/cson#what-is-cson
[11]: http://coffeescript.org/
[12]: https://en.wikipedia.org/wiki/Source-to-source_compiler
[13]: https://en.wikipedia.org/wiki/Comment_(computer_programming)
[14]: http://clarkevans.com/
[15]: http://exploringjs.com/es6/ch_maps-sets.html
[16]: https://www.tutorialspoint.com/compiler_design/compiler_design_lexical_analysis.htm
[17]: https://en.wikipedia.org/wiki/Fluent_interface
[18]: http://yaml.org/spec/1.1/current.html
[19]: http://www.yaml.org/spec/1.2/spec.html

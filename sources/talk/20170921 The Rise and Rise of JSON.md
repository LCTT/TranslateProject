thecyanbird translating

The Rise and Rise of JSON
======
JSON has taken over the world. Today, when any two applications communicate with each other across the internet, odds are they do so using JSON. It has been adopted by all the big players: Of the ten most popular web APIs, a list consisting mostly of APIs offered by major companies like Google, Facebook, and Twitter, only one API exposes data in XML rather than JSON. Twitter, to take an illustrative example from that list, supported XML until 2013, when it released a new version of its API that dropped XML in favor of using JSON exclusively. JSON has also been widely adopted by the programming rank and file: According to Stack Overflow, a question and answer site for programmers, more questions are now asked about JSON than about any other data interchange format.

![][1]

XML still survives in many places. It is used across the web for SVGs and for RSS and Atom feeds. When Android developers want to declare that their app requires a permission from the user, they do so in their app’s manifest, which is written in XML. XML also isn’t the only alternative to JSON—some people now use technologies like YAML or Google’s Protocol Buffers. But these are nowhere near as popular as JSON. For the time being, JSON appears to be the go-to format for communicating with other programs over the internet.

JSON’s dominance is surprising when you consider that as recently as 2005 the web world was salivating over the potential of “Asynchronous JavaScript and XML” and not “Asynchronous JavaScript and JSON.” It is of course possible that this had nothing to do with the relative popularity of the two formats at the time and reflects only that “AJAX” must have seemed a more appealing acronym than “AJAJ.” But even if some people were already using JSON instead of XML in 2005 (and in fact not many people were yet), one still wonders how XML’s fortunes could have declined so precipitously that a mere decade or so later “Asynchronous JavaScript and XML” has become an ironic misnomer. What happened in that decade? How did JSON supersede XML in so many applications? And who came up with this data format now depended on by engineers and systems all over the world?

### The Birth of JSON

The first JSON message was sent in April of 2001. Since this was a historically significant moment in computing, the message was sent from a computer in a Bay-Area garage. Douglas Crockford and Chip Morningstar, co-founders of a technology consulting company called State Software, had gathered in Morningstar’s garage to test out an idea.

Crockford and Morningstar were trying to build AJAX applications well before the term “AJAX” had been coined. Browser support for what they were attempting was not good. They wanted to pass data to their application after the initial page load, but they had not found a way to do this that would work across all the browsers they were targeting.

Though it’s hard to believe today, Internet Explorer represented the bleeding edge of web browsing in 2001. As early as 1999, Internet Explorer 5 supported a primordial form of XMLHttpRequest, which programmers could access using a framework called ActiveX. Crockford and Morningstar could have used this technology to fetch data for their application, but they could not have used the same solution in Netscape 4, another browser that they sought to support. So Crockford and Morningstar had to use a different system that worked in both browsers.

The first JSON message looked like this:

```
<html><head><script>
 document.domain = 'fudco';
 parent.session.receive(
 { to: "session", do: "test",
 text: "Hello world" }
 )
</script></head></html>
```

Only a small part of the message resembles JSON as we know it today. The message itself is actually an HTML document containing some JavaScript. The part that resembles JSON is just a JavaScript object literal being passed to a function called `receive()`.

Crockford and Morningstar had decided that they could abuse an HTML frame to send themselves data. They could point a frame at a URL that would return an HTML document like the one above. When the HTML was received, the JavaScript would be run, passing the object literal back to the application. This worked as long as you were careful to sidestep browser protections preventing a sub-window from accessing its parent; you can see that Crockford and Mornginstar did that by explicitly setting the document domain. (This frame-based technique, sometimes called the hidden frame technique, was commonly used in the late 90s before the widespread implementation of XMLHttpRequest.)

The amazing thing about the first JSON message is that it’s not obviously the first usage of a new kind of data format at all. It’s just JavaScript! In fact the idea of using JavaScript this way is so straightforward that Crockford himself has said that he wasn’t the first person to do it—he claims that somebody at Netscape was using JavaScript array literals to communicate information as early as 1996. Since the message is just JavaScript, it doesn’t require any kind of special parsing. The JavaScript interpreter can do it all.

The first ever JSON message actually ran afoul of the JavaScript interpreter. JavaScript reserves an enormous number of words—there are 64 reserved words as of ECMAScript 6—and Crockford and Morningstar had unwittingly used one in their message. They had used `do` as a key, but `do` is reserved. Since JavaScript has so many reserved words, Crockford decided that, rather than avoid using all those reserved words, he would just mandate that all JSON keys be quoted. A quoted key would be treated as a string by the JavaScript interpreter, meaning that reserved words could be used safely. This is why JSON keys are quoted to this day.

Crockford and Morningstar realized they had something that could be used in all sorts of applications. They wanted to name their format “JSML”, for JavaScript Markup Language, but found that the acronym was already being used for something called Java Speech Markup Language. So they decided to go with “JavaScript Object Notation”, or JSON. They began pitching it to clients but soon found that clients were unwilling to take a chance on an unknown technology that lacked an official specification. So Crockford decided he would write one.

In 2002, Crockford bought the domain [JSON.org][2] and put up the JSON grammar and an example implementation of a parser. The website is still up, though it now includes a prominent link to the JSON ECMA standard ratified in 2013. After putting up the website, Crockford did little more to promote JSON, but soon found that lots of people were submitting JSON parser implementations in all sorts of different programming languages. JSON’s lineage clearly tied it to JavaScript, but it became apparent that JSON was well-suited to data interchange between arbitrary pairs of languages.

### Doing AJAX Wrong

JSON got a big boost in 2005. That year, a web designer and developer named Jesse James Garrett coined the term “AJAX” in a blog post. He was careful to stress that AJAX wasn’t any one new technology, but rather “several technologies, each flourishing in its own right, coming together in powerful new ways.” AJAX was the name that Garrett was giving to a new approach to web application development that he had noticed gaining favor. His blog post went on to describe how developers could leverage JavaScript and XMLHttpRequest to build new kinds of applications that were more responsive and stateful than the typical web page. He pointed to Gmail and Flickr as examples of websites already relying on AJAX techniques.

The “X” in “AJAX” stood for XML, of course. But in a follow-up Q&A post, Garrett pointed to JSON as an entirely acceptable alternative to XML. He wrote that “XML is the most fully-developed means of getting data in and out of an AJAX client, but there’s no reason you couldn’t accomplish the same effects using a technology like JavaScript Object Notation or any similar means of structuring data.”

Developers indeed found that they could easily use JSON to build AJAX applications and many came to prefer it to XML. And so, ironically, the interest in AJAX led to an explosion in JSON’s popularity. It was around this time that JSON drew the attention of the blogosphere.

In 2006, Dave Winer, a prolific blogger and the engineer behind a number of XML-based technologies such as RSS and XML-RPC, complained that JSON was reinventing XML for no good reason. Though one might think that a contest between data interchange formats would be unlikely to engender death threats, Winer wrote:

> No doubt I can write a routine to parse [JSON], but look at how deep they went to re-invent, XML itself wasn’t good enough for them, for some reason (I’d love to hear the reason). Who did this travesty? Let’s find a tree and string them up. Now.

It’s easy to understand Winer’s frustration. XML has never been widely loved. Even Winer has said that he does not love XML. But XML was designed to be a system that could be used by everyone for almost anything imaginable. To that end, XML is actually a meta-language that allows you to define domain-specific languages for individual applications—RSS, the web feed technology, and SOAP (Simple Object Access Protocol) are examples. Winer felt that it was important to work toward consensus because of all the benefits a common interchange format could bring. He felt that XML’s flexibility should be able to accommodate everybody’s needs. And yet here was JSON, a format offering no benefits over XML except those enabled by throwing out the cruft that made XML so flexible.

Crockford saw Winer’s blog post and left a comment on it. In response to the charge that JSON was reinventing XML, Crockford wrote, “The good thing about reinventing the wheel is that you can get a round one.”

### JSON vs XML

By 2014, JSON had been officially specified by both an ECMA standard and an RFC. It had its own MIME type. JSON had made it to the big leagues.

Why did JSON become so much more popular than XML?

On [JSON.org][2], Crockford summarizes some of JSON’s advantages over XML. He writes that JSON is easier for both humans and machines to understand, since its syntax is minimal and its structure is predictable. Other bloggers have focused on XML’s verbosity and “the angle bracket tax.” Each opening tag in XML must be matched with a closing tag, meaning that an XML document contains a lot of redundant information. This can make an XML document much larger than an equivalent JSON document when uncompressed, but, perhaps more importantly, it also makes an XML document harder to read.

Crockford has also claimed that another enormous advantage for JSON is that JSON was designed as a data interchange format. It was meant to carry structured information between programs from the very beginning. XML, though it has been used for the same purpose, was originally designed as a document markup language. It evolved from SGML (Standard Generalized Markup Language), which in turn evolved from a markup language called Scribe, intended as a word processing system similar to LaTeX. In XML, a tag can contain what is called “mixed content,” or text with inline tags surrounding words or phrases. This recalls the image of an editor marking up a manuscript with a red or blue pen, which is arguably the central metaphor of a markup language. JSON, on the other hand, does not support a clear analogue to mixed content, but that means that its structure can be simpler. A document is best modeled as a tree, but by throwing out the document idea Crockford could limit JSON to dictionaries and arrays, the basic and familiar elements all programmers use to build their programs.

Finally, my own hunch is that people disliked XML because it was confusing, and it was confusing because it seemed to come in so many different flavors. At first blush, it’s not obvious where the line is between XML proper and its sub-languages like RSS, ATOM, SOAP, or SVG. The first lines of a typical XML document establish the XML version and then the particular sub-language the XML document should conform to. That is a lot of variation to account for already, especially when compared to JSON, which is so straightforward that no new version of the JSON specification is ever expected to be written. The designers of XML, in their attempt to make XML the one data interchange format to rule them all, fell victim to that classic programmer’s pitfall: over-engineering. XML was so generalized that it was hard to use for something simple.

In 2000, a campaign was launched to get HTML to conform to the XML standard. A specification was published for XML-compliant HTML, thereafter known as XHTML. Some browser vendors immediately started supporting the new standard, but it quickly became obvious that the vast HTML-producing public were unwilling to revise their habits. The new standard called for stricter validation of XHTML than had been the norm for HTML, but too many websites depended on HTML’s forgiving rules. By 2009, an attempt to write a second version of the XHTML standard was aborted when it became clear that the future of HTML was going to be HTML5, a standard that did not insist on XML compliance.

If the XHTML effort had succeeded, then maybe XML would have become the common data format that its designers hoped it would be. Imagine a world in which HTML documents and API responses had the exact same structure. In such a world, JSON might not have become as ubiquitous as it is today. But I read the failure of XHTML as a kind of moral defeat for the XML camp. If XML wasn’t the best tool for HTML, then maybe there were better tools out there for other applications also. In that world, our world, it is easy to see how a format as simple and narrowly tailored as JSON could find great success.

If you enjoyed this post, more like it come out every two weeks! Follow [@TwoBitHistory][3] on Twitter or subscribe to the [RSS feed][4] to make sure you know when a new post is out.

--------------------------------------------------------------------------------

via: https://twobithistory.org/2017/09/21/the-rise-and-rise-of-json.html

作者：[Two-Bit History][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://twobithistory.org
[b]: https://github.com/lujun9972
[1]: https://twobithistory.org/images/json.svg
[2]: http://JSON.org
[3]: https://twitter.com/TwoBitHistory
[4]: https://twobithistory.org/feed.xml

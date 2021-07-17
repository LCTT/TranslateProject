[#]: subject: (Use XMLStarlet to parse XML in your the Linux terminal)
[#]: via: (https://opensource.com/article/21/7/parse-xml-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (zepoch)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Use XMLStarlet to parse XML in your the Linux terminal
======
Become an XML star with XMLStarlet, an XML toolkit for your terminal.
![Penguin with green background][1]

Learning to parse XML is often considered a complex venture, but it doesn't have to be. [XML is highly and strictly structured][2], so it's relatively predictable. There are also lots of tools out there to help make the job manageable.

One of my favorite XML utilities is [XMLStarlet][3], an XML toolkit for your terminal. With XMLStarlet, you can validate, parse, edit, format, and transform XML data. XMLStarlet is a relatively minimal command, but navigating XML is full of potential, so this article demonstrates how to use it to query XML data.

### Install

XMLStarlet is installed by default on CentOS, Fedora, and many other modern Linux distributions, so just open a terminal and type `xmlstarlet` to access it. If XMLStarlet isn't already installed, your operating system offers to install it for you.

Alternately, you can install the `xmlstarlet` command from your package manager:


```
`$ sudo dnf install xmlstarlet`
```

On macOS, use [MacPorts][4] or [Homebrew][5]. On Windows, use [Chocolatey][6].

Should all else fail, you can install it manually from the [source code on Sourceforge][7].

### Parsing XML with XMLStarlet

There are many tools designed to help parse and transform XML data, including software libraries that let you [write your own parser][8] and complex commands like `fop` and `xsltproc`. Sometimes you don't need to process XML data, though; you just need a convenient way to extract important data from, update, or just validate it. For spontaneous XML interactions, I use `xmlstarlet`, a classic "Swiss Army knife"-style application that does the most common XML tasks. You can see what it has to offer by running the command along with the `--help` option:


```
$ xmlstarlet --help
Usage: xmlstarlet [&lt;options&gt;] &lt;command&gt; [&lt;cmd-options&gt;]
where &lt;command&gt; is one of:
  ed    (or edit)      - Edit/Update XML document(s)
  sel   (or select)    - Select data or query XML document(s) (XPATH, etc)
  tr    (or transform) - Transform XML document(s) using XSLT
  val   (or validate)  - Validate XML document(s) (well-formed/DTD/XSD/RelaxNG)
  fo    (or format)    - Format XML document(s)
  el    (or elements)  - Display element structure of XML document
  c14n  (or canonic)   - XML canonicalization
  ls    (or list)      - List directory as XML
[...]
```

You can get further help by appending `--help` to the end of any of these subcommands:


```
$ xmlstarlet sel --help
  -Q or --quiet             - do not write anything to standard output.
  -C or --comp              - display generated XSLT
  -R or --root              - print root element &lt;xsl-select&gt;
  -T or --text              - output is text (default is XML)
  -I or --indent            - indent output
[...]
```

#### Selecting data with sel

You can view the data in XML with the `xmlstarlet select` (`sel` for short) command. Here's a simple XML document:


```
&lt;?xml version="1.0" encoding="UTF-8" standalone="no"?&gt;
&lt;xml&gt;
  &lt;os&gt;
   &lt;linux&gt;
    &lt;distribution&gt;
      &lt;name&gt;Fedora&lt;/name&gt;
      &lt;release&gt;7&lt;/release&gt;
      &lt;codename&gt;Moonshine&lt;/codename&gt;
      &lt;spins&gt;
        &lt;name&gt;Live&lt;/name&gt;
        &lt;name&gt;Fedora&lt;/name&gt;
        &lt;name&gt;Everything&lt;/name&gt;
      &lt;/spins&gt;
    &lt;/distribution&gt;

    &lt;distribution&gt;
      &lt;name&gt;Fedora Core&lt;/name&gt;
      &lt;release&gt;6&lt;/release&gt;
      &lt;codename&gt;Zod&lt;/codename&gt;
      &lt;spins&gt;&lt;/spins&gt;
    &lt;/distribution&gt;
   &lt;/linux&gt;
  &lt;/os&gt;    
&lt;/xml&gt;
```

When looking for data in an XML file, your first task is to focus on the node you want to explore. If you know the path to the node, specify the full path with the `--value-of` option. The earlier in the [Document Object Model][9] (DOM) tree you start to explore, the more information you see:


```
$ xmlstarlet select --template \
\--value-of /xml/os/linux/distribution \
\--nl myfile.xml
      Fedora
      7
      Moonshine
     
        Live
        Fedora
        Everything     
     
      Fedora Core
      6
      Zod
```

The `--nl` stands for "new line," and it inserts copious amounts of whitespace to ensure your terminal prompt gets a new line after your results are in. I've removed some of the excess space in the sample output.

Narrow your focus by descending further into the DOM tree:


```
$ xmlstarlet select --template \
\--value-of /xml/os/linux/distribution/name \
\--nl myfile.xml
Fedora
Fedora Core
```

#### Conditional selects

One of the most powerful tools for navigating and parsing XML is called XPath. It governs the syntax used in XML searches and invokes functions from XML libraries. XMLStarlet understands XPath expressions, so you can make your selection conditional with an XPath function. XPath features a wealth of functions, and it's [documented in detail by W3C][10], but I find [Mozilla's XPath documentation][11] more concise.

You can use square brackets as a test function, comparing the contents of an element to some value. Here's a test for the value of the `<name>` element, which returns the release number associated only with a specific match.

Imagine for a moment that the sample XML file contains all Fedora releases beginning with 1. To view all release numbers associated with the old name "Fedora Core" (the project dropped "Core" from the name from release 7 onward):


```
$ xmlstarlet sel --template \
\--value-of '/xml/os/linux/distribution[name = "Fedora Core"]/release' \
\--nl myfile.xml
6
5
4
3
2
1
```

You could view all codenames for those releases, too, by changing the `--value-of` path to `/xml/os/linux/distribution[name = "Fedora Core"]/codename`.

### Matching paths and getting values

An advantage of viewing XML tags as nodes is that once you find the node, you can think of it as your current "directory" of data. It's not really a directory, at least not in the filesystem sense, but it is a collection of data that you can query. To help you keep your destination and the data "inside" it separate, XMLStarlet differentiates between what you're trying to match with the `--match` option and the value of the data you want with a `--value-of` option.

Suppose you know that the `<spin>` node contains several elements. That makes it your destination. Once you're there, you can use `--value-of` to specify which element you want a value for. To look at all elements, use a dot (`.`) to represent your current location:


```
$ xmlstarlet sel --template \
\--match '/xml/os/linux/distribution/spin' \
\--value-of '.' --nl myfile.xml \
Live
Fedora
Everything
```

As with navigating the DOM, you can use XPath expressions to limit the scope of what data is returned. In this example, I use the `last()` function to retrieve just the last element in the `spin` node:


```
$ xmlstarlet select --template \
\--match '/xml/os/linux/distribution/spin' \
\--value-of '*[last()]' --nl myfile.xml
Everything
```

In this example, I use the `position()` function to select a specific element in the `spin` node:


```
$ xmlstarlet select --template \
\--match '/xml/os/linux/distribution/spin' \
\--value-of '*[position() = 2]' --nl myfile.xml
Fedora
```

The `--match` and `--value-of` options can overlap, so it's up to you how you want to use them together. These two expressions, in the case of the sample XML, do the same thing:


```
$ xmlstarlet select  --template \
\--match '/xml/os/linux/distribution/spin' \
\--value-of '.' \
\--nl myfile.xml
Live
Fedora
Everything     

$ xmlstarlet select --template \
\--match '/xml/os/linux/distribution' \
\--value-of 'spin' \
\--nl myfile.xml
Live
Fedora
Everything
```

### Getting comfortable with XML

XML can seem over-verbose and unwieldy at times, but the tools built to interact with it consistently surprise me. If you're looking to take advantage of XML, then XMLStarlet could be a good entry point. The next time you're about to open an XML file to look at structured data, try using XMLStarlet and see if you can query that data instead. The more comfortable you get with XML, the better it can serve you as a robust and flexible data format.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/parse-xml-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_penguin_green.png?itok=ENdVzW22 (Penguin with green background)
[2]: https://opensource.com/article/21/6/what-xml
[3]: https://en.wikipedia.org/wiki/XMLStarlet
[4]: https://opensource.com/article/20/11/macports
[5]: https://opensource.com/article/20/6/homebrew-mac
[6]: https://opensource.com/article/20/3/chocolatey
[7]: http://xmlstar.sourceforge.net
[8]: https://opensource.com/article/21/6/parsing-config-files-java
[9]: https://opensource.com/article/21/6/what-xml#dom
[10]: https://www.w3.org/TR/1999/REC-xpath-19991116
[11]: https://developer.mozilla.org/en-US/docs/Web/XPath/Functions

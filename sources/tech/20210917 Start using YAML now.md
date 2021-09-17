[#]: subject: "Start using YAML now"
[#]: via: "https://opensource.com/article/21/9/intro-yaml"
[#]: author: "Ayush Sharma https://opensource.com/users/ayushsharma"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Start using YAML now
======
What is YAML, and why is it about time we started using it?
![woman on laptop sitting at the window][1]

YAML (YAML Ain't Markup Language) is a human-readable data serialization language. Its syntax is simple and human-readable. It does not contain quotation marks, opening and closing tags, or braces. It does not contain anything which might make it harder for humans to parse nesting rules. You can scan your YAML document and immediately know what's going on.

### YAML features

YAML has some super features which make it superior to other serialization formats:

  * Easy to skim.
  * Easy to use.
  * Portable between programming languages.
  * Native data structures of Agile languages.
  * Consistent model to support generic tools.
  * Supports one-pass processing.
  * Expressive and extensible.



I will show you YAML's power further with some examples.

Can you figure out what's going on below?


```
\-------
# My grocery list
groceries:
    - Milk
     - Eggs
     - Bread
     - Butter
...
```

The above example contains a simple list of groceries to buy, and it's a fully-formed YAML document. In YAML, strings aren't quoted, and lists need simple hyphens and spaces. A YAML document starts with **\---** and ends with **...**, but they are optional. Comments in YAML begin with a **#**.

Indentation is key in YAML. Indentation must contain spaces, not tabs. And while the number of spaces required is flexible, it's a good idea to keep them consistent.

### Basic Elements

#### Collections

YAML has two types of collections: _Lists_ (for sequences) and _dictionaries_ (for mappings). Lists are key-value pairs where every value is on a new line, beginning with a hyphen and space. Dictionaries are key-value pairs where every value is a mapping containing a key, a colon and space, and a value.

For example:


```
# My List
groceries:
    - Milk
     - Eggs
     - Bread
     - Butter

# My dictionary
contact:
 name: Ayush Sharma
 email: [myemail@example.com][2]
```

Lists and dictionaries are often combined to provide more complex data structures. Lists can contain dictionaries, and dictionaries can contain lists.

#### Strings

Strings in YAML don't need quotation marks. Multi-line strings are defined using **|** or **&gt;**. The former preserves newlines, but the latter does not.

For example:


```
my_string: |
    This is my string.
     It can contain many lines.
     Newlines are preserved.
my_string_2: &gt;
    This is my string.
     This can also contain many lines.
     Newlines aren't preserved and all lines are folded.
```

#### Anchors

YAML can have repeatable blocks of data using node anchors. The **&amp;** character defines a block of data that is later referenced using *****. For example:


```
billing_address: &amp;add1
 house: B1
 street: My Street

shipping_address: *add1
```

At this point, you know enough YAML to get started. You can play around with the online YAML parser to test yourself. If you work with YAML daily, then [this handy cheatsheet][3] will be helpful.

* * *

_This article was originally published on the [author's personal blog][4] and has been adapted with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/intro-yaml

作者：[Ayush Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ayushsharma
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-window-focus.png?itok=g0xPm2kD (young woman working on a laptop)
[2]: mailto:myemail@example.com
[3]: https://yaml.org/refcard.html
[4]: https://notes.ayushsharma.in/2021/08/introduction-to-yaml

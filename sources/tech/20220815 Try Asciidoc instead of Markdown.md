[#]: subject: "Try Asciidoc instead of Markdown"
[#]: via: "https://opensource.com/article/22/8/drop-markdown-asciidoc"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Try Asciidoc instead of Markdown
======
Next time you write, use Asciidoc and Asciidoctor as alternatives to Markdown.

![Person using a laptop][1]

I'm a happy user of the XML-based [Docbook][2] markup language. To me, it's a precise, explicit, and detailed system that allows me to have contextual and domain-specific metadata in what I write. Best of all, though, it can be transformed (that's what XML users call it when XML is converted into another format) into nearly any format, including HTML, EPUB, FO for PDF, plain text, and more. With great power comes a lot of typing, though, and sometimes Docbook feels like it's surplus to requirements. Luckily, there's [Asciidoc][3], a system of writing plain text with the same markup-less feel of Markdown, but that transforms to Docbook to take advantage of its precision and flexibility.

### Asciidoc rules

Like Markdown, one of the goals of Asciidoc is that you don't really have to *learn* it. Instead, it aims to be intuitive and natural. You may well have written snippets of valid Asciidoc without realizing it if you've ever added a little style to a plain text document for readability. For instance, if you habitually separate paragraphs with a blank line, then you've written the equivalent of the HTML `<p>` or Docbook `<para>` tag. It seems obvious, and yet in academia separating paragraphs with blank lines isn't generally done, so even this simple convention is technically markup.

Here's the most common syntax.

#### Text styles

Text styles include the basics such as bold, italics, and code font. Most of the notation is relatively intuitive, with the possible exception of italics.

***Bold***

*_Italics_*

**_Bold and italic_**

``Monospace or code``

#### Code

Code is marked with backticks or by explicit declaration of a code block.

``Monospace or code``

```
[source,python]
----
print('a whole code block')
----
```

#### Headlines

Headings are marked with leading equal signs (`=` ):

= Heading 1 (`<h1>` )

== Heading 2 (`<h2>` )

=== Heading 3 (`<h3>` )

==== Heading 4 (`<h4>` )

===== Heading 5 (`<h5>` )

====== Heading 6 (`<h6>` )

#### Links

Hyperlinks favor the link first, followed by the word or phrase used to "disguise" the link as text.

This is a [http://example.com[hyperlink][4]] that leads to the example.com site.

I don't find this as elegant as Markdown's link notation, but then it's a lot more flexible. For instance, you can add attributes in Asciidoc links:

This is a [https://example.com[link,role=external,window=_blank][5]] with the `target="_blank"` attribute set.

#### Lots more

Asciidoc also features internal links so you can link from one section to another, a standard for document headers, automatic table of content generation, the ability to include other documents within another, and much much more.

But best of all, Asciidoc is actually *standardized*. Not everyone knows it, but the term "Markdown" doesn't refer to one markup-light language. Different organizations and groups regularly customize and alter Markdown for their own use, so when you use Markdown you really ought to verify *which* markdown you're meant to use. Many of the conventions you might have learned from one website using Markdown don't carry over to another site using Markdown. There's essentially no standard for Markdown, and that's resulted in such confusion that the [Commonmark.org][6] project has been formed in an attempt to assemble a standardized definition.

Asciidoc was designed from the start with a standard definition, so the tool or website that claims to parse Asciidoc actually does parse all valid Asciidoc, because there's only one valid Asciidoc.

### Asciidoc to anything

The point of writing in a markup-light language like Asciidoc is to ensure predictability and consistency when text is parsed. You want a person to write a script, or to run an application someone else has written, to be able to transform your plain text into whatever format works best for them. Sometimes that's HTML (incidentally Markdown's native output format, and fallback language when there's something missing from its own syntax.) Other times it's an EPUB, or a PDF for printing, Docbook, a LibreOffice document, or any number of possible output formats.

There are several tools to help you transform Asciidoc to another format. A popular command is [Asciidoctor][7], which you can install using your package manager. For instance, on Fedora, CentOS, or RHEL:

```
$ sudo dnf install asciidoctor
```

On Debian-based systems:

```
$ sudo apt install asciidoctor
```

Alternately, you can install it on any OS with Ruby:

```
$ gem install asciidoctor
```

Here's a simple example of an Asciidoc document, which you can create using any  or even a word processor (like ) as long as you save the file as plain text. Most applications expect a plain text document to use the extension `.txt`, and while it's a convention use the extension `.adoc` for Asciidoc, it's not necessary. Asciidoctor doesn't require any special extension.

```
= This is my example document

It's not written in _Markdown_, nor _reStructured Text_.
This is *Asciidoc*.

It can be transformed into nearly any format using the tool `Asciidoctor` and other similar parsers.
Try it for yourself!
```

To transform an Asciidoc document to HTML, run `asciidoctor` :

```
$ asciidoctor example.adoc
```

The file `example.adoc` is transformed into HTML5 by default, but you can use different backends to gain access to more formats.

### From Asciidoc to XML

My favourite is the Docbook backend, because it transforms my Asciidoc to Docbook XML, allowing me to use my existing Docbook toolchain (custom Makefiles, Apache FOP, `xsltproc`, `xmlto`, and so on) to complete my work:

```
$ asciidoctor --backend docbook5 example.adoc
```

This outputs Docbook XML. The final two built-in backends are `xhtml5` and `manpage`.

### From Asciidoc to EPUB

If you want to turn your writing into an ebook, you can install the EPUB3 backend:

```
$ gem install asciidoctor-epub3
```

Transform your Asciidoc into EPUB:

```
$ asciidoctor-epub3 example.adoc
```

### From Asciidoc to PDF

You can transform Asciidoc directly to PDF, too:

```
$ gem install asciidoctor-pdf
$ asciidoctor-pdf example.adoc
```

![Asciidoctor-pdf][8]

Image by:

(Seth Kenlon, CC BY-SA 4.0)

### Who should use Asciidoc

Asciidoc is excellent for technical writers and writers who have precise requirements for how they want text to be organized and parsed. It's a clear and strictly defined markup format that eliminates the confusion of competing Markdown formats, and it transforms to all the major formats. Asciidoc is admittedly more verbose and possibly less intuitive than Markdown, but it's still just plain text so you can author on anything, and Asciidoctor makes processing easy. Next time you write a document for any purpose, consider trying Asciidoc.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/8/drop-markdown-asciidoc

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/laptop_screen_desk_work_chat_text.png
[2]: https://opensource.com/article/17/9/docbook
[3]: http://asciidoc.org
[4]: http://example.com[hyperlink
[5]: https://example.com[link,role=external,window=_blank
[6]: http://commonmark.org
[7]: https://asciidoctor.org
[8]: https://opensource.com/sites/default/files/2022-08/asciidoc-pdf.webp

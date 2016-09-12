Translating by 19761332
DAISY : A Linux-compatible text format for the visually impaired
=================================================================


![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/education/osdc-lead_books.png?itok=K8wqfPT5)
>Image by : 
Image by Kate Ter Haar. Modified by opensource.com. CC BY-SA 2.0.

If you're blind or visually impaired like I am, you usually require various levels of hardware or software to do things that people who can see take for granted. One among these is specialized formats for reading print books: Braille (if you know how to read it) or specialized text formats such as DAISY.

### What is DAISY?

DAISY stands for Digital Accessible Information System. It's an open standard used almost exclusively by the blind to read textbooks, periodicals, newspapers, fiction, you name it. It was founded in the mid '90s by [The DAISY Consortium][1], a group of organizations dedicated to producing a set of standards that would allow text to be marked up in a way that would make it easy to read, skip around in, annotate, and otherwise manipulate text in much the same way a sighted user would.

The current version of DAISY 3.0, was released in mid-2005 and is a complete rewrite of the standard. It was created with the goal of making it much easier to write books complying with it. It's worth noting that DAISY can support plain text only, audio recordings (in PCM Wave or MPEG Layer III format) only, or a combination of text and audio. Specialized software can read these books and allow users to set bookmarks and navigate a book as easily as a sighted person would with a print book.

### How does DAISY work?

DAISY, regardless of the specific version, works a bit like this: You have your main navigation file (ncc.html in DAISY 2.02) that contains metadata about the book, such as author's name, copyright date, how many pages the book has, etc. This file is a valid XML document in the case of DAISY 3.0, with DTD (document type definition) files being highly recommended to be included with each book.

In the navigation control file is markup describing precise positions—either text caret offsets in the case of text navigation or time down to the millisecond in the case of audio recordings—that allows the software to skip to that exact point in the book much as a sighted person would turn to a chapter page. It's worth noting that this navigation control file only contains positions for the main, and largest, elements of a book.

The smaller elements are handled by SMIL (synchronized multimedia integration language) files. These files contain position points for each chapter in the book. The level of navigation depends heavily on how well the book was marked up. Think of it like this: If a print book has no chapter headings, you will have a hard time figuring out which chapter you're in. If a DAISY book is badly marked up, you might only be able to navigate to the start of the book, or possibly only to the table of contents. If a book is marked up badly enough (or missing markup entirely), your DAISY reading software is likely to simply ignore it.

### Why the need for specialized software?

You may be wondering why, if DAISY is little more than HTML, XML, and audio files, you would need specialized software to read and manipulate it. Technically speaking, you don't. The specialized software is mostly for convenience. In Linux, for example, a simple web browser can be used to open the books and read them. If you click on the XML file in a DAISY 3 book, all the software will generally do is read the spines of the books you give it access to and create a list of them that you click on to open. If a book is badly marked up, it won't show up in this list.

Producing DAISY is another matter entirely, and usually requires either specialized software or enough knowledge of the specifications to modify general-purpose software to parse it.

### Conclusion

Fortunately, DAISY is a dying standard. While it is very good at what it does, the need for specialized software to produce it has set us apart from the normal sighted world, where readers use a variety of formats to read their books electronically. This is why the DAISY consortium has succeeded DAISY with EPUB, version 3, which supports what are called media overlays. This is basically an EPUB book with optional audio or video. Since EPUB shares a lot of DAISY's XML markup, some software that can read DAISY can see EPUB books but usually cannot read them. This means that once the websites that provide books for us switch over to this open format, we will have a much larger selection of software to read our books.

--------------------------------------------------------------------------------

via: https://opensource.com/life/16/5/daisy-linux-compatible-text-format-visually-impaired

作者：[Kendell Clark][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/kendell-clark
[1]: http://www.daisy.org

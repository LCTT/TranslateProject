[#]: collector: (lujun9972)
[#]: translator: (qfzy1233)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (An introduction to Markdown)
[#]: via: (https://opensource.com/article/19/9/introduction-markdown)
[#]: author: (Juan Islas https://opensource.com/users/xislashttps://opensource.com/users/mbbroberghttps://opensource.com/users/scottnesbitthttps://opensource.com/users/scottnesbitthttps://opensource.com/users/f%C3%A1bio-emilio-costahttps://opensource.com/users/don-watkinshttps://opensource.com/users/greg-phttps://opensource.com/users/marcobravohttps://opensource.com/users/alanfdosshttps://opensource.com/users/scottnesbitthttps://opensource.com/users/jamesf)

一份 Markdown 简介
======
一次编辑并将文本转换为多种格式。下面是如何开始使用 Markdown.
![Woman programming][1]

在很长一段时间里，我发现我在 GitLab 和 GitHub 上看到的所有文件都带有**.md**扩展名是专门为开发人员编写的文件类型。几周前，当我开始使用Markdown时，我的观念发生了变化。它很快成为我日常工作中最重要的工具。

Markdown 使我的生活更简易。我只需要在已经编写的代码中添加一些符号，并且在浏览器扩展或开源程序的帮助下，我可以将文本转换为各种常用格式，如ODT、电子邮件(稍后将详细介绍)、PDF和EPUB。

### 什么是 Markdown?

来自 [维基百科][2]的友情提示:

> Markdown是一种轻量级标记语言，具有纯文本格式语法。

这意味着通过在文本中使用一些额外的符号，Markdown 可以帮助您创建具有特定结构和格式的文档。当您以纯文本(例如，在记事本应用程序中)做笔记时，没有任何东西表明哪个文本应该是粗体或斜体。在普通文本中，你在编写链接时需要将一个链接编写为**<http://example.com>**，或者编写为**example.com**，又或**访问网站(example.com)**。这样没有内在的一致性。

：但是如果你按照Markdown的方式编写，你的文本就有了内在的一致性。计算机喜欢一致性，因为这使得它们能够遵循严格的指令而不用担心异常。

Trust me; once you learn to use Markdown, every writing task will be, in some way, easier and better than before. So let's learn it.

### Markdown basics

The following rules are the basics for writing in Markdown.

  1. Create a text file with an **.md** extension (for example, **example.md**.) You can use any text editor (even a word processor like LibreOffice or Microsoft Word), as long as you remember to save it as a _text_ file.



![Names of Markdown files][3]

  2. Write whatever you want, just as you usually do:


```
Lorem ipsum

Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

De Finibus Bonorum et Malorum

Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.
Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.

  Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.
```

  3. Make sure to place an empty line between paragraphs. That might feel unnatural if you're used to writing business letters or traditional prose, where paragraphs have only one new line and maybe even an indentation before the first word. For Markdown, an empty line (some word processors mark this with **¶**, called a Pilcrow symbol) guarantees a new paragraph is created when you convert it to another format like HTML.

  4. Designate titles and subtitles. For the document's title, add a pound or hash (**#**) symbol and a space before the text (e.g., **# Lorem ipsum**). The first subtitle level uses two (**## De Finibus Bonorum et Malorum**), the next level gets three (**### Third Subtitle**), and so on. Note that there is a space between the pound sign and the first word.


```
# Lorem ipsum

Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

## De Finibus Bonorum et Malorum

Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.
Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.

  Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.
```

  5. If you want **bold** letters, just place the letters between two asterisks (stars) with no spaces: ****This will be in bold****.




![Bold text in Markdown][4]

  6. For _italics_, put the text between underline symbols with no spaces: **_I want this text to be in italics_**.



![Italics text in Markdown][5]

  7. To insert a link (like [Markdown Tutorial][6]), put the text you want to link in brackets and the URL in parentheses with no spaces between them:
**[Markdown Tutorial](<https://www.markdowntutorial.com/>)**.



![Hyperlinks in Markdown][7]

  8. Blockquotes are written with a greater-than (**&gt;**) symbol and a space before the text you want to quote: **&gt; A famous quote**.



![Blockquote text in Markdown][8]

### Markdown tutorials and tip sheets

These tips will get you started writing in Markdown, but it has a lot more functions than just bold and italics and links. The best way to learn Markdown is to use it, but I recommend investing 15 minutes stepping through the simple [Markdown Tutorial][6] to practice these rules and learn a couple more.

Because modern Markdown is an amalgamation of many different interpretations of the idea of structured text, the [CommonMark][9] project defines a spec with a rigid set of rules to bring clarity to Markdown. It might be helpful to keep a [CommonMark-compliant cheatsheet][10] on hand when writing.

### What you can do with Markdown

Markdown lets you write anything you want—once—and transform it into almost any kind of format you want to use. The following examples show how to turn simple text written in MD into different formats. You don't need multiple formats of your text—you can start from a single source and then… rule the world!

  1. **Simple note-taking:** You can write your notes in Markdown and, the moment you save them, the open source note application [Turtl][11] interprets your text file and shows you the formatted result. You can have your notes anywhere!



![Turtl application][12]

  2. **PDF files:** With the [Pandoc][13] application, you can convert your Markdown into a PDF with one simple command: **pandoc &lt;file.md&gt; -o &lt;file.pdf&gt;**.



![Markdown text converted to PDF with Pandoc][14]

  3. **Email:** You can also convert Markdown text into an HTML-formatted email by installing the browser extension [Markdown Here][15]. To use it, just select your Markdown text, use Markdown Here to translate it into HTML, and send your message using your favorite email client.



![Markdown text converted to email with Markdown Here][16]

### Start using it

You don't need a special application to use Markdown—you just need a text editor and the tips above. It's compatible with how you already write; all you need to do is use it, so give it a try.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/introduction-markdown

作者：[Juan Islas][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/xislashttps://opensource.com/users/mbbroberghttps://opensource.com/users/scottnesbitthttps://opensource.com/users/scottnesbitthttps://opensource.com/users/f%C3%A1bio-emilio-costahttps://opensource.com/users/don-watkinshttps://opensource.com/users/greg-phttps://opensource.com/users/marcobravohttps://opensource.com/users/alanfdosshttps://opensource.com/users/scottnesbitthttps://opensource.com/users/jamesf
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop-music-headphones.png?itok=EQZ2WKzy (Woman programming)
[2]: https://en.wikipedia.org/wiki/Markdown
[3]: https://opensource.com/sites/default/files/uploads/markdown_names_md-1.png (Names of Markdown files)
[4]: https://opensource.com/sites/default/files/uploads/markdown_bold.png (Bold text in Markdown)
[5]: https://opensource.com/sites/default/files/uploads/markdown_italic.png (Italics text in Markdown)
[6]: https://www.markdowntutorial.com/
[7]: https://opensource.com/sites/default/files/uploads/markdown_link.png (Hyperlinks in Markdown)
[8]: https://opensource.com/sites/default/files/uploads/markdown_blockquote.png (Blockquote text in Markdown)
[9]: https://commonmark.org/help/
[10]: https://opensource.com/downloads/cheat-sheet-markdown
[11]: https://turtlapp.com/
[12]: https://opensource.com/sites/default/files/uploads/markdown_turtl_02.png (Turtl application)
[13]: https://opensource.com/article/19/5/convert-markdown-to-word-pandoc
[14]: https://opensource.com/sites/default/files/uploads/markdown_pdf.png (Markdown text converted to PDF with Pandoc)
[15]: https://markdown-here.com/
[16]: https://opensource.com/sites/default/files/uploads/markdown_mail_02.png (Markdown text converted to email with Markdown Here)

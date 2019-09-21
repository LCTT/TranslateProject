[#]: collector: (lujun9972)
[#]: translator: (qfzy1233)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (An introduction to Markdown)
[#]: via: (https://opensource.com/article/19/9/introduction-markdown)
[#]: author: (Juan Islas https://opensource.com/users/xislashttps://opensource.com/users/mbbroberghttps://opensource.com/users/scottnesbitthttps://opensource.com/users/scottnesbitthttps://opensource.com/users/f%C3%A1bio-emilio-costahttps://opensource.com/users/don-watkinshttps://opensource.com/users/greg-phttps://opensource.com/users/marcobravohttps://opensource.com/users/alanfdosshttps://opensource.com/users/scottnesbitthttps://opensource.com/users/jamesf)

An introduction to Markdown
======
Write once and convert your text into multiple formats. Here's how to
get started with Markdown.
![Woman programming][1]

For a long time, I thought all the files I saw on GitLab and GitHub with an **.md** extension were written in a file type exclusively for developers. That changed a few weeks ago when I started using Markdown. It quickly became the most important tool in my daily work.

Markdown makes my life easier. I just need to add a few symbols to what I'm already writing and, with the help of a browser extension or an open source program, I can transform my text into a variety of commonly used formats such as ODT, email (more on that later), PDF, and EPUB.

### What is Markdown?

A friendly reminder from [Wikipedia][2]:

> Markdown is a lightweight markup language with plain text formatting syntax.

What this means to you is that by using just a few extra symbols in your text, Markdown helps you create a document with an explicit structure. When you take notes in plain text (in a notepad application, for example), there's nothing to indicate which text is meant to be bold or italic. In ordinary text, you might write a link as **<http://example.com>** one time, then as just **example.com**, and later **go to the website (example.com)**. There's no internal consistency.

But if you write the way Markdown prescribes, your text has internal consistency. Computers like consistency because it enables them to follow strict instructions without worrying about exceptions.

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

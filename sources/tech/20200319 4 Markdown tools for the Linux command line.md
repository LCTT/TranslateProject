[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 Markdown tools for the Linux command line)
[#]: via: (https://opensource.com/article/20/3/markdown-apps-linux-command-line)
[#]: author: (Scott Nesbitt https://opensource.com/users/scottnesbitt)

4 Markdown tools for the Linux command line
======
Command-line Markdown tools are fast, powerful, and flexible. Here are
four utilities to try.
![A person working.][1]

When it comes to working with files formatted with [Markdown][2], command-line tools rule the roost. They're light, fast, powerful, and flexible, and most of them follow the Unix philosophy of doing one thing well.

Take a look at four utilities that can help you work more efficiently with Markdown files at the command line.

### mdless

If you've hung around the Linux command line for a while, you're probably familiar with a text-file viewer called [less][3]. Sure, you can use less to view Markdown files—but the result is a tad dull. How can you view Markdown files with a bit of pizzazz in a terminal window? By using [mdless][4].

![mdless][5]

You can move around using the arrow keys on your keyboard, and mdless packs quite a good search function.

Not only does mdless display text, but it also renders formatting like headings, bold, and italics. It can also display tables and do syntax highlighting of code blocks. You can also [customize][6] the look and feel of mdless by creating one or more theme files.

### Markdown lint tool

When you're typing quickly, you make mistakes. If you miss a bit of formatting when using Markdown (or any other markup language), it can cause problems when you convert your file to another format.

Coders often use tools called _linters_ to check for correct syntax. You can do the same for Markdown using the [Markdown lint tool][7].

When you run this tool over a file that's formatted with Markdown, it checks the formatting against a [set of rules][8]. Those rules govern the structure of a document, including the order of header levels, incorrect indentation and spacing, problems with code blocks, the existence of HTML in a file, and more.

![Markdown lint tool][9]

The rules can be a bit strict. But running the Markdown lint tool over a file before converting it to another format can prevent the grief that comes from bad or inconsistent formatting.

### mdmerge

Combining files of any kind can be a pain. Take, for example, an eBook I'm pulling together. It's a collection of essays that were first published in my [weekly email letter][10]. Those essays were in individual files, and being the masochist that I am, I combined them in a messy, manual way.

I wish I'd known about [mdmerge][11] before I started that project. It would have saved me a lot of time and energy.

mdmerge, as you've probably guessed from its name, combines two or more Markdown files into a single file. You don't need to type the names of the files at the command line. Instead, you can add them to a file called **book.txt** and use that as an input file for mdmerge.

That's not all mdmerge can do. You can add a reference to another document—either one formatted with Markdown or a piece of source code—and pull it into your main document. That enables you to create [master documents][12] that you can tailor to specific audiences.

mdmerge isn't one of those utilities you'll use all the time. When you need it, you'll be glad it's on your hard drive.

### bashblog

[bashblog][13] isn't strictly a tool for working with Markdown. It takes files that are formatted using Markdown and uses them to build a simple blog or website. Think of bashblog as a [static site generator][14], but one that doesn't have a bunch of fragile dependencies. Just about everything you need is in a shell script weighing just under 50KB.

To use bashblog, all you need is a Markdown processor installed on your computer. From there, you edit the shell script to add information about your blog—for example, its title, your name, your social media links, and the like. Then run the script. A new post opens in your default text editor. Start typing.

After you save a post, you can publish it or save it as a draft. If you choose to publish the post, bashblog generates your blog, posts and all, as a set of HTML files that you can upload to a web server.

Out of the box, your blog is bland but serviceable. You can edit the site's CSS file to give it a look and feel all your own.

![bashblog][15]

### What about Pandoc?

Sure, Pandoc is a very powerful tool for converting files formatted with Markdown to other markup languages. But there's more to working with Markdown at the command line than Pandoc.

If you need a Pandoc fix, check out these articles that we've published on Opensource.com:

  * [Convert files at the command line with Pandoc][16]
  * [Turn your book into a website and an ePub using Pandoc][17]
  * [How to use Pandoc to produce a research paper][18]
  * [Convert Markdown files to word processor docs using Pandoc][19]



--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/markdown-apps-linux-command-line

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003784_02_os.comcareers_os_rh2x.png?itok=jbRfXinl (A person working.)
[2]: https://opensource.com/article/19/9/introduction-markdown
[3]: https://opensource.com/article/18/4/using-less-view-text-files-command-line
[4]: https://github.com/ttscoff/mdless
[5]: https://opensource.com/sites/default/files/uploads/mdless.png (mdless)
[6]: https://github.com/ttscoff/mdless#customization
[7]: https://github.com/markdownlint/markdownlint
[8]: https://github.com/markdownlint/markdownlint/blob/master/docs/RULES.md
[9]: https://opensource.com/sites/default/files/uploads/mdl.png (Markdown lint tool)
[10]: https://buttondown.email/weeklymusings
[11]: https://github.com/JeNeSuisPasDave/MarkdownTools
[12]: https://help.libreoffice.org/6.2/en-US/text/swriter/guide/globaldoc.html
[13]: https://github.com/cfenollosa/bashblog
[14]: https://en.wikipedia.org/wiki/Web_template_system#Static_site_generators
[15]: https://opensource.com/sites/default/files/uploads/bashblog.png (bashblog)
[16]: https://opensource.com/article/18/9/intro-pandoc
[17]: https://opensource.com/article/18/10/book-to-website-epub-using-pandoc
[18]: https://opensource.com/article/18/9/pandoc-research-paper
[19]: https://opensource.com/article/19/5/convert-markdown-to-word-pandoc

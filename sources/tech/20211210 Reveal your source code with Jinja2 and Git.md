[#]: subject: "Reveal your source code with Jinja2 and Git"
[#]: via: "https://opensource.com/article/21/12/reveal-source-code-jinja2-git"
[#]: author: "Ayush Sharma https://opensource.com/users/ayushsharma"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Reveal your source code with Jinja2 and Git
======
Here's how I keep my website open by linking every page back to its
original source.
![Text editor on a browser, in blue][1]

I'm a huge fan of open source.

One of the little ways I've supported the cause is by keeping my personal blog site open from the very beginning. I do this partly to let people see the history of changes behind each page. But I also do it because, when I started using [Jekyll][2], I didn't find many open source Jekyll blogs to learn from. My hope is that keeping my website open and exposing my trials and errors will save someone else a lot of time.

### The Jekyll page.path variable

One way I achieve that is by linking every entry I post back to its original [Markdown][3]. [Jekyll's helpful variables][4] have exactly the tool that's needed: the `page.path`. This variable contains the raw filesystem path of each page. The official description even highlights its usefulness for linking back to the source!

Printing `{{ page.path }}` within an article's Markdown file outputs something similar to this:


```
`_posts/2021-10-10-example.md`
```

Assume that the article's source code existed at this path:


```
`https://example.com/ayushsharma-in/-/blob/master/_posts/2021-10-10-example.md`
```

If you prepend `https://example.com/ayushsharma-in/-/blob/master/` to any article's `page.path`, it generates a link back to its source code.

In Jekyll, generating this full link looks like this:


```
`<a href="{{ page.path | prepend: site.content.blog_source_prefix }}" target="_blank">View source</a>`
```

It's that easy.

### Jekyll and the open web

The modern web is an intricate and multilayered technology, but that doesn't mean it has to obfuscate. With Jekyll's variables, you ensure that your users can, if they wish, learn more about how you built your site.

You can see real-world examples on my [personal blog][5]: scroll to the bottom for the View Source link.

* * *

This article is adapted from [ayush sharma's notes][6] and is republished with permission.

See how Jekyll, an open source generator of static HTML files, makes running a blog as easy as...

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/reveal-source-code-jinja2-git

作者：[Ayush Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ayushsharma
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_blue_text_editor_web.png?itok=lcf-m6N7 (Text editor on a browser, in blue)
[2]: https://opensource.com/article/21/9/build-website-jekyll
[3]: https://opensource.com/article/19/9/introduction-markdown
[4]: https://jekyllrb.com/docs/variables/#page-variables
[5]: https://www.ayushsharma.in
[6]: https://www.ayushsharma.in/2021/11/linking-jekyll-pages-back-to-their-git-source-code

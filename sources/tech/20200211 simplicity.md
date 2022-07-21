[#]: subject: "simplicity"
[#]: via: "https://jao.io/blog/2020-02-11-simplicity.html"
[#]: author: "jao https://jao.io"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

simplicity
======

I like simple things. As simple as possible, but [not simpler][1]: they should live well in my little emacs universe. [Bastian Bechtold][2]'s [org-static-blog][3], a static site generator using org-mode, is the latest star in that virtual world.

You are looking at the result. It retrospect, it took me an absurdly long time to do something as natural as incorporating blogging to the platform where i spend most of my computer time, using the most flexible markup language i know. Well, better late than never, i suppose!

Revamping `jao.io` to this new incarnation took little time. Converting exisiting markdown posts to org was straghtforward with [pandoc][4], and org-static-blog needs very little boilerplate after the conversion Org's exporting capabilities are all but amazing, so it's easy to build on them: one can do it right, like Bastian, or get carried away and create a complex monster.

For the record, this is all the configuration that was required, where it is perhaps worth mentioning how i extract the list of tags from the list of HTML files pointing to them[1][5]::

```

    (use-package org-static-blog
      :ensure t
      :init
      (setq org-static-blog-use-preview t
            org-static-blog-preview-convert-titles t
            org-static-blog-preview-ellipsis "..."
            org-static-blog-enable-tags t
            org-static-blog-publish-url "https://jao.io/blog/"
            org-static-blog-publish-title "programming musings"
            org-static-blog-posts-directory "~/doc/jao.io/org/"
            org-static-blog-drafts-directory "~/doc/jao.io/org/drafts/"
            org-static-blog-publish-directory "~/doc/jao.io/blog/")

      (setq jao-org-blog-tags
            (mapcar (lambda (f)
                      (string-match "tag-\\(.+\\)\\.html" f)
                      (format "<a href=\"/blog/%s\">%s</a>"
                              f (match-string 1 f)))
                    (directory-files "~/doc/jao.io/blog" nil "tag-.*")))

      (setq org-static-blog-page-header
            (concat
             "<meta name=\"author\" content=\"jao\">"
             "<meta name=\"referrer\" content=\"no-referrer\">"
             "<link href= \"/static/style.css\" rel=\"stylesheet\"
                    type=\"text/css\" />"
             "<link rel=\"icon\" href=\"static/favicon.ico\">")

            org-static-blog-page-preamble
            (concat
             "<div class=\"header\">"
             "  <a href=\"https://jao.io\">programming musings</a>"
             "  <div class=\"sitelinks\">"
             "    <a href=\"/blog/about.html\">about</a>"
             "    | <a href=\"/blog/hacking.html\">hacking</a>"
             "    | <a href=\"/blog/archive.html\">archive</a>"
             "    | <div class=\"dropdown\">"
             "       <a href=\"/blog/tags/html\" class=\"dropbtn\">tags</a>"
             "       <div class=\"dropdown-content\">"
             (mapconcat #'identity jao-org-blog-tags "")
             "       </div>"
             "      </div>"
             "    | <a href=\"/blog/rss.xml\">rss</a>"
             "  </div>"
             "</div>")

            org-static-blog-page-postamble
            (with-temp-buffer
              (insert-file-contents "~/.emacs.d/postamble.html")
              (buffer-string))))

```

with `~/.emacs.d/blog-postamble.html` containing mostly license boilerplate[2][6]:

```

    <div id="archive"><a href="/blog/archive.html">Other posts</a></div>
    <center>
      <a rel="license" href="https://creativecommons.org/licenses/by-sa/3.0/">
      <img alt="Creative Commons License" style="border-width:0"
           src="https://i.creativecommons.org/l/by-sa/3.0/88x31.png" />
      </a>
      <br />
      <span xmlns:dct="https://purl.org/dc/terms/"
            href="https://purl.org/dc/dcmitype/Text" property="dct:title"
            rel="dct:type">jao.io</span> by
      <a xmlns:cc="https://creativecommons.org/ns#" href="https://jao.io"
         property="cc:attributionName" rel="cc:attributionURL">jao</a>
      is licensed under a
      <a rel="license" href="https://creativecommons.org/licenses/by-sa/3.0/">
        Creative Commons Attribution-ShareAlike 3.0 Unported License</a>.
    </center>

```

Then i remembered my old WordPres blogs ([programming musings][7], [minor emacs wizardry][8], and [physics musings][9]), collecting dust for more than a decade now, and wondered what would it take to rescue those posts. Turns out one of those other blogging tools, _pelican_, has an importer, [pelican-import][10], that knows about the XML one can export from WordPress. With that, i had a collection or `.rst` files that i knew how to move to org files from the comfort of my eshell:

```

    $ for f in *.rst { pandoc -f rst -t org -o $f.org $f }

```

And then i started writing a bit of elisp to add the blog headers, but didn't go too far: how many of those posts where worth converting? Well, i started skimming over them, and was pleased to discover that my little self fiteen years ago was rather clueless (so i've either learnt something these years or, at least, gained some confidence), and only a handful of them were both salvaging: no elisp needed! If you're curious, you can find them under the tags [auld][11], [emacs][12], and [physics][13], or just looking for the really old entries in the [archive][14].

### Footnotes:

[1][15]

So this list can be generated only after the set of tags is decided (in my case, by exporting the existing posts once), and has the drawback of having to re-regenerate all the HTML if one ever adds a new tag (remember that these pages are static). But org-static-blog is so much faster doing it than i writing posts that i'm not going to worry.

[2][16]

The file is actually generated by tangling a SRC block in my init.org file, and using variable interpolation one wouldn't even need to use an external file, but that's for another post.

[Tags][17]: [emacs][12]

--------------------------------------------------------------------------------

via: https://jao.io/blog/2020-02-11-simplicity.html

作者：[jao][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jao.io
[b]: https://github.com/lujun9972
[1]: file:///2006-01-19-as-simple-as-possible.html
[2]: https://bastibe.de/
[3]: https://github.com/bastibe/org-static-blog
[4]: https://github.com/jgm/pandoc
[5]: tmp.AHv9H3Zw9x#fn.1
[6]: tmp.AHv9H3Zw9x#fn.2
[7]: http://jaortega.wordpress.com
[8]: http://emacs.wordpress.com
[9]: http://phys.wordpress.com
[10]: http://docs.getpelican.com/en/3.6.3/importer.html
[11]: https://jao.io/blog/tag-auld.html
[12]: https://jao.io/blog/tag-emacs.html
[13]: https://jao.io/blog/tag-physics.html
[14]: https://jao.io/blog/archive.html
[15]: tmp.AHv9H3Zw9x#fnr.1
[16]: tmp.AHv9H3Zw9x#fnr.2
[17]: https://jao.io/blog/tags.html

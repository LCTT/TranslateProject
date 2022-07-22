[#]: subject: "consult recoll with live preview"
[#]: via: "https://jao.io/blog/2022-07-22-consult-recoll-with-live-preview.html"
[#]: author: "jao https://jao.io"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

consult recoll with live preview
======

Lately, i've gravitated towards _recoll_ as a unified search engine for all my local data, including org and text notes, documents in PDF or similar formats, HTML files, and local email. As a result, my little [consult-recoll][1] package has gone up a few notches up in my list. i've just released version 0.5, featuring live previews.

![][2]

[Recoll][3] is a local search engine that knows how to index a wide variety of file formats. It also offers a sophisticated query language, and, for some document kinds, snippets of the text in the found document actually matching the query: that's always been one of my favourite features, and wanted to bring it to emacs, now that, as mentioned, `recollq` (recoll's CLI for search) has become my search tool across the board.

i found consult's [live previews][4] a very nice venue to bring previews into emacs, via a new version of [consult-recoll][1], and there you go, just a small matter of programming[1][5].

There are several things of this package that make me happy. For one, it's very small (less than 200 lines of code, including comments) and does quite a bit, thanks to the help of consult on the emacs side and of recoll on the system's side. In my opinion, it's a very good example of how the operative environment provided by emacs brings the Unix philosophy to the next level: here, it's gluing together functionality provided by emacs packages (completing read, consult's asynchronous searches and previews, and so on), and the indexing and search capabilities of a totally unrelated, orthogonal program, recoll, which in turn delegates to a swarm of other unix programs (such as antiword, unrtf, poppler, pstotext and a long etc) to extract information from local files. Very pleasant!

### Footnotes:

[1][6]

If you're not into consult, my unpublished little library [jao-recoll][7] knows how to render recoll query results (including snippets) in an org-prettified buffer.

[Tags][8]: [emacs][9]

--------------------------------------------------------------------------------

via: https://jao.io/blog/2022-07-22-consult-recoll-with-live-preview.html

作者：[jao][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jao.io
[b]: https://github.com/lujun9972
[1]: https://codeberg.org/jao/consult-recoll
[2]: https://jao.io/img/consult-recoll-preview.png
[3]: https://www.lesbonscomptes.com/recoll/
[4]: https://github.com/minad/consult#live-previews
[5]: tmp.X826A1dgHR#fn.1
[6]: tmp.X826A1dgHR#fnr.1
[7]: https://codeberg.org/jao/elibs/src/branch/main/lib/doc/jao-recoll.el
[8]: https://jao.io/blog/tags.html
[9]: https://jao.io/blog/tag-emacs.html

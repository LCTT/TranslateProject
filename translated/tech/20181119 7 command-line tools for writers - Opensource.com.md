给写作者们的 7 个命令行工具 | Opensource.com
======
扔掉你的打字机，然后使用这些开源工具在命令行上编辑吧。
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/terminal_command_linux_desktop_code.jpg?itok=p5sQ6ODE)

对于大多数人（尤其是非技术人员），写作意味着在 LibreOffice Writer 或者其他带图形界面的文本编辑器上编辑文本。但是还有很多可行的方法可以让任何人通过文本传递他们的信息，尤其是越来越多的作者选择[拥抱纯文本][1]。

在使用图形界面写作的世界同样有命令行工具的一席之地。这些命令行工具可以帮助他们进行写作，检查他们的拼写等等——无论是在写一篇文章、博客或者故事；写一个 README 文件；或者准备一份技术文档的时候。

下面是一些在任何写作情况下都有用的命令行工具。

### 编辑器

没错，你_可以_在命令行进行真正的写作。我知道一些写作者会使用 [Nano][2]、[Vim][3]、[Emacs][4]、以及 [Jove][5] 等编辑器在终端窗口中进行工作。而这些编辑器并不是[aren't the only games in town][6]。文本编辑器的优势在于它们简单易用和专注。它们非常适合于编辑任何文本的初稿甚至完成一个漫长而复杂的写作项目。

如果你想在命令行中获得更像文字编辑器的体验，不妨了解一下[WordGrinder][7]。WordGrinder 是一款简单但拥有足够的编写和发布功能的文字编辑器。它支持基本的格式和样式，并且你可以将你的文字以 Markdown, ODT, LaTeX, 以及 HTML等格式导出。

### 拼写检查

每个写作者在完成他们的工作前至少要（或者说应该要）进行一次拼写检查。为什么呢？在写作的世界里有个永恒的定律，无论你检查了多少次手稿，拼写错误和错字依然会存在。

我曾经详细[介绍][9]过我最喜欢的命令行拼写检查工具 [GNU Aspell][8]。交互式检测文本文档的 Aspell 不仅能够高亮显示拼写错误还能在拼写错误的上方提供正确的拼写建议。Aspell 在进行拼写检查同样能够忽略许多标记语言文本。

另一个够老但仍然有用的代替品是 [Ispell][10]。虽然它比 Aspell 稍慢一点，但它们都以相同的方式工作。当你在你的文本文件上工作时，Ispell 将提供正确的建议。Ispell 同样也对英语以外的语言提供了良好的支持。

### Prose linters

软件开发人员使用[linters][11]来检查他们的代码是否存在错误或者 bugs。同样也有用于检查文本样式或语法错误的linters；而命令行会认为这些错误是_样式元素_。任何写作者都可以（也应该）使用它，一个文本 linter 对于要求文档风格和样式一致的文档团队项目而言尤其有用。

[Proselint][12] is a comprehensive tool for checking what you're writing. It looks for jargon, hyperbole, incorrect date and time format, misused terms, and [much more][13]. It's also easy to run and ignores markup in a plaintext file.

[Alex][14] is a simple yet powerful prose linter. Run it against a plaintext document or one formatted with Markdown or HTML. Alex pumps out warnings of "gender favouring, polarising, race related, religion inconsiderate, or other unequal phrasing in text." If you want to give Alex a test drive, there's an [online demo][15].

### 其他工具

Sometimes you just can't find the right synonym for a word. But you don't need to grab a "dead tree" thesaurus or go to a dedicated website to perfect your word choice. Just run [Aiksaurus][16] against the word you want to replace, and it does the work for you. This utility's main drawback, though, is that it supports English only.

Even writers with few (if any) technical skills are embracing [Markdown][17] to quickly and easily format their work. Sometimes, though, you need to convert files formatted with Markdown to something else. That's where [Pandoc][18] comes in. You can use it to convert your documents to HTML, Word, LibreOffice Writer, LaTeX, EPUB, and other formats. You can even use Pandoc to produce books and [research papers][19].

Do you have a favorite command-line tool for writing? Share it with the Opensource.com community by leaving a comment.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/11/command-line-tools-writers

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[LazyWolfLin](https://github.com/LazyWolfLin)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[b]: https://github.com/lujun9972
[1]: https://plaintextproject.online
[2]: https://www.nano-editor.org/
[3]: https://www.vim.org
[4]: https://www.gnu.org/software/emacs/
[5]: https://opensource.com/article/17/1/jove-lightweight-alternative-vim
[6]: https://en.wikipedia.org/wiki/List_of_text_editors#Text_user_interface
[7]: https://cowlark.com/wordgrinder/
[8]: http://aspell.net/
[9]: https://opensource.com/article/18/2/how-check-spelling-linux-command-line-aspell
[10]: https://www.cs.hmc.edu/~geoff/ispell.html
[11]: https://en.wikipedia.org/wiki/Lint_(software)
[12]: http://proselint.com/
[13]: http://proselint.com/checks/
[14]: https://github.com/get-alex/alex
[15]: https://alexjs.com/#demo
[16]: http://aiksaurus.sourceforge.net/
[17]: https://en.wikipedia.org/wiki/Markdown
[18]: https://pandoc.org
[19]: https://opensource.com/article/18/9/pandoc-research-paper

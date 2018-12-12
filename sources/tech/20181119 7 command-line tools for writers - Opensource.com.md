Translating by LazyWolfLin

7 command-line tools for writers | Opensource.com
======
Put away your word processor and start writing from the command line using these open source tools.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/terminal_command_linux_desktop_code.jpg?itok=p5sQ6ODE)

For most people (especially non-techies), the act of writing means tapping out words using LibreOffice Writer or another GUI word processing application. But there are many other options available to help anyone communicate their message in writing, especially for the growing number of writers [embracing plaintext][1].

There's also room in a GUI writer's world for command line tools that can help them write, check their writing, and more—regardless of whether they're banging out an article, blog post, or story; writing a README; or prepping technical documentation.

Here's a look at some command-line tools that any writer will find useful.

### Editors

Yes, you _can_ do actual writing at the command line. I know writers who do their work using editors like [Nano][2], [Vim][3], [Emacs][4], and [Jove][5] in a terminal window. And those editors [aren't the only games in town][6]. Text editors are great because they (at a basic level, anyway) are easy to use and distraction free. They're perfect for tapping out a first draft of anything or even completing a long and complicated writing project.

If you want a more word processor-like experience at the command line, take a look at [WordGrinder][7] . WordGrinder is a bare-bones word processor, but it has more than enough features for writing and publishing your work. It supports basic formatting and styles, and you can export your writing to formats like Markdown, ODT, LaTeX, and HTML.

### Spell checkers

Every writer does (or at least should do) a spelling check on their work at least once. Why? An immutable law of the writing universe states that, no matter how many times you look over your manuscript, a spelling mistake or typo will creep in.

My favorite command-line spelling checker is [GNU Aspell][8], which I previously [looked at][9] in detail. Aspell checks plaintext documents interactively and not only highlights errors but often puts the best correction at the top of its list of suggestions. Aspell also ignores many markup languages while doing its thing.

A much older but still useful alternative is [Ispell][10]. It's a bit slower than Aspell, but both utilities work the same way. As you interact with your text file, Ispell suggests corrections. Ispell also has good support for foreign languages.

### Prose linters

Software developers use [linters][11] to check their code for errors or bugs. There are also linters for prose that check for style and syntax errors; think of them as the _Elements of Style_ for the command line. While any writer can (and probably should) use one, a prose linter is especially useful for team documentation projects that require a consistent voice and style.

[Proselint][12] is a comprehensive tool for checking what you're writing. It looks for jargon, hyperbole, incorrect date and time format, misused terms, and [much more][13]. It's also easy to run and ignores markup in a plaintext file.

[Alex][14] is a simple yet powerful prose linter. Run it against a plaintext document or one formatted with Markdown or HTML. Alex pumps out warnings of "gender favouring, polarising, race related, religion inconsiderate, or other unequal phrasing in text." If you want to give Alex a test drive, there's an [online demo][15].

### Other tools

Sometimes you just can't find the right synonym for a word. But you don't need to grab a "dead tree" thesaurus or go to a dedicated website to perfect your word choice. Just run [Aiksaurus][16] against the word you want to replace, and it does the work for you. This utility's main drawback, though, is that it supports English only.

Even writers with few (if any) technical skills are embracing [Markdown][17] to quickly and easily format their work. Sometimes, though, you need to convert files formatted with Markdown to something else. That's where [Pandoc][18] comes in. You can use it to convert your documents to HTML, Word, LibreOffice Writer, LaTeX, EPUB, and other formats. You can even use Pandoc to produce books and [research papers][19].

Do you have a favorite command-line tool for writing? Share it with the Opensource.com community by leaving a comment.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/11/command-line-tools-writers

作者：[Scott Nesbitt][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
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

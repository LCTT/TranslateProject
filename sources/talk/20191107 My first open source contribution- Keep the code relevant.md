[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (My first open source contribution: Keep the code relevant)
[#]: via: (https://opensource.com/article/19/11/first-open-source-contribution-relevant-code)
[#]: author: (Galen Corey https://opensource.com/users/galenemco)

My first open source contribution: Keep the code relevant
======
Be aware of what development tools you have running in the background.
![Filing cabinet for organization][1]

Previously, I explained [the importance of forking repositories][2]. Once I finished the actual "writing the code" part of making my first open source pull request, I felt excellent. It seemed like the hard part was finally over. What’s more, I felt great about the code that I wrote.

One thing that I decided to do (which turned out to be an excellent choice) was to use [test-driven development][3] (TDD) to write the code. Using TDD was helpful because it gave me a place to start, and a way to know if what I was doing actually worked. Because my background was in building web apps, I rarely ran into the problem of writing code that didn’t have a tangible, visible output. The test-first approach helped me make the leap into working on a tool where you can’t evaluate your progress manually. The fact that I had written a clear test also helped me ultimately get my pull request accepted. The reviewer highlighted the test in his comments on my code.

Another thing I felt great about was that I had accomplished the whole thing in around 20 lines of code. I know from experience that shorter pull requests are much easier to review. Such short pieces generally take less time, and the reviewer can concentrate on only the small number of lines that were changed. I hoped that this would increase my chances that one of the maintainers would look at my work and feel confident in it.

Much to my surprise, when I finally pushed my branch to GitHub, the diff was showing that I had changed multiple lines of code. I ran into trouble here because I had become too comfortable with my usual development setup. Because I typically work on a single project, I barely think about some of the tools I have working in the background to make my life easier. The culprit here was [`prettier`][4], a code formatter that automatically fixes all of my minor spacing and syntax discrepancies when I save an edited file. In my usual workflow, this tool is extremely helpful. Most of the developers I work with have `prettier` installed, so all of the code that we write obeys the same style rules.

In this new project, however, style rules had fallen by the wayside. The project did, in fact, contain an eslint config stating that single quotes should be used instead of double-quotes. However, the developers who were contributing to the project ignored this rule and used both single- and double-quotes. Unlike human beings, `prettier` never ignores the rules. While I was working, it took the initiative to turn every double quote in every file I changed to a single quote, causing hundreds of unintentional changes.

I tried for a few minutes to remove these changes, but because they had been continually happening as I worked, they were embedded in all of my commits. Then the type-B in me took over and decided to leave the changes in. "Maybe this is not a big deal," I thought. "They said they wanted single quotes, after all."

My mistake was including these unrelated changes in my PR. While I was technically right that this wasn’t a "big deal," the maintainer who reviewed my code asked me to revert the changes. My initial instinct, that keeping my pull request small and to the point, was correct.

The lesson here is that you should keep your changes as minimal and to-the-point as possible. Be mindful of any tools you have that might apply to your normal workflow, but aren’t as useful if you are working on a new project.

**Free idea:** If you are looking for a way to get an open source PR in without writing any code, pick a project that doesn’t adhere to its style guide, run `prettier` on it, and make the result your whole pull request. It’s not guaranteed that every project community will appreciate this, but it’s worth a shot.

There are lots of non-code ways to contribute to open source: Here are three alternatives.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/first-open-source-contribution-relevant-code

作者：[Galen Corey][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/galenemco
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/files_documents_organize_letter.png?itok=GTtiiabr (Filing cabinet for organization)
[2]: https://opensource.com/article/19/10/first-open-source-contribution-fork-clone
[3]: https://opensource.com/article/19/10/test-driven-development-best-practices
[4]: https://prettier.io/

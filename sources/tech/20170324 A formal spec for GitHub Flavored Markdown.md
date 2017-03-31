GHLandy Translating

[A formal spec for GitHub Flavored Markdown][8]
============================================================

We are glad we chose Markdown as the markup language for user content at GitHub. It provides a powerful yet straightforward way for users (both technical and non-technical) to write plain text documents that can be rendered richly as HTML.

Its main limitation, however, is the lack of standarization on the most ambiguous details of the language. Things like how many spaces are needed to indent a line, how many empty lines you need to break between different elements, and a plethora of other trivial corner cases change between implementations: very similar looking Markdown documents can be rendered as wildly different outputs depending on your Markdown parser of choice.

Five years ago, we started building GitHub’s custom version of Markdown, GFM (GitHub Flavored Markdown) on top of [Sundown][13], a parser which we specifically developed to solve some of the shortcomings of the existing Markdown parsers at the time.

Today we’re hoping to improve on this situation by releasing a formal specification of the syntax for GitHub Flavored Markdown, and its corresponding reference implementation.

This formal specification is based on [CommonMark][14], an ambitious project to formally specify the Markdown syntax used by many websites on the internet in a way that reflects its real world usage. CommonMark allows people to continue using Markdown the same way they always have, while offering developers a comprehensive specification and reference implementations to interoperate and display Markdown in a consistent way between platforms.

#### The Specification

Taking the CommonMark spec and re-engineering our current user content stack around it is not a trivial endeavour. The main issue we struggled with is that the spec (and hence its reference implementations) focuses strictly on the common subset of Markdown that is supported by the original Perl implementation. This does not include some of the extended features that have been always available on GitHub. Most notably, support for  _tables, strikethrough, autolinks and task lists_  are missing.

In order to fully specify the version of Markdown we use at GitHub (known as GFM), we had to formally define the syntax and semantics of these features, something which we had never done before. We did this on top of the existing CommonMark spec, taking special care to ensure that our extensions are a strict and optional superset of the original specification.

When reviewing [the GFM spec][15], you can clearly tell which parts are GFM-specific additions because they’re highlighted as such. You can also tell that no parts of the original spec have been modified and therefore should remain fully compliant with all other implementations.

#### The Implementation

To ensure that the rendered Markdown in our website is fully compliant with the CommonMark spec, the new backend implementation for GFM parsing on GitHub is based on `cmark`, the reference implementation for CommonMark developed by [John MacFarlane][16] and many other [fantastic contributors][17].

Just like the spec itself, `cmark` focuses on parsing a strict subset of Markdown, so we had to also implement support for parsing GitHub’s custom extensions on top of the existing parser. You can find these changes on our [fork of `cmark`][18]; in order to track the always-improving upstream project, we continuously rebase our patches on top of the upstream master. Our hope is that once a formal specification for these extensions is settled, this patchset can be used as a base to upstream the changes in the original project.

Besides implementing the GFM-specific features in our fork of `cmark`, we’ve also contributed many changes of general interest to the upstream. The vast majority of these contributions are focused around performance and security. Our backend renders a massive volume of Markdown documents every day, so our main concern lies in ensuring we’re doing these operations as efficiently as possible, and making sure that it’s not possible to abuse malicious Markdown documents to attack our servers.

The first Markdown parsers in C had a terrible security history: it was feasible to cause stack overflows (and sometimes even arbitrary code execution) simply by nesting particular Markdown elements sufficiently deep. The `cmark` implementation, just like our earlier parser Sundown, has been designed from scratch to be resistant to these attacks. The parsing algorithms and its AST-based output are thought out to gracefully handle deep recursion and other malicious document formatting.

The performance side of `cmark` is a tad more rough: we’ve contributed many optimizations upstream based on performance tricks we learnt while implementing Sundown, but despite all these changes, the current version of `cmark` is still not faster than Sundown itself: Our benchmarks show it to be between 20% to 30% slower on most documents.

The old optimization adage that  _“the fastest code is the code that doesn’t run”_  applies here: the fact is that `cmark` just does  _more things_  than Sundown ever did. Amongst other functionality, `cmark` is UTF8 aware, has better support for references, cleaner interfaces for extension, and most importantly: it doesn’t  _translate_  Markdown into HTML, like Sundown did. It actually generates an AST (Abstract Syntax Tree) out of the source Markdown, which we can transform and eventually render into HTML.

If you consider the amount of HTML parsing that we had to do with Sundown’s original implementation (particularly regarding finding user mentions and issue references in the documents, inserting task lists, etc), `cmark`’s AST-based approach saves us a tremendous amount of time  _and_  complexity in our user content stack. The Markdown AST is an incredibly powerful tool, and well worth the performance cost that `cmark` pays to generate it.

### The Migration

Changing our user content stack to be CommonMark compliant is not as simple as switching the library we use to parse Markdown: the fundamental roadblock we encountered here is that the corner cases that CommonMark specifies (and that the original Markdown documentation left ambiguous) could cause some old Markdown content to render in unexpected ways.

Through synthetic analysis of GitHub’s massive Markdown corpus, we determined that less than 1% of the existing user content would be affected by the new implementation: we gathered these stats by rendering a large set of Markdown documents with both the old (Sundown) and the new (`cmark`, CommonMark compliant) libraries, normalizing the resulting HTML, and diffing their trees.

1% of documents with minor rendering issues seems like a reasonable tradeoff to swap in a new implementation and reap its benefits, but at GitHub’s scale, 1% is a lot of content, and a lot of affected users. We really don’t want anybody to check back on an old issue and see that a table that was previously rendering as HTML now shows as ASCII – that is bad user experience, even though obviously none of the original content was lost.

Because of this, we came up with ways to soften the transition. The first thing we did was gathering separate statistics on the two different kinds of Markdown user content we host on the website: comments by the users (such as in Gists, issues, Pull Requests, etc), and Markdown documents inside the Git repositories.

There is a fundamental difference between these two kinds of content: the user comments are stored in our databases, which means their Markdown syntax can be normalized (e.g. by adding or removing whitespace, fixing the indentation, or inserting missing Markdown specifiers until they render properly). The Markdown documents stored in Git repositories, however, cannot be touched  _at all_ , as their contents are hashed as part of Git’s storage model.

Fortunately, we discovered that the vast majority of user content that was using complex Markdown features were user comments (particularly Issue bodies and Pull Request bodies), while the documents stored in Git repositories were rendering properly with both the old and the new renderer in the overwhelming majority of cases.

With this in mind, we proceeded to normalize the syntax of the existing user comments, as to make them render identically in both the old and the new implementations.

Our approach to translation was rather pragmatic: Our old Markdown parser, Sundown, has always acted as a translator more than a parser. Markdown content is fed in, and a set of semantic callbacks convert the original Markdown document into the corresponding markup for the target language (in our use case, this was always HTML5). Based on this design approach, we decided to use the semantic callbacks to make Sundown translate from Markdown to CommonMark-compliant Markdown, instead of HTML.

More than translation, this was effectively a normalization pass, which we had high confidence in because it was performed by the same parser we’ve been using for the past 5 years, and hence all the existing documents should be parsed cleanly while keeping their original semantic meaning.

Once we updated Sundown to normalize input documents and sufficiently tested it, we were ready to start the transition process. The first step of the process was flipping the switch on the new `cmark` implementation for all new user content, as to ensure that we had a finite cut-off point to finish the transition at. We actually enabled CommonMark for all **new** user comments in the website several months ago, with barely anybody noticing – this is a testament to the CommonMark team’s fantastic job at formally specifying the Markdown language in a way that is representative of its real world usage.

In the background, we started a MySQL transition to update in-place the contents of all Markdown user content. After running each comment through the normalization process, and before writing it back to the database, we’d render it with the new implementation and compare the tree to the previous implementation, as to ensure that the resulting HTML output was visually identical and that user data was never destroyed in any circumstances. All in all, less than 1% of the input documents were modified by the normalization process, matching our expectations and again proving that the CommonMark spec really represents the real-world usage of the language.

The whole process took several days, and the end result was that all the Markdown user content on the website was updated to conform to the new Markdown standard while ensuring that the final rendered output was visually identical to our users.

#### The Conclusion

Starting today, we’ve also enabled CommonMark rendering for all the Markdown content stored in Git repositories. As explained earlier, no normalization has been performed on the existing documents, as we expect the overwhelming majority of them to render just fine.

We are really excited to have all the Markdown content in GitHub conform to a live and pragmatic standard, and to be able to provide our users with a [clear and authoritative reference][19] on how GFM is parsed and rendered.

We also remain committed to following the CommonMark specification as it irons out any last bugs before a final point release. We hope GitHub.com will be fully conformant to the 1.0 spec as soon as it is released.

To wrap up, here are some useful links for those willing to learn more about CommonMark or implement it on their own applications:

*   [The CommonMark website][1], with information on the project.
*   [The CommonMark discussion forum][2], where questions and changes to the specification can be proposed.
*   [The CommonMark specification][3]
*   [The reference C Implementation][4]
*   [Our fork with support for all GFM extensions][5]
*   [The GFM specification][6], based on the original spec.
*   [A list of CommonMark implementations in many programming languages][7]

--------------------------------------------------------------------------------

via: https://githubengineering.com/a-formal-spec-for-github-markdown/?imm_mid=0ef032&cmp=em-prog-na-na-newsltr_20170318

作者：[Yuki Izumi][a][Vicent Martí][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://github.com/kivikakk
[b]:https://github.com/vmg
[1]:http://commonmark.org/
[2]:http://talk.commonmark.org/
[3]:http://spec.commonmark.org/
[4]:https://github.com/jgm/cmark/
[5]:https://github.com/github/cmark/
[6]:https://github.github.com/gfm/
[7]:https://github.com/jgm/CommonMark/wiki/List-of-CommonMark-Implementations
[8]:https://githubengineering.com/a-formal-spec-for-github-markdown/
[9]:https://github.com/vmg
[10]:https://github.com/vmg
[11]:https://github.com/kivikakk
[12]:https://github.com/kivikakk
[13]:https://github.com/vmg/sundown
[14]:http://commonmark.org/
[15]:https://github.github.com/gfm/
[16]:https://github.com/jgm
[17]:https://github.com/jgm/cmark/#authors
[18]:https://github.com/github/cmark
[19]:https://github.github.com/gfm/

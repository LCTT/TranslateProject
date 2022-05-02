[#]: subject: "Improvements to Fedora Docs"
[#]: via: "https://fedoramagazine.org/improvements-to-fedora-docs/"
[#]: author: "Ben CottonPeter BoyFrancois Andrieu https://fedoramagazine.org/author/bcotton/https://fedoramagazine.org/author/pboy/https://fedoramagazine.org/author/darknao/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Improvements to Fedora Docs
======

![][1]

Photo by [Matt Moloney][2] on [Unsplash][3]

The [Docs team][4] is experiencing a new burst of energy. As part of this, we have several big improvements to the [Fedora Docs site][5] that we want to share.

## [][6]Searchable docs

For years, readers have asked for search. We have a lot of documentation on the site, but you sometimes struggle to find what you’re looking for. With the new search feature, you can search the entire Fedora Documentation content.

[Lunr.js][7] powers the search. This means your browser downloads the index and does the search locally. The advantage is that there are no external dependencies: searches send nothing to a remote server and there is no external Javascript required. The downside is that the index has to be downloaded before search is available. Although we compress the index, if you’re on a slower connection, you may experience delays.

While the search is a major improvement, it’s not perfect. The search tool is not aware of the context of your search and can’t offer “do you mean _ ?” suggestions. Also, because many pages have similar titles, you can’t always tell which page has the information you’re looking for. We’re looking into adding more context to the page titles and working with teams to make titles more useful.

## [][8] Stable “latest” URL

Many times when you link to a page on Fedora Docs, you don’t care about the version number. For example, if you’re writing a blog post that links to the Installation Guide, you’d rather it go to the Installation Guide for the latest version. If you don’t actively update your links to Fedora Docs, they grow stale over time.

We recently added a stable _/latest_ URL for release docs. For example, <https://docs.fedoraproject.org/en-US/fedora/latest/> points to the Fedora Linux 35 documentation. When we release Fedora Linux 36, soon, that URL will point to F36 documentation. You can use this stable URL when you want to target the latest released version and only use specific versions in the URL when the version matters.

## [][9] Redesigning the site

Over the next few months, we’re working on a two-pronged approach to documentation. First, we want the user documentation to better reflect the changes in the Fedora distribution over the last few years. In the meantime, there are great differences in terms of installation and administration, which makes uniform guides difficult to write. In fact, most Editions now have their own installation guide. As a first step, we will split the current installation guide into a guide describing where to find the installation guide for the appropriate Edition. It will also include a generic description of Anaconda that Editions can link to or include text parts. We expect to be able to connect the customization during the Fedora Linux 37 development cycle. As a next step, we will revise the Administration Guide and Quick Docs.

In addition, the Docs team will be selecting an Outreachy intern to work on a redesign of the site. This will include both the graphical design of the user interface as well as improving the information architecture of the site. We want to make it easier for you to find exactly what you’re looking for.

## [][10]Help wanted

Just like the rest of Fedora, the Docs team is a community effort. We welcome new contributors. You can join us in the [#docs tag on Fedora Discussion][11] or in [#docs on Fedora Chat][12].

If you see an issue on any Fedora Docs page, you can click the bug icon on the top of the page to report an issue. Or click the edit icon to submit a correction!

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/improvements-to-fedora-docs/

作者：[Ben CottonPeter BoyFrancois Andrieu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/bcotton/https://fedoramagazine.org/author/pboy/https://fedoramagazine.org/author/darknao/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/04/fedora_docs_improvement-816x345.jpg
[2]: https://unsplash.com/@mattmoloney?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/updated-documentation?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://docs.fedoraproject.org/en-US/fedora-docs/
[5]: https://docs.fedoraproject.org/
[6]: https://hackmd.io/5nwIMadmTUuTZDifFRRsfA?both#Searchable-docs
[7]: https://lunrjs.com/
[8]: https://hackmd.io/5nwIMadmTUuTZDifFRRsfA?both#Stable-%E2%80%9Clatest%E2%80%9D-URL
[9]: https://hackmd.io/5nwIMadmTUuTZDifFRRsfA?both#Redesigning-the-site
[10]: https://hackmd.io/5nwIMadmTUuTZDifFRRsfA?both#Help-wanted
[11]: https://discussion.fedoraproject.org/tag/docs
[12]: https://matrix.to/#/#docs:fedoraproject.org?web-instance%5Belement.io%5D=chat.fedoraproject.org

Publish Your Project Documentation with GitHub Pages
=====

You might be familiar with [how GitHub Pages helps you share your work with the world][3] or maybe you have [attended a class][4] that helped you build your first GitHub Pages site. Recent improvements to GitHub Pages have made it easier to [publish your site from a variety of sources][5]. One of these sources is your repository's /docs folder.

Quality documentation is a hallmark of any healthy software project. For open-source projects, however, maintaining a robust compendium of knowledge detailing all the ins and outs is paramount. Well-curated documentation increases your project's approachability, provides asynchronous guidance, and fosters the type of uncoordinated collaboration that propels open-source software development.

Hosting your documentation on the web can present time-consuming challenges that make publishing and maintaining it an unrewarding experience — one that it's often easy to avoid. Grappling with multiple disparate publishing tools like FTP servers and databases means files often exist in various states and multiple locations, all of which require manual synchronization. To be clear, conventional web publishing provides unparalleled flexibility and power; but it comes at the expense of simplicity and, in many cases, utility.

When it comes to documentation, a path with less resistance is often the better approach.

[GitHub Pages][2] gives you a direct path to create websites for your projects, which makes it a natural choice for publishing and maintaining documentation. Because GitHub Pages supports Jekyll, you can pen your documentation in plain text or Markdown to help maintain a lower barrier to contribution. Jekyll also includes support for many helpful tools like variables, templates, and automatic code highlighting, which gives you much of the flexibility you'd find in a bulkier platform without the added complexity.

Most importantly, using GitHub Pages means your documentation lives alongside your code on GitHub, where you can use things like Issues and Pull Requests to ensure it receives the high level of care it deserves; and because GitHub Pages lets you publish from the /docs directory on the master branch, you can maintain your codebase and its published documentation on the same branch.

### Get started today

Publishing your first documentation page only takes a few minutes.

1. Create a /docs/index.md file on your repository's master branch.

2. Add your content and any necessary Jekyll front matter, then commit your changes.

![](https://cloud.githubusercontent.com/assets/3477155/17778793/47c5a586-6533-11e6-982c-ebd41ec6968c.gif)

1. Visit your repository's settings tab and select master branch /docs folder as the GitHub Pages source. Click save, and you're done.

![](https://cloud.githubusercontent.com/assets/3477155/17778792/47c2ecc4-6533-11e6-828a-91980daa7297.gif)

GitHub Pages will read the contents of your /docs directory, convert the index.md into HTML, and publish the results at your GitHub Pages URL.

This will generate the most basic HTML output that you can further customize with templates, CSS, and other features available in Jekyll. To see examples of what all is possible, take a look at the [GitHub Pages Showcase][1].

--------------------------------------------------------------------------------

via: https://github.com/blog/2233-publish-your-project-documentation-with-github-pages

作者：[ loranallensmith ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://github.com/loranallensmith
[1]: https://github.com/showcases/github-pages-examples
[2]: https://pages.github.com/
[3]: https://www.youtube.com/watch?v=2MsN8gpT6jY
[4]: https://www.youtube.com/watch?v=RaKX4A5EiQo
[5]: https://help.github.com/articles/configuring-a-publishing-source-for-github-pages/

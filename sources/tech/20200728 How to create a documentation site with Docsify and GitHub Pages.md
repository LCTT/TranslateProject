[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to create a documentation site with Docsify and GitHub Pages)
[#]: via: (https://opensource.com/article/20/7/docsify-github-pages)
[#]: author: (Bryant Son https://opensource.com/users/brson)

How to create a documentation site with Docsify and GitHub Pages
======
Use Docsify to create documentation web pages to publish on GitHub
Pages.
![Digital creative of a browser on the internet][1]

Documentation is an essential part of making any open source project useful to users. But it's not always developers' top priority, as they may be more focused on making their application better than on helping people use it. This is why making it easier to publish documentation is so valuable to developers. In this tutorial, I'll show you one option for doing so: combining the [Docsify][2] documentation generator with [GitHub Pages][3]. 

If you prefer to learn by video, you can access the YouTube version of this how-to:

By default, GitHub Pages prompts users to use [Jekyll][4], a static site generator that supports HTML, CSS, and other web technologies. Jekyll generates a static website from documentation files encoded in Markdown format, which GitHub automatically recognizes due to their .md or .markdown extension. While this setup is nice, I wanted to try something else.

Fortunately, GitHub Pages' HTML file support means you can use other site-generation tools, including Docsify, to create a website on the platform. Docsify is an MIT-Licensed open source project with [features][5] that make it easy to create an attractive advanced documentation site on GitHub Pages.

![Docsify][6]

(Bryant Son, [CC BY-SA 4.0][7])

### Get started with Docsify

There are two ways to install Docsify:

  1. Docsify's command-line interface (CLI) through NPM
  2. Manually by writing your own `index.html`



Docsify recommends the NPM approach, but I will use the second option. If you want to use NPM, follow the instructions in the [quick-start guide][8].

### Download the sample content from GitHub

I've published this example's source code on the [project's GitHub page][9]. You can download the files individually or [clone the repo][10] with:


```
`git clone https://github.com/bryantson/OpensourceDotComDemos`
```

Then `cd` into the DocsifyDemo directory.

I will walk you through the cloned code from my sample repo below, so you can understand how to modify Docsify. If you prefer, you can start from scratch by creating a new `index.html` file, like in the [example][11] in Docsify's docs:


```
&lt;!-- index.html --&gt;

&lt;!DOCTYPE html&gt;
&lt;[html][12]&gt;
&lt;[head][13]&gt;
  &lt;[meta][14] http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"&gt;
  &lt;[meta][14] name="viewport" content="width=device-width,initial-scale=1"&gt;
  &lt;[meta][14] charset="UTF-8"&gt;
  &lt;[link][15] rel="stylesheet" href="//cdn.jsdelivr.net/npm/docsify/themes/vue.css"&gt;
&lt;/[head][13]&gt;
&lt;[body][16]&gt;
  &lt;[div][17] id="app"&gt;&lt;/[div][17]&gt;
  &lt;[script][18]&gt;
    window.$docsify = {
      //...
    }
  &lt;/[script][18]&gt;
  &lt;[script][18] src="//cdn.jsdelivr.net/npm/docsify/lib/docsify.min.js"&gt;&lt;/[script][18]&gt;
&lt;/[body][16]&gt;
&lt;/[html][12]&gt;
```

### Explore how Docsify works

If you cloned my [GitHub repo][10] and changed into the DocsifyDemo directory, you should see a file structure like this:

![File contents in the cloned GitHub][19]

(Bryant Son, [CC BY-SA 4.0][7])

File/Folder Name | What It Is
---|---
index.html | The main Docsify initiation file (and the most important file)
_sidebar.md | Renders the navigation
README.md | The default Markdown file at the root of your documentation
images | Contains a sample .jpg image from the README.md
Other directories and files | Contain navigatable Markdown files

`Index.html` is the only thing required for Docsify to work. Open the file, so you can explore the contents:


```
&lt;!-- index.html --&gt;

&lt;!DOCTYPE html&gt;
&lt;[html][12]&gt;
&lt;[head][13]&gt;
  &lt;[meta][14] http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"&gt;
  &lt;[meta][14] name="viewport" content="width=device-width,initial-scale=1"&gt;
  &lt;[meta][14] charset="UTF-8"&gt;
  &lt;[link][15] rel="stylesheet" href="//cdn.jsdelivr.net/npm/docsify/themes/vue.css"&gt;
  &lt;[title][20]&gt;Docsify Demo&lt;/[title][20]&gt;
&lt;/[head][13]&gt;
&lt;[body][16]&gt;
  &lt;[div][17] id="app"&gt;&lt;/[div][17]&gt;
  &lt;[script][18]&gt;
    window.$docsify = {
      el: "#app",
      repo: '<https://github.com/bryantson/OpensourceDotComDemos/tree/master/DocsifyDemo>',
      loadSidebar: true,
    }
  &lt;/[script][18]&gt;
  &lt;[script][18] src="//cdn.jsdelivr.net/npm/docsify/lib/docsify.min.js"&gt;&lt;/[script][18]&gt;
&lt;/[body][16]&gt;
&lt;/[html][12]&gt;
```

This is essentially just a plain HTML file, but take a look at these two lines:


```
&lt;[link][15] rel="stylesheet" href="//cdn.jsdelivr.net/npm/docsify/themes/vue.css"&gt;
... SOME OTHER STUFFS ...
&lt;[script][18] src="//cdn.jsdelivr.net/npm/docsify/lib/docsify.min.js"&gt;&lt;/[script][18]&gt;
```

These lines use content delivery network (CDN) URLs to serve the CSS and JavaScript scripts to transform the site into a Docsify site. As long as you include these lines, you can turn your regular GitHub page into a Docsify page.

The first line after the `body` tag specifies what to render:


```
`<div id="app"></div>`
```

Docsify is using the [single page application][21] (SPA) approach to render a requested page instead of refreshing an entirely new page.

Last, look at the lines inside the `script` block:


```
&lt;[script][18]&gt;
    window.$docsify = {
      el: "#app",
      repo: '<https://github.com/bryantson/OpensourceDotComDemos/tree/master/DocsifyDemo>',
      loadSidebar: true,
    }
&lt;/[script][18]&gt;
```

In this block:

  * The `el` property basically says, "Hey, this is the `id` I am looking for, so locate the `id` and render it there."

  * Changing the `repo` value identifies which page users will be redirected to when they click the GitHub icon in the top-right corner.

![GitHub icon][22]

(Bryant Son, [CC BY-SA 4.0][7])

  * Setting `loadSideBar` to `true` will make Docsify look for the `_sidebar.md` file that contains your navigation links.




You can find all the options in the [Configuration][23] section of Docsify's docs.

Next, look at the `_sidebar.md` file. Because you set the `loadSidebar` property value to `true` in `index.html`, Docsify will look for the `_sidebar.md` file and generate the navigation file from its contents. The `_sidebar.md` contents in the sample repo are:


```
&lt;!-- docs/_sidebar.md --&gt;

* [HOME](./)

* [Tutorials](./tutorials/index)
  * [Tomcat](./tutorials/tomcat/index)
  * [Cloud](./tutorials/cloud/index)
  * [Java](./tutorials/java/index)

* [About](./about/index)

* [Contact](./contact/index)
```

This uses Markdown's link format to create the navigation. Note that the Tomcat, Cloud, and Java links are indented; this causes them to be rendered as sublinks under the parent link.

Files like `README.md` and `images` pertain to the repository's structure, but all the other Markdown files are related to your Docsify webpage.

Modify the files you downloaded however you want, based on your needs. In the next step, you will add these files to your GitHub repo, enable GitHub Pages, and finish the project.

### Enable GitHub Pages

Create a sample GitHub repo, then use the following GitHub commands to check, commit, and push your code:


```
$ git clone LOCATION_TO_YOUR_GITHUB_REPO
$ cd LOCATION_TO_YOUR_GITHUB_REPO
$ git add .
$ git commit -m "My first Docsify!"
$ git push
```

Set up your GitHub Pages page. From inside your new GitHub repo, click **Settings**:

![Settings link in GitHub][24]

(Bryant Son, [CC BY-SA 4.0][7])

Scroll down until you see **GitHub Pages**:

![GitHub Pages settings][25]

(Bryant Son, [CC BY-SA 4.0][7])

Look for the **Source** section:

![GitHub Pages settings][26]

(Bryant Son, [CC BY-SA 4.0][7])

Click the drop-down menu under **Source**. Usually, you will set this to the **master branch**, but you can use another branch, if you'd like:

![Setting Source to master branch][27]

(Bryant Son, [CC BY-SA 4.0][7])

That's it! You should now have a link to your GitHub Pages page. Clicking the link will take you there, and it should render with Docsify:

![Link to GitHub Pages docs site][28]

(Bryant Son, [CC BY-SA 4.0][7])

And it should look something like this:

![Example Docsify site on GitHub Pages][29]

(Bryant Son, [CC BY-SA 4.0][7])

### Conclusion

By editing a single HTML file and some Markdown text, you can create an awesome-looking documentation site with Docsify. What do you think? Please leave a comment and also share any other open source tools that can be used with GitHub Pages.

See how Jekyll, an open source generator of static HTML files, makes running a blog as easy as...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/docsify-github-pages

作者：[Bryant Son][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/brson
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_web_internet_website.png?itok=g5B_Bw62 (Digital creative of a browser on the internet)
[2]: https://docsify.js.org
[3]: https://pages.github.com/
[4]: https://docs.github.com/en/github/working-with-github-pages/about-github-pages-and-jekyll
[5]: https://docsify.js.org/#/?id=features
[6]: https://opensource.com/sites/default/files/uploads/docsify1_ui.jpg (Docsify)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://docsify.js.org/#/quickstart?id=quick-start
[9]: https://github.com/bryantson/OpensourceDotComDemos/tree/master/DocsifyDemo
[10]: https://github.com/bryantson/OpensourceDotComDemos
[11]: https://docsify.js.org/#/quickstart?id=manual-initialization
[12]: http://december.com/html/4/element/html.html
[13]: http://december.com/html/4/element/head.html
[14]: http://december.com/html/4/element/meta.html
[15]: http://december.com/html/4/element/link.html
[16]: http://december.com/html/4/element/body.html
[17]: http://december.com/html/4/element/div.html
[18]: http://december.com/html/4/element/script.html
[19]: https://opensource.com/sites/default/files/uploads/docsify3_files.jpg (File contents in the cloned GitHub)
[20]: http://december.com/html/4/element/title.html
[21]: https://en.wikipedia.org/wiki/Single-page_application
[22]: https://opensource.com/sites/default/files/uploads/docsify4_github-icon_rev_0.jpg (GitHub icon)
[23]: https://docsify.js.org/#/configuration?id=configuration
[24]: https://opensource.com/sites/default/files/uploads/docsify5_githubsettings_0.jpg (Settings link in GitHub)
[25]: https://opensource.com/sites/default/files/uploads/docsify6_githubpageconfig_rev.jpg (GitHub Pages settings)
[26]: https://opensource.com/sites/default/files/uploads/docsify6_githubpageconfig_rev2.jpg (GitHub Pages settings)
[27]: https://opensource.com/sites/default/files/uploads/docsify8_setsource_rev.jpg (Setting Source to master branch)
[28]: https://opensource.com/sites/default/files/uploads/docsify9_link_rev.jpg (Link to GitHub Pages docs site)
[29]: https://opensource.com/sites/default/files/uploads/docsify2_examplesite.jpg (Example Docsify site on GitHub Pages)

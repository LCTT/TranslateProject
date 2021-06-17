[#]: subject: (Build a static website with Eleventy)
[#]: via: (https://opensource.com/article/21/6/static-site-builder)
[#]: author: (Nwokocha Wisdom https://opensource.com/users/wise4rmgod)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Build a static website with Eleventy
======
Eleventy is a JavaScript-based alternative to Jekyll and Hugo for
building static websites.
![Digital images of a computer desktop][1]

A static site generator is a tool that generates a full, static HTML website based on raw data and a set of templates. It automates the task of coding individual HTML pages and gets those pages ready to serve to users. Because the HTML pages are prebuilt, they load very quickly in users' browsers.

Static sites work particularly well for documentation, too, because static sites are easy to scale, and they're an easy way to generate, maintain, and deploy your project's documentation. For these reasons, organizations often use them to document application programming interfaces (APIs), database schemas, and other information. Documentation is an important part of software development, design, and other aspects of tech. All codebases require some form of documentation, with options ranging from a simple README to full documentation.

### Eleventy: A static site generator

[Eleventy][2] (11ty) is a simple static site generator and an alternative to [Jekyll][3] and [Hugo][4]. It's written in JavaScript and transforms a directory of templates (of varying types) into HTML. It's also open source, released under the MIT License.

Eleventy works with HTML, Markdown, Liquid, Nunjucks, Handlebars, Mustache, EJS, Haml, Pug, and JavaScript Template Literals.

Its features include:

  * Easy setup
  * Supports multiple template languages (e.g., Nunjucks, HTML, JavaScript, Markdown, Liquid)
  * Customizable
  * Based on JavaScript, which is familiar to many web developers and easy for new users to learn



### Install Eleventy

Eleventy requires Node.js. On Linux, you can install Node.js using your package manager:


```
`$ sudo dnf install nodejs`
```

If your package manager doesn't have Node.js available, or if you're not on Linux, you can [install it][5] from the Node.js website.

Once Node.js is installed, use it to install Eleventy:


```
`$ npm install -g @11ty/eleventy`
```

That's it!

### Build a static site for your documentation

Now you can start using Eleventy to build your static documentation site. Here are the steps to follow.

#### 1\. Create a package.json file

To install Eleventy into your project, you need a package.json file:


```
`$ npm init -y`
```

#### 2\. Install Eleventy into package.json

Install and save Eleventy into your project's `package.json` by running:


```
`$ npm install-save-dev @11ty/eleventy`
```

#### 3\. Run Eleventy

Use the `npx` command to run your local project's version of Eleventy. After you verify installation went as expected, try to run Eleventy:


```
`$ npx @11ty/eleventy`
```

#### 4\. Create some templates

Now run two commands to create two new template files (an HTML and a Markdown file):


```
$ cat &lt;&lt; EOF &gt;&gt; index.html
&lt;!doctype html&gt;&lt;html&gt;
&lt;head&gt;
&lt;title&gt;Page title&lt;/title&gt;
&lt;/head&gt;&lt;body&gt;
&lt;p&gt;Hello world&lt;/p&gt;
&lt;/body&gt;&lt;/html&gt;
EOF
$ echo '# Page header' &gt; index.md
```

This compiles any content templates in the current directory or subdirectories into the output folder (which defaults to `_site`).

Run `eleventy --serve` to start a development web server.


```
`$ npx @11ty/eleventy-serve`
```

Open `http://localhost:8080/README/` in the web browser of your choice to see your Eleventy output.

Then upload the files in `_site` to your web server to publish your site for the world to see.

### Try Eleventy

Eleventy is a static site generator that's easy to use, template, and theme. If you're already using Node.js in your development workflow, Eleventy may be a more natural fit than Jekyll or Hugo. It provides great results quickly and saves you from complex site design and maintenance. To learn more about using Eleventy, read through its [documentation][6].

* * *

_This is based on [Building a technical documentation static site for open source projects][7], which first appeared on Nwokocha Wisdom Maduabuchi's Medium site, and is republished with permission._

See how Jekyll, an open source generator of static HTML files, makes running a blog as easy as...

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/static-site-builder

作者：[Nwokocha Wisdom][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/wise4rmgod
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_desk_home_laptop_browser.png?itok=Y3UVpY0l (Digital images of a computer desktop)
[2]: https://www.11ty.dev/
[3]: https://opensource.com/article/17/4/getting-started-jekyll
[4]: https://opensource.com/article/18/3/start-blog-30-minutes-hugo
[5]: https://nodejs.org/en/
[6]: https://www.11ty.dev/docs/getting-started/
[7]: https://wise4rmgodadmob.medium.com/building-a-technical-documentation-static-site-for-open-source-projects-7af4e73d77f0

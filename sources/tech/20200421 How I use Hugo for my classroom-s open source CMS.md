[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How I use Hugo for my classroom's open source CMS)
[#]: via: (https://opensource.com/article/20/4/hugo-classroom)
[#]: author: (Peter Cheer https://opensource.com/users/petercheer)

How I use Hugo for my classroom's open source CMS
======
This open source software streamlines text editing while leaving room
for customization.
![Digital hand surrounding by objects, bike, light bulb, graphs][1]

People love Markdown text with good reason—it is easy to write, easy to read, easy to edit, and it can be converted to a wide range of other text mark up formats. While Markdown text is very good for content creation and manipulation, it imposes limitations on the options for content display.

If we could combine the virtues of Markdown with the power and flexibility of Cascading Style Sheets, HTML5, and JavaScript, that would be something special. One of the programs trying to do this is [Hugo][2]. Hugo was created in 2013 by Steve Francia; it is cross-platform and open source under an Apache 2.0 license with an active developer community and a growing user base.

The basic concept is that pieces of content, such as web pages or blog posts, written in Markdown and associated with metadata, are converted into HTML and combined with templates and themes to produce a complete web site. The power and flexibility come through these themes and templates or changing the default behaviors of Hugo. This power comes with a degree of unavoidable complexity, but there are lots of [pre-built templates][3] available if you lack the time or inclination to make your own.

Installing Hugo on my Linux machine was quick and easy. Starting a new project is as simple as typing **hugo new site quickstart** at the command line which creates a new project with this folder structure:

  * **archetypes**: Content template files that contain preconfigured front matter metadata (date, title, draft). You can create new archetypes with custom front matter fields.
  * **assets**: Stores all the files, which are processed by Hugo Pipes (e.g., CSS/Sass files). This directory is not created by default.
  * **config.toml**: The default site config file.
  * **content**: Where all the content Markdown files live.
  * **data**: Used to store configuration files that can be used by Hugo when generating your website.
  * **layouts**: Stores templates as .html files.
  * **static**: Stores all the static content—images, CSS, JavaScript, etc.
  * **themes**: For the Hugo theme of your choice.



The Markdown files in the content folder can be created manually or by Hugo and edited with any text editor or your Markdown creation tool of choice. If created manually, you will need to add any metadata that is needed. I prefer to use [Ghostwriter][4] for writing Markdown. Images are usually kept in a sub-folder in the static folder. Site development can proceed quickly, as Hugo includes a web server for testing and pre-viewing.

To check your work, type **hugo server** at the command line to start the server. By default, Hugo will not publish:

  * Content with a future **publishdate** value.
  * Content with **draft: true** status.
  * Content with a past **expirydate** value.



Adding **hugo server -D** will include draft articles, and Hugo can be configured to mark all new articles as draft. After starting the web server, you can see your work in a web browser at localhost:1313. Once the server is started by default, it will automatically reload the browser window when it detects a change to one of your files.

There are tasks Markdown cannot do that need some HTML code. Hugo recognizes this but believes in keeping Markdown code as clean, simple, and uncluttered as possible. Hugo does this with shortcodes such as **{{&lt; youtube id= "w7Ft2ymGmfc" autoplay= "true"&gt;}}**, which will embed the YouTube video with id. w7Ft2ymGmfc. There are quite a few pre-built shortcodes for common tasks, but it is also possible to create your own for particular jobs.

I work in education quite a lot and wanted to include some interactive puzzles and questions on my Hugo-generated website. To get the output looking like this:

![JClic shortcode][5]

I created the activities with an open source Java program called [JClic][6], exported them as HTML5, put that into static/activities/excel, and displayed it in an iframe.

The HTML code, which would spoil the nice clean Markdown content, looks like this:


```
    &lt;[iframe][7]
       src="/activity/excel/index.html"
       title="Activity"
       height="400"
       frameborder="0"
       marginwidth="0"
       marginheight="0"
       scrolling="no"
       style="border: 1px solid #CCC; border-width: 1px; margin-bottom: 20px; width: 100%;"
       allowfullscreen="true"&gt;
    &lt;/[iframe][7]&gt;
```

The code is saved in layouts/shortcodes as **activity.html**

This makes the shortcode placed inside my Markdown file **{{&lt;activity&gt;}}**, which is much neater.

When your project is ready, you can build it with the **hugo** command; this will create a public folder and generate the website in it. Hugo has a number of built-in deployment options for different hosting providers—basically, you deploy your site by copying the public folder to your production web server. There is a lot more to Hugo that I haven't even gotten to yet, including configuration options, importing content from other static site generators and Wordpress, display data from JSON files, syntax highlighting of source code, and the fact that it is very fast (an advantage when working with large sites).

In many software tools, ease-of-use comes at the expense of flexibility, or vice-versa; Hugo makes a largely successful attempt at including both. For basic use with Markdown content and a pre-built theme, Hugo is easy to use and produces rapid results. Alternatively, if you have the need to alter the configuration settings or dive in and create your own themes, shortcodes, templates, or metadata schemes, that choice is open to you.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/hugo-classroom

作者：[Peter Cheer][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/petercheer
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003588_01_rd3os.combacktoschoolseriesk12_rh_021x_0.png?itok=fvorN0e- (Digital hand surrounding by objects, bike, light bulb, graphs)
[2]: https://gohugo.io/
[3]: https://themes.gohugo.io/
[4]: http://github.com/wereturtle/ghostwriter
[5]: https://opensource.com/sites/default/files/uploads/jclic_shortcode.png (JClic shortcode)
[6]: https://clic.xtec.cat/legacy/en/index.html
[7]: http://december.com/html/4/element/iframe.html

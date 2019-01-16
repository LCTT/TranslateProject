[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting started with Pelican: A Python-based static site generator)
[#]: via: (https://opensource.com/article/19/1/getting-started-pelican)
[#]: author: (Craig Sebenik https://opensource.com/users/craig5)

Getting started with Pelican: A Python-based static site generator
======
Pelican is a great choice for Python users who want to self-host a simple website or blog. 

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/web-design-monitor-website.png?itok=yUK7_qR0)

If you want to create a custom website or blog, you have a lot of options. Many providers will host your website and do much of the work for you. (WordPress is an extremely popular option.) But you lose some flexibility by using a hosted solution. As a software developer, I prefer to manage my own server and keep more freedom in how my website operates.

However, it is a fair amount of work to manage a web server. Installing it and getting a simple application up to serve content is easy enough. But keeping on top of security patches and updates is very time-consuming. If you just want to serve static web pages, having a web server and a host of applications may be more effort than it's worth. Creating HTML pages by hand is also not a good option.

This is where a static site generator can come in. These applications use templates to create all the static pages you want and cross-link them with associated metadata. (e.g., showing all the pages with a common tag or keyword.) Static site generators help you create a site with a common look and feel using elements like navigation areas and a header and footer.

I have been using [Python][1] for years now. So, when I first started looking for something to generate static HTML pages, I wanted something written in Python. The main reason is that I often want to peek into the internals of how an application works, and using a language that I already know makes that easier. (If that isn't important to you or you don't use Python, there are some other great [static site generators][2] that use Ruby, JavaScript, and other languages.)

I decided to give [Pelican][3] a try. It is a commonly used static site generator written in Python. It directly supports [reStructuredText][4] and can support [Markdown][5] when the required package is installed. All the tasks are performed via command-line interface (CLI) tools, which makes it simple for anyone familiar with the command line. And its simple quickstart CLI tool makes creating a website extremely easy.

In this article, I'll explain how to install Pelican 4, add an article, and change the default theme. (Note: This was all developed on MacOS; it should work the same using any flavor of Unix/Linux, but I don't have a Windows host to test on.)

### Installation and configuration

The first step is to create a [virtualenv][6] and install Pelican.

```
$ mkdir test-site
$ cd test-site
$ python3 -m venv venv
$ ./venv/bin/pip install --upgrade pip
...
Successfully installed pip-18.1
$ ./venv/bin/pip install pelican
Collecting pelican
...
Successfully installed MarkupSafe-1.1.0 blinker-1.4 docutils-0.14 feedgenerator-1.9 jinja2-2.10 pelican-4.0.1 pygments-2.3.1 python-dateutil-2.7.5 pytz-2018.7 six-1.12.0 unidecode-1.0.23
```

To keep things simple, I entered values for the title and author and replied N to URL prefix and article pagination. (For the rest of the questions, I used the default given.)

Pelican's quickstart CLI tool will create the basic layout and a few files to get you started. Run the **pelican-quickstart** command. To keep things simple, I entered values for the **title** and **author** and replied **N** to URL prefix and article pagination. It is very easy to change these settings in the configuration file later.

```
$ ./venv/bin/pelicanquickstart
Welcome to pelicanquickstart v4.0.1.

This script will help you create a new Pelican-based website.

Please answer the following questions so this script can generate the files needed by Pelican.

> Where do you want to create your new web site? [.]
> What will be the title of this web site? My Test Blog
> Who will be the author of this web site? Craig
> What will be the default language of this web site? [en]
> Do you want to specify a URL prefix? e.g., https://example.com (Y/n) n
> Do you want to enable article pagination? (Y/n) n
> What is your time zone? [Europe/Paris]
> Do you want to generate a tasks.py/Makefile to automate generation and publishing? (Y/n)
> Do you want to upload your website using FTP? (y/N)
> Do you want to upload your website using SSH? (y/N)
> Do you want to upload your website using Dropbox? (y/N)
> Do you want to upload your website using S3? (y/N)
> Do you want to upload your website using Rackspace Cloud Files? (y/N)
> Do you want to upload your website using GitHub Pages? (y/N)
Done. Your new project is available at /Users/craig/tmp/pelican/test-site
```

All the files you need to get started are ready to go.

The quickstart defaults to the Europe/Paris time zone, so change that before proceeding. Open the **pelicanconf.py** file in your favorite text editor. Look for the **TIMEZONE** variable.

```
TIMEZONE = 'Europe/Paris'
```

Change it to **UTC**.

```
TIMEZONE = 'UTC'
```

To update the social settings, look for the **SOCIAL** variable in **pelicanconf.py**.

```
SOCIAL = (('You can add links in your config file', '#'),
          ('Another social link', '#'),)
```

I'll add a link to my Twitter account.

```
SOCIAL = (('Twitter (#craigs55)', 'https://twitter.com/craigs55'),)
```

Notice that trailing comma—it's important. That comma helps Python recognize the variable is actually a set. Make sure you don't delete that comma.

Now you have the basics of a site. The quickstart created a Makefile with a number of targets. Giving the **devserver** target to **make** will start a development server on your machine so you can preview everything. The CLI commands used in the Makefile are assumed to be part of your **PATH** , so you need to **activate** the **virtualenv** first.

```
$ source ./venv/bin/activate
$ make devserver
pelican -lr /Users/craig/tmp/pelican/test-site/content o
/Users/craig/tmp/pelican/test-site/output -s /Users/craig/tmp/pelican/test-site/pelicanconf.py

-> Modified: theme, settings. regenerating...
WARNING: No valid files found in content for the active readers:
   | BaseReader (static)
   | HTMLReader (htm, html)
   | RstReader (rst)
Done: Processed 0 articles, 0 drafts, 0 pages, 0 hidden pages and 0 draft pages in 0.18 seconds.
```

Point your favorite browser to <http://localhost:8000> to see your simple test blog.

![](https://opensource.com/sites/default/files/uploads/pelican_test-site1.png)

You can see the Twitter link on the right side and some links to Pelican, Python, and Jinja to the left of it. (Jinja is a great templating language that Pelican can use. You can learn more about it in [Jinja's documentation][7].)

### Adding content

Now that you have a basic site, add some content. First, add a file called **welcome.rst** to the site's **content** directory. In your favorite text editor, create a file with the following text:

```
$ pwd
/Users/craig/tmp/pelican/test-site
$ cat content/welcome.rst

Welcome to my blog!
###################

:date: 20181216 08:30
:tags: welcome
:category: Intro
:slug: welcome
:author: Craig
:summary: Welcome document

Welcome to my blog.
This is a short page just to show how to put up a static page.
```

The metadata lines—date, tags, etc.—are automatically parsed by Pelican.

After you write the file, the **devserver** should output something like this:

```
-> Modified: content. regenerating...
Done: Processed 1 article, 0 drafts, 0 pages, 0 hidden pages and 0 draft pages in 0.10 seconds.
```

Reload your test site in your browser to view the changes.

![](https://opensource.com/sites/default/files/uploads/pelican_test-site2.png)

The metadata (e.g., date and tags) were automatically added to the page. Also, Pelican automatically detected the **intro** category and added the section to the top navigation.

### Change the theme

One of the nicest parts of working with popular, open source software like Pelican is that many users will make changes and contribute them back to the project. Many of the contributions are in the form of themes.

A site's theme sets colors, layout options, etc. It's really easy to try out new themes. You can preview many of them at [Pelican Themes][8].

First, clone the GitHub repo:

```
$ cd ..
$ git clone --recursive https://github.com/getpelican/pelicanthemes
Cloning into 'pelicanthemes'...
```

Since I like the color blue, I'll try [blueidea][9].

Edit **pelicanconf.py** and add the following line:

```
THEME = '/Users/craig/tmp/pelican/pelican-themes/blueidea/'
```

The **devserver** will regenerate your output. Reload the webpage in your browser to see the new theme.

![](https://opensource.com/sites/default/files/uploads/pelican_test-site3.png)

The theme controls many aspects of the layout. For example, in the default theme, you can see the category (Intro) with the meta tags next to the article. But that category is not displayed in the blueidea theme.

### Other considerations

This was a pretty quick introduction to Pelican. There are a couple of important topics that I did not cover.

First, one reason I was hesitant to move to a static site was that it wouldn't allow discussions on the articles. Fortunately, there are some third-party providers that will host discussions for you. The one I am currently looking at is [Disqus][10].

Next, everything above was done on my local machine. If I want others to view my site, I'll have to upload the pre-generated HTML files somewhere. If you look at the **pelican-quickstart** output, you will see options for using FTP, SSH, S3, and even GitHub Pages. Each option has its pros and cons. But, if I had to choose one, I would likely publish to GitHub Pages.

Pelican has many other features—I am still learning more about it every day. If you want to self-host a website or a blog with simple, static content and you want to use Python, Pelican is a great choice. It has an active user community that is fixing bugs, adding features, and creating new and interesting themes. Give it a try!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/getting-started-pelican

作者：[Craig Sebenik][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/craig5
[b]: https://github.com/lujun9972
[1]: https://opensource.com/resources/python
[2]: https://opensource.com/sitewide-search?search_api_views_fulltext=static%20site%20generator
[3]: http://docs.getpelican.com/en/stable/
[4]: http://docutils.sourceforge.net/rst.html
[5]: https://daringfireball.net/projects/markdown/
[6]: https://virtualenv.pypa.io/en/latest/
[7]: http://jinja.pocoo.org/docs/2.10/
[8]: http://www.pelicanthemes.com/
[9]: https://github.com/nasskach/pelican-blueidea/tree/58fb13112a2707baa7d65075517c40439ab95c0a
[10]: https://disqus.com/

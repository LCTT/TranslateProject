[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Run your blog on GitHub Pages with Python)
[#]: via: (https://opensource.com/article/19/5/run-your-blog-github-pages-python)
[#]: author: (Erik O'Shaughnessy https://opensource.com/users/jnyjny/users/jasperzanjani/users/jasperzanjani/users/jasperzanjani/users/jnyjny/users/jasperzanjani)

Run your blog on GitHub Pages with Python
======
Create a blog with Pelican, a Python-based blogging platform that works
well with GitHub.
![Raspberry Pi and Python][1]

[GitHub][2] is a hugely popular web service for source code control that uses [Git][3] to synchronize local files with copies kept on GitHub's servers so you can easily share and back up your work.

In addition to providing a user interface for code repositories, GitHub also enables users to [publish web pages][4] directly from a repository. The website generation package GitHub recommends is [Jekyll][5], written in Ruby. Since I'm a bigger fan of [Python][6], I prefer [Pelican][7], a Python-based blogging platform that works well with GitHub.

Pelican and Jekyll both transform content written in [Markdown][8] or [reStructuredText][9] into HTML to generate static websites, and both generators support themes that allow unlimited customization.

In this article, I'll describe how to install Pelican, set up your GitHub repository, run a quickstart helper, write some Markdown files, and publish your first page. I'll assume that you have a [GitHub account][10], are comfortable with [basic Git commands][11], and want to publish a blog using Pelican.

### Install Pelican and create the repo

First things first, Pelican (and **ghp-import** ) must be installed on your local machine. This is super easy with [pip][12], the Python package installation tool (you have pip right?):


```
`$ pip install pelican ghp-import`
```

Next, open a browser and create a new repository on GitHub for your sweet new blog. Name it as follows (substituting your GitHub username for <username> here and throughout this tutorial):


```
`https://GitHub.com/username/username.github.io`
```

Leave it empty; we will fill it with compelling blog content in a moment.

Using a command line (you command line right?), clone your empty Git repository to your local machine:


```
$ git clone <https://GitHub.com/username/username.github.io> blog
$ cd blog
```

### That one weird trick…

Here's a not-super-obvious trick about publishing web content on GitHub. For user pages (pages hosted in repos named _username.github.io_ ), the content is served from the **master** branch.

I strongly prefer not to keep all the Pelican configuration files and raw Markdown files in **master** , rather just the web content. So I keep the Pelican configuration and the raw content in a separate branch I like to call **content**. (You can call it whatever you want, but the following instructions will call it **content**.) I like this structure since I can throw away all the files in **master** and re-populate it with the **content** branch.


```
$ git checkout -b content
Switched to a new branch 'content'
```

### Configure Pelican

Now it's time for content configuration. Pelican provides a great initialization tool called **pelican-quickstart** that will ask you a series of questions about your blog.


```
$ pelican-quickstart
Welcome to pelican-quickstart v3.7.1.

This script will help you create a new Pelican-based website.

Please answer the following questions so this script can generate the files
needed by Pelican.

> Where do you want to create your new web site? [.]
> What will be the title of this web site? Super blog
> Who will be the author of this web site? username
> What will be the default language of this web site? [en]
> Do you want to specify a URL prefix? e.g., <http://example.com> (Y/n) n
> Do you want to enable article pagination? (Y/n)
> How many articles per page do you want? [10]
> What is your time zone? [Europe/Paris] US/Central
> Do you want to generate a Fabfile/Makefile to automate generation and publishing? (Y/n) y
> Do you want an auto-reload & simpleHTTP script to assist with theme and site development? (Y/n) y
> Do you want to upload your website using FTP? (y/N) n
> Do you want to upload your website using SSH? (y/N) n
> Do you want to upload your website using Dropbox? (y/N) n
> Do you want to upload your website using S3? (y/N) n
> Do you want to upload your website using Rackspace Cloud Files? (y/N) n
> Do you want to upload your website using GitHub Pages? (y/N) y
> Is this your personal page (username.github.io)? (y/N) y
Done. Your new project is available at /Users/username/blog
```

You can take the defaults on every question except:

  * Website title, which should be unique and special
  * Website author, which can be a personal username or your full name
  * Time zone, which may not be in Paris
  * Upload to GitHub Pages, which is a "y" in our case



After answering all the questions, Pelican leaves the following in the current directory:


```
$ ls
Makefile content/ develop_server.sh*
fabfile.py output/ pelicanconf.py
publishconf.py
```

You can check out the [Pelican docs][13] to find out how to use those files, but we're all about getting things done _right now_. No, I haven't read the docs yet either.

### Forge on

Add all the Pelican-generated files to the **content** branch of the local Git repo, commit the changes, and push the local changes to the remote repo hosted on GitHub by entering:


```
$ git add .
$ git commit -m 'initial pelican commit to content'
$ git push origin content
```

This isn't super exciting, but it will be handy if we need to revert edits to one of these files.

### Finally getting somewhere

OK, now you can get bloggy! All of your blog posts, photos, images, PDFs, etc., will live in the **content** directory, which is initially empty. To begin creating a first post and an About page with a photo, enter:


```
$ cd content
$ mkdir pages images
$ cp /Users/username/SecretStash/HotPhotoOfMe.jpg images
$ touch first-post.md
$ touch pages/about.md
```

Next, open the empty file **first-post.md** in your favorite text editor and add the following:


```
title: First Post on My Sweet New Blog
date: <today's date>
author: Your Name Here

# I am On My Way To Internet Fame and Fortune!

This is my first post on my new blog. While not super informative it
should convey my sense of excitement and eagerness to engage with you,
the reader!
```

The first three lines contain metadata that Pelican uses to organize things. There are lots of different metadata you can put there; again, the docs are your best bet for learning more about the options.

Now, open the empty file **pages/about.md** and add this text:


```
title: About
date: <today's date>

![So Schmexy][my_sweet_photo]

Hi, I am <username> and I wrote this epic collection of Interweb
wisdom. In days of yore, much of this would have been deemed sorcery
and I would probably have been burned at the stake.

😆

[my_sweet_photo]: {filename}/images/HotPhotoOfMe.jpg
```

You now have three new pieces of web content in your content directory. Of the content branch. That's a lot of content.

### Publish

Don't worry; the payoff is coming!

All that's left to do is:

  * Run Pelican to generate the static HTML files in **output** : [code]`$ pelican content -o output -s publishconf.py`
```
* Use **ghp-import** to add the contents of the **output** directory to the **master** branch: [code]`$ ghp-import -m "Generate Pelican site" --no-jekyll -b master output`
```
  * Push the local master branch to the remote repo: [code]`$ git push origin master`
```
  * Commit and push the new content to the **content** branch: [code] $ git add content
$ git commit -m 'added a first post, a photo and an about page'
$ git push origin content
```



### OMG, I did it!

Now the exciting part is here, when you get to view what you've published for everyone to see! Open your browser and enter:


```
`https://username.github.io`
```

Congratulations on your new blog, self-published on GitHub! You can follow this pattern whenever you want to add more pages or articles. Happy blogging.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/run-your-blog-github-pages-python

作者：[Erik O'Shaughnessy][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jnyjny/users/jasperzanjani/users/jasperzanjani/users/jasperzanjani/users/jnyjny/users/jasperzanjani
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/getting_started_with_python.png?itok=MFEKm3gl (Raspberry Pi and Python)
[2]: https://github.com/
[3]: https://git-scm.com
[4]: https://help.github.com/en/categories/github-pages-basics
[5]: https://jekyllrb.com
[6]: https://python.org
[7]: https://blog.getpelican.com
[8]: https://guides.github.com/features/mastering-markdown
[9]: http://docutils.sourceforge.net/docs/user/rst/quickref.html
[10]: https://github.com/join?source=header-home
[11]: https://git-scm.com/docs
[12]: https://pip.pypa.io/en/stable/
[13]: https://docs.getpelican.com

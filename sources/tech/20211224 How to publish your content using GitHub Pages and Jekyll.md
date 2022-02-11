[#]: subject: "How to publish your content using GitHub Pages and Jekyll"
[#]: via: "https://fedoramagazine.org/how-to-publish-your-content-using-github-pages-and-jekyll/"
[#]: author: "Servesha Dudhgaonkar https://fedoramagazine.org/author/serveshad/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to publish your content using GitHub Pages and Jekyll
======

![github-pages-and-jekyll][1]

[GitHub][2], [MIT][3], via Wikimedia Commons; [Tom Preston-Werner][4], [CC BY 4.0][5], via Wikimedia Commons; Photo by [Ilya Pavlov][6] on [Unsplash][7]

In this article, we are going to see how to use GitHub Pages and Jekyll to create a static web site or blog on Fedora. Whether you are a developer, administrator, or technical writer you can use GitHub pages and Jekyll to create your blog or site.

### Understanding GitHub Pages and Jekyll

You can create public web pages using GitHub, These are called GitHub Pages. Jekyll is a ruby gem, that is used to create a static site. GitHub Pages team up well with Jekyll. You can use Jekyll to publish your static site or a blog. 

### Prerequisites

Before installing Jekyll, perform the following commands:

  1. Install ruby and dependencies:



```

    $ sudo dnf install ruby ruby-devel openssl-devel redhat-rpm-config @development-tools
    $ sudo dnf install gcc-c++
    $ sudo Gem install commonmarker -v ‘0.17.13’ --source ‘https://rubygems.org/’

```

2\. Install bundler:

```

    $ sudo gem install bundler

```

3\. Initialize the bundle:

```

    $ bundle init

```

4\. Add parameter _gem ‘unf_ext’_ in Gemfile at the bottom of the file.

### Setting up Git

Follow instructions [here][8] to install and set up git.

### Creating your repository for your site

You must have your repository before creating your own site. Perform the following instructions to create your repository:

  1. Login to GitHub.
  2. Navigate and click ‘**+**‘.
  3. Select the account from the drop-down menu.
  4. Give a name to your repository. It must be in _username.github.io_ format.
  5. Select **Public** or **Private** option.
  6. Click checkbox **Add a README file**.
  7. Click **Create repository**.



### Creating your own site

Perform the following instructions to create your site:

  1. Create a folder to store your source files generated for your site.



```

    $ mkdir my-jekyll-site

```

2\. Change the directory to the newly created directory:

```

    $ cd my-jekyll-site

```

3\. Initialize the Git repository you created:

```

    $ git init <username>.github.io

```

4\. Add your repository as a remote:

```

    $ git remote add origin https://github.com/username/repository.git

```

5\. Change the directory to your repository name:

```

    $ cd your-repo-name

```

6\. Create publishing source and change the directory to the publishing source:

```

    $ mkdir publishing-source
    $ cd publishing-source

```

7\. Create Jekyll site:

```

    $ jekyll new --skip-bundle .

```

8\. Open _Gemfile_ that Jekyll created.

9\. Comment out the line starting with _gem “jekyll”_ by adding # at the start of the line.

10\. Edit the line starting with # gem "github-pages" as follows.

```

    $ gem "github-pages", "~> GITHUB-PAGES-VERSION", group: :jekyll_plugins

```

GITHUB-PAGES-VERSION is the latest version of the github-pages gem.

11\. Save the changes and close the Gemfile.

12\. Run the following command:

```

    $ bundle install

```

13\. Open and edit __config.yml_ with the following parameters:

```

    domain: my-site.github.io       # if you want to force HTTPS, specify the domain without the http at the start, e.g. example.com
    url: https://my-site.github.io  # the base hostname and protocol for your site, e.g. http://example.com
    baseurl: /REPOSITORY-NAME/      # place folder name if the site is served in a subfolder

```

14\. Example __config.yml_ file:

```

    title: Getting Started with Owncloud
    email: sdudhgao@redhat.com
    description: >- # this means to ignore newlines until "baseurl:"
      Owncloud is an open-source file sync, share and content collaboration software that lets teams work on data easily from anywhere, on any device. It provides access to your data through a web interface while providing a platform to view, sync and share across devices easily.


    baseurl: "" # the subpath of your site, e.g. /blog
    url: "https://xenolinux.github.io/" # the base hostname & protocol for your site, e.g. http://example.com
    twitter_username: jekyllrb
    github_username: jekyll

    # Build settings
    theme: minima
    plugins:
      - jekyll-feed
      - jekyll-titles-from-headings
    titles_from_headings:
      enabled:     true
      strip_title: true
      collections: true

```

15\. Add your file and commit the changes you made.

```

    $ git add .
    $ git commit -m "commit changes"

```

16\. Push the changes.

```

    $ git push -u origin <branch>

```

Replace your branch name with &lt;branch&gt;

### Setting a publishing source for your site

  1. Navigate to your site’s repository and click **Settings** –&gt; **Pages**.
  2. Navigate to **GitHub** **Pages** and select **None** or **Branch** from the drop-down menu list.
  3. Click **Save**.



Your site is published!

Here is the site and repository example:

Jekyll Site: <https://xenolinux.github.io/Quickstart.html>
Repository: <https://github.com/xenolinux/xenolinux.github.io>

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-publish-your-content-using-github-pages-and-jekyll/

作者：[Servesha Dudhgaonkar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/serveshad/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/12/How-to-publish-your-content-using-GitHub-Pages-and-Jekyll-816x345.jpg
[2]: https://commons.wikimedia.org/wiki/File:Octicons-mark-github.svg
[3]: http://opensource.org/licenses/mit-license.php
[4]: https://commons.wikimedia.org/wiki/File:Jekyll_(software)_Logo.png
[5]: https://creativecommons.org/licenses/by/4.0
[6]: https://unsplash.com/@ilyapavlov?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[7]: https://unsplash.com/s/photos/site?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[8]: https://docs.github.com/en/get-started/quickstart/set-up-git

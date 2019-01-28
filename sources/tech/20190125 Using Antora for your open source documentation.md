[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using Antora for your open source documentation)
[#]: via: (https://fedoramagazine.org/using-antora-for-your-open-source-documentation/)
[#]: author: (Adam Šamalík https://fedoramagazine.org/author/asamalik/)

Using Antora for your open source documentation
======
![](https://fedoramagazine.org/wp-content/uploads/2019/01/antora-816x345.jpg)

Are you looking for an easy way to write and publish technical documentation? Let me introduce [Antora][1] — an open source documentation site generator. Simple enough for a tiny project, but also complex enough to cover large documentation sites such as [Fedora Docs][2].

With sources stored in git, written in a simple yet powerful markup language AsciiDoc, and a static HTML as an output, Antora makes writing, collaborating on, and publishing your documentation a no-brainer.

### The basic concepts

Before we build a simple site, let’s have a look at some of the core concepts Antora uses to make the world a happier place. Or, at least, to build a documentation website.

#### Organizing the content

All sources that are used to build your documentation site are stored in a **git repository**. Or multiple ones — potentially owned by different people. For example, at the time of writing, the Fedora Docs had its sources stored in 24 different repositories owned by different groups having their own rules around contributions.

The content in Antora is organized into **components** , usually representing different areas of your project, or, well, different components of the software you’re documenting — such as the backend, the UI, etc. Components can be independently versioned, and each component gets a separate space on the docs site with its own menu.

Components can be optionally broken down into so-called **modules**. Modules are mostly invisible on the site, but they allow you to organize your sources into logical groups, and even store each in different git repository if that’s something you need to do. We use this in Fedora Docs to separate [the Release Notes, the Installation Guide, and the System Administrator Guide][3] into three different source repositories with their own rules, while preserving a single view in the UI.

What’s great about this approach is that, to some extent, the way your sources are physically structured is not reflected on the site.

#### Virtual catalog

When assembling the site, Antora builds a **virtual catalog** of all pages, assigning a [unique ID][4] to each one based on its name and the component, the version, and module it belongs to. The page ID is then used to generate URLs for each page, and for internal links as well. So, to some extent, the source repository structure doesn’t really matter as far as the site is concerned.

As an example, if we’d for some reason decided to merge all the 24 repositories of Fedora Docs into one, nothing on the site would change. Well, except the “Edit this page” link on every page that would suddenly point to this one repository.

#### Independent UI

We’ve covered the content, but how it’s going to look like?

Documentation sites generated with Antora use a so-called [UI bundle][5] that defines the look and feel of your site. The UI bundle holds all graphical assets such as CSS, images, etc. to make your site look beautiful.

It is expected that the UI will be developed independently of the documentation content, and that’s exactly what Antora supports.

#### Putting it all together

Having sources distributed in multiple repositories might raise a question: How do you build the site? The answer is: [Antora Playbook][6].

Antora Playbook is a file that points to all the source repositories and the UI bundle. It also defines additional metadata such as the name of your site.

The Playbook is the only file you need to have locally available in order to build the site. Everything else gets fetched automatically as a part of the build process.

### Building a site with Antora

Demo time! To build a minimal site, you need three things:

  1. At least one component holding your AsciiDoc sources.
  2. An Antora Playbook.
  3. A UI bundle



Good news is the nice people behind Antora provide [example Antora sources][7] we can try right away.

#### The Playbook

Let’s first have a look at [the Playbook][8]:

```
site:
 title: Antora Demo Site
# the 404 page and sitemap files only get generated when the url property is set
 url: https://example.org/docs
 start_page: component-b::index.adoc
content:
 sources:
 - url: https://gitlab.com/antora/demo/demo-component-a.git
 branches: master
 - url: https://gitlab.com/antora/demo/demo-component-b.git
 branches: [v2.0, v1.0]
 start_path: docs
ui:
 bundle:
 url: https://gitlab.com/antora/antora-ui-default/-/jobs/artifacts/master/raw/build/ui-bundle.zip?job=bundle-stable
 snapshot: true
```

As we can see, the Playbook defines some information about the site, lists the content repositories, and points to the UI bundle.

There are two repositories. The [demo-component-a][9] with a single branch, and the [demo-component-b][10] having two branches, each representing a different version.

#### Components

The minimal source repository structure is nicely demonstrated in the [demo-component-a][9] repository:

```
antora.yml <- component metadata
modules/
 ROOT/ <- the default module
 nav.adoc <- menu definition
 pages/ <- a directory with all the .adoc sources
 source1.adoc
 source2.adoc
 ...
```

The following

```
antora.yml
```

```
name: component-a
title: Component A
version: 1.5.6
start_page: ROOT:inline-text-formatting.adoc
nav:
 - modules/ROOT/nav.adoc
```

contains metadata for this component such as the name and the version of the component, the starting page, and it also points to a menu definition file.

The menu definition file is a simple list that defines the structure of the menu and the content. It uses the [page ID][4] to identify each page.

```
* xref:inline-text-formatting.adoc[Basic Inline Text Formatting]
* xref:special-characters.adoc[Special Characters & Symbols]
* xref:admonition.adoc[Admonition]
* xref:sidebar.adoc[Sidebar]
* xref:ui-macros.adoc[UI Macros]
* Lists
** xref:lists/ordered-list.adoc[Ordered List]
** xref:lists/unordered-list.adoc[Unordered List]

And finally, there's the actual content under modules/ROOT/pages/ — you can see the repository for examples, or the AsciiDoc syntax reference
```

#### The UI bundle

For the UI, we’ll be using the example UI provided by the project.

Going into the details of Antora UI would be above the scope of this article, but if you’re interested, please see the [Antora UI documentation][5] for more info.

#### Building the site

Note: We’ll be using Podman to run Antora in a container. You can [learn about Podman on the Fedora Magazine][11].

To build the site, we only need to call Antora on the Playbook file.

The easiest way to get antora at the moment is to use the container image provided by the project. You can get it by running:

```
$ podman pull antora/antora
```

Let’s get the playbook repository:

```
$ git clone https://gitlab.com/antora/demo/demo-site.git
$ cd demo-site
```

And run Antora using the following command:

```
$ podman run --rm -it -v $(pwd):/antora:z antora/antora site.yml
```

The site will be available in the

public

```
$ cd public
$ python3 -m http.server 8080
```

directory. You can either open it in your web browser directly, or start a local web server using:

Your site will be available on <http://localhost:8080>.


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/using-antora-for-your-open-source-documentation/

作者：[Adam Šamalík][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/asamalik/
[b]: https://github.com/lujun9972
[1]: https://antora.org/
[2]: http://docs.fedoraproject.org/
[3]: https://docs.fedoraproject.org/en-US/fedora/f29/
[4]: https://docs.antora.org/antora/2.0/page/page-id/#structure
[5]: https://docs.antora.org/antora-ui-default/
[6]: https://docs.antora.org/antora/2.0/playbook/
[7]: https://gitlab.com/antora/demo
[8]: https://gitlab.com/antora/demo/demo-site/blob/master/site.yml
[9]: https://gitlab.com/antora/demo/demo-component-a
[10]: https://gitlab.com/antora/demo/demo-component-b
[11]: https://fedoramagazine.org/running-containers-with-podman/

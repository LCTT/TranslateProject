[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Create web tutorials with Reveal.js and Git)
[#]: via: (https://opensource.com/article/20/4/create-web-tutorial-git)
[#]: author: (Eric D. Schabell https://opensource.com/users/eschabell)

Create web tutorials with Reveal.js and Git
======
Workshop slides can be viewed consistently on any browser, device, and
platform with this easy workflow.
![Person reading a book and digital copy][1]

Whether you're a learner or a teacher, you probably recognize the value of online workshops set up like slideshows for communicating knowledge. If you've ever stumbled upon one of these well-organized tutorials that are set up page by page, chapter by chapter, you may have wondered how hard it was to create such a website.

Well, I'm here to show you how easy it is to generate this type of workshop using a fully automated process.

### Introduction

When I started putting my learning content online, it was not a nice, seamless experience. So, I wanted something repeatable and consistent that was also easy to maintain, since my content changes as the technology I teach progresses.

I tried many delivery models, from low-level code generators, such as [Asciidoctor][2], to laying out a workshop in a single PDF file. All failed to satisfy me. When I deliver live, onsite workshops, I like using slideshows, so I wondered if I could do the same thing for my online, self-paced workshop experiences.

After some digging, I built a foundation for creating painless workshop websites. It helped that I was already using a presentation-generation framework that resulted in a website-friendly format (HTML).

### Setting it up

Here the basic components you need for this project:

  * Workshop idea (this is your problem, can't help you here)
  * Reveal.js for the workshop slides
  * GitLab project repository
  * Your favorite HTML code editor
  * Web browser
  * Git installed on your machine



If this list looks intimidating, there's a quick way to get started that doesn't involve pulling all the pieces together one by one: You can use my template project to give you a kickstart with the slides and project setup.

This article assumes you're familiar with Git and projects hosted on a Git platform like GitLab. If you need a refresher or tutorial, check out our [introductory Git series][3].

Start by cloning the template project to your local machine:


```
`$ git clone https://gitlab.com/eschabell/beginners-guide-automated-workshops.git`
```

Set up a new GitLab project for this and import the template project as the initial import.

There are a number of important files for the workshop website. In the **root** directory, you'll find a file called **.gitlab-ci.yml**, which is used as a trigger when you commit changes to the master branch (i.e., merge pull requests to **master**). It triggers a copy of the complete contents of the **slides** directory into the GitLab project's **website** folder.

I have this hosted as a project called **beginners-guide-automated-workshops** in my GitLab account. When it deploys, you can view the contents of the **slides** directory in your browser by navigating to:


```
`https://eschabell.gitlab.io/beginners-guide-automated-workshops`
```

For your user account and project, the URL would look like:


```
`https://[YOUR_USERNAME].gitlab.io/[YOUR_PROJECT_NAME]`
```

These are the basic materials you need to start creating your website content. When you push changes, they will automatically generate your updated workshop website. Note that the default template contains several example slides, which will be your first workshop website after you complete the full check-in to your repository.

The workshop template results in a [reveal.js][4] slideshow that can run in any browser, with automatic resizing that allows it to be viewed by almost anyone, anywhere, on any device.

How's that for creating handy and accessible workshops?

### How it works

With this background in place, you're ready to explore the workshop materials and start putting your content together. Everything you need can be found in the project's **slides** directory; this is where all of the magic happens with reveal.js to create the workshop slideshow in a browser.

The files and directories you'll be working with to craft your workshop are:

  * The **default.css** file
  * The **images** directory
  * The **index.html** file



Open each one in your favorite HTML/CSS editor and make the changes described below. It does not matter which editor you use; I prefer [RubyMine IDE][5] because it offers a page preview in the local browser. This helps when I'm testing out content before pushing it online to the workshop website.

#### Default.css file

The file **css/theme/default.css** is the base file where you will set important global settings for your workshop slides. The two main items of interest are the default font and background image for all slides.

In **default.css**, look at the section labeled **GLOBAL STYLES**. The current default font is listed in the line:


```
`font-family: "Red Hat Display", "Overpass", san-serif;`
```

If you're using a non-standard font type, you must import it (as was done for the Overpass font type) in the line:


```
`@import url('SOME_URL');`
```

The **background** is the default image for every slide you create. It is stored in the **images** directory (see below) and set in the line below (focus on the image path):


```
`background: url("…/…/images/backgrounds/basic.png")`
```

To set a default background, just point this line to the image you want to use.

#### Images directory

As its name implies, the **images** directory is used for storing the images you want to use on your workshop slides. For example, I usually put screenshots that demonstrate the progress of the workshop topic on my individual slides.

For now, just know that you need to store the background images in a subdirectory (**backgrounds**) and the images you plan to use in your slides in the **Images** directory.

#### Index.html file

Now that you have those two files sorted out, you'll spend the rest of your time creating slides in the HTML files, starting with **index.html**. For your workshop website to start taking shape, pay attention to the following three sections in this file:

  * The **head** section, where you set the title, author, and description
  * The **body** section, where you find the individual slides to design
  * Each **section**, where you define the contents of individual slides



Start with the **head** section, since it's at the top. The template project has three placeholder lines for you to update:


```
&lt;title&gt;INSERT-YOUR-TITLE-HERE&lt;/title&gt;
&lt;meta name="description" content="YOUR DESCIPTION HERE."&gt;
&lt;meta name="author" content="YOUR NAME"&gt;
```

The **title** tag contains the text that appears in the browser tab when the file is open. Change it to something relevant to the title of your workshop (or maybe a section of your workshop), but remember to keep it short since tab title space is limited. The **description** meta tag contains a short description of your workshop, and the **author** meta tag is where you should put your name (or the workshop creator's name, if you're doing this for someone else).

Now move on to the **body** section. You'll notice that it's divided into a number of **section** tags. The opening of the **body** contains a comment that explains that you're creating slides for each open and closing tag labeled **section**:


```
&lt;body&gt;
        &lt;div class="reveal"&gt;

        &lt;!-- Any section element inside of this container is displayed as a slide --&gt;
        &lt;div class="slides"&gt;
```

Next, create your individual slides, with each slide enclosed in **section** tags. The template includes a few slides to help you get started. For example, here's the first slide:


```
&lt;section&gt;
      &lt;div style="width: 1056px; height: 300px"&gt;
            &lt;h1&gt;Beginners guide&lt;/h1&gt;
            &lt;h2&gt;to automated workshops&lt;/h2&gt;
      &lt;/div&gt;
      &lt;div style="width: 1056px; height: 200px; text-align: left"&gt;
            Brought to you by,&lt;br/&gt;
            YOUR-NAME&lt;br/&gt;
      &lt;/div&gt;
      &lt;aside class="notes"&gt;Here are notes: Welcome to the workshop!&lt;/aside&gt;
&lt;/section&gt;
```

This slide has two areas divided with **div** tags. Spacing separates the title and the author.

Assuming you have some knowledge of using HTML, try various things to develop your workshop. It's really handy to use a browser as you go to preview the results. Some IDEs provide local viewing of changes, but you can also open the **index.html** file and view your changes before pushing them to the repository.

Once you're satisfied with your workshop, push your changes, and wait for them to pass through the continuous integration pipeline. They'll be hosted like the template project at <https://eschabell.gitlab.io/beginners-guide-automated-workshops>.

### Learn more

To learn more about what you can do with this workflow, check out the following example workshops and sites that host workshop collections. All of these are based on the workflow described in this article.

Workshop examples:

  * [Red Hat Process Automation Manage workshop][6]
  * [JBoss Travel Agency BPM Suite online workshop][7]



Workshop collections:

  * [Rule the world: Practical decisions &amp; process automation development workshops][8]
  * [Application development in the cloud workshop][9]
  * [Portfolio architecture: Workshops for creating impactful architectural diagrams][10]



I hope this beginner's guide and the template workshop project show you easy and painless it can be to develop and maintain workshop websites in a consistent manner. I also hope this workflow gives your workshop audiences full access to your content on almost any device so they can learn from the knowledge you're sharing.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/create-web-tutorial-git

作者：[Eric D. Schabell][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/eschabell
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/read_book_guide_tutorial_teacher_student_apaper.png?itok=_GOufk6N (Person reading a book and digital copy)
[2]: https://asciidoctor.org/
[3]: https://opensource.com/resources/what-is-git
[4]: https://revealjs.com/#/
[5]: https://www.jetbrains.com/ruby/
[6]: https://gitlab.com/bpmworkshop/rhpam-devops-workshop
[7]: https://gitlab.com/bpmworkshop/presentation-bpmworkshop-travel-agency
[8]: https://bpmworkshop.gitlab.io/
[9]: https://appdevcloudworkshop.gitlab.io/
[10]: https://redhatdemocentral.gitlab.io/portfolio-architecture-workshops

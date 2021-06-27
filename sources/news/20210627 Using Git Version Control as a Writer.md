[#]: subject: (Using Git Version Control as a Writer)
[#]: via: (https://news.itsfoss.com/version-control-writers/)
[#]: author: (Theena https://news.itsfoss.com/author/theena/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Using Git Version Control as a Writer
======

I believe modern writers should begin thinking about their processes, or workflows.

In a highly distracted world, it is imperative to take ownership over the chain of tasks we perform every day as writers. Traditionally, writers would put their writing to the hours where the distraction is less, and the focus high. Unfortunately advice from Hemingway, Atwood, et al., isn’t really applicable to us any more. The world we live in is far more connected, and thus have far more pitfalls for writers. Part of that is being disciplined enough to not let social media or cute videos of puppies and kittens distract us at the times we are writing.

But disconnecting from the internet isn’t really an option if part of your writing requires quick fact-checks, spellings of uncommon and technical words, etc., – this is very true for me when I am writing. The other issue is the distractions that are within the writing app itself; as a life long MS Word user, I found it getting prettier, but slower and more distracting. I spoke about this at length as being among the [primary reasons for transitioning into Vim][1] in the first place, so I am not going to speak extensively on this. The point being that writing in the modern world, on modern devices can be far from ideal.

Since I’ve already gone into detail on the [why I switched to Vim][2] and open source version control, I would like to use this article to talk about the **how**, specifically how to use open source version control technology such as git (and GitHub).

### What is Version Control, again?

![Source: https://git-scm.com/][3]

The diagram above is a illustration of how we perform traditional version control. This
diagram assumes that you have one device and that you write only in that device. In my case, I write on a number of machines, including my Android phone and a selection of laptops of varying ages that I use for specific and in specific places. The one common task that I carry out between all these devices is writing – it is imperative, therefore, that my devices capture changes and version controls my files in sane manner. No more `file1V1_device1_date.doc` as I would name my files.

The diagram above also doesn’t take into account the tools that we use to write.A word processor such as LibreOffice Write works across Linux, Mac, and Windows machines, but using a word processor on the phone is an unpleasant experience. Some of us writers also use other text tools, including Gmail or our email clients, to write little sketches for our writing. Keeping track of all of these files and emails in a logical order is exhausting – I wrote a book using such a process, and trust me: the time I spent figuring out file names, version changes, comments, notes to self, and emails with additional notes, was enough to drive me to distraction.

Some of you reading this might rightly point out that cloud-based backup technology
exists. While the benefits of cloud-based storage are immense, and I continue using them, version control barely exists, or isn’t powerful.

### A better workflow

Like the rest of the planet, the start of the pandemic led to some anxiety and some soul
searching. I spent the time teaching myself web development on [The Odin Project][4] (highly recommended for those who are thinking of learning html, CSS, JavaScript/Ruby).

Among the first modules was an introduction to Git: what version control was, and what problems it sought to address. Reading this chapter was a revelation. I knew immediately that this _git_ was exactly what I was looking for as a writer.

The better way, then, isn’t localized version control but _distributed_ version control. ‘Distributed’ describes the distribution of the _devices_ that I will be accessing a file from, and editing/changing thereafter. The diagram below is a visual illustration of distributed version control.

![Source: https://git-scm.com/][5]

### My way

My goals in building a version control system for writing were as follows:

  * Make my manuscript repository accessible from anywhere, from any device
  * Ease of use
  * Reduce or remove the friction that comes about from shifting context between writing, study and coding workflows – as much as possible, we will use the same tool (i.e. Vim)
  * Scalable
  * Easy to maintain



Based on the above needs, the diagram below is my distributed version control system for my writing.

![][6]

As you can see, my version control system is a simplistic adaptation of distributed version control. By adding git version control to a folder on cloud storage ([pCloud][7]) in my case, I can now draw the benefits of both technologies. Thus my workflow can be visualized as follows:

![][8]

#### Advantages

  1. I have one writing (and coding) tool
  2. I have version control of my manuscripts, no matter what device I access the file from
  3. It’s [super easy, barely an inconvenience][9]
  4. Easy to maintain.



#### Drawbacks

The writers among you must wonder what drawbacks exist in the system. Here are a few that I anticipate as I continue using and refining this workflow.

  * Comments on drafts: one of the more useful features of word processors is the ability to comment. I often leave comments for myself when I want to come back to a certain portion of the text. I still haven’t figured out a workaround for this.
  * Collaboration: Word processors allow for collaboration between writers. During my advertising days, I would use Google Docs to write copy and share the link with my designers to extract the copy for ads and websites. Right now, my workaround for this writing the copy in markdown, and exporting the markdown file to a .doc file via Pandoc. More critically, when my manuscripts are completed, I’d need to still send the files in .doc format for my editors. Once my editor makes
those changes and sends it back, it makes little sense for me to try opening it again in Vim. At this point, the system’s limitations will become more obvious.



In no way am I saying this is the best method, but this is the best method for _me_ at this
point in my career. I imagine I will be refining this further as I get more familiar and comfortable with my new [open source tools for writing][10] and version control.

I hope this serves as a good introduction to writers wanting to use Git for their document version control. This is by no means an extensive article, but I will share some useful links to make the journey easier for you.

  1. [Git Basics from The Odin Project:][11]
  2. [Getting started with Git][12]
  3. GitHub’s Basics of Git Tutorial



As a bonus, here’s a screen recording of me using Vim on my Android device to work on a poem, pushing the changes to Git.

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/version-control-writers/

作者：[Theena][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/theena/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/how-i-started-loving-vim/
[2]: https://news.itsfoss.com/configuring-vim-writing/
[3]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjY2NiIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[4]: https://www.theodinproject.com/
[5]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjgwMCIgd2lkdGg9IjY2OCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[6]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjYwNSIgd2lkdGg9IjYxNyIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[7]: https://itsfoss.com/recommends/pcloud/
[8]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9Ijc1MSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[9]: https://www.youtube.com/watch?v=NtH-HhaLw-Q
[10]: https://itsfoss.com/open-source-tools-writers/
[11]: https://www.theodinproject.com/paths/foundations/courses/foundations/lessons/introduction-to-git
[12]: https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control

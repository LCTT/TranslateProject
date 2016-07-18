What is Git
===========

Welcome to my series on learning how to use the Git version control system! In this introduction to the series, you will learn what Git is for and who should use it.

If you're just starting out in the open source world, you're likely to come across a software project that keeps its code in, and possibly releases it for use, by way of Git. In fact, whether you know it or not, you're certainly using software right now that is developed using Git: the Linux kernel (which drives the website you're on right now, if not the desktop or mobile phone you're accessing it on), Firefox, Chrome, and many more projects share their codebase with the world in a Git repository.

On the other hand, all the excitement and hype over Git tends to make things a little muddy. Can you only use Git to share your code with others, or can you use Git in the privacy of your own home or business? Do you have to have a GitHub account to use Git? Why use Git at all? What are the benefits of Git? Is Git the only option?

So forget what you know or what you think you know about Git, and let's take it from the beginning.

### What is version control?

Git is, first and foremost, a version control system (VCS). There are many version control systems out there: CVS, SVN, Mercurial, Fossil, and, of course, Git.

Git serves as the foundation for many services, like GitHub and GitLab, but you can use Git without using any other service. This means that you can use Git privately or publicly.

If you have ever collaborated on anything digital with anyone, then you know how it goes. It starts out simple: you have your version, and you send it to your partner. They make some changes, so now there are two versions, and send the suggestions back to you. You integrate their changes into your version, and now there is one version again.

Then it gets worse: while you change your version further, your partner makes more changes to their version. Now you have three versions; the merged copy that you both worked on, the version you changed, and the version your partner has changed.

As Jason van Gumster points out in his article, 【Even artists need version control][1], this syndrome tends to happen in individual settings as well. In both art and science, it's not uncommon to develop a trial version of something; a version of your project that might make it a lot better, or that might fail miserably. So you create file names like project_justTesting.kdenlive and project_betterVersion.kdenlive, and then project_best_FINAL.kdenlive, but with the inevitable allowance for project_FINAL-alternateVersion.kdenlive, and so on.

Whether it's a change to a for loop or an editing change, it happens to the best of us. That is where a good version control system makes life easier.

### Git snapshots

Git takes snapshots of a project, and stores those snapshots as unique versions.

If you go off in a direction with your project that you decide was the wrong direction, you can just roll back to the last good version and continue along an alternate path.

If you're collaborating, then when someone sends you changes, you can merge those changes into your working branch, and then your collaborator can grab the merged version of the project and continue working from the new current version.

Git isn't magic, so conflicts do occur ("You changed the last line of the book, but I deleted that line entirely; how do we resolve that?"), but on the whole, Git enables you to manage the many potential variants of a single work, retaining the history of all the changes, and even allows for parallel versions.

### Git distributes

Working on a project on separate machines is complex, because you want to have the latest version of a project while you work, makes your own changes, and share your changes with your collaborators. The default method of doing this tends to be clunky online file sharing services, or old school email attachments, both of which are inefficient and error-prone.

Git is designed for distributed development. If you're involved with a project you can clone the project's Git repository, and then work on it as if it was the only copy in existence. Then, with a few simple commands, you can pull in any changes from other contributors, and you can also push your changes over to someone else. Now there is no confusion about who has what version of a project, or whose changes exist where. It is all locally developed, and pushed and pulled toward a common target (or not, depending on how the project chooses to develop).

### Git interfaces

In its natural state, Git is an application that runs in the Linux terminal. However, as it is well-designed and open source, developers all over the world have designed other ways to access it.

It is free, available to anyone for $0, and comes in packages on Linux, BSD, Illumos, and other Unix-like operating systems. It looks like this:

```
$ git --version
git version 2.5.3
```

Probably the most well-known Git interfaces are web-based: sites like GitHub, the open source GitLab, Savannah, BitBucket, and SourceForge all offer online code hosting to maximise the public and social aspect of open source along with, in varying degrees, browser-based GUIs to minimise the learning curve of using Git. This is what the GitLab interface looks like:

![](https://opensource.com/sites/default/files/0_gitlab.png)

Additionally, it is possible that a Git service or independent developer may even have a custom Git frontend that is not HTML-based, which is particularly handy if you don't live with a browser eternally open. The most transparent integration comes in the form of file manager support. The KDE file manager, Dolphin, can show the Git status of a directory, and even generate commits, pushes, and pulls.

![](https://opensource.com/sites/default/files/0_dolphin.jpg)

[Sparkleshare][2] uses Git as a foundation for its own Dropbox-style file sharing interface.

![](https://opensource.com/sites/default/files/0_sparkleshare_1.jpg)

For more, see the (long) page on the official [Git wiki][3] listing projects with graphical interfaces to Git.

### Who should use Git?

You should! The real question is when? And what for?

### When should I use Git, and what should I use it for?

To get the most out of Git, you need to think a little bit more than usual about file formats.

Git is designed to manage source code, which in most languages consists of lines of text. Of course, Git doesn't know if you're feeding it source code or the next Great American Novel, so as long as it breaks down to text, Git is a great option for managing and tracking versions.

But what is text? If you write something in an office application like Libre Office, then you're probably not generating raw text. There is usually a wrapper around complex applications like that which encapsulate the raw text in XML markup and then in a zip container, as a way to ensure that all of the assets for your office file are available when you send that file to someone else. Strangely, though, something that you might expect to be very complex, like the save files for a [Kdenlive][4] project, or an SVG from [Inkscape][5], are actually raw XML files that can easily be managed by Git.

If you use Unix, you can check to see what a file is made of with the file command:

```
$ file ~/path/to/my-file.blah
my-file.blah: ASCII text
$ file ~/path/to/different-file.kra: Zip data (MIME type "application/x-krita")
```

If unsure, you can view the contents of a file with the head command:

```
$ head ~/path/to/my-file.blah
```

If you see text that is mostly readable by you, then it is probably a file made of text. If you see garbage with some familiar text characters here and there, it is probably not made of text.

Make no mistake: Git can manage other formats of files, but it treats them as blobs. The difference is that in a text file, two Git snapshots (or commits, as we call them) might be, say, three lines different from each other. If you have a photo that has been altered between two different commits, how can Git express that change? It can't, really, because photographs are not made of any kind of sensible text that can just be inserted or removed. I wish photo editing were as easy as just changing some text from "<sky>ugly greenish-blue</sky>" to "<sky>blue-with-fluffy-clouds</sky>" but it truly is not.

People check in blobs, like PNG icons or a speadsheet or a flowchart, to Git all the time, so if you're working in Git then don't be afraid to do that. Know that it's not sensible to do that with huge files, though. If you are working on a project that does generate both text files and large blobs (a common scenario with video games, which have equal parts source code to graphical and audio assets), then you can do one of two things: either invent your own solution, such as pointers to a shared network drive, or use a Git add-on like Joey Hess's excellent [git annex][6], or the [Git-Media][7] project.

So you see, Git really is for everyone. It is a great way to manage versions of your files, it is a powerful tool, and it is not as scary as it first seems.

--------------------------------------------------------------------------------

via: https://opensource.com/resources/what-is-git

作者：[Seth Kenlon ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[1]: https://opensource.com/life/16/2/version-control-isnt-just-programmers
[2]: http://sparkleshare.org/
[3]: https://git.wiki.kernel.org/index.php/InterfacesFrontendsAndTools#Graphical_Interfaces
[4]: https://opensource.com/life/11/11/introduction-kdenlive
[5]: http://inkscape.org/
[6]: https://git-annex.branchable.com/
[7]: https://github.com/alebedev/git-media





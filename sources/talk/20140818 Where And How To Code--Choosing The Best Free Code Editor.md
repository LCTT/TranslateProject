Where And How To Code: Choosing The Best Free Code Editor
================================================================================
A close look at Cloud9, Koding and Nitrous.IO.

![](http://a2.files.readwrite.com/image/upload/c_fill,h_900,q_70,w_1600/MTIzMDQ5NjYzODM4NDU1MzA4.jpg)

**Ready to start your first coding project? Great! Just configure** Terminal or Command Prompt, learn to use it and then install all the languages, add-on libraries and APIs you’ll need. When you're finally through with all that, you can get started with installing [Visual Studio][1] so you can preview your work.  

At least that's how you used to have to do it.

No wonder beginning coders are increasingly turning to online integrated development environments (IDEs). An IDE is a code editor that comes ready to work with languages and all their dependencies, saving you the hassle of installing them on your computer.

I wanted to learn more about what constitutes the typical IDE, so I took a look at the free tier for three of the most popular integrated development environments out there: [Cloud9][2], [Koding][3], and [Nitrous.IO][4]. In the process, I learned a lot about the cases in which programmers would and would not want to use IDEs. 

### Why Use An IDE? ###

If a text editor is like Microsoft Word, think of an IDE as Google Drive. You get similar functionality, but it's accessible from any computer and ready to share. As the Internet becomes an increasingly influential part of project workflow, IDEs make life easier.

I used Nitrous.IO for my last ReadWrite tutorial, the Python app in [Create Your Own Obnoxiously Simple Messaging App Just Like Yo][5]. When you use an IDE, you select the language you want to work in so you can test and preview how it looks on the IDE’s Virtual Machine (VM) designed to run programs written specifically in that language.

If you read the tutorial, you'll see there are only two API libraries that my app depended on—messaging service Twilio and Python microframework Flask. That would have been easy to build using a text editor and Terminal on my computer, but I chose an IDE for yet another convenience: when everyone is using the same developer environment, it’s easier to follow along with a tutorial.

### What An IDE Is Not ###

Still, an IDE is not a long term hosting solution. 

When you’re working on an IDE, you’re able to build, test and preview your app in the cloud. You’re even able to share the final draft via link.

But you can’t use an IDE to store your project permanently. You wouldn't ditch your blog in favor of hosting your posts as Google Drive documents. Like Google Drive, IDEs allow you to link and share content, but neither are equipped to replace real hosting.

What's more, IDEs aren't designed for wide-spread sharing. Despite the increased functionality IDEs add to the preview capability of most text editors, stick with showing off your app preview to friends and coworkers, not with, say, the front page of Hacker News. In that case, your IDE would probably shut you down for excessive traffic. 

Think of it this way: an IDE is a place to build and test your app; a host is a place for it to live. So once you’ve finalized your app, you’ll want to deploy it on a cloud-based service that lets you host apps long term, preferably one with a free hosting option like [Heroku][6].

### Choosing An IDE ###

![](http://a2.files.readwrite.com/image/upload/c_fit,w_630/MTIzNjEzMTg5MjA2NDc2MzAy.png)

As IDEs become more popular, more are popping up all the time. In my opinion, there’s no perfect IDE. However, some IDEs are better for certain work process priorities than others.

I took a look at the free tier for three of the most popular integrated development environments out there: Cloud9, Koding, and Nitrous.IO. Each has its benefits, depending on what you're working on. Here's what I found. 

### Cloud9: Ready To Collaborate ###

When I signed up for Cloud9, one of the first things it prompted me to do was integrate my GitHub and BitBucket accounts. Instantly, all my GitHub projects, solo and collaborative, were ready to clone and work on in Cloud9’s development tool. Other IDEs have nowhere near this level of GitHub integration.

Out of the three IDEs I looked at, Cloud9 seemed most intent on ensuring an environment where I could work seamlessly with co-coders. Here, it’s not just a chat function in the corner. In fact, said CEO Ruben Daniels, Cloud9 collaborators can see each others coding in real time, just like co-authors are able to on Google Drive.

“Most services’ collaborative features only work on a single file,” said Daniels. “Ours work on multiples throughout the project. Collaboration is fully integrated within the IDE.” 

### Koding: Help When You Need It ###

IDEs give you the tools you need to build and test applications in the gamut of open source languages. For a beginner, that can be a little bit intimidating. For example, if I’m working on a project with both Python and Ruby components, which VM do I use for testing?

The answer is both, though on a free account, you can only turn on one VM for testing at a time. I was able to find that out right on my Koding dashboard, which doubles as a place for users to give and get advice on their Koding projects. Of the three, it’s the most transparent when it comes to where you can ask for assistance and hear back in minutes.

“We have an active community built into the application,” said Nitin Gupta, Chief Business Officer at Koding. “We wanted to create an environment that is extremely attractive to people who need help and who want to help.”

### Nitrous.IO: An IDE Wherever You Want ###

The ultimate advantage of using an IDE over your own desktop environment is that it’s self-contained. You don’t have to install anything to use it. On the other hand, the ultimate advantage of using your own desktop environment is that you can work locally, even without Internet.

Nitrous.IO gives you the best of both worlds. You can use the IDE on the Web, or you can download it to your own computer, said cofounder AJ Solimine. The advantage is that you can merge the integrations of Nitrous with the familiarity of your preferred text editor.

“You can access Nitrous.IO from any modern web browser via our online Web IDE, but we also have handy desktop applications for Windows and Mac that let you edit with your favorite editor,” he said. 

### The Bottom Line ###

The most surprising thing I learned from a week of [using][7] three different IDEs? How similar they are. [When it comes to the basics of coding][8], they’re all equally helpful.

Cloud9, Koding, [and Nitrous.IO all support][9] every major open source language, from Ruby to Python to PHP to HTML5. You can choose from any of those VMs.

Both Cloud9 and Nitrous.IO have built-in one-click GitHub integration. For Koding there are a [couple more steps][10], but it can be done. 

Each integrated easily with the APIs I needed. Each let me install my preferred package installers, too (and Koding made me do it as a superuser). They all have a built in Terminal for easily testing and deploying projects. All three allow you to easily preview your project. And of course, they all hosted my project in the cloud so I could work on it anywhere.

On the downside, they all had the same negatives, which is reasonable when you consider they're free. You can only run one VM at a time to test a program written in a particular language. When you’re not using your VM for a while, the IDE preserves bandwidth by putting it into hibernation and you have to wait for it to reload next time you use it (and Cloud9 was especially laborious). None of them make a good permanent host for your finished projects.

So to answer those who ask me if there’s a perfect free IDE out there, probably not. But depending on your priorities, there might be one that’s perfect for your project.

Lead image courtesy of [Shutterstock][11]

--------------------------------------------------------------------------------

via: http://readwrite.com/2014/08/14/cloud9-koding-nitrousio-integrated-development-environment-ide-coding

作者：[Lauren Orsini][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://readwrite.com/author/lauren-orsini
[1]:http://www.visualstudio.com/
[2]:http://c9.io/
[3]:https://koding.com/
[4]:http://nitrous.io/
[5]:http://readwrite.com/2014/07/11/one-click-messaging-app
[6]:http://heroku.com/
[7]:http://help.nitrous.io/ide-general/
[8]:https://www.nitrous.io/desktop
[9]:https://www.nitrous.io/desktop
[10]:https://koding.com/Activity/steps-clone-projects-github-koding-1-create-account-github-2-open-your-terminal-3
[11]:http://www.shutterstock.com/
su-kaiyao translating

Simple guide to forks in GitHub and Git
==========================================

In my experience, one of the most confusing parts about getting started in Git and GitHub is trying to figure out the following: **What do I do in Git, and what do I do in GitHub?**

Git tutorials tend not to address this question, since they are (purposefully) focused on teaching you Git commands and concepts, and do not presume you will use GitHub. [GitHub help articles](https://help.github.com/) bridge this gap somewhat, but each article is narrowly focused and ultimately doesn't provide a conceptual overview of the "Git vs GitHub" question.

**If you are the type of learner that benefits from understanding concepts before diving into code**, and you are new to Git and GitHub, I suggest that the first step is to understand forking. Why?

1. Forking is a common way to get started in GitHub.
2. Forking requires very few Git commands, but the ones it does use are very important.
3. Forking provides a foundational understanding of Git and GitHub that will benefit you later.

**This guide uses two simple diagrams to teach you the two main workflows for forks.** I'm not going to cover any code, but in the Conclusion I'll link to the code you should use.

###Forking and updating a repo

Let's say there's a programmer named Joe who built a game you would like to improve, and he is hosting his code in a GitHub repository. Here's what you do:
![Alt text](https://app.yinxiang.com/shard/s14/sh/ff60f113-2880-47b0-ba99-c296803dbe7d/700ebd0916916079da437d9e231f73d4/res/8aab524b-6ea1-4a2f-b03b-143f12b0e71b/github1.png)
*Diagram of forking and updating a GitHub repo*

1. **Fork his repo**: This is a GitHub operation, in which you are making a copy of Joe's repository (including the files, commit history, issues, and more). This repository now lives in your GitHub account. Nothing has yet happened to your local computer.

2. **Clone your repo**: This is a Git operation, in which you are using Git to tell GitHub "please send me a copy of my repo." The repo is now stored on your local computer.

3. **Update some files**: You can now make updates to the files in whatever program or environment you like.

4. **Commit your changes**: This is a Git operation, in which you are telling Git to record the file changes you have made. This is an operation on your local computer only.

5. **Push your changes to your GitHub repo**: This is a Git operation, in which you are using Git to tell GitHub "here are my changes." Pushing does not happen automatically, so until you do this step, GitHub does not know about your commits.

6. **Send a pull request to Joe**: If you think that Joe might like to incorporate your changes, you send him a pull request. This is a GitHub operation, in which you are communicating your changes to Joe, and "requesting" that he "pull" from your repo. It is up to him whether he pulls from you or not.

If Joe accepts your pull request, he will pull your changes into his repo. Victory!

###Syncing a fork

Let's say that Joe and other contributors have made some more updates to the game, and you've thought of some more updates you'd like to make. Before you do anything else, it's best to "sync your fork" so that you are working on the latest copy of the files. Here's what you do:

![Alt text](https://app.yinxiang.com/shard/s14/sh/ff60f113-2880-47b0-ba99-c296803dbe7d/700ebd0916916079da437d9e231f73d4/res/9ae7ff2b-ebda-478b-ac57-002e92ffde72/github2.png)

*Diagram of syncing a GitHub fork*

1. **Fetch changes from Joe's repo**: This is a Git operation, in which you are using Git to tell GitHub that you would like to retrieve the latest files from Joe's repo.

2. **Merge those changes into your repo**: This is a Git operation, in which you are updating the repo on your local computer with those changes (which have been temporarily stored in a "branch"). Note: Steps 1 and 2 are often combined into a single Git operation called a "pull."

3. **Push the updates to your GitHub repo** (optional): Remember that your local computer does not automatically update your GitHub repo. Therefore, the only way to get your GitHub repo up-to-date is by pushing up the latest changes. You can either do this right away, or you can wait until you have made some updates of your own and committed them locally.

**Take note of the contrast between the workflow for forking and the workflow for syncing**: When you initially fork a repo, the flow of information is from Joe's repo to your repo, and then down to your local computer. But after that initial process, the flow of information is from Joe's repo to your local computer, and then up to your repo.

###Conclusion

I hope this was a helpful overview of [forking](https://help.github.com/articles/fork-a-repo) in GitHub and Git. Now that you understand the concepts, you should be much better prepared to actually execute the code! The GitHub articles on forking and [syncing](https://help.github.com/articles/syncing-a-fork) will give you most of the code you need.

If you are new to Git and this style of learning appeals to you, I highly recommend the first two chapters of the book [Pro Git](http://git-scm.com/book), which is available online for free.

If you enjoy learning via videos, I created a [11-part video series](http://www.dataschool.io/git-and-github-videos-for-beginners/)  (36 minutes total) introducing Git and GitHub to beginners.

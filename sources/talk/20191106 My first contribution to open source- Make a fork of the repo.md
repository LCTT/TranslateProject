[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (My first contribution to open source: Make a fork of the repo)
[#]: via: (https://opensource.com/article/19/11/first-open-source-contribution-fork-clone)
[#]: author: (Galen Corey https://opensource.com/users/galenemco)

My first contribution to open source: Make a fork of the repo
======
Which comes first, to clone or fork a repo?
![User experience vs. design][1]

Previously, I explained [how I ultimately chose a project][2] for my contributions. Once I finally picked that project and a task to work on, I felt like the hard part was over, and I slid into cruise control. I knew what to do next, no question. Just clone the repository so that I have the code on my computer, make a new branch for my work, and get coding, right?

It turns out I made a crucial mistake at this step. Unfortunately, I didn’t realize that I had made a mistake until several hours later when I tried to push my completed code back up to GitHub and got a permission denied error. My third mistake was trying to work directly from a clone of the repo.

When you want to contribute to someone else’s repo, in most cases, you should not clone the repo directly. Instead, you should make a fork of the repo and clone that. You do all of your work on a branch of your fork. Then, when you are ready to make a pull request, you can compare your branch on the fork against the master branch of the original repo.

Before this, I had only ever worked on repos that I either created or had collaborator permissions for, so I could work directly from a clone of the main repo. I did not realize that GitHub even offered the capability to make a pull request from a repo fork onto the original repo. Now that I’ve learned a bit about this option, it is a great feature that makes sense. Forking allows a project to open the ability to contribute to anyone with a GitHub account without having to add them all as "contributors." It also helps keep the main project clean by keeping most new branches on forks, so that they don’t create clutter.

I would have preferred to know this before I started writing my code (or, in this case, finished writing my code, since I didn’t attempt to push any of my changes to GitHub until the end). Moving my changes over from the main repo that I originally worked on into the fork was non-trivial.

For those of you getting started, here are the steps to make a PR on a repository that you do not own, or where you are not a collaborator. I highly recommend trying to push your code to GitHub and at least going through the steps of creating a PR before you get too deep into coding, just to make sure you have everything set up the right way:

  1. Make a fork of the repo you’ve chosen for your contributions.
  2. From the fork, click **Clone or download** to create a copy on your computer.
**Optional:** [Add the base repository as a remote "upstream,"][3] which is helpful if you want to pull down new changes from the base repository into your fork.
  3. [Create a pull request from the branch on your fork into the master branch of the base repository.][4]



--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/first-open-source-contribution-fork-clone

作者：[Galen Corey][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/galenemco
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LIFE_DesirePath.png?itok=N_zLVWlK (User experience vs. design)
[2]: https://opensource.com/article/19/10/first-open-source-contribution-mistake-two
[3]: https://help.github.com/en/articles/configuring-a-remote-for-a-fork
[4]: https://help.github.com/en/articles/creating-a-pull-request-from-a-fork

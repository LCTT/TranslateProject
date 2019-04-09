[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Happy 14th anniversary Git: What do you love about Git?)
[#]: via: (https://opensource.com/article/19/4/what-do-you-love-about-git)
[#]: author: (Jen Wike Huger (Red Hat) https://opensource.com/users/jen-wike/users/seth)

Happy 14th anniversary Git: What do you love about Git?
======
Git's huge influence on software development practices is hard to match.
![arrows cycle symbol for failing faster][1]

In the 14 years since Linus Torvalds developed Git, its influence on software development practices would be hard to match—in StackOverflow's 2018 developer survey, [87% of respondents][2] said they use Git for version control. Clearly, no other tool is anywhere close to knocking Git off its throne as the king of source control management (SCM).

In honor of Git's 14th anniversary on April 7, I asked some enthusiasts what they love most about it. Here's what they told me.

_(Some responses have been lightly edited for grammar and clarity)_

"I can't stand Git. Incomprehensible terminology, distributed so that truth does not exist, requires add-ons like Gerrit to make it 50% as usable as a nice centralized repository like Subversion or Perforce. But in the spirit of answering 'what do you like about Git?': Git makes arbitrarily abstruse source tree manipulations possible and usually makes it easy to undo them when it takes 20 tries to get them right." — _[Sweet Tea Dorminy][3]_

"I like that Git doesn't enforce any particular workflow and development teams are free to collaborate in a way that works for them, be it with pull requests or emailed diffs or push permission for all." — _[Andy Price][4]_

"I've been using Git since 2006 or 2007. What I love about Git is that it works well both for small projects that may never leave my computer and for large, collaborative, distributed projects. Git provides you all the tools to rollback from (almost) every bad commit you make, and as such has significantly reduced my stress when it comes to software management." — _[Jonathan S. Katz][5]_

"I appreciate Git's principle of ["plumbing" vs. "porcelain" commands][6]. Users can effectively share any kind of information using Git without needing to know how the internals work. That said, the curious have access to commands that peel back the layers, revealing the content-addressable filesystem that powers many code-sharing communities." — _[Matthew Broberg][7]_

"I love Git because I can do almost anything to explore, develop, build, test, and commit application codes in my own Git repo. It always motivates me to participate in open source projects." — _[Daniel Oh][8]_

"Git is the first version control tool I used, and it went from being scary to friendly over the years. I love how it empowers you to feel confident about code you are changing while it gives you the assurance that your master branch is safe (obviously unless you force-push half-baked code to the production/master branch). Its ability to reverse changes by checking out older commits is great too." — _[Kedar Vijay Kulkarni][9]_

"I love Git because it made several other SCM software obsolete. No one uses VS, Subversion can be used with git-svn (if needed at all), BitKeeper is remembered only by elders, it's similar with Monotone. Sure, there is Mercurial, but for me it was kind of 'still a work in progress' when I used it while upstreaming Firefox support for AArch64 (a few years ago). Someone may even mention Perforce, SourceSafe, or some other 'enterprise' solutions, but they are not popular in the FOSS world." — _[Marcin Juszkiewicz][10]_

"I love the simplicity of the internal model of SHA1ed (commit → tree → blob) objects. And porcelain commands. And that I used it as patching mechanism for JBoss/Red Hat Fuse. And that this mechanism works. And how Git can be explained in the [great tale of three trees][11]." — _[Grzegorz Grzybek][12]_

"I like the [generated Git man pages][13] which make me humble in front of Git. (This is a page that generates Git-sounding but in reality completely nonsense pages—which often gives the same feeling as real Git pages…)" — _[Marko Myllynen][14]_

"Git changed my life as a developer going from a world where SCM was a problem to a world where it is a solution." — _[Joel Takvorian][15]_

* * *

Now that we've heard from these 10 Git enthusiasts, it's your turn: What do _you_ appreciate about Git? Please share your opinions in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/what-do-you-love-about-git

作者：[Jen Wike Huger (Red Hat)][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jen-wike/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/fail_progress_cycle_momentum_arrow.png?itok=q-ZFa_Eh (arrows cycle symbol for failing faster)
[2]: https://insights.stackoverflow.com/survey/2018/#work-_-version-control
[3]: https://github.com/sweettea
[4]: https://www.linkedin.com/in/andrew-price-8771796/
[5]: https://opensource.com/users/jkatz05
[6]: https://git-scm.com/book/en/v2/Git-Internals-Plumbing-and-Porcelain
[7]: https://opensource.com/users/mbbroberg
[8]: https://opensource.com/users/daniel-oh
[9]: https://opensource.com/users/kkulkarn
[10]: https://github.com/hrw
[11]: https://speakerdeck.com/schacon/a-tale-of-three-trees
[12]: https://github.com/grgrzybek
[13]: https://git-man-page-generator.lokaltog.net/
[14]: https://github.com/myllynen
[15]: https://github.com/jotak

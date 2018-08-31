An introduction to diffs and patches
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/find-file-linux-code_magnifying_glass_zero.png?itok=E2HoPDg0)

If you’ve ever worked on a large codebase with a distributed development model, you’ve probably heard people say things like “Sue just sent a patch,” or “Rajiv is checking out the diff.” Maybe those terms were new to you and you wondered what they meant. Open source has had an impact here, as the main development model of large projects from Apache web server to the Linux kernel have been “patch-based” development projects throughout their lifetime. In fact, did you know that Apache’s name originated from the set of patches that were collected and collated against the original [NCSA HTTPd server source code][1]?

You might think this is folklore, but an early [capture of the Apache website][2] claims that the name was derived from this original “patch” collection; hence **APA** t **CH** y server, which was then simplified to Apache.

But enough history trivia. What exactly are these patches and diffs that developers talk about?

First, for the sake of this article, let’s assume that these two terms reference one and the same thing. “Diff” is simply short for “difference;” a Unix utility by the same name reveals the difference between one or more files. We will look at a diff utility example below.

A “patch” refers to a specific collection of differences between files that can be applied to a source code tree using the Unix diff utility. So we can create diffs (or patches) using the diff tool and apply them to an unpatched version of that same source code using the patch tool. As an aside (and breaking my rule of no more history trivia), the word “patch” comes from the physical covering of punchcard holes to make software changes in the early computing days, when punchcards represented the program executed by the computer’s processor. The image below, found on this [Wikipedia page][3] describing software patches, shows this original “patching” concept:

![](https://opensource.com/sites/default/files/uploads/360px-harvard_mark_i_program_tape.agr_.jpg)

Now that you have a basic understanding of patches and diffs, let’s explore how software developers use these tools. If you haven’t used a source code control system like [Git][4] or [Subversion][5], I will set the stage for how most non-trivial software projects are developed. If you think of the life of a software project as a set of actions along a timeline, you might visualize changes to the software—such as adding a feature or a function to a source code file or fixing a bug—appearing at different points on the timeline, with each discrete point representing the state of all the source code files at that time. We will call these points of change “commits,” using the same nomenclature that today’s most popular source code control tool, Git, uses. When you want to see the difference between the source code before and after a certain commit, or between many commits, you can use a tool to show us diffs, or differences.

If you are developing software using this same source code control tool, Git, you may have changes in your local system that you want to provide for others to potentially add as commits to their own tree. One way to provide local changes to others is to create a diff of your local tree's changes and send this “patch” to others who are working on the same source code. This lets others patch their tree and see the source code tree with your changes applied.

### Linux, Git, and GitHub

This model of sharing patch files is how the Linux kernel community operates regarding proposed changes today. If you look at the archives for any of the popular Linux kernel mailing lists—[LKML][6] is the primary one, but others include [linux-containers][7], [fs-devel][8], [Netdev][9], to name a few—you’ll find many developers posting patches that they wish to have others review, test, and possibly bring into the official Linux kernel Git tree at some point. It is outside of the scope of this article to discuss Git, the source code control system written by Linus Torvalds, in more detail, but it's worth noting that Git enables this distributed development model, allowing patches to live separately from a main repository, pushing and pulling into different trees and following their specific development flow.

Before moving on, we can’t ignore the most popular service in which patches and diffs are relevant: [GitHub][10]. Given its name, you can probably guess that GitHub is based on Git, but it offers a web- and API-based workflow around the Git tool for distributed open source project development. One of the main ways that patches are shared in GitHub is not via email, like the Linux kernel, but by creating a **pull request**. When you commit changes on your own copy of a source code tree, you can share those changes by creating a pull request against a commonly shared repository for that software project. GitHub is used by many active and popular open source projects today, such as [Kubernetes][11], [Docker][12], [the Container Network Interface (CNI)][13], [Istio][14], and many others. In the GitHub world, users tend to use the web-based interface to review the diffs or patches that comprise a pull request, but you can still access the raw patch files and use them at the command line with the patch utility.

### Getting down to business

Now that we’ve covered patches and diffs and how they are used in popular open source communities or tools, let's look at a few examples.

The first example includes two copies of a source tree, and one has changes that we want to visualize using the diff utility. In our examples, we will look at “unified” diffs because that is the expected view for patches in most of the modern software development world. Check the diff manual page for more information on options and ways to produce differences. The original source code is located in sources-orig and our second, modified codebase is located in a directory named sources-fixed. To show the differences in a unified diff format in your terminal, use the following command:
```
$ diff -Naur sources-orig/ sources-fixed/
```

...which then shows the following diff command output:
```
diff -Naur sources-orig/officespace/interest.go sources-fixed/officespace/interest.go
--- sources-orig/officespace/interest.go        2018-08-10 16:39:11.000000000 -0400
+++ sources-fixed/officespace/interest.go       2018-08-10 16:39:40.000000000 -0400
@@ -11,15 +11,13 @@
   InterestRate float64
 }

+// compute the rounded interest for a transaction
 func computeInterest(acct *Account, t Transaction) float64 {

   interest := t.Amount 选题模板.txt 中文排版指北.md comic core.md Dict.md lctt2014.md lctt2016.md LCTT翻译规范.md LICENSE Makefile published README.md sign.md sources translated t.InterestRate
   roundedInterest := math.Floor(interest*100) / 100.0
   remainingInterest := interest - roundedInterest

-  // a little extra..
-  remainingInterest *= 1000
-
   // Save the remaining interest into an account we control:
   acct.Balance = acct.Balance + remainingInterest
```

The first few lines of the diff command output could use some explanation: The three `---` signs show the original filename; any lines that exist in the original file but not in the compared new file will be prefixed with a single `-` to note that this line was “subtracted” from the sources. The `+++` signs show the opposite: The compared new file and additions found in this file are marked with a single `+` symbol to show they were added in the new version of the file. Each “hunk” (that’s what sections prefixed by `@@` are called) of the difference patch file has contextual line numbers that help the patch tool (or other processors) know where to apply this change. You can see from the "Office Space" movie reference function that we’ve corrected (by removing three lines) the greed of one of our software developers, who added a bit to the rounded-out interest calculation along with a comment to our function.

If you want someone else to test the changes from this tree, you could save this output from diff into a patch file:
```
$ diff -Naur sources-orig/ sources-fixed/ >myfixes.patch
```

Now you have a patch file, myfixes.patch, which can be shared with another developer to apply and test this set of changes. A fellow developer can apply the changes using the patch tool, given that their current working directory is in the base of the source code tree:
```
$ patch -p1 < ../myfixes.patch
patching file officespace/interest.go
```

Now your fellow developer’s source tree is patched and ready to build and test the changes that were applied via the patch. What if this developer had made changes to interest.go separately? As long as the changes do not conflict directly—for example, change the same exact lines—the patch tool should be able to solve where to merge the changes in. As an example, an interest.go file with several other changes is used in the following example run of patch:
```
$ patch -p1 < ../myfixes.patch
patching file officespace/interest.go
Hunk #1 succeeded at 26 (offset 15 lines).
```

In this case, patch warns that the changes did not apply at the original location in the file, but were offset by 15 lines. If you have heavily changed files, patch may give up trying to find where the changes fit, but it does provide options (with requisite warnings in the documentation) for turning up the matching “fuzziness” (which are beyond the scope of this article).

If you are using Git and/or GitHub, you will probably not use the diff or patch tools as standalone tools. Git offers much of this functionality so you can use the built-in capabilities of working on a shared source tree with merging and pulling other developer’s changes. One similar capability is to use git diff to provide the unified diff output in your local tree or between any two references (a commit identifier, the name of a tag or branch, and so on). You can even create a patch file that someone not using Git might find useful by simply piping the git diff output to a file, given that it uses the exact format of the diffcommand that patch can consume. Of course, GitHub takes these capabilities into a web-based user interface so you can view file changes on a pull request. In this view, you will note that it is effectively a unified diff view in your web browser, and GitHub allows you to download these changes as a raw patch file.

### Summary

You’ve learned what a diff and a patch are, as well as the common Unix/Linux command line tools that interact with them. Unless you are a developer on a project still using a patch file-based development method—like the Linux kernel—you will consume these capabilities primarily through a source code control system like Git. But it’s helpful to know the background and underpinnings of features many developers use daily through higher-level tools like GitHub. And who knows—they may come in handy someday when you need to work with patches from a mailing list in the Linux world.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/diffs-patches

作者：[Phil Estes][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/estesp
[1]:https://github.com/TooDumbForAName/ncsa-httpd
[2]:https://web.archive.org/web/19970615081902/http:/www.apache.org/info.html
[3]:https://en.wikipedia.org/wiki/Patch_(computing)
[4]:https://git-scm.com/
[5]:https://subversion.apache.org/
[6]:https://lkml.org/
[7]:https://lists.linuxfoundation.org/pipermail/containers/
[8]:https://patchwork.kernel.org/project/linux-fsdevel/list/
[9]:https://www.spinics.net/lists/netdev/
[10]:https://github.com/
[11]:https://kubernetes.io/
[12]:https://www.docker.com/
[13]:https://github.com/containernetworking/cni
[14]:https://istio.io/

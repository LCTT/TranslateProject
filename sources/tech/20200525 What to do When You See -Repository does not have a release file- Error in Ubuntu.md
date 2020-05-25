[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What to do When You See “Repository does not have a release file” Error in Ubuntu)
[#]: via: (https://itsfoss.com/repository-does-not-have-release-file-error-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

What to do When You See “Repository does not have a release file” Error in Ubuntu
======

One of the [several ways of installing software in Ubuntu][1] is by using PPA or adding third-party repositories. A few magical lines give you easy access to a software or its newer version that is not available by default in [Ubuntu][2].

All thing looks well and good until you get habitual of adding additional third-party repositories and one day, you see an error like this while [updating Ubuntu][3]:

**E: The repository ‘<http://ppa.launchpad.net/numix/ppa/ubuntu> focal Release’ does not have a Release file.
N: Updating from such a repository can’t be done securely, and is therefore disabled by default.
N: See apt-secure(8) manpage for repository creation and user configuration details.**

In this tutorial for Ubuntu beginners, I’ll explain what does this error mean, why do you see it and what can you do to handle this error?

### Understanding “Repository does not have a release file” error

![][4]

Let’s go step by step here. The error message is:

**E: The repository ‘<http://ppa.launchpad.net/numix/ppa/ubuntu> focal release’ does not have a release file**

The important part of this error message is “focal release”.

You probably already know that [each Ubuntu release has a codename][5]. For Ubuntu 20.04, the codename is Focal Fossa. The “focal” in the error message indicates Focal Fossa which is Ubuntu 20.04.

The error is basically telling you that though you have added a third-party repository to your system’s sources list, this new repository is not available for your current Ubuntu version.

_**Why so? Because probably you are using a new version of Ubuntu and the developer has not made the software available for this new version.**_

At this point, I highly recommend reading my detailed guides on [PPA][6] and [Ubuntu repositories][7]. These two articles will give you a better, in-depth knowledge of the topic. Trust me, you won’t be disappointed.

### How to know if the PPA/third party is available for your Ubuntu version [Optional]

First you should [check your Ubuntu version and its codename][8] using ‘lsb_release -a’ command:

```
[email protected]:~$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 20.04 LTS
Release:        20.04
Codename:       focal
```

As you can see, the codename it shows is focal. Now the next thing you can do is to go to the website of the software in question.

This could be the tricky part but you can figure it out with some patience and effort.

In the example here, the error complained about **<http://ppa.launchpad.net/numix/ppa/ubuntu>**. It is a PPA repository and you may easily find its webpage. How, you may ask.

Use Google or a [Google alternative search engine][9] like Duck Duck Go and search for “ppa numix”. This should give you the first result from [launchpad.net][10] which is the website used for hosting PPA related code.

On the webpage of the PPA, you can go to the “Overview of published packages” and filter it by the codename of your Ubuntu version:

![][11]

For non-PPA third-party repository, you’ll have to check of the official website of the software and see if the repository is available for your Ubuntu version or not.

### What to do if the repository is not available for your Ubuntu version

In case when the repository in question is not available for your Ubuntu version, here’s what you can do:

  * Delete the troublesome repository from your list of repository so that you don’t see the error every time you run the update.
  * Get the software from another source (if it is possible).



To delete the troublesome repository, start Software &amp; Updates tool:

![][12]

Go to the Other Software tab and look for the repository in question. Highlight it and then click on Remove button to delete it from your system.

![Remove Ppa][13]

This will [delete the PPA][14] or the repository in question.

Next step is to get the software from some other source and that’s totally subjective. In some cases, you can still download the DEB file from the PPA website and use the software (I have explained the steps in the [PPA guide][6]). Alternatively, you can check the project’s website if there is a Snap/Flatpak or Python version of the software available.

--------------------------------------------------------------------------------

via: https://itsfoss.com/repository-does-not-have-release-file-error-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-remove-software-manjaro/
[2]: https://ubuntu.com/
[3]: https://itsfoss.com/update-ubuntu/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/Repository-does-not-have-a-release-file.png?ssl=1
[5]: https://itsfoss.com/linux-code-names/
[6]: https://itsfoss.com/ppa-guide/
[7]: https://itsfoss.com/ubuntu-repositories/
[8]: https://itsfoss.com/how-to-know-ubuntu-unity-version/
[9]: https://itsfoss.com/privacy-search-engines/
[10]: https://launchpad.net/
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/check-repo-version.png?ssl=1
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/software-updates-settings-ubuntu-20-04.jpg?ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/remove-ppa.jpg?ssl=1
[14]: https://itsfoss.com/how-to-remove-or-delete-ppas-quick-tip/

[#]: collector: (lujun9972)
[#]: translator: (jlztan)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What is PPA? Everything You Need to Know About PPA in Linux)
[#]: via: (https://itsfoss.com/ppa-guide/)
[#]: author: (Abhishek Prakash  https://itsfoss.com/author/abhishek/)

What is PPA? Everything You Need to Know About PPA in Linux
======

**Brief: An in-depth article that covers almost all the questions around using PPA in Ubuntu and other Linux distributions.**

If you have been using Ubuntu or some other Linux distribution based on Ubuntu such as Linux Mint, Linux Lite, Zorin OS etc, you may have come across three magical lines of this sort:

```
sudo add-apt-repository ppa:dr-akulavich/lighttable
sudo apt-get update
sudo apt-get install lighttable-installer
```

A number of websites suggest these kind of lines to [install applications in Ubuntu][1]. This is what is called installing an application using PPA.

But what is PPA? Why is it used? Is it safe to use PPA? How to properly use PPA? How to delete a PPA?

I’ll answer all of the above questions in this detailed guide. Even if you already know a few things about PPAs, I am sure this article will still add to your knowledge.

Do note that I am writing this article using Ubuntu. Therefore I’ll use the term Ubuntu almost everywhere but the explanations and steps are also applicable to other Debian/Ubuntu based distributions.

### What is PPA? Why is it used?

![Everything you need to know about PPA in Ubuntu Linux][2]

PPA stands for Personal Package Archive.

Does that make sense? Probably not.

Before you understand PPA, you should know the concept of repositories in Linux. I won’t go into details here though.

#### Concept of repositories and package management

A repository is a collection of files that has information about various software, their versions and some other details like the checksum. Each Ubuntu version has its own official set of four repositories:

  * **Main** – Canonical-supported free and open-source software.

  * **Universe** – Community-maintained free and open-source software.

  * **Restricted** – Proprietary drivers for devices.

  * **Multiverse** – Software restricted by copyright or legal issues.




You can see such repositories for all Ubuntu versions [here][3]. You can browse through them and also go to the individual repositories. For example, Ubuntu 16.04 main repository can be found [here][4].

So basically it’s a web URL that has information about the software. How does your system know where are these repositories?

This information is stored in the sources.list file in the directory /etc/apt. If you look at its content, you’ll see that it has the URL of the repositories. The lines with # at the beginning are ignored.

Now when you run the command sudo apt update, your system uses [APT tool][5] to check against the repo and stores the information about the software and their version in a cache. When you use the command sudo apt install package_name, it uses the information to get that package from the URL where the actual software is stored.

If the repository doesn’t have the information about a certain package, you’ll see an error like:

```
E: Unable to locate package
```

At this point, I recommend reading my [guide to using apt commands][6]. This will give you a much better understanding of apt commands, update etc.

So this was about repositories. But what is PPA? How does it enter into the picture?

#### Why is PPA used?

As you can see, Ubuntu controls what software and more importantly which version of a software you get on your system. But imagine if a software developer releases a new version of the software.

Ubuntu won’t make it available immediately. There is a procedure to check if the new version of the software is compatible with the system or not. This ensures the stability of the system.

But this also means that it will be some weeks or in some cases, some months before it is made available by Ubuntu. Not everyone would want to wait that long to get their hands on the new version of their favorite software.

Similarly, suppose someone develops a software and wants Ubuntu to include that software in the official repositories. It again will take months before Ubuntu makes a decision and includes it in the official repositories.

Another case would be during beta testing. Even if a stable version of the software is available in the official repositories, a software developer may want some end users to test their upcoming release. How do they enable the end user to beta test the upcoming release?

Enter PPA!

### How to use PPA? How does PPA work?

[PPA][7], as I already told you, means Personal Package Archive. Mind the word ‘Personal’ here. That gives the hint that this is something exclusive to a developer and is not officially endorsed by the distribution.

Ubuntu provides a platform called Launchpad that enables software developers to create their own repositories. An end user i.e. you can add the PPA repository to your sources.list and when you update your system, your system would know about the availability of this new software and you can install it using the standard sudo apt install command like this.

`sudo add-apt-repository ppa:dr-akulavich/lighttable`
`sudo apt-get update`
`sudo apt-get install lighttable-installer`

To summarize:

  * sudo add-apt-repository <PPA_info> <– This command adds the PPA repository to the list.
  * sudo apt-get update <– This command updates the list of the packages that can be installed on the system.
  * sudo apt-get install <package_in_PPA> <– This command installs the package.



You see that it is important to use the command sudo apt update or else your system will not know when a new package is available.

Now let’s take a look at the first command in a bit more detail.

```
sudo add-apt-repository ppa:dr-akulavich/lighttable
```

You would notice that this command doesn’t have a URL to the repository. This is because the tool has been designed to abstract the information about URL from you.

Just a small note. If you add ppa:dr-akulavich/lighttable, you get Light Table. But if you add ppa:dr-akulavich, you’ll get all the repository or packages mentioned in the ‘upper repository’. It’s hierarchical.

Basically, when you add a PPA using add-apt-repository, it will do the same action as if you manually run these commands:

```
deb http://ppa.launchpad.net/dr-akulavich/lighttable/ubuntu YOUR_UBUNTU_VERSION_HERE main
deb-src http://ppa.launchpad.net/dr-akulavich/lighttable/ubuntu YOUR_UBUNTU_VERSION_HERE main
```

The above two lines are the traditional way to add any repositories to your sources.list. But PPA does it automatically for you, without wondering about the exact repository URL and operating system version.

One important thing to not here is that when you use PPA, it doesn’t change your original sources.list. Instead, it creates two files in /etc/apt/sources.d directory, a list and a back up file with suffix ‘save’.

![Using a PPA in Ubuntu][8]PPA create separate sources.list

The files with suffix ‘list’ has the command that adds the information about the repository.

![PPA add repository information][9]Content of source.list of a PPA

This is a safety measure to ensure that adding PPAs don’t mess with the original sources.list. It also helps in removing the PPA.

#### Why PPA? Why not DEB packages?

You may ask why should you use PPA when it involves using command line which might not be preferred by everyone. Why not just distribute a DEB package that can be installed graphically?

The answer lies in the update procedure. If you install a software using a DEB package, there is no guarantee that the installed software will be updated to a newer version when you run sudo apt update && sudo apt upgrade.

It’s because the apt upgrade procedure relies on the sources.list. If there is no entry for a software, it doesn’t get the update via the standard software updater.

So does it mean software installed using DEB never gets an update? No, not really. It depends on how the package was created.

Some developers automatically add an entry to the sources.list and then it is updated like a regular software. Google Chrome is one such example.

Some software would notify you of availability of a new version when you try to run it. You’ll have to download the new DEB package and run it again to update the current software to a newer version. Oracle Virtual Box is an example in this case.

For the rest of the DEB packages, you’ll have to manually look for an update and this is not convenient, especially if your software is meant for beta testers. You need to add more updates frequently. This is where PPA come to the rescue.

#### Offical PPA vs unofficial PPA

You may also hear the term official PPA or unofficial PPA. What’s the difference?

When developers create PPA for their software, it is called the official PPA. Quite obviously because it is coming from none other than the project developers.

But at times, individuals create PPA of projects that were created by other developers.

Why would someone do that? Because many developers just provide the source code of the software and you know that [installing software from source code in Linux][10] is a pain and not everyone could or would do that.

This is why volunteers take it upon themselves to create a PPA from those source code so that other users can install the software easily. After all, using those 3 lines is a lot easier than battling the source code installation.

#### Make sure that a PPA is available for your distribution version

When it comes to using PPA in Ubuntu or any other Debian based distribution, there are a few things you should keep in mind.

Not every PPA is available for your particular version. You should know [which Ubuntu version][11] you are using. The codename of the release is important because when you go to the webpage of a certain PPA, you can see which Ubuntu versions are supported by the PPA.

For other Ubuntu-based distributions, you can check the content of /etc/os-release to [find out the Ubuntu version][11] information.

![Verify PPA availability for Ubuntu version][12]Check if PPA is available for your Ubuntu version

How to know the PPA url? Simply search on the internet with the PPA name like ppa:dr-akulavich/lighttable and you’ll get the first result from [Launchpad][13], the official platform for hosting PPA. You can also go to Launchpad and search for the required PPA directly there.

If you don’t verify and add the PPA, you may see an error like this when you try to install a software not available for your version.

```
E: Unable to locate package
```

What’s worse is that since it has been added to your source.list, each time you run software updater, you’ll see an error “[Failed to download repository information][14]“.

![Failed to download repository information Ubuntu 13.04][15]

If you run sudo apt update in the terminal, the error will have more details about which repository is causing the trouble. You can see something like this in the end of the output of sudo apt update:

```
W: Failed to fetch http://ppa.launchpad.net/venerix/pkg/ubuntu/dists/raring/main/binary-i386/Packages  404  Not Found
E: Some index files failed to download. They have been ignored, or old ones used instead.
```

Which is self-explanatory because the system cannot find the repository for your version. Remember what we saw earlier about repository structure? APT will try to look for software information in the place <http://ppa.launchpad.net/\><PPA_NAME>/ubuntu/dists/Ubuntu_Version

And if the PPA for the specific version is not available, it will never be able to open the URL and you get the famous 404 error.

#### Why are PPAs not available for all the Ubuntu release versions?

It is because someone has to compile the software and create a PPA out of it on the specific versions. Considering that a new Ubuntu version is released every six months, it’s a tiresome task to update the PPA for every Ubuntu release. Not all developers have time to do that.

#### How to install the application if PPA is not available for your version?

It is possible that though the PPA is not available for your Ubuntu version, you could still download the DEB file and install the application

Let’s say that you go to the Light Table PPA. Using the knowledge about PPA you just learned, you realize that the PPA is not available for your specific Ubuntu release.

What you can do is to click on the ‘View package details’.

![Get DEB file from PPA][16]

And in here, you can click on a package to reveal more details. You’ll also find the source code and the DEB file of the package here.

![Download DEB file from PPA][17]

I advise [using Gdebi to install these DEB files][18] instead of the Software Center because Gdebi is a lot better at handling dependencies.

Do note that the package installed this way might not get any future updates.

I think you have read enough about adding PPAs. How about removing a PPA and the software installed by it?

### How to delete PPA?

I have written about [deleting PPA][19] in the past. I am going to describe the same methods here as well.

I advise deleting the software that you installed from a PPA before removing the PPA. If you just remove the PPA, the installed software remains in the system but it won’t get any updates. You wouldn’t want that, would you?

So, the question comes, how to know which application was installed by which PPA?

#### Find packages installed by a PPA and remove them

Ubuntu Software Center doesn’t help here. You’ll have to use Synaptic package manager here which has more advanced features.

You can install Synaptic from Software Center or use the command below:

```
sudo apt install synaptic
```

Once installed, start Synaptic package manager and select Origin. You’ll see various repositories added to the system. PPA entries will be labeled with prefix PPA. Click on them to see the packages that are available by the PPA. Installed software will have appropriate symbol before it.

![Managing PPA with Synaptic package manager][20]Find packages installed via a PPA

Once you have found the packages, you can delete them from Synaptic itself. Otherwise, you always have the option to use the command line:

```
sudo apt remove package_name
```

Once you have removed the packages installed by a PPA, you can continue to remove the PPA from your sources.list.

#### Remove a PPA graphically

Go to Software & Updates and then go to tab Other Software. Look for the PPA that you want to remove:

![Delete a PPA from Software Source][21]

You have two options here. Either you deselect the PPA or you choose the Remove option.

The difference is that when you deselect a PPA entry, your system will comment out the repository entry in its ppa_name.list file in /etc/apt/sources.list.d but if you choose the Remove option, it will delete the repository entry from its ppa_name.list file in /etc/apt/sources.list.d directory.

In both the cases, the files ppa_name.list remains in the said directory, even if it is empty.

### Is it safe to use PPA?

It is a subjective question. Purists abhor PPA because most of the time PPAs are from third-party developers. But at the same time, PPAs are popular in the Debian/Ubuntu world as they provide an easier installation option.

As far as the security is concerned, it’s less likely that you use a PPA and your Linux system is hacked or injected with malware. I don’t recall such an incident ever happened so far.

Official PPAs can be used without thinking twice. Using unofficial PPA is entirely your decision.

As a rule of thumb, you should avoid installing a program via a third party PPA if it the program requires sudo access to run.

### What do you think about using PPA?

I know it’s a long read but I wanted to give you a better understanding of PPA. I hope this detailed guide answered most of your questions about using PPA.

If you have more questions about PPA, please feel free to ask in the comment section.

If you notice any technical or grammatical error or if you have suggestions for improving this article, please let me know.

--------------------------------------------------------------------------------

via: https://itsfoss.com/ppa-guide/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/remove-install-software-ubuntu/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/12/what-is-ppa.png?resize=800%2C450&ssl=1
[3]: http://archive.ubuntu.com/ubuntu/dists/
[4]: http://archive.ubuntu.com/ubuntu/dists/xenial/main/
[5]: https://wiki.debian.org/Apt
[6]: https://itsfoss.com/apt-command-guide/
[7]: https://launchpad.net/ubuntu/+ppas
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/01/ppa-sources-list-files.png?resize=800%2C259&ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/01/content-of-ppa-list.png?ssl=1
[10]: https://itsfoss.com/install-software-from-source-code/
[11]: https://itsfoss.com/how-to-know-ubuntu-unity-version/
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2017/12/verify-ppa-availibility-version.jpg?resize=800%2C481&ssl=1
[13]: https://launchpad.net/
[14]: https://itsfoss.com/failed-to-download-repository-information-ubuntu-13-04/
[15]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2013/04/Failed-to-download-repository-information-Ubuntu-13.04.png?ssl=1
[16]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/12/deb-from-ppa.jpg?resize=800%2C483&ssl=1
[17]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/12/deb-from-ppa-2.jpg?resize=800%2C477&ssl=1
[18]: https://itsfoss.com/gdebi-default-ubuntu-software-center/
[19]: https://itsfoss.com/how-to-remove-or-delete-ppas-quick-tip/
[20]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/01/ppa-synaptic-manager.jpeg?resize=800%2C394&ssl=1
[21]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2012/08/Delete-a-PPA.jpeg?ssl=1

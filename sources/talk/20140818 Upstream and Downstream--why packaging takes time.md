Upstream and Downstream: why packaging takes time
================================================================================
Here in the KDE office in Barcelona some people spend their time on purely upstream KDE projects and some of us are primarily interested in making distros work which mean our users can get all the stuff we make. I've been asked why we don't just automate the packaging and go and do more productive things. One view of making on a distro like Kubuntu is that its just a way to package up the hard work done by others to take all the credit. I don't deny that, but there's quite a lot to the packaging of all that hard work, for a start there's a lot of it these days.

"KDE" used to be released once every nine months or less frequently. But yesterday I released the [first bugfix update to Plasma][1], to make that happen I spent some time on Thursday with David making the [first update to Frameworks 5][2]. But Plasma 5 is still a work in progress for us distros, let's not forget about [KDE SC 4.13.3][3] which Philip has done his usual spectacular job of updating in the 14.04 LTS archive or [KDE SC 4.14 betas][4] which Scarlett has been packaging for utopic and backporting to 14.04 LTS. KDE SC used to be 20 tars, now it's 169 and over 50 langauge packs. 

### Patches ###

If we were packaging it without any automation as used to be done it would take an age but of course we do automate the repetative tasks, the [KDE SC 4.13.97 status][5] page shows all the packages and highlights obvious problems. But with 169 tars even running the automated script takes a while, then you have to fix any patches that no longer apply. We have [policies][6] to disuade having patches, any patches should be upstream in KDE or on their way upstream, but sometimes it's unavoidable that we have some to maintain which often need small changes for each upstream release.

### Symbols ###

Much of what we package are libraries and if one small bit changes in the library, any applications which use that library will crash. This is ABI and the rules for [binary compatibility][7] in C++ are nuts. Not infrequently someone in KDE will alter a library ABI without realising. So we maintain symbol files to list all the symbols, these can often feel like more trouble than they're worth because they need updated when a new version of GCC produces different symbols or when symbols disappear and on investigation they turn out to be marked private and nobody will be using them anyway, but if you miss a change and apps start crashing as nearly happened in KDE PIM last week then people get grumpy.

### Copyright ###

Debian, and so Ubuntu, documents the copyright licence of every files in every package. This is a very slow and tedious job but it's important that it's done both upstream and downstream because it you don't people won't want to use your software in a commercial setting and at worst you could end up in court. So I maintain the [licensing policy][8] and not infrequently have to fix bits which are incorrectly or unclearly licenced and answer questions such as today I was reviewing whether a kcm in frameworks had to be LGPL licenced for Eike. We write a copyright file for every package and again this can feel like more trouble than its worth, there's no easy way to automate it but by some readings of the licence texts it's necessary to comply with them and it's just good practice. It also means that if someone starts making claims like requiring licencing for already distributed binary packages I'm in an informed position to correct such nonsense.

### Descriptions ###

When we were packaging KDE Frameworks from scratch we had to find a descirption of each Framework. Despite policies for metadata some were quite underdescribed so we had to go and search for a sensible descirption for them. Infact not infrequently we'll need to use a new library which doesn't even have a sensible paragraph describing what it does. We need to be able to make a package show something of a human face.

### Multiarch ###

A recent addition to the world of .deb packaging is [MultiArch][9] which allows i386 packages to be installed on amd64 computers as well as some even more obscure combinations (powerpc on ppcel64 anyone?). This lets you run Skype on your amd64 computer without messy cludges like the ia32-libs package. However it needs quite a lot of attention from packagers of libraries marking which packages are multiarch, which depend on other multiarch or arch independent packages and even after packaging KDE Frameworks I'm not entirely comfortable with doing it.

### Splitting up Packages ###

We spend lots of time splitting up packages. When say Calligra gets released it's all in one big tar but you don't want all of it on your system because you just want to write a letter in Calligra Words and Krita has lots of image and other data files which take up lots of space you don't care for. So for each new release we have to work out which of the installed files go into which .deb package. It takes time and even worse occationally we can get it wrong but if you don't want heaps of stuff on your computer you don't need then it needs to be done. It's also needed for library upgrades, if there's a new version of libfoo and not all the programs have been ported to it then you can install libfoo1 and libfoo2 on the same system without problems. That's not possible with distros which don't split up packages.

One messy side effect of this is that when a file moves from one .deb to another .deb made by the same sources, maybe Debian chose to split it another way and we want to follow them, then it needs a Breaks/Replaces/Conflicts added. This is a pretty messy part of .deb packaging, you need to specify which version it Breaks/Replaces/Conflicts and depending on the type of move you need to specify some combination of these three fields but even experienced packages seem to be unclear on which. And then if a backport (with files in original places) is released which has a newer version than the version you specify in the Breaks/Replaces/Conflicts it just refuses to install and stops half way through installing until a new upload is made which updates the Breaks/Replaces/Conflicts version in the packaging. I'd be interested in how this is solved in the RPM world.

### Debian Merges ###

Ubuntu is forked from Debian and to piggy back on their work (and add our own bugs while taking the credit) we merge in Debian's packaging at the start of each cycle. This is fiddly work involving going through the diff (and for patches that's often a diff of a diff) and changelog to work out why each alternation was made. Then we merge them together, it takes time and it's error prone but it's what allows Ubuntu to be one of the most up to date distros around even while much of the work gone into maintaining universe packages not part of some flavour has slowed down.

### Stable Release Updates ###

You have Kubuntu 14.04 LTS but you want more? You want bugfixes too? Oh but you want them without the possibility of regressions? Ubuntu has quite strict definition of what's allowed in after an Ubuntu release is made, this is because once upon a time someone uploaded a fix for X which had the side effect of breaking X on half the installs out there. So for any updates to get into the archive they can only be for certain packages with a track record of making bug fix releases without sneaking in new features or breaking bits. They need to be tested, have some time passed to allow for wider testing, be tested again using the versions compiled in Launchpad and then released. KDE makes bugfix releases of KDE SC every month and we update them in the latest stable and LTS releases as [4.13.3 was this week][10]. But it's not a process you can rush and will take a couple of weeks usually. That 4.13.3 update was even later then usual because we were busy with Plasma 5 and whatnot. And it's not perfect, a bug in Baloo did get through with 4.13.2. But it would be even worse if we did rush it.

### Backports ###

Ah but you want new features too? We don't allow in new features into the normal updates because they will have more chance of having regressions. That's why we make backports, either in the kubuntu-ppa/backports archive or in the ubuntu backports archive. This involves running the package through another automation script to change whever needs changed for the backport then compiling it all, testing it and releasing it. Maintaining and running that backport script is quite faffy so sending your thanks is always appreciated.

We have an allowance to upload new bugfix (micro releases) of KDE SC to the ubuntu archive because KDE SC has a good track record of fixing things and not breaking them. When we come to wanting to update Plasma we'll need to argue for another allowance. One controvertial issue in KDE Frameworks is that there's no bugfix releases, only monthly releases with new features. These are unlikely to get into the Ubuntu archive, we can try to argue the case that with automated tests and other processes the quality is high enough, but it'll be a hard sell.

### Crack of the Day ###

Project Neon provides packages of daily builds of parts of KDE from Git. And there's weekly ISOs that are made from this too. These guys rock. The packages are monolithic and install in /opt to be able to live alongside your normal KDE software.

### Co-installability ###

You should be able to run KDELibs 4 software on a Plasma 5 desktop. I spent quite a bit of time ensuring this is possible by having no overlapping files in kdelibs/kde-runtime and kde frameworks and some parts of Plasma. This wasn't done primarily for Kubuntu, many of the files could have been split out into .deb packages that could be shared between KDELibs 4 and Plasma 5, but other disros which just installs packages in a monolithic style benefitted. Some projects like Baloo didn't ensure they were co-installable, fine for Kubuntu as we can separate the libraries that need to be coinstalled from the binaries, but other distros won't be so happy.

### Automated Testing ###

Increasingly KDE software comes with its own test suite. Test suites are something that has been late coming to free software (and maybe software in general) but now it's here we can have higher confidence that the software is bug free. We run these test suites as part of the package compilation process and not infrequently find that the test suite doesn't run, I've been told that it's not expected for packagers to use it in the past. And of course tests fail.

### Obscure Architectures ###

In Ubuntu we have some obscure architectures. 64-bit Arm is likely to be a useful platform in the years to come. I'm not sure why we care about 64-bit powerpc, I can only assume someone has paid Canonical to care about it. Not infrequently we find software compiles fine on normal PCs but breaks on these obscure platforms and we need to debug why they is. This can be a slow process on ARM which takes an age to do anything, or very slow where I don't even have access to a machine to test on, but it's all part of being part of a distro with many use-cases.

### Future Changes ###

At Kubuntu we've never shared infrstructure with Debian despite having 99% the same packaging. This is because Ubuntu to an extent defines itself as being the technical awesomeness of Debian with smoother processes. But for some time Debian has used git while we've used the slower bzr (it was an early plan to make Ubuntu take over the world of distributed revision control with Bzr but then Git came along and turned out to be much faster even if harder to get your head around) and they've also moved to team maintainership so at last we're planning [shared repositories][11]. That'll mean many changes in our scripts but should remove much of the headache of merges each cycle.

There's also a proposal to [move our packaging to daily builds][12] so we won't have to spend a lot of time updating packaging at every release. I'm skeptical if the hassle of the infrastructure for this plus fixing packaging problems as they occur each day will be less work than doing it for each release but it's worth a try.

### ISO Testing ###

Every 6 months we make an Ubuntu release (which includes all the flavours of which Ubuntu [Unity] is the flagship and Kubuntu is the most handsome) and there's alphas and betas before that which all need to be tested to ensure they actually install and run. Some of the pain of this has reduced since we've done away with the alternative (text debian-installer) images but we're nowhere near where Ubuntu [Unity] or OpenSUSE is with OpenQA where there are automated installs running all the time in various setups and some magic detects problems. I'd love to have this set up.

I'd welcome comments on how any workflow here can be improved or how it compares to other distributions. It takes time but in Kubuntu we have a good track record of contributing fixes upstream and we all are part of KDE as well as Kubuntu. As well as the tasks I list above about checking copyright or co-installability I do Plasma releases currently, I just saw Harald do a Phonon release and Scott's just applied for a KDE account for fixes to PyKDE. And as ever we welcome more people to join us, we're in #kubuntu-devel where free hugs can be found, and we're having a whole day of Kubuntu love at Akademy.

--------------------------------------------------------------------------------

via: https://blogs.kde.org/2014/08/13/upstream-and-downstream-why-packaging-takes-time

作者：[Jonathan Riddell][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://blogs.kde.org/users/jriddell
[1]:https://dot.kde.org/2014/08/12/first-bugfix-update-plasma-5
[2]:https://dot.kde.org/2014/08/07/kde-frameworks-5.1
[3]:http://www.kubuntu.org/news/kde-sc-4.13.3
[4]:https://dot.kde.org/2014/07/18/kde-ships-july-updates-and-second-beta-applications-and-platform-414
[5]:http://qa.kubuntu.co.uk/ninjas-status/build_status_4.13.97_utopic.html
[6]:https://community.kde.org/Kubuntu/Policies
[7]:https://techbase.kde.org/Policies/Binary_Compatibility_Issues_With_C++
[8]:https://techbase.kde.org/Policies/Licensing_Policy
[9]:https://help.ubuntu.com/community/MultiArch
[10]:http://www.kubuntu.org/news/kde-sc-4.13.3
[11]:http://lists.alioth.debian.org/pipermail/pkg-kde-talk/2014-August/001934.html
[12]:https://lists.ubuntu.com/archives/kubuntu-devel/2014-August/008651.html
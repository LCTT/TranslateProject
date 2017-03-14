translating by cycoe

# Fedora 25: Wayland vs Xorg

Almost as good as Alien vs Predator only much better. Anyhow, as you probably know, I have recently tested [Fedora 25][1]. It was an okay experience. Overall, the distro behaved reasonably well. Not the fastest, but stable enough, usable enough, with some neat improvements here and there. Most importantly, apart from some performance and responsiveness loss, Wayland did not cause my system to melt. But that's just a beginning.

Wayland is in its infancy as a consumer technology, or at least that thing that people take for granted when they do desktop stuff. Therefore, I must continue testing. Never surrender. In the past few weeks of actively using Fedora 25, I did come across a few other issues and problems, some less worrying, some quite disturbing, some odd, some meaningless. Let us elaborate.

 ![Teaser](http://www.dedoimedo.com/images/computers-years/2016-2/fedora-wayland-xorg-teaser.jpg) 

Note: Image taken from [Wikimedia][2] and modified, licensed under [CC BY-SA 3.0][3].

### Wayland does not support everything

Nope. 'Tis a fact. If you go about a Web, doing some reading, you will have learned that all sorts of things are not yet Wayland-ready. Still, we all know Fedora is the state-of-art bleeding-edge distro, and so it's a testbed for pain and discovery. Fair enough. For a while, things were quite all right, no fuss, no errors, but then, I suddenly needed to use GParted. I was in a hurry, troubleshooting a big issue, and now I had to sidetrack myself with pointless extra work. GParted would just not launch under Wayland. Exploring in a bit more detail, I learned that this partitioning software was not supported yet.

 ![GParted does not run under Wayland](http://www.dedoimedo.com/images/computers-years/2016-2/fedora-wayland-xorg-gparted.jpg) 

And the thing is, I do not really know what other applications do not work under Wayland, and I am not really keen to discover that in a moment of true reckoning. Searching online, I wasn't able to find a quick, easy list that details the current incompatibilities. Maybe it's me, and I suck at searching, but something as trivial as "Wayland + compatibility" should be obvious.

What I did find is a [self-argument][4] telling us why Wayland is good, a list of [Gnome][5] applications currently supported under this new thingie, several nerdy pages on ArchWiki, a super-nerdy slit-my-wrists topic on [Nvidia][6]devtalk, and a few other ambiguous discussions.

### Performance, again

On the Fedora 25 box, I changed the login session from Gnome (Wayland) to Gnome Xorg, to see how this affects the system. I didpreviously mention the performance benchmarks and comparison to [Fedora 24][7] on the same laptop - [Lenovo G50][8], but this should give us even more accurate results.

Wayland (screenshot 1) gives us 1.4GB memory use without anything else running, and the CPU averages about 4-5%. Xorg (screenshot 2) tolls the same amount of RAM, and the processor eats 3-4% of its full power. Marginally less in sheer numbers. But then, the experience in the Xorg session is just so much better. It's milliseconds alright, but you can feel it. The legacy session seems to be ever so slightly sprightlier, faster, fresher. The lag is less noticeable. If you are sensitive as to how your desktop responds, you will not be happy with this penalty. Sure, this may only be a bit of sub-optimized beginner's luck, and Wayland may improve over time. But it's also something we cannot ignore.

 ![Wayland resources](http://www.dedoimedo.com/images/computers-years/2016-2/fedora-wayland-xorg-resources-wayland.jpg) 

 ![Xorg resources](http://www.dedoimedo.com/images/computers-years/2016-2/fedora-wayland-xorg-resources-xorg.jpg) 

### Let's rant

I am not happy with this. Not massively angry, but I don't like that I actually need to login into the classic X session to be able to fully enjoy my desktop experience. Because X gives me 100%. Wayland does not. That means, at the end of the day, I will not be using Wayland. I like exploring technology, but I am not a zealot on some holy big-endian pilgrimage. I just want to use my desktop, and sometimes, I might even need things fast. Logging out and back in can be an annoying hassle in a moment of need. And the reason why we have this issue is because Wayland is not there to make life easier for Linux desktop users. Quite the opposite. Quote:

Wayland is intended as a simpler replacement for X, easier to develop and maintain. GNOME and KDE are expected to be ported to it.

And you see, that's part of the problem. Stuff should not be designed to be easier to developer or maintain. That can be a beneficial by-product provided all other customer requirements are met. But if they are not, then it does not matter how hard or simple it is for programmers to hammer code. That's their job. The whole purpose of technology is to support the end state - in this case, a seamless and smooth user experience.

Unfortunately, a large number of products today are being re-invented and re-developed for the sake of making it easier for software people and not for the users. To a large extent, Gnome 3, PulseAudio, [Systemd][9], and Wayland, they all serve no higher user experience purpose. They are quite intrusive in that sense, and they do not contribute to the stability and simplicity of the Linux desktop ecosystem.

This is one of primary reasons why Linux desktop is a relatively immature product - it is designed to self-support the people developing it, almost like a living organism. It's not there to be the slave to the whims and wishes of the user. And that's how great things are done. You satisfy the primary need, and only then worry about the details. Great user experience does not depend - and should never depend - on the choice of programming language, compiler or any nonsense like that. If it does, that whoever designed the product has not done the abstraction piece well enough, and we have a failed thing that needs to be removed from existence.

And so, from my perspective, I don't care if it takes 10 liters of blood to compile one version of X or whatever. I'm a user. All I care is that my desktop works as robustly as did it yesterday or 5 years ago. If that's not happening, I'm not interested in macros, classes, variables, declarations, structs, or any other geeky CS technobabble. That's irrelevant. And a product that advertises itself as being created to be convenient for the people developing it is a paradox. Don't develop it, then. Makes things even easier.

Now, the reality is, Wayland is largely ok - but it is still not as good as X, and as such it should not be offered as a production-ready item on any desktop. Once it can replace the old technology so seamlessly no one ever knows about it, only then will it have succeeded in what it needs to achieve, and then, it can be written in C or D or K language, and it can have anything the developers want. Until then, it's a parasite that eats on the resources and peoples' nerves.

Don't get me wrong. We need progress. We need change. But it has to serve an evolutionary purpose. Does X handle the user needs well today? Can it do graphics support for 3rd party blobs? Can it support HD and UHD and DPI and whatnot? Can you play the latest games on it? Yes? No? If not, then it needs to be fixed. Those are the evolutionary drivers. Not the difficulty of writing and compiling code. Software developers are the coal miners of the digital industry, and they need to work hard to make users happy. As a phrase 'easier to develop' should be outlawed, and people who like it need to be electrocuted by old radio batteries and then exiled to Mars in non-A/C spaceships. If you can't write smart code, it's your problem. The user should not suffer because developers think they're princesses.

### Conclusion

Here we are. In general, Wayland is not bad. It's okay. But that's like saying you are earning 83% today compared to 100% yesterday only because someone decided to change the layout of your payslip. Not acceptable in that sense, even if Wayland works fairly well. It's the stuff that does not work that makes all the difference. Ignoring the whole rant side of it, Wayland introduced reduced usability, performance and app wise, and this is something Fedora will have to sort out fast.

Other distros will follow, and we will be seeing a recurring pattern. The same happened with Gnome 3\. The same happened with Systemd. Less than fully ready technologies are unleashed into the open, and then we spend a year or two fixing things that needed no fixing, and eventually, we will have the same functionality we already have, only created in a different programming language. Not interested. CS used to be all glamor in 1999, when Excel users were making USD50/hour. Today, programming is the undeserving oar galley, and people don't care for the sweat and blister under the deck.

Performance is probably less of an issue, because you can give up on 1-2% change, especially since it can randomly come from any which factor. You will know this if you've used Linux for more than a year or two. But not being able to launch programs is a big deal. At the very least, Fedora graciously offers the legacy platform, too. But then, it may be gone before Wayland reaches 100% maturity. Here we go again. So no, there's no disaster. My original Fedora 25 claim stands in this regard. What we have is annoyance. Unnecessary annoyance. Ah well. The story of Linux, part 9000.

And so, at the end of the day, with everything said and done, what we learned here is: KNEEL BEFORE XORG! OMG. That's so good, I will now fade into the background while the chuckles off your merriment carry off into the frosty night. So long.

Cheers.

--------------------------------------------------------------------------------



作者简介：

My name is Igor Ljubuncic. I'm more or less 38 of age, married with no known offspring. I am currently working as a Principal Engineer with a cloud technology company, a bold new frontier. Until roughly early 2015, I worked as the OS Architect with an engineering computing team in one of the largest IT companies in the world, developing new Linux-based solutions, optimizing the kernel and hacking the living daylights out of Linux. Before that, I was a tech lead of a team designing new, innovative solutions for high-performance computing environments. Some other fancy titles include Systems Expert and System Programmer and such. All of this used to be my hobby, but since 2008, it's a paying job. What can be more satisfying than that?

From 2004 until 2008, I used to earn my bread by working as a physicist in the medical imaging industry. My work expertise focused on problem solving and algorithm development. To this end, I used Matlab extensively, mainly for signal and image processing. Furthermore, I'm certified in several major engineering methodologies, including MEDIC Six Sigma Green Belt, Design of Experiment, and Statistical Engineering.

I also happen to write books, including high fantasy and technical work on Linux; mutually inclusive.

Please see my full list of open-source projects, publications and patents, just scroll down.

For a complete list of my awards, nominations and IT-related certifications, hop yonder and yonder please.


-------------


via: http://www.dedoimedo.com/computers/fedora-25-wayland-vs-xorg.html

作者：[Igor Ljubuncic][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.dedoimedo.com/faq.html

[1]:http://www.dedoimedo.com/computers/fedora-25-gnome.html
[2]:https://commons.wikimedia.org/wiki/File:DragonCon-AlienVsPredator.jpg
[3]:https://creativecommons.org/licenses/by-sa/3.0/deed.en
[4]:https://wayland.freedesktop.org/faq.html
[5]:https://wiki.gnome.org/Initiatives/Wayland/Applications
[6]:https://devtalk.nvidia.com/default/topic/925605/linux/nvidia-364-12-release-vulkan-glvnd-drm-kms-and-eglstreams/
[7]:http://www.dedoimedo.com/computers/fedora-24-gnome.html
[8]:http://www.dedoimedo.com/computers/lenovo-g50-distros-second-round.html
[9]:http://www.ocsmag.com/2016/10/19/systemd-progress-through-complexity/

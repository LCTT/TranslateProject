Translating by Chao-zhi

Ubuntu’s Snap, Red Hat’s Flatpak And Is ‘One Fits All’ Linux Packages Useful?
=================================================================================

![](http://www.iwillfolo.com/wordpress/wp-content/uploads/2016/06/Flatpak-and-Snap-Packages.jpg)

An in-depth look into the new generation of packages starting to permeate the Linux ecosystem.


Lately we’ve been hearing more and more about Ubuntu’s Snap packages and Flatpak (formerly referred to as xdg-app) created by Red Hat’s employee Alexander Larsson.

These 2 types of next generation packages are in essence having the same goal and characteristics which are: being standalone packages that doesn’t rely on 3rd-party system libraries in order to function.

This new technology direction which Linux seems to be headed is automatically giving rise to questions such as, what are the advantages / disadvantages of standalone packages? does this lead us to a better Linux overall? what are the motives behind it?

To answer these questions and more, let us explore the things we know about Snap and Flatpak so far.

### The Motive

According to both [Flatpak][1] and [Snap][2] statements, the main motive behind them is to be able to bring one and the same version of application to run across multiple Linux distributions.

>“From the very start its primary goal has been to allow the same application to run across a myriad of Linux distributions and operating systems.” Flatpak

>“… ‘snap’ universal Linux package format, enabling a single binary package to work perfectly and securely on any Linux desktop, server, cloud or device.” Snap

To be more specific, the guys behind Snap and Flatpak (S&F) believe that there’s a barrier of fragmentation on the Linux platform.

A barrier which holds back the platform advancement by burdening developers with more, perhaps unnecessary, work to get their software run on the many distributions out there.

Therefore, as leading Linux distributions (Ubuntu & Red Hat), they wish to eliminate the barrier and strengthen the platform in general.

But what are the more personal gains which motivate the development of S&F?

#### Personal Gains?

Although not officially stated anywhere, it may be assumed that by leading the efforts of creating a unified package that could potentially be adopted by the vast majority of Linux distros (if not all of them), the captains of these projects could assume a key position in determining where the Linux ship sails.

### The Advantages

The benefits of standalone packages are diverse and can depend on different factors.

Basically however, these factors can be categorized under 2 distinct criteria:

#### User Perspective

+ From a Linux user point of view, Snap and Flatpak both bring the possibility of installing any package (software / app) on any distribution the user is using.

That is, for instance, if you’re using a not so popular distribution which has only a scarce supply of packages available in their repo, due to workforce limitations probably, you’ll now be able to easily and significantly increase the amount of packages available to you – which is a great thing.

+ Also, users of popular distributions that do have many packages available in their repos, will enjoy the ability of installing packages that might not have behaved with their current set of installed libraries.

For example, a Debian user who wants to install a package from ‘testing branch’ will not have to convert his entire system into ‘testing’ (in order for the package to run against newer libraries), rather, that user will simply be able to install only the package he wants from whichever branch he likes and on whatever branch he’s on.

The latter point, was already basically possible for users who were compiling their packages straight from source, however, unless using a source based distribution such as Gentoo, most users will see this as just an unworthily hassle.

+ The advanced user, or perhaps better put, the security aware user might feel more comfortable with this type of packages as long as they come from a reliable source as they tend to provide another layer of isolation since they are generally isolated from system packages.

* Both S&F are being developed with enhanced security in mind, which generally makes use of “sandboxing” i.e isolation in order to prevent cases where they carry a virus which can infect the entire system, similar to the way .exe files on MS Windows may. (More on MS and S&F later)

#### Developer Perspective

For developers, the advantages of developing S&F packages will probably be a lot clearer than they are to the average user, some of these were already hinted in a previous section of this post.

Nonetheless, here they are:

+ S&F will make it easier on devs who want to develop for more than one Linux distribution by unifying the process of development, therefore minimizing the amount of work a developer needs to do in order to get his app running on multiple distributions.

++ Developers could therefore gain easier access to a wider range of distributions.

+ S&F allow devs to privately distribute their packages without being dependent on distribution maintainers to stabilize their package for each and every distro.

++ Through the above, devs may gain access to direct statistics of user adoption / engagement for their software.

++ Also through the above, devs could get more directly involved with users, rather than having to do so through a middleman, in this case, the distribution.

### The Downsides

– Bloat. Simple as that. Flatpak and Snap aren’t just magic making dependencies evaporate into thin air. Rather, instead of relying on the target system to provide the required dependencies, S&F comes with the dependencies prebuilt into them.

As the saying goes “if the mountain won’t come to Muhammad, Muhammad must go to the mountain…”

– Just as the security-aware user might enjoy S&F packages extra layer of isolation, as long they come from a trusted source. The less knowledgeable user on the hand, might be prone to the other side of the coin hazard which is using a package from an unknown source which may contain malicious software.

The above point can be said to be valid even with today’s popular methods, as PPAs, overlays, etc might also be maintained by untrusted sources.

However, with S&F packages the risk increases since malicious software developers need to create only one version of their program in order to infect a large number of distributions, whereas, without it they’d needed to create multiple versions in order to adjust their malware to other distributions.

Was Microsoft Right All Along?

With all that’s mentioned above in mind, it’s pretty clear that for the most part, the advantages of using S&F packages outweighs the drawbacks.

At the least for users of binary-based distributions, or, non lightweight focused distros.

Which eventually lead me to asking the above question – could it be that Microsoft was right all along? if so and S&F becomes the Linux standard, would you still consider Linux a Unix-like variant?

Well apparently, the best one to answer those questions is probably time.

Nevertheless, I’d argue that even if not entirely right, MS certainly has a good point to their credit, and having all these methods available here on Linux out of the box is certainly a plus in my book.


--------------------------------------------------------------------------------

via: http://www.iwillfolo.com/ubuntus-snap-red-hats-flatpack-and-is-one-fits-all-linux-packages-useful/

作者：[Editorials][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.iwillfolo.com/category/editorials/

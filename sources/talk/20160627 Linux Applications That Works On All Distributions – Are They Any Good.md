Translating by Chao-zhi

Linux Applications That Works On All Distributions – Are They Any Good?
============================================================================

![](http://www.iwillfolo.com/wordpress/wp-content/uploads/2016/06/Bundled-applications.jpg)


A revisit of Linux community’s latest ambitions – promoting decentralized applications in order to tackle distribution fragmentation.

Following last week’s article: [Ubuntu’s Snap, Red Hat’s Flatpak And Is ‘One Fits All’ Linux Packages Useful][1]?, a couple of new opinions rose to the surface which may contain crucial information about the usefulness of such apps.

### The Con Side

Commenting on the subject [here][2], a [Gentoo][3] user who goes by the name Till, gave rise to a few points which hasn’t been addressed to the fullest the last time we covered the issue.

While previously we settled on merely calling it bloat, Till here on the other hand, is dissecting that bloat further so to help us better understand both its components and its consequences.

Referring to such apps as “bundled applications” – for the way they work on all distributions is by containing dependencies together with the apps themselves, Till says:

>“bundles ship a lot of software that now needs to be maintained by the application developer. If library X has a security problem and needs an update, you rely on every single applications to ship correct updates in order to make your system save.”

Essentially, Till raises an important security point. However, it isn’t necessarily has to be tied to security alone, but can also be linked to other aspects such as system maintenance, atomic updates, etc…

Furthermore, if we take that notion one step further and assume that dependencies developers may cooperate, therefore releasing their software in correlation with the apps who use them (an utopic situation), we shall then get an overall slowdown of the entire platform development.

Another problem that arises from the same point made above is dependencies-transparency becomes obscure, that is, if you’d want to know which libraries are bundled with a certain app, you’ll have to rely on the developer to publish such data.

Or, as Till puts it: “Questions like, did package XY already include the updated library Z, will be your daily bread”.

For comparison, with the standard methods available on Linux nowadays (both binary and source distributions), you can easily notice which libraries are being updated upon a system update.

And you can also rest assure that all other apps on the system will use it, freeing you from the need to check each app individually.

Other cons that may be deduced from the term bloat include: bigger package size (each app is bundled with dependencies), higher memory usage (no more library sharing) and also –

One less filter mechanism to prevent malicious software – distributions package maintainers also serve as a filter between developers and users, helping to assure users get quality software.

With bundled apps this may no longer be the case.

As a finalizing general point, Till asserts that although useful in some cases, for the most part, bundled apps weakens the free software position in distributions (as proprietary vendors will now be able to deliver software without sharing it on public repositories).

And apart from that, it introduces many other issues. Many problems are simply moved towards the developers.

### The Pro Side

In contrast, another comment by a person named Sven tries to contradict common claims that basically go against the use of bundled applications, hence justifying and promoting the use of it.

“waste of space” – Sven claims that in today’s world we have many other things that wastes disk space, such as movies stored on hard drive, installed locals, etc…

Ultimately, these things are infinitely more wasteful than a mere “100 MB to run a program you use all day … Don’t be ridiculous.”

“waste of RAM” – the major points in favor are:

- Shared libraries waste significantly less RAM compared to application runtime data.
- RAM is cheap today.

“security nightmare” – not every application you run is actually security-critical.

Also, many applications never even see any security updates, unless on a ‘rolling distro’.

In addition to Sven’s opinions, who try to stick to the pragmatic side, a few advantages were also pointed by Till who admits that bundled apps has their merits in certain cases:

- Proprietary vendors who want to keep their code out of the public repositories will be able to do so more easily.
- Niche applications, which are not packaged by your distribution, will now be more readily available.
- Testing on binary distributions which do not have beta packages will become easier.
- Freeing users from solving dependencies problems.

### Final Thoughts

Although shedding new light onto the matter, it seems that one conclusion still stands and accepted by all parties – bundled apps has their niche to fill in the Linux ecosystem.

Nevertheless, the role that niche should take, whether main or marginal one, appears to be a lot clearer now, at least from a theoretical point of view.

Users who are looking to make their system optimized as possible, should, in the majority of cases, avoid using bundled apps.

Whereas, users that are after ease-of-use, meaning – doing the least of work in order to maintain their systems, should and probably would feel very comfortable adopting the new method.

--------------------------------------------------------------------------------

via: http://www.iwillfolo.com/linux-applications-that-works-on-all-distributions-are-they-any-good/

作者：[Editorials][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.iwillfolo.com/category/editorials/
[1]: http://www.iwillfolo.com/ubuntus-snap-red-hats-flatpack-and-is-one-fits-all-linux-packages-useful/
[2]: http://www.proli.net/2016/06/25/gnulinux-bundled-application-ramblings/
[3]: http://www.iwillfolo.com/5-reasons-use-gentoo-linux/

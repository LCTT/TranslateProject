‘Unity Greeter Badges’ Brings Missing Session Icons to Ubuntu Login Screen
================================================================================
![](http://www.omgubuntu.co.uk/wp-content/uploads/2015/01/unity-greeter-badges-750x321.jpg)

**A new package available in Ubuntu 15.04 solves a petty gripe I have with the Unity Greeter: the lack of branded icons for alternative desktop sessions like Cinnamon.**

I know it’s a minor quibble; it’s a visual paper cut with minimal impact for most. But the inconsistency niggles me because Ubuntu ships with icons for a number of sessions, including Unity, GNOME and KDE. Other DEs, including some of its own flavors like Xubuntu, default to showing a plain white dot in the session switcher list and the main user pod.

The inconsistency these dots create jars, even if it is only for a fleeting moment, not just in design. It’s in usability too. Branded glyphs are helpful in letting us know what session we’re about to log in to.

For instance, can you tell what session this is?

![](http://www.omgubuntu.co.uk/wp-content/uploads/2015/01/what-session-is-this-750x247.jpg)

Budgie? Maybe MATE? Could be Cinnamon…I’d have to click on it and check first.

It doesn’t have to be this way. The Unity Greeter is built such that the developers of desktop environments can ship badges that appear in the Greeter (and some do). But in many cases, like MATE whose packages are imported from upstream Debian, the inclination to carry an “Ubuntu-specific patch” is either not desirable or not possible.

### A Solution Is Badged ###

Experienced Debian maintainer [Doug Torrance][1] has a solution to fix this usability paper cut. Rather than rely on desktop makers themselves to add branded badges to their packages, and rather than burden Ubuntu with the responsibility of maintaining it, Torrance has created a separate ‘unity-greeter-badges’ package to house them.

In assuming responsibility for providing the session glyphs directly, this package ensure that new and old window managers, session and desktops alike are catered for.

Among the 30 or so desktop environments it bundles new session badges for are:

- Xubuntu
- Cinnamon
- MATE
- Cairo-Dock
- Xmonad
- Awesome
- OpenBox
- Pantheon

The best part is that ‘**Unity-Greeter-Badges**’ has been accepted into Ubuntu 15.04. That means Torrance’s package will be available to install directly, no PPAs or downloads needed. In not being part of a core package like the Unity Greeter it can be updated with newer icons in a more efficient and timely manner.

If you’re running Ubuntu 15.04 you will find the package available to install from the Software Center in the coming days.

Don’t want to wait until 15.04? Torrance has made .deb installers for Ubuntu 14.04 LTS and Ubuntu 14.10 users.

- [Download unity-greeter-badges for Ubuntu 14.04][2]
- [Download unity-greeter-badges for Ubuntu 14.10][3]

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2015/01/unity-greeter-badges-brings-missing-session-icons-ubuntu-login-screen

作者：[Joey-Elijah Sneddon][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:https://launchpad.net/~profzoom
[2]:https://launchpad.net/~profzoom/+archive/ubuntu/misc/+files/unity-greeter-badges_0.1-0ubuntu1%7E201412111501%7Eubuntu14.04.1_all.deb
[3]:https://launchpad.net/~profzoom/+archive/ubuntu/misc/+files/unity-greeter-badges_0.1-0ubuntu1%7E201412111501%7Eubuntu14.10.1_all.deb
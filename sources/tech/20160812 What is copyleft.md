yangmingming Translating
What is copyleft?
=============


If you've spent much time in open source projects, you have probably seen the term "copyleft" used. While the term is quite commonly used, many people don't understand it. Software licensing is the subject of at least as much heated debate as text editors or packaging formats. An expert understanding of copyleft would fill many books, but this article can be a starting point on your road to copyleft enlightenment.

## What is copyright?

Before we can understand copyleft, we must first introduce the concept of copyright. Copyleft is not a separate legal framework from copyright; copyleft exists within the rules of copyright. So what is copyright?

The exact definition varies based on jurisdiction, but the essence is this: the author of a work has a limited monopoly on the copying (hence the term "copyright"), performance, etc. of the work. In the United States, the Constitution explicitly tasks Congress for creating copyright laws in order to "promote the Progress of Science and useful Arts."

Unlike in the past, copyright attaches to a work immediately -- no registration is required. By default, all rights are reserved. That means no one can republish, perform, or modify a work without permission from the author. This permission is a "license" and may come with certain conditions attached.

For a more thorough introduction to copyright, Coursera's [Copyright for Educators & Librarians](https://www.coursera.org/learn/copyright-for-education) is an excellent resource.

## What is copyleft?

Bear with me, but there's one more step to take before we discuss what copyleft is. First, let's examine what open source means. All open source licenses, by the[Open Source Inititative's definition](https://opensource.org/osd) must, among other things, allow distribution in source form. Anyone who receives open source software has the right to inspect and modify the code.

Where copyleft licenses differ from so-called "permissive" licenses is that copyleft licenses require these same rights to be included in any derivative works. I prefer to think of the distinction in this way: permissive licenses provide the maximum freedom to the immediate downstream developers (including the ability to use the open source code in a closed source project), whereas copyleft licenses provide the maximum freedom through to the end users.

The GNU Project gives this [simple definition](https://www.gnu.org/philosophy/free-sw.en.html) of copyleft: "the rule that when redistributing the program, you cannot add restrictions to deny other people the central freedoms [of free software]." This can be considered the canonical definition, since the [GNU General Public License](https://www.gnu.org/licenses/gpl.html) (GPL) in its various versions remains the most widely-used copyleft license.

## Copyleft in software

While the GPL family are the most popular copyleft licenses, they are by no means the only ones. The [Mozilla Public License](https://www.mozilla.org/en-US/MPL/) and the [Eclipse Public License](https://www.eclipse.org/legal/epl-v10.html) are also very popular. Many [other copyleft licenses](https://tldrlegal.com/licenses/tags/Copyleft) exist with smaller adoption footprints.

As explained in the previous section, a copyleft license means downstream projects cannot add additional restrictions on the use of the software. This is best illustrated with an example. If I wrote MyCoolProgram and distributed it under a copyleft license, you would have the freedom to use and modify it. You could distribute versions with your changes, but you'd have to give your users the same freedoms I gave you. If I had licensed it under a permissive license, you'd be free to incorporate it into a closed software project that you do not provide the source to.

But just as important as what you must do with MyCoolProgram is what you don't have to do. You don't have to use the exact same license I did, so long as the terms are compatible (generally downstream projects use the same license for simplicity's sake). You don't have to contribute your changes back to me, but it's generally considered good form, especially when the changes are bug fixes.

## Copyleft in non-software

Although the notion of copyleft began in the software world, it exists outside as well. The notion of "do what you want, so long as you preserve the right for others to do the same" is the distinguishing characteristic of the [Creative Commons Attribution-ShareAlike](http://creativecommons.org/licenses/by-sa/4.0/) license used for written work, visual art, etc. (CC BY-SA 4.0 is the default license for contributions to Opensource.com.) The [GNU Free Documentation License ](https://www.gnu.org/licenses/fdl.html)is another example of a copyleft non-software license. The use of software licenses for non-software work is generally discouraged.

## Should I choose a copyleft license?

Pages and pages could be (and have been!) written about what type of license should be used for a project. My advice is to first narrow the list of licenses to ones that match your philosophy and your goals for the project. GitHub's[choosealicense.com](http://choosealicense.com/) is a good way to find a license that fits your needs. [tl;drLegal](https://tldrlegal.com/)has plain-language explanations of many common and uncommon software licenses. Also consider the ecosystem that your project lives in. Projects around a specific language or technology will often use the same or similar licenses. If you want your project to be able to play nicely, you may need to make sure the license you choose is compatible.

For more information about copyleft licensing, check out the [Copyleft Guide](https://copyleft.org/)project.


--------------------------------------------------------------------------------

via: http://linoxide.com/firewall/pfsense-setup-basic-configuration/

作者：[Ben Cotton][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bcotton

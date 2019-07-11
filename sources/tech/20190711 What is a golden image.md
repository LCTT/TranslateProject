[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What is a golden image?)
[#]: via: (https://opensource.com/article/19/7/what-golden-image)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

What is a golden image?
======
Working on projects that will be distributed widely? Learn more about
golden images so it's easy to revert to a "perfect" state if things go
wrong.
![Gold star][1]

If you’re in quality assurance, system administration, or (believe it or not) media production, you might have heard some variation of the term _gold master_, _golden image_, or _master image_, and so on. It’s a term that has made its way into the collective consciousness of anyone involved in creating one _perfect_ model and then producing many duplicates from that mold. That’s what a gold master, or golden image, is: The virtual mold from which you cast your distributable models.

In media production, the theory is that a crew works toward the gold master. This final product is one of a kind. It looks and sounds the best a movie or an album (or whatever it is) can possibly look and sound. Copies of this master image are made, compressed, and sent out to the eager public.

In software, a similar idea is associated with the term. Once software has been compiled and tested and re-tested, the perfect build is declared _gold_. No further changes are allowed, and all distributable copies are generated from this master image (this used to actually mean something, back when software was distributed on CDs or DVDs).

And in system administration, you may encounter golden images of an organization’s chosen operating system, with the important settings *baked in—*the virtual private network (VPN) certificates are already in place, incoming email servers are already set in the email client, and so on. Similarly, you might also hear this term in the world of virtual machines (VMs), where a _golden image_ of a carefully configured virtual drive is the source from which all new virtual machines are cloned.

### GNOME Boxes

The concept of a gold master is simple, but putting it into practice is often overlooked. Sometimes, your team is just so happy to have reached their goal that no one stops to think about designating the achievement as the authoritative version. At other times, there’s no simple mechanism for doing this.

A golden image is equal parts historical preservation and a backup plan in advance. Once you craft a perfect model of whatever it is you were toiling over, you owe it to yourself to preserve that work, because it not only marks your progress, but it serves as a fallback should you stumble as you continue your work.

[GNOME Boxes][2], the virtualization platform that ships with the GNOME desktop, can provide a simple demonstration. If you’ve never used GNOME Boxes, you can learn the basics from Alan Formy-Duval in his article [Getting started with GNOME Boxes][3].

Imagine that you used GNOME boxes to create a virtual machine, and then installed an operating system into that VM. Now, you want to make a golden image. GNOME Boxes is one step ahead of you: It has already taken a snapshot of your install, which can serve as the golden image for a stock OS installation.

With GNOME Boxes open and in the dashboard view, right-click on any virtual machine and select **Properties**. In the **Properties** window, select the **Snapshots** tab. The first snapshot, created automatically by GNOME Boxes, is **Just Installed**. As its name suggests, this is the operating system as you originally installed it onto its virtual machine.

![The Just Installed snapshot, or initial golden image, in GNOME Boxes.][4]

Should your virtual machine reach a state that you did not intend, you can always revert to this **Just Installed** image.

Of course, reverting back to the OS after it’s just been installed would be a drastic measure if you’ve already fine-tuned the environment for yourself. That’s why it’s a common workflow with virtual machines to first install the OS, then modify it to suit your requirements or preferences, and then take a snapshot, declaring that snapshot as your configured golden image. For instance, if you are using the virtual machine for [Flatpak][5] packaging, then after your initial install you might add software and Flatpak development tools, construct your working environment, and then take a snapshot. Once the snapshot is created, you can rename the virtual machine to indicate its true purpose in life.

To rename a virtual machine, right-click on its thumbnail in the dashboard view, and select **Properties**. In the **Properties** window, enter a new name:

![Renaming your VM image in GNOME Boxes.][6]

To make a clone of your golden image, right-click on the virtual machine in the GNOME Boxes interfaces and select **Clone**.

![Cloning your golden image in GNOME Boxes.][7]

You now have a clone from your golden image’s latest snapshot.

### Golden

There are few disciplines that can’t benefit from golden images. Whether you’re tagging releases in [Git][8], taking snapshots in Boxes, pressing a prototype vinyl, printing a book for approval, designing a screen print for mass production, or fashioning a literal mold, the archetype is everything. It’s just one more way that modern technology lets us humans work smarter rather than harder, so make a golden image for your project, and generate clones as often as you need.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/what-golden-image

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/origami_star_gold_best_top.jpg?itok=aEc0eutt (Gold star)
[2]: https://wiki.gnome.org/Apps/Boxes
[3]: https://opensource.com/article/19/5/getting-started-gnome-boxes-virtualization
[4]: https://opensource.com/sites/default/files/uploads/snapshots.jpg (The Just Installed snapshot, or initial golden image.)
[5]: https://opensource.com/business/16/8/flatpak
[6]: https://opensource.com/sites/default/files/uploads/boxes-rename_0.jpg (Renaming your virtual machine in GNOME Boxes.)
[7]: https://opensource.com/sites/default/files/uploads/boxes-clone.jpg (Cloning your golden image in GNOME Boxes.)
[8]: https://git-scm.com

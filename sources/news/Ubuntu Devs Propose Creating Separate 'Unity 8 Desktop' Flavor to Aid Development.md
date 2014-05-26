alim0x translating

Ubuntu Devs Propose Creating Separate ‘Unity 8 Desktop’ Flavor to Aid Development
================================================================================
![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/05/1.jpg)

**The creation of a new Ubuntu flavour based on Unity 8 has been put forward by the Ubuntu Desktop Team.**

Developer Iain Lane, who outlined the proposal on the team’s mailing list, says the addition of such a spin would allow developers and enthusiasts alike ‘to figure out the work that’s required to make a desktop product based on th[e] software usable’.

Lane writes:

> “The desktop team would like to add a new flavour (we don’t plan to have any formal releases at this point) of Ubuntu which contains the Unity 8 desktop and the new applications which have been developed for the touch project.
> The initial intention is to provide a product which developers can use to figure out the work that’s required to make a desktop product based on this software usable, and to create a space for experimentation to figure out the best ways of carrying out the required integration.”

### ‘Default by Ubuntu 16.04’ ###

The potential boons for an experimental distro at this juncture are evident.

Canonical aims to reuse the same code from the phone and tablet versions of Ubuntu on the PC, albeit with a more traditional desktop guise, as part of their drive towards ‘convergence’.

But with Unity 8 still under active development on both phone and tablet form factors — both of which have hardware releases looming — it’s understandable that major progress on shaping the PC face has been fairly slow.

> ‘The boon of testing images of Unity 8 for regular PCs seems an astute proposal’

Ubuntu 14.04 LTS offers developers the chance to toy with a snapshot of tablet work through an installable Unity 8 desktop session that can be installed alongside the incumbent version, albeit with a few caveats.

In creating a dedicated Unity 8 desktop image many of the limitations of the installable session would be alleviated. Not only would a live session make testing more accessible through a live USB or CD, but should also allow a wider range of experimentation and testing free from the pressures of affecting regular desktop users.

A [blueprint][1] for the project says that the image (.iso) of the new spin ‘should become the default one by 16.04.’

With most engineering effort still being put toward bringing the mobile iterations up to spec, the current Compiz-based version (Unity 7, described as ‘in maintenance’ by developer) is likely to remain default on the desktop builds for the foreseeable future.

Transitioning over to Unity 8 on the desktop also depends on timeframes for Mir, Canonical’s in-house display server/display protocol. With [optimistic forecasts on its desktop debut long since ceded to reality][2], more definite plans remain largely ambiguous or unannounced. There, work on supporting traditional desktop workflows in Mir – such as handling window compositing, task switching and multi-monitor setups – remains in the early stages, making the benefit of testing images for regular PCs seem, again, a rather astute proposal.

How best to handle “click packages” (these are the custom runtime framework Unity 8/Mir apps use); whether resources to support ‘another flavour’ are available; and what name such a project should use are among the questions up for discussion.

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/05/ubuntu-unity-8-desktop-flavour-discussed

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://blueprints.launchpad.net/ubuntu/+spec/client-1410-unity8-desktop-iso
[2]:http://www.omgubuntu.co.uk/2014/03/mir-default-display-server-ubuntu-2016

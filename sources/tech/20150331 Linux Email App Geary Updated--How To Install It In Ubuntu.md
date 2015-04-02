Linux Email App Geary Updated — How To Install It In Ubuntu
================================================================================
**Geary, the popular desktop email client for Linux, has been updated to version 0.10 — and it gains a glut of new features in the process.**

![An older version of Geary running  in elementary OS](http://www.omgubuntu.co.uk/wp-content/uploads/2015/01/geary.jpg)
An older version of Geary running  in elementary OS

Geary 0.100 features some welcome user interface improvements and additional UI options, including:

- New: Ability to ‘Undo’ Archive, Trash and Move actions
- New: Option to switch between a 2 column or 2 column layout
- New “split header bar” — improves message list, composer layouts
- New shortcut keys — use j/k to navigate next/previous conversations

This update also introduces a **brand new full-text search algorithm** designed to improve the search experience in Geary, according to Yorba.

This introduction should calm some complaints of the app’s search prowess, which often sees Geary return a slew of search results that are, to quote software outfit themselves, “…seemingly unrelated to the search query.”

> ‘Yorba recommends that all users of the client upgrade to this release’

*“Although not all search problems are fixed in 0.10, Geary should be more conservative about displaying results that match the user’s query,” [the team notes][1]. *

Last but by no means least on the main feature front is something sure to find favour with power users: **support for multiple/alternate e-mail addresses per account**. 

If your main Gmail account is set-up in Geary to pull in your Yahoo, Outlook and KittyMail messages too then you should now see them all kept neatly together and be given the option of picking which identity you send from when using the composer ‘From’ field. No, it’s not the sexiest feature but it is one that has been requested often.

Rounding out this release of the popular Linux email client is the usual gamut of bug fixes, performance optimisations and miscellaneous improvements.

Yorba recommends that all users of the client upgrade to this release.

### Install Geary 0.10 in Ubuntu 14.04, 14.10 & 15.04 ###

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/09/geary-inline-composor.jpg)

The latest version of Yorba is available to download as source, ready for compiling from the GNOME Git. But let’s be honest: that’s a bit of a hassle, right?

Ubuntu users wondering how to install Geary 0.10 in **14.04, 14.10** and (for early birds) **15.04** have things easy.

The official Yorba PPA contains the **latest versions of Geary** as well as those for Shotwell (photo manager) and [California][2] (calendar app). Be aware that any existing versions of these apps installed on your computer may/will be upgraded to a more recent version by adding this PPA.

Capiche? Coolio.

To install Geary in Ubuntu you first need to add the Yorba PPA your Softwares Sources. To do this just open a new Terminal window and carefully enter the following two commands:

    sudo add-apt-repository ppa:yorba/ppa

    sudo apt-get update && sudo apt-get install geary

After hitting return/enter on the last you’ll be prompted to enter your password. Do this, and then let the installation complete.

![](http://www.omgubuntu.co.uk/wp-content/uploads/2013/04/20130320161830-geary-yorba.png)

Once done, open your desktop environment’s app launcher and seek out the ‘Geary’ icon. Click it, add your account(s) and discover [what the email mail man has dropped off through the information superhighway][3] and into the easy to use graphical interface.

**Don’t forget: you can always tip us with news, app suggestions, and anything else you’d like to see us cover by using the power of electronic mail. Direct your key punches to joey [at] oho [dot] io.**

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2015/03/install-geary-ubuntu-linux-email-update

作者：[Joey-Elijah Sneddon][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:https://wiki.gnome.org/Apps/Geary/FullTextSearchStrategy
[2]:http://www.omgubuntu.co.uk/2014/10/california-calendar-natural-language-parser
[3]:https://www.youtube.com/watch?v=rxM8C71GB8w
Indicator-Synapse Brings Spotlight-Like Search Bar to Linux
===========================================================

![img](http://www.omgubuntu.co.uk/wp-content/uploads/2013/06/spotlightsynapse.jpg "spotlightsynapse")

**Take a semantic Zeitgeist-powered application/file launcher and bind it to the panel. What do you get? Something worth putting in the spotlight, that’s what.**

_Indicator-Synapse_ is a new attempt at presenting results from the [powerful application/file launcher Synapse][1].

Comparisons with Apple’s Spotlight search feature are somewhat valid. Both are menu based search tools that show a ‘top hit’ and results from files, applications and the web.

But you don’t need to be running a Mac-themed Linux distro to use it (though I’m sure it looks great on Pear OS, where it’ll be rocking up as default). It runs just fine on Ubuntu and its siblings.

###Unity Dash Does The Same, Right?

The need for such a tool on the Unity desktop is lessened somewhat given the versatility of the Dash, but some of you might like it anyway.

Drawback being that you can’t open it with a keyboard shortcut (not least one that I can find). That makes it a little less useful; being able to tap a key combo and start searching without needing to use the mouse is what makes Spotlight on OS X (and the Unity Dash) so handy.

But still, early days.

###Install Indicator Synapse in Ubuntu

Indicator-Search is currently in development so only install it if you’re okay with bugs, crashes and unexpected behaviour.

Installing it requires adding two PPAs to your software sources. The first contains builds of Indicator Synapse for Ubuntu 12.04 & 13.04. The second has a dependency needed by the app that isn’t present in its own PPA.

Open a new Terminal window and enter:

	sudo add-apt-repository ppa:elementary-os/unstable-upstream

	sudo add-apt-repository ppa:birdie-team/stable
	sudo apt-get update && sudo apt-get install indicator-synapse libkeybinder-3.0-0

Now search for Indicator-Synapse in the Dash and launch.

To remove the application simply search for ‘indicator synapse’ in the Ubuntu Software Center, click on its listing, then the ‘remove’ button

[1]:https://apps.ubuntu.com/cat/applications/synapse/

via: http://www.omgubuntu.co.uk/2013/09/spotlight-like-tool-coming-to-pear-os-other-distros
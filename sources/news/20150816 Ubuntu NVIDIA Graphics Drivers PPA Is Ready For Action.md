DongShuaike is translating.

Ubuntu NVIDIA Graphics Drivers PPA Is Ready For Action
================================================================================
![](http://www.omgubuntu.co.uk/wp-content/uploads/2015/08/Screen-Shot-2015-08-12-at-14.19.42.png)

Get your frame-rate on

**Well, that didn’t take long. **

Just days after [proposing][1] the creation of a new PPA to provide Ubuntu users with the latest NVIDIA graphics drivers the Ubuntu community has clubbed together to do, well, just that.

The plainly named ‘**Graphics Drivers PPA**‘ contains the latest release of NVIDIA’s proprietary Linux grapics drivers, packaged up for Ubuntu users to upgrade to – no binary runtime headaches needed!

The PPA is designed to offer gamers a way to run the latest games on the latest on Ubuntu as easily as possible.

#### Ready, But Not Ready ####

Jorge Castro’s idea to create a ‘blessed’ PPA containing newer NVIDIA graphics drivers for those wot want ’em has been greeted with enthusiasm by Ubuntu users and games developers alike.

Even those involved in porting some of Steam’s biggest titles to Linux have chimed in to offer advice and suggestions.

Edwin Smith, head of production at Feral Interactive (‘Shadow of Mordor’) welcomed the initiative to prove users with “easier way of updating drivers”.

### How To Use The New Nvidia Drivers PPA ###

Although the new ‘Graphic Drivers PPA’ is live it is not strictly ready for the prime time. Its maintainers caution:

> “This PPA is currently in testing, you should be experienced with packaging before you dive in here. Give a few days to sort out the kinks.”

Jorge, who soft launched the PPA in a post to the Ubuntu desktop mailing list, also notes that gamers using existing PPAs, like xorg-edgers, for timely graphics driver updates won’t notice any driver difference for now (as the drivers have simply been copied over from some of those PPAs to this new one).

“The real fun begins when new drivers are released,” he adds.

Right now, as of writing, the PPA contains a batch of recent Nvidia drivers for Ubuntu 12.04.1 through 15.10. Note all drivers are available for all releases.

> **It should go without saying: unless you know what you’re doing, and how to undo it, do not follow the instructions that follow. **

To add the PPA run the following in a new Terminal window:

    sudo add-apt-repository ppa:graphics-drivers/ppa

To upgrade to or install the latest Nvidia drivers:

    sudo apt-get update && sudo apt-get install nvidia-355

Remember: if the PPA breaks your system you are allowed to keep both halves.

To roll back/undo changes made the PPA you should use the ppa-purge command.

Feel free to leave any advice/help/corrections/thoughts on the PPA (and as I don’t have NVIDIA hardware to test the above out for myself, it’s all appreciated) in the comments below.

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2015/08/ubuntu-nvidia-graphics-drivers-ppa-is-ready-for-action

作者：[Joey-Elijah Sneddon][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:http://www.omgubuntu.co.uk/2015/08/ubuntu-easy-install-latest-nvidia-linux-drivers

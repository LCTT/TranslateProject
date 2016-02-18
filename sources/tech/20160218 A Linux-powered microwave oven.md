A Linux-powered microwave oven
================================================================================

Scratching an itch is a recurring theme in presentations at [linux.conf.au](http://linux.conf.au/). As the open-hardware movement gains strength, more and more of these itches relate to the physical world, not just the digital. David Tulloh used his [presentation [WebM]](http://mirror.linux.org.au/linux.conf.au/2016/04_Thursday/D4.303_Costa_Theatre/Linux_driven_microwave.webm) on the “Linux Driven Microwave” to discuss how annoying microwave ovens can be and to describe his project to build something less irritating.

Tulloh's story began when he obtained a microwave oven, admittedly an inexpensive one, with a user interface even worse than the norm. Setting the time required pressing buttons so hard that the microwave tended to get pushed away — a fact that was elegantly balanced by the door handle requiring a sufficiently hard tug to return the oven to its original position. While this is clearly an extreme case, Tulloh lamented that microwave ovens really hadn't improved noticeably in recent decades. They may have gotten a little cheaper and gained a few features that few people could use without poring over the instruction manual — the implied contrast to smartphones, which are widely used with little instruction, was clear.

This microwave oven was not a lost cause — it gave its life to the greater good and became the prototype for an idea that Tulloh hopes to turn into a crowd-funded project if he can find the right match between features and demand: a Linux-driven microwave oven.

![](https://static.lwn.net/images/2016/lca-oven-sm.jpg)

## Adding novelty

Adding a smartphone-like touchscreen and a network connection and encouraging a community to build innovative apps such as recipe sharing are fairly obvious ideas once you think to put “Linux” and “microwave oven” together, but Tulloh's vision and prototype lead well beyond there. Two novel features that have been fitted are a thermal camera and a scale for measuring weight.

The thermal camera provides an eight-by-eight-pixel image of the contents of the oven with a precision of about two degrees. This is enough to detect if a glass of milk is about to boil over, or if the steak being thawed is in danger of getting cooked. In either case, the power can be reduced or removed. If appropriate, an alert can be sounded. This would not be the first microwave to be temperature sensitive — GE sold microwave ovens with temperature probes decades ago — but an always-present sensor is much more useful than a manually inserted probe, especially when there is an accessible API behind it.

The second innovation is a built-in scale to weigh the food (and container) being cooked. Many recipes give cooking-time guidance based on weight and some microwave ovens allow you to enter the weight manually so it can do a calculation for you. With built-in scales, that can become automatic. Placing a scale reliably under the rotating plate typical of many microwave ovens would be a mechanical challenge that Tulloh did not think worth confronting. Instead his design is based on the “flat-plate” or “flat-bed” style of oven — placing a sensor at each of the four corners is mechanically straightforward and gives good results.

 [User interface]
Once you have these extra sensors — weight and temperature — connected to a suitable logic engine, more interesting possibilities can be explored. A cup of cold milk from the fridge will have a particular weight and temperature profile with a modest degree of error. Tulloh suggested that situation could be detected and some relevant options such as “Boil” or “Warm” could be offered for easy selection (a mock up of the interface is at right, a clickable version is [here](http://mwgui.tulloh.id.au/)). Simple machine learning could extend this to create a personalized experience. It would be easy to collect a history of starting profiles and cooking choices; when those patterns are detected, the most likely cooking choices could be made the easiest to select.

![](https://static.lwn.net/images/2016/lca-ovengui-sm.png)

## Overcoming staleness

Beyond just new functionality, Tulloh wants to improve the functionality that already exists. Door handles as stiff as on Tulloh's cheap microwave may not be common, but few microwave oven doors seem designed to make life easy for people with physical handicaps. There are regulatory restrictions, particularly in the US, that require the oven to function only if there is positive confirmation that the door is actually shut. This confirmation must be resilient against simple fraud, so poking a stick in the hole must not trick the oven into working with the door open. In fact, there must be two independent confirmations and, if they disagree, a fuse must be blown so that a service call is required. Tulloh believes that a magnetic latch would provide much greater flexibility (including easy software control) and that magnetic keying similar to that used in a [magnetic keyed lock](https://en.wikipedia.org/wiki/Magnetic_keyed_lock) would allow the magnetic latch to pass certification.

Another pain point with microwave ovens is the annoying sounds they make. Tulloh has discarded the beeper and hooked up a speaker to the Banana Pi that is controlling his prototype. This allows for more pleasant and configurable alerts as well as for advice and guidance through a text-to-speech system. Adding a microphone for voice control is an obvious next step.

Many microwave ovens can do more than just set a time and a power level — they provide a range of power profiles for cooking, warming, defrosting, and so on. Adding precise temperature sensing will allow the community to extend this range substantially. A question from Andrew Tridgell in the audience wondered if tempering chocolate — a process that requires very precise temperature control — would be possible. Tulloh had no experience with the process, and couldn't make promises, but thought it was certainly worth looking in to. Even if that doesn't work out, it shows clear potential for value to be gained from community input.

## Availability

Tulloh would very much like to get these Linux-enabled microwave ovens out into the world to create a community and see where it goes. Buying existing ovens and replacing the electronics is not seen as a viable option. The result would be ugly and, given that a small-run smart microwave will inevitably cost more, potential buyers are going to want something that doesn't look completely out of place in their kitchen.

Many components are available off-the-shelf (magnetron, processor board, thermal sensor) and others, such as a USB interface for the thermal sensor, are easily built. Prototype software is, of course, already available on [GitHub](https://github.com/lod?tab=repositories). The case and door are more of a challenge and would need to be made to order. Tulloh wants to turn this adversity into an opportunity by providing the option for left-handed microwave ovens and a variety of colors.

A quick survey of the audience suggested that few people would hastily commit to his target price of $AU1000 for a new, improved, open oven. Whether a bit more time for reflection and a wider audience might tip the balance is hard to know. The idea is intriguing, so it seems worth watching Tulloh's [blog](http://david.tulloh.id.au/category/microwave/) for updates.


------------------------------------------------------------------------------

via: https://lwn.net/Articles/674877/

作者：Neil Brown
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

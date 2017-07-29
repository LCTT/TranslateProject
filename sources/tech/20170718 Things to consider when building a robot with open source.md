Translating by Sunwave

Things to consider when building a robot with open source
==============================================


### Share or save

![](https://insights.ubuntu.com/wp-content/uploads/fbfc/flashing.png)

So you’re considering (or are in the process of) bringing a robot, using open source software, to market. It’s based on Linux. Maybe you’re using the [Robot Operating System][2] (ROS), or the [Mission Oriented Operating Suite][3] (MOOS), or yet another open-source middleware that’s helping you streamline development. As development nears something useful, you start receiving some pressure about desired returns on this thing. You might be asked ‘When can we start selling it?’ This is where you reach a crossroads.

You can do one of two things:

1.  Start shipping essentially what you have now

2.  Step back, and treat going to production as an entirely new problem to solve, with new questions to answer

You don’t need to look very far to see examples of people who settled on (1). In fact, the IoT market is flooded with them. With the rush to get devices to market, it’s not at all rare to find devices left with hard-coded credentials, development keys, various security vulnerabilities, and no update path.

Think of Mirai, the botnet that mounted a DDoS attack with traffic surpassing 1Tbps, bringing down some of the biggest websites on the Internet. It’s made up primarily of IoT devices. Does it use super cool black magic developed in a windowless lab (or basement) to overwhelm the devices’ defenses and become their master? Nope, default (and often hard-coded) credentials. Did the manufacturers of these devices react quickly and release updates to all these devices in order to secure them? No, many of them don’t have an update method at all. [They recalled them instead][4].

Rather than rushing to market, take a step back. You can save yourself and your company a lot of pain simply by thinking through a few points.

For example, **how is your software updated**? You  _must_  be able to answer this question. Your software is not perfect. In a few weeks you’ll find out that, when your autonomous HMMWV is used in California, it thinks that little sagebrush is an oak. Or you accidentally included your SSH keys.

**How is the base OS updated**? Perhaps this is still part of your product, and answering the above question answers this one as well. But perhaps your OS comes from another vendor. How do you get updates from them to your customers? This is where security vulnerabilities can really bite you: a kernel that is never updated, or a severely out-of-date openssl.

Once you have updates figured out, **how is your robot recovered if an update goes sideways**? My go-to example for this is a common solution to the previous problem: automatic security updates. That’s a great practice for servers and desktops and things that are obviously computers, because most people realize that there’s an acceptable way to turn those off, and it’s  _not_  to hold the power button for 5 seconds. Robotic systems (and IoT systems in general) have a bit of an issue in that sometimes they’re not viewed as computers at all. If your robot is behaving oddly, chances are it will be forcefully powered off. If it was behaving oddly because it was installing a kernel update real quick, well, now you have a robotic paperweight with a partially installed kernel. You need to be able to deal with this type of situation.

Finally, **what is your factory process**? How do you install Linux, ROS (or whatever middleware you’re using), and your own stuff on a device you’re about to ship? Small shops might do it by hand, but that doesn’t scale and is error-prone. Others might make a custom seeded distro ISO, but that’s no small task and it’s not easy to maintain as you update your software. Still others use Chef or some other automation tool with a serious learning curve, and before long you realize that you dumped a significant amount of engineering effort into something that should have been easy.

All of these questions are important. If you find yourself not having clear answers to any of them, you should join our webinar, where we discuss how to build a commercial robot with open source. We’ll help you think through these questions, and be available to answer any more you have!

--------------------------------------------------------------------------------

作者简介：

Kyle is a member of the Snapcraft team, and is also Canonical's resident roboticist. He focuses on snaps and the snap developer experience, as well as robotics enablement for snaps and Ubuntu Core.



-----------

via: https://insights.ubuntu.com/2017/07/18/things-to-consider-when-building-a-robot-with-open-source/

作者：[Kyle Fazzari ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://insights.ubuntu.com/author/kyrofa/
[1]:https://insights.ubuntu.com/author/kyrofa/
[2]:http://www.ros.org/
[3]:http://www.robots.ox.ac.uk/~mobile/MOOS/wiki/pmwiki.php/Main/HomePage
[4]:https://krebsonsecurity.com/2016/10/iot-device-maker-vows-product-recall-legal-action-against-western-accusers/

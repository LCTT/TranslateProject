Running Android on Top of a Linux Graphics Stack
============================================================


![Linux graphics](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/linux-graphics-stack.jpg?itok=qGxdvJA7 "Linux graphics")

>You can now run Android on top of a regular Linux graphics stack, which is hugely empowering, according to Robert Foss, a Linux graphic stack contributor and Software Engineer at Collabora. Learn more in this preview of his talk at Embedded Linux Conference Europe.[Creative Commons Zero][2]Pixabay

You can now run Android on top of a regular Linux graphics stack. This was not the case before, and according to Robert Foss, a Linux graphic stack contributor and Software Engineer at Collabora, this is hugely empowering. In his upcoming talk at [Embedded Linux Conference Europe,][5] Foss will cover recent developments in this area and discuss how these changes allow you to take advantage of new features and improvements in kernels.


![Robert Foss](https://www.linux.com/sites/lcom/files/styles/floated_images/public/robert-foss.png?itok=uFWdAED_ "Robert Foss")

Robert Foss, Linux graphic stack contributor and Software Engineer at Collabora[Used with permission][1]

In this article, Foss explains more and offers a preview of his talk.

**Linux.com: Can you please tell us a bit about the graphics stack you’re  talking about?**

**Foss: **Traditional Linux graphics systems (like X11) mostly did not use planes. But modern graphics systems like Android and Wayland can take full advantage of it.

Android has the most mature implementation of plane support in HWComposer, and its graphics stack is a bit different from the usual Linux desktop graphics stack. On desktops, the typical compositor just uses the GPU for all composition, because this is the only thing that exists on the desktop.

Most embedded and mobile chips have specialized 2D composition hardware that Android is designed around. The way this is done is by dividing the things that are displayed into layers, and then intelligently feeding the layers to hardware that is optimized to handle layers. This frees up the GPU to work on the things you actually care about, while at the same time, it lets hardware that is more efficient do what it does best.

**Linux.com: When you say Android, do you mean the Android Open Source Project (the AOSP)?**

**Foss: **The Android Open Source Project (the AOSP), is the base upon which many Android products is built, and there's not much of a distinction between AOSP and Android.

Specifically, my work has been done in the AOSP realm, but nothing is preventing this work from being pulled into a shipped Android product.

The distinction is more about licensing and fulfilling the requirements of Google for calling a product Android, than it is about code.

**Linux.com: Who would want to run that and why? What are some advantages?**

**Foss: **AOSP gives you a lot of things for free, such as a software stack optimized for usability, low power, and diverse hardware. It's a lot more polished and versatile than what any single company feasibly could develop on their own, without putting a lot of resources behind it.

As a manufacturer it also provides you with access to a large pool of developers that are immediately able to develop for your platform.

**Linux.com: What are some practical use cases?**

**Foss: **The new part here is the ability to run Android on top of the regular Linux graphics stack. Being able to do this with mainline/upstream kernels and drivers allows you to take advantage of new features and improvements in kernels as well, not just depend on whatever massively forked BSP you get from your vendor.

For any GPU that has reasonable standard Linux support, you are now able to run Android on top of it. This was not the case before. And in that way it is hugely enabling and empowering.

It also matter in the sense, that it incentivizes GPU designers to work with upstream for their drivers. Now there's a straightforward path for them to provide one driver that works for Android and Linux with no added effort. Their costs will be lower, and maintaining their GPU driver upstream is a lot more appealing.

For example, we would like to see mainline support Qualcomm SOCs, and we would like to be a part of making that a reality.

To summarize, this will help the hardware ecosystem get better software support and the software ecosystem have more hardware to work with.

*   It improves the economy of SBC/devboard manufacturers: they can provide a single well-tested stack which works on both, rather than having to provide a "Linux stack" and an Android stack.

*   It simplifies work for driver developers, since there's just a single target for optimisation and enablement.

*   It enables the Android community, since Android running on mainline allows them to share the upstream improvements being made.

*   It helps upstream, because we get a product-quality stack, that has been tested and developed with help from the designer of the hardware.

Previously, Mesa was looked upon as a second-class stack, but it's now shown that it is up-to-date (fully compliant with Vulkan 1.0, OpenGL 4.6, OpenGL ES 3.2 on release day), as well as performant, and product quality.

That means that driver developers can be involved in Mesa, and be confident that they're sharing in the hard work of others, and also getting a great base to build on.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/event/elce/2017/10/running-android-top-linux-graphics-stack

作者：[ SWAPNIL BHARTIYA][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/arnieswap
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/creative-commons-zero
[3]:https://www.linux.com/files/images/robert-fosspng
[4]:https://www.linux.com/files/images/linux-graphics-stackjpg
[5]:http://events.linuxfoundation.org/events/embedded-linux-conference-europe

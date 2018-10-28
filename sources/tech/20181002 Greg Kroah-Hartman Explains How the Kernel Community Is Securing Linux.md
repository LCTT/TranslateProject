qhwdw is translating


Greg Kroah-Hartman Explains How the Kernel Community Is Securing Linux
============================================================


![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/kernel-security_0.jpg?itok=hOaTQwWV)
Kernel maintainer Greg Kroah-Hartman talks about how the kernel community is hardening Linux against vulnerabilities.[Creative Commons Zero][2]

As Linux adoption expands, it’s increasingly important for the kernel community to improve the security of the world’s most widely used technology. Security is vital not only for enterprise customers, it’s also important for consumers, as 80 percent of mobile devices are powered by Linux. In this article, Linux kernel maintainer Greg Kroah-Hartman provides a glimpse into how the kernel community deals with vulnerabilities.

### There will be bugs


![Greg Kroah-Hartman](https://www.linux.com/sites/lcom/files/styles/floated_images/public/greg-k-h.png?itok=p4fREYuj "Greg Kroah-Hartman")

Greg Kroah-Hartman[The Linux Foundation][1]

As Linus Torvalds once said, most security holes are bugs, and bugs are part of the software development process. As long as the software is being written, there will be bugs.

“A bug is a bug. We don’t know if a bug is a security bug or not. There is a famous bug that I fixed and then three years later Red Hat realized it was a security hole,” said Kroah-Hartman.

There is not much the kernel community can do to eliminate bugs, but it can do more testing to find them. The kernel community now has its own security team that’s made up of kernel developers who know the core of the kernel.

“When we get a report, we involve the domain owner to fix the issue. In some cases it’s the same people, so we made them part of the security team to speed things up,” Kroah Hartman said. But he also stressed that all parts of the kernel have to be aware of these security issues because kernel is a trusted environment and they have to protect it.

“Once we fix things, we can put them in our stack analysis rules so that they are never reintroduced,” he said.

Besides fixing bugs, the community also continues to add hardening to the kernel. “We have realized that we need to have mitigations. We need hardening,” said Kroah-Hartman.

Huge efforts have been made by Kees Cook and others to take the hardening features that have been traditionally outside of the kernel and merge or adapt them for the kernel. With every kernel released, Cook provides a summary of all the new hardening features. But hardening the kernel is not enough, vendors have to enable the new features and take advantage of them. That’s not happening.  

Kroah-Hartman [releases a stable kernel every week][5], and companies pick one to support for a longer period so that device manufacturers can take advantage of it. However, Kroah-Hartman has observed that, aside from the Google Pixel, most Android phones don’t include the additional hardening features, meaning all those phones are vulnerable. “People need to enable this stuff,” he said.

“I went out and bought all the top of the line phones based on kernel 4.4 to see which one actually updated. I found only one company that updated their kernel,” he said.  “I'm working through the whole supply chain trying to solve that problem because it's a tough problem. There are many different groups involved -- the SoC manufacturers, the carriers, and so on. The point is that they have to push the kernel that we create out to people.”

The good news is that unlike with consumer electronics, the big vendors like Red Hat and SUSE keep the kernel updated even in the enterprise environment. Modern systems with containers, pods, and virtualization make this even easier. It’s effortless to update and reboot with no downtime. It is, in fact, easier to keep things secure than it used to be.

### Meltdown and Spectre

No security discussion is complete without the mention of Meltdown and Spectre. The kernel community is still working on fixes as new flaws are discovered. However, Intel has changed its approach in light of these events.

“They are reworking on how they approach security bugs and how they work with the community because they know they did it wrong,” Kroah-Hartman said. “The kernel has fixes for almost all of the big Spectre issues, but there is going to be a long tail of minor things.”

The good news is that these Intel vulnerabilities proved that things are getting better for the kernel community. “We are doing more testing. With the latest round of security patches, we worked on our own for four months before releasing them to the world because we were embargoed. But once they hit the real world, it made us realize how much we rely on the infrastructure we have built over the years to do this kind of testing, which ensures that we don’t have bugs before they hit other people,” he said. “So things are certainly getting better.”

The increasing focus on security is also creating more job opportunities for talented people. Since security is an area that gets eyeballs, those who want to build a career in kernel space, security is a good place to get started with.

“If there are people who want a job to do this type of work, we have plenty of companies who would love to hire them. I know some people who have started off fixing bugs and then got hired,” Kroah-Hartman said.

You can hear more in the video below:

[视频](https://youtu.be/jkGVabyMh1I)

 _Check out the schedule of talks for Open Source Summit Europe and sign up to receive updates:_

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/2018/10/greg-kroah-hartman-explains-how-kernel-community-securing-linux-0

作者：[SWAPNIL BHARTIYA][a]
选题：[oska874][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/arnieswap
[b]:https://github.com/oska874
[1]:https://www.linux.com/licenses/category/linux-foundation
[2]:https://www.linux.com/licenses/category/creative-commons-zero
[3]:https://www.linux.com/files/images/greg-k-hpng
[4]:https://www.linux.com/files/images/kernel-securityjpg-0
[5]:https://www.kernel.org/category/releases.html

What containers and unikernels can learn from Arduino and Raspberry Pi
==========================================================================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/bus-containers.png?itok=vM7_7vs0)


Just the other day, I was speaking with a friend who is a mechanical engineer. He works on computer assisted braking systems for semi trucks and mentioned that his company has [Arduinos][1] all over the office. The idea is to encourage people to quickly experiment with new ideas. He also mentioned that Arduinos are more expensive than printed circuits. I was surprised by his comment about price, because coming from the software side of things, my perceptions of Arduinos was that they cost less than designing a specialized circuit.

I had always viewed [Arduinos][2] and [Raspberry Pi][3] as these cool, little, specialized devices that can be used to make all kinds of fun gadgets. I came from the software side of the world and have always considered Linux on x86 and x86-64 "general purpose." The truth is, Arduinos are not specialized. In fact, they are very general purpose. They are fairly small, fairly cheap, and extremely flexible—that's why they caught on like wildfire. They have all kinds of I/O ports and expansion cards. They allow a maker to go out and build something cool really quickly. They even allow companies to build new products quickly.

The unit price for an Arduino is much higher than a printed circuit, but time to a minimum viable idea is much lower. With a printed circuit, the unit price can be driven much lower but the upfront capital investment is much higher. So, long story short, the answer is—it depends.

### Unikernels, rump kernels, and container hosts

Enter unikernels, rump kernels, and minimal Linux distributions—these operating systems are purpose-built for specific use cases. These specialized operating systems are kind of like printed circuits. They require some up-front investment in planning and design to utilize, but could provide a great performance increase when deploying a specific workload at scale.

Minimal operating systems such as Red Hat Enterprise Linux Atomic or CoreOS are purpose-built to run containers. They are small, quick, easily configured at boot time, and run containers quite well. The downside is that it requires extra engineering to add third-party extensions such as monitoring agents or tools for virtualization. Some side-loaded tooling needs redesigned as super-privileged containers. This extra engineering could be worth it if you are building a big enough container environment, but might not be necessary to just try out containers.

Containers provide the ability to run standard workloads (things built on [glibc][4], etc.). The advantage is that the workload artifact (Docker image) can be built and tested on your desktop and deployed in production on completely different hardware or in the cloud with confidence that it will run with the same characteristics. In the production environment, container hosts are still configured by the operations teams, but the application is controlled by the developer. This is a sort of a best of both worlds.

Unikernels and rump kernels are also purpose-built, but go a step further. The entire operating system is configured at build time by the developer or architect. This has benefits and challenges.

One benefit is that the developer can control a lot about how the workload will run. Theoretically, a developer could try out [different TCP stacks][5] for different performance characteristics and choose the best one. The developer can configure the IP address ahead of time or have the system configure itself at boot with DHCP. The developer can also cut out anything that is not necessary for their application. There is also the promise of increased performance because of less [context switching][6].

There are also challenges with unikernels. Currently, there is a lot of tooling missing. It's much like a printed circuit world right now. A developer has to invest a lot of time and energy discerning if all of the right libraries exist, or they have to change the way their application works. There may also be challenges with how the "embedded" operating system is configured at runtime. Finally, every time a major change is made to the OS, it requires [going back to the developer][7] to change it. This is not a clean separation between development and operations, so I envision some organizational changes being necessary to truly adopt this model.

### Conclusion

There is a lot of interesting buzz around specialized container hosts, rump kernels, and unikernels because they hold the potential to revolutionize certain workloads (embedded, cloud, etc.). Keep your eye on this exciting, fast moving space, but cautiously.

Currently, unikernels seem quite similar to building printed circuits. They require a lot of upfront investment to utilize and are very specialized, providing benefits for certain workloads. In the meantime containers are quite interesting even for conventional workloads and don't require as much investment. Typically an operations team should be able to port an application to containers, whereas it takes real re-engineering to port an application to unikernels and the industry is still not quite sure what workloads can be ported to unikernels.

Here's to an exciting future of containers, rump kernels, and unikernels!

--------------------------------------
via: https://opensource.com/business/16/5/containers-unikernels-learn-arduino-raspberry-pi 

作者：[Scott McCarty][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/fatherlinux
[1]: https://opensource.com/resources/what-arduino
[2]: https://opensource.com/life/16/4/arduino-day-3-projects
[3]: https://opensource.com/resources/what-raspberry-pi
[4]: https://en.wikipedia.org/wiki/GNU_C_Library
[5]: http://www.eetasia.com/ARTICLES/2001JUN/2001JUN18_NTEK_CT_AN5.PDF
[6]: https://en.wikipedia.org/wiki/Context_switch
[7]: http://developers.redhat.com/blog/2016/05/18/3-reasons-i-should-build-my-containerized-applications-on-rhel-and-openshift/

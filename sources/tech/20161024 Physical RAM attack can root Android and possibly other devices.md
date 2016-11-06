wcnnbdk1 translating
Physical RAM attack can root Android and possibly other devices
===

>Attackers can reliably flip bits in physical memory cells in order to compromise mobile devices and computers

![](http://images.techhive.com/images/idgnsImport/2015/08/id-2969037-security1-100606370-large.jpg)


Researchers have devised a new way to compromise Android devices without exploiting any software vulnerabilities and instead taking advantage of a physical design weakness in RAM chips. The attack technique could also affect other ARM and x86-based devices and computers.

The attack stems from the push over the past decade to pack more DRAM (dynamic random-access memory) capacity onto increasingly smaller chips, which can lead to memory cells on adjacent rows leaking electric charges to one another under certain conditions.

For example, repeated and rapid accessing of physical memory locations -- an action now dubbed "hammering" -- can cause the bit values from adjacent locations to flip from 0 to 1 or the other way around.

While such electrical interference has been known for a while and has been studied by vendors from a reliability standpoint -- because memory corruption can lead to system crashes -- researchers have shown that it can also have serious security implications when triggered in a controlled manner.


In March 2015, researchers from Google's Project Zero [presented two privilege escalation exploits][7] based on this memory "row hammer" effect on the x86-64 CPU architecture. One of the exploits allowed code to escape the Google Chrome sandbox and be executed directly on the OS and the other gained kernel-level privileges on a Linux machine.

Since then, other researchers have further investigated the problem and have shown that it could be [exploited from websites through JavaScript][6] or [could affect virtualized servers][5] running in cloud environments. However, there have been doubts about whether the technique would also work on the significantly different ARM architecture used in smartphones and other mobile devices.

But now, a team of researchers from the VUSec Group at Vrije Universiteit Amsterdam in the Netherlands, the Graz University of Technology in Austria, and the University of California in Santa Barbara has demonstrated not only are Rowhammer attacks possible on ARM, but they're even easier to pull off than on x86.

The researchers dubbed their new attack Drammer, which stands for deterministic Rowhammer, and plan to present it Wednesday at the 23rd ACM Conference on Computer and Communications Security in Vienna. The attack builds upon previous Rowhammer techniques devised and demonstrated in the past.

The VUSec researchers have created a malicious Android application that doesn't require any permissions and gains root privileges when it is executed by using undetectable memory bit flipping.

The researchers tested 27 Android devices from different manufacturers, 21 using ARMv7 (32-bit) and six using ARMv8 (64-bit) architectures. They managed to flip bits on 17 of the ARMv7 devices and one of the ARMv8 devices, indicating they are vulnerable to the attack.

Furthermore, Drammer can be combined with other Android vulnerabilities such as [Stagefright][4] or [BAndroid][3] to build remote attacks that don't require users to manually download the malicious app.

Google is aware of this type of attack. "After researchers reported this issue to our Vulnerability Rewards Program, we worked closely with them to deeply understand it in order to better secure our users," a Google representative said in an emailed statement. "We’ve developed a mitigation which we will include in our upcoming November security bulletin.”

Google's mitigation complicates the attack, but it doesn't fix the underlying problem, according to the VUSec researchers.

In fact, fixing what is essentially a hardware issue in software is impossible. Hardware vendors are investigating the problem and may be able to fix it in future memory chips, but chips present in existing devices will likely remain vulnerable.

Even worse, it's hard to say which devices are affected because there are many factors that come into play and haven't yet been fully investigated, the researchers said. For example, a memory controller might behave differently when the device battery level is under a certain threshold, so a device that doesn't appear to be vulnerable under a full charge might be vulnerable when its battery is low, the researchers explained.

Also, there's an adage in cybersecurity: Attacks always get better, they never get worse. Rowhammer attacks have grown from theoretical to practical but probabilistic and now to practical and deterministic. This means that a device that does not appear to be affected today could be proven vulnerable to an improved Rowhammer technique tomorrow.

Drammer was demonstrated on Android because the researchers wanted to investigate the impact on ARM-based devices, but the underlying technique likely applies to all architectures and operating systems. The new attack is also a vast improvement over past techniques that required either luck or special features that are present only on certain platforms and easily disabled.

Drammer relies on DMA (direct memory access) buffers used by many hardware subsystems, including graphics, network, and sound. While Drammer is implemented using Android's ION memory allocator, APIs and methods to allocate DMA buffers are present in all operating systems, and this warning is one of the paper's major contributions.

"For the very first time, we show that we can do targeted, fully reliable and deterministic Rowhammer without any special feature," said Cristiano Giuffrida, one of the VUSec researchers. "The memory massaging part is not even Android specific. It will work on any Linux platform -- and we suspect also on other operating systems -- because it exploits the inherent properties of the memory management inside the OS kernel."

"I expect that we're going to see many other flavors of this attack on different platforms," added Herbert Bos, a professor at Vrije Universiteit Amsterdam and leader of the VUSec Systems Security research group.

Along with their [paper][2], the researchers have released an Android app that can test if an Android device is vulnerable to Rowhammer -- at least to the currently known techniques. The app is not yet available on Google Play but can be downloaded from the [VUSec Drammer website][1] to be installed manually. An open-source Rowhammer simulator that can help other researchers investigate this issue further is also available.

--------------------------------------------------------------------------------

via:http://www.csoonline.com/article/3134726/security/physical-ram-attack-can-root-android-and-possibly-other-devices.html

作者：[Lucian Constantin][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.csoonline.com/author/Lucian-Constantin/
[1]:https://www.vusec.net/projects/drammer/
[2]:https://vvdveen.com/publications/drammer.pdf
[3]:https://www.vusec.net/projects/bandroid/
[4]:http://www.csoonline.com/article/3045836/security/new-stagefright-exploit-puts-millions-of-android-devices-at-risk.html
[5]:http://www.infoworld.com/article/3105889/security/flip-feng-shui-attack-on-cloud-vms-exploits-hardware-weaknesses.html
[6]:http://www.computerworld.com/article/2954582/security/researchers-develop-astonishing-webbased-attack-on-a-computers-dram.html
[7]:http://www.computerworld.com/article/2895898/google-researchers-hack-computers-using-dram-electrical-leaks.html
[8]:http://csoonline.com/newsletters/signup.html

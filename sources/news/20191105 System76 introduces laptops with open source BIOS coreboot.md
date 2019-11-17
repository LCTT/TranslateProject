[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (System76 introduces laptops with open source BIOS coreboot)
[#]: via: (https://opensource.com/article/19/11/coreboot-system76-laptops)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)

System76 introduces laptops with open source BIOS coreboot
======
The company answers open hardware fans by revealing two laptops powered
with open source firmware coreboot.
![Guy on a laptop on a building][1]

In mid-October, [System76][2] made an exciting announcement for open source hardware fans: It would soon begin shipping two of its laptop models, [Galago Pro][3] and [Darter Pro][4], with the open source BIOS [coreboot][5].

The coreboot project [says][6] its open source firmware "is a replacement for your BIOS / UEFI with a strong focus on boot speed, security, and flexibility. It is designed to boot your operating system as fast as possible without any compromise to security, with no back doors, and without any cruft from the '80s." Coreboot was previously known as LinuxBIOS, and the engineers who work on coreboot have also contributed to the Linux kernel.

Most firmware on computers sold today is proprietary, which means even if you are running an open source operating system, you have no access to your machine's BIOS. This is not so with coreboot. Its developers share the improvements they make, rather than keeping them secret from other vendors. Coreboot's source code can be inspected, learned from, and modified, just like any other open source code.

[Joshua Woolery][7], marketing director at System76, says coreboot differs from a proprietary BIOS in several important ways. "Traditional firmware is closed source and impossible to review and inspect. It's bloated with unnecessary features and unnecessarily complex [ACPI][8] implementations that lead to PCs operating in unpredictable ways. System76 Open Firmware, on the other hand, is lightweight, fast, and cleanly written." This means your computer boots faster and is more secure, he says.

I asked Joshua about the impact of coreboot on open hardware overall. "The combination of open hardware and open firmware empowers users beyond what's possible when one or the other is proprietary," he says. "Imagine an open hardware controller like [System76's] [Thelio Io][9] without open source firmware. One could read the schematic and write software to control it, but why? With open firmware, the user starts from functioning hardware and software and can expand from there. Open hardware and firmware enable the community to learn from, adapt, and expand on our work, thus moving technology forward as a whole rather than requiring individuals to constantly re-implement what's already been accomplished."

Joshua says System76 is working to open source all aspects of the computer, and we will see coreboot on other System76 machines. The hardware and firmware in Thelio Io, the controller board in the company's Thelio desktops, are both open. Less than a year after System76 introduced Thelio, the company is now marketing two laptops with open firmware.

If you would like to see System76's firmware contributions to the coreboot project, visit the code repository on [GitHub][10]. You can also see the schematics for any supported System76 model by sending an [email][11] with the subject line: _Schematics for &lt;MODEL&gt;_. (Bear in mind that the only currently supported models are darp6 and galp4.) Using the coreboot firmware on other devices is not supported and may render them inoperable,

Coreboot is licensed under the GNU Public License. You can view the [documentation][12] on the project's website and find out how to [contribute][13] to the project on GitHub.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/coreboot-system76-laptops

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_code_programming_laptop.jpg?itok=ormv35tV (Guy on a laptop on a building)
[2]: https://opensource.com/article/19/5/system76-secret-sauce
[3]: https://system76.com/laptops/galago
[4]: https://system76.com/laptops/darter
[5]: https://www.coreboot.org/
[6]: https://www.coreboot.org/users.html
[7]: https://www.linkedin.com/in/joshuawoolery
[8]: https://en.wikipedia.org/wiki/Advanced_Configuration_and_Power_Interface
[9]: https://opensource.com/article/18/11/system76-thelio-desktop-computer
[10]: https://github.com/system76/firmware-open
[11]: mailto:productdev@system76.com
[12]: https://doc.coreboot.org/index.html
[13]: https://github.com/coreboot/coreboot

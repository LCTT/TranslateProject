[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Fedora at the Czech National Library of Technology)
[#]: via: (https://fedoramagazine.org/fedora-at-the-national-library-of-technology/)
[#]: author: (Ben Cotton https://fedoramagazine.org/author/bcotton/)

Fedora at the Czech National Library of Technology
======

![][1]

Where do you turn when you have a fleet of public workstations to manage? If you’re the Czech [National Library of Technology][2] (NTK), you turn to Fedora. Located in Prague, the NTK is the Czech Republic’s largest science and technology library. As part of its public service mission, the NTK provides 150 workstations for public use.

In 2018, the NTK moved these workstations from Microsoft Windows to Fedora. In the [press release][3] announcing this change, Director Martin Svoboda said switching to Fedora will “reduce operating system support costs by about two-thirds.” The choice to use Fedora was easy, according to NTK Linux Engineer Miroslav Brabenec. “Our entire Linux infrastructure runs on RHEL or CentOS. So for desktop systems, Fedora was the obvious choice,” he told Fedora Magazine.

### User reception

Changing an operating system is always a little bit risky—it requires user training and outreach. Brabenec said that non-IT staff asked for training on the new system. Once they learned that the same (or compatible) software was available, they were fine.

The Library’s customers were on board right away. The Windows environment was based on thin client terminals, which were slow for intensive tasks like video playback and handling large office suite files. The only end-user education that the NTK needed to create was a [basic usage guide][4] and a desktop wallpaper that pointed to important UI elements.

![User guidance desktop wallpaper from the National Technology Library.][5]

Although Fedora provides development tools used by the Faculty of Information Technology at the Czech Technical University—and many of the NTK’s workstation users are CTU students—most of the application usage is what you might expect of a general-purpose workstation. Firefox dominates the application usage, followed by the Evince PDF viewer,  and the LibreOffice suite.

### Updates

NTK first deployed the workstations with Fedora 28. They decided to skip Fedora 29 and upgraded to Fedora 30 in early June 2019. The process was simple, according to Brabenec. “We prepared configuration, put it into Ansible. Via AWX I restarted all systems to netboot, image with kickstart, after first boot called provisioning callback on AWX, everything automatically set up via Ansible.”

Initially, they had difficulties applying updates. Now they have a process for installing security updates daily. Each system is rebooted approximately every two weeks to make sure all of the updates get applied.

Although he isn’t aware of any concrete plans for the future, Brabenec expects the NTK to continue using Fedora for public workstations. “Everyone is happy with it and I think that no one has a good reason to change it.”

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/fedora-at-the-national-library-of-technology/

作者：[Ben Cotton][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/bcotton/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/02/czech-techlib-816x345.png
[2]: https://www.techlib.cz/en/
[3]: https://www.techlib.cz/default/files/download/id/86431/tiskova-zprava-z-31-7-2018.pdf
[4]: https://www.techlib.cz/en/82993-public-computers
[5]: https://fedoramagazine.org/wp-content/uploads/2020/02/ntk-wallpaper-1024x576.jpeg

[bazz2 translating]
Docker Working on Security Components, Live Container Migration
================================================================================
![Docker Container Talk](http://www.eweek.com/imagesvr_ce/1905/290x195DockerMarianna.jpg) 

**Docker developers take the stage at Containercon and discuss their work on future container innovations for security and live migration.**

SEATTLE—Containers are one of the hottest topics in IT today and at the Linuxcon USA event here there is a co-located event called Containercon, dedicated to this virtualization technology.

Docker, the lead commercial sponsor of the open-source Docker effort brought three of its top people to the keynote stage today, but not Docker founder Solomon Hykes.

Hykes who delivered a Linuxcon keynote in 2014 was in the audience though, as Senior Vice President of Engineering Marianna Tessel, Docker security chief Diogo Monica and Docker chief maintainer Michael Crosby presented what's new and what's coming in Docker.

Tessel emphasized that Docker is very real today and used in production environments at some of the largest organizations on the planet, including the U.S. Government. Docker also is working in small environments too, including the Raspberry Pi small form factor ARM computer, which now can support up to 2,300 containers on a single device.

"We're getting more powerful and at the same time Docker will also get simpler to use," Tessel said.

As a metaphor, Tessel said that the whole Docker experience is much like a cruise ship, where there is powerful and complex machinery that powers the ship, yet the experience for passengers is all smooth sailing.

One area that Docker is trying to make easier is security. Tessel said that security is mind-numbingly complex for most people as organizations constantly try to avoid network breaches.

That's where Docker Content Trust comes into play, which is a configurable feature in the recent Docker 1.8 release. Diogo Mónica, security lead for Docker joined Tessel on stage and said that security is a hard topic, which is why Docker content trust is being developed.

With Docker Content Trust there is a verifiable way to make sure that a given Docker application image is authentic. There also are controls to limit fraud and potential malicious code injection by verifying application freshness.

To prove his point, Monica did a live demonstration of what could happen if Content Trust is not enabled. In one instance, a Website update is manipulated to allow the demo Web app to be defaced. When Content Trust is enabled, the hack didn't work and was blocked.

"Don't let the simple demo fool you," Tessel said. "You have seen the best security possible."

One area where containers haven't been put to use before is for live migration, which on VMware virtual machines is a technology called vMotion. It's an area that Docker is currently working on.

Docker chief maintainer Michael Crosby did an onstage demonstration of a live migration of Docker containers. Crosby referred to the approach as checkpoint and restore, where a running container gets a checkpoint snapshot and is then restored to another location.

A container also can be cloned and then run in another location. Crosby humorously referred to his cloned container as "Dolly," a reference to the world's first cloned animal, Dolly the sheep.

Tessel also took time to talk about the RunC component of containers, which is now a technology component that is being developed by the Open Containers Initiative as a multi-stakeholder process. With RunC, containers expand beyond Linux to multiple operating systems including Windows and Solaris.

Overall, Tessel said that she can't predict the future of Docker, though she is very optimistic.

"I'm not sure what the future is, but I'm sure it'll be out of this world," Tessel said.

Sean Michael Kerner is a senior editor at eWEEK and InternetNews.com. Follow him on Twitter @TechJournalist.

--------------------------------------------------------------------------------

via: http://www.eweek.com/virtualization/docker-working-on-security-components-live-container-migration.html

作者：[Sean Michael Kerner][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.eweek.com/cp/bio/Sean-Michael-Kerner/

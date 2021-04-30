[#]: subject: (Building an open infrastructure for civic participation)
[#]: via: (https://opensource.com/article/21/4/open-source-cities)
[#]: author: (Daniel Curto-Millet https://opensource.com/users/curtomil)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Building an open infrastructure for civic participation
======
What the deployment of Decide Madrid can teach us on creating a
participatory culture to effectively engage with citizens.
![Building an arch][1]

Open source is living through a curious moment: just like sharing movements in academia and communities once helped develop open source, open source is now inspiring the development of communities. Notions of [open source cities][2] have moved from quaint circles into the mainstream, and open source is now commonly seen on [government sites][3] and even in the [general media][4].

Despite these advances, open source cities are still in their infancy. One of the most ambitious initiatives for open sourcing a city is the implementation of the civic platform Decide Madrid (Spanish for "you decide, Madrid") which was later turned into a more general project called [Consul][5] that any city could deploy. The challenge for Decide Madrid has been less about getting participation and more about getting the _right kind_ of participation. This article aims to give some nuance to the issue of participatory culture, a common problem with open projects.

### Decide Madrid: Software for open source cities

Decide Madrid is an open source civic tech platform developed by the Madrid city council in 2015 and licensed under AFFERO GPL 3. It received the UN's prestigious [public service award in 2018][6] and has been implemented in [more than 100 cities][7], including Paris, New York, and Porto Alegre, Brazil. The platform was designed to be as easy to use as possible.

Madrid's implementation is unique because it gives executive powers to its citizens: any proposal that receives 1% of citizens' votes is automatically placed on the government's agenda. Because of this, Decide Madrid remains one of the most consequential open source projects to date and an important experiment in combining representative and direct democracy in the context of entrenched [disenchantment with democracy][8].

Nonetheless, like any innovative project, Decide Madrid has its challenges. While the organizers' expected greater participation, the project's larger problem was the type of participation it fostered. On paper, the numbers were not negligible: According to the city council's [open data sources][9], connections from users decreased from 1,856,463 in 2017 to 827,328 in 2018, yet the number of pages visited during that span increased from 2,563,620 to 3,330,759.

One possible interpretation is that even though fewer people connected to the platform, those that did, did so more often. The number of proposals—ideas that any citizen registered in Madrid can submit and ask others to vote on—totaled more than 7,000 in 2016. Clearly, there was a significant amount of participation.

### A participation culture requires a participatory infrastructure

A better indicator of a civic platform's success than participation numbers might be its direct effects. In this context, that is how many citizen proposals received enough votes to be sent to the city council. Here, the picture is less rosy: only two citizen proposals were voted onto the agenda. The conversion rate between visits on the site and voting for proposals was too low.

We can solve this in two ways. First, we need more participation, hypothesizing that more participation will increase the number of people voting. Second, we need a different kind of participation; that is, fewer proposals and more voting. Too much participation can be a thorny problem for participation platforms: one person's participation will obfuscate another's. This may lead to participation fatigue for voters, particularly when there are similar proposals. It is easier to propose an idea than to crawl through thousands of proposals, searching for one you agree with. Following this line of thought, Decide Madrid may have been too successful in one respect.

Also, there are no equivalent standards for effective citizen participation as there are for participating in open source programming. Decide Madrid's democratizing ambitions aim to allow and even encourage anyone to participate. The platform faces a catch-22 problem: If the platform increases the requirements for making proposals, it erodes its potential for direct democracy and promise of social inclusion. On the other hand, if it does nothing, then proposals that _could_ be voted in will not be because they are hidden away in subpages.

Understanding participatory culture as just a numbers game can be part of the problem. Participation is not only about quantity but, perhaps more importantly, about how it materializes—who speaks and in what way—and technology can hide understanding of these processes.

Decide Madrid needed ways of avoiding duplicate proposals and fragmenting issues into myriad similar proposals, determining the appropriate linguistic styles of proposals (e.g., avoiding technical or dense proposals), limiting proposals for things the city cannot fix, and legitimizing proposals to show their value.

Even for well-established open source projects, encouraging effective contributions remains a time-consuming activity that involves mentorship. This is true even in projects with well-developed infrastructures and professional participation standards that include procedures to follow with pull requests encoded in a program, coding standards, expectations for commenting code appropriately, informative variable names, automated tools, etc. There is very little such infrastructure for participatory platforms, and what exists supports the technical side (e.g., software development and deployment).

### Creating a participatory civic culture

Open sourcing a city requires helping citizens participate in the best possible conditions and paying attention to their own contexts and requirements. This is important since the modern understanding of "citizens" is articulated around the idea that they renounce their own power in exchange for security. This is called the social contract, and it is a foundational concept in constructing the contemporary idea of "nation." It is a weak form of democracy, relying on regular yet infrequent participation (and sometimes even discouraging active participation).

Creating a participatory culture requires thinking beyond technology and participation numbers. It entails building an infrastructure that continuously supports citizens in participating. Cities can look to open source and its decades of experience in creating this type of infrastructure to find valuable lessons.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/open-source-cities

作者：[Daniel Curto-Millet][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/curtomil
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_BUS_ArchitectureOfParticipation_520x292.png?itok=FA0Uuwzv (Building an arch)
[2]: https://opensource.com/government/13/6/five-elements-open-source-city
[3]: https://contribuez.conventioncitoyennepourleclimat.fr/
[4]: https://www.theguardian.com/environment/earth-insight/2014/jun/19/open-source-revolution-conquer-one-percent-cia-spy
[5]: https://github.com/consul/consul
[6]: https://publicadministration.un.org/unpsa/database/Winners/2018-winners/Citizen-participation-project
[7]: https://consulproject.org/en/
[8]: https://muse.jhu.edu/article/645532/summary?casa_token=VtFtdSC6hMIAAAAA:BOR_Z-BBZ-rY-ADKytd_6Bh0ZNWpr19tbLz8bfaQdTEBjjFMmk38DJZEBT1bxAxOfv9vexaxEw
[9]: https://datos.madrid.es/sites/v/index.jsp?vgnextoid=374512b9ace9f310VgnVCM100000171f5a0aRCRD&buscar=true&Texto=decide.madrid&Sector=&Formato=&Periodicidad=&orderByCombo=CONTENT_INSTANCE_NAME_DECODE

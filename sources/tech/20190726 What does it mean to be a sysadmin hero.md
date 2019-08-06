[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What does it mean to be a sysadmin hero?)
[#]: via: (https://opensource.com/article/19/7/sysadmin-heroics-saving-day)
[#]: author: (Opensource.com https://opensource.com/users/admin)

What does it mean to be a sysadmin hero?
======
Two stories from the community on sysadmin heroics: What does it mean to
you?
![Open Force superhero characters][1]

Sysadmins spend a lot of time preventing and fixing problems. There are certainly times when a sysadmin becomes a hero, whether to their team, department, company, or the general public, though the people they "saved" from trouble may never even know.

Enjoy these two stories from the community on sysadmin heroics. What does it mean to you?

* * *

I worked as a system administrator for a contract with the Army National Guard in the early 2000s. I was involved in a project to pilot a new content management system. This system would enable distribution of online educational materials to classrooms across the country. The state of Montana was chosen for the initial pilot and test phase. I traveled to Montana and deployed several servers running Red Hat Linux plus the content management software in their data centers.

A few days later, I received a call at my regular office from a worried guardsman with urgent news. One of the servers would not boot. Due to the circumstances, there was no way to easily troubleshoot.

The testing was scheduled to commence the following week, which left little time to get the server back online. A delay in the project would be costly. I needed to solve the problem fast. Fortunately, we had several identical servers in our local data center. I used one of them to reinstall the operating system and applications, and then configured it identically to the problem server back in Montana. I then pulled the hard drive, packed it safely, and overnighted it to the Montana National Guard Armory.

The guardsman called me the next morning to say he had the replacement drive. I instructed him on how to remove and replace the boot drive. After doing so, he pressed the power button. We waited for several silent seconds before he informed me that he could see lights and hear the sound of drive activity. I began pinging the server and after a few positive responses, I was able to SSH into it. This was a great sign!

Everyone was relieved that the server was online again so that testing could get underway.

If you want to know more about this program, [there is an article here][2]. (It takes a really long time to load for some reason, so I saved it as a PDF just in case.) 

—_Alan Formy-Duval_

* * *

Humans love good stories. In IT, stories about heroic feats of coding and cabling go back to the first computers and the bugs that lived inside them. They’re all loved. They’re loved more if the audience wasn’t part of the fallout of what created the story.

Sysadmins tend to be left holding the bag when events turn sour. That fact affords us the often unwanted honor of being cast as the protagonist for one of these stories. Antagonists can be anything from bad weather or dug up cables, to mistyped commands, or simply human error. Because we operate in an industry built around generated conflict and drama, the legendary epics in our industry usually involve sysadmins battling the thoughtless developer. It’s an old trope, but a good one that gets lots of laughs and amazed stares when the stories are told.

I’ve always been someone who’s loved to share these stories with my peers and friends. The camaraderie and the laughs are important to me. These stories are ice breakers and scene closers when on stage, in a conference room, or just when having a beer with your friends after a hard day. But this year, I’ve begun to think about our storytelling tradition a little differently. The heroes we should be talking about around the water cooler aren’t the sysadmins who fix the problem with a flourish at 3am on Sunday. The true heroes in the industry are the sysadmins who prevent the problem from ever happening at 3pm on a Tuesday.

When I talk to my customers about building effective solutions, I focus the conversation around two core principles. First, I implore them to not rabbit hole themselves with shiny objects and base their solution around proven, supportable technology. Yes, shiny new tech can provide value in some use cases. But most likely it just adds complexity that drives down stability and maintainability. These factors all work together to ultimately slow down adoption by their end users.

Platforms that don’t grow are platforms that don’t last. I don’t want to work on a platform that won’t be around for its first upgrade. Violating this principle creates systems that require Herculean efforts to keep alive. No one benefits from that situation, even if you do get a good story out of it.

The second principle I drive home every time I get a chance is to focus on fundamental knowledge, and understand how the technology we’re implementing actually works. We’ve focused for a long time in our industry on marketing our products as fast to deploy, and easy to manage, but that’s almost always a thin veneer. Every IT system designed by humans will ultimately break at some point in its lifecycle. If you don’t understand what’s happening when that system goes sideways, you don’t have a chance of recovering without writing a new saga to talk about at lunch for weeks to come.

It took me much longer than I’m comfortable with to figure out that the same hero stories we all enjoyed are a result of not sticking to the fundamental principles that I value the most in any solution I have a hand in creating. So, when Sysadmin Day rolls around this year, I won’t be lifting my glass to the heroes who built a bad system and kept it alive through extreme circumstances and too much caffeine. I’ll tip my hat and share a drink with the boring people in the middle of our industry who specialize in preventing the hero moments. A boring weekend with the on-call phone is the most heroic thing I’m ever going to ask from my sysadmin brethren from now on.

_—Jamie Duncan_

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/sysadmin-heroics-saving-day

作者：[Opensource.com][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/admin
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/superhero_character_open_force.jpg?itok=cndIf6Zw (Open Force superhero characters)
[2]: https://gcn.com/Articles/2002/01/18/National-Guard-will-test-distancelearning-standard.aspx

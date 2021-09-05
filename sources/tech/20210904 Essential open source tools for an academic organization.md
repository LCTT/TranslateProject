[#]: subject: "Essential open source tools for an academic organization"
[#]: via: "https://opensource.com/article/21/9/open-source-tools-ospo"
[#]: author: "Quinn Foster https://opensource.com/users/quinn-foster"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Essential open source tools for an academic organization
======
A look into the digital infrastructure of an academic open source
programs office (OSPO).
![Wratchet set tools][1]

As an academic open source programs office (OSPO), [Open @RIT][2]'s mission is to assist faculty, staff, and students at the Rochester Institute of Technology in creating and maintaining communities for their open projects. We accomplish this by offering consultation and documents that teach our clients the best ways to operate their communities and projects. None of this would be feasible, however, if not for the systems of digital infrastructure we have created and adopted to facilitate these interactions.

Whether you're starting your own academic OSPO or an open source project, finding the right tools and methods for managing your unique community can be challenging if you don't know where to look. Therefore, in the spirit of openness, the Open @RIT team is happy to share the experiences and strategies used to build our digital infrastructure right here.

To begin, much of what we have built is thanks to our collaboration with the open source experts at the Institute of Electrical and Electronics Engineers ([IEEE][3]). Founded back in the 19th century during the advent of widespread electricity use, IEEE remains the largest technical professional organization globally and strives to advance technology for the benefit of humanity. The utilization of open source is an integral part of this goal. [IEEE SA OPEN][4], the IEEE sub-group which has created a dedicated open source collaboration platform, aims to create a unified infrastructure stack for open source communities.

As a participant in IEEE SA OPEN's open technical advisory group, Open @RIT has worked with the group by advising in selecting and approving a variety of software tools they are considering supporting in their standards.

> "We're trying to learn about how they operate within the academic sector, and then because they're open source, we can really easily contribute back and contribute these findings,"
>
> Mike Nolan, assistant director of Open @RIT.

The tools IEEE SA OPEN and Open @RIT select help develop Open @RIT's digital infrastructure and assist its clients in an academic environment. In turn, Open @RIT provides feedback and even technical contributions to IEEE SA OPEN to extend their infrastructure effectively. Each tool, all of which are open source, carries out a key role:

  * [Mattermost][5] is a collaboration platform built with project developers in mind. We've been using Mattermost to communicate and share work, and we highly recommend it for anybody developing an open source project.
  * [Gitlab][6] allows you to store files of code and develop them collaboratively with your team.
  * [Nextcloud][7] is a cloud-based file hosting service where you can create and share documents with your team and manage projects and deadlines. Adapting Nextcloud into the standards is still in process and not yet approved, but it holds tremendous potential for IEEE SA OPEN.



A crucial benefit we've experienced using these tools alongside IEEE SA OPEN is finding ways to interact with each other. For example, Mattermost's ChatOps function allows you to install a Gitlab plugin into your Mattermost servers, allowing notifications of issues, merge requests, direct mentions, and other changes made in Gitlab to appear in your message boards. This, among potential future additions, demonstrates how these tools can become a cohesive standard in building open infrastructure.

In addition to working with IEEE SA OPEN, we have also made inroads with CHAOSS Software and utilized their community analysis software, [GrimoireLab.][8] Their tool is a community health analytics software that calculates and reports metrics of open source project communities. This includes things like the time it takes to resolve reported issues, contributor affiliations, code management, and more.

Open @RIT uses GrimoireLab and provides feedback and contributions to the CHAOSS community based upon our unique position of monitoring community health in academia. One of our more significant contributions is Mystic, a digital portal and dashboard of our design. Anyone at RIT can submit their open source projects and receive generated community health statistics. Mystic leverages GrimoireLab to take these projects and reports the community metrics and analytics back to the user. Using GrimoireLab in this way helps build the open source community at RIT while contributing back to CHAOSS to make their tools more applicable to academic institutions.

We hope the information shared here has provided you with the tips and tricks to kickstart your open source project. Whether it's academic in nature or not, these tools can be great additions to the digital infrastructure holding your project community together.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/open-source-tools-ospo

作者：[Quinn Foster][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/quinn-foster
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tools_osyearbook2016_sysadmin_cc.png?itok=Y1AHCKI4 (Wratchet set tools)
[2]: https://www.rit.edu/research/open
[3]: https://www.ieee.org/
[4]: https://saopen.ieee.org/
[5]: https://mattermost.com/
[6]: https://about.gitlab.com/
[7]: https://opensource.com/tags/nextcloud
[8]: https://chaoss.github.io/grimoirelab/

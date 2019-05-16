[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Get started with Libki to manage public user computer access)
[#]: via: (https://opensource.com/article/19/5/libki-computer-access)
[#]: author: (Don Watkins  https://opensource.com/users/don-watkins/users/tony-thomas)

Get started with Libki to manage public user computer access
======
Libki is a cross-platform, computer reservation and time management
system.
![][1]

Libraries, schools, colleges, and other organizations that provide public computers need a good way to manage users' access—otherwise, there's no way to prevent some people from monopolizing the machines and ensure everyone has a fair amount of time. This is the problem that [Libki][2] was designed to solve.

Libki is an open source, cross-platform, computer reservation and time management system for Windows and Linux PCs. It provides a web-based server and a web-based administration system that staff can use to manage computer access, including creating and deleting users, setting time limits on accounts, logging out and banning users, and setting access restrictions.

According to lead developer [Kyle Hall][3], Libki is mainly used for PC time control as an open source alternative to Envisionware's proprietary computer access control software. When users log into a Libki-managed computer, they get a block of time to use the computer; once that time is up, they are logged off. The default setting is 45 minutes, but that can easily be adjusted using the web-based administration system. Some organizations offer 24 hours of access before logging users off, and others use it to track usage without setting time limits.

Kyle is currently lead developer at [ByWater Solutions][4], which provides open source software solutions (including Libki) to libraries. He developed Libki early in his career when he was the IT tech at the [Meadville Public Library][5] in Pennsylvania. He was occasionally asked to cover the children's room during lunch breaks for other employees. The library used a paper sign-up sheet to manage access to the computers in the children's room, which meant constant supervision and checking to ensure equitable access for the people who came there.

Kyle said, "I found this system to be cumbersome and awkward, and I wanted to find a solution. That solution needed to be both FOSS and cross-platform. In the end, no existing software package suited our particular needs, and that is why I developed Libki."

Or, as Libki's website proclaims, "Libki was born of the need to avoid interacting with teenagers and now allows librarians to avoid interacting with teenagers around the world!"

### Easy to set up and use

I recently decided to try Libki in our local public library, where I frequently volunteer. I followed the [documentation][6] for the automatic installation, using Ubuntu 18.04 Server, and very quickly had it up and running.

I am planning to support Libki in our local library, but I wondered about libraries that don't have someone with IT experience or the ability to build and deploy a server. Kyle says, "ByWater Solutions can cloud-host a Libki server, which makes maintenance and management much simpler for everyone."

Kyle says ByWater is not planning to bundle Libki with its most popular offering, open source integrated library system (ILS) Koha, or any of the other [projects][7] it supports. "Libki and Koha are different [types of] software serving different needs, but they definitely work well together in a library setting. In fact, it was quite early on that I developed Libki's SIP2 integration so it could support single sign-on using Koha," he says.

### How you can contribute

Libki client is licensed under the GPLv3 and Libki server is licensed under the AGPLv3. Kyle says he would love Libki to have a more active and robust community, and the project is always looking for new people to join its [contributors][8]. If you would like to participate, visit [Libki's Community page][9] and join the mailing list.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/libki-computer-access

作者：[Don Watkins ][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins/users/tony-thomas
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/desk_clock_job_work.jpg?itok=Nj4fuhl6
[2]: https://libki.org/
[3]: https://www.linkedin.com/in/kylemhallinfo/
[4]: https://opensource.com/article/19/4/software-libraries
[5]: https://meadvillelibrary.org/
[6]: https://manual.libki.org/master/libki-manual.html#_automatic_installation
[7]: https://bywatersolutions.com/projects
[8]: https://github.com/Libki/libki-server/graphs/contributors
[9]: https://libki.org/community/

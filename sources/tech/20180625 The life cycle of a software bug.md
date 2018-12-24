translated by lixinyuxx
The life cycle of a software bug
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bug_software_issue_tracking_computer_screen.jpg?itok=6qfIHR5y)

In 1947, the first computer bug was found—a moth trapped in a computer relay.

If only all bugs were as simple to uncover. As software has become more complex, so too has the process of testing and debugging. Today, the life cycle of a software bug can be lengthy—though the right technology and business processes can help. For open source software, developers use rigorous ticketing services and collaboration to find and mitigate bugs.

### Confirming a computer bug

During the process of testing, bugs are reported to the development team. Quality assurance testers describe the bug in as much detail as possible, reporting on their system state, the processes they were undertaking, and how the bug manifested itself.

Despite this, some bugs are never confirmed; they may be reported in testing but can never be reproduced in a controlled environment. In such cases they may not be resolved but are instead closed.

It can be difficult to confirm a computer bug due to the wide array of platforms in use and the many different types of user behavior. Some bugs only occur intermittently or under very specific situations, and others may occur seemingly at random.

Many people use and interact with open source software, and many bugs and issues may be non-repeatable or may not be adequately described. Still, because every user and developer also plays the role of quality assurance tester, at least in part, there is a good chance that bugs will be revealed.

When a bug is confirmed, work begins.

### Assigning a bug to be fixed

A confirmed bug is assigned to a developer or a development team to be addressed. At this stage, the bug needs to be reproduced, the issue uncovered, and the associated code fixed. Developers may categorize this bug as an issue to be fixed later if the bug is low-priority, or they may assign someone directly if it is high-priority. Either way, a ticket is opened during the process of development, and the bug becomes a known issue.

In open source solutions, developers may select from the bugs that they want to tackle, either choosing the areas of the program with which they are most familiar or working from the top priorities. Consolidated solutions such as [GitHub][1] make it easy for multiple developers to work on solutions without interfering with each other's work.

When assigning bugs to be fixed, reporters may also select a priority level for the bug. Major bugs may have a high priority level, whereas bugs related to appearance only, for example, may have a lower level. This priority level determines how and when the development team is assigned to resolve these issues. Either way, all bugs need to be resolved before a product can be considered complete. Using proper traceability back to prioritized requirements can also be helpful in this regard.

### Resolving the bug

Once a bug has been fixed, it is usually be sent back to Quality Assurance as a resolved bug. Quality Assurance then puts the product through its paces again to reproduce the bug. If the bug cannot be reproduced, Quality Assurance will assume that it has been properly resolved.

In open source situations, any changes are distributed—often as a tentative release that is being tested. This test release is distributed to users, who again fulfill the role of Quality Assurance and test the product.

If the bug occurs again, the issue is sent back to the development team. At this stage, the bug is reopened, and it is up to the development team to repeat the cycle of resolving the bug. This may occur multiple times, especially if the bug is unpredictable or intermittent. Intermittent bugs are notoriously difficult to resolve.

If the bug does not occur again, the issue will be marked as resolved. In some cases, the initial bug is resolved, but other bugs emerge as a result of the changes made. When this happens, new bug reports may need to be initiated, starting the process over again.

### Closing the bug

After a bug has been addressed, identified, and resolved, the bug is closed and developers can move on to other areas of software development and testing. A bug will also be closed if it was never found or if developers were never able to reproduce it—either way, the next stage of development and testing will begin.

Any changes made to the solution in the testing version will be rolled into the next release of the product. If the bug was a serious one, a patch or a hotfix may be provided for current users until the release of the next version. This is common for security issues.

Software bugs can be difficult to find, but by following set processes and procedures, developers can make the process faster, easier, and more consistent. Quality Assurance is an important part of this process, as QA testers must find and identify bugs and help developers reproduce them. Bugs cannot be closed and resolved until the error no longer occurs.

Open source solutions distribute the burden of quality assurance testing, development, and mitigation, which often leads to bugs being discovered and mitigated more quickly and comprehensively. However, because of the nature of open source technology, the speed and accuracy of this process often depends upon the popularity of the solution and the dedication of its maintenance and development team.

_Rich Butkevic is a PMP certified project manager, certified scum master, and runs[Project Zendo][2] , a website for project management professionals to discover strategies to simplify and improve their project results. Connect with Rich at [Richbutkevic.com][3] or on [LinkedIn][4]._

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/life-cycle-software-bug

作者：[Rich Butkevic][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/rich-butkevic
[1]:https://github.com/
[2]:https://projectzendo.com
[3]:https://richbutkevic.com
[4]:https://www.linkedin.com/in/richbutkevic

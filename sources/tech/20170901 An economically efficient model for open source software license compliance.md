translating----geekpi

An economically efficient model for open source software license compliance
============================================================

### Using open source the way it was intended benefits your bottom line and the open source ecosystem.


![An economically efficient model for open source software license compliance](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LAW_EvidencedBasedIP_520x292_CS.png?itok=mmhCWuZR "An economically efficient model for open source software license compliance")
Image by : opensource.com

"The Compliance Industrial Complex" is a term that evokes dystopian imagery of organizations engaging in elaborate and highly expensive processes to comply with open source license terms. As life often imitates art, many organizations engage in this practice, sadly robbing them of the many benefits of the open source model. This article presents an economically efficient approach to open source software license compliance.

Open source licenses generally impose three requirements on a distributor of code licensed from a third party:

1.  Provide a copy of the open source license(s)

2.  Include copyright notices

3.  For copyleft licenses (like GPL), make the corresponding source code available to the distributees

 _(As with any general statement, there may be exceptions, so it is always advised to review license terms and, if necessary, seek the advice of an attorney.)_ 

Because the source code (and any associated files, e.g. license/README) generally contains all of this information, the easiest way to comply is to simply provide the source code along with your binary/executable application.

The alternative is more difficult and expensive, because, in most situations, you are still required to provide a copy of the open source licenses and retain copyright notices. Extracting this information to accompany your binary/executable release is not trivial. You need processes, systems, and people to copy this information out of the sources and associated files and insert them into a separate text file or document.

The amount of time and expense to create this file is not to be underestimated. Although there are software tools that may be used to partially automate the process, these tools often require resources (e.g., engineers, quality managers, release managers) to prepare code for scan and to review the results for accuracy (no tool is perfect and review is almost always required). Your organization has finite resources, and diverting them to this activity leads to opportunity costs. Compounding this expense, each subsequent release—major or minor—will require a new analysis and revision.

There are also other costs resulting from not choosing to release sources that are not well recognized. These stem from not releasing source code back to the original authors and/or maintainers of the open source project, an activity known as upstreaming. Upstreaming alone seldom meets the requirements of most open source licenses, which is why this article advocates releasing sources along with your binary/executable; however, both upstreaming and providing the source code along with your binary/executable affords additional economic benefits. This is because your organization will no longer be required to keep a private fork of your code changes that must be internally merged with the open source bits upon every release—an increasingly costly and messy endeavor as your internal code base diverges from the community project. Upstreaming also enhances the open source ecosystem, which encourages further innovations from the community from which your organization may benefit.

So why do a significant number of organizations not release source code for their products to simplify their compliance efforts? In many cases, this is because they are under the belief that it may reveal information that gives them a competitive edge. This belief may be misplaced in many situations, considering that substantial amounts of code in these proprietary products are likely direct copies of open source code to enable functions such as WiFi or cloud services, foundational features of most contemporary products.

Even if changes are made to these open source works to adapt them for proprietary offerings, such changes are often de minimis and contain little new copyright expression or patentable content. As such, any organization should look at its code through this lens, as it may discover that an overwhelming percentage of its code base is open source, with only a small percentage truly proprietary and enabling differentiation from its competitors. So why then not distribute and upstream the source to those non-differentiating bits?

Consider rejecting the Compliance Industrial Complex mindset to lower your cost and drastically simplify compliance. Use open source the way it was intended and experience the joy of releasing your source code to benefit your bottom line and the open source ecosystem from which you will continue to reap increasing benefits.

------------------------

作者简介

Jeffrey Robert Kaufman - Jeffrey R. Kaufman is an Open Source IP Attorney for Red Hat, Inc., the world’s leading provider of open source software solutions. Jeffrey also serves as an adjunct professor at the Thomas Jefferson School of Law. Previous to Red Hat, Jeffrey served as Patent Counsel at Qualcomm Incorporated providing open source counsel to the Office of the Chief Scientist. Jeffrey holds multiple patents in RFID, barcoding, image processing, and printing technologies.[More about me][2]


--------------------------------------------------------------------------------

via: https://opensource.com/article/17/9/economically-efficient-model

作者：[ Jeffrey Robert Kaufman ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jkaufman
[1]:https://opensource.com/article/17/9/economically-efficient-model?rate=0SO3DeFAxtgLdmZxE2ZZQyTRTTbu2OOlksFZSUXmjJk
[2]:https://opensource.com/users/jkaufman
[3]:https://opensource.com/user/74461/feed
[4]:https://opensource.com/users/jkaufman
[5]:https://opensource.com/users/jkaufman
[6]:https://opensource.com/users/jkaufman
[7]:https://opensource.com/tags/law
[8]:https://opensource.com/tags/licensing
[9]:https://opensource.com/participate

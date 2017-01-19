Do I need to provide access to source code under the AGPLv3 license?
============================================================
 ![Do I need to provide access to source code under the AGPLv3 license?](https://opensource.com/sites/default/files/styles/image-full-size/public/images/law/LAW_PatentSpotlight_520x292_cm.png.png?itok=bCn-kMx2 "Do I need to provide access to source code under the AGPLv3 license?") 

Image by : 

opensource.com

The [GNU Affero General Public License version 3][1] (AGPLv3) is a copyleft license nearly identical to the GPLv3\. Both licenses have the same copyleft scope, but materially differ in one important way. The AGPLv3's Section 13 states an additional condition not present in GPLv2 or GPLv3:

> Notwithstanding any other provision of this License, if you modify the Program, your modified version must prominently offer all users interacting with it remotely through a computer network (if your version supports such interaction) an opportunity to receive the Corresponding Source of your version by providing access to the Corresponding Source from a network server at no charge, through some standard or customary means of facilitating copying of software.

This condition was intended to apply mainly to what would now be considered SaaS deployments, although the reach of "interacting remotely through a computer network" should perhaps be read to cover situations going beyond conventional SaaS. The objective was to close a perceived loophole in the ordinary GPL in environments where users make use of functionality provided as a web service, but no distribution of the code providing the functionality occurs. Hence, Section 13 provides an additional source code disclosure requirement beyond the object code distribution triggered requirement contained in GPLv2 Section 3 and GPLv3 and AGPLv3 Section 6.

What is often misunderstood is that the source code requirement in AGPLv3 Section 13 is triggered only where the AGPLv3 software has been modified by "you" (for example, the entity providing the network service). My interpretation is that, so long as "you" do not modify the AGPLv3 code, the license should not be read as requiring access to the Corresponding Source in the manner prescribed by Section 13\. As I see it, many unmodified and standard deployments of software modules under AGPL simply do not trigger Section 13, although making the source code available even if not required under the license is a good idea.

How terms and conditions of the AGPL could be interpreted, including whether the AGPL software has been modified, may require legal analysis depending on the facts and details of the specific use case.

--------------------------------------------------------------------------------

作者简介：

![]()

Jeffrey R. Kaufman is an Open Source IP Attorney for Red Hat, Inc., the world’s leading provider of open source software solutions. Jeffrey also serves as an adjunct professor at the Thomas Jefferson School of Law. Previous to Red Hat, Jeffrey served as Patent Counsel at Qualcomm Incorporated providing open source counsel to the Office of the Chief Scientist. Jeffrey holds multiple patents in RFID, barcoding, image processing, and printing technologies.

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/providing-corresponding-source-agplv3-license

作者：[Jeffrey Robert Kaufman][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jkaufman
[1]:https://www.gnu.org/licenses/agpl-3.0-standalone.html

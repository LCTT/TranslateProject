Insights into top 3 IT skill groups in highest demand
================================================================================
![](http://www.linuxcareer.com/images/linux_it_skills_watch.png)

According to our [IT skill sets][1] research, IT skills required by employers of Linux talent can be classified into relatively independent groups. This article focuses on the top three groups of IT skills that were in the highest demand in the last quarter (Jul-Sep 2013) and refer to job advertisements in selected countries, including USA. It turns out that these three groups of IT skills can be linked with Linux related job categories.

It seems that in the last quarter Embedded Devices Developers related skills were in the highest demand by employers of Linux professionals. The second and third skill groups refer to Virtualization Engineering and LAMP Administrator job opportunities, respectively. This article discusses skill requirements for these three types of job listings and provides insights into the dependency structure of pairs of IT skills within the analyzed three groups of skills.

> If you have not read our [IT Skill Sets][1] article it is recommended to familiarize yourself with this article before you start reading the content below. This article is based on the material presented previously in [IT Skill Sets][1], which explains in detail the methodology used in this study.

### October 2013 update to IT skills classification ###

![](http://www.linuxcareer.com/images/percentage_of_linux_job_ads_linked_with_corresponding_skill_groups.png)

In the IT skill sets article, LinuxCareer.com analyzed the Linux job listings for the period between May and the end of June 2013. We have brought this classification up to date by considering the period of July until the end of September 2013. The percentage of Linux job ads corresponding to ten relatively independent groups of IT skills is displayed in the above bar chart[1]. The following link to the [IT Classification][2] diagram shows how this bar chart was devised based on the classifications. The top three IT skill groups in highest demand are: Embedded Devices Developers with 27% of Linux job market share; Virtualization Engineers with 20% of Linux job market share; and LAMP Administrators with 12% of Linux job market share. In the next three sections of this article we will focus on the identified top 3 IT skill groups and discuss in detail relationships between pairs of skills. For instance, MySQL and PHP are strongly linked and usually required in tandem by employers. Note also that knowledge of Linux is required in every job advertisement taken into account in the study conducted by LinuxCareer.com.

### Embedded Devices Developers and Programmers ###

The first set of skills in the highest demand are skills relevant to Embedded Devices Developers and Programmers. Dependency chart[2] below shows more detail pertaining to relationships between pairs of skills. Specifically, it shows which pairs of skills are most likely to appear together in Linux related job advertisements. For instance, Embedded links strongly to C/C++/C#, which is visualized in the graph by either darker shade of a rectangle in the lower part of the graph or larger portion of the corresponding circles shaded in the upper portion of the graph.

In general, this group of skills can be further split into three segments. These are:

1. **Android, Embedded, C/C++/C# and Java**. This is the core of the skills you need to know if you would like to work in development of embedded devices. It is possible that either C/C++/C# or Java is required by employers, since Java is based to some extend on C/C++/C#. If you have a look at the October’s IT Skills Watch, Java leads as a programming language with the score of 9513 compared with the C/C++/C# score of 5403. Therefore, in general, if you stand before a choice between mastering of C/C++/C# or Java, Java seems to be a better choice. However, according to the graph below, C/C++/C# seems to appear more frequently in the advertisements relevant to Embedded devices. This suggests that, even though Java gets a higher general score in IT Skills Watch, mastering of C/C++/C# rather than Java is required for Embedded Devices Developer positions.
1.** Python, Perl and Bash**. These set of skills are a complementary set of programming and scripting skills. Perl and Python seem to appear often together in job advertisements, however, it is reasonable to assume that these two skills are required alternatively.
1. **Git, Subversion and Jira**. These skills pertain to source code management, debugging and project management. Some knowledge of these skills is certainly an advantage to programming related projects. Currently, the majority of open source development projects and a large number of corporate projects use such software to manage their source code.

![](http://www.linuxcareer.com/images/embedded_devices_development_skills_demand_dependency.png)

### Virtualization Engineers including skills related to data storage and management ###

The second group of skills that are currently in demand are the group of skills relating to job advertisements relevant to Virtualization Engineering job opportunities as illustrated in the dependency chart[2] below. This group can be further divided into two segments. The first segment of skills is Redhat, VMware, vSphere, ESX/ESXi, XenServer and Citrix. These skills are paramount for Virtualization Engineering job opportunities. The second segment of skills are skills relevant to Unix Systems, Data Storage and Management. It appears that these two segments are closely related. It is not a surprise that VMware comes together with ESX/ESXi and vSphere since ESX/ESXi is a computer virtualization product offered by VMware and vSphere is VMware’s cloud computing virtualization operating system. It is also interesting that Redhat has been grouped with VMware and Citrix products. The strong relation of Solaris and AIX could be a consequence of the fact that they are both proprietary Unix Systems and possibly knowledge of either one of them is sufficient.

![](http://www.linuxcareer.com/images/virtualization_engineering_skills_demand_dependency.png)

### LAMP Administrators ###

Finally, the third group of skills is the type of skills required by employers of LAMP administrators exhibited in the dependency chart[2] below. LAMP stands for Linux Apache MySQL and PHP. All these skills are a core for a LAMP administrator. This is a relatively small group of skills that can take you far in your Linux career. In particular, the strong relation of PHP and MySQL suggests that one of these skills cannot come without the other.

![](http://www.linuxcareer.com/images/lamp_administrator_skills_demand_dependency.png)

### Conclusion ###

In terms of employability and groups of skills relevant to Linux professionals, this article has identified two important points. The first point shows ten groups of IT skills that were identified by clustering analysis of the most frequently appearing IT skills. The second point of this article shows that the highest demand exists for Embedded Devices and Programmers positions as indicated in the Percentage of Linux job ads linked with corresponding skill groups bar chart. This is followed by job advertisements relevant to Virtualisation Engineering positions and LAMP administrator positions. These three skill groups are core Linux related professions in the last quarter analyzed.

### References ###

[1] Percentage of Linux job ads linked with corresponding skill groups created by [GNU R][3]. Relevant package: graphics.

[2] Dependency charts created by [GNU R][3]. Relevant package: corrgram.

--------------------------------------------------------------------------------

via: http://www.linuxcareer.com/insights-into-top-3-it-skills-groups-in-highest-demand

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.linuxcareer.com/it-skill-sets
[2]:http://www.linuxcareer.com/images/Linux_jobs_classification_jul_oct_2013.png
[3]:http://www.r-project.org/
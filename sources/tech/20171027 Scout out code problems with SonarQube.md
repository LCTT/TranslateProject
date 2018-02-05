Scout out code problems with SonarQube
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/open%20source_collaboration_0.png?itok=YEl_GXbv)

More and more organizations are implementing [DevOps][1] to make it faster to get quality code into the production environment after passing through the intermediate development and testing environments. Although things such as version control, continuous integration and deployment, and automated testing all fall under the scope of DevOps, one critical question remains: How can an organization quantify code quality, not just deployment speed?

[SonarQube][2] is one option to fill this gap. It is an open source platform that continually inspects code quality via automatic static analysis of the source code. SonarQube can analyze more than 20 coding languages and store issues on all sorts of project types.

SonarQube also offers a centralized location for maintaining and managing code issues within multiple, multi-language projects simultaneously. Custom rules can be implemented per project. Continuous inspection permits the analysis of the overall trajectory of the code's health.

SonarQube can also be integrated into continuous integration and development (CI/CD) pipelines, assisting in and automating the process of determining the code's readiness for the production environment.

### What it can measure

Out of the box, SonarQube can measure key metrics, including bugs, code smells, security vulnerabilities, and duplicated code.

  * **Bugs** are portions of code that are incorrect or likely functioning improperly, thus producing potentially erroneous results. These are obvious errors that should be fixed before the code is released to production.
  * **[Code smells][3]** differ from bugs in that the detected code likely functions correctly and as intended. However, it may be hard to maintain, lead to future bugs, be uncovered by unit tests, or have other problems. For long-term maintainability, it's smart to fix code smells right away. It's generally hard to detect code smells when writing code, but SonarQube's static analysis is one way to discover them.
  * **Security vulnerabilities** are exactly as they sound: a flaw somewhere in the code that may present a security issue. These vulnerabilities should be fixed to prevent hackers from exploiting them.
  * **Duplicated code** is also exactly as it sounds: portions of code that are repeated in the source code. Code duplication is a bad practice in software design. On the whole, it leads to maintainability problems if changes are made to one portion but not another. Identifying code duplication makes it easier to package the duplicated code into a library for repeated use, for example.



### What customization options exist

Because it is open source, SonarQube encourages users to develop and offer customization options. Currently there are more than 60 [plugins][4] available to augment SonarQube's out-of-the-box analysis functionality.

The majority of the plugins were created to increase the number of coding languages SonarQube can analyze. Other plugins enable analysis of extra metrics or include other views for the displayed dashboards. Essentially, if an organization needs to examine a custom metric, wants to view its analyzed data in specific ways on its own dashboard, or uses a coding language that SonarQube doesn't support, there are probably customization options available. If the needed functionality doesn't yet exist, the openness of SonarQube's source code makes it possible to develop custom solutions.

Users can also customize the rules applied for each specific coding language analyzer. Rules can be selected and deselected per language and per project through SonarQube's user interface. These options recognize the need for project-specific rules, as well as maintaining all data and configurations in a central location.

### Why it's important

SonarQube provides a centralized location for organizations to manage and track issues in their code throughout multiple projects. It also allows continuous inspection combined with a quality gate. Once a project has been analyzed, further analyses update the original statistics, as the software is modified, to reflect the latest changes. This tracking allows users to view how well and how quickly code issues are being resolved, consistent with a "release early and release often" mentality.

Additionally, SonarQube can be utilized in a [continuous integration pipeline][5], such as those run on tools like [Hudson][6] and [Jenkins][7]. The quality gate will reflect the overall health of the code and, by integrating with tools like Jenkins, can play an important role in deciding when to release code to the production environment.

In the spirit of DevOps, SonarQube can quantify code quality to help organizations meet internal requirements. In order to speed the cycle of code production and release, organizations must be aware of their technical debt and software issues. By uncovering this information, SonarQube can help organizations more rapidly produce the highest quality software possible.

### Want to learn more?

SonarQube is licensed under the GNU Lesser General Public License, and its source code is available on [GitHub][8]. There is a growing community of users interested in SonarQube, its features, and its capabilities. There are active communities on [Twitter][9] and [Google][10]; these as well as the [SonarQube blog][11] are helpful for anyone interested in getting started with SonarQube.

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/10/sonarqube

作者：[Sophie Polson][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/sophiepolson
[1]:https://en.wikipedia.org/wiki/DevOps
[2]:https://www.sonarqube.org/
[3]:https://en.wikipedia.org/wiki/Code_smell
[4]:https://docs.sonarqube.org/display/PLUG/Plugin+Library
[5]:https://jenkins.io/blog/2017/04/18/continuousdelivery-devops-sonarqube/
[6]:https://en.wikipedia.org/wiki/Hudson_(software)
[7]:https://en.wikipedia.org/wiki/Jenkins_(software)
[8]:https://github.com/SonarSource/sonarqube
[9]:https://twitter.com/SonarQube
[10]:https://groups.google.com/forum/#!forum/sonarqube
[11]:https://blog.sonarsource.com/

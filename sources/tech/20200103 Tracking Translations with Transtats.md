[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Tracking Translations with Transtats)
[#]: via: (https://fedoramagazine.org/tracking-translations-with-transtats/)
[#]: author: (Sundeep Anand https://fedoramagazine.org/author/suanand/)

Tracking Translations with Transtats
======

![][1]

Translation is an important step in software localization which helps make software more popular globally, and impacts international user experience. In recent years, localization processes have been evolving worldwide to become more continuous, faster, efficient with automation. In Fedora, the development of the [Zanata][2] platform and its plugins, then [Transtats][3], and now the migration to the [Weblate][4] platform are part of this common ongoing goal. The localization of a desktop OS like Fedora is highly complex because it depends on many factors of the individual upstream projects which are packaged in Fedora. For example, different translation timelines, resources, and tooling.

### What is Transtats?

Transtats is a web application which tries to tie up upstream repositories, translation platforms, build system, and product release schedule together to solve problems of mismatch, out-of-sync conditions and to assist the timely packaging of quality translations. Actually, it collects translation data, analyzes them, and creates meaningful representations.

Fedora Transtats is hosted at <https://transtats.fedoraproject.org/>

![][5]

### How to see the translation status of my package?

Just select **Packages** tab from left hand side navigation bar. This takes us to the packages list view. Then, search for the package and click on its name.

![][6]

For example _anaconda_. On package details page, locate following:

![][7]

Here, we have translation statistics from translation platform: [Zanata][8] and [Koji][9] build system. Syncs with the platform and build system are scheduled, which update differences periodically. Languages in red color indicate that there are translated strings remaining in the Translation Platform to be pulled and packaged, whereas, blue denote translated messages could not make 100% in the built package.

### String breakage (or changes?)

In translation of software packages, one of the challenges is to prevent string breakage. Package maintainers should strive to abide by the scheduled Fedora release String Freeze. However, in some circumstances it could be necessary to break the string freeze and to inform the translation team on the mailing list. As well as, to update latest translation template (POT) file in the translation platform. Just in case these actions seem missing – translators may get new strings to translate very late or the application may have some strings untranslated. In the worst case, an outdated translation string mismatch may result in a crash. Sync and automation pipelines are there to prevent this, nevertheless it depends on the push or pull methods followed by package developers or maintainers.

To deal with the same context, we can use a job template in Transtats to detect this string change – particularly useful after string freeze in Fedora release schedule. This would be really helpful for the folks who look for packaging translations without string breakage, keeping translation template (POT) file in sync with translation platform, and testing localized form of the application for translation completeness to back trace.

### How to detect string changes?

One of the options in **Jobs** tab is ‘YML based Jobs’. Where we can see available job templates.

![][10]

The jobs framework executes all the tasks mentioned in the YAML, create appropriate logs and store results. Track String Change job basically:

  1. Clones the source repository of respective package.
  2. Tries to generate translation template (POT) file.
  3. Downloads POT file from respective translation platform.
  4. And, finds differences between both the POT files.



_Actually, Transtats maintains mapping of upstream repository, Translation Platform project and respective build tag for every package._

![][11]

Let’s take a closer look into this YAML. We can provide value for %PACKAGE_NAME% and %RELEASE_SLUG% in the next step – **Set Values**! For example: _anaconda_ and _fedora-32_. Furthermore, a couple of things seek attention are:

  * In case the upstream software repository maintains separate git branch for fedora release, please edit ‘branch: master’ to ‘branch: &lt;fedora-release-branch&gt;’
  * In ‘generate’ block, mention the command to generate POT file. Default one should work for ‘intltool-update’ only, however, many packages do have their own.
  * A few packages may have gettext domain name different than that of package name. If this is the case, mention the gettext domain too.



As soon as the job is triggered, logs should be populated. If this is not a _scratch_ run, a unique URL shall also be created at the end.

![][12]

Left hand side is the input YAML and right hand side is respective log for each task. Here we can find the differences and figure out string mismatch.

![][13]

In [Transtats][14], we can create solutions to different problems in the form of job templates. And, scheduling of these jobs could be a step towards automation.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/tracking-translations-with-transtats/

作者：[Sundeep Anand][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/suanand/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/12/transtats-816x345.png
[2]: http://zanata.org/
[3]: http://transtats.org/
[4]: https://weblate.org/en/
[5]: https://fedoramagazine.org/wp-content/uploads/2019/12/transtats-landing-1-1024x450.png
[6]: https://fedoramagazine.org/wp-content/uploads/2019/12/anaconda-pkg.png
[7]: https://fedoramagazine.org/wp-content/uploads/2019/12/anaconda-details.png
[8]: https://fedora.zanata.org/project/view/anaconda
[9]: https://koji.fedoraproject.org/koji
[10]: https://fedoramagazine.org/wp-content/uploads/2019/12/job-templates-1024x361.png
[11]: https://fedoramagazine.org/wp-content/uploads/2019/12/strchgjob.png
[12]: https://fedoramagazine.org/wp-content/uploads/2019/12/string-change-job-log-1024x478.png
[13]: https://fedoramagazine.org/wp-content/uploads/2019/12/string-change-1024x614.png
[14]: https://github.com/transtats/transtats

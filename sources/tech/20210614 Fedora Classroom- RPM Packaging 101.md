[#]: subject: (Fedora Classroom: RPM Packaging 101)
[#]: via: (https://fedoramagazine.org/fedora-classroom-rpm-packaging-101/)
[#]: author: (Ankur Sinha "FranciscoD" https://fedoramagazine.org/author/ankursinha/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Fedora Classroom: RPM Packaging 101
======

![Fedora classroom on RPM packaging][1]

Fedora Classroom sessions return with a session on RPM packaging targeted at beginners.

### About the session

RPMs are the smallest building blocks of the Fedora Linux system. This session will walk through the basics of building an RPM from source code. You will learn how to set up your Fedora system to build RPMs, how to write a spec file that adheres to the [Fedora Packaging Guidelines][2], and how to use it to generate RPMs for distribution. The session will also provide a brief overview of the complete Fedora packaging pipeline.

While no prior knowledge of building RPMs or building software from its source code is required, some software development experience will be useful. The hope is to help users learn the skills required to build and maintain RPM packages, and to encourage them to contribute to Fedora by joining the package collection maintainers.

### When and where

The classroom session will be organised on the BlueJeans video platform at 1200 UTC on June 17, 2021 and is expected to last an hour:

  * BlueJeans event URL: <https://bluejeans.com/473822117>
  * [Fedora calendar entry][3] (Click to see the event in your local time zone and add it to your calendar application).



### Topics covered in the session

  * The basics of a spec file.
  * Source and binary RPMs and how they are built from the spec using rpmbuild.
  * A brief introduction to mock and fedpkg.
  * The life cycle of a Fedora package.
  * How you can join the Fedora package collection maintainers.



### Prerequisites

  * A Fedora installation (Workstation or any lab/spin)
  * The following software should be installed and configured:
    * **git**

```
sudo dnf install git
```

    * **fedora-packager
**

```
sudo dnf install fedora-packager
```

    * **mock** (configured as per [these instructions][4])




### Useful reading

  * [RPM packages explained][5]
  * [How RPM packages are made: the spec file][6]
  * [How RPM packages are made: the source RPM][7]



### About the instructor

[Ankur Sinha][8] has been maintaining packages in Fedora for more than a decade and is currently both a sponsor to the package maintainers group, and a [proven packager][9]. Ankur primarily focuses on maintaining neuroscience related software for the [NeuroFedora Special Interest Group][10] and contributes to other parts of the community wherever possible.

Fedora Classroom is a project aimed at spreading knowledge on Fedora related topics. If you would like to propose a session, feel free to open a ticket [here][11] with the tag _classroom_. If you are interested in taking a proposed session, please let us know and once you take it, you will be awarded the [Sensei][12] Badge too as a token of appreciation. Recordings from the previous sessions can be found [here][13].

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/fedora-classroom-rpm-packaging-101/

作者：[Ankur Sinha "FranciscoD"][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/ankursinha/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/06/fedora-magazing-rpm-classroom-816x345.png
[2]: https://docs.fedoraproject.org/en-US/packaging-guidelines/
[3]: https://calendar.fedoraproject.org/meeting/10002/
[4]: https://fedoraproject.org/wiki/Using_Mock_to_test_package_builds#How_do_I_use_Mock.3F
[5]: https://fedoramagazine.org/rpm-packages-explained/
[6]: https://fedoramagazine.org/how-rpm-packages-are-made-the-spec-file/
[7]: https://fedoramagazine.org/how-rpm-packages-are-made-the-source-rpm/
[8]: https://fedoraproject.org/wiki/User:Ankursinha
[9]: https://docs.fedoraproject.org/en-US/fesco/Provenpackager_policy/
[10]: https://neuro.fedoraproject.org
[11]: https://pagure.io/fedora-join/Fedora-Join/issues
[12]: https://badges.fedoraproject.org/badge/sensei/
[13]: https://www.youtube.com/playlist?list=PL0x39xti0_64FBQ7mcFt7uBXpG8EA7OF1

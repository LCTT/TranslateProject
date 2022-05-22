[#]: subject: (Getting better at counting rpm-ostree based systems)
[#]: via: (https://fedoramagazine.org/getting-better-at-counting-rpm-ostree-based-systems/)
[#]: author: (Timothée Ravier https://fedoramagazine.org/author/siosm/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Getting better at counting rpm-ostree based systems
======

![][1]

Photo by [Joost Crop][2] on [Unsplash][3]

This article describes the extension of the Fedora 32 user count mechanism to _rpm-ostree_ based systems. It also provides tips for opting out, if necessary.

### How Fedora counts users

Since the release of Fedora 32, a new mechanism has been in place to better count the number of Fedora users while respecting their privacy. This system is explicitly designed to make sure that no personally identifiable information is sent from counted systems. It also ensures that the Fedora infrastructure does not collect any personal data. The nickname for this new counting mechanism is “Count Me”, from the option name. Details are available in [DNF Better Counting change request for Fedora 32][4]. In short, the Count Me mechanism works by telling Fedora servers how old your system is (with a very large approximation). This occurs randomly during a metadata refresh request performed by DNF.

### Adding support for rpm-ostree based systems

The current mechanism works great for classic editions of Fedora (Workstation, Server, Spins, etc.). However, _rpm-ostree_ based systems (such as Fedora Silverblue, Fedora IoT and Fedora CoreOS) do not fetch any repository metadata in the default case. This means they can not take advantage of this mechanism. We thus decided to implement a stand-alone method, based on the same logic, in _rpm-ostree_. The new implementation has the same privacy preserving properties as the original DNF implementation.

### Time line

Our new Count Me mechanism will be enabled by default in the upcoming Fedora 34 release for Fedora IoT and Fedora Silverblue. This will occur for both upgraded machines and for new installs. For instructions on opting out, see below.

Since Fedora CoreOS is an automatically updating operating system, existing machines will adopt the Count Me logic without user intervention. However, counting will be enabled approximately three months after publication of this article. This delay is to ensure that users have time to opt out if they prefer to do so. Thus, default counting will be enabled starting with the _testing_ and _next_ Fedora CoreOS releases that will be published at the beginning of August 2021 and in the _stable_ release that will go out two weeks after.

More information is available in the [tracking issue for Fedora CoreOS][5].

### Opting out of counting

Full instructions on disabling this functionality are available in the [rpm-ostree documentation][6]. We are reproducing them here for convenience.

#### Disable the process

You can disable counting by stopping the _rpm-ostree-countme.timer_ and masking the corresponding unit, as a precaution:

```
$ systemctl mask --now rpm-ostree-countme.timer
```

Execute that command in advance to disable the default counting when you update to Fedora 34.

#### Modify your Butane configuration

Fedora CoreOS users can use the same _systemctl_ command to manually mask the unit. You may also use the following snippet as part of your Butane config to disable counting on first boot via Ignition:

```
variant: fcos
version: 1.3.0
systemd:
  units:
    - name: rpm-ostree-countme.timer
      enabled: false
      mask: true
```

[Fedora CoreOS documentation][7] contains details about using the Butane config snippet and how Fedora CoreOS is provisioned.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/getting-better-at-counting-rpm-ostree-based-systems/

作者：[Timothée Ravier][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/siosm/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/04/count_rpm_ostree-816x345.jpg
[2]: https://unsplash.com/@smallcamerabigpictures?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/calculator?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://fedoraproject.org/wiki/Changes/DNF_Better_Counting
[5]: https://github.com/coreos/fedora-coreos-tracker/issues/717
[6]: https://coreos.github.io/rpm-ostree/countme/
[7]: https://docs.fedoraproject.org/en-US/fedora-coreos/getting-started/

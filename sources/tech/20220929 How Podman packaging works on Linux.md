[#]: subject: "How Podman packaging works on Linux"
[#]: via: "https://opensource.com/article/22/9/podman-packages-linux"
[#]: author: "Lokesh Mandvekar https://opensource.com/users/lsm5"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How Podman packaging works on Linux
======
Get a deep dive into Podman packages for Debian and Ubuntu using Fedora Sources, OBS, and Debbuild.

Over the past few months, the [Podman][2] project has been reworking its process for generating Debian and Ubuntu packages. This article outlines the past and present of the Debian packaging work done by the Podman project team. Please note that this article does not refer to the official [Debian][3] and [Ubuntu][4] packages that Reinhard Tartler and team created and maintain.

### Debian build process

Long story short, the typical Debian build process involves "Debianizing" an upstream repository. First, a `debian` subdirectory containing packaging metadata and any necessary patches is added to the upstream repo. Then the `dpkg-buildpackage` command is run to generate the `.deb` packages.

#### Older Debian build process for Podman

Previously, the Debian packages for Podman were generated using this "Debianization" process. A `debian` directory containing the packaging metadata was added to the Podman source in a [separate fork][5]. That fork got rebased for each new upstream Podman release.

#### Issues with the Debian build process (for an RPM packager)

While a simple rebase would often work, that was not always the case. Usually, the Podman source itself would require patching to make things work for multiple Debian and Ubuntu versions, leading to rebase failures. And failures in a rebase meant failures in automated tasks. Which, in turn, caused a lot of frustration.

This same frustration led our team to [retire the Debian packages][6] in the past. When Podman v3.4 officially made its way into Debian 11 and Ubuntu 22.04 LTS (thanks to the amazing Reinhard Tartler), we thought the Podman project could say goodbye to Debian package maintenance.

But that wasn't meant to be. Both Debian and Ubuntu are rather conservative in their package update policies, especially in their release and LTS versions. As a result, many Podman users on Debian-based distributions would be stuck with v3.4 for quite a while, perhaps the entire lifetime of the distro version. While users can often install the latest packages from Debian's experimental repository, that's not necessarily convenient for everyone. As a result, many Debian-based users [asked the Podman project][7] for newer packages.

If we were to resurrect the Podman project's own Debian packages, we needed the packaging format to be easy to maintain and debug for RPM packagers and also easy to automate, which meant no frequent failures with rebases and patches.

### OBS + Debbuild

The `debbuild` tool, created by [Neal Gompa][8] and others, is a set of RPM packaging macros allowing packagers to build Debian packages using Fedora's packaging sources. Conveniently, `debbuild` packages can easily be added as dependencies to a project hosted on openSUSE's [Open Build Service][9] infrastructure.

Here's a snippet of how `debbuild` support is enabled for Ubuntu 22.04 on the [OBS Stable Kubic repository][10], maintained by the Podman project:

```
<repository name="xUbuntu_22.04">
    <path project="Ubuntu:debbuild" repository="Ubuntu_22.04"/>
    <path project="Ubuntu:22.04" repository="universe"/>
    <arch>x86_64</arch>
    <arch>s390x</arch>
    <arch>armv7l</arch>
    <arch>aarch64</arch>
  </repository>
```

The complete configuration file is available [here][11].

In addition to enabling `debbuild` packages as dependencies, the Fedora packaging sources must be updated with rules to modify the build process for Debian and Ubuntu environments.

Here's a snippet of how it's done for Podman:

```
%if "%{_vendor}" == "debbuild"
Packager: Podman Debbuild Maintainers <https://github.com/orgs/containers/teams/podman-debbuild-maintainers>
License: ASL-2.0+ and BSD and ISC and MIT and MPLv2.0
Release: 0%{?dist}
%else
License: ASL 2.0 and BSD and ISC and MIT and MPLv2.0
Release: %autorelease
ExclusiveArch: %{golang_arches}
%endif
```

The **" %{_vendor}" == "debbuild"** conditional is used in many other places throughout the spec file. For example, in this code sample, it specifies different sets of dependencies and build steps for Fedora and Debian. Also, `debbuild` allows conditionalizing Debian and Ubuntu versions using the macros `{debian}` and `{ubuntu}`, which are familiar to RPM packagers.

You can find the updated RPM spec file with all the `debbuild` changes [here][12].

These two pieces together produce successful Debian package builds on the [OBS Unstable Kubic repository][13].

Using `debbuild` also ensures that packaging metadata lives in its own separate repository, implying no patching or rebasing hassles with upstream Podman sources.

### Usability

At this time, packages are available for Ubuntu 22.04, Debian Testing, and Debian Unstable. We're in talks with the OBS infrastructure maintainers to adjust the Debian 11 and Ubuntu 20.04 build environments, after which we'll also have successful builds for those two environments.

```
$ apt list podman
Listing... Done
podman/unknown,now 4:4.2.0-0ubuntu22.04+obs55.1 amd64 [installed]
podman/unknown 4:4.2.0-0ubuntu22.04+obs55.1 arm64
podman/unknown 4:4.2.0-0ubuntu22.04+obs54.1 armhf
podman/unknown 4:4.2.0-0ubuntu22.04+obs54.1 s390x
```

Now, let's talk usability. These packages have been manually verified, and the Podman team has found them to satisfy typical use cases. Users can install these packages as they would any other DEB package. The repository first needs to be enabled, and there are instructions on the [Podman website][14]. However, these packages are not Debian-approved. They haven't gone through the same quality assurance process as official Debian packages. These packages are currently not recommended for production use, and we urge you to exercise caution before proceeding with installation.

### Wrap up

The `debbuild` project allows the Podman project team to generate Debian packages with a few additions to the Fedora packaging sources, making Debian packaging easier to maintain, debug, and automate. It also allows Debian and Ubuntu users to get the latest Podman at the same speed as Fedora users. Podman users on Debian and Ubuntu looking for the latest updates can use our Kubic *unstable* repository (ideally *not on production environments just yet.*)

We also highly recommend the `debbuild` and OBS setup to RPM packagers who must provide Debian and Ubuntu packages to their users. It's a diverse selection of tooling, but open source is all about working together.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/podman-packages-linux

作者：[Lokesh Mandvekar][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/lsm5
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/OSDC_gift_giveaway_box_520x292.png
[2]: https://developers.redhat.com/cheat-sheets/podman-cheat-sheet?intcmp=7013a000002qLH8AAM
[3]: https://packages.debian.org/unstable/podman
[4]: https://packages.ubuntu.com/search?keywords=podman
[5]: https://gitlab.com/rhcontainerbot/podman/-/tree/debian/debian
[6]: https://podman.io/blogs/2022/04/05/ubuntu-2204-lts-kubic.html
[7]: https://github.com/containers/podman/issues/14302
[8]: https://fedoraproject.org/wiki/User:Ngompa
[9]: https://openbuildservice.org/
[10]: https://build.opensuse.org/project/show/devel:kubic:libcontainers:unstable
[11]: https://build.opensuse.org/projects/devel:kubic:libcontainers:unstable/meta
[12]: https://gitlab.com/rhcontainerbot/rpms-openqa/podman/-/blob/rawhide/podman.spec
[13]: https://build.opensuse.org/package/show/devel:kubic:libcontainers:unstable/podman
[14]: https://podman.io/getting-started/installation

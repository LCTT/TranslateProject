[#]: subject: "Comparison of Fedora Flatpaks and Flathub remotes"
[#]: via: "https://fedoramagazine.org/comparison-of-fedora-flatpaks-and-flathub-remotes/"
[#]: author: "TheEvilSkeleton https://fedoramagazine.org/author/theevilskeleton/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Comparison of Fedora Flatpaks and Flathub remotes
======

![featured image][1]

Fedora Linux 35 Background; Fedora logo; and Flathub logo

In the [previous article in this series][2], we looked at how to get started with Fedora Flatpaks and how to use it. This article compares and contrasts between the Fedora Flatpaks remote and the Flathub remote. Flathub is the de-facto standard Flatpak remote, whereas Fedora Flatpaks is the Fedora Project’s Flatpak remote. The things that differ between the remotes include but are not limited to their policies, their ways of distribution, and their implementation.

### Goals and motivation

Fedora Flatpaks and Flathub share the same goals but differ in motivation. The goal is to make applications accessible in their respective field, maximize convenience and minimize maintenance.

Fedora Flatpaks’s motivation is to push RPMs that come directly from the Fedora Project and make them accessible throughout Fedora Linux regardless of the versions, spin, etc. So, in theory, it would be possible to get the latest and greatest applications from the Fedora Project without needing to upgrade to the latest version of Fedora Linux. Of course, it’s always advisable to keep everything up-to-date.

Flathub’s motivation is to simply make applications and tools as accessible as possible regardless of the distribution in use. Hence, all tools are available on [GitHub][3]. Filing issues for applications provided by Flathub is the same as filing issues on any project on GitHub.

### Packages

Fedora Flatpaks and Flathub create Flatpak applications differently. First and foremost, Fedora Flatpaks literally converts existing RPMs to Flatpak-compatible files where developers can then easily bundle as Flatpak and redistribute them. Flathub, on the other hand, is more open when it comes to how developers bundle applications.

#### Types of packages published

Fedora Flatpaks only publishes free and open source software, whereas Flathub publishes free and open source software as well as proprietary software. However, Flathub plans to separate proprietary applications from free and open source applications, as stated by a [recent blog post from GNOME][4].

#### Sources

Flathub is open with what source a Flatpak application (re)uses, whereas Fedora Flatpaks strictly reuses the RPM format.

As such, Flathub has tons of applications that reuse other package formats. For example, the Chrome Flatpak reuses the [.deb package][5], the UnityHub Flatpak reuses the [AppImage][6], the Spotify Flatpak reuses the [Snap package][7], the Android Studio Flatpak uses a [tar.gz archive][8], etc.

Alternatively, Flathub also compiles directly from source. Sometimes from a source archive, from running git clone, etc.

#### Number of applications

Fedora Flatpaks has fewer applications than Flathub. To list the applications available from a remote, run flatpak remote-ls --app $REMOTE. You can go one step further and get the number of applications by piping to wc -l:

```

    [Terminal ~]$ flatpak remote-ls --app fedora | wc -l
    86
    [Terminal ~]$ flatpak remote-ls --app flathub | wc -l
    1518

```

Here, at the time of writing this article, we can see that Flathub has 1518 applications available, whereas Fedora Flatpaks has only 86.

### OSTree and OCI formats

Implementations are quite different too. Both Fedora Flatpaks and Flathub use Flatpak to help you install, remove, and manage applications. However, in terms of how these applications are published, they fundamentally work differently. Flathub uses the OSTree format to publish applications, whereas Fedora Flatpaks uses the OCI format.

#### OSTree format

OSTree (or libostree) is a tool to keep track of system binaries. Developers consider OSTree as “Git for binaries” because it is conceptually analogous to git. The OSTree format is the default format for Flatpak, which Flathub uses to publish packages and updates.

When downloading an application, OSTree checks the differences between the installed application (if installed) and the updated application, and intelligently downloads and changes the differences while keeping everything else unchanged, which reduces bandwith. We call this process delta updates.

#### OCI format

Open Container Initiative (OCI) is an initiative by several organizations to standardize certain elements of containers. Fedora Flatpaks uses the OCI format to publish applications.

This format is similar to how Docker works, which makes it fairly easy to understand for developers who are already familiar with Docker. Furthermore, the OCI format allows the Fedora Project to extend the [Fedora Registry][9], the Fedora Project’s Docker registry, by creating Flatpak applications as Docker images and publishing them to a Docker registry.

This avoids the burden and complications of having to use additional tools to maintain an additional infrastructure just to maintain a Flatpak remote. Instead, the Fedora Project simply reuses the Fedora Registry, to make maintenance much easier and manageable.

### Runtimes

Flatpak runtimes are core dependencies where applications reuse these dependencies without duplicating data, also known as “deduplication”. Runtimes may be based on top of other runtimes, or built independently.

Flathub decentralizes these runtimes, meaning runtimes are only available for specific types of applications. For example GTK applications use the [GNOME runtime][10] (org.gnome.Platform), Qt applications use the [KDE runtime][11] (org.kde.Platform), almost everything else uses the [freedesktop.org runtime][12] (org.freedesktop.Platform). The respective organizations maintain these runtimes, and publish them on Flathub. Both the GNOME and KDE runtimes are built on top of the freedesktop.org runtime.

Fedora Flatpaks, on the other hand, uses one runtime for everything, regardless the size of the application. This means, installing one application from Fedora Flatpaks will download and install the whole Fedora runtime (org.fedoraproject.Platform).

### Conclusion

In conclusion, we can see that there are several philosophical and technical differences between Fedora Flatpaks and Flathub.

Fedora Flatpaks focuses on fully taking advantage of the existing infrastructure by providing more to an average user without using more resources. In contrast, Flathub strives to make distributing/publishing applications and using them as painless as possible for the developers and for users.

Both remotes are quite impressive with how rapid they improved in very little time. We hope both remotes get better and better, and become the standard across the majority of desktop Linux distributions.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/comparison-of-fedora-flatpaks-and-flathub-remotes/

作者：[TheEvilSkeleton][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/theevilskeleton/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/01/Comparison-of-Fedora-Flatpaks-and-Flathub-remotes-816x345.jpg
[2]: https://fedoramagazine.org/an-introduction-to-fedora-flatpaks/
[3]: https://github.com/flathub/
[4]: https://foundation.gnome.org/2022/01/21/further-investments-in-desktop-linux/
[5]: https://github.com/flathub/com.google.Chrome/blob/71289130954a9fdbb5dabd2aabd019594c8d92a8/com.google.Chrome.yaml#L157
[6]: https://github.com/flathub/com.unity.UnityHub/blob/80279ed7cd92cf47355630dd79b0c3a5ed79707c/com.unity.UnityHub.yaml#L62
[7]: https://github.com/flathub/com.spotify.Client/blob/1bd91412e202cb240cf09433c7f1a63a30389674/com.spotify.Client.json#L218
[8]: https://github.com/flathub/com.google.AndroidStudio/blob/e904fdadaed3df8b5533c22d6e5d2b7ffd4fa637/com.google.AndroidStudio.json#L54
[9]: https://registry.fedoraproject.org/
[10]: https://gitlab.gnome.org/GNOME/gnome-build-meta
[11]: https://invent.kde.org/packaging/flatpak-kde-runtime
[12]: https://gitlab.com/freedesktop-sdk/freedesktop-sdk

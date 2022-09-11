[#]: subject: "Traditional Linux Packaging is not Suitable for Modern Applications [Opinion]"
[#]: via: "https://news.itsfoss.com/traditional-packaging-modern-applications/"
[#]: author: "Community https://news.itsfoss.com/author/team/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Traditional Linux Packaging is not Suitable for Modern Applications [Opinion]
======
Open source contributor Hari Rana expresses his opinion on why traditional Linux packages are no longer suitable for modern applications.

![Traditional Linux Packaging is not Suitable for Modern Applications [Opinion]][1]

Image by: [Kelli McClintock][2] on [Unsplash][3]

I repeatedly encounter users complaining about LTS and stable distributions having issues with application packages, but then claim that no such thing ever happens with bleeding-edge distributions. However, with my experience and knowledge with the technical side of packaging, I can’t emphasize enough that this is untrue.

Distribution model is hardly the issue here; the fundamental issue is that traditional packaging is not suitable for modern graphical applications, no matter the distribution model. And how formats like Nix and Flatpak have managed to address these fundamental problems. Interestingly, most servers do make use of containerization (i.e., Docker), because it improves reproducibility and enhances maintainability. We could take inspiration from this and adopt a similar standard that is suitable for the Linux desktop.

### Disclaimer

1. “Traditional packaging” is defined as distributions shipping graphical applications using distribution package managers without the use of containers, such as apt, dnf, pacman, and more.
2. “Distribution model” is defined as the releasing process, such as long-term support (LTS), stable, and bleeding-edge.
3. “Similar application(s)” is defined as two applications that are technically really similar, like [Visual Studio Code][4] and [Code - OSS][5].
4. I’ll be using Arch Linux as a reference for most of these examples. However, these behaviors are consistent with distributions that heavily practice traditional packaging.
5. Nix does not use containers, nor is it a container format. However, for the sake of simplicity, I will be referring it as a container format.

### The Fundamental Problem

![][6]

Image by: [Jackson Simmer][7] on [Unsplash][8]

Most, if not all, distributions that heavily practice traditional packaging share this common problem: none of them leverage containers or other convenient methods to separate dependencies. In Layman’s terms, a container is a box in which we can put things and use them separately without affecting the main system (host).

Containers usually don’t affect anything outside of the “box”. They’re also portable, as they’re installable on other distributions while still providing a consistent experience. With package managers that leverage them, they install each package in different containers, which provide an additional layer of safety. This gives packagers a lot more control and flexibility with what can be bundled inside their packages.

Traditional packaging introduces several issues, such as dependency and package conflicts, which usually require workarounds that differ from one distribution to another.

#### Dependency and Package Conflicts

If we attempt to install [Visual Studio Code][9] ([visual-studio-code-bin][10]) while [Code - OSS][11] ([code][12]) is installed on Arch Linux, we will run into this issue:

```
$ paru -S visual-studio-code-bin
[...]

:: Conflicts found:
    visual-studio-code-bin: code  

:: Conflicting packages will have to be confirmed manually

Aur (1)                     Old Version  New Version  Make Only
aur/visual-studio-code-bin               1.70.1-1     No
```

This is called a package conflict, whereby two or more packages cannot coexist. In this case we cannot install Visual Studio Code alongside Code - OSS.

When two applications or packages provide the same file(s), with the same names and are placed in the same directory, then they literally cannot coexist, because these files will then collide. In this example, both Visual Studio Code and Code - OSS provide a `code` file, which are both placed in `/usr/bin`. The `code` file that Visual Studio Code provides is used to launch Visual Studio Code, whereas the `code` file from Code - OSS is used to launch Code - OSS.

While this example only showcases Visual Studio Code and Code - OSS, this often happens with different sets of applications, libraries and others.

#### Unable to Cherry Pick Dependencies

![][13]

Image by: [Priscilla Du Preez][14] on [Unsplash][15]

One of the biggest issues with traditional packaging is that packagers cannot cherry-pick dependencies.

For example, if an application recently updated and requires dependency A version 1, but the distribution only ships dependency A version 0.9, then it would not be ideal for upgrading the application, as the distribution will not meet the requirements. This means the packager will have to hold back the package until the new dependency is released for the distribution, or resort to workarounds.

Likewise, if an application requires dependency A version 0.8.1, but the distribution ships dependency A version 0.9, then the application can misbehave or even not work altogether.

##### Patched Libraries and Build Configurations

To expand, several applications require patched libraries or additional build options to function correctly. For example, OBS Studio requires a [patched FFmpeg][16] to integrate neatly with OBS Studio.

With traditional packaging, there can only be one variant of the dependency installed at a time. If the distribution ships an unpatched FFmpeg, then there’s no way to install a patched FFmpeg unless the packager works around that. If the patched FFmpeg is installed, but another program relies specifically on an unpatched FFmpeg, an FFmpeg with other patches, or an FFmpeg with additional features built-in or removed, then that other program can misbehave.

Modern applications are inherently fragile. One small mistake or inconsistency within the dependency tree can cause an application to misbehave and worsen the user experience, and may even give the impression that the application is at fault and not the package itself, which can hinder the application’s reputation.

#### Workarounds

Let’s look at current workarounds that packagers use to package applications.

1. The first workaround is to install dependencies in different directories. Electron, for example, is a massive framework that developers use to build applications on top of, and later bundle them. However, Electron based applications vary, as they are built on top of different versions of Electron. Discord bundles and ships Electron 13, whereas Element bundles and ships Electron 19. For Electron packaging on Arch Linux, certain directories require to be installed in `/opt/APPLICATION_NAME`, so these Electron versions [don’t conflict with each other][17].
2. The second workaround is to tamper with the application. For example, patching an application to build without certain dependencies or features can make the application build for the distribution, but there’s no guarantee that the application will either launch or work as intended.
3. The third workaround is to build the application with many build options disabled, which may also disable functionality. For example, on Arch Linux, OBS Studio is built with many essential features disabled, which [results in a subpar experience][18].

These workarounds vary on a case-by-case basis, some of which can limit the functionality of the application, some can introduce stability issues, etc.

#### Inconsistent Experience

![A view of a crater in the volcanic national park, Timanfaya, in Lanzarote (Canary Islands) in Spain.][19]

Image by: [alevision.co][20] on [Unsplash][21]

While these technical limitations are consistent throughout traditional packaging, the user experience is often not. Distribution models paired with traditional packaging impact the user experience because of how packages are shipped.

Some distributions, like Arch Linux, are close to bleeding-edge and thus have the latest versions of packages. However, Debian and Ubuntu LTS are LTS distributions, so a lot of their packages are several versions behind. Meanwhile, Fedora Linux and Ubuntu Stable are between Debian/Ubuntu LTS and Arch Linux.

Some distributions prefer to patch packages as least as possible to keep them closest to vanilla, whereas some others patch to add more functionality, work with older libraries, or other sorts of changes to improve user experience. Some distributions prefer to build with minimal build options enabled, whereas others may prefer to add more built-in features if possible. The list goes on.

As we can see, a single application is built very differently across distributions. Furthermore, dependencies are also built differently from distribution to distribution. Many technical limitations with traditional packaging require different workarounds depending on the distribution model and packaging policies. These minor changes often give incomplete, subpar experiences and wrong impressions to the user. Some applications may work better with some distributions but work badly with others, whereas some other applications may work better with other sets of distributions. Even though a single application is built differently on each distribution, the name and branding is kept as-is, giving users the wrong impression.

### The Solution

![][22]

[Riccardo Annandale][23]

[Unsplash][24]

As mentioned earlier, the solution to these problems is using containers.

Containers are designed to separate several aspects of the system. With the use of containers, packagers can cherry pick dependencies without being limited by host libraries. Packagers can thus ship the latest, feature complete builds of packages, while retaining the stability of the distribution.

This is really important, as these container formats can push applications and distributions to their boundaries, without affecting the system destructively.

#### Nix and Flatpak

[Nix][25] is a cross-platform package manager to work in Unix-like operating systems like Linux distributions, BSDs and macOS. Nix has several [channels][26] (branches) that users can use.

[Flatpak][27], on the other hand, is a universal package format for the Linux desktop that also leverages containers but additionally sandboxes to isolate them. It is intended to be used by the average person in the future and is designed to be integrated with software stores, such as GNOME Software and KDE Discover. In other words, Flatpak is more of an extension for distributions, rather than a replacement, as it is literally designed not to replace system package managers.

Nix can also be used as an extension or exclusively if using distributions like NixOS.

#### Similar Applications

Nix and Flatpak address many fundamental problems with traditional packaging. Thanks to the separation of applications, these formats can have similar applications installed, like Visual Studio Code and Code - OSS, without running into conflicts.

#### Multiple Branches

Nix and Flatpak can install multiple versions of the same application. With Nix, I can install applications from the `nixpkgs-stable` (LTS) channel while also having the same application installed from the `nixpkgs-unstable` (bleeding-edge) channel.

Likewise, with Flatpak, I can install applications from the `stable` and `beta` branch simultaneously. I can continue installing the same application from many more channels and branches, without them ever running into packaging conflicts.

#### Cherry Pick Dependencies

![cherry-picking][28]

Image by: [Ish de loyola][29] on [Unsplash][30]

Additionally, packagers can bundle applications with different variants of libraries, giving the opportunity to enable more build options and use patched or specific versions of libraries, and thus providing a complete experience to the user.

This means packagers can bundle patched FFmpeg with OBS Studio solely for the use of OBS Studio. If I have a vanilla FFmpeg installed on the host, then the patched FFmpeg for OBS Studio won’t interfere or conflict with the host FFmpeg.

#### Consistent Environments Across Distributions

As mentioned earlier, distributions build applications using different patches, build options and environments. This leads to a fragmentation of applications where every application is built and often works differently. Since Nix and Flatpak are designed to run across distributions, they provide consistent environments in each and every distribution for applications, assuming distributions ship supported versions of Nix or Flatpak.

#### Disadvantages

Just like everything, Nix and Flatpak are imperfect. Since containers are recently getting pushed on the Linux desktop, they may provide unusual environments to many applications.

Flatpak not only contains applications, it also sandboxes them. Flatpak developers have implemented a short-term workaround that punches holes in the sandbox, known as static permissions. They are developing proper long-term solutions called [XDG portals][31], to address many issues regarding sandboxing and make them act like Android’s security model.

The only short-term issue is that toolkits, frameworks and applications have to adopt these standards. GTK and Qt are some toolkits that integrate some of these portals, but they also need time to integrate others. Meanwhile, many others haven’t really integrated any of the portals.

It’s a matter of time before toolkits, frameworks and applications adopt these new standards, as there weren’t any proper standards prior to XDG portals. Applications had direct access to the filesystem and APIs, so static permissions keep this “standard”.

### Conclusion

The fundamental issue with traditional packaging is that it does not leverage containers. Many graphical applications are inherently complicated and require very specific dependencies to run as intended. Many distributions build the same application in different environments by making use of workarounds, such as patching the application or disabling build options. This leads to different variants of one application and suffers from inconsistent behavior and user experience.

Of course, distribution maintainers can’t realistically rewrite their package managers and make use of containers in 10 days. These rewrites will break many scripts, features, and more and will also take a long time to be production-ready.

My personal recommendation would be to use and promote Flatpak, as it is solely intended to extend an existing distribution rather than replace it. Packagers won’t have to worry about packaging applications and resorting to workarounds, as Flatpak will already be taking care of that.

Written by Hari Rana and [originally published at this blog][32].

Hari is part of Fedora Editorial Board at Fedora Magazine. He is also a part of Fedoea quality assurance (QA). Hari wants to contribute to the adoption of the Linux desktop by promoting various technologies and helping people in need of assistance.

**The views and opinions expressed in this article are those of the authors and do not necessarily represent opinions It's FOSS.**

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/traditional-packaging-modern-applications/

作者：[Community][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/team/
[b]: https://github.com/lkxed
[1]: https://images.unsplash.com/photo-1573376670774-4427757f7963?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTc3M3wwfDF8c2VhcmNofDY2fHxwYWNrYWdpbmd8ZW58MHx8fHwxNjYyNzgzMzY1&ixlib=rb-1.2.1&q=80&w=1200
[2]: https://unsplash.com/es/@kelli_mcclintock?utm_source=ghost&utm_medium=referral&utm_campaign=api-credit
[3]: https://unsplash.com/?utm_source=ghost&utm_medium=referral&utm_campaign=api-credit
[4]: https://code.visualstudio.com/
[5]: https://github.com/microsoft/vscode
[6]: https://images.unsplash.com/photo-1612933510543-5b442296703b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTc3M3wwfDF8c2VhcmNofDEwfHxwcm9ibGVtfGVufDB8fHx8MTY2Mjc4MzEwNg&ixlib=rb-1.2.1&q=80&w=2000
[7]: https://unsplash.com/@simmerdownjpg?utm_source=ghost&utm_medium=referral&utm_campaign=api-credit
[8]: https://unsplash.com/?utm_source=ghost&utm_medium=referral&utm_campaign=api-credit
[9]: https://code.visualstudio.com/
[10]: https://aur.archlinux.org/packages/visual-studio-code-bin
[11]: https://github.com/microsoft/vscode
[12]: https://archlinux.org/packages/community/x86_64/code/
[13]: https://images.unsplash.com/photo-1601001816339-74036796370c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTc3M3wwfDF8c2VhcmNofDl8fGNoZXJyeSUyMHBpY2t8ZW58MHx8fHwxNjYyNzgzNDA4&ixlib=rb-1.2.1&q=80&w=2000
[14]: https://unsplash.com/@priscilladupreez?utm_source=ghost&utm_medium=referral&utm_campaign=api-credit
[15]: https://unsplash.com/?utm_source=ghost&utm_medium=referral&utm_campaign=api-credit
[16]: https://github.com/obsproject/obs-studio/blob/fe889ec28ebd2f323b5933b7b11c5a9207539c59/CI/flatpak/com.obsproject.Studio.json#L259-L261
[17]: https://wiki.archlinux.org/index.php?title=Electron_package_guidelines&oldid=661963#Directory_structure
[18]: https://www.youtube.com/watch?v=FPjEdrik-eQ
[19]: https://images.unsplash.com/photo-1595399822864-94ec54889cc7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTc3M3wwfDF8c2VhcmNofDl8fGJ1bXB5JTIwcm9hZHxlbnwwfHx8fDE2NjI3ODQ3MTI&ixlib=rb-1.2.1&q=80&w=2000
[20]: https://unsplash.com/@alevisionco?utm_source=ghost&utm_medium=referral&utm_campaign=api-credit
[21]: https://unsplash.com/?utm_source=ghost&utm_medium=referral&utm_campaign=api-credit
[22]: https://images.unsplash.com/photo-1474631245212-32dc3c8310c6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTc3M3wwfDF8c2VhcmNofDR8fHNvbHV0aW9ufGVufDB8fHx8MTY2Mjc4MzI5NA&ixlib=rb-1.2.1&q=80&w=2000
[23]: https://unsplash.com/@pavement_special?utm_source=ghost&utm_medium=referral&utm_campaign=api-credit
[24]: https://unsplash.com/?utm_source=ghost&utm_medium=referral&utm_campaign=api-credit
[25]: https://github.com/NixOS/Nix
[26]: https://nixos.wiki/wiki/Nix_channels
[27]: https://flatpak.org/
[28]: https://images.unsplash.com/photo-1626829622490-43c7d7c80ac8?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTc3M3wwfDF8c2VhcmNofDF8fGNoZXJyeSUyMHBpY2t8ZW58MHx8fHwxNjYyNzgzNDA4&ixlib=rb-1.2.1&q=80&w=2000
[29]: https://unsplash.com/@ishphotos_?utm_source=ghost&utm_medium=referral&utm_campaign=api-credit
[30]: https://unsplash.com/?utm_source=ghost&utm_medium=referral&utm_campaign=api-credit
[31]: https://github.com/flatpak/xdg-desktop-portal
[32]: https://theevilskeleton.gitlab.io/2022/08/29/traditional-packaging-is-not-suitable-for-modern-applications.html

[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to build a Flatpak)
[#]: via: (https://opensource.com/article/19/10/how-build-flatpak-packaging)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

How to build a Flatpak
======
A universal packaging format with a decentralized means of distribution.
Plus, portability and sandboxing.
![][1]

A long time ago, a Linux distribution shipped an operating system along with _all_ the software available for it. There was no concept of “third party” software because everything was a part of the distribution. Applications weren’t so much installed as they were enabled from a great big software repository that you got on one of the many floppy disks or, later, CDs you purchased or downloaded.

This evolved into something even more convenient as the internet became ubiquitous, and the concept of what is now the “app store” was born. Of course, Linux distributions tend to call this a _software repository_ or just _repo_ for short, with some variations for “branding”, such as _Ubuntu Software Center_ or, with typical GNOME minimalism, simply _Software_.

This model worked well back when open source software was still a novelty and the number of open source applications was a number rather than a _theoretical_ number. In today’s world of GitLab and GitHub and Bitbucket (and [many][2] [many][3] more), it’s hardly possible to count the number of open source projects, much less package them up in a repository. No Linux distribution today, even [Debian][4] and its formidable group of package maintainers, can claim or hope to have a package for every installable open source project.

Of course, a Linux package doesn’t have to be in a repository to be installable. Any programmer can package up their software and distribute it from their own website. However, because repositories are seen as an integral part of a distribution, there isn’t a universal packaging format, meaning that a programmer must decide whether to release a `.deb` or `.rpm`, or an AUR build script, or a Nix or Guix package, or a Homebrew script, or just a mostly-generic `.tgz` archive for `/opt`. It’s overwhelming for a developer who lives and breathes Linux every day, much less for a developer just trying to make a best-effort attempt at supporting a free and open source target.

### Why Flatpak?

The Flatpak project provides a universal packaging format along with a decentralized means of distribution, plus portability, and sandboxing.

  * **Universal** Install the Flatpak system, and you can run Flatpaks, regardless of your distribution. No daemon or systemd required. The same Flatpak runs on Fedora, Ubuntu, Mageia, Pop OS, Arch, Slackware, and more.
  * **Decentralized** Developers can create and sign their own Flatpak packages and repositories. There’s no repository to petition in order to get a package included.
  * **Portability** If you have a Flatpak on your system and want to hand it to a friend so they can run the same application, you can export the Flatpak to a USB thumbdrive.
  * **Sandboxed** Flatpaks use a container-based model, allowing multiple versions of libraries and applications to exist on one system. Yes, you can easily install the latest version of an app to test out while maintaining the old version you rely on.



### Building a Flatpak

To build a Flatpak, you must first install Flatpak (the subsystem that enables you to use Flatpak packages) and the Flatpak-builder application.

On Fedora, CentOS, RHEL, and similar:


```
`$ sudo dnf install flatpak flatpak-builder`
```

On Debian, Ubuntu, and similar:


```
`$ sudo apt install flatpak flatpak-builder`
```

You must also install the development tools required to build the application you are packaging. By nature of developing the application you’re now packaging, you may already have a development environment installed, so you might not notice that these components are required, but should you start building Flatpaks with Jenkins or from inside containers, then you must ensure that your build tools are a part of your toolchain.

For the first example build, this article assumes that your application uses [GNU Autotools][5], but Flatpak itself supports other build systems, such as `cmake`, `cmake-ninja`, `meson`, `ant`, as well as custom commands (a `simple` build system, in Flatpak terminology, but by no means does this imply that the build itself is actually simple).

#### Project directory

Unlike the strict RPM build infrastructure, Flatpak doesn’t impose a project directory structure. I prefer to create project directories based on the **dist** packages of software, but there’s no technical reason you can’t instead integrate your Flatpak build process with your source directory. It is technically easier to build a Flatpak from your **dist** package, though, and it’s an easier demo too, so that’s the model this article uses. Set up a project directory for GNU Hello, serving as your first Flatpak:


```
$ mkdir hello_flatpak
$ mkdir src
```

Download your distributable source. For this example, the source code is located at `https://ftp.gnu.org/gnu/hello/hello-2.10.tar.gz`.


```
$ cd hello_flatpak
$ wget <https://ftp.gnu.org/gnu/hello/hello-2.10.tar.gz>
```

#### Manifest

A Flatpak is defined by a manifest, which describes how to build and install the application it is delivering. A manifest is atomic and reproducible. A Flatpak exists in a “sandbox” container, though, so the manifest is based on a mostly empty environment with a root directory call `/app`.

The first two attributes are the ID of the application you are packaging and the command provided by it. The application ID must be unique to the application you are packaging. The canonical way of formulating a unique ID is to use a triplet value consisting of the entity responsible for the code followed by the name of the application, such as `org.gnu.Hello`. The command provided by the application is whatever you type into a terminal to run the application. This does not imply that the application is intended to be run from a terminal instead of a `.desktop` file in the Activities or Applications menu.

In a file called `org.gnu.Hello.yaml`, enter this text:


```
id: org.gnu.Hello
command: hello
```

A manifest can be written in [YAML][6] or in JSON. This article uses YAML.

Next, you must define each “module” delivered by this Flatpak package. You can think of a module as a dependency or a component. For GNU Hello, there is only one module: GNU Hello. More complex applications may require a specific library or another application entirely.


```
modules:
  - name: hello
    buildsystem: autotools
    no-autogen: true
    sources:
      - type: archive
        path: src/hello-2.10.tar.gz
```

The `buildsystem` value identifies how Flatpak must build the module. Each module can use its own build system, so one Flatpak can have several build systems defined.

The `no-autogen` value tells Flatpak not to run the setup commands for `autotools`, which aren’t necessary because the GNU Hello source code is the product of `make dist`. If the code you’re building isn’t in a easily buildable form, then you may need to install `autogen` and `autoconf` to prepare the source for `autotools`. This option doesn’t apply at all to projects that don’t use `autotools`.

The `type` value tells Flatpak that the source code is in an archive, which triggers the requisite unarchival tasks before building. The `path` points to the source code. In this example, the source exists in the `src` directory on your local build machine, but you could instead define the source as a remote location:


```
modules:
  - name: hello
    buildsystem: autotools
    no-autogen: true
    sources:
      - type: archive
        url: <https://ftp.gnu.org/gnu/hello/hello-2.10.tar.gz>
```

Finally, you must define the platform required for the application to run and build. The Flatpak maintainers supply runtimes and SDKs that include common libraries, including `freedesktop`, `gnome`, and `kde`. The basic requirement is the `freedesk` runtime and SDK, although this may be superseded by GNOME or KDE, depending on what your code needs to run. For this GNU Hello example, only the basics are required.


```
runtime: org.freedesktop.Platform
runtime-version: '18.08'
sdk: org.freedesktop.Sdk
```

The entire GNU Hello flatpak manifest:


```
id: org.gnu.Hello
runtime: org.freedesktop.Platform
runtime-version: '18.08'
sdk: org.freedesktop.Sdk
command: hello
modules:
  - name: hello
    buildsystem: autotools
    no-autogen: true
    sources:
      - type: archive
        path: src/hello-2.10.tar.gz
```

#### Building a Flatpak

Now that the package is defined, you can build it. The build process prompts Flatpak-builder to parse the manifest and to resolve each requirement: it ensures that the necessary Platform and SDK are available (if they aren’t, then you’ll have to install them with the `flatpak` command), it unarchives the source code, and executes the `buildsystem` specified.

The command to start:


```
`$ flatpak-builder build-dir org.gnu.Hello.yaml`
```

The directory `build-dir` is created if it does not already exist. The name `build-dir` is arbitrary; you could call it `build` or `bld` or `penguin`, and you can have more than one build destination in the same project directory. However, the term `build-dir` is a frequent value used in documentation, so using it as the literal value can be helpful.

#### Testing your application

You can test your application before or after it has been built by running the build command along with the `--run` option, and endingi the command with the command provided by the Flatpak:


```
$ flatpak-builder --run build-dir \
org.gnu.Hello.yaml hello
Hello, world!
```

### Packaging GUI apps with Flatpak

Packaging up a simple self-contained _hello world_ application is trivial, and fortunately packaging up a GUI application isn’t much harder. The most difficult applications to package are those that don’t rely on common libraries and frameworks (in the context of packaging, “common” means anything _not_ already packaged by someone else). The Flatpak community provides SDKs and SDK Extensions for many components you might otherwise have had to package yourself. For instance, when packaging the pure Java implementation of `pdftk`, I use the OpenJDK SDK extension I found in the Flatpak Github repository:


```
runtime: org.freedesktop.Platform
runtime-version: '18.08'
sdk: org.freedesktop.Sdk
sdk-extensions:
 - org.freedesktop.Sdk.Extension.openjdk11
```

The Flatpak community does a lot of work on the foundations required for applications to run upon in order to make the packaging process easy for developers. For instance, the Kblocks game from the KDE community requires the KDE platform to run, and that’s already available from Flatpak. The additional `libkdegames` library is not included, but it’s as easy to add it to your list of `modules` as `kblocks` itself.

Here’s a manifest for the Kblocks game:


```
id: org.kde.kblocks
command: kblocks
modules:
\- buildsystem: cmake-ninja
  name: libkdegames
  sources:
    type: archive
    path: src/libkdegames-19.08.2.tar.xz
\- buildsystem: cmake-ninja
  name: kblocks
  sources:
    type: archive
    path: src/kblocks-19.08.2.tar.xz
runtime: org.kde.Platform
runtime-version: '5.13'
sdk: org.kde.Sdk
```

As you can see, the manifest is still straight-forward and relatively intuitive. The build system is different, and the runtime and SDK point to KDE instead of the Freedesktop, but the structure and requirements are basically the same.

Because it’s a GUI application, however, there are some new options required. First, it needs an icon so that when it’s listed in the Activities or Application menu, it looks nice and recognizable. Kblocks includes an icon in its sources, but the names of files exported by a Flatpak must be prefixed using the application ID (such as `org.kde.Kblocks.desktop`). The easiest way to do this is to rename the file directly in the application source, which Flatpak can do for you as long as you include this directive in your manifest:


```
`rename-icon: kblocks`
```

Another unique trait of GUI applications is that they often require integration with common desktop services, like the graphics server (X11 or Wayland) itself, a sound server such as [Pulse Audio][7], and the Inter-Process Communication (IPC) subsystem.

In the case of Kblocks, the requirements are:


```
finish-args:
\- --share=ipc
\- --socket=x11
\- --socket=wayland
\- --socket=pulseaudio
\- --device=dri
\- --filesystem=xdg-config/kdeglobals:ro
```

Here’s the final, complete manifest, using URLs for the sources so you can try this on your own system easily:


```
command: kblocks
finish-args:
\- --share=ipc
\- --socket=x11
\- --socket=wayland
\- --socket=pulseaudio
\- --device=dri
\- --filesystem=xdg-config/kdeglobals:ro
id: org.kde.kblocks
modules:
\- buildsystem: cmake-ninja
  name: libkdegames
  sources:
  - sha256: 83456cec44502a1f79c0be00c983090e32fd8aea5fec1461fbfbd37b5f8866ac
    type: archive
    url: <https://download.kde.org/stable/applications/19.08.2/src/libkdegames-19.08.2.tar.xz>
\- buildsystem: cmake-ninja
  name: kblocks
  sources:
  - sha256: 8b52c949e2d446a4ccf81b09818fc90234f2f55d8722c385491ee67e1f2abf93
    type: archive
    url: <https://download.kde.org/stable/applications/19.08.2/src/kblocks-19.08.2.tar.xz>
rename-icon: kblocks
runtime: org.kde.Platform
runtime-version: '5.13'
sdk: org.kde.Sdk
```

To build the application, you must have the KDE Platform and SDK Flatpaks (version 5.13 as of this writing) installed. Once the application has been built, you can run it using the `--run` method, but to see the application icon, you must install it.

#### Distributing and installing a Flatpak you have built

Distributing flatpaks happen through repositories.

You can list your apps on [Flathub.org][8], a community website meant as a _technically_ decentralised (but central in spirit) location for Flatpaks. To submit your Flatpak, [place your manifest into a Git repository][9] and [submit a pull request on Github][10].

Alternately, you can create your own repository using the `flatpak build-export` command.

You can also just install locally:


```
`$ flatpak-builder --force-clean --install build-dir org.kde.Kblocks.yaml`
```

Once installed, open your Activities or Applications menu and search for Kblocks.

![The Activities menu in GNOME][11]

### Learning more

The [Flatpak documentation site][12] has a good walkthrough on building your first Flatpak. It’s worth reading even if you’ve followed along with this article. Besides that, the docs provide details on what Platforms and SDKs are available.

For those who enjoy learning from examples, there are manifests for _every application_ available on [Flathub][13].

The resources to build and use Flatpaks are plentiful, and Flatpak, along with containers and sandboxed apps, are arguably [the future][14], so get familiar with them, start integrating them with your Jenkins pipelines, and enjoy easy and universal Linux app packaging.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/how-build-flatpak-packaging

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/flatpak-lead-image.png?itok=J93RG_fi
[2]: http://notabug.org
[3]: http://savannah.nongnu.org/
[4]: http://debian.org
[5]: https://opensource.com/article/19/7/introduction-gnu-autotools
[6]: https://www.redhat.com/sysadmin/yaml-tips
[7]: https://opensource.com/article/17/1/linux-plays-sound
[8]: http://flathub.org
[9]: https://opensource.com/resources/what-is-git
[10]: https://opensource.com/life/16/3/submit-github-pull-request
[11]: https://opensource.com/sites/default/files/gnome-activities-kblocks.jpg (The Activities menu in GNOME)
[12]: http://docs.flatpak.org/en/latest/introduction.html
[13]: https://github.com/flathub
[14]: https://silverblue.fedoraproject.org/

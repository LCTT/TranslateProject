Python
============================================================

Python has rich tools for packaging, distributing and sandboxing applications. Snapcraft builds on top of these familiar tools such as `pip`, `setup.py` and `requirements.txt` to create snaps for people to install on Linux.

### What problems do snaps solve for Python applications?

Linux install instructions for Python applications often get complicated. System dependencies, which differ from distribution to distribution, must be separately installed. To prevent modules from different Python applications clashing with each other, developer tools like `virtualenv` or `venv` must be used. With snapcraft it’s one command to produce a bundle that works anywhere.

Here are some snap advantages that will benefit many Python projects:

*   Bundle all the runtime requirements, including the exact versions of system libraries and the Python interpreter.

*   Simplify installation instructions, regardless of distribution, to `snap install mypythonapp`.

*   Directly control the delivery of automatic application updates.

*   Extremely simple creation of daemons.

### Getting started

Let’s take a look at offlineimap and youtube-dl by way of examples. Both are command line applications. offlineimap uses Python 2 and only has Python module requirements. youtube-dl uses Python 3 and has system package requirements, in this case `ffmpeg`.

### offlineimap

Snaps are defined in a single yaml file placed in the root of your project. The offlineimap example shows the entire `snapcraft.yaml` for an existing project. We’ll break this down.

```
name: offlineimap
version: git
summary: OfflineIMAP
description: |
  OfflineIMAP is software that downloads your email mailbox(es) as local
  Maildirs. OfflineIMAP will synchronize both sides via IMAP.

grade: devel
confinement: devmode

apps:
  offlineimap:
    command: bin/offlineimap

parts:
  offlineimap:
    plugin: python
    python-version: python2
    source: .

```

#### Metadata

The `snapcraft.yaml` starts with a small amount of human-readable metadata, which usually can be lifted from the GitHub description or project README.md. This data is used in the presentation of your app in the Snap Store. The `summary:` can not exceed 79 characters. You can use a pipe with the `description:` to declare a multi-line description.

```
name: offlineimap
version: git
summary: OfflineIMAP
description: |
  OfflineIMAP is software that downloads your email mailbox(es) as local
  Maildirs. OfflineIMAP will synchronize both sides via IMAP.

```

#### Confinement

To get started we won’t confine this application. Unconfined applications, specified with `devmode`, can only be released to the hidden “edge” channel where you and other developers can install them.

```
confinement: devmode

```

#### Parts

Parts define how to build your app. Parts can be anything: programs, libraries, or other assets needed to create and run your application. In this case we have one: the offlineimap source code. In other cases these can point to local directories, remote git repositories, or tarballs.

The Python plugin will also bundle Python in the snap, so you can be sure that the version of Python you test against is included with your app. Dependencies from `install_requires` in your `setup.py` will also be bundled. Dependencies from a `requirements.txt` file can also be bundled using the `requirements:` option.

```
parts:
  offlineimap:
    plugin: python
    python-version: python2
    source: .

```

#### Apps

Apps are the commands and services exposed to end users. If your command name matches the snap `name`, users will be able run the command directly. If the names differ, then apps are prefixed with the snap `name`(`offlineimap.command-name`, for example). This is to avoid conflicting with apps defined by other installed snaps.

If you don’t want your command prefixed you can request an alias for it on the [Snapcraft forum][1]. These command aliases are set up automatically when your snap is installed from the Snap Store.

```
apps:
  offlineimap:
    command: bin/offlineimap

```

If your application is intended to run as a service, add the line `daemon: simple` after the command keyword. This will automatically keep the service running on install, update and reboot.

### Building the snap

You’ll first need to [install snap support][2], and then install the snapcraft tool:

```
sudo snap install --beta --classic snapcraft

```

If you have just installed snap support, start a new shell so your `PATH` is updated to include `/snap/bin`. You can then build this example yourself:

```
git clone https://github.com/snapcraft-docs/offlineimap
cd offlineimap
snapcraft

```

The resulting snap can be installed locally. This requires the `--dangerous` flag because the snap is not signed by the Snap Store. The `--devmode` flag acknowledges that you are installing an unconfined application:

```
sudo snap install offlineimap_*.snap --devmode --dangerous

```

You can then try it out:

```
offlineimap

```

Removing the snap is simple too:

```
sudo snap remove offlineimap

```

Jump ahead to [Share with your friends][3] or continue to read another example.

### youtube-dl

The youtube-dl example shows a `snapcraft.yaml` using a tarball of a Python application and `ffmpeg` bundled in the snap to satisfy the runtime requirements. Here is the entire `snapcraft.yaml` for youtube-dl. We’ll break this down.

```
name: youtube-dl
version: 2017.06.18
summary: YouTube Downloader.
description: |
  youtube-dl is a small command-line program to download videos from
  YouTube.com and a few more sites.

grade: devel
confinement: devmode

parts:
  youtube-dl:
    source: https://github.com/rg3/youtube-dl/archive/$SNAPCRAFT_PROJECT_VERSION.tar.gz
    plugin: python
    python-version: python3
    after: [ffmpeg]

apps:
  youtube-dl:
    command: bin/youtube-dl

```

#### Parts

The `$SNAPCRAFT_PROJECT_VERSION` variable is derived from the `version:` stanza and used here to reference the matching release tarball. Because the `python` plugin is used, snapcraft will bundle a copy of Python in the snap using the version specified in the `python-version:` stanza, in this case Python 3.

youtube-dl makes use of `ffmpeg` to transcode or otherwise convert the audio and video file it downloads. In this example, youtube-dl is told to build after the `ffmpeg` part. Because the `ffmpeg` part specifies no plugin, it will be fetched from the parts repository. This is a collection of community-contributed definitions which can be used by anyone when building a snap, saving you from needing to specify the source and build rules for each system dependency. You can use `snapcraft search` to find more parts to use and `snapcraft define <part-name>` to verify how the part is defined.

```
parts:
  youtube-dl:
    source: https://github.com/rg3/youtube-dl/archive/$SNAPCRAFT_PROJECT_VERSION.tar.gz
    plugin: python
    python-version: python3
    after: [ffmpeg]

```

### Building the snap

You can build this example yourself by running the following:

```
git clone https://github.com/snapcraft-docs/youtube-dl
cd youtube-dl
snapcraft

```

The resulting snap can be installed locally. This requires the `--dangerous` flag because the snap is not signed by the Snap Store. The `--devmode` flag acknowledges that you are installing an unconfined application:

```
sudo snap install youtube-dl_*.snap --devmode --dangerous

```

Run the command:

```
youtube-dl “https://www.youtube.com/watch?v=k-laAxucmEQ”

```

Removing the snap is simple too:

```
sudo snap remove youtube-dl

```

### Share with your friends

To share your snaps you need to publish them in the Snap Store. First, create an account on [the dashboard][4]. Here you can customize how your snaps are presented, review your uploads and control publishing.

You’ll need to choose a unique “developer namespace” as part of the account creation process. This name will be visible by users and associated with your published snaps.

Make sure the `snapcraft` command is authenticated using the email address attached to your Snap Store account:

```
snapcraft login

```

### Reserve a name for your snap

You can publish your own version of a snap, provided you do so under a name you have rights to.

```
snapcraft register mypythonsnap

```

Be sure to update the `name:` in your `snapcraft.yaml` to match this registered name, then run `snapcraft` again.

### Upload your snap

Use snapcraft to push the snap to the Snap Store.

```
snapcraft push --release=edge mypthonsnap_*.snap

```

If you’re happy with the result, you can commit the snapcraft.yaml to your GitHub repo and [turn on automatic builds][5] so any further commits automatically get released to edge, without requiring you to manually build locally.

### Further customisations

Here are all the Python plugin-specific keywords:

```
- requirements:
  (string)
  Path to a requirements.txt file
- constraints:
  (string)
  Path to a constraints file
- process-dependency-links:
  (bool; default: false)
  Enable the processing of dependency links in pip, which allow one project
  to provide places to look for another project
- python-packages:
  (list)
  A list of dependencies to get from PyPI
- python-version:
  (string; default: python3)
  The python version to use. Valid options are: python2 and python3

```

You can view them locally by running:

```
snapcraft help python

```

### Extending and overriding behaviour

You can [extend the behaviour][6] of any part in your `snapcraft.yaml` with shell commands. These can be run after pulling the source code but before building by using the `prepare` keyword. The build process can be overridden entirely using the `build` keyword and shell commands. The `install` keyword is used to run shell commands after building your code, useful for making post build modifications such as relocating build assets.

Using the youtube-dl example above, we can run the test suite at the end of the build. If this fails, the snap creation will be terminated:

```
parts:
  youtube-dl:
    source: https://github.com/rg3/youtube-dl/archive/$SNAPCRAFT_PROJECT_VERSION.tar.gz
    plugin: python
    python-version: python3
    stage-packages: [ffmpeg, python-nose]
    install: |
      nosetests
```

--------------------------------------------------------------------------------

via: https://docs.snapcraft.io/build-snaps/python

作者：[Snapcraft.io ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:Snapcraft.io

[1]:https://forum.snapcraft.io/t/process-for-reviewing-aliases-auto-connections-and-track-requests/455
[2]:https://docs.snapcraft.io/core/install
[3]:https://docs.snapcraft.io/build-snaps/python#share-with-your-friends
[4]:https://dashboard.snapcraft.io/openid/login/?next=/dev/snaps/
[5]:https://build.snapcraft.io/
[6]:https://docs.snapcraft.io/build-snaps/scriptlets

[#]: subject: "Build your own Fedora IoT Remix"
[#]: via: "https://fedoramagazine.org/build-your-own-fedora-iot-remix/"
[#]: author: "Alexander Wellbrock https://fedoramagazine.org/author/w4tsn/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Build your own Fedora IoT Remix
======

![][1]

Background excerpted from photo by [S. Tsuchiya][2] on [Unsplash][3]

Fedora IoT Edition is aimed at the Internet of Things. It was introduced in the article [How to turn on an LED][4] with Fedora IoT in 2018. It is based on [RPM-OSTree][5] as a core technology to gain some nifty properties and features which will be covered in a moment.

RPM-OSTree is a high-level tool built on [libostree][6] which is a set of tools establishing a “git-like” model for committing and exchanging filesystem trees, deployment of said trees, bootloader configuration and layered RPM package management. Such a system benefits from the following properties:

  * Transactional upgrade and rollback
  * Read-only filesystem areas
  * Potentially small updates through deltas
  * Branching, including rebase and multiple deployments
  * Reproducible filesystem
  * Specification of filesystem through version-controlled code



Exchange of filesystem trees and corresponding commits is done through OSTree repositories or remotes. When using one of the Fedora Editions based on RPM-OSTree there are remotes from which the system downloads commits and applies them, rather than downloading and installing separate RPMs.

A [Remix][7] in the Fedora ecosystem is an altered, opinionated version of the OS. It covers the needs of a specific niche. This article will dive into the world of building your own filesystem commits based on Fedora IoT Edition. You will become acquainted to the tools, terminology, design and processes of such a system. If you follow the directions in this guide you will end up with your own Fedora IoT Remix.

### Preparations

You will need some packages to get started. On non-ostree systems install the packages _ostree_ and _rpm-ostree_. Both are available in the Fedora Linux package repositories. Additionally install _git_ to access the Fedora IoT ostree spec sources.

```
sudo dnf install ostree rpm-ostree git
```

Assuming you have a spare, empty folder laying around to work with, start there by creating some files and folders that will be needed along the way.

```
mkdir .cache .build-repo .deploy-repo .tmp custom
```

The _.cache_ directory is used by all build commands around rpm-ostree. The folders _build_ and _deploy_ store separate repositories to keep the build environment separate from the actual remix. The _.tmp_ directory is used to combine the git-managed upstream sources (from Fedora IoT, for example) with modifications kept in the _custom_ directory.

As you build your own OSTree as derivative from Fedora IoT you will need the sources. Clone them into the folder _.fedora-iot-spec_. They contain several configuration files specifying how the ostree filesystem for Fedora IoT is built, what packages to include, etc.

```
git clone -b "f34" https://pagure.io/fedora-iot/ostree.git .fedora-iot-spec
```

#### OSTree repositories

Create repositories to build and store an OSTree filesystem and its contents . A place to store commits and manage their metadata. Wait, what? What is an OSTree commit anyway? Glad you ask! With _rpm-ostree_ you build so-called _libostree commits_. The terminology is roughly based on git. They essentially work in similar ways. Those commits store diffs from one state of the filesystem to the next. If you change a binary blob inside the tree, the commit contains this change. You can deploy this specific version of the filesystem at any time.

Use the _ostree init_ command to create two _ostree repositories_.

```
ostree --repo=".build-repo" init --mode=bare-user
ostree --repo=".deploy-repo" init --mode=archive
```

The main difference between the repositories is their mode. Create the build repository in “bare-user” mode and the “production” repository in “archive” mode. The _bare*_ mode is well suited for build environments. The “user” portion additionally allows non-root operation and storing extended attributes. Create the other repository in _archive_ mode. It stores objects compressed; making them easy to move around. If all that doesn’t mean a thing to you, don’t worry. The specifics don’t matter for your primary goal here – to build your own Remix.

Let me share just a little anecdote on this: When I was working on building ostree-based systems on GitLab CI/CD pipelines and we had to move the repositories around different jobs, we once tried to move them uncompressed in _bare-user_ mode via caches. We learned that, while this works with _archive_ repos, it does not with _bare*_ repos. Important filesystem attributes will get corrupted on the way.

#### Custom flavor

What’s a Remix without any customization? Not much! Create some configuration files as adjustment for your own OS. Assuming you want to deploy the Remix on a system with a hardware watchdog (a [Raspberry Pi][8], for example) start with a watchdog configuration file:

```
./custom/watchdog.conf
watchdog-device        = /dev/watchdog
max-load-1             = 24
max-load-15            = 9
realtime               = yes
priority               = 1
watchdog-timeout       = 15 # Broadcom BCM2835 limitation
```

The _postprocess-script_ is an arbitrary shell script executed inside the target filesystem tree as part of the build process. It allows for last-minute customization of the filesystem in a restricted and (by default) network-less environment. It’s a good place to ensure the correct file permissions are set for the custom watchdog configuration file.

```
./custom/treecompose-post.sh
#!/bin/sh

set -e

# Prepare watchdog
chown root:root /etc/watchdog.conf
chmod 0644 /etc/watchdog.conf
```

#### Plant a Treefile

Fedora IoT is pretty minimal and keeps its main focus on security and best-practices. The rest is up to you and your use-case. As a consequence, the watchdog package is not provided from the get-go. In RPM-OSTree the spec file is called [Treefile][9] and encoded in [JSON][10]. In the _Treefile_ you specify what packages to install, files and folders to exclude from packages, _configuration files_ to add to the _filesystem tree_ and _systemd units_ to enable by default.

```
./custom/treefile.json
{
  "ref": "OSTreeBeard/stable/x86_64",
  "ex-jigdo-spec": "fedora-iot.spec",
  "include": "fedora-iot-base.json",
  "boot-location": "modules",
  "packages": [
      "watchdog"
  ],
  "remove-files": [
      "etc/watchdog.conf"
  ],
  "add-files": [
      ["watchdog.conf", "/etc/watchdog.conf"]
  ],
  "units": [
      "watchdog.service"
  ],
  "postprocess-script": "treecompose-post.merged.sh"
}
```

The _ref_ is basically the branch name within the repository. Use it to refer to this specific spec in _rpm-ostree_ operations. With _ex-jigdo-spec_ and _include_ you link this _Treefile_ to the configuration of the _Fedora IoT sources_. Additionally specify the _Fedora Updates repo_ in the _repos_ section. It is not part of the sources so you will have to add that yourself. More on that in a moment.

With _packages_ you instruct _rpm-ostree_ to install the _watchdog_ package. Exclude the _watchdog.conf_ file and replace it with the one from the _custom_ directory by using _remove-files_ and _add-files_. Now just enable the _watchdog.service_ and you are good to go.

All available treefile options are available in the [official RPM-OSTree documentation][11].

#### Add another RPM repository

In it’s initial configuration the OSTree only uses the initial Fedora 34 package repository. Add the Fedora 34 Updates repository as well. To do so, add the following file to your _custom_ directory.

```
./custom/fedora-34-updates.repo
[fedora-34-updates]
name=Fedora 34 - $basearch - Updates
#baseurl=http://download.fedoraproject.org/pub/fedora/linux/updates/$releasever/Everything/$basearch/
metalink=https://mirrors.fedoraproject.org/metalink?repo=updates-released-f34&arch=$basearch
enabled=1
repo_gpgcheck=0
type=rpm
gpgcheck=1
#metadata_expire=7d
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-34-$basearch
skip_if_unavailable=False
```

Now tell rpm-ostree in the spec for your Remix to include this repository. Use the _treefile_‘s _repos_ section.

```
./custom/treefile.json
{
  ...
  "repos": [
      "fedora-34",
      "fedora-34-updates"
  ],
  ...
}
```

### Build your own Fedora IoT Remix

You have all that need to build your first ostree based filesystem. By now you setup a certain project structure, downloaded the Fedora IoT upstream specs, and added some customization and initialized the ostree repositories. All you need to do now is throw everything together and create a nicely flavored Fedora IoT Remix salsa.

```
cp ./.fedora-iot-spec/* .tmp/
cp ./custom/* .tmp/
```

Combine the _postprocessing-scripts_ of the _Fedora IoT upstream sources_ and your _custom_ directory.

```
cat "./.fedora-iot-spec/treecompose-post.sh" "./custom/treecompose-post.sh" > ".tmp/treecompose-post.merged.sh"
chmod +x ".tmp/treecompose-post.merged.sh"
```

Remember that you specified _treecompose-post.merged.sh_ as your post-processing script earlier in _treefile.json_? That’s where this file comes from.

Note that all the files – systemd units, scripts, configurations – mentioned in _ostree.json_ are now available in _.tmp_. This folder is the build context that all the references are relative to.

You are only one command away from kicking off your first build of a customized Fedora IoT. Now, kick-of the build with _rpm-ostree compose tree_ command. Now grab a cup of coffee, enjoy and wait for the build to finish. That may take between 5 to 10 minutes depending on your host hardware. See you later!

```
sudo rpm-ostree compose tree --unified-core --cachedir=".cache" --repo=".build-repo" --write-commitid-to="$COMMIT_FILE" ".tmp/treefile.json"
```

#### Prepare for deployment

Oh, erm, you are back already? Ehem. Good! – The _.build-repo_ now stores a complete filesystem tree of around 700 to 800 MB of compressed data. The last thing to do before you consider putting this on the network and deploying it on your device(s) (at least for now) is to add a _commit_ with an arbitrary _commit subject_ and _metadata_ and to pull the result over to the _deploy-repo_.

```
sudo ostree --repo=".deploy-repo" pull-local ".build-repo" "OSTreeBeard/stable/x86_64"
```

The _deploy-repo_ can now be placed on any file-serving webserver and then used as a new _ostree remote_ … theoretically. I won’t go through the topic of security for ostree remotes just yet. As an initial advise though: Always sign OSTree commits with GPG to ensure the authenticity of your updates. Apart from that it’s only a matter of adding the remote configuration on your target and using _rpm-ostree rebase_ to switch over to this Remix.

As a final thing before you leave to do outside stuff (like with fresh air, sun, ice-cream or whatever), take a look around the newly built filesystem to ensure that everything is in place.

#### Explore the filesystem

Use _ostree refs_ to list available refs in the repo or on your system.

```
$ ostree --repo=".deploy-repo" refs
OSTreeBeard/stable/x86_64
```

Take a look at the commits of a ref with _ostree log_.

```
$ ostree --repo=".deploy-repo" log OSTreeBeard/stable/x86_64
commit 849c0648969c8c2e793e5d0a2f7393e92be69216e026975f437bdc2466c599e9
ContentChecksum:  bcaa54cc9d8ffd5ddfc86ed915212784afd3c71582c892da873147333e441b26
Date:  2021-07-27 06:45:36 +0000
Version: 34
(no subject)
```

List the ostree filesystem contents with _ostree ls_.

```
$ ostree --repo=".build-repo" ls OSTreeBeard/stable/x86_64
d00755 0 0      0 /
l00777 0 0      0 /bin -> usr/bin
l00777 0 0      0 /home -> var/home
l00777 0 0      0 /lib -> usr/lib
l00777 0 0      0 /lib64 -> usr/lib64
l00777 0 0      0 /media -> run/media
l00777 0 0      0 /mnt -> var/mnt
l00777 0 0      0 /opt -> var/opt
l00777 0 0      0 /ostree -> sysroot/ostree
l00777 0 0      0 /root -> var/roothome
l00777 0 0      0 /sbin -> usr/sbin
l00777 0 0      0 /srv -> var/srv
l00777 0 0      0 /tmp -> sysroot/tmp
d00755 0 0      0 /boot
d00755 0 0      0 /dev
d00755 0 0      0 /proc
d00755 0 0      0 /run
d00755 0 0      0 /sys
d00755 0 0      0 /sysroot
d00755 0 0      0 /usr
d00755 0 0      0 /var
$ ostree --repo=".build-repo" ls OSTreeBeard/stable/x86_64 /usr/etc/watchdog.conf
-00644 0 0    208 /usr/etc/watchdog.conf
```

Take note that the _watchdog.conf_ file is located under _/usr/etc/watchdog.conf_. On booted deployment this is located at _/etc/watchdog.conf_ as usual.

### Where to go from here?

You took a brave step in building a customized Fedora IoT on your local machine. First I introduced you the concepts and vocabulary so you could understand where you were at and where you wanted to go. You then ensured all the tools were in place. You looked at the ostree repository modes and mechanics before analyzing a typical _ostree configuration_. To spice it up and make it a bit more interesting you made an additional service and configuration ready to role out on your device(s). To do that you added the Fedora Updates RPM repository and then kicked off the build process. Last but not least, you packaged the result up in a format ready to be placed somewhere on the network.

There are a lot more topics to cover. I could explain how to configure an NGINX to serve ostree remotes effectively. Or how to ensure the security and authenticity of the filesystem and updates through GPG signatures. Also, how one manually alters the filesystem and what tooling is available for building the filesystem. There is also more to be explained about how to test the Remix and how to build flashable images and installation media.

Let me know in the comments what you think and what you care about. Tell me what you’d like to read next. If you already built Fedora IoT, I’m happy to read your stories too.

### References

  * [Fedora IoT documentation][12]
  * [libostree documentation][13]
  * [rpm-ostree documentation][5]



--------------------------------------------------------------------------------

via: https://fedoramagazine.org/build-your-own-fedora-iot-remix/

作者：[Alexander Wellbrock][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/w4tsn/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/08/rpi-816x345.jpg
[2]: https://unsplash.com/@s_tsuchiya?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/raspberry-pi?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://fedoramagazine.org/turnon-led-fedora-iot/
[5]: https://coreos.github.io/rpm-ostree/
[6]: https://ostreedev.github.io/ostree/
[7]: https://fedoraproject.org/wiki/Remix
[8]: https://en.wikipedia.org/wiki/Raspberry_Pi
[9]: https://rpm-ostree.readthedocs.io/en/stable/manual/treefile/
[10]: https://en.wikipedia.org/wiki/JSON
[11]: https://coreos.github.io/rpm-ostree/treefile/
[12]: https://docs.fedoraproject.org/en-US/iot/
[13]: https://ostreedev.github.io/ostree/introduction/

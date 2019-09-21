[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Packit – packaging in Fedora with minimal effort)
[#]: via: (https://fedoramagazine.org/packit-packaging-in-fedora-with-minimal-effort/)
[#]: author: (Petr Hracek https://fedoramagazine.org/author/phracek/)

Packit – packaging in Fedora with minimal effort
======

![][1]

### What is packit

Packit ([https://packit.dev/)][2] is a CLI tool that helps you auto-maintain your upstream projects into the Fedora operating system. But what does it really mean?

As a developer, you might want to update your package in Fedora. If you’ve done it in the past, you know it’s no easy task. If you haven’t let me reiterate: it’s no easy task.

And this is exactly where packit can help: once you have your package in Fedora, you can maintain your SPEC file upstream and, with just one additional configuration file, packit will help you update your package in Fedora when you update your source code upstream.

Furthermore, packit can synchronize downstream changes to a SPEC file back into the upstream repository. This could be useful if the SPEC file of your package is changed in Fedora repositories and you would like to synchronize it into your upstream project.

Packit also provides a way to build an SRPM package based on an upstream repository checkout, which can be used for building RPM packages in COPR.

Last but not least, packit provides a status command. This command provides information about upstream and downstream repositories, like pull requests, release and more others.

Packit provides also another two commands: _build_ and _create-update_.

The command _packit build_ performs a production build of your project in Fedora build system – koji. You can Fedora version you want to build against using an option _–dist-git-branch_. The command _packit create-updates_ creates a Bodhi update for the specific branch using the option — _dist-git-branch_.

### Installation

You can install packit on Fedora using dnf:

```
sudo dnf install -y packit
```

### Configuration

For demonstration use case, I have selected the upstream repository of **colin** ([https://github.com/user-cont/colin)][3]. Colin is a tool to check generic rules and best-practices for containers, dockerfiles, and container images.

First of all, clone **colin** git repository:

```
$ git clone https://github.com/user-cont/colin.git
$ cd colin
```

Packit expects to run in the root of your git repository.

Packit ([https://github.com/packit-service/packit/)][4] needs information about your project, which has to be stored in the upstream repository in the _.packit.yaml_ file (<https://github.com/packit-service/packit/blob/master/docs/configuration.md#projects-configuration-file>).

See colin’s packit configuration file:

```
$ cat .packit.yaml
specfile_path: colin.spec
synced_files:
  -.packit.yaml
  - colin.spec
upstream_project_name: colin
downstream_package_name: colin
```

What do the values mean?

  * _specfile_path_ – a relative path to a spec file within the upstream repository (mandatory)
  * _synced_files_ – a list of relative paths to files in the upstream repo which are meant to be copied to dist-git during an update
  * _upstream_project_name_ – name of the upstream repository (e.g. in PyPI); this is used in %prep section
  * _downstream_package_name_ – name of the package in Fedora (mandatory)



For more information see the packit configuration documentation (<https://github.com/packit-service/packit/blob/master/docs/configuration.md>)

### What can packit do?

Prerequisite for using packit is that you are in a working directory of a git checkout of your upstream project.

Before running any packit command, you need to do several actions. These actions are mandatory for filing a PR into the upstream or downstream repositories and to have access into the Fedora dist-git repositories.

Export GitHub token taken from <https://github.com/settings/tokens>:

```
$ export GITHUB_TOKEN=<YOUR_TOKEN>
```

Obtain your Kerberos ticket needed for Fedora Account System (FAS) :

```
$ kinit <yourname>@FEDORAPROJECT.ORG
```

Export your Pagure API keys taken from <https://src.fedoraproject.org/settings#nav-api-tab>:

```
$ export PAGURE_USER_TOKEN=<PAGURE_USER_TOKEN>
```

Packit also needs a fork token to create a pull request. The token is taken from <https://src.fedoraproject.org/fork/YOU/rpms/PACKAGE/settings#apikeys-tab>

Do it by running:

```
$ export PAGURE_FORK_TOKEN=<PAGURE_FORK_TOKEN>
```

Or store these tokens in the **~/.config/packit.yaml** file:

```
$ cat ~/.config/packit.yaml

github_token: <GITHUB_TOKEN>
pagure_user_token: <PAGURE_USER_TOKEN>
pagure_fork_token: <PAGURE_FORK_TOKEN>
```

#### Propose a new upstream release in Fedora

The command for this first use case is called _**propose-update**_ (<https://github.com/jpopelka/packit/blob/master/docs/propose_update.md>). The command creates a new pull request in Fedora dist-git repository using a selected or the latest upstream release.

```
$ packit propose-update

INFO: Running 'anitya' versioneer
Version in upstream registries is '0.3.1'.
Version in spec file is '0.3.0'.
WARNING  Version in spec file is outdated
Picking version of the latest release from the upstream registry.
Checking out upstream version 0.3.1
Using 'master' dist-git branch
Copying /home/vagrant/colin/colin.spec to /tmp/tmptfwr123c/colin.spec.
Archive colin-0.3.0.tar.gz found in lookaside cache (skipping upload).
INFO: Downloading file from URL https://files.pythonhosted.org/packages/source/c/colin/colin-0.3.0.tar.gz
100%[=============================>]     3.18M  eta 00:00:00
Downloaded archive: '/tmp/tmptfwr123c/colin-0.3.0.tar.gz'
About to upload to lookaside cache
won't be doing kinit, no credentials provided
PR created: https://src.fedoraproject.org/rpms/colin/pull-request/14
```

Once the command finishes, you can see a PR in the Fedora Pagure instance which is based on the latest upstream release. Once you review it, it can be merged.

![][5]

#### Sync downstream changes back to the upstream repository

Another use case is to sync downstream changes into the upstream project repository.

The command for this purpose is called _**sync-from-downstream**_ (<https://github.com/jpopelka/packit/blob/master/docs/sync-from-downstream.md>). Files synced into the upstream repository are mentioned in the _packit.yaml_ configuration file under the _synced_files_ value.

```
$ packit sync-from-downstream

upstream active branch master
using "master" dist-git branch
Copying /tmp/tmplvxqtvbb/colin.spec to /home/vagrant/colin/colin.spec.
Creating remote fork-ssh with URL git@github.com:phracek/colin.git.
Pushing to remote fork-ssh using branch master-downstream-sync.
PR created: https://github.com/user-cont/colin/pull/229
```

As soon as packit finishes, you can see the latest changes taken from the Fedora dist-git repository in the upstream repository. This can be useful, e.g. when Release Engineering performs mass-rebuilds and they update your SPEC file in the Fedora dist-git repository.

![][6]

#### Get the status of your upstream project

If you are a developer, you may want to get all the information about the latest releases, tags, pull requests, etc. from the upstream and the downstream repository. Packit provides the _**status**_ command for this purpose.

```
$ packit status
Downstream PRs:
  ID  Title                             URL
----  --------------------------------  ---------------------------------------------------------
  14  Update to upstream release 0.3.1  https://src.fedoraproject.org//rpms/colin/pull-request/14
  12  Upstream pr: 226                  https://src.fedoraproject.org//rpms/colin/pull-request/12
  11  Upstream pr: 226                  https://src.fedoraproject.org//rpms/colin/pull-request/11
   8  Upstream pr: 226                  https://src.fedoraproject.org//rpms/colin/pull-request/8

Dist-git versions:
f27: 0.2.0
f28: 0.2.0
f29: 0.2.0
f30: 0.2.0
master: 0.2.0

GitHub upstream releases:
0.3.1
0.3.0
0.2.1
0.2.0
0.1.0

Latest builds:
f27: colin-0.2.0-1.fc27
f28: colin-0.3.1-1.fc28
f29: colin-0.3.1-1.fc29
f30: colin-0.3.1-2.fc30

Latest bodhi updates:
Update                Karma  status
------------------  -------  --------
colin-0.3.1-1.fc29        1  stable
colin-0.3.1-1.fc28        1  stable
colin-0.3.0-2.fc28        0  obsolete
```

#### Create an SRPM

The last packit use case is to generate an SRPM package based on a git checkout of your upstream project. The packit command for SRPM generation is _**srpm**_.

```
$ packit srpm
Version in spec file is '0.3.1.37.g00bb80e'.
SRPM: /home/phracek/work/colin/colin-0.3.1.37.g00bb80e-1.fc29.src.rpm
```

### Packit as a service

In the summer, the people behind packit would like to introduce packit as a service (<https://github.com/packit-service/packit-service>). In this case, the packit GitHub application will be installed into the upstream repository and packit will perform all the actions automatically, based on the events it receives from GitHub or fedmsg.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/packit-packaging-in-fedora-with-minimal-effort/

作者：[Petr Hracek][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/phracek/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/05/packit3-816x345.png
[2]: https://packit.dev/
[3]: https://github.com/user-cont/colin
[4]: https://github.com/packit-service/packit/
[5]: https://fedoramagazine.org/wp-content/uploads/2019/05/colin_pr-1024x781.png
[6]: https://fedoramagazine.org/wp-content/uploads/2019/05/colin_upstream_pr-1-1024x677.png

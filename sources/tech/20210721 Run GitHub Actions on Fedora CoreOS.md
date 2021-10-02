[#]: subject: (Run GitHub Actions on Fedora CoreOS)
[#]: via: (https://fedoramagazine.org/run-github-actions-on-fedora-coreos/)
[#]: author: (Clément Verna https://fedoramagazine.org/author/cverna/)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Run GitHub Actions on Fedora CoreOS
======

![][1]

[United Artists][2], Public domain, via Wikimedia Commons

[GitHub Actions][3] is a service provided to quickly setup continuous integration and delivery (CI/CD) workflows . These workflows run on hosts called _runners_. GitHub provides [hosted runners][4] with a limited set of operating system choice (Windows Server, Ubuntu, MacOS).

Another option is to use [self-hosted][5] runners which gives the repository administrator more control on the runners. Self-hosted runners are dedicated to a repository or organization. The following article goes through the steps of configuring self-hosted runners using Fedora CoreOS.

### Getting Started

Fedora CoreOS is a minimalist operating system designed to be easy to deploy and maintain at scale. The operating system will automaticaly update and provide, by default, the tools needed to run containers. For all of these reasons, Fedora CoreOS is a great choice to consider for running CI/CD workflows.

The first step to configure and provision a Fedora CoreOS machine is to generate an [Ignition][6] file. [Butane][7] allows you to generate Ignition’s file using a friendlier format (YAML).

#### Configure a Fedora CoreOS runner

To execute GitHub actions on Fedora CoreOS, the host needs the binaries and scripts used to register and run the runner. Download the binaries and scripts from the [actions runner project][8] and deploy under _/usr/local/sbin/actions-runner_.

```
version: "1.3.0"
variant: fcos
storage:
  directories:
    - path: /usr/local/sbin/actions-runner
      mode: 0755
      user:
        name: core
      group:
        name: core
  files:
    - path: /usr/local/sbin/actions-runner/actions-runner-linux.tar.gz
      overwrite: true
      contents:
        source: https://github.com/actions/runner/releases/download/v2.278.0/actions-runner-linux-x64-2.278.0.tar.gz
      mode: 0755
      user:
        name: core
      group:
        name: core
```

#### Registration and Removal token

Configuring runners for a project requires a “token”. This prevents registering or removing self-hosted runners from projects without the correct permissions. Tokens provided by Github have a one hour expiration time. If the runner restarts after this time it will require a new registration token.

The token can be problematic, in particular with Fedora CoreOS automatic updates. The update process expects that the host will restart at least once every couple weeks after receiving new data.

Luckily, it is possible to use GitHub REST API to obtain these tokens and automatically configure the runner every time the host restarts. The following _manage-runner.sh_ script uses the APIs to retrieve a token, remove any runner already configured and register the runner with a new token.

```
#!/bin/bash
# Handles the Github Action runner configuration.
# Remove and Registration token expires after 1 hour, if we want our runner
# to work after a reboot (auto update) we need to refresh the tokens.

# First remove the runner with a fresh remove token
REMOVE_TOKEN=$(curl -u ${GITHUB_USER}:${GITHUB_TOKEN} -X POST -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/${GITHUB_USER}/${GITHUB_REPO}/actions/runners/remove-token | jq -r '.token')
/usr/local/sbin/actions-runner/config.sh remove --token ${REMOVE_TOKEN}


# Then register the runner with a fresh registration token
REGISTRATION_TOKEN=$(curl -u ${GITHUB_USER}:${GITHUB_TOKEN} -X POST -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/${GITHUB_USER}/${GITHUB_REPO}/actions/runners/registration-token | jq -r '.token')
/usr/local/sbin/actions-runner/config.sh --url https://github.com/cverna/fcos-actions-runner --token ${REGISTRATION_TOKEN} --labels fcos --unattended
```

The script above uses a few environment variables that contain a GitHub username and a [Personal Access Token][9] used to authenticate the REST API requests. The Personal Access Token requires the repo permissions in order to successfully retrieve the runner registration and removal tokens. The token is security sensitive so it is better to store it in a different file with stricter permissions. In this example that file is _actions-runner_.

```
GITHUB_USER=<user>
GITHUB_REPO=<repo>
GITHUB_TOKEN=<personal_access_token>
```

Following is the Butane snippet that creates these two files – _manage-runner.sh_ and _actions-runner_.

```
- path: /usr/local/sbin/actions-runner/manage-runner.sh
      contents:
        local: manage-runner.sh
      mode: 0755
      user:
        name: core
      group:
        name: core
    - path: /etc/actions-runner
      contents:
        local: actions-runner
      mode: 0700
      user:
        name: core
      group:
        name: core
```

### Running Actions on Fedora CoreOS

Finally, create the systemd services that will configure and start the runner. Define the services in the Butane configuration file.

```
systemd:
  units:
    - name: github-runner-configure.service
      enabled: true
      contents: |
        [Unit]
        Description=Configure the github action runner for a repository
        After=network-online.target boot-complete.target
        Requires=boot-complete.target
        [Service]
        EnvironmentFile=/etc/actions-runner
        Type=oneshot
        RemainAfterExit=yes
        User=core
        WorkingDirectory=/usr/local/sbin/actions-runner
        ExecStartPre=tar xvf actions-runner-linux.tar.gz --no-same-owner
        ExecStart=/usr/local/sbin/actions-runner/manage-runner.sh
        [Install]
        WantedBy=multi-user.target
    - name: github-runner.service
      enabled: true
      contents: |
        [Unit]
        Description=Run the github action runner
        After=github-runner-configure.service
        [Service]
        WorkingDirectory=/usr/local/sbin/actions-runner
        User=core
        ExecStart=/usr/local/sbin/actions-runner/run.sh
        [Install]
        WantedBy=multi-user.target
```

This creates two services, _github-runner-configure.service_ (running once when the host has finished booting) and _github-runner.service_ (running the Actions runner binaries and waiting for new CI/CD jobs).

Now that the Butane configuration is complete, generate an Ignition file out of it and provision a Fedora CoreOS Actions runner.

```
$ podman run -i --rm -v $PWD:/code:z --workdir /code quay.io/coreos/butane:release --pretty --strict --files-dir /code config.yaml -o config.ignition
```

Once the Ignition file is generated, it can be used to provision a runner on the platforms where Fedora CoreOS is [available][10].

> [Getting started with Fedora CoreOS][11]

### Configure an Action to use a self-hosted runner

The following test Action workflow will test the FCOS self-hosted worker. Create the following file in your git repository _.github/workflows/main.yml_

```
# This is a basic workflow to help you get started with Actions

name: CI

# Controls when the action will run.
on:
  # Triggers the workflow on push or pull request events but only for the main branch
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

  # Allows you to run this workflow manually from the Actions tab
  workflow_dispatch:

# A workflow run is made up of one or more jobs that can run sequentially or in parallel
jobs:
  # This workflow contains a single job called "build"
  build:
    # The type of runner that the job will run on
    runs-on: fcos

    # Steps represent a sequence of tasks that will be executed as part of the job
    steps:
      # Runs a single command using the runners shell
      - name: Run a one-line script
        run: podman run --rm fedora-minimal:34 echo Hello World !
```

Note that the _runs-on_ configuration is set up to use a runner with the label _fcos_.

The code presented in this article is available [here][12].

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/run-github-actions-on-fedora-coreos/

作者：[Clément Verna][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/cverna/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/07/modern-times-816x345.jpg
[2]: https://commons.wikimedia.org/wiki/File:Chaplin_-_Modern_Times.jpg
[3]: https://docs.github.com/en/actions
[4]: https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners
[5]: https://docs.github.com/en/actions/hosting-your-own-runners
[6]: https://github.com/coreos/ignition
[7]: https://github.com/coreos/butane
[8]: https://github.com/actions/runner
[9]: https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token
[10]: https://docs.fedoraproject.org/en-US/fedora-coreos/bare-metal/
[11]: https://fedoramagazine.org/getting-started-with-fedora-coreos/
[12]: https://github.com/cverna/fcos-actions-runner

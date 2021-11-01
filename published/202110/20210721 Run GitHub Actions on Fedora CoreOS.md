[#]: subject: (Run GitHub Actions on Fedora CoreOS)
[#]: via: (https://fedoramagazine.org/run-github-actions-on-fedora-coreos/)
[#]: author: (Clément Verna https://fedoramagazine.org/author/cverna/)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13846-1.html)

在 Fedora CoreOS 上运行 GitHub Actions
======

![][1]

[GitHub Actions][3] 是一项为快速建立持续集成和交付（CI/CD）工作流程而提供的服务。这些工作流程在被称为“<ruby>运行器<rt>runner</rt></ruby>”的主机上运行。GitHub 提供的 [托管运行器][4] 的操作系统的选择是有限的（Windows Server、Ubuntu、MacOS）。

另一个选择是使用 [自托管][5] 的运行器，这让仓库管理员对运行器有更多控制。自托管的运行程序是专门为某个存储库或组织服务的。下面的文章介绍了使用 Fedora CoreOS 配置自托管运行程序的步骤。

### 入门

Fedora CoreOS 是一个精简的操作系统，旨在便于大规模的部署和维护。该操作系统会自动更新，并默认提供运行容器所需的工具。由于这些原因，Fedora CoreOS 是运行 CI/CD 工作流程的一个极佳选择。

配置和配备 Fedora CoreOS 机器的第一步是生成一个 [Ignition][6] 文件。[Butane][7] 允许你使用更友好的格式（YAML）生成 Ignition 文件。

#### 配置一个 Fedora CoreOS 运行器

要在 Fedora CoreOS 上执行 GitHub Actions，托管主机需要用于注册和运行该运行器的二进制文件和脚本。从 [Actions 运行器项目][8] 下载二进制文件和脚本，并部署在 `/usr/local/sbin/actions-runner` 下。

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

#### 注册和删除令牌

为一个项目配置运行器需要一个“<ruby>令牌<rt>token</rt></ruby>”。这可以防止在没有正确权限的情况下从项目中注册或删除自托管的运行器。GitHub 提供的令牌有一个小时的过期时间。如果运行器在这个时间之后重新启动，它将需要一个新的注册令牌。

该令牌可能出问题，特别是在 Fedora CoreOS 自动更新时。更新过程希望托管主机在收到新数据后至少每隔几周重启一次。

幸运的是，可以使用 GitHub REST API 来获取这些令牌，并在托管主机每次重启时自动配置运行器。下面的 `manage-runner.sh` 脚本使用 API 来获取令牌，删除任何已经配置好的运行器，并用新的令牌注册运行器。

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

上面的脚本使用了一些环境变量，包含 GitHub 用户名和用于验证 REST API 请求的 <ruby>[个人访问令牌][9]<rt>Personal Access Token</rt></ruby>。个人访问令牌需要存储库权限，以便成功检索运行器的注册和移除令牌。该令牌是安全敏感信息，所以最好将其存储在一个具有更严格权限的不同文件中。在这个例子中，这个文件是 `actions-runner`。

```
GITHUB_USER=<user>
GITHUB_REPO=<repo>
GITHUB_TOKEN=<personal_access_token>
```

以下是创建这两个文件 `manage-runner.sh` 和 `actions-runner` 的 Butane 片段。

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

### 在 Fedora CoreOS 上运行 Actions

最后，创建用于配置和启动运行器的 systemd 服务。在 Butane 配置文件中定义这些服务。

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

这将创建两个服务：`github-runner-configure.service`（在主机启动完成后运行一次）和 `github-runner.service`（运行 Actions 运行器二进制文件并等待新的 CI/CD 作业）。

现在 Butane 配置已经完成，从中生成一个 Ignition 文件并配备一个 Fedora CoreOS Actions 运行器。

```
$ podman run -i --rm -v $PWD:/code:z --workdir /code quay.io/coreos/butane:release --pretty --strict --files-dir /code config.yaml -o config.ignition
```

一旦 Ignition 文件生成，它就可以用来在 [支持][10] Fedora CoreOS 的平台上配备一个运行器。

### 配置一个 Action 来使用一个自托管的运行器

下面的测试 Action 工作流程将测试 FCOS 的自托管的运行器。在你的 git 存储库中创建以下文件 `.github/workflows/main.yml`。

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

请注意，`runs-on` 的配置被设置为使用标签为 `fcos` 的运行器。

本文介绍的代码可以在 [这里][12] 中找到。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/run-github-actions-on-fedora-coreos/

作者：[Clément Verna][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

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

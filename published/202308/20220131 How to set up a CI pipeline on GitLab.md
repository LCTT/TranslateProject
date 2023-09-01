[#]: subject: "How to set up a CI pipeline on GitLab"
[#]: via: "https://opensource.com/article/22/2/setup-ci-pipeline-gitlab"
[#]: author: "Stephan Avenwedde https://opensource.com/users/hansic99"
[#]: collector: "lujun9972"
[#]: translator: "toknow-gh"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16105-1.html"

在 GitLab 上构建 CI 流水线
======

> <ruby>连续集成<rt>continuous integration</rt></ruby>（CI）是指代码变更会被自动构建和测试。以下是我为自己的 C++ 项目构建 CI 流水线的过程。 

![][0]

本文介绍如何在 [GitLab][2] 上配置 CI 流水线。我在前面的文章中介绍了 [基于 CMake 和 VSCodium 的构建系统][3] 和 [基于 GoogleTest 和 CTest 的单元测试][4]。本文将在此基础上进一步配置 CI 流水线。我会先演示如何布设和运行 CI 流水线，然后再介绍如何配置它。

CI 是指提交到代码仓库的代码变更会被自动构建和测试。在开源领域，GitLab 是一个流行的 CI 流水线平台。除了作为中心 Git 仓库外，GitLab 还提供 CI/CD 流水线、<ruby>问题跟踪<rt>issue tracking</rt></ruby> 和 <ruby>容器注册表<rt>container registry</rt></ruby>功能。

### 相关术语

在进入正题之前，我先介绍在本文和 [GitLab 文档][5] 中会遇到的常见术语。

  * <ruby>持续交付<rt>continuous delivery</rt></ruby>（CD）：自动化供应软件，以供随时交付
  * <ruby>持续部署<rt>continuous deployment</rt></ruby>（CD）：自动化软件发布
  * <ruby>流水线<rt>pipeline</rt></ruby>: CI/CD 的直接构件，它由阶段和作业构成
  * <ruby>阶段<rt>stage</rt></ruby>：一组作业
  * <ruby>作业<rt>job</rt></ruby>：某项需要执行的具体任务，比如编译、单元测试等
  * <ruby>执行器<rt>runner</rt></ruby>：实际执行作业的服务

### 布设 CI 流水线

在下面的章节中，我将复用以前的 [示例工程][6]。点击 GitLab 仓库页面右上角的 <ruby>复刻<rt>Fork</rt></ruby> 按钮复刻代码仓库。

![Fork the project][7]

#### 设置执行器

为了让你对整个流程有所了解，我们先从在本地安装执行器讲起。

参照执行器服务 [安装指南][8] 安装好服务，然后注册执行器。

1、选择 GitLab 项目页面左侧的 <ruby>设置<rt>Settings</rt></ruby>，再选择 **CI/CD**。

![Select CI/CD in Settings][9]

2、展开 <ruby>执行器<rt>Runners</rt></ruby> 区域，关闭 <ruby>共享的执行器<rt>Shared runners</rt></ruby> 选项（黄框处）。特别注意令牌和 URL（绿框处），下一步会用到它们。

![Configure runner][10]

3、在终端中运行 `gitlab-runner register`，根据提示输入以下注册信息：

  * GitLab 实例: <https://gitlab.com/> （如上图）
  * 注册令牌：从执行器区域中获取 （如上图）
  * 描述：按需自由填写
  * 标签：可以不填
  * 执行环境：选 **Shell** 

如果有需要，你可以在 `~/.gitlab-runner/config.toml` 中修改这些配置。

4、用命令 `gitlab-runner run` 启动执行器。你可以在 GitLab 的项目设置界面执行器区域看到执行器的状态：

![Available specific runners][11]

### 运行流水线

前面已经提过，流水线就是一组由执行器执行的作业。每个推送到 GitLab 的提交都会生成一个附加到该提交的流水线。如果多个提交被一起推送，那么只会为最后一个提交生成流水线。为了演示，我直接在 GitLab 在线编辑器中提交和推送修改。

打开 `README.md` 文件，添加一行数据：

![Web editor][12]

现在提交修改。

这里注意默认的行为是为提交新建一个分支，为了简便起见，我们择提交到主分支。

![Commit changes][13]

提交后一会儿后，你就应该改能看到 GitLab 执行器执行的控制台中有输出消息：

```
Checking for jobs... received job=1975932998 repo_url=<https://gitlab.com/hANSIc99/cpp\_testing\_sample.git> runner=Z7MyQsA6

Job succeeded duration_s=3.866619798 job=1975932998 project=32818130 runner=Z7MyQsA6
```

在 GitLab 项目概览界面左侧选择 CI/CD --> <ruby>管道<rt>Pipelines</rt></ruby>，查看最近执行的流水线：

![Pipeline overview][14]

选中流水线可以在详情界面看到哪些作业失败了，并能查看各个作业的输出。

当遇到非零返回值是就认为作业执行失败了。在下面的例子中我通过调用 `exit 1` 强制让作业执行失败：

![Job overview][15]

### CI 配置

阶段、流水线和作业的配置都在仓库根目录的 [.gitlab-ci.yml][16] 文件中。我建议使用 GitLab 内置的流水线编辑器，它会自动对配置进行检查。

```
stages:
- build
- test

build:
  stage: build
  script:
    - cmake -B build -S .
    - cmake --build build --target Producer
  artifacts:
    paths:
      - build/Producer

RunGTest:
  stage: test
  script:
    - cmake -B build -S .
    - cmake --build build --target GeneratorTest
    - build/Generator/GeneratorTest

RunCTest:
  stage: test
  script:
    - cmake -B build -S .
    - cd build
    - ctest --output-on-failure -j6
```

文件中定义了两个阶段：`build` 和 `test`，以及三个作业：`build`、`RunGTest` 和 `RunCTest`。其中作业 `build` 属于一个同名的阶段，另外两个作业属于阶段 `test`。

`script` 小节下的命令就是一般的 Shell 命令。你可以认为是将它们逐行输入到 Shell 中。

我要特别提及 <ruby>产物</rt>artifact</rt></ruby> 这个特性。在示例中我定义了二进制的 `Producer` 为作业 `build` 的产物。产物会被上传到 GitLab 服务器，并且可以从服务器的这个页面上被下载：

![Pipeline artifacts][17]

默认情况下，后续阶段的作业会自动下载先前阶段作业生成的所有产物。

你可以在 [docs.gitlab.com][18] 上查看 `gitlab-ci.yml` 参考指南。

### 总结

上面只是一个最基本的例子，让你对持续集成的一般原则有一个了解。再演示中我禁用了共享执行器，然而这才是 GitLab 的优势所在。你可以在一个干净的容器化的环境中构架、测试和部署程序。除了使用 GitLab 提供的免费执行器，你也可以用自己的容器作为执行器。当然还有更高阶的用法：用 Kubernetes 来协调调度执行者容器，让流水线适应大规模使用的使用场景。如需进一步了解，可以查看 [about.gitlab.com][19]。

如果你使用的是 Fedora，需要注意的一点是目前 GitLab 执行者还不支持用 Podman 作为容器引擎。（LCTT 译注：Podman 是 Fedora 自带的容器引擎。）根据 <ruby>议题<rt>issue</rt></ruby> [#27119][20]，对 Podman 支持已将列上日程。（LCTT 译注：Podman 4.2 及以上版本增加了对于 GitLab 执行器的支持。）

把重复性的操作描述成作业，并将作业合并成流水线和阶段，可以让你跟踪它们的质量而不增加额外工作。。特别是在大型社区项目中，适当配置的 CI 可以告诉你提交的代码是否对项目有改善，为你接受或拒绝合并请求提供依据。

*（题图：MJ/fb711c48-251a-4726-a41c-247370e5df25）*

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/setup-ci-pipeline-gitlab

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[toknow-gh](https://github.com/toknow-gh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hansic99
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/plumbing_pipes_tutorial_how_behind_scenes.png?itok=F2Z8OJV1 (Plumbing tubes in many directions)
[2]: https://gitlab.com/
[3]: https://linux.cn/article-14249-1.html
[4]: https://linux.cn/article-16055-1.html
[5]: https://docs.gitlab.com/
[6]: https://gitlab.com/hANSIc99/cpp_testing_sample
[7]: https://opensource.com/sites/default/files/cpp_ci_cd_gitlab_fork.png (Fork the project)
[8]: https://docs.gitlab.com/runner/install/
[9]: https://opensource.com/sites/default/files/cpp_ci_cd_gitlab_project_settings.png (Select CI/CD in Settings)
[10]: https://opensource.com/sites/default/files/cpp_ci_cd_gitlab_settings_runners2.png (Configure runner)
[11]: https://opensource.com/sites/default/files/cpp_ci_cd_gitlab_settings_active_runner.png (Available specific runners)
[12]: https://opensource.com/sites/default/files/cpp_ci_cd_gitlab_web_editor.png (Web editor)
[13]: https://opensource.com/sites/default/files/cpp_ci_cd_gitlab_commit_changes2.png (Commit changes)
[14]: https://opensource.com/sites/default/files/cpp_ci_cd_gitlab_pipeline_overview2.png (Pipeline overview)
[15]: https://opensource.com/sites/default/files/cpp_ci_cd_gitlab_job_overview.png (Job overview)
[16]: https://gitlab.com/hANSIc99/cpp_testing_sample/-/blob/main/.gitlab-ci.yml
[17]: https://opensource.com/sites/default/files/cpp_ci_cd_gitlab_pipeline_artifacts.png (Pipeline artifacts)
[18]: https://docs.gitlab.com/ee/ci/yaml/
[19]: https://about.gitlab.com/solutions/kubernetes/
[20]: https://gitlab.com/gitlab-org/gitlab-runner/-/issues/27119
[0]: https://img.linux.net.cn/data/attachment/album/202308/18/094419rahz9i5pk3n9fkkf.jpg
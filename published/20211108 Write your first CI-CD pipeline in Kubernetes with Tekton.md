[#]: subject: "Write your first CI/CD pipeline in Kubernetes with Tekton"
[#]: via: "https://opensource.com/article/21/11/cicd-pipeline-kubernetes-tekton"
[#]: author: "Savita Ashture https://opensource.com/users/savita-ashture"
[#]: collector: "lujun9972"
[#]: translator: "lxbwolf"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15681-1.html"

用 Tekton 在 Kubernetes 中编写你的第一条 CI/CD 流水线
======

> Tekton 是一个用于创建持续集成和持续交付（CI/CD）系统的 Kubernetes 原生开源框架。

![][0]

Tekton 是一个用于创建持续集成和持续交付（CI/CD）系统的 Kubernetes 原生开源框架。通过对底层实施细节的抽象，它还可以帮助你在多个云供应商或企业内部系统中进行端到端（构建、测试、部署）应用开发。

### Tekton 介绍

[Tekton][2] 最初被称为 [Knative Build][3]，后来被重组为独立的开源项目，有自己的 [治理组织][4]，现在是属于 [Linux 基金会][5] 的项目。Tekton 提供了一个集群内的容器镜像构建和部署工作流程，换句话说，它是一个 <ruby>持续集成<rt>continuous integration</rt></ruby>（CI）和 <ruby>持续交付<rt>continuous delivery</rt></ruby>（CD）服务。它由 Tekton 流水线和几个支持组件如 Tekton CLI、Triggers 和 Catalog 等组成。

Tekton 是一个 Kubernetes 原生应用。它在 Kubernetes 集群中作为扩展被安装和运行，由一套Kubernetes 定制化资源组成，定义了你为流水线创建和复用的构建块。由于 Tekton 是一种 Kubernetes 原生技术，所以它非常容易扩展。当你需要增加你的工作负载时，你只需向你的集群添加节点就可以了。由于其可扩展的设计和社区贡献的组件库，它也很容易定制。

对于需要 CI/CD 系统来开展工作的开发人员，和为其组织内的开发人员建立 CI/CD 系统的平台工程师，Tekton 是理想选择。

### Tekton 组件

构建 CI/CD 流水线的过程非常复杂，因此 Tekton 为每一步都提供工具。以下是 Tekton 提供的主要组件：

  * <ruby>流水线<rt></rt>Pipeline</rt></ruby>： 定义了一组 Kubernetes [自定义资源][6]，作为你用来组装 CI/CD 流水线的构建块。
  * <ruby>触发器<rt>Triggers</rt></ruby>：一种 Kubernetes 自定义资源，允许你根据从事件有效载荷中提取的信息来创建流水线。例如，你可以在每次创建 Git 仓库的合并请求时，触发流水线的实例化和执行。
  * <ruby>命令行<rt>CLI</rt></ruby>：提供一个名为 `tkn` 的命令行界面，你可以使用它从终端与 Tekton 进行交互。
  * <ruby>仪表盘<rt>Dashboard</rt></ruby>：是 Tekton 流水线的一个基于网页的图形界面，显示流水线的执行信息。
  * <ruby>目录<rt>Catalog</rt></ruby>：是一个高质量的、由社区贡献的 Tekton 构建块（任务、流水线等），可在你自己的流水线中使用。
  * <ruby>中心<rt>Hub</rt></ruby>：是一个基于网页的图形界面，用于访问 Tekton 目录。
  * <ruby>操作员<rt>Operator</rt></ruby>：是一种 Kubernetes [操作员模式][7]，你可以在 Kubernetes 集群中安装、更新、升级和删除 Tekton 项目。
  * <ruby>链<rt>Chains</rt></ruby>：是一个 Kubernetes <ruby>自定义资源定义<rt>Custom Resource Definition</rt></ruby>（CRD）控制器，使你可以在 Tekton 中处理供应链安全的问题。正在开发中。
  * <ruby>结果<rt>Results</rt></ruby>：旨在帮助用户对 CI/CD 工作负载历史进行逻辑分组，并将长期结果的存储从流水线控制器中分离出来。

### Tekton 术语

![Tekton terminology][8]

  * <ruby>步骤<rt>Step</rt></ruby>：是 CI/CD 工作流程中最基本的实体，例如为 Python 网络应用程序运行一些单元测试或编译一个 Java 程序。Tekton 使用容器镜像执行每个步骤。
  * <ruby>任务<rt>Task</rt></ruby>：:** 是按特定顺序排列的步骤的集合。Tekton 以 [Kubernetes 容器荚][10] 的形式运行任务，其中每个步骤都成为 <ruby>容器荚<rt>pod</rt></ruby> 中的一个运行容器。
* <ruby>流水线<rt>Pipelines</rt></ruby>：是按特定顺序排列的任务的集合。Tekton 把所有任务连接成一个 <ruby>有向无环图<rt>directed acyclic graph</rt></ruby>（DAG），并按顺序执行图。换句话说，它创建了一些 Kubernetes 容器荚，并确保每个容器荚按预期成功运行。

![Tekton pipelines][11]

  * <ruby>流水线运行<rt>PipelineRun</rt></ruby>：顾名思义，是一条流水线的具体执行。
  * <ruby>任务运行<rt>TaskRun</rt></ruby>：是一个任务的具体执行。你可以选择在流水线外运行一次任务运行，可以通过它查看任务中每个步骤执行的具体情况。

### 创建你的 CI/CD 流水线

开始使用 Tekton 的最简单方法是自己编写一个简单的流水线。如果你每天都在使用 Kubernetes，那你可能对 YAML 很熟悉，这正是 Tekton 流水线的定义方式。下面是一个克隆代码库的简单流水线的例子。

首先，创建一个 `task.yaml` 文件，用你喜欢的文本编辑器打开它。这个文件定义了你要执行的 <ruby>步骤<rt>Step</rt></ruby>。在这个例子中，就是克隆一个仓库，所以我把这个步骤命名为 “clone”。该文件设置了一些环境变量，然后使用一个简单的 shell 脚本来执行克隆。

接下来是 <ruby>任务<rt>Task</rt></ruby>。你可以把步骤看作是一个被任务调用的函数，而任务则设置步骤所需的参数和工作空间。

```
apiVersion: tekton.dev/v1beta1
kind: Task
metadata:
 name: git-clone
spec:
 workspaces:
   - name: output
     description: The git repo will be cloned onto the volume backing this Workspace.
 params:
   - name: url
     description: Repository URL to clone from.
     type: string
   - name: revision
     description: Revision to checkout. (branch, tag, sha, ref, etc...)
     type: string
     default: ""
 steps:
   - name: clone
     image: "gcr.io/tekton-releases/github.com/tektoncd/pipeline/cmd/git-init:v0.21.0"
     env:
       - name: PARAM_URL
         value: $(params.url)
       - name: PARAM_REVISION
         value: $(params.revision)
       - name: WORKSPACE_OUTPUT_PATH
         value: $(workspaces.output.path)
     script: |
      #!/usr/bin/env sh
       set -eu

       CHECKOUT_DIR="${WORKSPACE_OUTPUT_PATH}"

       /ko-app/git-init \
         -url="${PARAM_URL}" \
         -revision="${PARAM_REVISION}" \
         -path="${CHECKOUT_DIR}"
       cd "${CHECKOUT_DIR}"
       EXIT_CODE="$?"
       if [ "${EXIT_CODE}" != 0 ] ; then
         exit "${EXIT_CODE}"
       fi
       # Verify clone is success by reading readme file.
       cat ${CHECKOUT_DIR}/README.md

```

创建第二个文件 `pipeline.yaml`，并用你喜欢的文本编辑器打开它。这个文件通过设置诸如可以运行和处理任务的工作区等重要参数来定义流水线。

```
apiVersion: tekton.dev/v1beta1
kind: Pipeline
metadata:
 name: cat-branch-readme
spec:
 params:
   - name: repo-url
     type: string
     description: The git repository URL to clone from.
   - name: branch-name
     type: string
     description: The git branch to clone.
 workspaces:
   - name: shared-data
     description: |
      This workspace will receive the cloned git repo and be passed
       to the next Task for the repo's README.md file to be read.
 tasks:
   - name: fetch-repo
     taskRef:
       name: git-clone
     workspaces:
       - name: output
         workspace: shared-data
     params:
       - name: url
         value: $(params.repo-url)
       - name: revision
         value: $(params.branch-name)

```

最后，创建一个 `pipelinerun.yaml` 文件，用喜欢的文本编辑器打开它。这个文件真正的运行流水线。它调用流水线中定义的参数（继而调用任务文件中定义的任务）。

```
apiVersion: tekton.dev/v1beta1
kind: PipelineRun
metadata:
 name: git-clone-checking-out-a-branch
spec:
 pipelineRef:
   name: cat-branch-readme
 workspaces:
   - name: shared-data
     volumeClaimTemplate:
       spec:
         accessModes:
          - ReadWriteOnce
         resources:
           requests:
             storage: 1Gi
 params:
   - name: repo-url
     value: <https://github.com/tektoncd/pipeline.git>
   - name: branch-name
     value: release-v0.12.x

```

把不同工作分在不同的文件中的好处是，`git-clone` 任务可以在多条流水线中复用。

例如，假设你想为一个流水线项目做端到端的测试。你可以使用 `git-clone` 任务 **来让每一次测试都基于最新的代码**。

### 总结

只要你熟悉 Kubernetes，那 Tekton 对你来说就像其他 Kubernetes 原生应用一样简单。它有很多工具可以帮助你创建流水线并与之交互。如果你喜欢自动化，不妨试试 Tekton!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/cicd-pipeline-kubernetes-tekton

作者：[Savita Ashture][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/savita-ashture
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/plumbing_pipes_tutorial_how_behind_scenes.png?itok=F2Z8OJV1 (Plumbing tubes in many directions)
[2]: https://github.com/tektoncd/pipeline
[3]: https://github.com/knative/build
[4]: https://cd.foundation/
[5]: https://www.linuxfoundation.org/projects/
[6]: https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/
[7]: https://operatorhub.io/what-is-an-operator
[8]: https://opensource.com/sites/default/files/uploads/tekto-terminology.png (Tekton terminology)
[9]: https://tekton.dev/docs/concepts/concept-tasks-pipelines.png
[10]: https://kubebyexample.com/en/concept/pods
[11]: https://opensource.com/sites/default/files/uploads/tekton-pipelines.png (Tekton pipelines)
[12]: https://tekton.dev/docs/concepts/concept-runs.png
[0]: https://img.linux.net.cn/data/attachment/album/202304/01/180822blxgx0c1k43n4kl4.jpg
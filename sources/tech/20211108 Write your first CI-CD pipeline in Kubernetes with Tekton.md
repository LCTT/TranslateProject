[#]: subject: "Write your first CI/CD pipeline in Kubernetes with Tekton"
[#]: via: "https://opensource.com/article/21/11/cicd-pipeline-kubernetes-tekton"
[#]: author: "Savita Ashture https://opensource.com/users/savita-ashture"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Write your first CI/CD pipeline in Kubernetes with Tekton
======
Tekton is a Kubernetes-native open source framework for creating
continuous integration and continuous delivery (CI/CD) systems.
![Plumbing tubes in many directions][1]

Tekton is a Kubernetes-native open source framework for creating continuous integration and continuous delivery (CI/CD) systems. It also helps to do end-to-end (build, test, deploy) application development across multiple cloud providers or on-premises systems by abstracting away the underlying implementation details.

### Introduction to Tekton

[Tekton][2], known initially as [Knative Build][3], later got restructured as its own open source project with its own [governance organization][4] and is now a [Linux Foundation][5] project. Tekton provides an in-cluster container image build and deployment workflow—in other words, it is a continuous integration (CI) and continuous delivery (CD) service. It consists of Tekton Pipelines and several supporting components, such as Tekton CLI, Triggers, and Catalog.

Tekton is a Kubernetes native application. It installs and runs as an extension on a Kubernetes cluster and comprises a set of Kubernetes Custom Resources that define the building blocks you can create and reuse for your pipelines. Because it's a K-native technology, Tekton is remarkably easy to scale. When you need to increase your workload, you can just add nodes to your cluster. It's also easy to customize because of its extensible design and thanks to a community repository of contributed components.

Tekton is ideal for developers who need CI/CD systems to do their work and platform engineers who build CI/CD systems for developers in their organization.

### Tekton components

Building CI/CD pipelines is a far-reaching endeavor, so Tekton provides tools for every step of the way. Here are the major components you get with Tekton:

  * **Pipeline: **Pipeline defines a set of Kubernetes [Custom Resources][6] that act as building blocks you use to assemble your CI/CD pipelines.
  * **Triggers: **Triggers is a Kubernetes Custom Resource that allows you to create pipelines based on information extracted from event payloads. For example, you can trigger the instantiation and execution of a pipeline every time a merge request gets opened against a Git repository.
  * **CLI:** CLI provides a command-line interface called `tkn` that allows you to interact with Tekton from your terminal.
  * **Dashboard:** Dashboard is a web-based graphical interface for Tekton pipelines that displays information about the execution of your pipelines.
  * **Catalog:** Catalog is a repository of high-quality, community-contributed Tekton building blocks (tasks, pipelines, and so on) ready for use in your own pipelines.
  * **Hub:** Hub is a web-based graphical interface for accessing the Tekton catalog.
  * **Operator:** Operator is a Kubernetes [Operator pattern][7] that allows you to install, update, upgrade, and remove Tekton projects on a Kubernetes cluster.
  * **Chains: **Chains is a Kubernetes Custom Resource Definition (CRD) controller that allows you to manage your supply chain security in Tekton. It is currently a work-in-progress.
  * **Results: **Results aims to help users logically group CI/CD workload history and separate out long-term result storage away from the pipeline controller.



### Tekton terminology

![Tekton terminology][8]

(Source: [Tekton documentation][9])

  * **Step:** A step is the most basic entity in a CI/CD workflow, such as running some unit tests for a Python web app or compiling a Java program. Tekton performs each step with a provided container image.

  * **Task:** A task is a collection of steps in a specific order. Tekton runs a task in the form of a [Kubernetes pod][10], where each step becomes a running container in the pod.

  * **Pipelines:** A pipeline is a collection of tasks in a specific order. Tekton collects all tasks, connects them in a directed acyclic graph (DAG), and executes the graph in sequence. In other words, it creates a number of Kubernetes pods and ensures that each pod completes running successfully as desired.

![Tekton pipelines][11]

(Source: [Tekton documentation][12])

  * **PipelineRun: **A PipelineRun, as its name implies, is a specific execution of a pipeline.

  * **TaskRun:** A TaskRun is a specific execution of a task. TaskRuns are also available when you choose to run a task outside a pipeline, with which you may view the specifics of each step execution in a task.




### Create your own CI/CD pipeline

The easiest way to get started with Tekton is to write a simple pipeline of your own. If you use Kubernetes every day, you're probably comfortable with YAML, which is precisely how Tekton pipelines are defined. Here's an example of a simple pipeline that clones a code repository.

First, create a file called `task.yam`**l** and open it in your favorite text editor. This file defines the steps you want to perform. In this example, that's cloning a repository, so I've named the step clone. The file sets some environment variables and then provides a simple shell script to perform the clone.

Next comes the task. You can think of a step as a function that gets called by the task, and the task sets parameters and workspaces required for steps.


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

Create a second file called `pipeline.yaml`, and open it in your favorite text editor. This file defines the pipeline by setting important parameters, such as a workspace where the task can be run and processed.


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

Finally, create a file called `pipelinerun.yaml` and open it in your favorite text editor. This file actually runs the pipeline. It invokes parameters defined in the pipeline (which, in turn, invokes the task defined by the task file.)


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

The advantage of structuring your work in separate files is that the `git-clone` task is reusable for multiple pipelines.

For example, suppose you want to do end-to-end testing for a pipeline project. You can use the `git-clone`** **task to ensure that you have a fresh copy of the code you need to test.

### Wrap up

As long as you're familiar with Kubernetes, getting started with Tekton is as easy as adopting any other K-native application. It has plenty of tools to help you create pipelines and to interface with your pipelines. If you love automation, try Tekton!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/cicd-pipeline-kubernetes-tekton

作者：[Savita Ashture][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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

[#]: subject: (13 open source tools for developers)
[#]: via: (https://opensource.com/article/21/6/open-source-developer-tools)
[#]: author: (Nimisha Mukherjee https://opensource.com/users/nimisha)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

13 open source tools for developers
======
Choose tools that provide maximum flexibility in software integration
and delivery.
![Tools in a cloud][1]

Modern developers are highly technical, opinionated, passionate, community-focused, driven, polyglot, and most importantly, empowered decision-makers. Today, developers have a say in the products being built and the tools and technologies used to build them. Most importantly, time is precious, and developers and project managers can always benefit from great efficiency. To attain great efficiency, though, you must understand the software lifecycle, and how it can be organized and manipulated.

The industry is still working on perfecting how a developer's time is spent. We can divide a developer's major tasks into two different "loops":

  * **Inner loop:** These are the most common tasks developers do, the ones that fully utilize their skillsets: code, run, validate, and debug. This is the classical developer loop.



![Inner loop developer tasks][2]

(Nimisha Mukherjee, [CC BY-SA 4.0][3])

  * **Outer loop:** This is where a developer's code goes through continuous integration and continuous delivery (CI/CD) and gets deployed to production. On Gitlab and similar platforms, a developer's pull request (PR) gets merged to the main branch, CI/CD kicks in and creates the build, runs the necessary tests, and deploys to the specified environments. This is a DevOps loop.



![Outer loop developer tasks][4]

(Nimisha Mukherjee, [CC BY-SA 4.0][3])

Developers should spend most of their effort on inner-loop tasks, driving innovation, and minimal time on the outer loop.

Understanding the differences between the inner and outer loops can help identify the developer tools that work best for each part of the software lifecycle.

### Open source inner-loop tools

Here are some of my favorite open source tools for the _code, run, validate, and debug_ cycle.

#### Code

  * [Eclipse Che][5] makes Kubernetes development accessible for developer teams. Che provides an in-browser integrated development environment (IDE), allowing developers to code, build, test, and run applications from any machine exactly as they run in production.
  * [Visual Studio Code][6] (VS Code) and [VSCodium][7] are open source code editors with support for debugging, syntax highlighting, intelligent code completion, snippets, code refactoring, and embedded Git.



#### Run

  * [OpenShift Do][8] (odo) is a command-line interface for developers that supports fast, iterative development, allowing them to focus on what's most important to them: code.
  * [Minishift][9] helps developers run [OKD][10] (the community distribution of Kubernetes) locally by launching a single-node OKD cluster inside a virtual machine. Minishift allows trying out OKD or developing with it, day-to-day, on a local machine.
  * Eclipse Che



#### Validate

  * Eclipse Che
  * Odo
  * [VS Code Dependency Analytics][11] is an open source vulnerability database.



#### Deploy

  * Eclipse Che
  * Odo



### Learn more

There are many workflows to implement a good coding cycle. To get an idea of how developers are using these tools, read Daniel Oh's article about how he uses [Quark for serverless application development][12] and Bryan Son's article about [how his team uses Eclipse Che][13].

### Open source outer-loop tools

There are great open source tools that make it easier to send code through CI/CD and deploy it to production.

#### CI/CD

  * [Tekton][14] is an open source framework for creating CI/CD systems, allowing developers to build, test, and deploy.
  * [Jenkins][15] is a free and open source automation server. It helps automate the parts of software development related to building, testing, and deploying to facilitate CI/CD.



#### Build

  * [Shipwright][16] is an extensible framework for building container images on Kubernetes.
  * [Eclipse JKube][17] is a collection of plugins and libraries used to build container images using Docker, Jib, or OpenShift Source-to-Image (S2I) build strategies.



#### Run

  * [CodeReady Containers][18] (CRC) manages a local OpenShift 4.x cluster optimized for testing and development purposes.



#### Monitor

  * [Prometheus][19] provides event monitoring and alerting.



#### Deploy

  * Tekton
  * Jenkins
  * [Helm][20] is a package manager for Kubernetes.
  * [Argo CD][21] is a declarative, GitOps continuous delivery tool for Kubernetes. It makes application deployment and lifecycle management automated, auditable, and easy to understand.



### Learn DevOps

If you're keen to implement a DevOps strategy, you can get started with Jess Cherry's article on how to [use Minishift and Jenkiins to setup your first pipeline][22].

### Make it easy

Today, developers choose the tools and technologies used in software integration and delivery. If you're a developer, then choose open source tools for maximum flexibility. If you're a project manager or architect, choose open source tools to help your developers succeed by working less and getting more done.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/open-source-developer-tools

作者：[Nimisha Mukherjee][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/nimisha
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cloud_tools_hardware.png?itok=PGjJenqT (Tools in a cloud)
[2]: https://opensource.com/sites/default/files/uploads/innerloop.png (Inner loop developer tasks)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://opensource.com/sites/default/files/uploads/outerloop.png (Outer loop developer tasks)
[5]: https://www.eclipse.org/che/
[6]: https://code.visualstudio.com/
[7]: https://opensource.com/article/20/6/open-source-alternatives-vs-code#vscodium
[8]: https://docs.openshift.com/container-platform/4.4/cli_reference/developer_cli_odo/understanding-odo.html
[9]: https://www.okd.io/minishift/
[10]: https://www.okd.io/
[11]: https://marketplace.visualstudio.com/items?itemName=redhat.fabric8-analytics
[12]: https://opensource.com/article/21/5/edge-quarkus-linux
[13]: https://opensource.com/article/19/10/cloud-ide-che
[14]: https://tekton.dev/
[15]: https://www.jenkins.io/
[16]: https://shipwright.io/
[17]: https://projects.eclipse.org/projects/ecd.jkube
[18]: https://github.com/code-ready/crc
[19]: https://prometheus.io/
[20]: https://helm.sh/
[21]: https://argoproj.github.io/argo-cd/
[22]: https://opensource.com/article/20/11/minishift-linux

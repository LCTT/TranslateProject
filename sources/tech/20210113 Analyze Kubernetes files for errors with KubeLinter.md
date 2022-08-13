[#]: subject: "Analyze Kubernetes files for errors with KubeLinter"
[#]: via: "https://opensource.com/article/21/1/kubelinter"
[#]: author: "Jessica Cherry https://opensource.com/users/cherrybomb"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Analyze Kubernetes files for errors with KubeLinter
======
Find and fix errors in your Helm charts and Kubernetes configuration files with KubeLinter.

![magnifying glass on computer screen, finding a bug in the code][1]

Image by: Opensource.com

[KubeLinter][2] is an open source project released by Stackrox to analyze Kubernetes YAML files for security issues and errant code. The tool covers Helm charts and Kubernetes configuration files, including [Knative][3] files. Using it can improve cloud-native development, reduce development time, and encourage DevOps best practices.

### Download and install

For this tutorial, I used Pop_OS! 20.10, Helm 3, Go 1.13.8, and Minikube with Kubernetes 1.19.

You have several options to install KubeLinter.

You can install manually from the Git repository:

```
$ git clone git@github.com:stackrox/kube-linter.git
$ cd kube-linter && make build
$ .gobin/kube-linter version
```

If you use [Homebrew][4], you can install it with the `brew` command:

```
$ brew install kube-linter
```

You can also install it with Go (as I did):

```
$ GO111MODULE=on go get golang.stackrox.io/kube-linter/cmd/kube-linter
go: finding golang.stackrox.io/kube-linter latest
go: downloading golang.stackrox.io/kube-linter v0.0.0-20201204022312-475075c74675
go: extracting golang.stackrox.io/kube-linter v0.0.0-20201204022312-475075c74675
[...]
```

After installing, you must make an alias in your `~/.bashrc` :

```
$ echo "alias kube-linter=$HOME/go/bin/kube-linter" >> ~/.bashrc
$ source ~/.bashrc
```

### Helm with KubeLinter

Now that the tool is installed, try it out on a Helm chart. First, start Minikube with a clean build and some small configuration changes:

```
$ minikube config set kubernetes-version v1.19.0
$ minikube config set memory 8000
❗  These changes will take effect upon a minikube delete and then a minikube start
$ minikube config set cpus 12
❗  These changes will take effect upon a minikube delete and then a minikube start
$ minikube delete
?  Deleting "minikube" in docker ...
?  Deleting container "minikube" ...
?  Removing /home/jess/.minikube/machines/minikube ...
?  Removed all traces of the "minikube" cluster.

$ minikube start
?  minikube v1.14.2 on Debian bullseye/sid
✨  Using the docker driver based on user configuration
?  Starting control plane node minikube in cluster minikube
?  minikube 1.15.1 is available! Download it: https://github.com/kubernetes/minikube/releases/tag/v1.15.1
?  To disable this notice, run: 'minikube config set WantUpdateNotification false'

?  Downloading Kubernetes v1.19.0 preload ...
```

Once everything is running, create an example Helm chart called `first_test` :

```
$ helm create first_test
Creating first_test
$ ls
first_test
```

Test KubeLinter against the new, unedited chart. Run the `kube-linter` command to see the available commands and flags:

```
$ kube-linter
Usage:
  /home/jess/go/bin/kube-linter [command]

Available Commands:
  checks      View more information on lint checks
  help    Help about any command
  lint    Lint Kubernetes YAML files and Helm charts
  templates   View more information on check templates
  version     Print version and exit

Flags:
  -h, --help   help for /home/jess/go/bin/kube-linter

Use "/home/jess/go/bin/kube-linter [command] --help" for more information about a command.
```

Then test what the basic `lint` command does to your example chart. You'll end up with many errors, so I'll grab a snippet of some issues:

```
$ kube-linter lint first_test/

first_test/first_test/templates/deployment.yaml: (object: <no namespace>/test-release-first_test apps/v1, Kind=Deployment) container "first_test" does not have a read-only root file system (check: no-read-only-root-fs, remediation: Set readOnlyRootFilesystem to true in your container's securityContext.)

first_test/first_test/templates/deployment.yaml: (object: <no namespace>/test-release-first_test apps/v1, Kind=Deployment) container "first_test" is not set to runAsNonRoot (check: run-as-non-root, remediation: Set runAsUser to a non-zero number, and runAsNonRoot to true, in your pod or container securityContext. See https://kubernetes.io/docs/tasks/configure-pod-container/security-context/ for more details.)
[...]
Error: found 12 lint errors
```

For the sake of brevity, I picked two security issues that are easy for me to fix. Over time, as you test more, you'll be able to fix any issues you find.

The `kube-linter` output provides hints about the required fixes. For instance, the first error ends with:

```
remediation: Set readOnlyRootFilesystem to true in your container's securityContext.
```

The next step is clear: Open the `values.yaml` file in a text editor (I use Vi, but you can use whatever you like) and locate the `securityContext` section:

```
securityContext: {}
  # capabilities:
  #   drop:
  #   - ALL
  # readOnlyRootFilesystem: true
  # runAsNonRoot: true
  # runAsUser: 1000
```

Uncomment the section and remove the braces:

```
securityContext: 
   capabilities:
     drop:
     - ALL
   readOnlyRootFilesystem: true
   runAsNonRoot: true
   runAsUser: 1000
```

Save the file and rerun the linter. Those errors no longer show up in the list, and the error count changes.

```
Error: found 10 lint errors
```

Congratulations! You have resolved security issues!

### Kubernetes with KubeLinter

This example uses an app file from my [previous article on Knative][5] to test against Kubernetes config files. I already have Knative up and running, so you may want to review that article if it's not running on your system.

I downloaded the Kourier service YAML file for this example:

```
$ ls
kourier.yaml   first_test
```

Start by running the linter against `kourier.yaml`. Again, there are several issues. I'll focus on resource problems:

```
$ kube-linter lint kourier.yaml 

kourier.yaml: (object: kourier-system/3scale-kourier-gateway apps/v1, Kind=Deployment) container "kourier-gateway" has cpu limit 0 (check: unset-cpu-requirements, remediation: Set your container's CPU requests and limits depending on its requirements. See https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#requests-and-limits for more details.)

kourier.yaml: (object: kourier-system/3scale-kourier-gateway apps/v1, Kind=Deployment) container "kourier-gateway" has memory request 0 (check: unset-memory-requirements, remediation: Set your container's memory requests and limits depending on its requirements. See https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#requests-and-limits for more details.)

Error: found 12 lint errors
```

Since this is a single deployment file, you can edit it directly. Open it in a text editor and change the values in the file. The file is long, so I'll include only the parts that need to change.

Start with deployment:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: 3scale-kourier-gateway
  namespace: kourier-system
  labels:
    networking.knative.dev/ingress-provider: kourier
[...]
```

The containers section has some problems:

```
spec:
  containers:
  - args:
    - --base-id 1
    - -c /tmp/config/envoy-bootstrap.yaml
    - --log-level info
    command:
    - /usr/local/bin/envoy
    image: docker.io/maistra/proxyv2-ubi8:1.1.5
    imagePullPolicy: Always
    name: kourier-gateway
    ports:
    - name: http2-external
      containerPort: 8080
      protocol: TCP
    - name: http2-internal
      containerPort: 8081
      protocol: TCP
    - name: https-external
      containerPort: 8443
      protocol: TCP
```

Add some specs to the container configuration:

```
spec:
  containers:
  - args:
    - --base-id 1
    - -c /tmp/config/envoy-bootstrap.yaml
    - --log-level info
    command:
    - /usr/local/bin/envoy
    image: docker.io/maistra/proxyv2-ubi8:1.1.5
    imagePullPolicy: Always
    name: kourier-gateway
    ports:
    - name: http2-external
      containerPort: 8080
      protocol: TCP
    - name: http2-internal
      containerPort: 8081
      protocol: TCP
    - name: https-external
      containerPort: 8443
      protocol: TCP
 resources:
    limits:
  cpu: 100m
  memory: 128Mi
    requests:
  cpu: 100m
  memory: 128Mi
```

When you rerun the linter, you'll notice these issues no longer show in the output, and the error count changes:

```
Error: found 8 lint errors
```

Congratulations! You have fixed resource issues in your Kubernetes file!

### Final thoughts

KubeLinter is a great tool and a great opportunity to start a new DevOps process to secure and resource-manage all of your Kubernetes' and applications' configurations. Adding this function to automated testing steps up your environment and DevOps cycle.

I think KubeLinter's best part is that each error message includes documentation, so even if you don't know what the error linting output means, the documentation helps you learn and plan ahead. I recommend this tool for everyday use and working with retroactive code.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/kubelinter

作者：[Jessica Cherry][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cherrybomb
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/mistake_bug_fix_find_error.png
[2]: https://github.com/stackrox/kube-linter
[3]: https://knative.dev/
[4]: https://opensource.com/article/20/6/homebrew-linux
[5]: https://opensource.com/article/20/11/knative

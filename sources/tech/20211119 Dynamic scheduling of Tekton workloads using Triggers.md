[#]: subject: "Dynamic scheduling of Tekton workloads using Triggers"
[#]: via: "https://opensource.com/article/21/11/kubernetes-dynamic-scheduling-tekton"
[#]: author: "Savita Ashture https://opensource.com/users/savita-ashture"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Dynamic scheduling of Tekton workloads using Triggers
======
Upgrade your CI/CD pipeline with this Kubernetes-native application.
![Parts, modules, containers for software][1]

[Tekton][2] is a Kubernetes-native continuous integration and delivery (CI/CD) framework. It allows you to create containerized, composable, and configurable workloads declaratively through Kubernetes Custom Resource Definitions (CRD).

[Tekton Triggers][3] is a Tekton component that allows you to detect and extract information from events from various sources and execute [TaskRuns][4] and [PipelineRuns][5] based on that information. It also enables passing extracted information to TaskRuns and PipelineRuns from events.

This article demonstrates how Tekton Triggers integrates with external services, such as a Git repository, using GitLab as an example.

### Prerequisites

If you want to follow the steps in this article, you must have a Kubernetes cluster running Kubernetes 1.18 or above with an ingress controller installed that can give you an external IP. You must also have [Tekton Pipelines][6] and [Tekton Triggers][7] installed.

### Triggers flow

A Trigger works because Tekton, using a special pod called an EventListener, is able to monitor your cluster for a specific event. To pick up on relevant events, you can use a ClusterInterceptor. When an event occurs that you have identified as significant, the Tekton Trigger starts an action or workflow you have defined.

![A flow chart showing the interactions among EventListener, Trigger, and ClusterInterceptor.][8]

Credits: <https://github.com/tektoncd/triggers/blob/main/images/TriggerFlow.svg>

Tekton Trigger allows you to create a special resource called an EventListener, which is a Kubernetes service that listens for incoming HTTP requests from different sources, usually a Git repository, including those hosted on GitLab, GitHub, and others. Based on those events, the EventListener pod performs actions and creates Tekton resources, such as TaskRun or PipelineRun.

All Triggers resource definitions are created in YAML, the configuration format most commonly used in Kubernetes. However, before writing YAML files to define a Trigger, it's important to understand Tekton Triggers terminology.

#### EventListener

An [EventListener][9] is a Kubernetes service that listens for incoming HTTP requests and executes a Trigger. For example, after receiving a specific incoming request, this definition executes the `gitlab-listener-trigger` Trigger:


```


apiVersion: triggers.tekton.dev/v1beta1
kind: EventListener
metadata:
 name: gitlab-event-listener
spec:
 serviceAccountName: gitlab-listener-sa
 triggers:
   - triggerRef: gitlab-listener-trigger
 resources:
   kubernetesResource:
     serviceType: NodePort

```

#### Trigger

A [Trigger][10] decides what to do with a received event. It also sets a TriggerBinding, TriggerTemplate, and optional interceptors to run. Triggers make use of interceptors to validate or modify incoming requests before proceeding.


```


apiVersion: triggers.tekton.dev/v1beta1
kind: Trigger
metadata:
 name: gitlab-listener-trigger
spec:
 interceptors:
   - name: "verify-gitlab-payload"
     ref:
       name: "gitlab"
       kind: ClusterInterceptor
     params:
       - name: secretRef
         value:
           secretName: "gitlab-secret"
           secretKey: "secretToken"
       - name: eventTypes
         value:
          - "Push Hook"
 bindings:
   - ref: binding
 template:
   ref: template

```

#### Interceptor

An [interceptor][11] is an event processor that runs before the TriggerBinding. It also performs payload filtering, verification (using a secret), and transformation; defines and tests trigger conditions; and implements other useful processing.

By default, four core interceptors are installed when installing Triggers: GitHub, GitLab, Bitbucket, and CEL. The installation also includes one Webhook interceptor for implementing custom business logic.

##### GitLab interceptors

GitLab interceptors help to validate and filter GitLab webhooks and filter incoming events by event type. The GitLab interceptor requires a secret token. This token is set when creating the webhook in GitLab and is validated by the GitLab interceptor when the request arrives.


```


apiVersion: v1
kind: Secret
metadata:
 name: gitlab-secret
type: Opaque
stringData:
 secretToken: "1234567"

```

#### TriggerBinding

After validating and modifying the incoming request, you need to extract values from the request and bind them to variables that you can later use in a TriggerTemplate to pass our Pipeline.

For our example, you just need a URL and a revision.


```


apiVersion: triggers.tekton.dev/v1beta1
kind: TriggerBinding
metadata:
 name: binding
spec:
 params:
   - name: gitrevision
     value: $(body.checkout_sha)
   - name: gitrepositoryurl
     value: $(body.repository.git_http_url)

```

#### TriggerTemplate

The [TriggerTemplate][12] is a blueprint that instantiates `TaskRun` or `PipelineRun` when EventListener detects an event.


```


apiVersion: triggers.tekton.dev/v1beta1
kind: TriggerTemplate
metadata:
 name: template
spec:
 params:
   - name: gitrevision
   - name: gitrepositoryurl
 resourcetemplates:
   - apiVersion: tekton.dev/v1alpha1
     kind: TaskRun
     metadata:
       generateName: gitlab-run-
     spec:
       taskSpec:
         inputs:
           resources:
             - name: source
               type: git
         steps:
           - image: ubuntu
             script: |
              #! /bin/bash
               ls -al $(inputs.resources.source.path)
       inputs:
         resources:
           - name: source
             resourceSpec:
               type: git
               params:
                 - name: revision
                   value: $(tt.params.gitrevision)
                 - name: url
                   value: $(tt.params.gitrepositoryurl)

```

Note that the pipeline resources module is, at the time of writing, being deprecated and will be replaced by [git-clone][13] tasks, from [tektoncd/catalog][14].

### Dynamically schedule workloads by configuring a webhook

First, create a new namespace, `demo`:


```
`$ kubectl create ns demo`
```

Next, before applying the Triggers resource, configure the required role-based access control (RBAC):


```


$ kubectl -n demo apply -f \
"<https://gist.githubusercontent.com/savitaashture/596bc4d93ff6b7606fe52aa20ba1ba14/raw/158a5ed0dc30fd1ebdac461147a4079cd6187eac/triggers-rbac.yaml>"

```

Note: RBAC configurations vary depending on the permissions.

Apply Triggers resources:


```


$ kubectl -n demo apply -f \
"<https://gist.githubusercontent.com/savitaashture/8aa013db1cb87f5dd1f2f96b0e121363/raw/f4f592d8c1332938878c5ab9641e350c6411e2b0/triggers-resource.yaml>"

```

After applying, verify the successful creation of the EventListener object and pod:

EL object READY status should be **True. **


```


$ kubectl get el -n demo
NAME                    ADDRESS                                                     AVAILABLE REASON              READY             REASON                                                                                                            
gitlab-event-listener   <http://el-gitlab-event-listener.demo.svc.cluster.local:8080>   True                 MinimumReplicasAvailable   True

```

EL Pod status should be **Running.**


```


$ kubectl get pods -n demo
NAME                                       READY          STATUS    RESTARTS              AGE
el-gitlab-event-listener-fb77ff8f7-p5wnv   1/1            Running   0                     4m22s

```

Create ingress to get the external IP to configure in the GitLab webhook:


```


$ kubectl -n demo apply -f \
"<https://gist.githubusercontent.com/savitaashture/3b3554810e391477feae21bb8a9af93a/raw/56665b0a31c7a537f9acbb731b68a519be260808/triggers-ingress.yaml>"

```

Get the ingress IP:


```


$ kubectl get ingress triggers-ingress-resource -n demo

NAME               CLASS    HOSTS     ADDRESS                             PORTS   AGE
ingress-resource   &lt;none&gt;   *         &lt;address&gt;                            80      6s

```

Configure a webhook in GitLab. In your GitLab repository, go to **Settings -&gt; Webhooks**.

Then set the below fields:

  * URL: external IP Address from the Ingress with `/` path
  * Secret token: 1234567, which should match the secret value created above from `triggers-resource.yaml` file



Choose event type from the Trigger section, then just select **Push events,** uncheck **Enable SSL verification**, and click on **Add webhook.**

![screenshot of GitLab Webhooks configurations][15]

Savita Ashture, [CC BY-SA 4.0][16]

#### Testing GitLab events by pushing PR

Clone your own GitLab repository, make changes, and push. For example:


```


$ git clone <https://gitlab.com/savitaashture1/gitlabtest-triggers>
$ cd gitlabtest-triggers
               $ git commit -m "empty-commit" --allow-empty &amp;&amp; git push origin main
[main 934ecba] empty-commit
Username for '<https://gitlab.com>': savitaashture
Password for '<https://savitaashture@gitlab.com>':
warning: redirecting to <https://gitlab.com/savitaashture1/gitlabtest-triggers.git/>
Enumerating objects: 1, done.
Counting objects: 100% (1/1), done.
Writing objects: 100% (1/1), 183 bytes | 183.00 KiB/s, done.
Total 1 (delta 0), reused 0 (delta 0)
To <https://gitlab.com/savitaashture1/gitlabtest-triggers>
   ff1d11e..934ecba  main -&gt; main

```

Events will be generated and sent to the EventListener pod. You can verify this by doing:


```


kubectl get pods -n demo
kubectl logs -f &lt;pod_name&gt; -n demo

```

Verify successful delivery of events by doing a `get` operation for `TaskRun`.


```


$ kubectl  -n demo get taskruns | grep gitlab-run-

gitlab-run-hvtll   True        Succeeded   95s         87s

```

Clean all resources created by Triggers by removing namespace `demo`:

`$ kubectl delete ns demo`

### Conclusion

Tekton Triggers is one of the most useful modules that help schedule workloads dynamically in response to a user-defined set of events. Because of this module, my team was able to achieve end-to-end CI/CD.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/kubernetes-dynamic-scheduling-tekton

作者：[Savita Ashture][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/savita-ashture
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/containers_modules_networking_hardware_parts.png?itok=rPpVj92- (Parts, modules, containers for software)
[2]: https://opensource.com/article/21/11/cicd-pipeline-kubernetes-tekton
[3]: https://github.com/tektoncd/triggers
[4]: https://github.com/tektoncd/pipeline/blob/master/docs/taskruns.md
[5]: https://github.com/tektoncd/pipeline/blob/master/docs/pipelineruns.md
[6]: https://github.com/tektoncd/pipeline/blob/main/docs/install.md#installing-tekton-pipelines-on-kubernetes
[7]: https://github.com/tektoncd/triggers/blob/main/docs/install.md#installing-tekton-triggers-on-your-cluster
[8]: https://opensource.com/sites/default/files/uploads/tekton_event_chart.png (Trigger flow)
[9]: https://github.com/tektoncd/triggers/blob/main/docs/eventlisteners.md
[10]: https://github.com/tektoncd/triggers/blob/main/docs/triggers.md
[11]: https://github.com/tektoncd/triggers/blob/main/docs/interceptors.md
[12]: https://github.com/tektoncd/triggers/blob/main/docs/triggertemplates.md
[13]: https://github.com/tektoncd/catalog/blob/main/task/git-clone/0.4/git-clone.yaml
[14]: https://github.com/tektoncd/catalog
[15]: https://opensource.com/sites/default/files/uploads/tekton_trigger_screenshot.png (GitLab repository)
[16]: https://creativecommons.org/licenses/by-sa/4.0/

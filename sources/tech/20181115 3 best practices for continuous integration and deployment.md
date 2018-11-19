[Translating by ChiZelin]
3 best practices for continuous integration and deployment
======
Learn about automating, using a Git repository, and parameterizing Jenkins pipelines.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/innovation_lightbulb_gears_devops_ansible.png?itok=TSbmp3_M)

The article covers three key topics: automating CI/CD configuration, using a Git repository for common CI/CD artifacts, and parameterizing Jenkins pipelines.

### Terminology

First things first; let's define a few terms. **CI/CD** is a practice that allows teams to quickly and automatically test, package, and deploy their applications. It is often achieved by leveraging a server called **[Jenkins][1]** , which serves as the CI/CD orchestrator. Jenkins listens to specific inputs (often a Git hook following a code check-in) and, when triggered, kicks off a pipeline.

A **pipeline** consists of code written by development and/or operations teams that instructs Jenkins which actions to take during the CI/CD process. This pipeline is often something like  "build my code, then test my code, and if those tests pass, deploy my application to the next highest environment (usually a development, test, or production environment)." Organizations often have more complex pipelines, incorporating tools such as artifact repositories and code analyzers, but this provides a high-level example.

Now that we understand the key terminology, let's dive into some best practices.

### 1\. Automation is key

To run CI/CD on a PaaS, you need the proper infrastructure to be configured on the cluster. In this example, I will use [OpenShift][2].

"Hello, World" implementations of this are quite simple to achieve. Simply run **oc new-app jenkins- <persistent/ephemeral>** and voilà, you have a running Jenkins server ready to go. Uses in the enterprise, however, are much more complex. In addition to the Jenkins server, admins will often need to deploy a code analysis tool such as SonarQube and an artifact repository such as Nexus. They will then have to create pipelines to perform CI/CD and Jenkins slaves to reduce the load on the master. Most of these entities are backed by OpenShift resources that need to be created to deploy the desired CI/CD infrastructure.

Eventually, the manual steps required to deploy your CI/CD components may need to be replicated, and you might not be the person to perform those steps. To ensure the outcome is produced quickly, error-free, and exactly as it was before, an automation method should be incorporated in the way your infrastructure is created. This can be an Ansible playbook, a Bash script, or any other way you would like to automate the deployment of CI/CD infrastructure. I have used [Ansible][3] and the [OpenShift-Applier][4] role to automate my implementations. You may find these tools valuable, or you may find something else that works better for you and your organization. Either way, you'll find that automation significantly reduces the workload required to recreate CI/CD components.

#### Configuring the Jenkins master

Outside of general "automation," I'd like to single out the Jenkins master and talk about a few ways admins can take advantage of OpenShift to automate Jenkins configuration. The Jenkins image from the [Red Hat Container Catalog][5] comes packaged with the [OpenShift-Sync plugin][6] installed. In the [video][7], we discuss how this plugin can be used to create Jenkins pipelines and slaves.

To create a Jenkins pipeline, create an OpenShift BuildConfig similar to this:

```
apiVersion: v1
kind: BuildConfig
...
spec:  
  source:      
    git:  
      ref: master      
      uri: <repository-uri>  
  ...  
  strategy:    
    jenkinsPipelineStrategy:    
      jenkinsfilePath: Jenkinsfile      
    type: JenkinsPipeline
```

The OpenShift-Sync plugin will notice that a BuildConfig with the strategy **jenkinsPipelineStrategy** has been created and will convert it into a Jenkins pipeline, pulling from the Jenkinsfile specified by the Git source. An inline Jenkinsfile can also be used instead of pulling from one from a Git repository. See the [documentation][8] for more information.

To create a Jenkins slave, create an OpenShift ImageStream that starts with the following definition:

```
apiVersion: v1
kind: ImageStream
metadata:
  annotations:
    slave-label: jenkins-slave
    labels:
      role: jenkins-slave
…
```

Notice the metadata defined in this ImageStream. The OpenShift-Sync plugin will convert any ImageStream with the label **role: jenkins-slave** into a Jenkins slave. The Jenkins slave will be named after the value from the **slave-label** annotation.

ImageStreams work just fine for simple Jenkins slave configurations, but some teams will find it necessary to configure nitty-gritty details such as resource limits, readiness and liveness probes, and instance caps. This is where ConfigMaps come into play:

```
apiVersion: v1
kind: ConfigMap
metadata:
  labels:
  role: jenkins-slave
...
data:
  template1: |-
    <Kubernetes pod template>
```

Notice that the **role: jenkins-slave** label is still required to convert the ConfigMap into a Jenkins slave. The **Kubernetes pod template** consists of a lengthy bit of XML that will configure every detail to your organization's liking. To view this XML, as well as more information on converting ImageStreams and ConfigMaps into Jenkins slaves, see the [documentation][9].

Notice with the three examples shown above that none of the operations required an administrator to make manual changes to the Jenkins console. By using OpenShift resources, Jenkins can be configured in a way that is easily automated.

### 2\. Sharing is caring

The second best practice is maintaining a Git repository of common CI/CD artifacts. The main idea is to prevent teams from reinventing the wheel. Imagine your team needs to perform a blue/green deployment to an OpenShift environment as part of the pipeline's CD phase. The members of your team responsible for writing the pipeline may not be OpenShift experts, nor may they have the bandwidth to write this functionality from scratch. Luckily, somebody has already written a function that incorporates that functionality in a common CI/CD repository, so your team can use that function instead of spending time writing one.

To take this a step further, your organization may decide to maintain entire pipelines. You may find that teams are writing pipelines with similar functionality. It would be more efficient for those teams to use a parameterized pipeline from a common repository as opposed to writing their own from scratch.

### 3\. Less is more

As I hinted in the previous section, the third and final best practice is to parameterize your CI/CD pipelines. Parameterization will prevent an over-abundance of pipelines, making your CI/CD system easier to maintain. Imagine I have multiple regions where I can deploy my application. Without parameterization, I would need a separate pipeline for each region.

To parameterize a pipeline written as an OpenShift build config, add the **env** stanza to the configuration:

```
...
spec:
  ...
  strategy:
    jenkinsPipelineStrategy:
      env:
      - name: REGION
        value: US-West          
      jenkinsfilePath: Jenkinsfile      
    type: JenkinsPipeline
```

With this configuration, I can pass the **REGION** parameter the pipeline to deploy my application to the specified region.

The [video][7] provides a more substantial case where parameterization is a must. Some organizations decide to split up their CI/CD pipelines into separate CI and CD pipelines, usually, because there is some sort of approval process that happens before deployment. Imagine I have four images and three different environments to deploy to. Without parameterization, I would need 12 CD pipelines to allow all deployment possibilities. This can get out of hand very quickly. To make maintenance of the CD pipeline easier, organizations would find it better to parameterize the image and environment to allow one pipeline to perform the work of many.

### Summary

CI/CD at the enterprise level tends to become more complex than many organizations anticipate. Luckily, with Jenkins, there are many ways to seamlessly provide automation of your setup. Maintaining a Git repository of common CI/CD artifacts will also ease the effort, as teams can pull from maintained dependencies instead of writing their own from scratch. Finally, parameterization of your CI/CD pipelines will reduce the number of pipelines that will have to be maintained.

If you've found other practices you can't do without, please share them in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/11/best-practices-cicd

作者：[Austin Dewey][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/adewey
[b]: https://github.com/lujun9972
[1]: https://jenkins.io/
[2]: https://www.openshift.com/
[3]: https://docs.ansible.com/
[4]: https://github.com/redhat-cop/openshift-applier
[5]: https://access.redhat.com/containers/?tab=overview#/registry.access.redhat.com/openshift3/jenkins-2-rhel7
[6]: https://github.com/openshift/jenkins-sync-plugin
[7]: https://www.youtube.com/watch?v=zlL7AFWqzfw
[8]: https://docs.openshift.com/container-platform/3.11/dev_guide/dev_tutorials/openshift_pipeline.html#the-pipeline-build-config
[9]: https://docs.openshift.com/container-platform/3.11/using_images/other_images/jenkins.html#configuring-the-jenkins-kubernetes-plug-in

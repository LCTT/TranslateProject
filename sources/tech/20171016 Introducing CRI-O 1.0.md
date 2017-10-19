# Introducing CRI-O 1.0

Last year, the Kubernetes project introduced its [Container Runtime Interface][11] (CRI) -- a plugin interface that gives kubelet (a cluster node agent used to create pods and start containers) the ability to use different OCI-compliant container runtimes, without needing to recompile Kubernetes. Building on that work, the [CRI-O][12] project ([originally known as OCID][13]) is ready to provide a lightweight runtime for Kubernetes.

So what does this **really** mean?

CRI-O allows you to run containers directly from Kubernetes - without any unnecessary code or tooling. As long as the container is OCI-compliant, CRI-O can run it, cutting out extraneous tooling and allowing containers to do what they do best: fuel your next-generation cloud-native applications

Prior to the introduction of CRI, Kubernetes was tied to specific container runtimes through “[an internal and ][14][volatile ][15][interface][16].” This incurred a significant maintenance overhead for the upstream Kubernetes community as well as vendors building solutions on top of the orchestration platform.

With CRI, Kubernetes can be container runtime-agnostic. Providers of container runtimes don’t need to implement features that Kubernetes already provides. This is a win for the broad community, as it allows projects to move independently while still working well together.

For the most part, we don’t think users of Kubernetes (or distributions of Kubernetes, like OpenShift) really care a lot about the container runtime. They want it to work, but they don’t really want to think about it a great deal. Sort of like you don’t (usually) care if a machine has GNU Bash, Korn, Zsh, or another POSIX-compliant shell. You just want to have a standard way to run your script or application.

**CRI-O: A Lightweight Container Runtime for Kubernetes**
And that’s what CRI-O provides. The name derives from CRI plus Open Container Initiative (OCI), because CRI-O is strictly focused on OCI-compliant runtimes and container images.

Today, CRI-O supports the runc and Clear Container runtimes, though it should support any OCI-conformant runtime. It can pull images from any container registry, and handles networking using the [Container Network Interface][17] (CNI) so that any CNI-compatible networking plugin will likely work with the project.

When Kubernetes needs to run a container, it talks to CRI-O and the CRI-O daemon works with runc (or another OCI-compliant runtime) to start the container. When Kubernetes needs to stop the container, CRI-O handles that. Nothing exciting, it just works behind the scenes to manage Linux containers so that users don’t need to worry about this crucial piece of container orchestration.

 ![CRI-O Overview](https://www.redhat.com/cms/managed-files/styles/max_size/s3/CRI-Ov1_Chart_1.png?itok=2FJxD8Qp "CRI-O Overview") 

**What CRI-O isn’t**
It’s worth spending a little time on what CRI-O  _isn’t_ . The scope for CRI-O is to work with Kubernetes, to manage and run OCI containers. It’s not meant as a developer-facing tool, though the project does have some user-facing tools for troubleshooting.

Building images, for example, is out of scope for CRI-O and that’s left to tools like Docker’s build command, [Buildah][18], or [OpenShift’s Source-to-Image][19] (S2I). Once an image is built, CRI-O will happily consume it, but the building of images is left to other tools.

While CRI-O does include a command line interface (CLI), it’s provided mainly for testing CRI-O and not really as a method for managing containers in a production environment.

**Next steps**
Now that CRI-O 1.0 is released, we’re hoping to see it included as a stable feature in the next release of Kubernetes. The 1.0 release will work with the Kubernetes 1.7.x series, a CRI-O 1.8-rc1 release for Kubernetes 1.8.x will be released soon.

We invite you to join us in furthering the development of the Open Source CRI-O project and we would like to thank our current contributors for their assistance in reaching this milestone. If you would like to contribute, or follow development, head to [CRI-O project’s GitHub repository][20] and follow the [CRI-O blog][21].

--------------------------------------------------------------------------------

via: https://www.redhat.com/en/blog/introducing-cri-o-10

作者：[Joe Brockmeier][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.redhat.com/en/blog/authors/joe-brockmeier
[1]:https://www.redhat.com/en/blog/authors/joe-brockmeier
[2]:https://www.redhat.com/en/blog/authors/senior-evangelist
[3]:https://www.redhat.com/en/blog/authors/linux-containers
[4]:https://www.redhat.com/en/blog/authors/red-hat-0
[5]:https://www.redhat.com/en/blog
[6]:https://www.redhat.com/en/blog/tag/community
[7]:https://www.redhat.com/en/blog/tag/containers
[8]:https://www.redhat.com/en/blog/tag/hybrid-cloud
[9]:https://www.redhat.com/en/blog/tag/platform
[10]:mailto:?subject=Check%20out%20this%20redhat.com%20page:%20Introducing%20CRI-O%201.0&body=I%20saw%20this%20on%20redhat.com%20and%20thought%20you%20might%20be%20interested.%20%20Click%20the%20following%20link%20to%20read:%20https://www.redhat.com/en/blog/introducing-cri-o-10https://www.redhat.com/en/blog/introducing-cri-o-10
[11]:https://github.com/kubernetes/kubernetes/blob/242a97307b34076d5d8f5bbeb154fa4d97c9ef1d/docs/devel/container-runtime-interface.md
[12]:http://cri-o.io/
[13]:https://www.redhat.com/en/blog/running-production-applications-containers-introducing-ocid
[14]:http://blog.kubernetes.io/2016/12/container-runtime-interface-cri-in-kubernetes.html
[15]:http://blog.kubernetes.io/2016/12/container-runtime-interface-cri-in-kubernetes.html
[16]:http://blog.kubernetes.io/2016/12/container-runtime-interface-cri-in-kubernetes.html
[17]:https://github.com/containernetworking/cni
[18]:https://github.com/projectatomic/buildah
[19]:https://github.com/openshift/source-to-image
[20]:https://github.com/kubernetes-incubator/cri-o
[21]:https://medium.com/cri-o

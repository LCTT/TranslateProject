[#]: subject: (5 reasons to host your container registry with Pulp)
[#]: via: (https://opensource.com/article/21/5/container-management-pulp)
[#]: author: (Melanie Corr https://opensource.com/users/melanie-corr)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

5 reasons to host your container registry with Pulp
======
There are many compelling arguments for hosting your own container
registry with Pulp. Here are some of them.
![Containers for shipping overseas][1]

Linux containers have greatly simplified software distribution. The ability to package an application with everything it needs to run has helped increase stability and reproducibility of environments.

While there are many public registries where you can upload, manage, and distribute container images, there are many compelling arguments in favor of hosting your own container registry. Let's take a look at the reasons why self-hosting makes sense, and how [Pulp][2], a free and open source project, can help you manage and distribute containers in an on-premises environment.

### Why host your own container registry

There are a number of reasons why you might consider hosting your own container registry:

  * **Size:** Some container images are quite large. If you have multiple teams downloading the same image, it can take a significant amount of time and put pressure on both your network and your budget.
  * **Bandwidth:** If you work in an area of limited bandwidth or in an organization that restricts access to the internet for security reasons, you need a reliable way of managing the containers you work with.
  * **Money:** Terms of service can change. External container registries can introduce or increase rate-limit thresholds that can become prohibitively restrictive to your operation.
  * **Stability:** Container images hosted on an external source can disappear from one day to the next for a number of reasons. Something as small as an update for a container image you rely on can introduce breaking changes that you want to avoid.
  * **Privacy:** You might also want to develop and distribute containers that you don't want to host in a public, third-party registry.



### Self-hosting with Pulp

Using Pulp, you can avoid these problems and take full control of your containers.

#### 1\. Avoid rate limits

Creating a local cache of container images in Pulp allows everyone in your organization to pull the container images hosted on Pulp rather than from an external registry. This means you can avoid rate limits and synchronize from an external registry only when you need something new. Whenever you do need to sync containers from an external registry, Pulp first checks if the content already exists before initiating the synchronization from the remote registry. If you are subject to registry rate limits, you're mirroring only the content you need and then distributing it throughout your organization using Pulp.

#### 2\. Curate your containers

With Pulp, you can create a repository, then mirror and synchronize containers from any registry that is Docker Registry HTTP API V2-compatible. This includes Docker, Google Container registry, Quay.io, and many more, including another Pulp server. There are no limits or restrictions to the way you combine containers that you mirror from different registries. You are free to blend containers from different sources. This allows you to curate a set of public and private containers to suit your exact requirements.

#### 3\. Experiment without risk

In Pulp, every time you make a change to the repository, a new immutable version is created. You can create multiple versions of a repository, for example, _development, test, stage_, and _production_, and promote containers across them. You are free to sync the latest updates to a container image from an external registry to Pulp, then make the latest changes consumable to a development or other environment. You can make any changes to the repositories you deem necessary, and promote the container content to be consumed by a test team or other environment. If something goes wrong, you can roll back to an earlier version.

#### 4\. Sync only the content you need

If you want to use Pulp to create a local cache of a subset of containers rather than a full container registry, you can filter a selection of containers from a remote source. With Pulp, there are multiple content synchronization options so that you store only the content you need or configure your deployment to cache content on demand.

#### 5\. Work with disconnected and air-gapped environments

If you work in a disconnected or restricted environment, you can sync updates from a connected Pulp instance to your disconnected Pulp. Currently, there are plans to implement a native air-gapped feature for Pulp to facilitate a fully disconnected workflow. In the meantime, as a workaround, you can use a tool such as [Skopeo][3] to download container images you need and then push them to your disconnected Pulp container registry.

#### And much more!

With Pulp, you can also build containers from containerfiles, push private containers to repositories, and distribute those containers throughout your organization. We will take a look at this workflow in a future article.

### How to get started

If you're interested in self-hosting your container registry, you can [install Pulp][4] today. The installation process has been heavily automated and streamlined with the addition of a Pulp Ansible installer.

Pulp has a plugin-based architecture. When you install Pulp, select the Container plugin and whatever other type of content plugin you want to manage. If you would prefer to take Pulp for a test drive, you can evaluate a containerized version of Pulp today.

If you have any questions or comments, feel free to reach out to us on the #pulp channel on Freenode IRC, and we're happy to take questions on our mailing list, [pulp-list@redhat.com][5].

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/container-management-pulp

作者：[Melanie Corr][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/melanie-corr
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/containers_2015-2-osdc-lead.png?itok=kAfHrBoy (Containers for shipping overseas)
[2]: https://pulpproject.org/
[3]: https://github.com/containers/skopeo
[4]: https://pulpproject.org/installation-introduction/
[5]: mailto:pulp-list@redhat.com

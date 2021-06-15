[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Manage content using Pulp Debian)
[#]: via: (https://opensource.com/article/20/10/pulp-debian)
[#]: author: (Maximilian Kolb https://opensource.com/users/kolb)

Manage content using Pulp Debian
======
Mirror, sync, upload, and publish Debian software packages with the
pulp_deb plugin.
![Gift box opens with colors coming out][1]

Pulp is an open source repository management tool that helps you fetch, mirror, upload, and publish content within your organization. It can be used to [manage various types of content][2] such as software packages (from RPM packages to Ruby gems), as well as Ansible collections, container images, and even arbitrary files.

A typical workflow starts with fetching software packages from an existing repository (for example, <http://mirror.centos.org/centos/7/os/x86_64/>) or adding packages manually (for private packages built within your organization). Then Pulp helps you make arbitrary collections of software packages that are consumable by clients. With it, you:

  * Gain control over what content is available for consumers
  * Can use version control
  * Reduce bandwidth and storage needs by providing a local, deduplicated source



If you're new to Pulp, read Melanie Corr's introductory article on [how to manage your software repositories with Pulp][3].

### Manage Debian packages with Pulp

Pulp relies on plugins to adequately handle different types of content. For example, the [Pulp RPM][4] plugin enables you to manage .rpm packages. With the [Pulp Debian][5] plugin, you can mirror, sync, upload, and publish .deb packages within APT repositories. The pulp_deb plugin is essential if you want to manage and provide consumable software packages for Linux distributions such as Debian and Ubuntu, and it's free and open source software provided and maintained by the Pulp community.

With the Pulp Debian plugin, you can manage Debian content by synchronizing remote repositories, providing an interface to upload your own content, and publishing content to repositories.

Pulp supports several different [Debian content types][6], including packages, package indices, Release Files, and more. "Content type" refers to either a specific artifact or metadata. For example, a content unit of type `package` refers to a .deb package.

Synchronizing a remote repository is one of Pulp Debian plugin's main features, and it's one of the ways to obtain content. The synchronization process uses a [remote][7] definition that contains a URL, [distribution][8], components, and architectures:

  * The **URL** is the path to the remote APT repository.
  * The **distribution** is the path between the `dists/` directory of the APT repository and the relevant `Release` file. This is usually (but not always) the codename or suite of the Debian-based Linux distribution (`buster` for Debian 10, `stretch` for Debian 9, `focal` for Ubuntu 20.04, and so on). Running `lsb_release -cs` on any Debian or Ubuntu host shows the distribution's codename.
  * **Components** describe arbitrary subsets of repositories (`main`, `contrib`, or `non-free` for Debian, or `main`, `restricted`, `universe`, and `multiverse` for Ubuntu). You can use this to filter and categorize packages within an APT repository.
  * The **architecture** refers to the processor architecture a software package can run on, most commonly `i386`, `amd64`, or `arm64`. If a software package does not depend on a specific processor architecture, the architecture may be set to `all`.



Specifying a distribution is mandatory, whereas defining components and architectures is optional. If undefined, Pulp automatically syncs all packages without filtering for components or architectures. Pulp automatically verifies the [GNU Privacy Guard][9] signature of the `Release` File, should the corresponding GPG public key be assigned to the remote.

### An example workflow

It's easy to go from a remote repository to a verbatim publication with Pulp's [REST API][10]. The following API calls assume you're using [HTTPie][11].

Imagine you want to provide .deb packages to hosts within your organization. The following basic workflow guides your first steps in using Pulp and the Pulp Debian plugin.

![Pulp Debian workflow][12]

Image by Maximilian Kolb

#### 1\. Create a local repository

Start by creating a local repository in Pulp with a single API call. You can do this with HTTPie or the [curl command][13]:


```
`http post http://<hostname>:24817/pulp/api/v3/repositories/deb/apt/ name=<name_of_your_repository>`
```

#### 2\. Create a remote

Next, create a remote. This API call requires a URL and an arbitrary `name` value. Defining a distribution and architecture is optional:


```
`http post http://<hostname>:24817/pulp/api/v3/remotes/deb/apt/ name="nginx.org" url="http://nginx.org/packages/debian" distributions="buster"`
```

Whether you define only one or multiple distributions, Pulp will later sync packages for all architectures, as they are undefined for this remote.

#### 3\. Synchronize

The third and final step to fetch remote content to Pulp is to sync the remote to your local repository. You do this by making a call to the sync API endpoint of your repository:


```
`http post http://<hostname>:24817/pulp/api/v3/repositories/deb/apt/<uuid_repository>/sync/ remote=http://<hostname>:24817/pulp/api/v3/remotes/deb/apt/<uuid_remote>/`
```

In this sample command, each of the UUIDs refers to Pulp's internal references, displayed as `pulp_href` by the API. This step may take some time, depending on your environment, the size of the repository, and the available bandwidth.

### Make your Pulp content consumable

After acquiring content for Pulp through synchronization, it becomes consumable by clients.

#### 1\. Create a publication

Publications are always based on a Pulp repository. They contain extra settings on how to publish content. You can use the `APT` publisher on any repository of the APT type containing .deb packages.

The following API call creates a publication in verbatim mode. That is, it provides the exact same structure and content of the remote repository:


```
`http post http://<hostname>:24817/pulp/api/v3/publications/deb/verbatim/ repository=/pulp/api/v3/repositories/deb/apt/<uuid_repository>/`
```

Replace the UUID with the repository you want to publish. This step may take some time, depending on the size of the repository.

#### 2\. Create a distribution

A distribution takes the finished publication and serves it through the Pulp content app, which makes it available (or "consumable") by your users. In the context of a Debian system, this means that the repository can be added to `/etc/apt/sources.list` and used as a way to install software.

The following API call requires the UUID of the publication created in the first step:


```
`http post http://<hostname>:24817/pulp/api/v3/distributions/deb/apt/ name="name_of_the_distribution" base_path="base_path_of_the_distribution" publication=http://<hostname>:24817/pulp/api/v3/publications/deb/verbatim/<uuid_publication>/`
```

The `base_path` value is part of the URL used by clients when referring to the APT repository, and the name can be arbitrary. Calling the distribution's API endpoint on a specific published distribution returns the URL of the Pulp repository:


```
`http get http://<hostname>:24817/pulp/api/v3/distributions/deb/apt/<uuid_distribution>/`
```

This URL is directly consumable by APT clients. It can now be added to `/etc/apt/sources.list` as a valid repository.

### Pulp API

Using these API calls lets you sync an APT repository to your own Pulp instance and republish it verbatim, without touching the packages, any metadata, or signatures. Refer to the [API documentation][6] and [feature overview][14] for further information and other modes of publication.

### Open source flexibility

One important aspect of Pulp and its plugin structure is that it's extremely flexible, in no small part due to its open source nature. You can run Pulp as a standalone service, but you don't have to. It can be integrated into something bigger.

I work at [ATIX][15], where we've started using Pulp and the Pulp Debian plugin in a project called [orcharhino][16]. It's based on [Foreman][17] and includes the powerful [Katello][18] plugin for additional content-management capabilities, which itself relies on Pulp for repository management. With this, we've been able to manage our data center with automated system deployment, configuration management, and patch management.

In other words, ATIX develops the Pulp Debian plugin primarily with a Katello use case in mind. Whether you need Katello or Pulp or just a specific Pulp plugin, you can rest assured that this modularity is by design.

Using Pulp, you can mirror remote software repositories, host private software packages, and manage different types of content on one platform.

Try [Pulp][19] and the [Pulp Debian][5] plugin today, and don't be afraid to join and ask the [community][20] for help. We welcome any and all feedback.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/10/pulp-debian

作者：[Maximilian Kolb][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/kolb
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_gift_giveaway_box_520x292.png?itok=w1YQhNH1 (Gift box opens with colors coming out)
[2]: https://pulpproject.org/content-plugins/#pulp-3-content-plugins-information
[3]: https://opensource.com/article/20/8/manage-repositories-pulp
[4]: https://github.com/pulp/pulp_rpm
[5]: https://github.com/pulp/pulp_deb
[6]: https://pulp-deb.readthedocs.io/en/latest/restapi.html
[7]: https://docs.pulpproject.org/pulpcore/glossary.html#term-Remote
[8]: https://docs.pulpproject.org/pulpcore/glossary.html#term-Distribution
[9]: https://gnupg.org/
[10]: https://docs.pulpproject.org/pulpcore/restapi.html
[11]: https://httpie.org/
[12]: https://opensource.com/sites/default/files/pulp-debian-workflow_0.jpg (Pulp Debian workflow)
[13]: https://www.redhat.com/sysadmin/use-curl-api
[14]: https://pulp-deb.readthedocs.io/en/latest/feature_overview.html
[15]: https://atix.de/en/
[16]: https://orcharhino.com/
[17]: https://theforeman.org/
[18]: https://theforeman.org/plugins/katello
[19]: https://pulpproject.org/
[20]: https://pulpproject.org/get_involved/

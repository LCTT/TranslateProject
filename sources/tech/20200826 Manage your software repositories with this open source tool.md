[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Manage your software repositories with this open source tool)
[#]: via: (https://opensource.com/article/20/8/manage-repositories-pulp)
[#]: author: (Melanie Corr https://opensource.com/users/melanie-corr)

Manage your software repositories with this open source tool
======
An introduction to Pulp, the open source repository management solution
that is growing in scope and functionality.
![Cut pieces of citrus fruit and pomegranates][1]

[Foreman][2] is a robust management and automation product that provides administrators of Linux environments with enterprise-level solutions for four key scenarios: provisioning management, configuration management, patch management, and content management. A major component of the content management functionality in Foreman is provided by the Pulp project. While Pulp is an integral part of this product, it is also a standalone, free, and open source project that is making huge progress on its own.

Let's take a look at the Pulp project, especially the features of the latest release, Pulp 3.

### What is Pulp?

Pulp is a platform for managing repositories of software packages and making them available to a large number of consumers. You can use Pulp to mirror, synchronize, upload, and promote content like RPMs, Python packages, Ansible collections, container images, and more across different environments. If you have dozens, hundreds, or even thousands of software packages and need a better way to manage them, Pulp can help.

The latest major version is [Pulp 3][3], which was released in December 2019. Pulp 3 is the culmination of years of gathering user requirements and a complete technical overhaul of the existing Pulp architecture to increase reliability and flexibility. Plus, it includes a vast range of new features.

### Who uses Pulp?

For the most part, Pulp users administer enterprise software environments where the stability and reliability of content are paramount. Pulp users want a platform to develop content without worrying that repositories might disappear. They want to promote content across the different stages of their lifecycle environment in a secure manner that optimizes disk space and scales their environment to meet new demands. They also need the flexibility to work with a wide variety of content types. Pulp 3 provides that and more.

### Manage a wide variety of content in one place

After you install Pulp, you can add [content plugins][4] for the content types that you plan to manage, mirror the content locally, add privately hosted content, and blend content to suit your requirements. If you’re an Ansible user, for example, and you don't want to host your private content on Ansible Galaxy, you can add the Pulp Ansible plugin, mirror the public Ansible content that you require, and use Pulp as an on-premise platform to manage and distribute a scalable blend of public and private Ansible roles and collections across your organization. You can do this with any content type. There is a wide variety of content plugins available, including RPM, Debian, Python, Container, and Ansible, to name but a few. There is also a File plugin, which you can use to manage files like ISO images.

If you don't find a plugin for the content type that you require, Pulp 3 has introduced a new plugin API and plugin template to make it easy to create a Pulp plugin of your own. You can use the [plugin writing guide][5] to autogenerate a minimal viable plugin, and then start building from there.

### High availability

With Pulp 3, the change from MongoDB to PostgreSQL facilitated major improvements around performance and data integrity. Pulp users now have a fully open source tech stack that provides high availability (HA) and better scalability.

### Repository versioning

Using Pulp 3, you can experiment without risk. Every time you add or remove content, Pulp creates an immutable repository version so that you can roll back to earlier versions and thereby guarantee the safety and stability of your operation. Using publications and distributions, you can expose multiple versions of a repository, which you can use as another method of rolling back to an earlier version. To roll back, you can simply point your distribution to an older publication.

### Disk optimization

One of the major challenges for any software development environment is disk optimization. If you're downloading a constant stream of packages—for example, nightly builds of repositories that you require today but will no longer require tomorrow—disk space will quickly become an issue. Pulp 3 has been designed with disk optimization in mind. While the default option downloads and saves all software packages, you can also enable either the "on demand" or "streamed" option. The "on demand" option saves disk space by downloading and saving only the content that clients request. With the "streamed" option, you also download upon client request, but you don't save the content in Pulp. This is ideal for synchronizing content, for example, from a nightly repository, and saves you from having to perform a disk cleanup at a later stage.

### Multiple storage options

Even with the best disk optimization, as your project grows, you might need a way to scale your deployment to match your requirements. As well as local file storage, Pulp supports a range of cloud storage options, such as Amazon S3 and Azure, to ensure that you can scale to meet the demands of your deployment.

### Protect your content

Pulp 3 has the option of adding the [Certguard][6] plugin, which provides an X.509 capable ContentGuard that requires clients to submit a certificate proving their entitlement to content before receiving content from Pulp.

Any client presenting an X.509 or Red Hat Subscription Management-based certificate at request time will be authorized, as long as the client certification is not expired, is signed by the Certificate Authority, and was stored on the Certguard when it was created. The client presents the certificate using transport layer security (TLS), which proves that the client has not only the certificate but also its key. You can develop, confident in the knowledge that your content is being protected.

The Pulp team is also actively working on a role-based access control system for the entire Pulp deployment so that administrators can ensure that the right users have access to the right environments.

### Try Pulp in a container

If you're interested in evaluating Pulp 3 for yourself, you can easily install [Pulp 3 in a Container][7] using Docker or Podman. The Pulp team is constantly working on simplifying the installation process. You can also use an [Ansible playbook][8] to automate the full installation and configuration of Pulp 3.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/manage-repositories-pulp

作者：[Melanie Corr][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/melanie-corr
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/fruit-orange-pomegranate-pulp-unsplash.jpg?itok=4cvODZDJ (Oranges and pomegranates)
[2]: https://opensource.com/article/17/8/system-management-foreman
[3]: https://pulpproject.org/about-pulp-3/
[4]: https://pulpproject.org/content-plugins/
[5]: https://docs.pulpproject.org/plugins/plugin-writer/index.html
[6]: https://pulp-certguard.readthedocs.io/en/latest/
[7]: https://pulpproject.org/pulp-in-one-container/
[8]: https://pulp-installer.readthedocs.io/en/latest/

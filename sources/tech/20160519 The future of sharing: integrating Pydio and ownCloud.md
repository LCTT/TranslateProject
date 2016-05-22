The future of sharing: integrating Pydio and ownCloud
=========================================================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/BIZ_darwincloud_520x292_0311LL.png?itok=5yWIaEDe)
>Image by : 
opensource.com

The open source file sharing ecosystem accommodates a large variety of projects, each supplying their own solution, and each with a different approach. There are a lot of reasons to choose an open source solution rather than commercial solutions like Dropbox, Google Drive, iCloud, or OneDrive. These solutions offer to take away worries about managing your data but come with certain limitations, including a lack of control and integration into existing infrastructure.

There are quite a few file sharing and sync alternatives available to users, including ownCloud and Pydio.

### Pydio

The Pydio (Put your data in orbit) project was founded by musician Charles du Jeu, who needed a way to share large audio files with his bandmates. [Pydio][1] is a file sharing and sync solution, with multiple storage backends, designed with developers and system administrators in mind. It has over one million downloads worldwide and has been translated into 27 languages.

Open source from the very start, the project grew organically on [SourceForge][2] and now finds its home on [GitHub][3].

The user interface is based on Google's [Material Design][4]. Users can use an existing legacy file infrastructure or set up Pydio with an on-premise approach, and use web, desktop, and mobile applications to manage their assets everywhere. For administrators, the fine-grained access rights are a powerful tool for configuring access to assets.​

On the [Pydio community page][5], you will find several resources to get you up to speed quickly. The Pydio website gives some clear guidelines on [how to contribute][6] to the Pydio repositories on GitHub. The [forum][7] includes sections for developers and community.

### ownCloud

[ownCloud][8] has over 8 million users worldwide and is an open source, self-hosted file sync and sharing technology. There are sync clients for all major platforms as well as WebDAV through a web interface. ownCloud has an easy to use interface, powerful administrator tools, and extensive sharing and collaboration features—designed to give users control over their data.

ownCloud's open architecture is extensible via an API and offers a platform for apps. Over 300 applications have been written, featuring capabilities like handling calendar, contacts, mail, music, passwords, notes, and many other types of data. ownCloud provides security, scales from a Raspberry Pi to a cluster with petabytes of storage and millions of users, and is developed by an international community of hundreds of contributors.

### Federated sharing

File sharing is starting to shift toward teamwork, and standardization provides a solid basis for such collaboration.

Federated sharing, a new open standard supported by the [OpenCloudMesh][9] project, is a step in that direction. Among other things, it allows for the sharing of files and folders between servers that support this, like Pydio and ownCloud instances.

First introduced in ownCloud 7, this server-to-server sharing allows you to mount file shares from remote servers, in effect creating your own cloud of clouds. You can create direct share links with users on other servers that support federated cloud sharing. 

Implementing this new API allows for deeper integration between storage solutions while maintaining the security, control, and attributes of the original platforms.

"Exchanging and sharing files is something that is essential today and tomorrow," ownCloud founder Frank Karlitschek said. "Because of that, it is important to do this in a federated and distributed way without centralized data silos. The number one design goal [of federated sharing] is to enable sharing in the most seamless and easiest way while protecting the security and privacy of the users."

### What's next?

An initiative like OpenCloudMesh will extend this new open standard of file sharing through cooperation of institutions and companies like Pydio and ownCloud. ownCloud 9 has already introduced the ability for federated servers to exchange user lists, enabling the same seamless auto-complete experience you have with users on your own server. In the future, the idea of having a (federated!) set of central address book servers that can be used to search for others' federated cloud IDs might bring inter-cloud collaboration to an even higher level.

The initiative will undoubtedly contribute to already growing open technical community within which members can easily discuss, develop, and contribute to the "OCM sharing API" as a vendor-neutral protocol. All leading partners of the OCM project are fully committed to the open API design principle and welcome other open source file share and sync communities to participate and join the connected cloud.

--------------------------------------------------------------------------------

via: https://opensource.com/business/16/5/sharing-files-pydio-owncloud

作者：[ben van 't ende][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/benvantende
[1]: https://pydio.com/
[2]: https://sourceforge.net/projects/ajaxplorer/
[3]: https://github.com/pydio/
[4]: https://www.google.com/design/spec/material-design/introduction.html
[5]: https://pydio.com/en/community
[6]: https://pydio.com/en/community/contribute
[7]: https://pydio.com/forum/f
[8]: https://owncloud.org/
[9]: https://wiki.geant.org/display/OCM/Open+Cloud+Mesh

[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Crowdsourcing license compliance with ClearlyDefined)
[#]: via: (https://opensource.com/article/19/5/license-compliance-clearlydefined)
[#]: author: (Jeff McAffer https://opensource.com/users/jeffmcaffer)

Crowdsourcing license compliance with ClearlyDefined
======
Licensing is what holds open source together, and ClearlyDefined takes
the mystery out of projects' licenses, copyright, and source location.
![][1]

Open source use continues to skyrocket, not just in use cases and scenarios but also in volume. It is trivial for a developer to depend on a 1,000 JavaScript packages from a single run of `npm install` or have thousands of packages in a [Docker][2] image. At the same time, there is increased interest in ensuring license compliance.

Without the right license you may not be able to legally use a software component in the way you intend or may have obligations that run counter to your business model. For instance, a JavaScript package could be marked as [MIT license][3], which allows commercial reuse, while one of its dependencies is licensed has a [copyleft license][4] that requires you give your software away under the same license. Complying means finding the applicable license(s), and assessing and adhering to the terms, which is not too bad for individual components adn can be daunting for large initiatives.

Fortunately, this open source challenge has an open source solution: [ClearlyDefined][5]. ClearlyDefined is a crowdsourced, open source, [Open Source Initiative][6] (OSI) effort to gather, curate, and upstream/normalize data about open source components, such as license, copyright, and source location. This data is the cornerstone of reducing the friction in open source license compliance.

The premise behind ClearlyDefined is simple: we are all struggling to find and understand key information related to the open source we use—whether it is finding the license, knowing who to attribute, or identifying the source that goes with a particular package. Rather than struggling independently, ClearlyDefined allows us to collaborate and share the compliance effort. Moreover, the ClearlyDefined community seeks to upstream any corrections so future releases are more clearly defined and make conventions more explicit to improve community understanding of project intent.

### How it works

![ClearlyDefined's harvest, curate, upstream process][7]

ClearlyDefined monitors the open source ecosystem and automatically harvests relevant data from open source components using a host of open source tools such as [ScanCode][8], [FOSSology][9], and [Licensee][10]. The results are summarized and aggregated to create a _definition_ , which is then surfaced to users via an API and a UI. Each definition includes:

  * Declared license of the component
  * Licenses and copyrights discovered across all files
  * Exact source code location to the commit level
  * Release date
  * List of embedded components



Coincidentally (well, not really), this is exactly the data you need to do license compliance.

### Curating

Any given definition may have gaps or imperfections due to tool issues or the data being missing or incorrect at the origin. ClearlyDefined enables users to curate the results by refining the values and filling in the gaps. These contributions are reviewed and merged, as with any open source project. The result is an improved dataset for all to use.

### Getting ahead

To a certain degree, this process is still chasing the problem—analyzing and curating after the packages have already been published. To get ahead of the game, the ClearlyDefined community also feeds merged curations back to the originating projects as pull requests (e.g., adding a license file, clarifying a copyright). This increases the clarity of future release and sets up a virtuous cycle.

### Adapting, not mandating

In doing the analysis, we've found quite a number of approaches to expressing license-related data. Different communities put LICENSE files in different places or have different practices around attribution. The ClearlyDefined philosophy is to discover these conventions and adapt to them rather than asking the communities to do something different. A side benefit of this is that implicit conventions can be made more explicit, improving clarity for all.

Related to this, ClearlyDefined is careful to not look too hard for this interesting data. If we have to be too smart and infer too much to find the data, then there's a good chance the origin is not all that clear. Instead, we prefer to work with the community to better understand and clarify the conventions being used. From there, we can update the tools accordingly and make it easier to be "clearly defined."

#### NOTICE files

As an added bonus for users, we set up an API and UI for generating NOTICE files, making it trivial for you to comply with the attribution requirements found in most open source licenses. You can give ClearlyDefined a list of components (e.g., _drag and drop an npm package-lock.json file on the UI_ ) and get back a fully formed NOTICE file rendered by one of several renderers (e.g., text, HTML, Handlebars.js template). This is a snap, given that we already have all the compliance data. Big shout out to the [OSS Attribution Builder project][11] for making a simple and pluggable NOTICE renderer we could just pop into the ClearlyDefined service.

### Getting involved

You can get involved with ClearlyDefined in several ways:

  * Become an active user, contributing to your compliance workflow
  * Review other people's curations using the interface
  * Get involved in [the code][12] (Node and React)
  * Ask and answer questions on [our mailing list][13] or [Discord channel][14]
  * Contribute money to the OSI targeted to ClearlyDefined. We'll use that to fund development and curation.



We are excited to continue to grow our community of contributors so that licensing can continue to become an understable part of any team's open source adoption. For more information, check out [https://clearlydefined.io][15].

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/license-compliance-clearlydefined

作者：[Jeff McAffer][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jeffmcaffer
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_Crowdfunding_520x292_9597717_0612CM.png?itok=lxSKyFXU
[2]: https://opensource.com/resources/what-docker
[3]: /article/19/4/history-mit-license
[4]: /resources/what-is-copyleft
[5]: https://clearlydefined.io
[6]: https://opensource.org
[7]: https://opensource.com/sites/default/files/uploads/clearlydefined.png (ClearlyDefined's harvest, curate, upstream process)
[8]: https://github.com/nexB/scancode-toolkit
[9]: https://www.fossology.org/
[10]: https://github.com/licensee/licensee
[11]: https://github.com/amzn/oss-attribution-builder
[12]: https://github.com/clearlydefined
[13]: mailto:clearlydefined@googlegroups.com
[14]: %C2%A0https://clearlydefined.io/discord)
[15]: https://clearlydefined.io/

[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Making compliance scalable in a container world)
[#]: via: (https://opensource.com/article/20/7/compliance-containers)
[#]: author: (Scott K Peterson https://opensource.com/users/skpeterson)

Making compliance scalable in a container world
======
When software is distributed via container images, source code should be
made available in order to ensure seamless compliance with licensing.
![Shipping containers stacked in a yard][1]

Software is increasingly being distributed as container images. Container images include the many software components needed to support the featured software in the container. Thus, distribution of a container image involves distribution of many software components, which typically include GPL-licensed components. We can't expect every company that distributes container images to become an open source compliance expert, so we need to build compliance into container technology.

We should design source code availability into container tools and processes to facilitate open source license compliance that is efficient and portable:

  * Efficient—Address compliance once when a container image is created. Avoid depending on later actions, especially actions external to existing container distribution tooling.
  * Portable—When an image is moved to another registry, it should be straightforward to move compliance along with it.



This can be done with a registry-native approach to source code availability. This doesn't require updating all container registries to include source-code-specific features. It is possible to exploit features that registries already have. For software distributed through container registries, we can use those same registries to facilitate compliance.

### Container technology

Container technology helps manage the challenges of deploying and operating complex software systems.

The word "container" refers to a runtime experience—a program, together with its dependencies, can execute in an environment that provides certain isolation from other executing programs; this is running in a container.

The set of files that are used to provision such a container is called a "container image." While the purpose of a particular container image might be to run one application program, the container image includes much more: that application and its dependencies—the files necessary to run that application, except for the operating system kernel. A container image is a form of those files that can be stored and transferred, enabling the application to be reliably deployed again and again, and run independently of the many other programs that may be running and changing in other containers in the system.

Distribution of software in the form of container images, which are distributed from services known as "container registries," is growing. Once one invests in organizing computing around containers, it becomes valuable to package and distribute software in container images. Those who use containers to run their software find it is useful to be able to obtain software as pre-built container images, rather than doing all of the container assembly themselves. Even when container images are customized, it is often valuable to start from a pre-built image.

### Container images are different

In the past, it has been common to obtain each software component separately. In contrast, a container image includes a heterogeneous collection of software–often hundreds of software components. The unit of software delivery is changing from one driven by how the software is **built** to one driven by how the software is **used**. (See [What's in a container image: Meeting the legal challenges][2].)

Package maintainers and package management tools have played an underappreciated role in source availability for over two decades. The focused nature of a package, the role of a package maintainer, and the tooling that has been built to support package management systems results in the expectation that someone (the package maintainer) will take responsibility for seeing that the sources are available. Tools that build binaries also collect the corresponding sources into an archive that can be delivered alongside the binaries. The result is that most people don't need to think about source code availability. The sources are available in the same unit as the delivery of the executable software and via the same distribution mechanism; for software delivered as an RPM, the corresponding source is available in a source RPM.

In contrast, there is no convention for providing the source code that corresponds to a container image.

The many software components in a container image often include GPL-licensed software. Companies that may not have much experience with distribution of FOSS software may begin distributing GPL-licensed software when they start offering their software in the form of container images. Let's make it straightforward for everyone, including companies who may be new to FOSS, to provide source code in a consistent way.

### Identification of the corresponding source code

Identifying the corresponding source code is more challenging for container images than it is for packages. For packages, the source is available to the person building the package (although there can be some challenges with the source for dependencies if a package is built to include dependencies, not merely refer to them). In contrast, container images are conventionally built using, mostly, previously compiled components. When the container image is built, the source for those software components may be readily at hand or not, depending on how the binaries were acquired and how they were built.

When we build a container image, we should collect the corresponding source code for each of the components used to build the image. If not when the image is built, then when? That collected source code should then become a logical part of the corresponding container image.

Making the corresponding source code available as a logical part of a container image, of course, facilitates compliance in the distribution of that image. But, also, that practice supports a compliant ecosystem. If someone builds on a base image, how do they know what source code might need to be made available? If container images have corresponding source images, then the solution is straightforward. It is not necessary to start by figuring out what is in the base. Rather, start source availability for the overall image by using the source image for the base.

Here is an opportunity to build compliance into the tools—when someone builds on a base image, the tools should make it easy for them to make the corresponding source available for the base, as well as what is built on top. Tools should create a source image corresponding to the final combined image by starting with the source image for the base and adding whatever source is appropriate for the software that is built on top of that base.

### Delivery

Suppose one has a list of the source code artifacts that correspond to a container image. Where is that list going to be hosted? Where are the source artifacts going to be hosted? If the container image is hosted on various registries, how is source code going to be made available for each of those distribution points? Is there work to be done in each registry or in each of the catalogs associated with the registries? How is someone pulling a container image from each of a number of different registries going to know where these materials are? How does this work at scale? How many mechanisms are needed?

We should build a container ecosystem with compliance that is portable across registries. One shouldn't need to get a new guidebook from each registry.

As mentioned above, the supporting software components in a container image often include software licensed under the GPL. Consider the various alternatives for meeting the source code availability requirement for commercial distribution of software via download: binaries accompanied by the source code; binaries accompanied by a written offer; or, equivalent access to copy. As to equivalent access option, let's look at [GPLv2, section 3][3], last paragraph: "If distribution of executable or object code is made by offering access to copy from a designated place, then **offering equivalent access to copy the source code from the same place** counts as distribution of the source code, even though third parties are not compelled to copy the source along with the object code."

Why deliver the source code through a container registry? Equivalent access, efficiency, and portability.

  * **Equivalent access**—A registry-native approach to source availability (making source for container images available as container images) is a good way of providing equivalent access to the source.
  * **Efficient compliance**—Creating a source availability "package" (a source image) when the executable image is built and then using the same tooling for making the source available avoids inefficiencies of maintaining additional processes and mechanisms for making the source available.
  * **Portability of compliance**—The same tooling that moves the executable images can be used to move, store, and serve the source images—on all hosting registries.



### A registry-native approach to source code availability

Delivering source through container registries exploits the design of the container image format and certain related characteristics of container registries.

A container image includes (see container image details in the two examples linked below):

  * an image manifest, which identifies the other elements of the image;
  * config data, which includes metadata about the image, including information used to configure the image for execution in a container;
  * a number of "layers" (each of which is a tar archive) that store the file system with which to provision a container.



Consider the challenge of making the corresponding source code available—a collection of source code artifacts (RPMs, zip files, tarballs, etc.) that we would like a server to make available. A container image is a list of components that a registry makes available. If the list of source artifacts is arranged as an image manifest, then a container registry can serve the source code artifacts like it serves other container image parts. And, tools for moving container images can be directly applied to move that compliance package (manifest plus the referenced source artifacts).

A source image (aka a source container) is simply a container image. Instead of the layers in the image being tarballs of files to provision a container for execution, each layer is a source artifact.

This concept of delivering non-file-system content from a container registry is of interest to container registries for other purposes, too, not just for source code. An example of non-layer content being served by container registries is Helm charts (used to describe a set of Kubernetes resources). The delivery of non-layer content via a container registry is the subject of the [Open Container Initiative's artifacts project][4].

### Deduplication

Container registries store and deliver an image as parts, rather than as a single digital object. This is valuable because container images are extremely redundant. Many images differ in a small fraction of their content. A container image can simplify data center operations by packaging together all of the components needed to run a particular program; as a result, container images are large, and each contains much content that is identical to other images in the registry. There can be 100-300 software components in an image, most of which are present in many other container images. Also, images are immutable. When an image needs to be updated, a new image is created that is almost identical to the prior version. This size challenge is mitigated by breaking archives for container file systems into multiple layers and using content-addressable storage.

That deduplication capability is advantageous in source code, too. The key to taking advantage of this registry feature is to not store all of the corresponding sources for an image in a single blob. More than 100:1 deduplication can be readily achieved if the source code is stored with the granularity of a separate source artifact for each of the hundred or more software components from which the image is built.

### Implementation

Red Hat has started the first of a two-stage approach to implementing registry-native delivery of source code.

In the first stage, Red Hat has started by producing source images that can be hosted on existing registries and will not confuse tools that expect all images to be executable. In this approach, source artifacts masquerade as regular layers—each source artifact is wrapped in a tar archive; the media types for the layers are the same as for a regular executable image. The source image is associated with the corresponding executable image by a naming convention.

The second stage involves taking advantage of certain OCI image format features.

Container images should be linked to the corresponding executable image(s) via the image index, rather than with a tag naming convention. The container image format makes it possible for a source image to literally be a part of the overall image of which the executable image is a part. Unrelated to source code, it is useful to be able to have images that are built for different processor architectures be part of a single overall image. That overall image can be managed as a single object, and a consumer of the image can select which version(s) and/or part(s) of the image to download (e.g., amd64, or arm64, or source). Thus, rather than associating the source with the corresponding executable image via a labeling convention, the source image manifest should be listed in the image index.

In addition, in the future, source artifacts should not masquerade as executable layer tar files; the extra wrapping of source artifacts in a tar archive should be eliminated, and the source artifacts should be identified with appropriate media types. Successful deduplication requires careful, consistent tar archives. Simply storing the source artifact directly (and marking it with an appropriate media type) reduces this potential deduplication loss from inconsistent tarball wrappers.

Finally, source artifacts in a registry should be consistent with the approach for other non-layer content in registries (such as Helm charts). Providing a consistent way to serve such content is the subject of the "artifacts" project within the Open Container Initiative. Registry-native distribution of source can be a beneficiary of that project.

#### In summary

The current approach (see the [current approach example][5]):

  * Source artifacts masquerade as regular layers—wrap each source artifact in a tarball and mark it with a regular layer media type.
  * Identify the name of a source artifact inside the tar wrapper.
  * Associate the source and executable images using a tag name convention—tag the source image manifest with the tag for the corresponding executable image extended with "-source."



The future approach (see the [future approach example][6]):

  * No masquerade—store source artifacts directly in the registry (named, as other registry content, by a hash digest) and give them non-layer media type(s).
  * Identify the name of a source artifact with a layer annotation in the manifest.
  * Associate the source and executable images using the image index—list the source manifest in the image index, along with manifests for each machine architecture.
  * Use a distinctive config. media type in source manifests (as proposed in the OCI artifacts project).



#### Where are we now?

Source "containers," which are actually images, for UBI images are in the Red Hat registry now. These source images have been built using production tools. The next step is to roll this out to other images.

#### Where are we going?

We need an industry-wide, consistent approach to making source code available for container images. Let's work together in the OCI's artifacts project and agree on the details of the no-masquerade approach.

### Opportunities

Including source code leads to opportunities. Making the full corresponding source code available as a corresponding source image can address more than merely GPL source availability:

  * The exact license for open source software can be complicated (see [Is open source software licensing broken?][7]). But, with the full source code, one can determine whatever details are important to them (see [The source code is the license][8]).
  * How about license notices? You could attempt to extract all of them. Or, you could make the notices available directly via the source code (see [An economically efficient model for open source software license compliance][9]).



--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/compliance-containers

作者：[Scott K Peterson][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/skpeterson
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus-containers2.png?itok=idd8duC_ (Shipping containers stacked in a yard)
[2]: https://opensource.com/article/18/7/whats-container-image-meeting-legal-challenges
[3]: https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html#section3
[4]: https://github.com/opencontainers/artifacts
[5]: https://blockchain-forensics.com/containers/current.svg
[6]: https://blockchain-forensics.com/containers/future.svg
[7]: https://opensource.com/article/20/2/open-source-licensing
[8]: https://opensource.com/article/17/12/source-code-license
[9]: https://opensource.com/article/17/9/economically-efficient-model

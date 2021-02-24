[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Unikraft: Pushing Unikernels into the Mainstream)
[#]: via: (https://www.linux.com/featured/unikraft-pushing-unikernels-into-the-mainstream/)
[#]: author: (Linux.com Editorial Staff https://www.linux.com/author/linuxdotcom/)

Unikraft: Pushing Unikernels into the Mainstream
======

![][1]

Unikernels have been around for many years and are famous for providing excellent performance in boot times, throughput, and memory consumption, to name a few metrics [1]. Despite their apparent potential, unikernels have not yet seen a broad level of deployment due to three main drawbacks:

  * **Hard to build**: Putting a unikernel image together typically requires expert, manual work that needs redoing for each application. Also, many unikernel projects are not, and don’t aim to be, POSIX compliant, and so significant porting effort is required to have standard applications and frameworks run on them.
  * **Hard to extract high performance**: Unikernel projects don’t typically expose high-performance APIs; extracting high performance often requires expert knowledge and modifications to the code.
  * **Little or no tool ecosystem**: Assuming you have an image to run, deploying it and managing it is often a manual operation. There is little integration with major DevOps or orchestration frameworks.



While not all unikernel projects suffer from all of these issues (e.g., some provide some level of POSIX compliance but the performance is lacking, others target a single programming language and so are relatively easy to build but their applicability is limited), we argue that no single project has been able to successfully address all of them, hindering any significant level of deployment. For the past three years, Unikraft ([www.unikraft.org][2]), a Linux Foundation project under the Xen Project’s auspices, has had the explicit aim to change this state of affairs to bring unikernels into the mainstream. 

If you’re interested, read on, and please be sure to check out:

  * The [replay of our two FOSDEM talks][3] [2,3] and the [virtual stand ][4]
  * Our website (unikraft.org) and source code (<https://github.com/unikraft>).
  * Our upcoming source code release, 0.5 Tethys (more information at <http://www.unikraft.org/release/>)
  * [unikraft.io][5], for industrial partners interested in Unikraft PoCs (or [info@unikraft.io][6])



### High Performance

To provide developers with the ability to obtain high performance easily, Unikraft exposes a set of composable, performance-oriented APIs. The figure below shows Unikraft’s architecture: all components are libraries with their own **Makefile** and **Kconfig** configuration files, and so can be added to the unikernel build independently of each other.

![][7]

**Figure 1. Unikraft ‘s fully modular architecture showing high-performance APIs**

APIs are also micro-libraries that can be easily enabled or disabled via a Kconfig menu; Unikraft unikernels can compose which APIs to choose to best cater to an application’s needs. For example, an RCP-style application might turn off the **uksched** API (➃ in the figure) to implement a high performance, run-to-completion event loop; similarly, an application developer can easily select an appropriate memory allocator (➅) to obtain maximum performance, or to use multiple different ones within the same unikernel (e.g., a simple, fast memory allocator for the boot code, and a standard one for the application itself). 

![][8] | ![][9]
---|---
**Figure 2. Unikraft memory consumption vs. other unikernel projects and Linux** | **Figure 3. Unikraft NGINX throughput versus other unikernels, Docker, and Linux/KVM.**

 

These APIs, coupled with the fact that all Unikraft’s components are fully modular, results in high performance. Figure 2, for instance, shows Unikraft having lower memory consumption than other unikernel projects (HermiTux, Rump, OSv) and Linux (Alpine); and Figure 3 shows that Unikraft outperforms them in terms of NGINX requests per second, reaching 90K on a single CPU core.

Further, we are working on (1) a performance profiler tool to be able to quickly identify potential bottlenecks in Unikraft images and (2) a performance test tool that can automatically run a large set of performance experiments, varying different configuration options to figure out optimal configurations.

### Ease of Use, No Porting Required

Forcing users to port applications to a unikernel to obtain high performance is a showstopper. Arguably, a system is only as good as the applications (or programming languages, frameworks, etc.) can run. Unikraft aims to achieve good POSIX compatibility; one way of doing so is supporting a **libc** (e.g., **musl)**, along with a large set of Linux syscalls. 

![][10]

**Figure 4. Only a certain percentage of syscalls are needed to support a wide range of applications**

While there are over 300 of these, many of them are not needed to run a large set of applications; as shown in Figure 1 (taken from [5]). Having in the range of 145, for instance, is enough to support 50% of all libraries and applications in a Ubuntu distribution (many of which are irrelevant to unikernels, such as desktop applications). As of this writing, Unikraft supports over 130 syscalls and a number of mainstream applications (e.g., SQLite, Nginx, Redis), programming languages and runtime environments such as C/C++, Go, Python, Ruby, Web Assembly, and Lua, not to mention several different hypervisors (KVM, Xen, and Solo5) and ARM64 bare-metal support.

### Ecosystem and DevOps

Another apparent downside of unikernel projects is the almost total lack of integration with existing, major DevOps and orchestration frameworks. Working towards the goal of integration, in the past year, we created the **kraft** tool, allowing users to choose an application and a target platform simply (e.g., KVM on x86_64) and take care of building the image running it.

Beyond this, we have several sub-projects ongoing to support in the coming months:

  * **Kubernetes**: If you’re already using Kubernetes in your deployments, this work will allow you to deploy much leaner, fast Unikraft images _transparently._
  * **Cloud Foundry**: Similarly, users relying on Cloud Foundry will be able to generate Unikraft images through it, once again transparently.
  * **Prometheus**: Unikernels are also notorious for having very primitive or no means for monitoring running instances. Unikraft is targeting Prometheus support to provide a wide range of monitoring capabilities. 



In all, we believe Unikraft is getting closer to bridging the gap between unikernel promise and actual deployment. We are very excited about this year’s upcoming features and developments, so please feel free to drop us a line if you have any comments, questions, or suggestions at [**info@unikraft.io**][6].

_**About the author: [Dr. Felipe Huici][11] is Chief Researcher, Systems and Machine Learning Group, NEC Laboratories Europe GmbH**_

### References

[1] Unikernels Rethinking Cloud Infrastructure. <http://unikernel.org/>

[2] Is the Time Ripe for Unikernels to Become Mainstream with Unikraft? FOSDEM 2021 Microkernel developer room. <https://fosdem.org/2021/schedule/event/microkernel_unikraft/>

[3] Severely Debloating Cloud Images with Unikraft. FOSDEM 2021 Virtualization and IaaS developer room. <https://fosdem.org/2021/schedule/event/vai_cloud_images_unikraft/>

[4] Welcome to the Unikraft Stand! <https://stands.fosdem.org/stands/unikraft/>

[5] A study of modern Linux API usage and compatibility: what to support when you’re supporting. Eurosys 2016. <https://dl.acm.org/doi/10.1145/2901318.2901341>

--------------------------------------------------------------------------------

via: https://www.linux.com/featured/unikraft-pushing-unikernels-into-the-mainstream/

作者：[Linux.com Editorial Staff][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/author/linuxdotcom/
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/wp-content/uploads/2021/02/unikraft.svg
[2]: http://www.unikraft.org
[3]: https://video.fosdem.org/2021/stands/unikraft/
[4]: https://stands.fosdem.org/stands/unikraft/
[5]: http://www.unikraft.io
[6]: mailto:info@unikraft.io
[7]: https://www.linux.com/wp-content/uploads/2021/02/unikraft1.png
[8]: https://www.linux.com/wp-content/uploads/2021/02/unikraft2.png
[9]: https://www.linux.com/wp-content/uploads/2021/02/unikraft3.png
[10]: https://www.linux.com/wp-content/uploads/2021/02/unikraft4.png
[11]: https://www.linkedin.com/in/felipe-huici-47a559127/

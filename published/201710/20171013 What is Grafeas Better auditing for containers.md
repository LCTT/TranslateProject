Grafeas：旨在更好地审计容器
============================================================

> Google 的 Grafeas 为容器的元数据提供了一个从镜像、构建细节到安全漏洞的通用 API。

![What is Grafeas? Better auditing for containers](https://images.techhive.com/images/article/2016/03/questions_analytics-100650053-primary.idge.jpg)
Thinkstock

我们运行的软件从来没有比今天更难获得。它分散在本地部署和云服务之间，由不知到有多少的开源组件构建而成，以快速的时间表交付，因此保证安全和质量变成了一个挑战。

最终的结果是软件难以审计、推断、安全化和管理。困难的不只是知道 VM 或容器是用什么构建的, 而是由谁来添加、删除或更改的。[Grafeas][5] 最初由 Google 设计，旨在使这些问题更容易解决。

### 什么是 Grafeas?

Grafeas 是一个定义软件组件的元数据 API 的开源项目。旨在提供一个统一的元数据模式，允许 VM、容器、JAR 文件和其他软件<ruby>工件<rt>artifact</rt></ruby>描述自己的运行环境以及管理它们的用户。目标是允许像在给定环境中使用的软件一样的审计，以及对该软件所做的更改的审计，并以一致和可靠的方式进行。

Grafeas提供两种格式的元数据 API —— 备注和事件：

* <ruby>备注<rt>note</rt></ruby>是有关软件工件的某些方面的细节。可以是已知软件漏洞的描述，有关如何构建软件的详细信息（构建器版本、校验和等），部署历史等。
* <ruby>事件<rt>occurrence</rt></ruby>是备注的实例，包含了它们创建的地方和方式的细节。例如，已知软件漏洞的详细信息可能会有描述哪个漏洞扫描程序检测到它的情况、何时被检测到的事件信息，以及该漏洞是否被解决。

备注和事件都存储在仓库中。每个备注和事件都使用标识符进行跟踪，该标识符区分它并使其唯一。

Grafeas 规范包括备注类型的几个基本模式。例如，软件包漏洞模式描述了如何存储 CVE 或漏洞描述的备注信息。现在没有接受新模式类型的正式流程，但是[这已经在计划][6]创建这样一个流程。

### Grafeas 客户端和第三方支持

现在，Grafeas 主要作为规范和参考形式存在，它在 [GitHub 上提供][7]。 [Go][8]、[Python][9] 和 [Java][10] 的客户端都可以[用 Swagger 生成][11]，所以其他语言的客户端也应该不难写出来。

Google 计划让 Grafeas 广泛使用的主要方式是通过 Kubernetes。 Kubernetes 的一个名为 Kritis 的策略引擎，可以根据 Grafeas 元数据对容器采取措施。

除 Google 之外的几家公司已经宣布计划将 Grafeas 的支持添加到现有产品中。例如，CoreOS 正在考察 Grafeas 如何与 Tectonic 集成，[Red Hat][12] 和 [IBM][13] 都计划在其容器产品和服务中添加 Grafeas 集成。

--------------------------------------------------------------------------------

via: https://www.infoworld.com/article/3230462/security/what-is-grafeas-better-auditing-for-containers.html

作者：[Serdar Yegulalp][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.infoworld.com/author/Serdar-Yegulalp/
[1]:https://www.infoworld.com/author/Serdar-Yegulalp/
[2]:https://www.infoworld.com/author/Serdar-Yegulalp/
[3]:https://www.infoworld.com/article/3207686/cloud-computing/how-to-get-started-with-kubernetes.html#tk.ifw-infsb
[4]:https://www.infoworld.com/newsletters/signup.html#tk.ifw-infsb
[5]:http://grafeas.io/
[6]:https://github.com/Grafeas/Grafeas/issues/38
[7]:https://github.com/grafeas/grafeas
[8]:https://github.com/Grafeas/client-go
[9]:https://github.com/Grafeas/client-python
[10]:https://github.com/Grafeas/client-java
[11]:https://www.infoworld.com/article/2902750/application-development/manage-apis-with-swagger.html
[12]:https://www.redhat.com/en/blog/red-hat-google-cloud-and-other-industry-leaders-join-together-standardize-kubernetes-service-component-auditing-and-policy-enforcement
[13]:https://developer.ibm.com/dwblog/2017/grafeas/
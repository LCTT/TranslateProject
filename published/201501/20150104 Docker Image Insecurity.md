Docker的镜像并不安全！
================================================================================
最近使用Docker下载“官方”容器镜像的时候，我发现这样一句话：

    ubuntu:14.04: The image you are pulling has been verified （您所拉取的镜像已经经过验证）

起初我以为这条信息引自Docker[大力推广][1]的镜像签名系统，因此也就没有继续跟进。后来，研究加密摘要系统的时候——Docker用这套系统来对镜像进行安全加固——我才有机会更深入的发现，逻辑上整个与镜像安全相关的部分具有一系列系统性问题。

Docker所报告的，一个已下载的镜像经过“验证”，它基于的仅仅是一个标记清单（signed manifest)，而Docker却从未据此清单对镜像的校验和进行验证。一名攻击者以此可以提供任意所谓具有标记清单的镜像。一系列严重漏洞的大门就此敞开。

镜像经由HTTPS服务器下载后，通过一个未加密的管道流进入Docker守护进程：

    [decompress] -> [tarsum] -> [unpack]

这条管道的性能没有问题，但是却完全没有经过加密。不可信的输入在签名验证之前是不应当进入管道的。不幸的是，Docker在上面处理镜像的三个步骤中，都没有对校验和进行验证。

然而，不论Docker如何[声明][2]，实际上镜像的校验和（Checksum）从未经过校验。下面是Docker与镜像校验和的验证相关的代码[片段][3]，即使我提交了校验和不匹配的镜像，都无法触发警告信息。

    if img.Checksum != "" && img.Checksum != checksum {
      log.Warnf("image layer checksum mismatch: computed %q,
                 expected %q", checksum, img.Checksum)
    }

### 不安全的处理管道 ###

**解压缩**

Docker支持三种压缩算法：gzip、bzip2和xz。前两种使用Go的标准库实现，是[内存安全（memory-safe)][4]的，因此这里我预计的攻击类型应该是拒绝服务类的攻击，包括CPU和内存使用上的当机或过载等等。

第三种压缩算法，xz，比较有意思。因为没有现成的Go实现，Docker 通过[执行(exec)][5]`xz`二进制命令来实现解压缩。

xz二进制程序来自于[XZ Utils][6]项目，由[大概][7]2万行C代码生成而来。而C语言不是一门内存安全的语言。这意味着C程序的恶意输入，在这里也就是Docker镜像的XZ Utils解包程序，潜在地存在可能会执行任意代码的风险。

Docker以root权限*运行* `xz` 命令，更加恶化了这一潜在威胁。这意味着如果在`xz`中出现了一个漏洞，对`docker pull`命令的调用就会导致用户整个系统的完全沦陷。

**Tarsum**

对tarsum的使用，其出发点是好的，但却是最大的败笔。为了得到任意一个加密tar文件的准确校验和，Docker先对tar文件进行解密，然后求出特定部分的哈希值，同时排除剩余的部分，而这些步骤的[顺序都是固定的][8]。

由于其生成校验和的步骤固定，它解码不可信数据的过程就有可能被设计成[攻破tarsum的代码][9]。这里潜在的攻击既包括拒绝服务攻击，还有逻辑上的漏洞攻击，可能导致文件被感染、忽略、进程被篡改、植入等等，这一切攻击的同时，校验和可能都是不变的。

**解包**

解包的过程包括tar解码和生成硬盘上的文件。这一过程尤其危险，因为在解包写入硬盘的过程中有另外三个[已报告的漏洞][10]。

任何情形下未经验证的数据都不应当解包后直接写入硬盘。

### libtrust ###

Docker的工具包[libtrust][11]，号称“通过一个分布式的信任图表进行认证和访问控制”。很不幸，对此官方没有任何具体的说明，看起来它好像是实现了一些[javascript对象标记和加密][12]规格以及其他一些未说明的算法。

使用libtrust下载一个清单经过签名和认证的镜像，就可以触发下面这条不准确的信息（说不准确，是因为事实上它验证的只是清单，并非真正的镜像）：

    ubuntu:14.04: The image you are pulling has been verified(您所拉取的镜像已经经过验证)

目前只有Docker公司“官方”发布的镜像清单使用了这套签名系统，但是上次我参加Docker[管理咨询委员会][13]的会议讨论时，我所理解的是，Docker公司正计划在未来扩大部署这套系统。他们的目标是以Docker公司为中心，控制一个认证授权机构，对镜像进行签名和（或）客户认证。

我试图从Docker的代码中找到签名秘钥，但是没找到。好像它并不像我们所期望的把密钥嵌在二进制代码中，而是在每次镜像下载前，由Docker守护进程[通过HTTPS从CDN][14]远程获取。这是一个多么糟糕的方案，有无数种攻击手段可能会将可信密钥替换成恶意密钥。这些攻击包括但不限于：CDN供应商出问题、CDN初始密钥出现问题、客户端下载时的中间人攻击等等。

### 补救 ###

研究结束前，我[报告][15]了一些在tarsum系统中发现的问题，但是截至目前我报告的这些问题仍然没有修复。

要改进Docker镜像下载系统的安全问题，我认为应当有以下措施：

**摒弃tarsum并且真正对镜像本身进行验证**

出于安全原因tarsum应当被摒弃，同时，镜像在完整下载后、其他步骤开始前，就对镜像的加密签名进行验证。

**添加权限隔离**

镜像的处理过程中涉及到解压缩或解包的步骤必须在隔离的进程（容器？）中进行，即只给予其操作所需的最小权限。任何场景下都不应当使用root运行`xz`这样的解压缩工具。

**替换 libtrust**

应当用[更新框架(The Update Framework)][16]替换掉libtrust，这是专门设计用来解决软件二进制签名此类实际问题的。其威胁模型非常全方位，能够解决libtrust中未曾考虑到的诸多问题，目前已经有了完整的说明文档。除了已有的Python实现，我已经开始着手用[Go语言实现][17]的工作，也欢迎大家的贡献。

作为将更新框架加入Docker的一部分，还应当加入一个本地密钥存储池，将root密钥与registry的地址进行映射，这样用户就可以拥有他们自己的签名密钥，而不必使用Docker公司的了。

我注意到使用非Docker公司官方的第三方仓库往往会是一种非常糟糕的用户体验。Docker也会将第三方的仓库内容降为二等地位来看待，即使不因为技术上的原因。这个问题不仅仅是生态问题，还是一个终端用户的安全问题。针对第三方仓库的全方位、去中心化的安全模型既必须又迫切。我希望Docker公司在重新设计他们的安全模型和镜像认证系统时能采纳这一点。

### 结论 ###

Docker用户应当意识到负责下载镜像的代码是非常不安全的。用户们应当只下载那些出处没有问题的镜像。目前，这里的“没有问题”并**不**包括Docker公司的“可信（trusted）”镜像，例如官方的Ubuntu和其他基础镜像。

最好的选择就是在本地屏蔽 `index.docker.io`，然后使用`docker load`命令在导入Docker之前手动下载镜像并对其进行验证。Red Hat的安全博客有一篇[很好的文章][18]，大家可以看看。

感谢Lewis Marshall指出tarsum从未真正验证。

参考

- [校验和的代码][19]
- [cloc][20]介绍了18141行没有空格没有注释的C代码，以及5900行的header代码，版本号为v5.2.0。
- [Android中也发现了][21]类似的bug，能够感染已签名包中的任意文件。同样出现问题的还有[Windows的Authenticode][22]认证系统，二进制文件会被篡改。
- 特别的：[CVE-2014-6407][23]、 [CVE-2014-9356][24]以及 [CVE-2014-9357][25]。目前已有两个Docker[安全发布][26]有了回应。
- 参见[2014-10-28 DGAB会议记录][27]的第8页。

--------------------------------------------------------------------------------

via: https://titanous.com/posts/docker-insecurity

作者：[titanous][a]
译者：[Mr小眼儿](http://blog.csdn.net/tinyeyeser)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://twitter.com/titanous
[1]:https://blog.docker.com/2014/10/docker-1-3-signed-images-process-injection-security-options-mac-shared-directories/
[2]:https://blog.docker.com/2014/10/docker-1-3-signed-images-process-injection-security-options-mac-shared-directories/
[3]:https://titanous.com/posts/docker-insecurity#fn:0
[4]:https://en.wikipedia.org/wiki/Memory_safety
[5]:https://github.com/docker/docker/blob/0874f9ab77a7957633cd835241a76ee4406196d8/pkg/archive/archive.go#L91-L95
[6]:http://tukaani.org/xz/
[7]:https://titanous.com/posts/docker-insecurity#fn:1
[8]:https://github.com/docker/docker/blob/0874f9ab77a7957633cd835241a76ee4406196d8/pkg/tarsum/tarsum_spec.md
[9]:https://titanous.com/posts/docker-insecurity#fn:2
[10]:https://titanous.com/posts/docker-insecurity#fn:3
[11]:https://github.com/docker/libtrust
[12]:https://tools.ietf.org/html/draft-ietf-jose-json-web-signature-11
[13]:https://titanous.com/posts/docker-insecurity#fn:4
[14]:https://github.com/docker/docker/blob/0874f9ab77a7957633cd835241a76ee4406196d8/trust/trusts.go#L38
[15]:https://github.com/docker/docker/issues/9719
[16]:http://theupdateframework.com/
[17]:https://github.com/flynn/go-tuf
[18]:https://securityblog.redhat.com/2014/12/18/before-you-initiate-a-docker-pull/
[19]:https://github.com/docker/docker/blob/0874f9ab77a7957633cd835241a76ee4406196d8/image/image.go#L114-L116
[20]:http://cloc.sourceforge.net/
[21]:http://www.saurik.com/id/17
[22]:http://blogs.technet.com/b/srd/archive/2013/12/10/ms13-098-update-to-enhance-the-security-of-authenticode.aspx
[23]:https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-6407
[24]:https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9356
[25]:https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9357
[26]:https://groups.google.com/d/topic/docker-user/nFAz-B-n4Bw/discussion
[27]:https://docs.google.com/document/d/1JfWNzfwptsMgSx82QyWH_Aj0DRKyZKxYQ1aursxNorg/edit?pli=1
介绍 Flashback，一个互联网模拟工具
============================================================

> Flashback 用于测试目的来模拟 HTTP 和 HTTPS 资源，如 Web 服务和 REST API。

 ![Introducing Flashback, an Internet mocking tool](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_Internet_Cables_520x292_0614_RD.png?itok=trjYWg6g "Introducing Flashback, an Internet mocking tool") 

在 LinkedIn，我们经常开发需要与第三方网站交互的 Web 应用程序。我们还采用自动测试，以确保我们的软件在发布到生产环境之前的质量。然而，测试只是在它可靠时才有用。

考虑到这一点，有外部依赖关系的测试是有很大的问题的，例如在第三方网站上。这些外部网站可能会没有通知地发生改变、遭受停机，或者由于互联网的不可靠性暂时无法访问。

如果我们的一个测试依赖于能够与第三方网站通信，那么任何故障的原因都很难确定。失败可能是因为 LinkedIn 的内部变更、第三方网站的维护人员进行的外部变更，或网络基础设施的问题。你可以想像，与第三方网站的交互可能会有很多失败的原因，因此你可能想要知道，我将如何处理这个问题？

好消息是有许多互联网模拟工具可以帮助。其中一个是 [Betamax][4]。它通过拦截 Web 应用程序发起的 HTTP 连接，之后进行重放的方式来工作。对于测试，Betamax 可以用以前记录的响应替换 HTTP 上的任何交互，它可以非常可靠地提供这个服务。

最初，我们选择在 LinkedIn 的自动化测试中使用 Betamax。它工作得很好，但我们遇到了一些问题：

*   出于安全考虑，我们的测试环境没有接入互联网。然而，与大多数代理一样，Betamax 需要 Internet 连接才能正常运行。
*   我们有许多需要使用身份验证协议的情况，例如 OAuth 和 OpenId。其中一些协议需要通过 HTTP 进行复杂的交互。为了模拟它们，我们需要一个复杂的模型来捕获和重放请求。

为了应对这些挑战，我们决定基于 Betamax 的思路，构建我们自己的互联网模拟工具，名为 Flashback。我们也很自豪地宣布 Flashback 现在是开源的。

### 什么是 Flashback?

Flashback 用于测试目的来模拟 HTTP 和 HTTPS 资源，如 Web 服务和 [REST][5] API。它记录 HTTP/HTTPS 请求并重放以前记录的 HTTP 事务 - 我们称之为“<ruby>场景<rt>scene</rt></ruby>”，这样就不需要连接到 Internet 才能完成测试。

Flashback 也可以根据请求的部分匹配重放场景。它使用的是“匹配规则”。匹配规则将传入请求与先前记录的请求相关联，然后将其用于生成响应。例如，以下代码片段实现了一个基本匹配规则，其中测试方法“匹配”[此 URL][6]的传入请求。

HTTP 请求通常包含 URL、方法、标头和正文。Flashback 允许为这些组件的任意组合定义匹配规则。Flashback 还允许用户向 URL 查询参数，标头和正文添加白名单或黑名单标签。

例如，在 OAuth 授权流程中，请求查询参数可能如下所示：

```
oauth_consumer_key="jskdjfljsdklfjlsjdfs",
oauth_nonce="ajskldfjalksjdflkajsdlfjasldfja;lsdkj",
oauth_signature="asdfjaklsdjflasjdflkajsdklf",
oauth_signature_method="HMAC-SHA1",
oauth_timestamp="1318622958",
oauth_token="asdjfkasjdlfajsdklfjalsdjfalksdjflajsdlfa",
oauth_version="1.0"
```

这些值许多将随着每个请求而改变，因为 OAuth 要求客户端每次为 `oauth_nonce` 生成一个新值。在我们的测试中，我们需要验证 `oauth_consumer_key`、`oauth_signature_method` 和 `oauth_version` 的值，同时确保 `oauth_nonce`、`oauth_signature`、`oauth_timestamp` 和 `oauth_token` 存在于请求中。Flashback 使我们有能力创建我们自己的匹配规则来实现这一目标。此功能允许我们测试随时间变化的数据、签名、令牌等的请求，而客户端没有任何更改。

这种灵活的匹配和在不连接互联网的情况下运行的功能是 Flashback 与其他模拟解决方案不同的特性。其他一些显著特点包括：

*   Flashback 是一种跨平台和跨语言解决方案，能够测试 JVM（Java虚拟机）和非 JVM（C++、Python 等）应用程序。
*   Flashback 可以随时生成 SSL/TLS 证书，以模拟 HTTPS 请求的安全通道。

### 如何记录 HTTP 事务

使用 Flashback 记录 HTTP 事务以便稍后重放是一个比较简单的过程。在我们深入了解流程之前，我们首先列出一些术语：

*   `Scene` ：场景存储以前记录的 HTTP 事务 (以 JSON 格式)，它可以在以后重放。例如，这里是一个[Flashback 场景][1]示例。
*   `Root Path` ：根路径是包含 Flashback 场景数据的目录的文件路径。
*   `Scene Name` ：场景名称是给定场景的名称。
*   `Scene Mode` ：场景模式是使用场景的模式, 即“录制”或“重放”。
*   `Match Rule` ：匹配规则确定传入的客户端请求是否与给定场景的内容匹配的规则。
*   `Flashback Proxy` ：Flashback 代理是一个 HTTP 代理，共有录制和重放两种操作模式。
*   `Host` 和 `Port` ：代理主机和端口。

为了录制场景，你必须向目的地址发出真实的外部请求，然后 HTTPS 请求和响应将使用你指定的匹配规则存储在场景中。在录制时，Flashback 的行为与典型的 MITM（中间人）代理完全相同 - 只有在重放模式下，连接流和数据流仅限于客户端和代理之间。

要实际看下 Flashback，让我们创建一个场景，通过执行以下操作捕获与 example.org 的交互：

1、 取回 Flashback 的源码：

```
git clone https://github.com/linkedin/flashback.git
```

2、 启动 Flashback 管理服务器：

```
./startAdminServer.sh -port 1234
```

3、 注意上面的 Flashback 将在本地端口 5555 上启动录制模式。匹配规则需要完全匹配（匹配 HTTP 正文、标题和 URL）。场景将存储在 `/tmp/test1` 下。

4、 Flashback 现在可以记录了，所以用它来代理对 example.org 的请求：

```
curl http://www.example.org -x localhost:5555 -X GET
```

5、 Flashback 可以（可选）在一个记录中记录多个请求。要完成录制，[关闭 Flashback][8]。

6、 要验证已记录的内容，我们可以在输出目录（`/tmp/test1`）中查看场景的内容。它应该[包含以下内容][9]。

[在 Java 代码中使用 Flashback][10]也很容易。

### 如何重放 HTTP 事务

要重放先前存储的场景，请使用与录制时使用的相同的基本设置。唯一的区别是[将“场景模式”设置为上述步骤 3 中的“播放”][11]。

验证响应来自场景而不是外部源的一种方法，是在你执行步骤 1 到 6 时临时禁用 Internet 连接。另一种方法是修改场景文件，看看响应是否与文件中的相同。

这是 [Java 中的一个例子][12]。

### 如何记录并重播 HTTPS 事务

使用 Flashback 记录并重放 HTTPS 事务的过程非常类似于 HTTP 事务的过程。但是，需要特别注意用于 HTTPS SSL 组件的安全证书。为了使 Flashback 作为 MITM 代理，必须创建证书颁发机构（CA）证书。在客户端和 Flashback 之间创建安全通道时将使用此证书，并允许 Flashback 检查其代理的 HTTPS 请求中的数据。然后将此证书存储为受信任的源，以便客户端在进行调用时能够对 Flashback 进行身份验证。有关如何创建证书的说明，有很多[类似这样][13]的资源是非常有帮助的。大多数公司都有自己的管理和获取证书的内部策略 - 请务必用你们自己的方法。

这里值得一提的是，Flashback 仅用于测试目的。你可以随时随地将 Flashback 与你的服务集成在一起，但需要注意的是，Flashback 的记录功能将需要存储所有的数据，然后在重放模式下使用它。我们建议你特别注意确保不会无意中记录或存储敏感成员数据。任何可能违反贵公司数据保护或隐私政策的行为都是你的责任。

一旦涉及安全证书，HTTP 和 HTTPS 之间在记录设置方面的唯一区别是添加了一些其他参数。

*   `RootCertificateInputStream`： 表示 CA 证书文件路径或流。
*   `RootCertificatePassphrase`： 为 CA 证书创建的密码。
*   `CertificateAuthority`： CA 证书的属性

[查看 Flashback 中用于记录 HTTPS 事务的代码][14]，它包括上述条目。

用 Flashback 重放 HTTPS 事务的过程与录制相同。唯一的区别是场景模式设置为“播放”。这在[此代码][15]中演示。

### 支持动态修改

为了测试灵活性，Flashback 允许你动态地更改场景和匹配规则。动态更改场景允许使用不同的响应（如 `success`、`time_out`、`rate_limit` 等）测试相同的请求。[场景更改][16]仅适用于我们已经 POST 更新外部资源的场景。以下图为例。

 ![Scenarios where we have POSTed data to update the external resource.](https://opensource.com/sites/default/files/changingscenes.jpg "Scenarios where we have POSTed data to update the external resource.") 

能够动态[更改匹配规则][17]可以使我们测试复杂的场景。例如，我们有一个使用情况，要求我们测试 Twitter 的公共和私有资源的 HTTP 调用。对于公共资源，HTTP 请求是不变的，所以我们可以使用 “MatchAll” 规则。然而，对于私人资源，我们需要使用 OAuth 消费者密码和 OAuth 访问令牌来签名请求。这些请求包含大量具有不可预测值的参数，因此静态 MatchAll 规则将无法正常工作。

### 使用案例

在 LinkedIn，Flashback 主要用于在集成测试中模拟不同的互联网提供商，如下图所示。第一张图展示了 LinkedIn 生产数据中心内的一个内部服务，通过代理层，与互联网提供商（如 Google）进行交互。我们想在测试环境中测试这个内部服务。

 ![Testing this internal service in a testing environment.](https://opensource.com/sites/default/files/testingenvironment.jpg "Testing this internal service in a testing environment.") 

第二和第三张图表展示了我们如何在不同的环境中录制和重放场景。记录发生在我们的开发环境中，用户在代理启动的同一端口上启动 Flashback。从内部服务到提供商的所有外部请求将通过 Flashback 而不是我们的代理层。在必要场景得到记录后，我们可以将其部署到我们的测试环境中。

 ![After the necessary scenes get recorded, we can deploy them to our test environment.](https://opensource.com/sites/default/files/testenvironmentimage2.jpg "After the necessary scenes get recorded, we can deploy them to our test environment.") 

在测试环境（隔离并且没有 Internet 访问）中，Flashback 在与开发环境相同的端口上启动。所有 HTTP 请求仍然来自内部服务，但响应将来自 Flashback 而不是 Internet 提供商。

 ![Responses will come from Flashback instead of the Internet providers.](https://opensource.com/sites/default/files/flashbackresponsesimage.jpg "Responses will come from Flashback instead of the Internet providers.") 

### 未来方向

我们希望将来可以支持非 HTTP 协议（如 FTP 或 JDBC），甚至可以让用户使用 MITM 代理框架来自行注入自己的定制协议。我们将继续改进 Flashback 设置 API，使其更容易支持非 Java 语言。

### 现在为一个开源项目

我们很幸运能够在 GTAC 2015 上发布 Flashback。在展会上，有几名观众询问是否将 Flashback 作为开源项目发布，以便他们可以将其用于自己的测试工作。

### Google TechTalks：GATC 2015 - 模拟互联网

<iframe allowfullscreen="" frameborder="0" height="315" src="https://www.youtube.com/embed/6gPNrujpmn0?origin=https://opensource.com&amp;enablejsapi=1" width="560" id="6gPNrujpmn0" data-sdi="true"></iframe>

我们很高兴地宣布，Flashback 现在以 BSD 两句版许可证开源。要开始使用，请访问 [Flashback GitHub 仓库][18]。

 _该文原始发表在[LinkedIn 工程博客上][2]。获得转载许可_ 

### 致谢

Flashback 由 [Shangshang Feng][19]、[Yabin Kang][20] 和 [Dan Vinegrad][21] 创建，并受到 [Betamax][22] 启发。特别感谢 [Hwansoo Lee][23]、[Eran Leshem][24]、[Kunal Kandekar][25]、[Keith Dsouza][26] 和 [Kang Wang][27] 帮助审阅代码。同样感谢我们的管理层 - [Byron Ma][28]、[Yaz Shimizu][29]、[Yuliya Averbukh][30]、[Christopher Hazlett][31] 和 [Brandon Duncan][32] - 感谢他们在开发和开源 Flashback 中的支持。


（题图：Opensource.com）

--------------------------------------------------------------------------------

作者简介：

Shangshang Feng - Shangshang 是 LinkedIn 纽约市办公室的高级软件工程师。在 LinkedIn 他从事了三年半的网关平台工作。在加入 LinkedIn 之前，他曾在 Thomson Reuters 和 ViewTrade 证券的基础设施团队工作。

---------

via: https://opensource.com/article/17/4/flashback-internet-mocking-tool

作者：[Shangshang Feng][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/shangshangfeng
[1]:https://gist.github.com/anonymous/17d226050d8a9b79746a78eda9292382
[2]:https://engineering.linkedin.com/blog/2017/03/flashback-mocking-tool
[3]:https://opensource.com/article/17/4/flashback-internet-mocking-tool?rate=Jwt7-vq6jP9kS7gOT6f6vgwVlZupbyzWsVXX41ikmGk
[4]:https://github.com/betamaxteam/betamax
[5]:https://en.wikipedia.org/wiki/Representational_state_transfer
[6]:https://gist.github.com/anonymous/91637854364287b38897c0970aad7451
[7]:https://gist.github.com/anonymous/2f5271191edca93cd2e03ce34d1c2b62
[8]:https://gist.github.com/anonymous/f899ebe7c4246904bc764b4e1b93c783
[9]:https://gist.github.com/sf1152/c91d6d62518fe62cc87157c9ce0e60cf
[10]:https://gist.github.com/anonymous/fdd972f1dfc7363f4f683a825879ce19
[11]:https://gist.github.com/anonymous/ae1c519a974c3bc7de2a925254b6550e
[12]:https://gist.github.com/anonymous/edcc1d60847d51b159c8fd8a8d0a5f8b
[13]:https://jamielinux.com/docs/openssl-certificate-authority/introduction.html
[14]:https://gist.github.com/anonymous/091d13179377c765f63d7bf4275acc11
[15]:https://gist.github.com/anonymous/ec6a0fd07aab63b7369bf8fde69c1f16
[16]:https://gist.github.com/anonymous/1f1660280acb41277fbe2c257bab2217
[17]:https://gist.github.com/anonymous/0683c43f31bd916b76aff348ff87f51b
[18]:https://github.com/linkedin/flashback
[19]:https://www.linkedin.com/in/shangshangfeng
[20]:https://www.linkedin.com/in/benykang
[21]:https://www.linkedin.com/in/danvinegrad/
[22]:https://github.com/betamaxteam/betamax
[23]:https://www.linkedin.com/in/hwansoo/
[24]:https://www.linkedin.com/in/eranl/
[25]:https://www.linkedin.com/in/kunalkandekar/
[26]:https://www.linkedin.com/in/dsouzakeith/
[27]:https://www.linkedin.com/in/kang-wang-44960b4/
[28]:https://www.linkedin.com/in/byronma/
[29]:https://www.linkedin.com/in/yazshimizu/
[30]:https://www.linkedin.com/in/yuliya-averbukh-818a41/
[31]:https://www.linkedin.com/in/chazlett/
[32]:https://www.linkedin.com/in/dudcat/
[33]:https://opensource.com/user/125361/feed
[34]:https://opensource.com/users/shangshangfeng

[使用 OctoDNS 启用 DNS 划分权威][1]
============================================================

构建鲁棒的系统涉及故障涉及。作为 GitHub 的网站可靠性工程师，我们一直在寻找冗余来帮助减轻问题，今天将讨论最近我们如何通过 DNS 来查找服务器的步骤。

大型 [DNS][4] 提供商在其服务中建立了很多级别的冗余，但会出现导致中断的问题，但可以采取措施来减轻其影响。最佳选择之一是在多个提供商中为你的区域划分权威。启用划分权威很直接，你只需在注册商中配置两套或多套你区域的[名称服务器][5]集合，接着 DNS 请求将在整个列表中被分割。但是，你必须将这些区域的记录保持在多个提供商之间同步，并依赖于详细信息，这可能是设置复杂或完全手动的过程。

```
$ dig NS github.com. @a.gtld-servers.net.

...

;; QUESTION SECTION:
;github.com.			IN	NS

;; AUTHORITY SECTION:
github.com.		172800	IN	NS	ns4.p16.dynect.net.
github.com.		172800	IN	NS	ns-520.awsdns-01.net.
github.com.		172800	IN	NS	ns1.p16.dynect.net.
github.com.		172800	IN	NS	ns3.p16.dynect.net.
github.com.		172800	IN	NS	ns-421.awsdns-52.com.
github.com.		172800	IN	NS	ns-1283.awsdns-32.org.
github.com.		172800	IN	NS	ns2.p16.dynect.net.
github.com.		172800	IN	NS	ns-1707.awsdns-21.co.uk.

...

```

上面的查询是向 [TLD 名称服务器][6] 询问 `github.com.` 的 `NS` 记录。它返回在我们在注册商中配置的值，在本例中，一共有两个提供商，每个四条记录。如果其中一个提供商发生中断，那么其他的仍有希望可以提供服务请求。我们在不同的地方同步记录，并且可以安全地转换到他们，而不必担心陈旧或不正确的状态。

完全配置划分权威的最后一部分是将所有名称服务器作为顶层 `NS` 记录添加到两个提供商的区域的根中。

```
$ dig NS github.com. @ns1.p16.dynect.net.

...

;; QUESTION SECTION:
;github.com.			IN	NS

;; ANSWER SECTION:
github.com.		551	IN	NS	ns1.p16.dynect.net.
github.com.		551	IN	NS	ns2.p16.dynect.net.
github.com.		551	IN	NS	ns-520.awsdns-01.net.
github.com.		551	IN	NS	ns3.p16.dynect.net.
github.com.		551	IN	NS	ns-421.awsdns-52.com.
github.com.		551	IN	NS	ns4.p16.dynect.net.
github.com.		551	IN	NS	ns-1283.awsdns-32.org.
github.com.		551	IN	NS	ns-1707.awsdns-21.co.uk.

```

在 GitHub，我们有几十个区域和数千条记录，而大多数这些区域不够关键而不需要冗余，在这上我们有一个公平的数字。我们希望有能够在多个提供商中保持这些记录同步的方案，并且更一般地管理内部和外部的所有 DNS 记录。所以今天我们宣布 [OctoDNS][7]。

![octoDNS logo](https://githubengineering.com/images/enabling-split-authority-dns-with-octodns/octodns-logo.png)

#### 配置

OctoDNS 能够改进我们的 DNS 工作流程。我们的区域和记录存储在 Git 仓库的配置文件中。变更使用[ GitHub 流][8]，[分支部署就像站点][9]。我们甚至可以做 “noop” 部署来预览哪些记录将被修改。配置文件是 yaml 字典，每个区域一个，它的顶层密钥是记录名，值是 ttl、类型和特定类型数据。例如，当包含在区域文件 `github.com.yaml` 中时，以下配置将创建 `A` 记录 `octodns.github.com.`。

```
octodns:
  type: A
  values:
    - 1.2.3.4
    - 1.2.3.5

```

第二条配置将记录数据源映射到提供商。下面的代码段告诉 OctoDNS 从 `config` 提供程序加载区域 `github.com`，并将结果同步到 `dyn` 和 `route53`。

```
zones:
  github.com.:
    sources:
      - config
    targets:
      - dyn
      - route53

```

#### 同步

一旦我们的配置完成，OctoDNS 就可以评估当前的状态，并建立一个计划，其中列出将需要将目标状态与源相匹配的一组更改。在下面的例子中，`octodns.github.com`是一个新的记录，所以必要的操作是在两者中创建记录。

```
$ octodns-sync --config-file=./config/production.yaml
...
********************************************************************************
* github.com.
********************************************************************************
* route53 (Route53Provider)
*   Create <ARecord A 60, octodns.github.com., [u'1.2.3.4', '1.2.3.5']>
*   Summary: Creates=1, Updates=0, Deletes=0, Existing Records=0
* dyn (DynProvider)
*   Create <ARecord A 60, octodns.github.com., [u'1.2.3.4', '1.2.3.5']>
*   Summary: Creates=1, Updates=0, Deletes=0, Existing Records=0
********************************************************************************
...

```

默认情况下 `octodns-sync` 处于 dry 运行模式，因此不会采取任何行动。一旦我们审阅了变更，并对它们感到满意，我们可以再次运行命令，并添加 `--doit' 标志。OctoDNS 将继续它的流程，这一次将在 Route53 和 Dynect 中进行必要的更改，以便新的记录存在。

```
$ octodns-sync --config-file=./config/production.yaml --doit
...

```

这时我们将在两个提供商之间有相同的数据记录，并可以轻松地划分我们的 DNS 请求，并知道他们将提供准确的结果。当我们直接运行上面的 OctoDNS 命令时，我们的内部工作流程依赖于部署脚本和 chatops。你可以在[ README 的工作流程部分][10]中找到更多信息。

#### 总结

我们认为大多数网站可以从划分权威中受益，并且希望用 [OctoDNS][11]，其中最大的障碍已被扫除。即使对划分权威不感兴趣，OctoDNS 仍然值得一看，因为它将[基础设施即代码][12]的好处带给了 DNS。

想帮助 GitHub SRE 团队解决有趣的问题吗？我们很乐意加入我们。[在这里申请][13]。

--------------------------------------------------------------------------------

via: https://githubengineering.com/enabling-split-authority-dns-with-octodns/

作者：[ross ][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://github.com/ross
[1]:https://githubengineering.com/enabling-split-authority-dns-with-octodns/
[2]:https://github.com/ross
[3]:https://github.com/ross
[4]:https://en.wikipedia.org/wiki/Domain_Name_System
[5]:https://en.wikipedia.org/wiki/Name_server
[6]:https://en.wikipedia.org/wiki/Top-level_domain
[7]:https://github.com/github/octodns/
[8]:https://guides.github.com/introduction/flow/
[9]:https://githubengineering.com/deploying-branches-to-github-com/
[10]:https://github.com/github/octodns#workflow
[11]:https://github.com/github/octodns/
[12]:https://en.wikipedia.org/wiki/Infrastructure_as_Code
[13]:https://boards.greenhouse.io/github/jobs/669805#.WPVqJlPyvUI

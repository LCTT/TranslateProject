使用 OctoDNS 启用 DNS 分割权威
============================================================

构建一个健壮的系统需要为故障而设计。作为 GitHub 的网站可靠性工程师（SRE），我们一直在寻求通过冗余来帮助缓解问题，今天将讨论最近我们所做的工作，以便支持你通过 DNS 来查找我们的服务器。

大型 [DNS][4] 提供商在其服务中构建了多级冗余，出现导致中断的问题时，可以采取措施来减轻其影响。最佳选择之一是把你的<ruby>区域<rt>zone</rt></ruby>的权威服务分割到多个服务提供商中。启用<ruby>分割权威<rt>split authority</rt></ruby>很简单，你只需在域名注册商配置两套或多套你区域的[名称服务器][5]，然后 DNS 请求将分割到整个列表中。但是，你必须在多个提供商之间对这些区域的记录保持同步，并且，根据具体情况这可能要么设置复杂，要么是完全手动的过程。

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

上面的查询是向 [TLD 名称服务器][6] 询问 `github.com.` 的 `NS` 记录。它返回了在我们在域名注册商中配置的值，在本例中，一共有两个 DNS 服务提供商，每个四条记录。如果其中一个提供商发生中断，那么其它的仍有希望可以服务请求。我们在各个地方同步记录，并且可以安全地修改它们，而不必担心数据陈旧或状态不正确。

完整地配置分割权威的最后一部分是在两个 DNS  服务提供商中将所有名称服务器作为顶层 `NS` 记录添加到区域的根中。

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

在 GitHub，我们有几十个区域和数千条记录，而大多数这些区域并没有关键到需要冗余，因此我们只需要处理一部分。我们希望有能够在多个 DNS 服务提供商中保持这些记录同步的方案，并且更一般地管理内部和外部的所有 DNS 记录。所以今天我们宣布了 [OctoDNS][7]。

![octoDNS logo](https://githubengineering.com/images/enabling-split-authority-dns-with-octodns/octodns-logo.png)

### 配置

OctoDNS 能够让我们重新打造我们的 DNS 工作流程。我们的区域和记录存储在 Git 仓库的配置文件中。对它们的变更使用 [GitHub 流][8]，并[像个站点一样用分支部署][9]。我们甚至可以做个 “空” 部署来预览哪些记录将在变更中修改。配置文件是 yaml 字典，每个区域一个，它的顶层的键名是记录名称，键值是 ttl、类型和类型特定的数据。例如，当包含在区域文件 `github.com.yaml` 中时，以下配置将创建 `octodns.github.com.` 的  `A` 记录。

```
octodns:
  type: A
  values:
    - 1.2.3.4
    - 1.2.3.5

```

配置的第二部分将记录数据的源映射到 DNS 服务提供商。下面的代码片段告诉 OctoDNS 从 `config` 提供程序加载区域 `github.com`，并将其结果同步到 `dyn` 和 `route53`。

```
zones:
  github.com.:
    sources:
      - config
    targets:
      - dyn
      - route53

```

### 同步

一旦我们的配置完成，OctoDNS 就可以评估当前的状态，并建立一个计划，其中列出将需要将目标状态与源相匹配的一组更改。在下面的例子中，`octodns.github.com` 是一个新的记录，所以所需的操作是在两者中创建记录。

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

默认情况下 `octodns-sync` 处于模拟运行模式，因此不会采取任何行动。一旦我们审阅了变更，并对它们感到满意，我们可以添加 `--doit' 标志并再次运行命令。OctoDNS 将继续它的处理流程，这一次将在 Route53 和 Dynect 中进行必要的更改，以便创建新的记录。

```
$ octodns-sync --config-file=./config/production.yaml --doit
...

```

此刻，在两个 DNS 服务提供商里我们有了相同的数据记录，并可以轻松地分割我们的 DNS 请求给它们，并知道它们将提供准确的结果。当我们直接运行上面的 OctoDNS 命令时，我们的内部工作流程依赖于部署脚本和 chatops。你可以在 [README 的工作流程部分][10]中找到更多信息。

### 总结

我们认为大多数网站可以从分割权威中受益，并且希望用 [OctoDNS][11]，其中最大的障碍已被扫除。即使对分割权威不感兴趣，OctoDNS 仍然值得一看，因为它将[基础设施即代码][12]的好处带给了 DNS。

想帮助 GitHub SRE 团队解决有趣的问题吗？我们很乐意加入我们。[在这里申请][13]。

--------------------------------------------------------------------------------

via: https://githubengineering.com/enabling-split-authority-dns-with-octodns/

作者：[Ross McFarland][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

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

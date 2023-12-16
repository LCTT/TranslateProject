[#]: subject: "A Web Application Firewall for Nginx"
[#]: via: "https://fedoramagazine.org/a-web-application-firewall-for-nginx/"
[#]: author: "Roman Gherta https://fedoramagazine.org/author/romangherta/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16479-1.html"

为 Nginx 配置 ModSecurity 网络应用防火墙
======

![][0]

> 网络应用防火墙（WAF）是一种在应用层监控网络流量的应用程序。

[OSI（开放系统互联）][6] 是最常被网络相关讨论引用的网络流量框架之一。当数据包通过第 6 层（表示层）移动到第 7 层（应用层）时，它会进行解密或解码操作。这些操作可能会因异常解码和解释而产生漏洞，而这些漏洞可能被利用来打破标准应用上下文。注入就是这种漏洞的一种类型，而且因为传统的 [IDS/IPS][7] 设备无法应对这些威胁，所以其长时间以来一直是人们特别关注的问题。

### ModSecurity 简介

[ModSecurity][8] 本质上就是 <ruby>网络应用防火墙<rt>web application firewall</rt></ruby>（WAF）引擎。它与 Apache、IIS 和 Nginx 兼容，并由第三方公司维护。该防火墙会将一份规则列表与由 Web 服务器/代理提供的 HTTP 头流进行交叉引用。目前这个仓库已经被简化，只包含主要的 LibModSecurity 库。你可以直接在自己的服务器实现中调用这个库，或通过特定编程语言的封装进行调用。

其母公司的支持计划于 2024 年 7 月 1 日结束，之后这个项目将由开源社区维护。

### 安装 Nginx 连接器

[Nginx 连接器][9] 是一个 Nginx 动态模块，可以通过 Fedora 包 `nginx-mod-modsecurity` 进行安装。它依赖于 `libmodsecurity.so`，所以在这个使用场景中，这个包本身就是防火墙。

```
[user@fedora ~]$ sudo dnf install -y nginx nginx-mod-modsecurity
[user@fedora ~]$ rpm -qR nginx-mod-modsecurity
config(nginx-mod-modsecurity) = 1.0.3-3.fc38
libc.so.6(GLIBC_2.4)(64bit)
libmodsecurity.so.3()(64bit)
nginx(abi) = 1.24.0
nginx-filesystem
...
```

安装完成后，你会见到连接器在 `/etc/nginx` 中添加了一些重要的文件。

```
[user@fedora ~]$ rpm -ql nginx-mod-modsecurity
/etc/nginx/modsecurity.conf                   # waf 配置
/etc/nginx/nginx.conf.modsecurity             # nginx 示例配置
/usr/lib64/nginx/modules/ngx_http_modsecurity_module.so
/usr/share/nginx/modules/mod-modsecurity.conf
/usr/share/doc/nginx-mod-modsecurity/README.md
...
```

通过提供一些额外的配置指令，连接器对 Nginx 进行了扩展。下面的部分将演示 `nginx.conf.modsecurity` 文件中一些示例指令。指令的完整列表可以在 `README.md` 文件或项目的 GitHub 页面找到。

### 启动网络应用防火墙

`nginx.conf.modsecurity` 是我们将要运行的 Nginx 配置。解开如下所示的 *modsecurity* 行注释：

```
[user@fedora ~]$ sudo sed -i 's/#modsec/modsec/g' /etc/nginx/nginx.conf.modsecurity
[user@fedora ~]$ grep -C2 modsecurity /etc/nginx/nginx.conf.modsecurity
        # 如有需要，启用 ModSecurity WAF
        modsecurity on;
        # 如有需要，加载 ModSecurity CRS
        modsecurity_rules_file /etc/nginx/modsecurity.conf;
```

在 shell 中启动服务器并查看日志，确保在 `modsecurity.conf` 加载了七个默认规则。

```
[user@fedora ~]$ sudo nginx -c /etc/nginx/nginx.conf.modsecurity
[user@fedora ~]$ head /var/log/nginx/error.log
2023/10/21 23:55:09 [notice] 46218#46218: ModSecurity-nginx v1.0.3 (rules loaded inline/local/remote: 0/7/0)
2023/10/21 23:55:09 [notice] 46218#46218: using the "epoll" event method
2023/10/21 23:55:09 [notice] 46218#46218: nginx/1.24.0
2023/10/21 23:55:09 [notice] 46218#46218: OS: Linux 6.5.7-200.fc38.x86_64
```

通过发送一些不符合 `Content-Type` 头格式的数据来测试默认规则。

```
[user@fedora ~]$ curl -X POST http://localhost -H "Content-Type: application/json" --data "<xml></xml>"
[user@fedora ~]$ tail /var/log/modsec_audit.log
...
---rH5bFain---H--
ModSecurity: Warning. Matched "Operator `Eq' with parameter `0' against variable `REQBODY_ERROR' (Value: `1' ) [file "/etc/nginx/modsecurity.conf"] [line "75"] [id "200002"] [rev ""] [msg "Failed to parse request body."] [data "JSON parsing error: lexical error: invalid char in json text.\n"] [severity "2"] [ver ""] [maturity "0"] [accuracy "0"] [hostname "10.0.2.100"] [uri "/"] [unique_id "169795900388.487044"] [ref "v121,1"]
```

### 用 OWASP 核心规则集扩展你的网络应用防火墙

默认的 Nginx 连接器带有七条规则。OWASP [Core Rule Set v3.3.5][10] 则更为详尽，涵盖了许多场景。

复制并提取规则的存档。

```
[user@fedora ~]$ curl -fSL https://github.com/coreruleset/coreruleset/archive/refs/tags/v3.3.5.tar.gz --output /tmp/v3.3.5.tar.gz
[user@fedora ~]$ sudo tar -C /etc/nginx -xvf /tmp/v3.3.5.tar.gz
[user@fedora ~]$ tree -L 1 /etc/nginx/
/etc/nginx/
├── conf.d
├── default.d
├── modsecurity.conf          # waf 配置
├── nginx.conf
├── nginx.conf.modsecurity    # nginx 启用 waf
├── coreruleset-3.3.5
├   ├── rules                 # 规则目录
├       ...
├   ...
```

现在，你在 Nginx 配置文件夹中有了一个包含所有当前 OWASP 规则的 `rules` 目录。接下来，让 Nginx 知道这些规则。以下操作指南来源于 OWASP [INSTALL][11] 文件。

创建一个 `crs.conf` 文件，并在全局网络应用防火墙配置文件（ `modsecurity.conf` ）中包含所有相关的配置文件。

```
[user@fedora ~]$ sudo cp /etc/nginx/coreruleset-3.3.5/crs-setup.conf.example /etc/nginx/coreruleset-3.3.5/crs.conf
[user@fedora ~]$ echo -e "\nInclude /etc/nginx/coreruleset-3.3.5/crs.conf"  | sudo tee -a /etc/nginx/modsecurity.conf
[user@fedora ~]$ echo -e "\nInclude /etc/nginx/coreruleset-3.3.5/rules/*.conf" | sudo tee -a /etc/nginx/modsecurity.conf
[user@fedora ~]$ tail /etc/nginx/modsecurity.conf
Include /etc/nginx/coreruleset-3.3.5/crs.conf
Include /etc/nginx/coreruleset-3.3.5/rules/*.conf
```

根据文档，包含这些文件的顺序很重要。上面的 `tee` 的命令将新的 `Include` 行放在了 `modsecurity.conf` 文件的末尾。现在，用这个新配置重启 Nginx。

```
[user@fedora ~]$ sudo nginx -s stop && sudo nginx -c /etc/nginx/nginx.conf.modsecurity
[user@fedora ~]$ tail /var/log/nginx/error.log
2023/10/22 10:53:23 [notice] 202#202: exit
2023/10/22 10:53:50 [notice] 230#230: ModSecurity-nginx v1.0.3 (rules loaded inline/local/remote: 0/921/0)
2023/10/22 10:53:50 [notice] 230#230: using the "epoll" event method
2023/10/22 10:53:50 [notice] 230#230: nginx/1.24.0
2023/10/22 10:53:50 [notice] 230#230: OS: Linux 6.5.7-200.fc38.x86_64
2023/10/22 10:53:50 [notice] 230#230: getrlimit(RLIMIT_NOFILE): 524288:524288
2023/10/22 10:53:50 [notice] 231#231: start worker processes
```

注意，Nginx 成功加载了 921 条规则。还需要做一些测试来确保规则实际上是被网络应用防火墙检查过的。这里再次引用 `INSTALL` 文件中的 “Testing the Installation” 片段。

```
[user@fedora ~]$ curl 'http://localhost/?param=''><script>alert(1);</script>'
[user@fedora ~]$ tail /var/log/modsec_audit.log
...
---8NSpdnLe---H--
ModSecurity: Warning. detected XSS using libinjection. [file "/etc/nginx/coreruleset-3.3.5/rules/REQUEST-941-APPLICATION-ATTACK-XSS.conf"] [line "38"] [id "941100"] [rev ""] [msg "XSS Attack Detected via libinjection"] [data "Matched Data: XSS data found within ARGS:param: ><script>alert(1);</script>"] [severity "2"] [ver "OWASP_CRS/3.3.5"]
...
```

### 结论

本文演示了如何为 Nginx 服务器配置网络应用防火墙。这个部署使用了标准规则和 OWASP Core Rule Set v3.3.5。演示的防火墙在**检测模式**中运行并记录不寻常的行为。将防火墙运行在**防御模式**要对 `modsecurity.conf` 进行更多改动。请参考 [ModSecurity Reference Manual v3.x][12] 获取如何启用防御模式和更多信息。

祝你好运。

*（题图：DA/7ec85bc4-b209-4fc6-9275-8f7d1430f6ca）*

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/a-web-application-firewall-for-nginx/

作者：[Roman Gherta][a]
选题：[lujun9972][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/romangherta/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/11/waf-nginx-816x345.jpg
[2]: https://unsplash.com/@neonbrand?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
[3]: https://unsplash.com/photos/red-bricks-wall-XEsx2NVpqWY?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
[4]: https://unsplash.com/@cullansmith?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
[5]: https://unsplash.com/photos/red-fire-digital-wallpaper-BdTtvBRhOng?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash
[6]: https://osi-model.com/
[7]: https://en.wikipedia.org/wiki/Intrusion_detection_system
[8]: https://github.com/SpiderLabs/ModSecurity
[9]: https://github.com/SpiderLabs/ModSecurity-nginx
[10]: https://github.com/coreruleset/coreruleset/tree/v3.3.5/rules
[11]: https://github.com/coreruleset/coreruleset/blob/v3.3.5/INSTALL
[12]: https://github.com/SpiderLabs/ModSecurity/wiki/Reference-Manual-(v3.x)
[0]: https://img.linux.net.cn/data/attachment/album/202312/16/092516o1kqhzphvhh4h1hl.jpg
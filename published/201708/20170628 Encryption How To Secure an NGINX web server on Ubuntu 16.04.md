如何保护 Ubuntu 16.04 上的 NGINX Web 服务器
============================================================

![Let's Encrypt Encryption CA](https://www.unixmen.com/wp-content/uploads/2017/06/le-logo-standard.png "le-logo-standard")

### 什么是 Let’s Encrypt

[Let’s Encrypt][3] 是互联网安全研究组织 （ISRG） 提供的免费证书认证机构。它提供了一种轻松自动的方式来获取免费的 SSL/TLS 证书 - 这是在 Web 服务器上启用加密和 HTTPS 流量的必要步骤。获取和安装证书的大多数步骤可以通过使用名为 [Certbot][4] 的工具进行自动化。

特别地，该软件可在可以使用 shell 的服务器上使用：换句话说，它可以通过 SSH 连接使用。

在本教程中，我们将看到如何使用 `certbot` 获取免费的 SSL 证书，并在 Ubuntu 16.04 服务器上使用 Nginx。

### 安装 Certbot

第一步是安装 `certbot`，该软件客户端可以几乎自动化所有的过程。 Certbot 开发人员维护自己的 Ubuntu 仓库，其中包含比 Ubuntu 仓库中存在的软件更新的软件。

添加 Certbot 仓库：

```
# add-apt-repository ppa:certbot/certbot
```

接下来，更新 APT 源列表：

```
# apt-get update
```

此时，可以使用以下 `apt` 命令安装 `certbot`：

```
# apt-get install certbot
```

Certbot 现已安装并可使用。

### 获得证书

有各种 Certbot 插件可用于获取 SSL 证书。这些插件有助于获取证书，而证书的安装和 Web 服务器配置都留给管理员。

我们使用一个名为 **Webroot** 的插件来获取 SSL 证书。

在有能力修改正在提供的内容的情况下，建议使用此插件。在证书颁发过程中不需要停止 Web 服务器。

#### 配置 NGINX

Webroot 会在 Web 根目录下的 `.well-known` 目录中为每个域创建一个临时文件。在我们的例子中，Web 根目录是 `/var/www/html`。确保该目录在 Let’s Encrypt 验证时可访问。为此，请编辑 NGINX 配置。使用文本编辑器打开 `/etc/nginx/sites-available/default`：

```
# $EDITOR /etc/nginx/sites-available/default
```

在该文件中，在 `server` 块内，输入以下内容：

```
 location ~ /.well-known {
    allow all;
 }
```

保存，退出并检查 NGINX 配置：

```
# nginx -t
```

没有错误的话应该会显示如下：

```
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
```

重启 NGINX：

```
# systemctl restart nginx
```

#### 使用 Certbot 获取证书

下一步是使用 Certbot 的 Webroot 插件获取新证书。在本教程中，我们将保护示例域 www.example.com。需要指定应由证书保护的每个域。执行以下命令：

```
# certbot certonly --webroot --webroot-path=/var/www/html -d www.example.com
```

在此过程中，Cerbot 将询问有效的电子邮件地址，用于进行通知。还会要求与 EFF 分享，但这不是必需的。在同意服务条款之后，它将获得一个新的证书。

最后，目录 `/etc/letsencrypt/archive` 将包含以下文件：

*   `chain.pem`：Let’s Encrypt 加密链证书。
*   `cert.pem`：域名证书。
*   `fullchain.pem`：`cert.pem`和 `chain.pem` 的组合。
*   `privkey.pem`：证书的私钥。

Certbot 还将创建符号链接到 `/etc/letsencrypt/live/domain_name/` 中的最新证书文件。这是我们将在服务器配置中使用的路径。

### 在 NGINX 上配置 SSL/TLS

下一步是服务器配置。在 `/etc/nginx/snippets/` 中创建一个新的代码段。 **snippet** 是指一段配置，可以包含在虚拟主机配置文件中。如下创建一个新的文件：

```
# $EDITOR /etc/nginx/snippets/secure-example.conf
```

该文件的内容将指定证书和密钥位置。粘贴以下内容：

```
ssl_certificate /etc/letsencrypt/live/domain_name/fullchain.pem;
ssl_certificate_key /etc/letsencrypt/live/domain_name/privkey.pem;
```

在我们的例子中，`domain_name` 是 `example.com`。

#### 编辑 NGINX 配置

编辑默认虚拟主机文件：

```
# $EDITOR /etc/nginx/sites-available/default
```

如下：

```
server {
 listen 80 default_server;
 listen [::]:80 default_server;
 server_name www.example.com
 return 301 https://$server_name$request_uri;

 # SSL configuration
 #
 listen 443 ssl default_server;
 listen [::]:443 ssl default_server;
 include snippets/secure-example.conf
 #
 # Note: You should disable gzip for SSL traffic.
 # See: https://bugs.debian.org/773332
...
```

这将启用 NGINX 加密功能。

保存、退出并检查 NGINX 配置文件：

```
# nginx -t

nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
```

重启 NGINX：

```
# systemctl restart nginx
```

### 总结

按照上述步骤，此时我们已经拥有了一个安全的基于 NGINX 的 Web 服务器，它由 Certbot 和 Let’s Encrypt 提供加密。这只是一个基本配置，当然你可以使用许多 NGINX 配置参数来个性化所有东西，但这取决于特定的 Web 服务器要求。

--------------------------------------------------------------------------------

via: https://www.unixmen.com/encryption-secure-nginx-web-server-ubuntu-16-04/

作者：[Giuseppe Molica][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.unixmen.com/author/tutan/
[1]:https://www.unixmen.com/author/tutan/
[2]:https://www.unixmen.com/wp-content/uploads/2017/06/le-logo-standard.png
[3]:https://letsencrypt.org/
[4]:https://certbot.eff.org/

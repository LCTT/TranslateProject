[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Make SSL certs easy with k3s)
[#]: via: (https://opensource.com/article/20/3/ssl-letsencrypt-k3s)
[#]: author: (Lee Carpenter https://opensource.com/users/carpie)

用 k3s 轻松管理 SSL 证书
======

> 如何在树莓派上使用 k3s 和 Let's Encrypt 来加密你的网站。

![Files in a folder][1]

在[上一篇文章][2]中，我们在 k3s 集群上部署了几个简单的网站。那些是未加密的网站。很好，它们可以工作，但是未加密的网站有点太过时了！如今，大多数网站都是加密的。在本文中，我们将安装 [cert-manager][3] 并将其用于在集群上以部署采用 TLS 加密的网站。这些网站不仅会被加密，而且还会使用有效的公共证书，这些证书会从 [Let's Encrypt][4] 自动获取和更新！让我们开始吧！

### 所需材料

要继续阅读本文，你将需要我们在上一篇文章中构建的 [k3s 树莓派集群][5]。另外，你需要拥有一个公用静态 IP 地址，并有一个可以为其创建 DNS 记录的域名。如果你有一个动态 DNS 提供程序为你提供域名，可能也行。但是，在本文中，我们将使用静态 IP 和 [CloudFlare][6] 来手动创建 DNS 的 A 记录。

我们在本文中创建配置文件时，如果你不想键入它们，则可以在[此处][7]进行下载。

### 我们为什么使用 cert-manager？

Traefik（预先捆绑了 k3s）实际上具有内置的 Let's Encrypt 支持，因此你可能想知道为什么我们要安装第三方软件包来做同样的事情。在撰写本文时，Traefik 中的 Let's Encrypt 支持检索证书并将其存储在文件中。cert-manager 会检索证书并将其存储在 Kubernetes 的 “<ruby>机密信息<rt>secrets</rt></ruby>” 中。我认为，“机密信息”可以简单地按名称引用，因此更易于使用。这就是我们在本文中使用 cert-manager 的主要原因。

### 安装 cert-manager

通常，我们只是遵循 cert-manager 的[文档][8]在 Kubernetes 上进行安装。但是，由于我们使用的是 ARM 体系结构，因此我们需要进行一些更改，以便我们可以完成这个操作。

第一步是创建 cert-manager 命名空间。命名空间有助于将 cert-manager 的<ruby>吊舱<rt>Pod</rt></ruby>排除在我们的默认命名空间之外，因此当我们使用自己的“吊舱”执行 `kubectl get pods` 之类的操作时，我们不必看到它们。创建名称空间很简单：

```
kubectl create namespace cert-manager
```

这份安装说明会告诉你下载 cert-manager 的 YAML 配置文件并将其一步全部应用到你的集群。我们需要将其分为两个步骤，以便为基于 ARM 的树莓派修改文件。我们将下载文件并一步一步进行转换：

```
curl -sL \
https://github.com/jetstack/cert-manager/releases/download/v0.11.0/cert-manager.yaml |\
sed -r 's/(image:.*):(v.*)$/\1-arm:\2/g' > cert-manager-arm.yaml
```

这会下载配置文件，并将所有包含的 docker 镜像更新为 ARM 版本。来检查一下它做了什么：


```
$ grep image: cert-manager-arm.yaml
          image: "quay.io/jetstack/cert-manager-cainjector-arm:v0.11.0"
          image: "quay.io/jetstack/cert-manager-controller-arm:v0.11.0"
          image: "quay.io/jetstack/cert-manager-webhook-arm:v0.11.0"
```

如我们所见，三个镜像现在在镜像名称上添加了  `-arm`。现在我们有了正确的文件，我们只需将其应用于集群：

```
kubectl apply -f cert-manager-arm.yaml
```

这将安装所有的 cert-manager。我们可以通过 `kubectl --namespace cert-manager get pods` 来检查安装何时完成，直到所有“吊舱”都处于 `Running` 状态。

这实际上就完成了 cert-manager 的安装！

### Let's Encrypt 概述

Let's Encrypt 的好处是，它们免费为我们提供了经过公共验证的 TLS 证书！这意味着我们可以拥有一个完全有效的、可供任何人访问的 TLS 加密网站，这些家庭或业余的爱好活动挣不到钱，也无需自己掏腰包购买 TLS 证书！以及，当通过 cert-manager 使用 Let's Encrypt 的证书时，获得证书的整个过程是自动化的，证书的续订也是自动的！

但它是如何工作的？下面是该过程的简化说明。我们（或代表我们的 cert-manager）向 Let's Encrypt 发出我们拥有的域名的证书请求。Let's Encrypt 通过使用 ACME DNS 或 HTTP 验证机制来验证我们是否拥有该域。如果验证成功，则 Let's Encrypt 将向我们提供证书，这些证书将由 cert-manager 安装在我们的网站（或其他 TLS 加密的终结点）中。在需要重复此过程之前，这些证书可以使用 90 天。但是，cert-manager 会自动为我们更新证书。
 
在本文中，我们将使用 HTTP 验证方法，因为它更易于设置并且适用于大多数情况。以下是幕后将发生的基本过程。cert-manager 将向 Let's Encrypt 发出证书请求。作为回应，Let's Encrypt 将发出所有权验证的<ruby>质询<rt>challenges</rt></ruby>。这个质询是将一个 HTTP 资源放在请求证书的域名下的一个特定 URL 上。从理论上讲，如果我们可以将该资源放在该 URL 上，并且让 Let's Encrypt 可以远程获取它，那么我们实际上必须是该域的所有者。否则，要么我们无法将资源放置在正确的位置，要么我们无法操纵 DNS 以使 Let's Encrypt 访问它。在这种情况下，cert-manager 会将资源放在正确的位置，并自动创建一个临时的 `Ingress` 记录，以将流量路由到正确的位置。如果 Let's Encrypt 可以读到该质询要求的资源并正确无误，它将把证书发回给 cert-manager。然后，cert-manager 将证书存储为“机密信息”，然后我们的网站（或其他任何网站）将使用这些证书通过 TLS 保护我们的流量。

### 为该质询设置网络

我假设你要在家庭网络上进行设置，并拥有一个以某种方式连接到更广泛的互联网的路由器/接入点。如果不是这种情况，则可能不需要以下过程。

为了使质询过程正常运行，我们需要一个我们要申请证书的域名，以将其路由到端口 80 上的 k3s 集群。为此，我们需要告诉世界上的 DNS 系统它的位置。因此，我们需要将域名映射到我们的公共 IP 地址。如果你不知道你的公共 IP 地址是什么，可以访问 [WhatsMyIP][9] 之类的地方，它会告诉你。接下来，我们需要输入 DNS 的 A 记录，该记录将我们的域名映射到我们的公共 IP 地址。为了使此功能可靠地工作，你需要一个静态的公共 IP 地址，或者你可以使用动态 DNS 提供商。一些动态 DNS 提供商会向你颁发一个域名，你可以按照以下说明使用它。我没有尝试过，所以不能肯定地说它适用于所有提供商。

对于本文，我们将假设有一个静态公共 IP 并使用 CloudFlare 来设置 DNS 的 A 记录。如果愿意，可以使用自己的 DNS 提供程序。重要的是你可以设置 A 记录。

在本文的其余部分中，我将使用  [k3s.carpie.net][10] 作为示例域，因为这是我拥有的域。你显然会用自己拥有的任何域替换它。

为示例起见，假设我们的公共 IP 地址是 198.51.100.42。我们将转到我们的 DNS 提供商的 DNS 记录部分，并添加一个名为 [k3s.carpie.net][10] 的类型为 `A` 的记录（CloudFlare 已经假定了域的部分，因此我们只需输入 `k3s`），然后输入 `198.51.100.42` 作为 IPv4 地址。

![][11]

请注意，有时 DNS 更新要传播一段时间。你可能需要几个小时才能解析该名称。在继续之前该名称必须可以解析。否则，我们所有的证书请求都将失败。

我们可以使用 `dig` 命令检查名称是否解析：

```
$ dig +short k3s.carpie.net
198.51.100.42
```

继续运行以上命令，直到可以返回 IP 才行。关于 CloudFlare 有个小注释：ClouldFlare 提供了通过代理流量来隐藏你的实际 IP 的服务。在这种情况下，我们取回的是 CloudFlare 的 IP，而不是我们的 IP。 但对于我们的目的，这应该可以正常工作。

网络配置的最后一步是配置路由器，以将端口 80 和 443 上的传入流量路由到我们的 k3s 集群。可悲的是，路由器配置页面的差异很大，因此我无法确切地说明你的外观是什么样子。大多数时候，我们需要的管理页面位于“端口转发”或类似内容下。我甚至看到过它列在“游戏”之下（显然是端口转发主要用于的游戏）！让我们看看我的路由器的配置如何。

![][12]

如果你和我的设置一样，则转到 192.168.0.1 登录到路由器管理应用程序。对于此路由器，它位于 “ NAT / QoS” -> “端口转发”。在这里，我们将端口 80/TCP 协议设置为转发到 192.168.0.50（主节点 `kmaster` 的 IP）的端口 80。我们还将端口 443 设置为也映射到 `kmaster`。从技术上讲，这对于质询来说并不是必需的，但是在本文的结尾，我们将部署一个启用 TLS 的网站，并且需要映射 443 来进行访问。因此，现在进行映射很方便。我们保存并应用更改，应该一切顺利！

### Configuring cert-manager to use Lets Encrypt (staging)

Now we need to configure cert-manager to issue certificates through Let's Encrypt. Let's Encrypt provides a staging (e.g., test) environment for us to sort out our configurations on. It is much more tolerant of mistakes and frequency of requests. If we bumble around on the production environment, we'll very quickly find ourselves temporarily banned! As such, we'll manually test requests using the staging environment.

Create a file, `letsencrypt-issuer-staging.yaml` with the contents:


```
apiVersion: cert-manager.io/v1alpha2
kind: ClusterIssuer
metadata:
  name: letsencrypt-staging
spec:
  acme:
   # The ACME server URL
    server: <https://acme-staging-v02.api.letsencrypt.org/directory>
    # Email address used for ACME registration
    email: &lt;your_email&gt;@example.com
    # Name of a secret used to store the ACME account private key
    privateKeySecretRef:
      name: letsencrypt-staging
    # Enable the HTTP-01 challenge provider
    solvers:
    - http01:
        ingress:
          class: traefik
```

Make sure to update the email address to your address. This is how Let's Encrypt contacts us if something is wrong or we are doing bad things!

Now we create the issuer with:


```
`kubectl apply -f letsencrypt-issuer-staging.yaml`
```

We can check that the issuer was created successfully with:


```
`kubectl get clusterissuers`
```

`Clusterissuers` is a new Kubernetes resource type created by cert-manager.

Let's now request a test certificate manually. For our sites, we will not need to do this; we are just testing out the process to make sure our configuration is correct.

Create a certificate request file, `le-test-certificate.yaml` with the contents:


```
apiVersion: cert-manager.io/v1alpha2
kind: Certificate
metadata:
  name: k3s-carpie-net
  namespace: default
spec:
  secretName: k3s-carpie-net-tls
  issuerRef:
    name: letsencrypt-staging
    kind: ClusterIssuer
  commonName: k3s.carpie.net
  dnsNames:
 - k3s.carpie.net
```

This record just says we want to request a certificate for the domain `[k3s.carpie.net][10]`, using a `ClusterIssuer` named `letsencrypt-staging` (which we created in the previous step) and store the certificate files in the Kubernetes secret named `k3s-carpie-net-tls`.

Apply it like normal:


```
`kubectl apply -f le-test-certificate.yaml`
```

We can check the status with:


```
`kubectl get certificates`
```

If we see something like:


```
NAME                    READY   SECRET                  AGE
k3s-carpie-net          True    k3s-carpie-net-tls      30s
```

We are good to go! (The key here is `READY` being `True`).

### Troubleshooting certificate request issues

That's the happy path. If `READY` is `False`, we could give it some time and check the status again in case it takes a bit. If it stays `False,` then we have an issue we need to troubleshoot. At this point, we can walk the chain of Kubernetes resources until we find a status message that tells us the problem.

Let's say that we did the request above, and `READY` was `False`. We start the troubleshooting with:


```
`kubectl describe certificates k3s-carpie-net`
```

This will return a lot of information. Usually, the helpful things are in the `Events:` section, which is typically at the bottom. Let's say the last event was `Created new CertificateRequest resource "k3s-carpie-net-1256631848`. We would then describe that request:


```
`kubectl describe certificaterequest k3s-carpie-net-1256631848`
```

Now let's say the last event there was `Waiting on certificate issuance from order default/k3s-carpie-net-1256631848-2342473830`.

Ok, we can describe the order:


```
`kubectl describe orders default/k3s-carpie-net-1256631848-2342473830`
```

Let's say that has an event that says `Created Challenge resource "k3s-carpie-net-1256631848-2342473830-1892150396" for domain "[k3s.carpie.net][10]"`. Let's describe the challenge:


```
`kubectl describe challenges k3s-carpie-net-1256631848-2342473830-1892150396`
```

The last event returned from here is `Presented challenge using http-01 challenge mechanism`. That looks ok, so we scan up the describe output and see a message `Waiting for http-01 challenge propagation: failed to perform self check GET request … no such host`. Finally! We have found the problem! In this case, `no such host` means that the DNS lookup failed, so then we would go back and manually check our DNS settings and that our domain's DNS resolves correctly for us and make any changes needed.

### Clean up our test certificates

We actually want a real certificate for the domain name we used, so let's go ahead and clean up both the certificate and the secret we just created:


```
kubectl delete certificates k3s-carpie-net
kubectl delete secrets k3s-carpie-net-tls
```

### Configuring cert-manager to use Let's Encrypt (production)

Now that we have test certificates working, it's time to move up to production. Just like we configured cert-manager for Let's Encrypt staging environment, we need to do the same for production now. Create a file (you can copy and modify staging if desired) named `letsencrypt-issuer-production.yaml` with the contents:


```
apiVersion: cert-manager.io/v1alpha2
kind: ClusterIssuer
metadata:
name: letsencrypt-prod
spec:
acme:
 # The ACME server URL
  server: <https://acme-v02.api.letsencrypt.org/directory>
  # Email address used for ACME registration
  email: &lt;your_email&gt;@example.com
  # Name of a secret used to store the ACME account private key
  privateKeySecretRef:
    name: letsencrypt-prod
  # Enable the HTTP-01 challenge provider
  solvers:
  - http01:
      ingress:
        class: traefik
```

(If you are copying from the staging, the only that changes is the `server:` URL. Don't forget the email)!

Apply with:


```
`kubectl apply -f letsencrypt-issuer-production.yaml`
```

### Request a certificate for our website

It's important to note that all the steps we have completed to this point are one time set up! For any additional requests in the future, we can start at this point in the instructions!

Let's deploy that same site we deployed in the [previous article][13]. (If you still have it around, you can just modify the YAML file. If not, you may want to recreate it and re-deploy it).

We just need to modify `mysite .yaml's` `Ingress` section to be:


```
\---
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: mysite-nginx-ingress
  annotations:
    kubernetes.io/ingress.class: "traefik"
    cert-manager.io/cluster-issuer: letsencrypt-prod
spec:
  rules:
  - host: k3s.carpie.net
    http:
      paths:
      - path: /
        backend:
          serviceName: mysite-nginx-service
          servicePort: 80
  tls:
  - hosts:
   - k3s.carpie.net
    secretName: k3s-carpie-net-tls
```

Please note that just the `Ingress` section of `mysite.yaml` is shown above. The changes are the addition of the `annotation [cert-manager.io/cluster-issuer][14]: letsencrypt-prod`. This tells traefik which issuer to use when creating certificates. The only other addition is the `tls:` block. This tells traefik that we expect to have TLS on host `[k3s.carpie.net][10],` and we expect the TLS certificate files to be stored in the secret `k3s-carpie-net-tls`.

Please remember that we did not create these certificates! (Well, we created test certificates similarly named, but we deleted those.) Traefik will read this and go looking for the secret. When it does not find it, it sees the annotation saying we want to use `letsencrypt-prod` issuer to procure one. From there, it will make the request and install the certificate in the secret for us!

We're done! Let's try it out.

There it is in all its encrypted TLS beauty! Congratulations!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/ssl-letsencrypt-k3s

作者：[Lee Carpenter][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/carpie
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/files_documents_paper_folder.png?itok=eIJWac15 (Files in a folder)
[2]: https://carpie.net/articles/ingressing-with-k3s
[3]: https://cert-manager.io/
[4]: https://letsencrypt.org/
[5]: https://opensource.com/article/20/3/kubernetes-raspberry-pi-k3s
[6]: https://cloudflare.com/
[7]: https://gitlab.com/carpie/k3s_using_certmanager/-/archive/master/k3s_using_certmanager-master.zip
[8]: https://cert-manager.io/docs/installation/kubernetes/
[9]: https://whatsmyip.org/
[10]: http://k3s.carpie.net
[11]: https://opensource.com/sites/default/files/uploads/ep011_dns_example.png
[12]: https://opensource.com/sites/default/files/uploads/ep011_router.png
[13]: https://carpie.net/articles/ingressing-with-k3s#deploying-a-simple-website
[14]: http://cert-manager.io/cluster-issuer

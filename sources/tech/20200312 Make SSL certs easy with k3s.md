[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Make SSL certs easy with k3s)
[#]: via: (https://opensource.com/article/20/3/ssl-letsencrypt-k3s)
[#]: author: (Lee Carpenter https://opensource.com/users/carpie)

Make SSL certs easy with k3s
======
How to encrypt your website with k3s and Letsencrypt on a Raspberry Pi.
![Files in a folder][1]

In a [previous article][2], we deployed a couple of simple websites on our k3s cluster. There were non-encrypted sites. Now that's fine, and they work, but non-encrypted is very last century! These days most websites are encrypted. In this article, we are going to install [cert-manager][3] and use it to deploy TLS encrypted sites on our cluster. Not only will the sites be encrypted, but they will be using valid public certificates that are automatically provisioned and automatically renewed from [Let's][4] [Encrypt][4]! Let's get started!

### Materials needed

To follow along with the article, you will need [the k3s Raspberry Pi cluster][5] we built in a previous article. Also, you will need a public static IP address and a domain name that you own and can create DNS records for. If you have a dynamic DNS provider that provides a domain name for you, that may work as well. However, in this article, we will be using a static IP and [CloudFlare][6] to manually create DNS "A" records.

As we create configuration files in this article, if you don't want to type them out, they are all available for download [here][7].

### Why are we using cert-manager?

Traefik (which comes pre-bundled with k3s) actually has Let's Encrypt support built-in, so you may be wondering why we are installing a third-party package to do the same thing. At the time of this writing, Traefik's Let's Encrypt support retrieves certificates and stores them in files. Cert-manager retrieves certificates and stores them in Kubernetes **secrets**. **Secrets** can be simply referenced by name and, therefore, easier to use, in my opinion. That is the main reason we are going to use cert-manager in this article.

### Installing cert-manager

Mostly we will simply follow the cert-manager [documentation][8] for installing on Kubernetes. Since we are working with an ARM architecture, however, we will be making slight changes, so we will go through the procedure here.

The first step is to create the cert-manager namespace. The namespace helps keep cert-manager's pods out of our default namespace, so we do not have to see them when we do things like **kubectl get pods** with our own pods. Creating the namespace is simple:


```
kubectl create namespace cert-manager
```

The installation instructions have you download the cert-manager YAML configuration file and apply it to your cluster all in one step. We need to break that into two steps in order to modify the file for our ARM-based Pis. We will download the file and do the conversion in one step:


```
curl -sL \
<https://github.com/jetstack/cert-manager/releases/download/v0.11.0/cert-manager.yaml> |\
sed -r 's/(image:.*):(v.*)$/\1-arm:\2/g' &gt; cert-manager-arm.yaml
```

This downloads the configuration file and updates all the contained docker images to be the ARM versions. To check what it did:


```
$ grep image: cert-manager-arm.yaml
          image: "quay.io/jetstack/cert-manager-cainjector-arm:v0.11.0"
          image: "quay.io/jetstack/cert-manager-controller-arm:v0.11.0"
          image: "quay.io/jetstack/cert-manager-webhook-arm:v0.11.0"
```

As we can see, the three images now have **-arm** added to the image name. Now that we have the correct file, we simply apply it to our cluster:


```
`kubectl apply -f cert-manager-arm.yaml`
```

This will install all of cert-manager. We can know when the installation finished by checking with **kubectl --namespace cert-manager get pods** until all pods are in the **Running** state.

That is actually it for cert-manager installation!

### A quick overview of Let's Encrypt

The nice thing about Let's Encrypt is that they provide us with publicly validated TLS certificates for free! This means that we can have a completely valid TLS encrypted website that anyone can visit for our home or hobby things that do not make money to support themselves without paying out of our own pocket for TLS certificates! Also, when using Let's Encrypt certificates with cert-manager, the entire process of procuring the certificates is automated. Certificate renewal is also automated!

But how does this work? Here is a simplified explanation of the process. We (or cert-manager on our behalf) issue a request for a certificate to Let's Encrypt for a domain name that we own. Let's Encrypt verifies that we own that domain by using an ACME DNS or HTTP validation mechanism. If the verification is successful, Let's Encrypt provides us with certificates, which cert-manager installs in our website (or other TLS encrypted endpoint). These certificates are good for 90 days before the process needs to be repeated. Cert-manager, however, will automatically keep the certificates up-to-date for us.

In this article, we will use the HTTP validation method as it is simpler to set up and works for the majority of use cases. Here is the basic process that will happen behind the scenes. Cert-manager will issue a certificate request to Let's Encrypt. Let's Encrypt will issue an ownership verification challenge in response. The challenge will be to put an HTTP resource at a specific URL under the domain name that the certificate is being requested for. The theory is that if we can put that resource at that URL and Let's Encrypt can retrieve it remotely, then we must really be the owners of the domain. Otherwise, either we could not have placed the resource in the correct place, or we could not have manipulated DNS to allow Let's Encrypt to get to it. In this case, cert-manager puts the resource in the right place and automatically creates a temporary **Ingress** record that will route traffic to the correct place. If Let's Encrypt can read the challenge and it is correct, it will issue the certificates back to cert-manager. Cert-manager will then store the certificates as secrets, and our website (or whatever) will use those certificates for securing our traffic with TLS.

### Preparing our network for the challenges

I'm assuming that you are wanting to set this up on your home network and have a router/access point that is connected in some fashion to the broader internet. If that is not the case, the following process may not be what you need.

To make the challenge process work, we need the domain that we are requesting a certificate for to route to our k3s cluster on port 80. To do that, we need to tell the world's DNS system where that is. So, we'll need to map the domain name to our public IP address. If you do not know what your public IP address is, you can go to somewhere like [WhatsMyIP][9], and it will tell you. Next, we need to enter a DNS "A" record that maps our domain name to our public IP address. For this to work reliably, you need a static public IP address, or you may be able to use a dynamic DNS provider. Some dynamic DNS providers will issue you a domain name that you may be able to use with these instructions. I have not tried this, so I cannot say for sure it works with all providers.

For this article, we are going to assume a static public IP and use CloudFlare to set the DNS "A" records. You may use your own DNS provider if you wish. The important part is that you are able to set the "A" records.

For this rest of the article, I am going to use **[k3s.carpie.net][10]** as the example domain since this is a domain I own. You would obviously replace that with whatever domain you own.

Ok, for the sake of example, assume our public IP address is 198.51.100.42. We would go to our DNS provider's DNS record section and add a record of type "A," with a name of **[k3s.carpie.net][10]** (CloudFlare assumes the domain, so there we could just enter **k3s**) and enter 198.51.100.42 as the IPv4 address.

![][11]

Be aware that sometimes it takes a while for the DNS updates to propagate. It may be several hours before you can resolve the name. It is imperative that the name resolves before moving on. Otherwise, all our certificate requests will fail.

We can check that the name resolves using the **dig** command:


```
$ dig +short k3s.carpie.net
198.51.100.42
```

Keep running the above command until an IP is returned. Just a note about CloudFlare: ClouldFlare provides a service that hides your actual IP by proxying the traffic. In this case, we'll get back a CloudFlare IP instead of our IP. This should work fine for our purposes.

The final step for network configuration is configuring our router to route incoming traffic on ports 80 and 443 to our k3s cluster. Sadly, router configuration screens vary widely, so I can't tell you exactly what yours will look like. Most of the time, the admin page we need is under "Port forwarding" or something similar. I have even seen it listed under "Gaming" (which is apparently what port forwarding is mostly used for)! Let's see what the configuration looks like for my router.

![][12]

If you had my setup, you would go to 192.168.0.1 to log in to the router administration application. For this router, it's under **NAT / QoS** -&gt; **Port Forwarding**. Here we set port **80**, **TCP** protocol to forward to 192.168.0.50 (the IP of **kmaster** our master node) port **80**. We also set port **443** to map to **kmaster** as well. This is technically not needed for the challenges, but at the end of the article, we are going to deploy a TLS enabled website, and we will need **443** mapped to get to it. So it's convenient to go ahead and map it now. We save and apply the changes, and we should be good to go!

### Configuring cert-manager to use Lets Encrypt (staging)

Now we need to configure cert-manager to issue certificates through Let's Encrypt. Let's Encrypt provides a staging (e.g., test) environment for us to sort out our configurations on. It is much more tolerant of mistakes and frequency of requests. If we bumble around on the production environment, we'll very quickly find ourselves temporarily banned! As such, we'll manually test requests using the staging environment.

Create a file, **letsencrypt-issuer-staging.yaml** with the contents:


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

**Clusterissuers** is a new Kubernetes resource type created by cert-manager.

Let's now request a test certificate manually. For our sites, we will not need to do this; we are just testing out the process to make sure our configuration is correct.

Create a certificate request file, **le-test-certificate.yaml** with the contents:


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

This record just says we want to request a certificate for the domain **[k3s.carpie.net][10]**, using a **ClusterIssuer** named **letsencrypt-staging** (which we created in the previous step) and store the certificate files in the Kubernetes secret named **k3s-carpie-net-tls**.

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

We are good to go! (The key here is **READY** being **True**).

### Troubleshooting certificate request issues

That's the happy path. If **READY** is **False**, we could give it some time and check the status again in case it takes a bit. If it stays **False,** then we have an issue we need to troubleshoot. At this point, we can walk the chain of Kubernetes resources until we find a status message that tells us the problem.

Let's say that we did the request above, and **READY** was **False**. We start the troubleshooting with:


```
`kubectl describe certificates k3s-carpie-net`
```

This will return a lot of information. Usually, the helpful things are in the **Events:** section, which is typically at the bottom. Let's say the last event was **Created new CertificateRequest resource "k3s-carpie-net-1256631848**. We would then describe that request:


```
`kubectl describe certificaterequest k3s-carpie-net-1256631848`
```

Now let's say the last event there was **Waiting on certificate issuance from order default/k3s-carpie-net-1256631848-2342473830**.

Ok, we can describe the order:


```
`kubectl describe orders default/k3s-carpie-net-1256631848-2342473830`
```

Let's say that has an event that says **Created Challenge resource "k3s-carpie-net-1256631848-2342473830-1892150396" for domain "[k3s.carpie.net][10]"**. Let's describe the challenge:


```
`kubectl describe challenges k3s-carpie-net-1256631848-2342473830-1892150396`
```

The last event returned from here is **Presented challenge using http-01 challenge mechanism**. That looks ok, so we scan up the describe output and see a message **Waiting for http-01 challenge propagation: failed to perform self check GET request … no such host**. Finally! We have found the problem! In this case, **no such host** means that the DNS lookup failed, so then we would go back and manually check our DNS settings and that our domain's DNS resolves correctly for us and make any changes needed.

### Clean up our test certificates

We actually want a real certificate for the domain name we used, so let's go ahead and clean up both the certificate and the secret we just created:


```
kubectl delete certificates k3s-carpie-net
kubectl delete secrets k3s-carpie-net-tls
```

### Configuring cert-manager to use Let's Encrypt (production)

Now that we have test certificates working, it's time to move up to production. Just like we configured cert-manager for Let's Encrypt staging environment, we need to do the same for production now. Create a file (you can copy and modify staging if desired) named **letsencrypt-issuer-production.yaml** with the contents:


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

(If you are copying from the staging, the only that changes is the **server:** URL. Don't forget the email)!

Apply with:


```
`kubectl apply -f letsencrypt-issuer-production.yaml`
```

### Request a certificate for our website

It's important to note that all the steps we have completed to this point are one time set up! For any additional requests in the future, we can start at this point in the instructions!

Let's deploy that same site we deployed in the [previous article][13]. (If you still have it around, you can just modify the YAML file. If not, you may want to recreate it and re-deploy it).

We just need to modify **mysite .yaml's** **Ingress** section to be:


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

Please note that just the **Ingress** section of **mysite.yaml** is shown above. The changes are the addition of the **annotation [cert-manager.io/cluster-issuer][14]: letsencrypt-prod**. This tells traefik which issuer to use when creating certificates. The only other addition is the **tls:** block. This tells traefik that we expect to have TLS on host **[k3s.carpie.net][10],** and we expect the TLS certificate files to be stored in the secret **k3s-carpie-net-tls**.

Please remember that we did not create these certificates! (Well, we created test certificates similarly named, but we deleted those.) Traefik will read this and go looking for the secret. When it does not find it, it sees the annotation saying we want to use **letsencrypt-prod** issuer to procure one. From there, it will make the request and install the certificate in the secret for us!

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

[#]: subject: "Sign and verify container images with this open source tool"
[#]: via: "https://opensource.com/article/21/12/sigstore-container-images"
[#]: author: "Muhammad Aizuddin Zali https://opensource.com/users/aizuddin85"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Sign and verify container images with this open source tool
======
The sigstore project aims at securing supply chain technology.
![Parts, modules, containers for software][1]

Many open source software projects get used in software builds every day, which is critical for almost every organization. Open source software brings many benefits and helps software developers focus on innovation and efficiency rather than reinventing the wheel.

Sometimes, you cannot identify and verify the integrity of the third-party software used by constantly doing verification, which can open the door to supply chain attacks. Hence, the [sigstore][2] project was born. The sigstore project aims at securing supply chain technology and eventually the open source software security itself.

The sigstore project consists of several open source components under its umbrella: 

  * [Fulcio][3] (Root CA for Code Signing)
  * [Rekor][4] (Immutable tamper-resistant ledger for record signed metadata)
  * [Cosign][5] (Container signing, verification, and storage in OCI compliant registry)



In this article, I look at the `cosign` part from the project and how you can use it to sign and verify container images (and other supported objects). The philosophy of `cosign` is to make the signing and verifying process an [immutable infrastructure][6] to the developers.

### Install and build cosign

In this example, I am going to install `cosign` on a macOS-based system. First, ensure the system has Docker installed and running as well for managing container images.

Using brew, I install `cosign`.


```


$ brew install sigstore/tap/cosign

==&gt; Installing sigstore/tap/cosign
🍺  /usr/local/Cellar/cosign/1.3.1: 3 files, 82.5MB, built in 2 seconds

```

Next, I make sure I am logged in to the target registry, in this example to docker.io.


```


$ docker login docker.io

Login Succeeded

```

### Sign and verify container images

Before I can sign and verify any images, I need to generate a public and private key pair. I then use this private key to sign the object and later verify it using the corresponding public key. I should also use a strong password to protect the key pair. Ideally, this password gets stored in the vault for security and audit purposes.


```


$ cosign generate-key-pair
Enter password for private key:
Enter again:
Private key written to cosign.key
Public key written to cosign.pub

```

Since I now have the required key to start signing, I sign our test image that I previously pushed into the registry. 


```


$ cosign sign --key cosign.key docker.io/mzali/test:latest
Enter password for private key:

```

Using the `triangulate` option, I can locate the cosign image reference from the registry.


```


$ cosign triangulate docker.io/mzali/test:latest
index.docker.io/mzali/test:sha256-25ca0d9c2f4e70ce3bfba7891065dfef09760d2cbace7a2d21fb13c569902133.sig

```

Now, this is the part where I want to verify the image against the public key and verify the signature's authenticity. Using the public key, I can verify the image signing key signature.


```


$ cosign verify --key cosign.pub docker.io/mzali/test:latest

Verification for index.docker.io/mzali/test:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - The signatures were verified against the specified public key
  - Any certificates were verified against the Fulcio roots.

[{"critical":{"identity":{"docker-reference":"index.docker.io/mzali/test"},"image":{"docker-manifest-digest":"sha256:25ca0d9c2f4e70ce3bfba7891065dfef09760d2cbace7a2d21fb13c569902133"},"type":"cosign container image signature"},"optional":null}]

```

### Do the same for SBOM

Next, I want also to [sign the SBOMs][7]. In this example, I use `alpine:latest` image to show how you can do it.

The alpine container image already got pushed to the registry. I first need to generate the SBOM from the image, and I use the `syft` binary from the [syft project][8]. Since I'm testing on a macOS-based system, I am going to use brew to install it.


```


$ brew tap anchore/syft
$ brew install syft

```

I check to see what packages are inside the alpine container image in the registry using `syft`. 


```


$ syft packages mzali/alpine        
 ✔ Loaded image            
 ✔ Parsed image            
 ✔ Cataloged packages      [14 packages]

NAME                    VERSION      TYPE
alpine-baselayout       3.2.0-r16    apk  
alpine-keys             2.4-r0       apk  
apk-tools               2.12.7-r0    apk  
busybox                 1.33.1-r6    apk  
ca-certificates-bundle  20191127-r5  apk  
libc-utils              0.7.2-r3     apk  
libcrypto1.1            1.1.1l-r0    apk  
libretls                3.3.3p1-r2   apk  
libssl1.1               1.1.1l-r0    apk  
musl                    1.2.2-r3     apk  
musl-utils              1.2.2-r3     apk  
scanelf                 1.3.2-r0     apk  
ssl_client              1.33.1-r6    apk  
zlib                    1.2.11-r3    apk

```

Now I am about to sign this SBOM. I want the SBOM as [SPDX][9] 2.2 tag-value formatted (or another supported format, in this example, I choose SPDX format) and then attach it to the image.


```


$ syft packages mzali/alpine -o spdx  &gt; latest.spdx
 ✔ Loaded image            
 ✔ Parsed image            
 ✔ Cataloged packages      [14 packages]

$  ls -lrt latest.spdx
-rw-r--r--  1 yanked  yanked  10058 Nov 17 15:52 latest.spdx

$ cosign attach sbom --sbom latest.spdx mzali/alpine
Uploading SBOM file for [index.docker.io/mzali/alpine:latest] to [index.docker.io/mzali/alpine:sha256-5e604d3358ab7b6b734402ce2e19ddd822a354dc14843f34d36c603521dbb4f9.sbom] with mediaType [text/spdx].

```

Using the digest output from the above, I sign the SBOM in the registry and verify it.


```


$ cosign sign --key cosign.key docker.io/mzali/alpine:sha256-5e604d3358ab7b6b734402ce2e19ddd822a354dc14843f34d36c603521dbb4f9.sbom
Enter password for private key: %    

$ cosign verify --key cosign.pub docker.io/mzali/alpine:sha256-5e604d3358ab7b6b734402ce2e19ddd822a354dc14843f34d36c603521dbb4f9.sbom

Verification for index.docker.io/mzali/alpine:sha256-5e604d3358ab7b6b734402ce2e19ddd822a354dc14843f34d36c603521dbb4f9.sbom --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - The signatures were verified against the specified public key
  - Any certificates were verified against the Fulcio roots.

[{"critical":{"identity":{"docker-reference":"index.docker.io/mzali/alpine"},"image":{"docker-manifest-digest":"sha256:00a101b8d193c294e2c9b3099b42a7bc594b950fbf535d98304d4c61fad5491b"},"type":"cosign container image signature"},"optional":null}]

```

### What's next?

The simplest way to use `cosign` is to include this into your SDLC pipeline, as examples of Jenkins or Tekton tools. Using `cosign`, I can include it into the build process to sign and verify my software. If you are using Kubernetes, there is a Kubernetes [cosigned admission controller][10] that can look at your image signature and compare it against the specified public key. If the image is unsigned or uses an unknown key, the admission controller blocks it due to the violation:


```


$ kubectl apply -f unsigned-deployment.yaml
Error from server (BadRequest): error when creating "unsigned-deployment.yaml": admission webhook "cosigned.sigstore.dev" denied the request: validation failed: invalid image signature: spec.template.spec.containers[0].image

```

And again, `cosign` is just the tip of the iceberg from the whole sigstore project. These components are collaborative, integrate, and provide tampering resistance, strong verification points, and secure the software much easier using the same standard!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/sigstore-container-images

作者：[Muhammad Aizuddin Zali][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/aizuddin85
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/containers_modules_networking_hardware_parts.png?itok=rPpVj92- (Parts, modules, containers for software)
[2]: https://www.sigstore.dev/
[3]: https://github.com/sigstore/fulcio
[4]: https://github.com/sigstore/rekor
[5]: https://github.com/sigstore/cosign
[6]: https://www.redhat.com/files/summit/2015/12017_immutable-infrastructure-containers-the-future-of-microservices.pdf
[7]: https://docs.sigstore.dev/cosign/SBOM
[8]: https://github.com/anchore/syft
[9]: https://www.linuxfoundation.org/blog/spdx-its-already-in-use-for-global-software-bill-of-materials-sbom-and-supply-chain-security/
[10]: https://github.com/sigstore/helm-charts/tree/main/charts/cosigned
